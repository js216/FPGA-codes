`timescale 1ns / 1ps

/* ================================
 * RS232 transmitter/ receiver
 * Jakob Kastelic, 8/14/2019
 * ================================*/

module RS232(
  input sysclk,
  output serial_clk,
  
  input RxD,
  output [7:0]RxD_data,
  output Rx_active,
  
  output TxD,
  input Tx_start,
  input [7:0]TxD_data,
  output Tx_active
);

clock clock_inst(
  .sysclk(sysclk),
  .serial_clk(serial_clk)
);

RS232_transmit RS232_transmit_inst(
  .sysclk(sysclk),
  .slow_clk(serial_clk),
  .TxD(TxD),
  .TxD_data(TxD_data),
  .Tx_start(Tx_start),
  .Tx_active(Tx_active)
);

RS232_receive RS232_receive_inst (
  .sysclk(sysclk),
  .slow_clk(serial_clk),
  .RxD(RxD),
  .RxD_data(RxD_data),
  .Rx_active(Rx_active)
);

endmodule



module clock(
  input sysclk,
  output reg serial_clk
);

// divide 12MHz clock down to 9600 baud rate
reg [10:0] counter = 0;
always @(posedge sysclk) begin
   if (counter < 625)
     counter = counter + 1;
   else begin
     counter = 0;
     serial_clk = serial_clk + 1; 
   end
 end

endmodule



module RS232_transmit(
  input sysclk,
  input slow_clk,
  
  output reg TxD,
  input [7:0]TxD_data,
  
  input Tx_start,
  output Tx_active
);

reg [3:0]TxD_idx = 10; // transmission data index
assign Tx_active = TxD_idx < 11;
reg Tx_reset = 0;

// detect start of transmission
always @(posedge sysclk)
  Tx_reset = (Tx_reset || Tx_start) && ~Tx_active;

always @(posedge slow_clk) begin
  // if beginning transmission, reset data index
  if (Tx_reset)
    TxD_idx = 0;
  
  else if (Tx_active) begin
    // increment data index
    TxD_idx = TxD_idx + 1;
    
    // transmit the data
    case (TxD_idx) inside
        1: TxD = 0; // start bit = 0
    [2:9]: TxD = TxD_data[TxD_idx-2];
       10: TxD = 1; // stop bit(s) = 1
    endcase
  end
end

endmodule



module RS232_receive(
  input sysclk,
  input slow_clk,
  
  input RxD,
  output reg [7:0]RxD_data,
  
  output Rx_active
);

reg [3:0] RxD_idx = 10; // data index
assign Rx_active = RxD_idx < 10;
reg Rx_reset = 0;

// detect start of data reception
always @(posedge sysclk)
  Rx_reset = (Rx_reset || ~RxD) && ~Rx_active;

// receive data
always @(posedge slow_clk) begin
  if (Rx_reset)
    RxD_idx <= 0;
  else if (Rx_active) begin
    RxD_idx = RxD_idx + 1;
    RxD_data[RxD_idx-1] = RxD;
  end
end

endmodule