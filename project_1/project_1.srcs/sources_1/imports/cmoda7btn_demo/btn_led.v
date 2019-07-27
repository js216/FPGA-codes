`timescale 1ns / 1ps

module btn_led(
    input [1:0]btn,   // Button inputs
    output [1:0]led  // Led outputs
    );
    
    // Assign each btn to it's respective led
    assign led[1] = btn[0];
    assign led[0] = btn[1];
    
endmodule