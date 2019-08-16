`timescale 1ns / 1ps

module main(
  // 12 MHz system clock
  input sysclk,
    
  // for debugging only
  input [1:0]btn,
  output [1:0] led,
  input [1:23]pi,
  output [26:48]po
);

RS232 RS232_inst(
  .sysclk(sysclk),
  .RxD(~btn[1]),
  .TxD(po[32]),
  .Tx_start(btn[0]),
  .TxD_data(pi[1:8]),
  .RxD_data(po[41:48]),
  .slow_clk(po[33]),
  .Rx_active(po[40]),
  .Tx_active(po[39]),
  .Rx_reset(po[38])
);

endmodule