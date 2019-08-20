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
  output reg Rx_active = 0,
  output reg Tx_active = 0
);

/* ================================
 *           RX BUFFER PART
 * ================================*/

reg RxD_output_trigger = 0;
reg RxD_buffer_full;
wire [2:2] RxD_buff_len;
wire [7:0] RxD_out0;
wire [7:0] RxD_out1;
wire [7:0] RxD_out2;

deserializer RxD_buffer(
  .sysclk(sysclk),
  .input_trigger(~serial_Rx_active),
  .data_in(RxD_data),
  .output_trigger(RxD_output_trigger),
  .RxD_buffer_full(RxD_buffer_full),
  .buff_len(RxD_buff_len),
  .out0(RxD_out0),
  .out1(RxD_out1),
  .out2(RxD_out2)
);

/* ================================
 *           TX BUFFER PART
 * ================================*/

reg TxD_output_trigger;
reg [2:0] TxD_len;
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
  .output_trigger(TxD_output_trigger)
);

/* ================================
 *           EXECUTION PART
 * ================================*/

always @(posedge sysclk) begin
  // determine whether enough data has been read
  case(RxD_out0) inside
    "f", "p", "i", "d", "s", "a": RxD_buffer_full = 1;
    "F": if(RxD_buff_len >= 2) RxD_buffer_full = 1; else RxD_buffer_full = 0;
    "P", "I", "D" : if(RxD_buff_len >= 3) RxD_buffer_full = 1; else RxD_buffer_full = 0;
  endcase
  
  // execute commands
  if (RxD_buffer_full)
    case(RxD_out0) inside
      // "set" commands
      "F" : F[1:0] <= RxD_out0[1:0]; // AD9910 parallel data output direction (00=amplituded mod., ...)
      "P" : KP[11:0] <= {RxD_out2[3:0], RxD_out1[7:0]};
      "I" : KI[11:0] <= {RxD_out2[3:0], RxD_out1[7:0]};
      "S" : setpoint[11:0] <= {RxD_out2[3:0], RxD_out1[7:0]};
      
      // "get" commands
      "f" : begin
              TxD_in0 = F[1:0];
            end
      "p" : begin
            TxD_in0[7:0] <= KP[7:0];
            TxD_in1[3:0] <= KP[11:8];
            TxD_len <= 2;
          end
    "i" : begin
            TxD_in0[7:0] <= KI[7:0];
            TxD_in1[3:0] <= KI[11:8];
            TxD_len <= 2;
          end
    "d" : begin
            TxD_in0[7:0] <= ADC_data[7:0];
            TxD_in1[3:0] <= ADC_data[11:8];
            TxD_len <= 2;
          end
    "s" : begin
            TxD_in0[7:0] <= setpoint[7:0];
            TxD_in1[3:0] <= setpoint[11:8];
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
end

endmodule







/*

// LEGACY CODE

reg [2:0] bytes_to_read = 0;
reg [2:0] bytes_to_write = 0;
reg [7:0]cmd_buffer;
reg [7:0]data_in[1:0];
reg [7:0]data_out[3:0];

always @(negedge serial_Rx_active) begin
  // copy received data into the command buffer and decide how many bytes to read
  if (bytes_to_read == 0) begin
    cmd_buffer = RxD_data;
    if (cmd_buffer inside {{"f"}, {"p"}, {"i"}, {"d"}, {"s"}, {"a"}}) begin
      bytes_to_read <= 0;
      Rx_active <= 1;
    end else if (cmd_buffer == "F") begin
      bytes_to_read <= 1;
    end else if (cmd_buffer inside {{"P"}, {"I"}, {"D"}, {"S"}}) begin
      bytes_to_read <= 2;
    end
  end

  // if have to read one data byte
  else if (bytes_to_read == 1) begin
    data_in[0][7:0] <= RxD_data[7:0];
    bytes_to_read <= 0;
    Rx_active <= 1;
  end
  
  // if have to read two data bytes
  else if (bytes_to_read == 2) begin
    data_in[1][7:0] <= RxD_data[7:0];
    bytes_to_read <= 1;
  end
end

// decode command
always @(posedge Rx_active) begin
  case (cmd_buffer)
    // "set" commands
    "F" : F[1:0] <= data_in[0][1:0]; // AD9910 parallel data output direction (00=amplituded mod., ...)
    "P" : KP[11:0] <= {data_in[1][3:0], data_in[0][7:0]};
    "I" : KI[11:0] <= {data_in[1][3:0], data_in[0][7:0]};
    "S" : setpoint[11:0] <= {data_in[1][3:0], data_in[0][7:0]};
    
    // "query" commands
    "f" : begin
            data_out[0][1:0] <= F[1:0];
            bytes_to_write <= 1;
          end
    "p" : begin
            data_out[0][7:0] <= KP[7:0];
            data_out[1][3:0] <= KP[11:8];
            bytes_to_write <= 2;
          end
    "i" : begin
            data_out[0][7:0] <= KI[7:0];
            data_out[1][3:0] <= KI[11:8];
            bytes_to_write <= 2;
          end
    "d" : begin
            data_out[0][7:0] <= ADC_data[7:0];
            data_out[1][3:0] <= ADC_data[11:8];
            bytes_to_write <= 2;
          end
    "s" : begin
            data_out[0][7:0] <= setpoint[7:0];
            data_out[1][3:0] <= setpoint[11:8];
            bytes_to_write <= 2;
          end
    "a" : begin
            data_out[0][7:0] <= accumulator[7:0];
            data_out[1][7:0] <= accumulator[15:8];
            data_out[2][7:0] <= accumulator[23:16];
            data_out[3][7:0] <= accumulator[31:24];
            bytes_to_write <= 4;
          end
  endcase
  
  Rx_active <= 0;
  Tx_active <= 1;
end

reg [2:0]bytes_written = 0;
always @(posedge sysclk) begin
  // check for transmission done condition
  if (bytes_written >= bytes_to_write) begin
    bytes_written <= 0;
    Tx_active <= 0;
  end
  
  // transmit bytes
  else if (Tx_active) begin
    Tx_active <= 1;
    
    // if RS232 Tx not busy and haven't started Tx yet, transmit next byte
    if (~serial_Tx_active && ~Tx_start) begin
      TxD_data[7:0] <= data_out[0][7:0]; 
      Tx_start <= 1;
      bytes_written <= bytes_written + 1;
    end
    
    // clear Tx_start flag if RS232 busy transmitting or we have already started Tx 
    else
      Tx_start <= 0;
  end
end

*/
