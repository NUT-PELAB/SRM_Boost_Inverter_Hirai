/*
 * iock.c
 *
 *  Created on: 2016/10/17
 *      Author: ohnuma
 */

#include "iock.h"

void iock(void);
void iockInit(void);

u2  u2g_sw1,u2g_sw2,u2g_sw3,u2g_sw4;
s2  s2g_frSgn;
u2  u2g_fOutput;

void iock(void){
//	u2g_sw1 = N_DI1_STATE & u2g_fOutput;	//基板上のSW1 運転開始
    u2g_sw1 = N_DI1_STATE;                  //基板上のSW1 運転開始
	u2g_sw2 = N_DI2_STATE;	                //基板上のSW2 逆転
	u2g_sw3 = N_DI3_STATE;	                //基板上のSW3
	u2g_sw4 = N_DI4_STATE^ 0x01;            //基板上のSW4 エラー解除ボタン
    s2g_frSgn = u2g_sw1 - u2g_sw2;          //fwd,rev判定(1:FWD,0:STOP,-1:REV)
}

void iockInit(void){
	u2g_sw1 = 0;
	u2g_sw2 = 0;
	u2g_sw3 = 0;
	u2g_sw4 = 0;
	s2g_frSgn = 0;
}
