`timescale 1ns / 1ps

/* ================================
 * RS232-controlled PI(D) controller
 * (derivative controler TBD)
 * Jakob Kastelic, 8/19/2019
 * ================================*/

module main(
  input sysclk,
    
  // 18-bit digital output port 
  output [15:0]D,
  output [1:0]F,
    
  // XADC pins
  input xa_n,   
  input xa_p,
    
  // RS232 io
  input RxD,
  output TxD
);

// PID parameters
wire [15:0]setpoint;
wire [15:0]KP;
wire [15:0]KI;
wire [15:0]ADC_data;
wire [31:0]error;
wire [31:0]accumulator;
wire [31:0]out;

// serial data
wire Tx_start, Rx_active, Tx_active;
wire [7:0]RxD_data;
wire [7:0]TxD_data;

RS232 RS232_inst(
  .sysclk(sysclk),
  .RxD(RxD),
  .TxD(TxD),
  .Tx_start(Tx_start),
  .TxD_data(TxD_data),
  .RxD_data(RxD_data),
  .serial_clk(),
  .Rx_active(Rx_active),
  .Tx_active(Tx_active)
);

PID PID_inst(
  .sysclk(sysclk),
  .D(D),
  .xa_n(xa_n),
  .xa_p(xa_p),
  .setpoint(setpoint),
  .KP(KP),
  .KI(KI),
  .ADC_data(ADC_data),
  .error(error),
  .accumulator(accumulator),
  .out(out)
);

command_decoder decoder_inst(
  .sysclk(sysclk),
  .RxD_data(RxD_data),
  .TxD_data(TxD_data),
  .serial_Tx_start(Tx_start),
  .serial_Rx_active(Rx_active),
  .serial_Tx_active(Tx_active),
  .setpoint(setpoint),
  .KP(KP),
  .KI(KI),
  .F(F),
  .ADC_data(ADC_data),
  .error(error),
  .accumulator(accumulator),
  .out(out),
  .Tx_active()
);

endmodule