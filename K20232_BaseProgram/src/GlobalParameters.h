//###########################################################################
//
// FILE:  GlobalParameters.h
//
// TITLE: Define global parameters
//
//###########################################################################
// $TI Release: K17100 Base program ver.1.0 $
// $Release Date: Thu July 21 2020  $
// $Copyright:
// Copyright (C) 2020 Nagaoka Power Electronics Co., Ltd. http://www.npe.co.jp/


#ifndef GLOBALPARAMETERS_H_
#define GLOBALPARAMETERS_H_

#include "NLibrary.h"

#define FPGA_CLK    (s4)200e6           // FPGAクロック(Hz) ※計算用。この数字を変更してもCPUのクロックは変更しない

#define PWM_FRQ		((u4)20000)                             // キャリア周波数(Hz)
#define INT_COUNT	((u4)1) 				                // 間引き回数(Hz)
#define INT_FRQ		((u4)PWM_FRQ/INT_COUNT)	                // 割り込み周波数(Hz)
#define PWM_PER		((f4)1.0/PWM_FRQ) 		                // インバータキャリア周期(秒)
#define INT_PER     ((f4)1.0/INT_FRQ)                       // 割り込み周期(秒)

#define DSP_CAPK	((u4)(DEVICE_SYSCLK_FREQ/PWM_FRQ)/2)	// DSPキャリアピーク :CPU clk/Frequency of carrier /2
#define FPGA_CAPK   ((s4)(FPGA_CLK/PWM_FRQ)/2)  // FPGAキャリアピーク

#define DSP_DEADT  	((u4)200)   			                // DSPデットタイム (1/(200MHz*2))*DSP_DEADT=	デットタイム(秒)
#define FPGA_DEADT  (s4)40                      // 200 = 1usec FPGAデットタイム (1/200M)*FPGA_DEADT=  デットタイム(秒)


// PEScauter setup
#define TRACE_FRQ       (INT_FRQ)
#define RSET_CNT        (1)
#define FREQUENCY_SCI   (115200)




#endif /* GLOBALPARAMETERS_H_ */


