/*
 * controller.c
 *
 *  Created on: 2021/11/16
 *      Author: itoh85
 */

#include "controller.h"

//PI§Œä
void InitPI(tParamPI *pParam, f4 tsamp, f4 kp, f4 ki, f4 saturation_max, f4 saturation_min){
    pParam->Kp = kp;
    pParam->Ki = ki * tsamp;
    pParam->Saturation_Max = saturation_max;
    pParam->Saturation_Min = saturation_min;

    ResetPI(pParam);
}
void CalcPI(tParamPI *pParam, f4 uref, f4 udet) {
            pParam->Yi = pParam->Yi + pParam->Ki *  (uref - udet);
            pParam->Y = pParam->Kp * (uref-udet) + pParam->Yi;

            if(pParam->Y > pParam->Saturation_Max || pParam->Y < pParam->Saturation_Min) {
                pParam->Yi = pParam->Yi - pParam->Ki * (uref - udet);
                pParam->Y = pParam->Kp * (uref-udet) + pParam->Yi;
            }
}
