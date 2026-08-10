/*
 * fpga_io.h
 *
 *  Created on: 2016/02/15
 *      Author: ohnuma
 */

#ifndef FPGA_IO_H_
#define FPGA_IO_H_

#include "NLibrary.h"

extern volatile u2     F_sprCode;
extern volatile u2     F_pwmOE;
extern volatile u2     F_ccrCE;
extern volatile u2     F_ccrCount;
extern volatile u2     F_ccrPhase;
extern volatile u2     F_ccrPD;
extern volatile u2     F_intTime;
extern volatile u2     F_detTime;
extern volatile u2     F_softTrip;
extern volatile u2     F_adDelay;

extern volatile u2     F_fAdcStart;
extern volatile u2     F_hwGbH1;
extern volatile u2     F_hwGbH2;
extern volatile u2     F_hwGbH3;
extern volatile u2     F_hwGbH4;
extern volatile u2     F_hwGbL1;
extern volatile u2     F_hwGbL2;
extern volatile u2     F_hwGbL3;
extern volatile u2     F_hwGbL4;
extern volatile u2     F_hwGbQual1;
extern volatile u2     F_hwGbQual2;
extern volatile u2     F_hwGbQual3;
extern volatile u2     F_hwGbQual4;

extern volatile u2     F_dutyRefU1;
extern volatile u2     F_dutyRefV1;
extern volatile u2     F_dutyRefW1;

extern volatile u2     F_rSprCode;
extern volatile u2     F_testRead;
extern volatile u2     F_adCT11;
extern volatile u2     F_adCT12;
extern volatile u2     F_adVT11;
extern volatile u2     F_adVT12;
extern volatile u2     F_fpgaTTripRd;
extern volatile u2     F_calPwm;

#endif /* FPGA_IO_H_ */
