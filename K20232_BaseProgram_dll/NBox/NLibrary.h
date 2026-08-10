//###########################################################################
//
// FILE:   NLibrary.c
//
// TITLE: NPE library
//
//###########################################################################
// $TI Release: NPE Library ver.1.0 $
// $Release Date: Thu July 21 2020  $
// $Copyright:
// Copyright (C) 2020 Nagaoka Power Electronics Co., Ltd. http://www.npe.co.jp/


#ifndef NLIBRARY_H_
#define NLIBRARY_H_

// 変数の型名定義
typedef     unsigned char   u1;                             // 符号無16ビットデータ (C28 compiler)
typedef     signed   char   s1;                             // 符号付16ビットデータ (C28 compiler)
typedef     unsigned short  u2;                             // 符号無16ビットデータ
typedef     signed   short  s2;                             // 符号付16ビットデータ
typedef     unsigned long   u4;                             // 符号無32ビットデータ
typedef     signed   long   s4;                             // 符号付32ビットデータ
typedef              float  f4;                             // 単精度(32ビット)浮動小数点データ

// 関数
#define DEG360 0x3ff
#define LIMIT(n,min,max)    (((n) > (max)) ? (max) : (((n) < (min)) ? (min) : (n)))
#define PI(n)   (3.14159265358979 * (n))
#define ARCTAN(x)   (x>=0.75)? (0.567588218*x + 0.217809945):(x>=0.50)? (0.719413999*x + 0.103940609):(x>=0.25)? (0.874675783*x + 0.026309717):(0.979914653*x);
// 3つの最大値検出
#define MAX3(u,v,w) (((u)>(v)) ? (((u)>(w)) ? (u):(w)):(((v)>(w)) ? (v):(w)))
// 3つの最小値検出
#define MIN3(u,v,w) (((u)<(v)) ? (((u)<(w)) ? (u):(w)):(((v)<(w)) ? (v):(w)))
// 3つの中間値検出
#define MID3(u,v,w) (((u)>(v)) ? (((u)<(w)) ? (u):(((w)>(v)) ? (w):(v))):(((u)>(w)) ? (u):(((w)>(v)) ? (v):(w))))
#define ABS(n)      ((n) < (0) ? (-n) : (n))

static inline s4 LIMIT_s4(s4 n, s4 min, s4 max){
    if(n < min){
        n = min;
    }else if (n > max){
        n = max;
    }else{
        ;
    }
    return n;
}

static inline f4 LIMIT_f4(f4 n, f4 min, f4 max){
    if(n < min){
        n = min;
    }else if (n > max){
        n = max;
    }else{
        ;
    }
    return n;
}
//座標変換を追加_20211116_yamanokuchi

#define DPI         0.318309886
#define DPI2        0.159154943
#define SQRT2       1.41421356
#define SQRT3       1.73205081
#define DSQRT2      0.707106781
#define DSQRT3      0.577350269
#define SQRT3D2 0.866025404//sqrt(3)/2
#define SQRT2D3     0.816496581//sqrt(2/3)
#define D2_3        0.666666667//2/3

#define UVW_AB_ABS(_U_, _V_, _W_, _A_, _B_)     (_A_) = SQRT2D3*((_U_) - 0.5*((_V_) + (_W_));\
                                                (_B_) = SQRT2D3*SQRT3D2*((_V_) - (_W_)

#define UVW_AB_REL(_U_, _V_, _W_, _A_, _B_)     (_A_) = D2_3*((_U_) - 0.5*((_V_) + (_W_));\
                                                (_B_) = D2_3*SQRT3D2*((_V_) - (_W_)


#define AB_UVW_ABS(_A_, _B_, _U_, _V_, _W_)     (_U_) = SQRT2D3*(_A_);\
                                                (_V_) = SQRT2D3*(-0.5*(_A_) + SQRT3D2*(_B_));\
                                                (_W_) = SQRT2D3*(-0.5*(_A_) - SQRT3D2*(_B_))

#define AB_UVW_REL(_A_, _B_, _U_, _V_, _W_)     (_U_) = (_A_);\
                                                (_V_) = (-0.5*(_A_) + SQRT3D2*(_B_));\
                                                (_W_) = (-0.5*(_A_) - SQRT3D2*(_B_))

#define AB_DQ(_A_ , _B_ , _D_ , _Q_ , _THETA_)      (_D_) =  __cos(_THETA_)*(_A_) + __sin(_THETA_)*(_B_);\
                                                    (_Q_) = -__sin(_THETA_)*(_A_) + __cos(_THETA_)*(_B_)

#define DQ_AB(_D_ , _Q_ , _A_ , _B_ , _THETA_)      (_A_) =  __cos(_THETA_)*(_D_) - __sin(_THETA_)*(_Q_);\

#ifdef CPU1

// Include TI header files
#include "F28x_Project.h"
#include "driverlib.h"
#include "device.h"

// Include NLibrary header files
#include <K17100_K20232_ioFunction.h>
#include <K20232_cmpFunction.h>
#include "K17100_dacFunction.h"
#include "ePwmFunction.h"

#endif

#endif /* NLIBRARY_H_ */
