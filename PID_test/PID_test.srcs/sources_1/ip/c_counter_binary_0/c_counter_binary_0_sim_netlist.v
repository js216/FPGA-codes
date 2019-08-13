// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Tue Jul 30 17:11:36 2019
// Host        : DESKTOP-LTK36K4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               f:/Xilinx/Jakob_testing/PID_test/PID_test.srcs/sources_1/ip/c_counter_binary_0/c_counter_binary_0_sim_netlist.v
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
q6NeIWTWAPqdotwzR28aE1zwpgBv72qfG6fw0cwV7M+PPhuq/wiTdaFF5KInEWA1GP7VmMLwxFD8
DGUdbTmjS2Oa+fv8IDnXlmQSOf0tX0aazGxyj4ez3YkTnwS/Zyn4NqPXcAF3ojbiBk5kbVM/UY7l
/c2E9fVm9APA3OxTgXpaoZ53/HTEeCsHIlmiFJa1jY/5FqY8hdjpEiX6uhS+X7gPu7xp+pXdcSEx
tqPy+k6uFGsK37WmHVX/hqhgI6LUF+qmQOe67uejOJfKDJ/vY/YRdxharne9rfes9paEEr9fTvAj
2+F6bmSXpRb+N4oP9K0Z8h+kUH+aC95H3O+CqQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cISnyp1BTdwEfoHDEMMyGI0jgcC2KvwJzdFk3MwidekmemEIjmOU4sVoXXkCeEHSgPOfJwiAadYD
ywfObh3E3o8e9G8EkDOO7G4UC7aEHM5p0pxBE3w7lDntw23k30AhP52vxwotBCzuDEU61wksI6SX
oLMNj3k6n8sWu6/XPX9h/OC1ZasRgXu7JTxX7tzK/4u9DnrayGElnpQ/JpXNOOyUj0Ci7h9+XjqG
Zuv/JdZP7remBhBSrIAThT02VeUWxLtB63pgw0rAF+g+Od5gyFpigwVsO0BTuWdd7337npIm3DDz
KoBpdO4kLyus4yoSaem7gp9wjSjyuAxXNVkC8w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12896)
`pragma protect data_block
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
AQ9D27K7REw3iUcCD14=
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
