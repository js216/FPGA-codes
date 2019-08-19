// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sat Jul 27 10:32:32 2019
// Host        : DESKTOP-LTK36K4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/Xilinx/Jakob_testing/project_2/project_2.srcs/sources_1/ip/c_counter_binary_0/c_counter_binary_0_stub.v
// Design      : c_counter_binary_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_counter_binary_v12_0_13,Vivado 2019.1" *)
module c_counter_binary_0(CLK, Q)
/* synthesis syn_black_box black_box_pad_pin="CLK,Q[20:0]" */;
  input CLK;
  output [20:0]Q;
endmodule
