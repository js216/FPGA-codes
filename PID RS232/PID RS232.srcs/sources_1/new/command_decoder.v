`timescale 1ns / 1ps

/* ================================
 * Serial command decoder
 * Jakob Kastelic, 8/19/2019
 * ================================*/

module command_decoder(
  input sysclk,
  
  // serial
  input [7:0]RxD_data,
  output reg [7:0]TxD_data,
  output reg serial_Tx_start,
  input serial_Rx_active,
  input serial_Tx_active,
  
  // PID parameters
  output reg [11:0]setpoint,
  output reg [11:0]KP,
  output reg [11:0]KI,
  input [11:0]ADC_data,
  input [31:0]accumulator,
    
  // AD9910 data direction
  output reg [1:0]F,
  
  // control outputs
  output Tx_active
);

/* ================================
 *           RX BUFFER PART
 * ================================*/

reg Rx_clear_trigger = 0;
wire [2:0] RxD_buff_len;
wire [7:0] RxD_out0;
wire [7:0] RxD_out1;
wire [7:0] RxD_out2;

deserializer RxD_buffer(
  .sysclk(sysclk),
  .input_trigger(serial_Rx_active),
  .data_in(RxD_data),
  .clear_trigger(Rx_clear_trigger),
  .buff_len(RxD_buff_len),
  .out0(RxD_out0),
  .out1(RxD_out1),
  .out2(RxD_out2)
);

/* ================================
 *           TX BUFFER PART
 * ================================*/

reg RxD_buffer_full; // for determining whether enough data has been read
reg Tx_output_trigger;
reg [2:0] TxD_len = 0;
reg [7:0] TxD_in0;
reg [7:0] TxD_in1;
reg [7:0] TxD_in2;
reg [7:0] TxD_in3;

serializer TxD_buffer(
  .sysclk(sysclk),
  .TxD_data(TxD_data),
  .serial_Tx_active(serial_Tx_active),
  .serial_Tx_start(serial_Tx_start),
  .in0(TxD_in0),
  .in1(TxD_in1),
  .in2(TxD_in2),
  .in3(TxD_in3),
  .len(TxD_len),
  .output_trigger(RxD_buffer_full),
  .Tx_active(Tx_active)
);

/* ================================
 *           COMMANDS PART
 * ================================*/

// set default values
initial F = 2'b00;
initial KP = 0;
initial KI = 0;
initial setpoint = 12'b0000_1111_0000;

always @(posedge sysclk) begin
  // determine whether enough data has been read
  if (~RxD_buffer_full) begin
    case(RxD_out0) inside
      "f", "p", "i", "d", "s", "a": RxD_buffer_full = 1;
      "F": if(RxD_buff_len >= 2) RxD_buffer_full = 1; else RxD_buffer_full = 0;
      "P", "I", "D", "S" : if(RxD_buff_len >= 3) RxD_buffer_full = 1; else RxD_buffer_full = 0;
      default: Rx_clear_trigger = 1;
    endcase
  end

  // when enough data has been received ...
  else if (RxD_buffer_full) begin
    // ... we can start processing the data
    case(RxD_out0) inside
      // "set" commands
      "F" : begin
              F[1:0] <= RxD_out1[1:0];
              TxD_len = 0;
            end
      "P" : begin
              KP[11:0] <= {RxD_out2[3:0], RxD_out1[7:0]};
              TxD_len = 0;
            end
      "I" : begin
              KI[11:0] <= {RxD_out2[3:0], RxD_out1[7:0]};
              TxD_len = 0;
            end
      "S" : begin
              setpoint[11:0] <= {RxD_out2[3:0], RxD_out1[7:0]};
              TxD_len = 0;
            end
      
      // "get" commands
      "f" : begin
              TxD_in0[7:0] = {{6'b00_0000}, F[1:0]};
              TxD_len = 1;
            end
      "p" : begin
              TxD_in0[7:0] <= KP[7:0];
              TxD_in1[7:0] <= {{4'b0000}, KP[11:8]};
              TxD_len <= 2;
            end
      "i" : begin
              TxD_in0[7:0] <= KI[7:0];
              TxD_in1[7:0] <= {{4'b0000}, KI[11:8]};
              TxD_len <= 2;
            end
      "d" : begin
              TxD_in0[7:0] <= ADC_data[7:0];
              TxD_in1[7:0] <= {{4'b0000}, ADC_data[11:8]};
              TxD_len <= 2;
            end
      "s" : begin
              TxD_in0[7:0] <= setpoint[7:0];
              TxD_in1[7:0] <= {{4'b0000}, setpoint[11:8]};
              TxD_len <= 2;
            end
      "a" : begin
              TxD_in0[7:0] <= accumulator[7:0];
              TxD_in1[7:0] <= accumulator[15:8];
              TxD_in2[7:0] <= accumulator[23:16];
              TxD_in3[7:0] <= accumulator[31:24];
              TxD_len <= 4;
            end
    endcase
    
    // having processed the data, we can empty the RxD_buffer
    Rx_clear_trigger = 1;
    RxD_buffer_full = 0;
  end

  // when the RxD_buffer has been cleared, turn off the clear_trigger
  if (RxD_buff_len==0 && Rx_clear_trigger)
    Rx_clear_trigger = 0;
end

endmodule