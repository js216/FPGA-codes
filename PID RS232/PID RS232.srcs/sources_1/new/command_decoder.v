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
  output reg Tx_start,
  input Rx_active,
  input Tx_active,
  
  // PID parameters
  output reg [11:0]setpoint,
  output reg [11:0]KP,
  output reg [11:0]KI,
  input [11:0]ADC_data,
  input [31:0]accumulator,
    
  // AD9910 data direction
  output reg [1:0]F
);

reg [2:0] bytes_to_read = 0;
reg [2:0] bytes_to_write = 0;
reg Rx_done = 0;
reg [7:0]cmd_buffer;
reg [7:0]data_in[1:0];
reg [7:0]data_out[3:0];

always @(negedge Rx_active) begin
  // copy received data into the command buffer and decide how many bytes to read
  if (bytes_to_read == 0) begin
    cmd_buffer = RxD_data;
    if (cmd_buffer inside {{"f"}, {"p"}, {"i"}, {"d"}, {"s"}, {"a"}}) begin
      bytes_to_read <= 0;
      Rx_done <= 1;
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
    Rx_done <= 1;
  end
  
  // if have to read two data bytes
  else if (bytes_to_read == 2) begin
    data_in[1][7:0] <= RxD_data[7:0];
    bytes_to_read <= 1;
  end
end

// decode command
always @(posedge Rx_done) begin
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
  
  Rx_done <= 0;
end

always @(posedge sysclk) begin
  if (bytes_to_write > 0) begin
    // if not currently transmitting, send out the next byte
    if (~Tx_active && ~Tx_start) begin
      TxD_data[7:0] <= data_out[0][7:0]; 
      Tx_start <= 1;
      bytes_to_write <= bytes_to_write - 1;
    end else
      Tx_start <= 0;
  end
end

endmodule