// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Sat Jul 27 10:32:32 2019
// Host        : DESKTOP-LTK36K4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               f:/Xilinx/Jakob_testing/project_2/project_2.srcs/sources_1/ip/c_counter_binary_0/c_counter_binary_0_sim_netlist.v
// Design      : c_counter_binary_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_counter_binary_0,c_counter_binary_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module c_counter_binary_0
   (CLK,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [20:0]Q;

  wire CLK;
  wire [20:0]Q;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "21" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_0_c_counter_binary_v12_0_13 U0
       (.CE(1'b1),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "0" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "21" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_counter_binary_0_c_counter_binary_v12_0_13
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [20:0]L;
  output THRESH0;
  output [20:0]Q;

  wire \<const1> ;
  wire CLK;
  wire [20:0]Q;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "21" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_counter_binary_0_c_counter_binary_v12_0_13_viv i_synth
       (.CE(1'b0),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(NLW_i_synth_THRESH0_UNCONNECTED),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
hkYW+OZm6k9gF5yAUfXGm/n8kfXYD6tjFQYha968Ws0SqrM/NNAjCrrtMG8kIqTbkipnmceefxNr
sB0PtSpUrw==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NEPpD4CxNBVJLV3hg1agn83QnqiCz3YuR89MlVuNyQGERKVJ+uGolFDqHFzBKLQArFTiHBWivkzK
A2DQ42XdOxp30NKOgHjrjgmF+fZMjDs24rn3Ue1INLHwTS5RT84Kih7Jx/7R0dl03/COJq+33l9u
7l+ArdY7mLwqqI9iIjU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cfBwEwc95LpKuxDGqpON2gGac620iHNKrm/QNXYg3/OFA5ZQNdpdhRz4vCTQRVbOg7b1nIox6GR8
TD/cf0JW38RU0NuY+TR6CkFT19NCdy67gR6JTDdXifhr/zTKjOL5gvp0XjT9PSLwwPyDirNX4TMa
9y9X5pf4gEnt0dikHNgySZO+Qpr30MP7n6oAjuxowlf45cfmPqZthYPnIjBSCdQGBPfSF+kZ2F1N
XCDEja5xE4CQshPPodH5njadc6kj7/qp9C4PfKcyNtDug+qsws9UK25Z2IFc8vk6/15HlIkQHkXv
Wq0iHaPLidqh3035FinHyPD/FDnfGGa5Oa2qcg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QmjD3HAHcP+h0RsjR0iH8h2N6drNxei50nfQN9RC8HobMEaARq/6rKjZEhHXMSCStQeCMhyVKRmN
HM7ZrqMf3W0s/8U4QMqp3M1VuYXVjEe2PCIpvtRcMY3JngdSWOydG2dH6dDA16ehxinMKgIr0TjA
PXA+lfyX6yTs1FWrne/6ufrl6ZAPpNG7EDKQ2aHqSm8DEXT1BJYMblBfAjAajwaJmPEu1aDlQeNo
onryTiFJkKP92pcZLCCufZL8ZAJ5uMvZZxiZRsiLd0BnCfOe3rl9AON+q53U+iK11EvAkpIBT+Cc
VYb5NqVAVaqXbQrqo3+YHEW5ft3fM9kZnlFDew==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FkHW107swc8fPv4xOTlQJU6PWERObturlywl6rsGCswc/v367bmQ1Maze/8QdmUPjEYwhAcHKVMu
7U4o3CvYhmrDpYiUQdQQ0B7gAbMZbJ8MFY5jRxn7KYDk+Bi9Ov8092IdW1a51FPWEVPmF4Kn6z4E
DSqpQDL58qieEUnrU2Ltb4GLJc3NrWTLvnbvRtHUUuQWTMZTQ7WqX4iH2dZ/EICpbRjlAF50iMAS
YHuuFTRKXcIFQlKYRyeQV4nyaA5JGbb3RC3N/Q2IZjdSXqQ9EOpmdhttpxReCnsdJiD/pPCtf7ZN
d/TheLy1Va2FZR+p4MozZorVui5/FtcCwKy6aw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NgZm/7Jvy0UZQRVxBVxeZ/odxMd59IlnRFHjM+6Bof6o6u4Qy4u9MOoQ3Sr2paPuGq+B+5EhdcD8
a5WGiurBrPW0qF+L2CoUJsDqz0WonRehZECQynibSUlmctvvMyr790pwb+C78gtW47p8uALYdUCJ
NhcDkV8fE3jFdDEYmfQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TxQNdd2WOThZCBZEYNgXxai4jK9AqWD/GRadYnarEfzmLUfcNDUoG7DxVWHCdTVuW8i2qZpouT1H
FUHt76rzZk8vI2tFLfUbKyTaRqik1aYwOCp1ZdqbgqQEDhBRWJjGxcJuxZbSQ2z8IUgiJ0eT148+
nf9UmzvYS1jrIsN/a7K4EjyRNMk0V917y85rxdk7itlisaUw4Cm72z9slByFtALj6/077uPjcK9U
mbWm7PbXk8PT44eQeaJl990wlWvD5/8BZS6AHqjg8520Xs+jftSeB6aNqTiYxfp21FJqmexwo7cG
G3BH/DRHhP7ZIsXHqSaJJFo20Nx9VgpLuF5t2g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
T6APZ7QNPgYc0CmILCLxqjYbIpnXdntAqBDey97yytW76gLuegfoZsAvR4uPALub7AVBV52M3VGJ
BGCOS/lo7KcqGV7LfK3NS1rm/1xLQLn3PNeDMy8vdIWD+oDdClKfFnKmyBBcMgSfNoa5bKLrOwPY
2RKvgvo1jckR6VLPYiw0neyFAQKUnq5OYjaBaTibueDR45mtHoKrt2/lu/3KElWYBI4I17+N60II
VVZUFA9NDf+/9yXi/mw+1i0hCDGA74hWGTmZeZr+SvS7KRHW7D7EfDaBeSAXVmFnb20P6A8KaeQO
3CK/y/1TNiFEZEDI4iHRRmmlHjibP7r5XFRyAg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UTEesi38IVatDtSnozx3jj3k3lWeR6Ll8fGK9dmtCy/YR4niixftf+MTcnxA5K+x/6mkN0gIy6yA
m1oIAba6L2U7U2y4NsYUcVxB5m2C0QPH0fg+xfQWLW0CA0tArE+eTimlQ6uoUQR9AYzEy0zAjhVM
HTnShTcc8j2tiH1pHtzYk8xQjCRmu2Xies9GcUBGVnDSxIPLo/Mil9j7FN3lBC7grLlReTBO0hTc
+Xn4XyO6wAZwKPAva0fXIEvM3J9gPqMQ3AHsFEvdlfEdZUoVoy/O/qVi7LZAEVX7kZbYgmhoN4Up
4y/ye0W5GSQpiDZF2OTsj5VKCJhpQtrxzhJhgg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12896)
`pragma protect data_block
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
s/Sl8NxvKN7D56irL68=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
