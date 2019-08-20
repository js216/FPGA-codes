`timescale 1ns / 1ps

/* ================================
 * Serializer/deserializer
 * Jakob Kastelic, 8/19/2019
 * ================================*/
 
module serializer(
  input sysclk,
  
  // serial data out
  output reg [7:0] TxD_data,
  input serial_Tx_active,
  output reg serial_Tx_start,
  
  // parallel data in
  input [7:0] in0,
  input [7:0] in1,
  input [7:0] in2,
  input [7:0] in3,
  input [2:0] len,
  input output_trigger,
  
  // control
  output reg Tx_active
);

reg [2:0] words_to_write = 0;

// for detecting posedge of output_trigger
reg old_output_trigger, do_output;

always @(posedge sysclk) begin
  // detect posedge of output_trigger
  if (output_trigger && (old_output_trigger != output_trigger))
    do_output = 1;
  old_output_trigger = output_trigger;
  
  // beginning transmission
  if (~Tx_active && do_output) begin
      words_to_write = len;
      Tx_active = 1;
      do_output = 0;
  end
  
  // just finished transmission
  else if (Tx_active && words_to_write == 0)
    Tx_active = 0;
    
  // clear serial_Tx_start if already writing
  else if (serial_Tx_active && serial_Tx_start)
    serial_Tx_start = 0;
  
  // write to output
  else if (Tx_active && words_to_write>0 && ~serial_Tx_active) begin
    case (words_to_write)
      1: begin
           TxD_data[7:0] = in0[7:0];
           serial_Tx_start = 1;
         end
      2: begin
           TxD_data[7:0] = in1[7:0];
           serial_Tx_start = 1;
           words_to_write = 1;
         end
      3: begin
           TxD_data[7:0] = in2[7:0];
           serial_Tx_start = 1;
           words_to_write = 2;
         end
      4: begin
           TxD_data[7:0] = in3[7:0];
           serial_Tx_start = 1;
           words_to_write = 3;
         end
    endcase
  end
end

endmodule
 
 
 
module deserializer(
  input sysclk,
  
  // serial input
  input input_trigger,
  input [7:0] data_in,

  // parallel output
  input clear_trigger,
  output reg [2:0] buff_len,
  output [7:0] out0,
  output [7:0] out1,
  output [7:0] out2
);

initial buff_len = 0;
reg [7:0] buffer [2:0];
assign out0 = buffer[0];
assign out1 = buffer[1];
assign out2 = buffer[2];

// for detecting posedge of input_trigger and clear_trigger
reg old_input_trigger, old_clear_trigger;
reg put_word, clear;

always @(posedge sysclk) begin
  // detect posedge of input_trigger
  if (input_trigger && (old_input_trigger != input_trigger))
    put_word = 1;
  else
    put_word = 0;
  old_input_trigger = input_trigger;
  
  // detect posedge of clear_triggerrigger
  if (clear_trigger && (old_clear_trigger != clear_trigger))
    clear = 1;
  else
    clear = 0;
  old_clear_trigger = clear_trigger;
  
  // put word into buffer
  if (put_word) begin
    buffer[buff_len] = data_in;
    buff_len = buff_len + 1;
  end
  
  // return word from buffer  
  if (clear) begin
    buffer[0] = 0;
    buffer[1] = 0;
    buffer[2] = 0;
    buff_len = 0;
  end
end

endmodule