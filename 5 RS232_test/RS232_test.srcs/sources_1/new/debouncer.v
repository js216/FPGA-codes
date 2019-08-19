`timescale 1ns / 1ps

// adapted from https://www.fpga4student.com/2017/04/simple-debouncing-verilog-code-for.html on 8/17/2019
module button_debouncer (
  input sysclk,
  input [1:0]btn,
  output [1:0]clean_btn
);

reg [5:0] counter = 0;
always @(posedge sysclk)
counter = counter + 1;
wire slow_clk = counter[5];

// debounce btn[0]
wire Q1,Q2,Q2_bar;
my_dff d1(slow_clk, btn[0],Q1 );
my_dff d2(slow_clk, Q1,Q2 );
assign Q2_bar = ~Q2;
assign clean_btn[0] = Q1 & Q2_bar;

// debounce btn[1]
wire Q1_1,Q2_1,Q2_bar_1;
my_dff d1_1(slow_clk, btn[1],Q1_1 );
my_dff d2_1(slow_clk, Q1_1,Q2_1 );
assign Q2_bar_1 = ~Q2_1;
assign clean_btn[1] = Q1_1 & Q2_bar_1;

endmodule

// D-flip-flop for debouncing module 
module my_dff(input DFF_CLOCK, D, output reg Q);
  always @ (posedge DFF_CLOCK)
    Q <= D;
endmodule