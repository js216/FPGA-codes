`timescale 1ns / 1ps

/* ================================
 * Deserializer
 * Jakob Kastelic, 8/19/2019
 * ================================*/
 
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