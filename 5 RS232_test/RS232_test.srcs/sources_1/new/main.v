`timescale 1ns / 1ps

module main(
  // 12 MHz system clock
  input sysclk,
    
  // for debugging only
  input [1:0]btn,
  output [1:0] led,
  output TxD,
  input [1:9]pi,
  output [38:48]po,
  output [1:0]clean_btn
);

button_debouncer btn_dbncr0 (
  .sysclk(sysclk),
  .btn(btn),
  .clean_btn(clean_btn)
);
  
RS232 RS232_inst(
  .sysclk(sysclk),
  .RxD(pi[9]),
  .TxD(TxD),
  .Tx_start(clean_btn[0]),
  .TxD_data(pi[1:8]),
  .RxD_data(po[41:48]),
  .serial_clk(po[38]),
  .Rx_active(po[40]),
  .Tx_active(po[39])
);

endmodule