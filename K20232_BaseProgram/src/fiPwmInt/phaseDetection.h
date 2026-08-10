/*
 * phaseDetection.h
 *
 *  Created on: 2021/11/16
 *      Author: itoh85
 */

#ifndef SRC_FIPWMINT_PHASEDETECTION_H_
#define SRC_FIPWMINT_PHASEDETECTION_H_
//USPMÉRÉìÉgÉçÅ[ÉâÇ©ÇÁà⁄êA
#include "GlobalParameters.h"

typedef struct {
    f4 Tsamp;
    f4 Fac;
    f4 Vn;
    f4 TsFLL;
    f4 TsQSG;
    f4 CalcConst[2];
    f4 X2;
    f4 fFLL;
    f4 Udiff;
    f4 W_FLL;
    f4 Wref;
    f4 W_FLL_Z1;
    f4 VaZ1;
    f4 VbZ1;
    f4 WrefZ1;
    f4 X2Z1;
    f4 Va;
    f4 Vb;
} tParamSOGI;

typedef struct {
    f4 Tsamp;
    f4 Fac;
    f4 Vn;
    f4 TsPI;
    f4 CalcConst[2];
    f4 OutTheta;
    f4 W_PLL;
    f4 WdiffI;
    f4 WdiffI_Z1;
    f4 OutTheta_Z1;
    f4 Fout;
    f4 Vq;
    f4 Vd;
    f4 Vrms;
} tParamPLL;


extern void ResetSOGI(tParamSOGI *pParam);
extern void InitSOGI(tParamSOGI *pParam , f4 tsamp , f4 fac , f4 vn , f4 tsfll , f4 tsqsg);
extern void CalcSOGI(tParamSOGI *pParam, f4 uref);
extern void ResetPLL(tParamPLL *pParam);
extern void InitPLL(tParamPLL *pParam , f4 tsamp , f4 fac , f4 vn , f4 tspi);
extern void CalcPLL(tParamPLL *pParam, f4 vd , f4 vq);



#endif /* SRC_FIPWMINT_PHASEDETECTION_H_ */
