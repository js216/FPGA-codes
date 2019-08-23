`timescale 1ns / 1ps

module basic_arithmetic(
    input sysclk,
    
    input [7:0]in1,
    input [7:0]in2,
    
    output [7:0]out1,
    output [7:0]out2
);

// parameters for PID control
reg [7:0]result1;
reg [7:0]result2;

// calculate PID output
always @(negedge(sysclk)) begin
    result1 = in1 - in2;
    result2 = in1 + in2;
end

assign out1 = result1;
assign out2 = result2; 

endmodule