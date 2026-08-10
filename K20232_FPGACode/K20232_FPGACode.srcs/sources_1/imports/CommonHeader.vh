`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:52:59 04/19/2018 
// Design Name: 
// Module Name:    CommonHeader 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

	//ClkGen
	wire 		clk_200M;
	
	//C28xEmifTransceiver
	wire [15:0]	reg_sprCode;
	wire [15:0]	reg_pwmOe;
	wire [15:0]	reg_ccrCe;
	wire [15:0]	reg_ccrCount;
	wire [15:0]	reg_ccrPhase;
	wire [15:0]	reg_ccrPD;
	wire [15:0] reg_intTime;
	wire [15:0] reg_dettime;
	wire [15:0] reg_softTrip_;
	wire reg_calPwm;
	
	wire [15:0]	reg_fadcStart;
	wire [15:0]	reg_hwgbH1;
	wire [15:0]	reg_hwgbH2;
	wire [15:0]	reg_hwgbH3;
	wire [15:0]	reg_hwgbH4;
	wire [15:0]	reg_hwgbL1;
	wire [15:0]	reg_hwgbL2;
	wire [15:0]	reg_hwgbL3;
	wire [15:0]	reg_hwgbL4;
	wire [15:0] reg_hwgbQual1;
	wire [15:0] reg_hwgbQual2;
	wire [15:0] reg_hwgbQual3;
	wire [15:0] reg_hwgbQual4;
	
	wire [15:0] reg_dutyRef_U1;
	wire [15:0] reg_dutyRef_V1;
	wire [15:0] reg_dutyRef_W1;
	wire [15:0] reg_dutyRefT2;
	wire [15:0] reg_dutyRefTz;
	wire [15:0] reg_area;
	wire [15:0] reg_ignTime;
	wire [15:0] reg_signVmid;
	
	wire [15:0] reg_delay_cnt;
	
	wire 		reg_gtbClear;
	wire		reg_wdtClear;
	
	//FastAdConverter
	wire [4:1]	fadc_cs_;
	wire		fadc_sck;
	wire [11:0]	fadc_data1;
	wire [11:0]	fadc_data2;
	wire [11:0]	fadc_data3;
	wire [11:0]	fadc_data4;
	
	//HWGB_FADC
	wire [3:0] 	hwgb_l1;
	wire 		hwgb_fadc;
	
	// FpgaGateblock
	wire		fb_gtblock_;

	
	//PWM1P1
	wire [15:0] pwm_out_U1;
	wire [15:0] pwm_out_V1;
	wire [15:0] pwm_out_W1;
	
	//AddDelay
	wire	   add_adcxet_soc;

	
