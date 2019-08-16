`timescale 1ns / 1ps

module PID_test(
    input sysclk,
    input [1:0]btn,
    
    // 18-bit digital output port 
    output [15:0]D,
    output [1:0]F,
    
    // LEDs
    output [1:0]led,
    
    // XADC pins
    input xa_n,   
    input xa_p,
    input vp_in,
    input vn_in,
    
    // input for PID parameters
    input [11:0]setpoint,
    input [6:0]KI
);

// the clock for the XADC
wire XADC_clock;
clk_wiz_0 (
    .clk_in1(sysclk),
    .clk_out1(XADC_clock),
    .reset(1'b0)
);

// XADC reading from: register 14 = pin 15 of the Cmod A7
wire [15:0]data;
wire enable, ADC_ready;
xadc_wiz_0 (
      .daddr_in(8'h14),
      .dclk_in(XADC_clock),
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
wire [11:0]ADC_data;
assign ADC_data = data >> 4;

// clock divider for debouncing buttons
wire [20:0]slow_clk;
c_counter_binary_0 (
    .CLK(sysclk),
    .Q(slow_clk)
);

// buttons selection
reg [1:0]Bsel;
assign led = Bsel;
always @ (posedge slow_clk[20]) begin
    if (btn[0]) begin
        Bsel[0] = ~Bsel[0];
    end
    if (btn[1]) begin
        Bsel[1] = ~Bsel[1];
    end
end

// parameters for PID control
reg [31:0]error;
reg [31:0]integrated_error;
reg [12:0]out;

// calculate PID output
always @(negedge(ADC_ready)) begin
    // calculate error
    error = setpoint - ADC_data;
    integrated_error[31:0] = integrated_error[31:0] + error[31:0];
    
    // calculate PID control output
    out[12:0] =  KI*integrated_error[31:19] + error[12:0];
    
    // check output is positive; else make it zero
    if (out[12] == 1)
      out = 0;
end

// write to the parallel port
assign F = Bsel;  // F[1:0]=00 = amplitude modulation on AD9910 
assign D[15:4] = out[11:0]; // the 16-bit parallel data port

endmodule