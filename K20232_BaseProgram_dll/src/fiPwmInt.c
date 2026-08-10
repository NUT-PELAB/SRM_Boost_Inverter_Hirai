//###########################################################################
//
// FILE:  fiPwmInt.c
//
// TITLE: PWM Interrupt
//
//###########################################################################
// $TI Release: K17100 Base program ver.1.0 $
// $Release Date: Thu July 21 2020  $
// $Copyright:
// Copyright (C) 2020 Nagaoka Power Electronics Co., Ltd. http://www.npe.co.jp/

#include "fiPwmInt.h"
#include "fpga_io.h"
#include "math.h"

#include "adDetection.h"
#include "pwmProtection.h"
#include "vRefCmdCal.h"
#include "sequenceCtl.h"
#include "fiIPCInt.h"
#include "controller.h"
#include "phaseDetection.h"

#if 0           //回路ベースで書きたい人はどうぞ
>>>>>>> branch 'FPEG3_test_yamanokuchi1' of https://github.com/NUT-PELAB/F20069_PM2084_K20232_baseCode
#define f4g_vacDet f4g_v1Det;
#define f4g_vdcDet f4g_v2Det;
#define f4g_iacDet f4g_i1Det;
#endif

#define VDCN        (f4)200.0       //直中間定格電圧
#define VDCN_PER    ((f4)1.0/VDCN)  //直中間定格電圧の逆数
#define VACN        (f4)100.0       //直中間定格電圧(実効値)

tParamPI tg_ACR;
tParamSOGI tg_SOGI1;
tParamPLL tg_PLL1;
f4 f4g_dutyRef0;
f4 f4_kpAcr;
f4 f4_kiAcr;
f4 f4_tsFLL;
f4 f4_tsQSG;
f4 f4_tsPI;

void fiPwmInt()
{
    F_calPwm = 1;
    adDet();
    pwmProtection();
    if (s4g_IndError != 0)
    {
        N_DSP_SOFT_TRIP__SET();  // Low(0) = Error
        N_ALL_PWM_OFF();
    }
//PLL処理_単相の場合(三相の場合はSOGIをαβ変換に変える)
    CalcSOGI(&tg_SOGI1, f4g_v1Det);
    AB_DQ(tg_SOGI1.Va, tg_SOGI1.Vb, tg_PLL1.Vd, tg_PLL1.Vq, tg_PLL1.OutTheta);
    CalcPLL(&tg_PLL1, tg_PLL1.Vd, tg_PLL1.Vq);

    if (F_pwmOE)
    {
        vRefCmdCal();
        CalcPI(&tg_ACR, f4g_vuRef0, f4g_i1Det);
        f4g_dutyRef0 = tg_ACR.Y / f4g_v2Det;
//        f4g_dutyRef0 = tg_ACR.Y * VDCN_PER;

        f4g_dutyRef0 = LIMIT_f4((f4g_dutyRef0 * 0.5 + 0.5), 0.0, 1.0); //フォーマット変換(-1~1⇒0~1)とリミット処理
//    f4g_dutyRef1 = LIMIT_f4((f4g_dutyRef1 * 0.5 + 0.5), 0.0, 1.0);
//    f4g_dutyRef2 = LIMIT_f4((f4g_dutyRef2 * 0.5 + 0.5), 0.0, 1.0);
        F_dutyRefU1 = (u2) ((int) (f4g_dutyRef0 * (float) FPGA_CAPK));
        F_dutyRefV1 = (u2) ((int) (f4g_dutyRef0 * (float) FPGA_CAPK)); //インバータ_ユニポーラ駆動のために同じ指令値を代入(FPGAでユニポーラにする)
//    F_dutyRefW1 = (u2) ((int) (f4g_vuRef2 * (float) FPGA_CAPK));

    }
    else
    {
        ResetPI(&tg_ACR);
        F_dutyRefU1 = (u2) ((int) (0.0 * (float) FPGA_CAPK));
        F_dutyRefV1 = (u2) ((int) (0.0 * (float) FPGA_CAPK));
//    F_dutyRefW1 = (u2) ((int) ( 0.0 * (float) FPGA_CAPK));
    }
    F_ccrCount = (u2) FPGA_CAPK;
    F_detTime = (u2) FPGA_DEADT;
//ADコンバータ(AO出力)(CN29)
//    N_DACABCf4(DACA_BASE, f4g_v1Det*0.0025);//(-1~1)(0V~1.5V~3V，-X~0~X)0.0025は1/X
//    N_DACABCf4(DACB_BASE, 0);//(-1~1)(0V~1.5V~3V，-X~0~X)0.0025は1/X
//    N_DACABCf4(DACC_BASE, 0);//(-1~1)(0V~1.5V~3V，-X~0~X)0.0025は1/X
    F_calPwm = 0;
}

void fiPwmIntInit()
{
    adDetInit();
    pwmProtectionInit();
    vRefCmdCalInit();
    N_ConfigDACABC(DACA_BASE);
    N_ConfigDACABC(DACB_BASE);
    N_ConfigDACABC(DACC_BASE);

    f4_kpAcr = 2 * 0.707 * PI(2) * 2e3* 300.0e-6; //fc=2kHz_zeta=sqrt(2)/2_300uH_連続系Kp=2*zeta*w*L
    f4_kiAcr = PI(2) * PI(2) * 2e3 * 2e3 * 300.0e-6; //fc=2kHz_連続系Ki=Kp/Ti=L*w^2

    f4_tsFLL = 800e-3;
    f4_tsQSG = 800e-3;
    f4_tsPI = 1e-3;

    InitPI(&tg_ACR, INT_PER, f4_kpAcr, f4_kiAcr, VDCN, -VDCN);

    InitSOGI(&tg_SOGI1, INT_PER , f4g_outFrq , VACN , f4_tsFLL , f4_tsQSG);
    InitPLL(&tg_PLL1, INT_PER , f4g_outFrq , VACN , f4_tsPI);

    f4g_dutyRef0 = 0;

    F_sprCode = (u2) 0x579a;
    F_softTrip = (u2) 1;    //Low active
    F_detTime = (u2) FPGA_DEADT;
    F_ccrCount = (u2) FPGA_CAPK;
    // F_ccrCE = (u2) 1; // moved to sequenceInit to apply phase shift (this signal is reset for phase shift)by yasuda@2022/02/09
    F_intTime = (u2) INT_COUNT;
    F_pwmOE = (u2) 0;
    F_adDelay = (u2) 0;

}
