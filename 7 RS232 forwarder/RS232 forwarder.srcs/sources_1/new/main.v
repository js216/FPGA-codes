`timescale 1ns / 1ps

module main(
  input sysclk,

  // RS232 io
  input RxD,
  output TxD,
  
  // for debugging
  output [7:0]RxD_data,
  output clk_out,
  output RxD_copy, TxD_copy
);

assign RxD_copy = RxD;
assign TxD_copy = TxD;

reg Tx_start=0;
wire Rx_active;

RS232 RS232_inst(
  .sysclk(sysclk),
  .RxD(RxD),
  .TxD(TxD),
  .Tx_start(Tx_start),
  .TxD_data(RxD_data),
  .RxD_data(RxD_data),
  .serial_clk(clk_out),
  .Rx_active(Rx_active),
  .Tx_active()
);

// start transmission whenever data received
reg data_received = 0;
always @(posedge sysclk) begin
  data_received = (data_received || Rx_active) && ~Tx_start;
  Tx_start = data_received && ~Rx_active;
end

endmodule