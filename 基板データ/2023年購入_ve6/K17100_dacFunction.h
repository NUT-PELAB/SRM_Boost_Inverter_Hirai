//###########################################################################
//
// FILE:   K17100_dacFunction.h
//
// TITLE: DAC function to use k17100 board
//
//###########################################################################
// $TI Release: NPE Library ver.1.0 $
// $Release Date: Thu July 21 2020  $
// $Copyright:
// Copyright (C) 2020 Nagaoka Power Electronics Co., Ltd. http://www.npe.co.jp/

#ifndef K17100_DACFUNCTION_H_
#define K17100_DACFUNCTION_H_

#include "NLibrary.h"

#define DA0 0x300000
#define DA0 0x300000
#define DA1 0x310000
#define DA2 0x320000
#define DA3 0x330000

//FIFOにTxを代入する間，PWM割り込みが入ると送信が途切れる
//driverlibからSPI_pollingFIFOTransaction()をコピペして，Txを代入する間だけ割り込み禁止にした
//関数内部で呼び出されるため，親の関数(SPI_transmit24Bits)も変更した
extern void
NBox_SPI_transmit24Bits(uint32_t base, uint32_t data, uint16_t txDelay);

extern void
NBox_SPI_pollingFIFOTransaction(uint32_t base, uint16_t charLength,
                           uint16_t *pTxBuffer, uint16_t *pRxBuffer,
                           uint16_t numOfWords, uint16_t txDelay);

static inline void
N_DACABCf4(u4 base, f4 f4_dadata)
{
    f4  f4_daVal;
    f4_daVal = (f4)(f4_dadata * 2048.0f + 2048.0f);
    f4  f4_cast;

    f4_cast = LIMIT_f4(f4_daVal,0.0f,4095.0f);
    DAC_setShadowValue(base, (u2)f4_cast);
    //DAC_setShadowValue(base, (u2)(LIMIT(f4_daVal,0.0,4095.0)));
}

static inline void
N_DaSPIf4 (u4 addres, f4 f4_dadata)
{
    f4  f4_daVal;
    u2  u2_transcode;
    f4  f4_cast;
    f4_daVal = (f4)(f4_dadata * 2048.0f + 2048.0f);
    f4_cast = LIMIT(f4_daVal,0.0f,4095.0f);
    u2_transcode = (u2)f4_cast;

    NBox_SPI_transmit24Bits(SPIA_BASE, addres | (u2_transcode << 4), 0);
}

extern void N_ConfigDACABC(u4 base);

extern void N_ConfigDACSPI (void);


#endif /* K17100_DACFUNCTION_H_ */
