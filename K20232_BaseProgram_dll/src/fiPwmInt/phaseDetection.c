/*
 * phaseDetection.c
 *
 *  Created on: 2021/11/16
 *      Author: itoh85
 */
//USPMƒRƒ“ƒgƒ[ƒ‰‚©‚çˆÚA
#include "phaseDetection.h"

void ResetSOGI(tParamSOGI *pParam){
    pParam->X2Z1  = 0;
    pParam->W_FLL_Z1  = 0;
    pParam->VaZ1  = 0;
    pParam->VbZ1  = 0;
    pParam->WrefZ1  = 0;
}

void InitSOGI(tParamSOGI *pParam, f4 tsamp, f4 fac, f4 vn, f4 tsfll, f4 tsqsg) {
    pParam->Tsamp = tsamp;
    pParam->Fac = fac;
    pParam->Vn = vn;
    pParam->TsFLL = tsfll;
    pParam->TsQSG = tsqsg;
    pParam->CalcConst[0] = 9.2 * DPI2 / (tsqsg * fac) * tsamp; //K_QSGs*tsamp
    pParam->CalcConst[1] = 4.6 * 9.2 / (vn * vn * tsfll * tsqsg) * tsamp; //K_FLL*tsamp
    ResetSOGI(pParam);
}

void CalcSOGI(tParamSOGI *pParam, f4 uref) {
//QSG
    pParam->Udiff = uref - pParam->VaZ1;
    pParam->Va = (pParam->Udiff * pParam->CalcConst[0] - pParam->Tsamp * pParam->VbZ1)
            * pParam->WrefZ1 + pParam->VaZ1;
    pParam->X2 = pParam->Tsamp * pParam->Va + pParam->X2Z1;
    pParam->Vb = pParam->X2 * pParam->WrefZ1;
//FLL
    pParam->W_FLL = -pParam->CalcConst[1] * pParam->Udiff
            * pParam->Vb + pParam->W_FLL_Z1;
    pParam->Wref = pParam->W_FLL + PI(2) * pParam->Fac;

    pParam->X2Z1 = pParam->X2;
    pParam->W_FLL_Z1 = pParam->W_FLL;
    pParam->VaZ1 = pParam->Va;
    pParam->VbZ1 = pParam->Vb;
    pParam->WrefZ1 = pParam->Wref;
}
void ResetPLL(tParamPLL *pParam){
    pParam->WdiffI_Z1  = 0;
    pParam->OutTheta_Z1  = 0;
}

void InitPLL(tParamPLL *pParam , f4 tsamp , f4 fac , f4 vn , f4 tspi){
    pParam->Tsamp = tsamp;
    pParam->Fac = fac;
    pParam->Vn = vn;
    pParam->TsPI = tspi;
    pParam->CalcConst[0] = 9.2 / tspi * DSQRT2 / vn;//K_PI*DSQRT2 / Vn
    pParam->CalcConst[1] = 2.3 * SQRT2 * SQRT2 / tspi * tsamp;//K_Ti*Tsamp
    ResetPLL(pParam);
}

void CalcPLL(tParamPLL *pParam, f4 vd , f4 vq) {
//PLL
    pParam->WdiffI = vd * pParam->CalcConst[1] + pParam->WdiffI_Z1;
    pParam->W_PLL = PI(2) * pParam->Fac + pParam->CalcConst[0] * (vd + pParam->WdiffI);
    pParam->Fout = pParam->W_PLL * DPI2;
    pParam->Vrms = fabsf(pParam->Vq) * DSQRT2;
    pParam->OutTheta = pParam->W_PLL * pParam->Tsamp + pParam->OutTheta_Z1;
    if (pParam->OutTheta > PI(2))
    {
        pParam->OutTheta = pParam->OutTheta - PI(2);
    }

    pParam->WdiffI_Z1 = pParam->WdiffI;
    pParam->OutTheta_Z1 = pParam->OutTheta;
}
