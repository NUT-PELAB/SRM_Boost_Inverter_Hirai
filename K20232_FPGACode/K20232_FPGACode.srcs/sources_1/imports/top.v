////////////////////////////////////////////////////////////////////////////////
// Company: Nagaoka Power ElectronicsCo., Ltd.
// Engineer: Ohnuma
//
// Create Date:2021/08/05
// Target Device: Xc7s100fpga484-2
// Tool versions: Vivado 2021.1
// Description:
//    <Description here>
// Dependencies:
//    <Dependencies here>
// Revision:
//    <Code_revision_information>
// Additional Comments:
//    <Additional_comments>
////////////////////////////////////////////////////////////////////////////////
//コメント追加


module Top(TP4, TP5, TP6, TP7, TP8, TP9, TP1, TP2, TP12, TP13, TP14, TP15, TP16, TP3, TP10, TP11, TP0, VT1_NEG, VT1_POS, VT2_NEG, VT2_POS, VT3_NEG, VT3_POS, CT1_NEG, CT1_POS, CT2_NEG, CT2_POS, CT3_NEG, CT3_POS, PWM1A, PWM1B, PWM2A, PWM2B, PWM3A, PWM3B, PWM4A, PWM4B, PWM5A, PWM5B, PWM6A, PWM6B, PWM7A, PWM7B, PWM8A, PWM8B, PWM9A, PWM9B, PWM10A, PWM10B, PWM11A, PWM11B, PWM12A, PWM12B, PWM13A, PWM13B, PWM14A, PWM14B, PWM15A, PWM15B, PWM16A, PWM16B, CLKFPGA, CLKFPGA_N, FPGA_A, FPGA_D, FPGA_CS_, FPGA_OE_, FPGA_WE_, FPGA_BA1, FADC_SDO, FADC_CS_, FADC_SCK, FPGA_IO, EXTSYNCOUT, ADCEXTSOC, DSP_RST_, DSP_TRIP_, CAPOP2, EQEP1A, EQEP1B, EQEP1S, EQEP1I, CAPOP1, LD_C, LD_D, CANRTB, CANTXB, SCITXDB, SCIRXDB, I2C_SDAA, I2C_SCLA, SPISIMOB, SPISOMIB, SPICLKB, SPISTEB_, LVDS_IN2, LVDS_IN2_N, LVDS_OUT2, LVDS_OUT2_N, LVDS_OUT1, LVDS_OUT1_N, LVDS_IN1, LVDS_IN1_N, NC_BANK13, NC_BANK14, NC_BANK16, NC_BANK34, NC_BANK15, NC_BANK36, DIN, CN5, CN6, CN7_1, CN7_2);
  output TP4;
  output TP5;
  output TP6;
  output TP7;
  output TP8;
  output TP9;
  output TP1;
  output TP2;
  output TP12;
  output TP13;
  output TP14;
  output TP15;
  output TP16;
  output TP3;
  output TP10;
  output TP11;
  output TP0;
  input VT1_NEG;
  input VT1_POS;
  input VT2_NEG;
  input VT2_POS;
  input VT3_NEG;
  input VT3_POS;
  input CT1_NEG;
  input CT1_POS;
  input CT2_NEG;
  input CT2_POS;
  input CT3_NEG;
  input CT3_POS;
  output PWM1A;
  output PWM1B;
  output PWM2A;
  output PWM2B;
  output PWM3A;
  output PWM3B;
  output PWM4A;
  output PWM4B;
  output PWM5A;
  output PWM5B;
  output PWM6A;
  output PWM6B;
  output PWM7A;
  output PWM7B;
  output PWM8A;
  output PWM8B;
  output PWM9A;
  output PWM9B;
  output PWM10A;
  output PWM10B;
  output PWM11A;
  output PWM11B;
  output PWM12A;
  output PWM12B;
  output PWM13A;
  output PWM13B;
  output PWM14A;
  output PWM14B;
  output PWM15A;
  output PWM15B;
  output PWM16A;
  output PWM16B;
  input CLKFPGA;
  input CLKFPGA_N;
  input [7:0] FPGA_A;
  inout [15:0] FPGA_D;
  input FPGA_CS_;
  input FPGA_OE_;
  input FPGA_WE_;
  input FPGA_BA1;
  input [4:1] FADC_SDO;
  output [4:1] FADC_CS_;
  output FADC_SCK;
  inout [15:0] FPGA_IO;
  input EXTSYNCOUT;
  output ADCEXTSOC;
  input DSP_RST_;
  input DSP_TRIP_;
  input CAPOP2;
  input EQEP1A;
  input EQEP1B;
  input EQEP1S;
  input EQEP1I;
  input CAPOP1;
  output LD_C;
  output LD_D;
  input CANRTB;
  output CANTXB;
  input SCITXDB;
  input SCIRXDB;
  input I2C_SDAA;
  input I2C_SCLA;
  input SPISIMOB;
  input SPISOMIB;
  input SPICLKB;
  input SPISTEB_;
  output LVDS_IN2;
  output LVDS_IN2_N;
  output LVDS_OUT2;
  output LVDS_OUT2_N;
  output LVDS_OUT1;
  output LVDS_OUT1_N;
  input LVDS_IN1;
  input LVDS_IN1_N;
  output [5:0] NC_BANK13;
  output [26:0] NC_BANK14;
  output [1:0] NC_BANK16;
  output [8:0] NC_BANK34;
  output NC_BANK15;
  output NC_BANK36;
  input [7:0] DIN;
  output [49:1] CN5;
  output [50:1] CN6;
  output [14:1] CN7_1;
  output [41:17] CN7_2;

  // internal wires associated with differential buffers
  `include "CommonHeader.vh"
  
  wire CLKFPGA_IBUFDS_O;
  wire LVDS_IN2_OBUFDS_I;
  wire LVDS_OUT2_OBUFDS_I;
  wire LVDS_OUT1_OBUFDS_I;
  wire LVDS_IN1_IBUFDS_O;

  // differential buffers
  IBUFDS CLKFPGA_IBUFDS (.I(CLKFPGA), .IB(CLKFPGA_N), .O(CLKFPGA_IBUFDS_O));
  OBUFDS LVDS_IN2_OBUFDS (.O(LVDS_IN2), .OB(LVDS_IN2_N), .I(LVDS_IN2_OBUFDS_I));
  OBUFDS LVDS_OUT2_OBUFDS (.O(LVDS_OUT2), .OB(LVDS_OUT2_N), .I(LVDS_OUT2_OBUFDS_I));
  OBUFDS LVDS_OUT1_OBUFDS (.O(LVDS_OUT1), .OB(LVDS_OUT1_N), .I(LVDS_OUT1_OBUFDS_I));
  IBUFDS LVDS_IN1_IBUFDS (.I(LVDS_IN1), .IB(LVDS_IN1_N), .O(LVDS_IN1_IBUFDS_O));

  clk_wiz_0 clk_IP1
   (.clk_out1(clk_200M),    // output clk_out1
    .clk_in1(CLKFPGA_IBUFDS_O)       // input clk_in1
    );    

	C28xEmifTransceiver C28xEmifTransceiver1
	(.CLK(clk_200M),
	.RST_(DSP_RST_),
	.A_BUS({FPGA_A,FPGA_BA1}),
	.D_BUS(FPGA_D),
	.OE_(FPGA_OE_),
	.CS_(FPGA_CS_),
	.WE_(FPGA_WE_),
    .REG_ARRY_OUT_0(reg_sprCode), 		// SPRCODE
    .REG_ARRY_OUT_1(reg_pwmOe), 		// PWMゲート出力許可
    .REG_ARRY_OUT_2(reg_ccrCe), 		// キャリアタイマ許可信号
    .REG_ARRY_OUT_3(reg_ccrCount), 		// キャリアピーク
    .REG_ARRY_OUT_4(reg_ccrPhase),		// キャリアフェーズ 
    .REG_ARRY_OUT_5(reg_ccrPD), 		// キャリアフェーズ向き
    .REG_ARRY_OUT_6(reg_intTime),		// 間引き回数 
    .REG_ARRY_OUT_7(reg_dettime),		// デットタイム 
    .REG_ARRY_OUT_8(reg_softTrip_), 	// DSPソフトトリップ
    .REG_ARRY_OUT_9(reg_delay_cnt),		// ADトリガディレイ信号 		
    .REG_ARRY_OUT_a(reg_calPwm),         //高速演算時間計測用フラグ 		

    .REG_ARRY_OUT_b(), 
    .REG_ARRY_OUT_c(), 
    .REG_ARRY_OUT_d(), 
    .REG_ARRY_OUT_e(), 
    .REG_ARRY_OUT_f(), 
    .REG_ARRY_OUT_10(reg_fadcStart), 
    .REG_ARRY_OUT_11(reg_hwgbH1), 
    .REG_ARRY_OUT_12(reg_hwgbH2), 
    .REG_ARRY_OUT_13(reg_hwgbH3), 
    .REG_ARRY_OUT_14(reg_hwgbH4), 
    .REG_ARRY_OUT_15(reg_hwgbL1), 
    .REG_ARRY_OUT_16(reg_hwgbL2), 
    .REG_ARRY_OUT_17(reg_hwgbL3), 
    .REG_ARRY_OUT_18(reg_hwgbL4), 
    .REG_ARRY_OUT_19(reg_hwgbQual1), 
    .REG_ARRY_OUT_1a(reg_hwgbQual2), 
    .REG_ARRY_OUT_1b(reg_hwgbQual3), 
    .REG_ARRY_OUT_1c(reg_hwgbQual4), 
    .REG_ARRY_OUT_1d(), 
    .REG_ARRY_OUT_1e(), 
    .REG_ARRY_OUT_1f(), 
    .REG_ARRY_OUT_20(reg_dutyRef_U1), 
    .REG_ARRY_OUT_21(reg_dutyRef_V1), 	
    .REG_ARRY_OUT_22(reg_dutyRef_W1), 
    .REG_ARRY_OUT_23(), 
    .REG_ARRY_OUT_24(), 		
    .REG_ARRY_OUT_25(), 	
    .REG_ARRY_OUT_26(), 
    .REG_ARRY_OUT_27(), 
    .REG_ARRY_OUT_28(), 
    .REG_ARRY_OUT_29(), 
    .REG_ARRY_OUT_2a(), 
    .REG_ARRY_OUT_2b(), 
    .REG_ARRY_OUT_2c(), 
    .REG_ARRY_OUT_2d(), 
    .REG_ARRY_OUT_2e(), 
    .REG_ARRY_OUT_2f(), 
    .REG_ARRY_OUT_30(), 
    .REG_ARRY_OUT_31(), 
    .REG_ARRY_OUT_32(), 
    .REG_ARRY_OUT_33(), 
    .REG_ARRY_OUT_34(), 
    .REG_ARRY_OUT_35(), 
    .REG_ARRY_OUT_36(), 
    .REG_ARRY_OUT_37(), 
    .REG_ARRY_OUT_38(), 
    .REG_ARRY_OUT_39(), 
    .REG_ARRY_OUT_3a(), 
    .REG_ARRY_OUT_3b(), 
    .REG_ARRY_OUT_3c(), 
    .REG_ARRY_OUT_3d(), 
    .REG_ARRY_OUT_3e(), 
    .REG_ARRY_OUT_3f(), 
    .REG_MAPPED_PORT_DATA_IN_40(reg_sprCode), 
    .REG_MAPPED_PORT_DATA_IN_41(fadc_data1), 
    .REG_MAPPED_PORT_DATA_IN_42(fadc_data2), 
    .REG_MAPPED_PORT_DATA_IN_43(fadc_data3), 
    .REG_MAPPED_PORT_DATA_IN_44(fadc_data4), 
    .REG_MAPPED_PORT_DATA_IN_45(16'h579b), 
    .REG_MAPPED_PORT_DATA_IN_46(16'h0000), 
    .REG_MAPPED_PORT_DATA_IN_47(fb_gtblock_), 
    .REG_MAPPED_PORT_DATA_IN_48(hwgb_l1), 
    .REG_MAPPED_PORT_DATA_IN_49(16'h0000), 
    .REG_MAPPED_PORT_DATA_IN_4a(16'h0000), 
    .REG_MAPPED_PORT_DATA_IN_4b(16'h0000), 
    .REG_MAPPED_PORT_DATA_IN_4c(16'h0000), 
    .REG_MAPPED_PORT_DATA_IN_4d(16'h0000), 
    .REG_MAPPED_PORT_DATA_IN_4e(16'h0000), 
    .REG_MAPPED_PORT_DATA_IN_4f(16'h0000), 
    .REG_MAPPED_PORT_HEADER_OUT_40(), 
    .REG_MAPPED_PORT_HEADER_OUT_41(), 
    .REG_MAPPED_PORT_HEADER_OUT_42(), 
    .REG_MAPPED_PORT_HEADER_OUT_43(), 
    .REG_MAPPED_PORT_HEADER_OUT_44(), 
    .REG_MAPPED_PORT_HEADER_OUT_45(), 
    .REG_MAPPED_PORT_HEADER_OUT_46(), 
    .REG_MAPPED_PORT_HEADER_OUT_47(), 
    .REG_MAPPED_PORT_HEADER_OUT_48(reg_gtbClear), 
    .REG_MAPPED_PORT_HEADER_OUT_49(reg_wdtClear), 
    .REG_MAPPED_PORT_HEADER_OUT_4a(), 
    .REG_MAPPED_PORT_HEADER_OUT_4b(), 
    .REG_MAPPED_PORT_HEADER_OUT_4c(), 
    .REG_MAPPED_PORT_HEADER_OUT_4d(), 
    .REG_MAPPED_PORT_HEADER_OUT_4e(), 
    .REG_MAPPED_PORT_HEADER_OUT_4f(), 
    .REG_MAPPED_PORT_DATA_OUT_40(), 
    .REG_MAPPED_PORT_DATA_OUT_41(), 
    .REG_MAPPED_PORT_DATA_OUT_42(), 
    .REG_MAPPED_PORT_DATA_OUT_43(), 
    .REG_MAPPED_PORT_DATA_OUT_44(), 
    .REG_MAPPED_PORT_DATA_OUT_45(), 
    .REG_MAPPED_PORT_DATA_OUT_46(), 
    .REG_MAPPED_PORT_DATA_OUT_47(), 
    .REG_MAPPED_PORT_DATA_OUT_48(), 
    .REG_MAPPED_PORT_DATA_OUT_49(), 
    .REG_MAPPED_PORT_DATA_OUT_4a(), 
    .REG_MAPPED_PORT_DATA_OUT_4b(), 
    .REG_MAPPED_PORT_DATA_OUT_4c(), 
    .REG_MAPPED_PORT_DATA_OUT_4d(), 
    .REG_MAPPED_PORT_DATA_OUT_4e(), 
    .REG_MAPPED_PORT_DATA_OUT_4f(),
	.test1(test1),
	.test2(test2)
	 );
	 
	FastAdConverter FastAdConverter1
	(.CLK(clk_200M),
     .RST_(DSP_RST_),
	 .FADC_SDO(FADC_SDO),
	 .FADC_START(reg_fadcStart[0]),
     .FADC_CS_(fadc_cs_),
     .FADC_SCK(fadc_sck),
     .FADC_DATA_1(fadc_data1),
     .FADC_DATA_2(fadc_data2),
     .FADC_DATA_3(fadc_data3),
     .FADC_DATA_4(fadc_data4)
    );
	
	HWGB_FADC HWGB_FADC1
	(.CLK(clk_200M),
     .RST_(DSP_RST_),
     .HWGB_GTBCLEAR(reg_gtbClear), 
     .HWGB_CS_(fadc_cs_),
     .HWGB_DATA_1(fadc_data1),
     .HWGB_DATA_2(fadc_data2),
     .HWGB_DATA_3(fadc_data3),
     .HWGB_DATA_4(fadc_data4),
     .HWGB_UPPER_1(reg_hwgbH1[11:0]),
     .HWGB_UPPER_2(reg_hwgbH2[11:0]),
     .HWGB_UPPER_3(reg_hwgbH3[11:0]),
     .HWGB_UPPER_4(reg_hwgbH4[11:0]),
     .HWGB_LOWER_1(reg_hwgbL1[11:0]),
     .HWGB_LOWER_2(reg_hwgbL2[11:0]),
     .HWGB_LOWER_3(reg_hwgbL3[11:0]),
     .HWGB_LOWER_4(reg_hwgbL4[11:0]),
     .HWGB_QUALI_1(reg_hwgbQual1[3:0]),
     .HWGB_QUALI_2(reg_hwgbQual2[3:0]),
     .HWGB_QUALI_3(reg_hwgbQual3[3:0]),
     .HWGB_QUALI_4(reg_hwgbQual4[3:0]),
	 .HWGB_L1(hwgb_l1),
     .HWGB_FADC(hwgb_fadc)
	 );
	 	
	FpgaGateblock FpgaGateblock1 (
    .CLK(clk_200M), 
    .RST_(DSP_RST_), 
    .GTBCLEAR(reg_gtbClear),
	.WDT_(FPGA_CS_),
    .TRIP1_(DSP_TRIP_), 
    .TRIP2_(reg_softTrip_[0]), 
    .GTBLOCK_(fb_gtblock_)
    );
	
	PWM1P	PWM1P1(
     .CLK(clk_200M), 
	 .CE(reg_ccrCe[0]),
	 .CCR_C(reg_ccrCount),
	 .CCR_PHASE(reg_ccrPhase),
	 .CCR_PHASE_DIRECTION(reg_ccrPD[0]),
	 .CCR_U(reg_dutyRef_U1),
	 .CCR_TD(reg_dettime),
	 .DIVISOR(reg_intTime),
	 .CTRL(1), //1(=16'h0001):update at bottom of carreir，2(=16'h0002):update at top of carrier，3(16'h0003):update at both bottom and top of carrier
	 .CCR_ADDLY(reg_delay_cnt),
	 .OUTPUT(pwm_out_U1)
	 );

	PWM1P	PWM1P2(
     .CLK(clk_200M), 
	 .CE(reg_ccrCe[0]),
	 .CCR_C(reg_ccrCount),
	 .CCR_PHASE(reg_ccrPhase),
	 .CCR_PHASE_DIRECTION(reg_ccrPD[0]),
	 .CCR_U(reg_dutyRef_V1),
	 .CCR_TD(reg_dettime),
	 .DIVISOR(reg_intTime),
	 .CTRL(1),
	 .CCR_ADDLY(reg_delay_cnt),
	 .OUTPUT(pwm_out_V1)
	 );

	PWM1P	PWM1P3(
     .CLK(clk_200M), 
	 .CE(reg_ccrCe[0]),
	 .CCR_C(reg_ccrCount),
	 .CCR_PHASE(reg_ccrPhase),
	 .CCR_PHASE_DIRECTION(reg_ccrPD[0]),
	 .CCR_U(reg_dutyRef_W1),
	 .CCR_TD(reg_dettime),
	 .DIVISOR(reg_intTime),
	 .CTRL(1),
	 .CCR_ADDLY(reg_delay_cnt),
	 .OUTPUT(pwm_out_W1)
	 );
	 
	assign	FADC_SCK = fadc_sck;
	assign	FADC_CS_ = fadc_cs_;
	assign	ADCEXTSOC = pwm_out_U1[2];
	
	// hwgb_fadc might not work now @2021/04/28 by yasuda
//	assign	PWM1A= !(fb_gtblock_ | hwgb_fadc) & reg_pwmOe & pwm_out_U1[0];
//	assign	PWM1B= !(fb_gtblock_ | hwgb_fadc) & reg_pwmOe & pwm_out_U1[1];
//	assign	PWM2A= !(fb_gtblock_ | hwgb_fadc) & reg_pwmOe & pwm_out_V1[1];
//	assign	PWM2B= !(fb_gtblock_ | hwgb_fadc) & reg_pwmOe & pwm_out_V1[0];
//	assign	PWM3A= !(fb_gtblock_ | hwgb_fadc) & reg_pwmOe & pwm_out_W1[0];
//	assign	PWM3B= !(fb_gtblock_ | hwgb_fadc) & reg_pwmOe & pwm_out_W1[1];
	assign	PWM1A= fb_gtblock_ & reg_pwmOe & pwm_out_U1[0];
	assign	PWM1B= fb_gtblock_ & reg_pwmOe & pwm_out_U1[1];
	assign	PWM2A= fb_gtblock_ & reg_pwmOe & pwm_out_V1[1];//単相INVのユニポーラ変調用
	assign	PWM2B= fb_gtblock_ & reg_pwmOe & pwm_out_V1[0];
//	assign	PWM3A= fb_gtblock_ & reg_pwmOe & pwm_out_W1[0];
//	assign	PWM3B= fb_gtblock_ & reg_pwmOe & pwm_out_W1[1];

	assign	TP0= clk_200M;   
	assign	TP1= fadc_cs_;
	assign	TP2= fadc_sck;
	assign	TP3= reg_pwmOe;  
	assign	TP4= pwm_out_U1[2];
	assign	TP5= reg_calPwm;

endmodule
