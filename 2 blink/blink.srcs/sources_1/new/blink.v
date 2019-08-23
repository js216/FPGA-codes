`timescale 1ns / 1ps

module blink(
  input sysclk,
  output led
);

reg [22:0]counter;
assign led = counter[22];
always @(posedge sysclk)
  counter <= counter + 1;

endmodule
