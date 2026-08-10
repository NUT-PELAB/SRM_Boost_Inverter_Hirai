/*
 * controller.h
 *
 *  Created on: 2021/11/16
 *      Author: itoh85
 */

#ifndef SRC_FIPWMINT_CONTROLLER_H_
#define SRC_FIPWMINT_CONTROLLER_H_

#include "GlobalParameters.h"

//PI制御_後退差分
typedef struct
{
    f4 Kp;
    f4 Ki;
    f4 Saturation_Max;             //アンチワインドアップ出力最大値
    f4 Saturation_Min;             //アンチワインドアップ出力最小値
    f4 Yi;
    f4 Y;
} tParamPI;

#define ResetPI(handle)   (handle)->Y  = 0;\
                                (handle)->Yi  = 0

extern void CalcPI(tParamPI *pParam, f4 uref, f4 udet);

extern void InitPI(tParamPI *pParam, f4 tsamp, f4 kp, f4 ki, f4 saturation_max,
                   f4 saturation_min);

#endif /* SRC_FIPWMINT_CONTROLLER_H_ */
