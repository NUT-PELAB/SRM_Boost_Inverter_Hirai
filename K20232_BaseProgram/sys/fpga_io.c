/*
 * fpga_io.c
 *
 *  Created on: 2016/10/17
 *      Author: ohnuma
 */

#include "NLibrary.h"
#include "fpga_io.h"     //

/*=============================================================*/
/* FPGAレジスタ定義 */
/*=============================================================*/

volatile u2     F_sprCode;
volatile u2     F_pwmOE;
volatile u2     F_ccrCE;
volatile u2     F_ccrCount;
volatile u2     F_ccrPhase;
volatile u2     F_ccrPD;
volatile u2     F_intTime;
volatile u2     F_detTime;
volatile u2     F_softTrip;
volatile u2     F_adDelay;

volatile u2     F_fAdcStart;
volatile u2     F_hwGbH1;
volatile u2     F_hwGbH2;
volatile u2     F_hwGbH3;
volatile u2     F_hwGbH4;
volatile u2     F_hwGbL1;
volatile u2     F_hwGbL2;
volatile u2     F_hwGbL3;
volatile u2     F_hwGbL4;

volatile u2     F_hwGbQual1;
volatile u2     F_hwGbQual2;
volatile u2     F_hwGbQual3;
volatile u2     F_hwGbQual4;

volatile u2     F_dutyRefU1;
volatile u2     F_dutyRefV1;
volatile u2     F_dutyRefW1;

volatile u2     F_rSprCode;
volatile u2     F_testRead;
volatile u2     F_adCT11;
volatile u2     F_adCT12;
volatile u2     F_adVT11;
volatile u2     F_adVT12;
volatile u2     F_fpgaGbRd;
volatile u2     F_fpgaTTripRd;
volatile u2     F_calPwm;

#pragma DATA_SECTION(F_sprCode,"REG_ARRY_OUT_0")
#pragma DATA_SECTION(F_pwmOE,"REG_ARRY_OUT_1")
#pragma DATA_SECTION(F_ccrCE,"REG_ARRY_OUT_2")
#pragma DATA_SECTION(F_ccrCount,"REG_ARRY_OUT_3")
#pragma DATA_SECTION(F_ccrPhase,"REG_ARRY_OUT_4")
#pragma DATA_SECTION(F_ccrPD,"REG_ARRY_OUT_5")
#pragma DATA_SECTION(F_intTime,"REG_ARRY_OUT_6")
#pragma DATA_SECTION(F_detTime,"REG_ARRY_OUT_7")
#pragma DATA_SECTION(F_softTrip,"REG_ARRY_OUT_8")
#pragma DATA_SECTION(F_adDelay,"REG_ARRY_OUT_9")
#pragma DATA_SECTION(F_calPwm,"REG_ARRY_OUT_a")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_b")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_c")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_d")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_e")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_f")
#pragma DATA_SECTION(F_fAdcStart,"REG_ARRY_OUT_10")
#pragma DATA_SECTION(F_hwGbH1,"REG_ARRY_OUT_11")
#pragma DATA_SECTION(F_hwGbH2,"REG_ARRY_OUT_12")
#pragma DATA_SECTION(F_hwGbH3,"REG_ARRY_OUT_13")
#pragma DATA_SECTION(F_hwGbH4,"REG_ARRY_OUT_14")
#pragma DATA_SECTION(F_hwGbL1,"REG_ARRY_OUT_15")
#pragma DATA_SECTION(F_hwGbL2,"REG_ARRY_OUT_16")
#pragma DATA_SECTION(F_hwGbL3,"REG_ARRY_OUT_17")
#pragma DATA_SECTION(F_hwGbL4,"REG_ARRY_OUT_18")
#pragma DATA_SECTION(F_hwGbQual1,"REG_ARRY_OUT_19")
#pragma DATA_SECTION(F_hwGbQual2,"REG_ARRY_OUT_1a")
#pragma DATA_SECTION(F_hwGbQual3,"REG_ARRY_OUT_1b")
#pragma DATA_SECTION(F_hwGbQual4,"REG_ARRY_OUT_1c")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_1d")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_1e")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_1f")
#pragma DATA_SECTION(F_dutyRefU1,"REG_ARRY_OUT_20")
#pragma DATA_SECTION(F_dutyRefV1,"REG_ARRY_OUT_21")
#pragma DATA_SECTION(F_dutyRefW1,"REG_ARRY_OUT_22")
//#pragma DATA_SECTION(NODATA"REG_ARRY_OUT_23")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_24")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_25")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_26")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_27")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_28")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_29")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_2a")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_2b")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_2c")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_2d")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_2e")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_2f")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_30")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_31")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_32")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_33")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_34")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_35")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_36")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_37")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_38")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_39")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_3a")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_3b")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_3c")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_3d")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_3e")
//#pragma DATA_SECTION(NODATA,"REG_ARRY_OUT_3f")

#pragma DATA_SECTION(F_rSprCode,"REG_MAPPED_PORT_40")
#pragma DATA_SECTION(F_adCT11,"REG_MAPPED_PORT_41")
//#pragma DATA_SECTION(NODATA,"REG_MAPPED_PORT_42")
//#pragma DATA_SECTION(NODATA,"REG_MAPPED_PORT_43")
//#pragma DATA_SECTION(NODATA,"REG_MAPPED_PORT_44")
#pragma DATA_SECTION(F_testRead,"REG_MAPPED_PORT_45")
//#pragma DATA_SECTION(NODATA,"REG_MAPPED_PORT_46")
#pragma DATA_SECTION(F_fpgaGbRd,"REG_MAPPED_PORT_47")
#pragma DATA_SECTION(F_fpgaTTripRd,"REG_MAPPED_PORT_48")
//#pragma DATA_SECTION(NODATA,"REG_MAPPED_PORT_49")
//#pragma DATA_SECTION(NODATA,"REG_MAPPED_PORT_4a")
//#pragma DATA_SECTION(NODATA,"REG_MAPPED_PORT_4b")
//#pragma DATA_SECTION(NODATA,"REG_MAPPED_PORT_4c")
//#pragma DATA_SECTION(NODATA,"REG_MAPPED_PORT_4d")
//#pragma DATA_SECTION(NODATA,"REG_MAPPED_PORT_4e")
//#pragma DATA_SECTION(NODATA,"REG_MAPPED_PORT_4f")
