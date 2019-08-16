`timescale 1ns / 1ps

/* ================================
 * RS232 transmitter/ receiver
 * Jakob Kastelic, 8/14/2019
 * ================================*/

module RS232(
  input sysclk,
  output slow_clk,
  
  input RxD,
  output [7:0]RxD_data,
  output Rx_active,
  
  output TxD,
  input Tx_start,
  input [7:0]TxD_data,
  output Tx_active,
  
  // for debugging
  output reg Rx_reset
);

slow_clock slow_clock_inst(
  .sysclk(sysclk),
  .slow_clk(slow_clk)
);

// detect start of transmission
reg Tx_reset;
initial Tx_reset = 0;
always @(posedge sysclk)
  Tx_reset = (Tx_reset || Tx_start) && ~Tx_active;

RS232_transmit RS232_transmit_inst(
  .slow_clk(slow_clk),
  .TxD(TxD),
  .TxD_data(TxD_data),
  .Tx_reset(Tx_reset),
  .Tx_active(Tx_active)
);

// detect start of data reception
initial Rx_reset = 0;
always @(posedge sysclk)
  Rx_reset = (Rx_reset || ~RxD) && ~Rx_active;

RS232_receive RS232_receive_inst (
  .slow_clk(slow_clk),
  .RxD(RxD),
  .RxD_data(RxD_data),
  .Rx_reset(Rx_reset),
  .Rx_active(Rx_active)
);

endmodule



module slow_clock(
  input sysclk,
  output reg slow_clk
);
// divide 12MHz clock down to 9600 baud rate
/*
reg [10:0] counter = 0;
always @(posedge sysclk) begin
   if (counter < 625)
     counter = counter + 1;
   else begin
     counter = 0;
     slow_clk = slow_clk + 1; 
   end
 end
 */
 
 // for testing: approx. 1 Hz clock
 reg [22:0] counter = 0;
 always @(posedge sysclk)
    counter = counter + 1;
 assign slow_clk = counter[22];

endmodule



module RS232_transmit(
  input slow_clk,
  
  output reg TxD,
  input [7:0]TxD_data,
  
  input Tx_reset,
  output Tx_active
);

reg [3:0]TxD_idx = 10; // transmission data index
assign Tx_active = TxD_idx < 10;

always @(posedge slow_clk) begin
  // if starting transmission, reset data index
  if (Tx_reset)
    TxD_idx = 0;
  
  // send data
  case (TxD_idx) inside
        0: TxD = 0; // start bit = 0
    [1:8]: TxD = TxD_data[TxD_idx-1];
     9,10: TxD = 1; // stop bit(s) = 1
  endcase
  
  // increment data index
  if (Tx_active)
    TxD_idx = TxD_idx + 1;
end

endmodule



module RS232_receive(
  input slow_clk,
  
  input RxD,
  output reg [7:0]RxD_data,
  
  input Rx_reset,
  output Rx_active
);

reg [3:0] RxD_idx = 10; // data index
assign Rx_active = RxD_idx < 10;

always @(posedge slow_clk) begin
  if (Rx_reset)
    RxD_idx = 0;

  if ( (RxD_idx > 0) && (RxD_idx < 9) )
    RxD_data[RxD_idx-1] = RxD;

  // increment data index
  if (Rx_active)
    RxD_idx = RxD_idx + 1;
end

endmodule