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
  input output_trigger, // negedge sensitive
  
  // control
  output reg Tx_active
);

wire [7:0] in [3:0];
assign in[0] = in0;
assign in[1] = in1;
assign in[2] = in2;
assign in[3] = in3;
reg [2:0] words_to_write = 0;

// for detecting negedge of output_trigger
reg old_output_trigger, Tx_start;

always @(posedge sysclk) begin
  // detect negedge of output_trigger
  if (~output_trigger && (old_output_trigger != output_trigger))
    Tx_start = 1;
  old_output_trigger = output_trigger;
  
  // beginning transmission
  if (~Tx_active && Tx_start) begin
      words_to_write = len;
      Tx_active = 1;
  end
  
  // clear Tx_start if already transmitting
  else if (Tx_active && Tx_start)
    Tx_start = 0;
  
  // just finished transmission
  else if (Tx_active && words_to_write == 0)
    Tx_active = 0;
    
  // clear serial_Tx_start if already writing to serial
  else if (serial_Tx_active && serial_Tx_start)
    serial_Tx_start = 0;

  // write to output
  else if (Tx_active && words_to_write>0 && ~serial_Tx_active && ~serial_Tx_start) begin
    TxD_data[7:0] = in[words_to_write-1][7:0];
    words_to_write = words_to_write - 1;
    serial_Tx_start = 1;
  end
end

endmodule
 
 
 
module deserializer(
  input sysclk,
  
  // serial input
  input input_trigger, // negedge sensitive
  input [7:0] data_in,

  // parallel output
  input clear_trigger, // posedge sensitive
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

// for detecting edges of input_trigger and clear_trigger
reg old_input_trigger, old_clear_trigger;
reg put_word, clear;

always @(posedge sysclk) begin
  // detect negedge of input_trigger
  if (~input_trigger && (old_input_trigger != input_trigger))
    put_word = 1;
  else
    put_word = 0;
  old_input_trigger = input_trigger;
  
  // detect posedge of clear_trigger
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