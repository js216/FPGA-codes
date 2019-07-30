`timescale 1ns / 1ps

module XADCdemo(
    input sysclk,
    input [1:0] btn,
    
    // 18-bit digital output port 
    output [15:0] D,
    output [1:0] F,
    
    // LEDs
    output [1:0] led,
    
    // XADC pins
    input xa_n,   
    input xa_p,
    input vp_in,
    input vn_in
);

// the XADC requires a 100 MHz clock
wire clock_100MHz;
clk_wiz_0 my_clock (
    .clk_in1(sysclk),
    .clk_out1(clock_100MHz),
    .reset(1'b0)
);

// XADC reading from: register 14 = pin 15 of the Cmod A7
wire [15:0] data;
wire enable;
xadc_wiz_0 my_adc (
      .daddr_in(8'h14),
      .dclk_in(clock_100MHz),
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
      .vauxn4(xa_n)
);

// clock divider for debouncing buttons
wire [20:0] slow_clk;
c_counter_binary_0 div_20 (
    .CLK(sysclk),
    .Q(slow_clk)
);

// select destination using buttons
reg [1:0] Fset;
always @ (posedge slow_clk[20]) begin
    if (btn[0]) begin
        Fset[0] = ~Fset[0];
    end
    if (btn[1]) begin
        Fset[1] = ~Fset[1];
    end
end

// write to the parallel port and LEDs
assign F = Fset;
assign led = Fset;
assign D = data;

endmodule