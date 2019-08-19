`timescale 1ns / 1ps

/* ================================
 * PI(D) controller
 * (derivative controler TBD)
 * Jakob Kastelic, 8/19/2019
 * ================================*/

module PID(
    input sysclk,

    // 18-bit digital output port 
    output [15:0]D,
    
    // XADC pins
    input xa_n,   
    input xa_p,
    
    // input for PID parameters
    input [11:0]setpoint,
    input [11:0]KP,
    input [11:0]KI,
    
    // outputs
    output [11:0]ADC_data,
    output reg [31:0]accumulator
);

// the clock for the XADC
wire XADC_clk;
clk_wiz_0 XADC_clock(
    .clk_in1(sysclk),
    .clk_out1(XADC_clk),
    .reset(1'b0)
);

// XADC reading from: register 14 = pin 15 of the Cmod A7
wire [15:0]data;
wire enable, ADC_ready;
reg vp_in, vn_in;
xadc_wiz_0 XADC_inst(
      .daddr_in(8'h14),
      .dclk_in(XADC_clk),
      .den_in(enable),
      .di_in(0),
      .dwe_in(0),
      .busy_out(),
      .channel_out(),
      .do_out(data),
      .eoc_out(enable),
      .vp_in(vp_in),
      .vn_in(vn_in),
      .reset_in(0),
      .vauxp4(xa_p),
      .vauxn4(xa_n),
      .drdy_out(ADC_ready)
);

// the XADC IP requires a 16-bit wire, but the FGPA's ADC is only 12 bit; we can thus ignore the four LSBs
assign ADC_data = data >> 4;

// parameters for PID control
reg [31:0]error;
reg [12:0]out;

// calculate PID output
always @(negedge(ADC_ready)) begin
    // calculate error
    error = setpoint - ADC_data;
    accumulator[31:0] = accumulator[31:0] + error[31:0];
    
    // calculate PID control output
    out[12:0] =  KP*error[12:0] + KI*accumulator[31:19];
    
    // check output is positive; else make it zero
    if (out[12] == 1)
      out = 0;
end

// write to the parallel port
assign D[15:4] = out[11:0]; // the 16-bit parallel data port

endmodule