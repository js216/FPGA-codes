`timescale 1ns / 1ps

module main(
  input sysclk,

  // RS232 io
  input RxD,
  output TxD,
  
  // for debugging
  output [7:0]RxD_data
);

reg Tx_start=0;
wire Rx_active;

RS232 RS232_inst(
  .sysclk(sysclk),
  .RxD(RxD),
  .TxD(TxD),
  .Tx_start(Tx_start),
  .TxD_data(RxD_data),
  .RxD_data(RxD_data),
  .serial_clk(),
  .Rx_active(Rx_active),
  .Tx_active()
);

endmodule