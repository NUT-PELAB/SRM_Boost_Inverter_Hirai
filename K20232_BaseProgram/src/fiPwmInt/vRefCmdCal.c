/*
 * VRefCmdCal.c
 *
 *  Created on: 2016/11/17
 *      Author: ohnuma
 */
#include "vRefCmdCal.h"
#include "iock.h"
#include <math.h>

f4 f4g_vuRef0, f4g_vvRef0, f4g_vwRef0;

f4 f4g_dutyRef;
f4 f4g_outFrq;
f4 f4_outTheta, f4_outTheta0;
f4 f4g_vf, f4g_fRefAbs, f4g_fRef, f4g_vfRef, f4g_fcmd;
f4 f4_vBst, f4_df, f4_fdec;

f4 f4_kStab,f4_kHpf1,f4_kHpf2,f4_iqMin,f4_iqMax,f4_iqDet,f4_iqHpf,f4_iqHpfD1,f4_iqStab,f4_iqStabOut;

void vRefCmdCal()
{
    thetaCal();
    //f4g_dutyRef = LIMIT_f4(f4g_dutyRef,0.0,1.0);    //リミット処理
    f4g_vuRef0 = f4g_dutyRef * __sin(f4_outTheta);
    //f4g_vvRef0 = f4g_dutyRef * __sin((f4_outTheta - 2.0943951));
    //f4g_vwRef0 = f4g_dutyRef * __sin((f4_outTheta + 2.0943951));
}

static void thetaCal()
{
    //位相計算
    f4_outTheta = f4_outTheta0 + (INT_PER * PI(2) * f4g_outFrq);
    if (f4_outTheta > (f4) (2 * 3.1415926))
    {
        f4_outTheta = f4_outTheta - (f4) (2 * 3.1415926);
    }
    f4_outTheta0 = f4_outTheta;
}

void vfStabControl(f4 iqdet, f4 kStab)
{
    //有効電流フィードバックを用いた安定化制御
    f4_kStab = kStab;                                        //ダンピングゲイン
    f4_iqHpf = f4_kHpf1 * (iqdet - f4_iqDet) + f4_kHpf2 * f4_iqHpfD1; //z変換による1次遅れ系のhpfに変更(相一次変換を使用)
    f4_iqStab = f4_kStab * f4_iqHpf;                                //ダンピング制御
    f4_iqDet = iqdet;                                     //ハイパスフィルタ入力値の前回値を更新
    f4_iqHpfD1 = f4_iqHpf;                                     //ハイパスフィルタ出力値の前回値を更新

    //符号処理
    if (f4g_fRef >= 0){f4_iqStabOut = f4_iqStab;}
    else if (f4g_fRef < 0){f4_iqStabOut = -f4_iqStab;}

    //リミット処理
    LIMIT_f4(f4_iqStabOut, f4_iqMin, f4_iqMax);
    f4g_fRef = f4_fdec - f4_iqStabOut;
}

void vfControl()
{
    //電圧振幅計算
    if (f4g_fRefAbs <= 1.0)
    {   //周波数指令が正の時は正転，負の時は逆転
        if (f4g_fRef > 0.0)
        {
            f4g_vfRef = f4g_vf * (1.0 - f4_vBst) * f4g_fRef + f4_vBst;      //正転
        }
        else
        {
            f4g_vfRef = f4g_vf * (-1.0 + f4_vBst) * -f4g_fRef - f4_vBst;    //逆転
        }
    }
    else
    {               //リミット処理
        if (f4g_fRef > 0.0)
        {
            f4g_vfRef = 1.0;
        }
        else
        {
            f4g_vfRef = -1.0;
        }
    }

    LIMIT_f4(f4g_vfRef, -1.0, 1.0);

}
//使う場合iock.cのu2g_sw1の処理を変更する
void fRamp()
{
    /* 停止時 */
    if (s2g_frSgn == 0)
    {
        //減速処理(ランプ変化)
        if (f4_fdec > f4_df)
        {
            f4_fdec -= f4_df;
        }
        else if (f4_fdec < -f4_df)
        {
            f4_fdec += f4_df;
        }
        else
        {
            f4_fdec = 0;
        }
    }

    /* 正転 */
    else if (s2g_frSgn == 1)
    {
        /* 出力が入力より小さい(ランプ変化) */
        if (f4_fdec <= f4g_fcmd)
        {
            f4_fdec += f4_df;
        }
        /* 出力が入力より大きい(ランプ変化) */
        else if (f4g_fcmd <= f4_fdec - f4_df)
        {
            f4_fdec -= f4_df;
        }
    }

    /* 逆転 */
    else if (s2g_frSgn == -1)
    {
        /* 出力が入力より大きいとき */
        if (-f4g_fcmd <= f4_fdec)
        {
            f4_fdec -= f4_df;
        }
        /* 出力が入力より小さいとき */
        else if (f4_fdec + f4_df <= -f4g_fcmd)
        {
            f4_fdec += f4_df;
        }
    }
    if (f4_fdec == 0)
    {
        u2g_fOutput = 0;    //出力無し,PWMOFF
    }
    else
    {
        u2g_fOutput = 1;    //出力有り,PWMON
    }

    f4g_fRef = f4_fdec;   //周波数指令今回値を前回値に
    f4g_fRefAbs = ABS(f4g_fRef);

}

void vRefCmdCalInit()
{
    f4g_dutyRef = 0.0;
    f4g_outFrq = (f4) 50;
    f4_vBst = 0.05 / 0.866;   //ブースト電圧(MC時)
    f4g_vf = 1.0;   //ｖ/ｆ比
    f4g_fRefAbs = 0.0;   //周波数指令絶対値
    f4g_fRef = 1.0;   //出力周波数
    f4g_vfRef = 0.0;   //出力指令振幅
    f4_df = 6.0 * 1e-6;   //周波数指令変化分
    f4g_fcmd = 0.0;          //周波数指令
    f4_fdec = 0.0;          //周波数指令
//安定化制御
    f4_kStab = 0.001;//
    f4_kHpf1 = 0.9996074551;//双一次変換(2/(2+Tsamp*2*pi*fhpf))キャリア16kHz，カットオフ2Hzで設計
    f4_kHpf2 = 0.993736512624778000000;//双一次変換((2-2*pi*fhpf*Tsmap)/(2+Tsamp*2*pi*fhpf))キャリア16kHz，カットオフ2Hzで設計
    f4_iqMin = -0.05;//ダンピングリミット(1%リミット)
    f4_iqMax = 0.05;//ダンピングリミット(1%リミット)
    f4_iqDet = 0.0;
    f4_iqHpf = 0.0;
    f4_iqHpfD1 = 0.0;
    f4_iqStab = 0.0;
    f4_iqStabOut = 0.0;
}

