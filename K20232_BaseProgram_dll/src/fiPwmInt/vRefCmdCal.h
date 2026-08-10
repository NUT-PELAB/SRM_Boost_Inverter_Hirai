/*
 * VRefCmdCal.h
 *
 *  Created on: 2016/11/17
 *      Author: ohnuma
 */

#ifndef SRC_FI_PWM_INT_VREFCMDCAL_H_
#define SRC_FI_PWM_INT_VREFCMDCAL_H_

#include "GlobalParameters.h"

static void thetaCal(void);

extern void vRefCmdCal(void);
extern void vRefCmdCalInit(void);
extern void fRamp(void);
extern void vfStabControl(f4 iqdet, f4 kStab);
extern void vfControl(void);

extern f4 f4g_outFrq,f4g_vuRef, f4g_vuRef0, f4g_vvRef0, f4g_vwRef0;
extern f4 f4g_vf,f4g_fRefAbs,f4g_fRef,f4g_vfRef,f4g_fcmd;

#endif /* SRC_FI_PWM_INT_VREFCMDCAL_H_ */
