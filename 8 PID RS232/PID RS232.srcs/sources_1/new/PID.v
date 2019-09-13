`timescale 1ns / 1ps

/* ================================
 * PI(D) controller
 * (derivative controler TBD)
 * Jakob Kastelic, 8/19/2019
 * ================================*/

module PID(
    input sysclk,

    // 16-bit digital output port 
    output [15:0]D,
    
    // XADC pins
    input xa_n,   
    input xa_p,
    
    // input for PID parameters
    input error_invert,
    input [15:0]output_limit,
    input [15:0]setpoint,
    input [15:0]KP,
    input [15:0]KI,
    
    // outputs
    output [15:0]ADC_data,
    output reg [31:0]error,
    output reg [31:0]accumulator,
    output reg [31:0]out
);

// 100MHz clock for the XADC
wire XADC_clk;
clk_wiz_0 XADC_clock(
    .clk_in1(sysclk),
    .clk_out1(XADC_clk),
    .reset(1'b0)
);

// XADC reading from: register 14 = pin 15 of the Cmod A7
wire enable, ADC_ready;
reg vp_in=0, vn_in=0;
xadc_wiz_0 XADC_inst(
      .daddr_in(8'h14),
      .dclk_in(XADC_clk),
      .den_in(enable),
      .di_in(0),
      .dwe_in(0),
      .busy_out(),
      .channel_out(),
      .do_out(ADC_data),
      .eoc_out(enable),
      .vp_in(vp_in),
      .vn_in(vn_in),
      .reset_in(0),
      .vauxp4(xa_p),
      .vauxn4(xa_n),
      .drdy_out(ADC_ready)
);

// calculate PID output
always @(negedge(ADC_ready)) begin
    // calculate error
    error[31:0] = setpoint[15:0] - ADC_data[15:0];
    accumulator[31:0] = accumulator[31:0] + error[31:0];
    
    // calculate PID control output
    if (error_invert)
      out[31:0] =  -(KP*(error[31:0]<<8) + KI*accumulator[31:0]);
    else
      out[31:0] =  KP*(error[31:0]<<8) + KI*accumulator[31:0];
    
    // check output is positive; else make it zero
    if (out[31] == 1)
      out = 0;
    
    // set a hard limit on the PID output
    if (out[30:15] > output_limit[15:0])
      out = output_limit;
end

// write to the parallel port
assign D[15:0] = out[30:15];

endmodule