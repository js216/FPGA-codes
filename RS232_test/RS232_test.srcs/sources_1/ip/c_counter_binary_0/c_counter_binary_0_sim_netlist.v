// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Wed Aug 14 13:02:24 2019
// Host        : DESKTOP-LTK36K4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               f:/Xilinx/Jakob_testing/RS232_test/RS232_test.srcs/sources_1/ip/c_counter_binary_0/c_counter_binary_0_sim_netlist.v
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [8:0]Q;

  wire CLK;
  wire [8:0]Q;
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
  (* C_WIDTH = "9" *) 
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
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "9" *) 
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
  input [8:0]L;
  output THRESH0;
  output [8:0]Q;

  wire \<const1> ;
  wire CLK;
  wire [8:0]Q;
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
  (* C_WIDTH = "9" *) 
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
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
DgjmtdsprpJuSjntTcMPLejcS3/fpgPcf4N3yi+maXf+D2rd1EARJV+aig1WmWtfd9I+xl0VYVm5
yMKX4PH5xniqiGNurTcssi3Sh5mvTG2McMHNlpTaEHj5ixgFGp9ZiFxXl1ZA+41gXke7YkTc6V5z
T9L47lhaIr1jRyjLVOmapNnOY+CPoNUXJL/PMrUYQphBTBRFvxysz5pQzcH3h3riyQtaAjTCPK/0
AFfW+kAq9gj0dkSxcfhHfFwX0D0j1KGXPtkZBskGBeyjM34ar8yD5oOSldPdG1F+zAluzqJlAxEn
OOSB+NsYCJNN/sL5tadRtSmxURwFVlqPo0KjzQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NiqmBY5Ukc9sgcmq3Vigk5Au4VrRZ47D94flPddnlQtTcRowLnfJh2QmkQDqNTPVhJVWXoMA8fDX
EAsU+5+J5/5PZartslsziGWZgQKmAxE1yaxy34LLRiwTuw4HQaet7JqJokgzzc5EFpe8Y9QoEhiW
v/zl8tzIilSa+52giCbkRjImuYCfLQRrle1838MqmaMwh/b+s0FqnyzoiTBOCI1Q5tUIi8HPx2uS
reTMw4Hg2eTCCn4HxAi0vYu7ebyp1bAUVZ/1Q4t1FqUI3cGuscWXpoW7/di8K15vIk4Wb4RNUYTG
GmyGvxxs0Nbn/6SNHIq9G9jWkYRpyKG7BLPIdw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7440)
`pragma protect data_block
+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
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
