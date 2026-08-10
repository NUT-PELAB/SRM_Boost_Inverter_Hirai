//###########################################################################
//
// FILE:   configuration.c
//
// TITLE: configuration f28379d device
//
//###########################################################################
// $TI Release: K17100 Base program ver.1.0 $
// $Release Date: Thu July 21 2020  $
// $Copyright:
// Copyright (C) 2020 Nagaoka Power Electronics Co., Ltd. http://www.npe.co.jp/



#include "Configuration.h"


//
// configCPUTimer - This function initializes the selected timer to the
// period specified by the "freq" and "period" parameters. The "freq" is
// entered as Hz and the period in uSeconds. The timer is held in the stopped
// state after configuration.
//
void configCPUTimer(uint32_t cpuTimer, float freq, float period){
    uint32_t temp;
    f4  f4_cast;

    f4_cast = freq / 1000000 * period;
    temp = (uint32_t)f4_cast;
    //temp = (uint32_t)(freq / 1000000 * period);     // Initialize timer period:
    CPUTimer_setPeriod(cpuTimer, temp);
    CPUTimer_setPreScaler(cpuTimer, 0);             // Set pre-scale counter to divide by 1 (SYSCLKOUT):
    // Initializes timer control register. The timer is stopped, reloaded,
    // free run disabled, and interrupt enabled.
    // Additionally, the free and soft bits are set
    CPUTimer_stopTimer(cpuTimer);
    CPUTimer_reloadTimerCounter(cpuTimer);
    CPUTimer_setEmulationMode(cpuTimer,CPUTIMER_EMULATIONMODE_STOPAFTERNEXTDECREMENT);
    CPUTimer_enableInterrupt(cpuTimer);
    CPUTimer_startTimer(cpuTimer);
}

void configGPIO(void)
{
    u4 pin;
    // LED
    GPIO_setPinConfig(GPIO_0_GPIO0);                // GPIO0 = LED1
    GPIO_setDirectionMode(0, GPIO_DIR_MODE_OUT);    // GPIO0 = output
    GPIO_writePin(0, 0);                            // output low (LED ON)
    GPIO_setPinConfig(GPIO_1_GPIO1);                // GPIO1 = LED2
    GPIO_setDirectionMode(1, GPIO_DIR_MODE_OUT);    // GPIO1 = output
    GPIO_writePin(1, 0);                            // output low (LED ON)
    GPIO_setPinConfig(GPIO_2_GPIO2);                // GPIO2 = LED3
    GPIO_setDirectionMode(2, GPIO_DIR_MODE_OUT);    // GPIO2 = output
    GPIO_writePin(2, 0);                            // output low (LED ON)
    GPIO_setPinConfig(GPIO_3_GPIO3);                // GPIO3 = LED4
    GPIO_setDirectionMode(3, GPIO_DIR_MODE_OUT);    // GPIO3 = output
    GPIO_writePin(3, 0);                            // output low (LED ON)
    // DOUT
    GPIO_setPinConfig(GPIO_4_GPIO4);                // GPIO4 = DOUT5
    GPIO_setDirectionMode(4, GPIO_DIR_MODE_OUT);    // GPIO4 = output
    GPIO_writePin(4, 0);                            // output low
    GPIO_setPinConfig(GPIO_5_GPIO5);                // GPIO5 = DOUT6
    GPIO_setDirectionMode(5, GPIO_DIR_MODE_OUT);    // GPIO5 = output
    GPIO_writePin(5, 0);                            // output low
    //FPGA_IO
    GPIO_setPinConfig(GPIO_6_OUTPUTXBAR4);          // GPIO6 = EXTSYNCOUT
    GPIO_setDirectionMode(6, GPIO_DIR_MODE_OUT);    // GPIO6 = output
    GPIO_writePin(6, 0);                            // output low
    GPIO_setPinConfig(GPIO_7_OUTPUTXBAR5);          // GPIO7 = DSP_TRIP_
    GPIO_setDirectionMode(7, GPIO_DIR_MODE_OUT);    // GPIO7 = output
    GPIO_writePin(7, 0);                            // output low
    // DOUT
    GPIO_setPinConfig(GPIO_8_GPIO8);                // GPIO8 = DOUT7
    GPIO_setDirectionMode(8, GPIO_DIR_MODE_OUT);    // GPIO8 = output
    GPIO_writePin(8, 0);                            // output low
    GPIO_setPinConfig(GPIO_9_GPIO9);                // GPIO9 = DOUT8
    GPIO_setDirectionMode(9, GPIO_DIR_MODE_OUT);    // GPIO9 = output
    GPIO_writePin(9, 0);                            // output low
    // Enable EQEP1 on GPIO10 - GPIO13
    GPIO_setPinConfig(GPIO_10_EQEP1A);              // GPIO10 = EQEP1A
    GPIO_setPinConfig(GPIO_11_EQEP1B);              // GPIO11 = EQEP1B
    GPIO_setPinConfig(GPIO_12_EQEP1S);              // GPIO12 = EQEP1S
    GPIO_setPinConfig(GPIO_13_EQEP1I);              // GPIO13 = EQEP1I
    GPIO_setPadConfig(10, GPIO_PIN_TYPE_PULLUP);    // Enable pullup on GPIO10
    GPIO_setPadConfig(11, GPIO_PIN_TYPE_PULLUP);    // Enable pullup on GPIO11
    GPIO_setPadConfig(12, GPIO_PIN_TYPE_PULLUP);    // Enable pullup on GPIO12
    GPIO_setPadConfig(13, GPIO_PIN_TYPE_PULLUP);    // Enable pullup on GPIO13
    GPIO_setQualificationMode(10, GPIO_QUAL_SYNC);  // Synch to SYSCLKOUT
    GPIO_setQualificationMode(11, GPIO_QUAL_SYNC);  // Synch to SYSCLKOUT
    GPIO_setQualificationMode(12, GPIO_QUAL_SYNC);  // Synch to SYSCLKOUT
    GPIO_setQualificationMode(13, GPIO_QUAL_SYNC);  // Synch to SYSCLKOUT
    GPIO_setPinConfig(GPIO_14_GPIO14);              // GPIO14 = CAOP1
    GPIO_setDirectionMode(14, GPIO_DIR_MODE_IN);    // GPIO14 = input
    GPIO_setPadConfig(14, GPIO_PIN_TYPE_PULLUP);    // Enable pullup on GPIO14
    GPIO_setPinConfig(GPIO_15_GPIO15);              // GPIO15 = CAOP2
    GPIO_setDirectionMode(15, GPIO_DIR_MODE_IN);    // GPIO15 = input
    GPIO_setPadConfig(15, GPIO_PIN_TYPE_PULLUP);    // Enable pullup on GPIO15
    // Enable CAN-B on GPIO16 - GPIO17
    GPIO_setPinConfig(GPIO_16_CANTXB);               // GPIO16 = CANTXB
    GPIO_setPinConfig(GPIO_17_CANRXB);               // GPIO17 = CANRXB
    GPIO_setPadConfig(16, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO16
    GPIO_setPadConfig(17, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO17
    GPIO_setQualificationMode(17, GPIO_QUAL_ASYNC);  // asynch input
    // Enable SCI-B on GPIO18 - GPIO19
    GPIO_setPinConfig(GPIO_18_SCITXDB);             // GPIO18 = SCITXDB
    GPIO_setPinConfig(GPIO_19_SCIRXDB);             // GPIO19 = SCIRXDB
    GPIO_setPadConfig(18, GPIO_PIN_TYPE_PULLUP);    // Enable pullup on GPIO18
    GPIO_setPadConfig(19, GPIO_PIN_TYPE_PULLUP);    // Enable pullup on GPIO19
    GPIO_setQualificationMode(19, GPIO_QUAL_ASYNC); // asynch input
    // DNC
    for (pin = 20; pin <= 23; pin++){
        GPIO_setDirectionMode(pin, GPIO_DIR_MODE_OUT);
        GPIO_writePin(pin, 0);                            // output low
    }
    // Enable SPI-B on GPIO24 - GPIO27
    GPIO_setPinConfig(GPIO_24_SPISIMOB);            // GPIO24 = SPISIMOB
    GPIO_setPinConfig(GPIO_25_SPISOMIB);            // GPIO25 = SPISOMIB
    GPIO_setPinConfig(GPIO_26_SPICLKB);             // GPIO26 = SPICLK
    GPIO_setPinConfig(GPIO_27_SPISTEB);             // GPIO27 = SPISTEB
    GPIO_setPadConfig(24, GPIO_PIN_TYPE_PULLUP);    // Pullup on GPIO24 (SPISIMOB)
    GPIO_setPadConfig(25, GPIO_PIN_TYPE_PULLUP);    // Pullup on GPIO25 (SPISOMIB)
    GPIO_setPadConfig(26, GPIO_PIN_TYPE_PULLUP);    // Pullup on GPIO22 (SPICLKB)
    GPIO_setPadConfig(27, GPIO_PIN_TYPE_PULLUP);    // Pullup on GPIO27 (SPISTEB)
    GPIO_setQualificationMode(24, GPIO_QUAL_ASYNC); // asynch input
    GPIO_setQualificationMode(25, GPIO_QUAL_ASYNC); // asynch input
    GPIO_setQualificationMode(26, GPIO_QUAL_ASYNC); // asynch input
    GPIO_setQualificationMode(27, GPIO_QUAL_ASYNC); // asynch input
    // Enable SCI-A on GPIO28 - GPIO29
    GPIO_setPinConfig(GPIO_28_SCIRXDA);             // GPIO28 = SCIRXDA
    GPIO_setPinConfig(GPIO_29_SCITXDA);             // GPIO29 = SCITXDA
    GPIO_setPadConfig(28, GPIO_PIN_TYPE_PULLUP);    // Enable pullup on GPIO28
    GPIO_setPadConfig(29, GPIO_PIN_TYPE_PULLUP);    // Enable pullup on GPIO29
    GPIO_setQualificationMode(28, GPIO_QUAL_ASYNC); // asynch input
    // LDA
    GPIO_setPinConfig(GPIO_30_GPIO30);               // GPIO30 = LDA
    GPIO_setDirectionMode(30, GPIO_DIR_MODE_OUT);    // GPIO30 = output
    GPIO_writePin(30, 0);                            // output low (LED ON)
    // EM_WE
    GPIO_setPinConfig(GPIO_31_EM1WEN);               // GPIO31 = FPGA_WE_
    GPIO_setPadConfig(31, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO31
    // Enable I2C-A on GPIO32 - GPIO33
    GPIO_setPinConfig(GPIO_32_SDAA);                 // GPIO32 = SDAA
    GPIO_setPinConfig(GPIO_33_SCLA);                 // GPIO33 = SCLA
    GPIO_setPadConfig(32, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO32
    GPIO_setPadConfig(33, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO33
    GPIO_setQualificationMode(32, GPIO_QUAL_ASYNC);  // asynch input
    GPIO_setQualificationMode(33, GPIO_QUAL_ASYNC);  // asynch input
    // LDB
    GPIO_setPinConfig(GPIO_34_GPIO34);               // GPIO34 = LDB
    GPIO_setDirectionMode(34, GPIO_DIR_MODE_OUT);    // GPIO34 = output
    GPIO_writePin(34, 0);                            // output low (LED ON)
    // EM_CS
    GPIO_setPinConfig(GPIO_35_EM1CS3N);              // GPIO35 = FPGA_CS_
    GPIO_setPadConfig(35, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO35
    // FPGA_IO_ADCEXTSOC
    GPIO_setDirectionMode(36, GPIO_DIR_MODE_IN);     // GPIO36 = input
    GPIO_setPadConfig(36, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO36
    GPIO_SetupXINT2Gpio(36);                         //GPIO36 = ADCEXTSOC
    // EM_OEn
    GPIO_setPinConfig(GPIO_37_EM1OEN);               // GPIO37 = FPGA_OE_
    GPIO_setPadConfig(37, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO37
    // EM_A
    GPIO_setPinConfig(GPIO_38_EM1A0);                // GPIO38 = FPGA_A[0]
    GPIO_setPinConfig(GPIO_39_EM1A1);                // GPIO39 = FPGA_A[1]
    GPIO_setPinConfig(GPIO_40_EM1A2);                // GPIO40 = FPGA_A[2]
    GPIO_setPinConfig(GPIO_41_EM1A3);                // GPIO41 = FPGA_A[3]
    // DIN1 - DIN2
    GPIO_setPinConfig(GPIO_42_GPIO42);               // GPIO42 = GPIO42
    GPIO_setPinConfig(GPIO_43_GPIO43);               // GPIO43 = GPIO43
    GPIO_setDirectionMode(42, GPIO_DIR_MODE_IN);     // GPIO42 = input
    GPIO_setDirectionMode(43, GPIO_DIR_MODE_IN);     // GPIO43 = input
    GPIO_setPadConfig(42, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO42
    GPIO_setPadConfig(43, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO43
    GPIO_setPinConfig(GPIO_44_EM1A4);                // GPIO44 = FPGA_A[4]
    GPIO_setPinConfig(GPIO_45_EM1A5);                // GPIO45 = FPGA_A[5]
    GPIO_setPinConfig(GPIO_46_EM1A6);                // GPIO46 = FPGA_A[6]
    GPIO_setPinConfig(GPIO_47_EM1A7);                // GPIO47 = FPGA_A[7]
    // DIN3 - DIN5
    GPIO_setPinConfig(GPIO_48_GPIO48);               // GPIO48 = GPIO48
    GPIO_setPinConfig(GPIO_49_GPIO49);               // GPIO49 = GPIO49
    GPIO_setPinConfig(GPIO_50_GPIO50);               // GPIO50 = GPIO50
    GPIO_setDirectionMode(48, GPIO_DIR_MODE_IN);     // GPIO48 = input
    GPIO_setDirectionMode(49, GPIO_DIR_MODE_IN);     // GPIO49 = input
    GPIO_setDirectionMode(50, GPIO_DIR_MODE_IN);     // GPIO50 = input
    GPIO_setPadConfig(48, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO48
    GPIO_setPadConfig(49, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO49
    GPIO_setPadConfig(50, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO50
    // DOUT1 - DOUT3
    GPIO_setPinConfig(GPIO_51_GPIO51);               // GPIO51 = DOUT1
    GPIO_setPinConfig(GPIO_52_GPIO52);               // GPIO52 = DOUT2
    GPIO_setPinConfig(GPIO_53_GPIO53);               // GPIO53 = DOUT3
    GPIO_setDirectionMode(51, GPIO_DIR_MODE_OUT);    // GPIO51 = output
    GPIO_setDirectionMode(52, GPIO_DIR_MODE_OUT);    // GPIO52 = output
    GPIO_setDirectionMode(53, GPIO_DIR_MODE_OUT);    // GPIO53 = output
    GPIO_writePin(51, 0);                            // output low
    GPIO_writePin(52, 0);                            // output low
    GPIO_writePin(53, 0);                            // output low
    // DIN6 - DIN8
    GPIO_setPinConfig(GPIO_54_GPIO54);               // GPIO54 = DIN6
    GPIO_setPinConfig(GPIO_55_GPIO55);               // GPIO55 = DIN7
    GPIO_setPinConfig(GPIO_56_GPIO56);               // GPIO56 = DIN8
    GPIO_setDirectionMode(54, GPIO_DIR_MODE_IN);     // GPIO54 = input
    GPIO_setDirectionMode(55, GPIO_DIR_MODE_IN);     // GPIO55 = input
    GPIO_setDirectionMode(56, GPIO_DIR_MODE_IN);     // GPIO56 = input
    GPIO_setPadConfig(54, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO54
    GPIO_setPadConfig(55, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO55
    GPIO_setPadConfig(56, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO56
    // DOUT4
    GPIO_setPinConfig(GPIO_57_GPIO57);               // GPIO57 = DOUT4
    GPIO_setDirectionMode(57, GPIO_DIR_MODE_OUT);    // GPIO57 = output
    GPIO_writePin(57, 0);                            // output low
    // Enable SPI-A on GPIO58 - GPIO61
    GPIO_setPinConfig(GPIO_58_SPISIMOA);            // GPIO58 = SPISIMOA
    GPIO_setPinConfig(GPIO_59_SPISOMIA);            // GPIO59 = SPIS0MIA
    GPIO_setPinConfig(GPIO_60_SPICLKA);             // GPIO60 = SPICLKA
    GPIO_setPinConfig(GPIO_61_SPISTEA);             // GPIO61 = SPISTEA
    GPIO_setPadConfig(58, GPIO_PIN_TYPE_PULLUP); // Pullup on GPIO58 (SPISIMOA)
    GPIO_setPadConfig(59, GPIO_PIN_TYPE_PULLUP); // Pullup on GPIO59 (SPIS0MIA)
    GPIO_setPadConfig(60, GPIO_PIN_TYPE_PULLUP); // Pullup on GPIO60 (SPICLKA)
    GPIO_setPadConfig(61, GPIO_PIN_TYPE_PULLUP); // Pullup on GPIO61 (SPISTEA)
    GPIO_setQualificationMode(58, GPIO_QUAL_ASYNC); // asynch input
    GPIO_setQualificationMode(59, GPIO_QUAL_ASYNC); // asynch input
    GPIO_setQualificationMode(60, GPIO_QUAL_ASYNC); // asynch input
    GPIO_setQualificationMode(61, GPIO_QUAL_ASYNC); // asynch input
    // Enable CAN-A on GPIO62 - GPIO63
    GPIO_setPinConfig(GPIO_62_CANRXA);               // GPIO62 = CANRXA
    GPIO_setPinConfig(GPIO_63_CANTXA);               // GPIO63 = CANTXA
    GPIO_setPadConfig(62, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO62
    GPIO_setPadConfig(63, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO63
    GPIO_setQualificationMode(31, GPIO_QUAL_ASYNC);  // asynch input
    // DOUT9 - DOUT12
    GPIO_setPinConfig(GPIO_64_GPIO64);               // GPIO64 = DOUT9
    GPIO_setPinConfig(GPIO_65_GPIO65);               // GPIO65 = DOUT10
    GPIO_setPinConfig(GPIO_66_GPIO66);               // GPIO66 = DOUT11
    GPIO_setPinConfig(GPIO_67_GPIO67);               // GPIO67 = DOUT12
    GPIO_setDirectionMode(64, GPIO_DIR_MODE_OUT);    // GPIO64 = output
    GPIO_setDirectionMode(65, GPIO_DIR_MODE_OUT);    // GPIO65 = output
    GPIO_setDirectionMode(66, GPIO_DIR_MODE_OUT);    // GPIO66 = output
    GPIO_setDirectionMode(67, GPIO_DIR_MODE_OUT);    // GPIO67 = output
    GPIO_writePin(64, 0);                            // output low
    GPIO_writePin(65, 0);                            // output low
    GPIO_writePin(66, 0);                            // output low
    GPIO_writePin(67, 0);                            // output low
    // FPGA_IO
    GPIO_setPinConfig(GPIO_68_GPIO68);               // GPIO68 = DSP_RST_
    GPIO_setDirectionMode(68, GPIO_DIR_MODE_OUT);    // GPIO68 = output
    GPIO_writePin(68, 0);                            // output low
    // EM_D
    GPIO_setPinConfig(GPIO_69_EM1D15);               // GPIO69 = FPGA_D[15]
    GPIO_setPinConfig(GPIO_70_EM1D14);               // GPIO70 = FPGA_D[14]
    GPIO_setPinConfig(GPIO_71_EM1D13);               // GPIO71 = FPGA_D[13]
    GPIO_setPinConfig(GPIO_72_EM1D12);               // GPIO72 = FPGA_D[12]
    GPIO_setPinConfig(GPIO_73_EM1D11);               // GPIO73 = FPGA_D[11]
    GPIO_setPinConfig(GPIO_74_EM1D10);               // GPIO74 = FPGA_D[10]
    GPIO_setPinConfig(GPIO_75_EM1D9);                // GPIO75 = FPGA_D[9]
    GPIO_setPinConfig(GPIO_76_EM1D8);                // GPIO76 = FPGA_D[8]
    GPIO_setPinConfig(GPIO_77_EM1D7);                // GPIO77 = FPGA_D[7]
    GPIO_setPinConfig(GPIO_78_EM1D6);                // GPIO78 = FPGA_D[6]
    GPIO_setPinConfig(GPIO_79_EM1D5);                // GPIO79 = FPGA_D[5]
    GPIO_setPinConfig(GPIO_80_EM1D4);                // GPIO80 = FPGA_D[4]
    GPIO_setPinConfig(GPIO_81_EM1D3);                // GPIO81 = FPGA_D[3]
    GPIO_setPinConfig(GPIO_82_EM1D2);                // GPIO82 = FPGA_D[2]
    GPIO_setPinConfig(GPIO_83_EM1D1);                // GPIO83 = FPGA_D[1]
    // DNC
    GPIO_setPinConfig(GPIO_84_GPIO84);               // GPIO84 = DNC
    GPIO_setDirectionMode(84, GPIO_DIR_MODE_OUT);    // GPIO68 = output
    GPIO_writePin(84, 0);                            // output low
    // EM_D
    GPIO_setPinConfig(GPIO_85_EM1D0);                // GPIO83 = FPGA_D[0]
    // FPGA_IO
    GPIO_setPinConfig(GPIO_86_GPIO86);               // GPIO86 = FPGA_IO[5]
    GPIO_setDirectionMode(86, GPIO_DIR_MODE_OUT);    // GPIO86 = output
    GPIO_writePin(86, 0);                            // output low
    GPIO_setPinConfig(GPIO_87_GPIO87);               // GPIO87 = FPGA_IO[6]
    GPIO_setDirectionMode(87, GPIO_DIR_MODE_OUT);    // GPIO87 = output
    GPIO_writePin(87, 0);                            // output low
    GPIO_setPinConfig(GPIO_88_GPIO88);               // GPIO88 = FPGA_IO[7]
    GPIO_setDirectionMode(88, GPIO_DIR_MODE_OUT);    // GPIO88 = output
    GPIO_writePin(88, 0);                            // output low
    GPIO_setPinConfig(GPIO_89_GPIO89);               // GPIO89 = FPGA_IO[8]
    GPIO_setDirectionMode(89, GPIO_DIR_MODE_OUT);    // GPIO89 = output
    GPIO_writePin(89, 0);                            // output low
    GPIO_setPinConfig(GPIO_90_GPIO90);               // GPIO90 = FPGA_IO[9]
    GPIO_setDirectionMode(90, GPIO_DIR_MODE_OUT);    // GPIO90 = output
    GPIO_writePin(90, 0);                            // output low
    GPIO_setPinConfig(GPIO_91_GPIO91);               // GPIO91 = FPGA_IO[10]
    GPIO_setDirectionMode(91, GPIO_DIR_MODE_OUT);    // GPIO91 = output
    GPIO_writePin(91, 0);                            // output low
    // EM_A
    GPIO_setPinConfig(GPIO_92_EM1BA1);               // GPIO92 = FPGA_A1
    // Enable SCI-D on GPIO93 - GPIO94
    GPIO_setPinConfig(GPIO_93_SCITXDD);               // GPIO93 = SCITXDD
    GPIO_setPinConfig(GPIO_94_SCIRXDD);               // GPIO94 = SCIRXDD
    GPIO_setPadConfig(93, GPIO_PIN_TYPE_PULLUP);      // Enable pullup on GPIO93
    GPIO_setPadConfig(94, GPIO_PIN_TYPE_PULLUP);      // Enable pullup on GPIO94
    GPIO_setQualificationMode(94, GPIO_QUAL_ASYNC);   // asynch input
    // FPGA_IO
    for (pin = 95; pin <= 104; pin++){
        GPIO_setDirectionMode(pin, GPIO_DIR_MODE_OUT);
        GPIO_writePin(pin, 0);                        // output low
    }
    // DNC
    GPIO_setPinConfig(GPIO_105_GPIO105);              // GPIO105 = DNC
    GPIO_setDirectionMode(105, GPIO_DIR_MODE_OUT);    // GPIO68 = output
    GPIO_writePin(105, 0);                            // output low

    // INT_B
    GPIO_setPinConfig(GPIO_106_GPIO106);               // GPIO106 = INT_B
    GPIO_setDirectionMode(106, GPIO_DIR_MODE_IN);     // GPIO106 = input
    GPIO_setPadConfig(106, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO106
    // DONE
    GPIO_setPinConfig(GPIO_107_GPIO107);              // GPIO107 = DONE
    GPIO_setDirectionMode(107, GPIO_DIR_MODE_IN);     // GPIO107 = input
    GPIO_setPadConfig(107, GPIO_PIN_TYPE_PULLUP);     // Enable pullup on GPIO107
    // DNC
    for (pin = 108; pin <= 121; pin++){
        GPIO_setDirectionMode(pin, GPIO_DIR_MODE_OUT);
        GPIO_writePin(pin, 0);                        // output low
    }
    // Enable SPI-C on GPIO122 - GPI125
    GPIO_setPinConfig(GPIO_122_SPISIMOC);            // GPIO122 = SPISIMOC
    GPIO_setPinConfig(GPIO_123_SPISOMIC);            // GPIO123 = SPISOMIC
    GPIO_setPinConfig(GPIO_124_SPICLKC);             // GPIO124 = SPICLC
    GPIO_setPinConfig(GPIO_125_SPISTEC);             // GPIO125 = SPISTEC
    GPIO_setPadConfig(122, GPIO_PIN_TYPE_PULLUP);    // Pullup on GPIO122 (SPISIMOC)
    GPIO_setPadConfig(123, GPIO_PIN_TYPE_PULLUP);    // Pullup on GPIO123 (SPISOMIC)
    GPIO_setPadConfig(124, GPIO_PIN_TYPE_PULLUP);    // Pullup on GPIO124 (SPICLKC)
    GPIO_setPadConfig(125, GPIO_PIN_TYPE_PULLUP);    // Pullup on GPIO125 (SPISTEC)
    GPIO_setQualificationMode(122, GPIO_QUAL_ASYNC); // asynch input
    GPIO_setQualificationMode(123, GPIO_QUAL_ASYNC); // asynch input
    GPIO_setQualificationMode(124, GPIO_QUAL_ASYNC); // asynch input
    GPIO_setQualificationMode(125, GPIO_QUAL_ASYNC); // asynch input
    // DNC
    for (pin = 126; pin <= 168; pin++){
        GPIO_setDirectionMode(pin, GPIO_DIR_MODE_OUT);
        GPIO_writePin(pin, 0);                        // output low
    }

}

void configADC(void)
{
    u4 acqps_12,acqps_16;
    acqps_12 = 15; //75nsec
    acqps_16 = 64; //320nsec

    ADC_setPrescaler(ADCA_BASE, ADC_CLK_DIV_4_0);   // Set ADCCLK divider to /4
    ADC_setMode(ADCA_BASE, ADC_RESOLUTION_12BIT, ADC_MODE_SINGLE_ENDED);
    ADC_setInterruptPulseMode(ADCA_BASE, ADC_PULSE_END_OF_CONV); // Set pulse positions to late
    ADC_enableConverter(ADCA_BASE); //power up the ADC

    ADC_setPrescaler(ADCB_BASE, ADC_CLK_DIV_4_0);   // Set ADCCLK divider to /4
    ADC_setMode(ADCB_BASE, ADC_RESOLUTION_16BIT, ADC_MODE_DIFFERENTIAL);
    ADC_setInterruptPulseMode(ADCB_BASE, ADC_PULSE_END_OF_CONV); // Set pulse positions to late
    ADC_enableConverter(ADCB_BASE); //power up the ADC

    ADC_setPrescaler(ADCC_BASE, ADC_CLK_DIV_4_0);   // Set ADCCLK divider to /4
    ADC_setMode(ADCC_BASE, ADC_RESOLUTION_12BIT, ADC_MODE_SINGLE_ENDED);
    ADC_setInterruptPulseMode(ADCC_BASE, ADC_PULSE_END_OF_CONV); // Set pulse positions to late
    ADC_enableConverter(ADCC_BASE); //power up the ADC

    ADC_setPrescaler(ADCD_BASE, ADC_CLK_DIV_4_0);   // Set ADCCLK divider to /4
    ADC_setMode(ADCD_BASE, ADC_RESOLUTION_12BIT, ADC_MODE_SINGLE_ENDED);
    ADC_setInterruptPulseMode(ADCD_BASE, ADC_PULSE_END_OF_CONV); // Set pulse positions to late
    ADC_enableConverter(ADCD_BASE); //power up the ADC

    ASysCtl_enableTemperatureSensor();

    DEVICE_DELAY_US(1000);

    ADC_setupSOC(ADCA_BASE, ADC_SOC_NUMBER0, ADC_TRIGGER_GPIO,ADC_CH_ADCIN2, acqps_12);     // CT1
    ADC_setupSOC(ADCA_BASE, ADC_SOC_NUMBER1, ADC_TRIGGER_GPIO,ADC_CH_ADCIN14, acqps_12);    // VT1
    ADC_setupSOC(ADCA_BASE, ADC_SOC_NUMBER2, ADC_TRIGGER_GPIO,ADC_CH_ADCIN4, acqps_12);     // CT4
    ADC_setupSOC(ADCA_BASE, ADC_SOC_NUMBER3, ADC_TRIGGER_GPIO,ADC_CH_ADCIN5, acqps_12);     // VT4
    ADC_setupSOC(ADCA_BASE, ADC_SOC_NUMBER4, ADC_TRIGGER_GPIO,ADC_CH_ADCIN3, acqps_12);     // TH2
    ADC_setupSOC(ADCA_BASE, ADC_SOC_NUMBER5, ADC_TRIGGER_GPIO,ADC_CH_ADCIN13, 140);   // TemperatureSensor

    ADC_setupSOC(ADCB_BASE, ADC_SOC_NUMBER0, ADC_TRIGGER_GPIO,ADC_CH_ADCIN2, acqps_16);     // VT6

    ADC_setupSOC(ADCC_BASE, ADC_SOC_NUMBER0, ADC_TRIGGER_GPIO,ADC_CH_ADCIN2, acqps_12);     // CT2
    ADC_setupSOC(ADCC_BASE, ADC_SOC_NUMBER1, ADC_TRIGGER_GPIO,ADC_CH_ADCIN3, acqps_12);     // VT2
    ADC_setupSOC(ADCC_BASE, ADC_SOC_NUMBER2, ADC_TRIGGER_GPIO,ADC_CH_ADCIN4, acqps_12);     // CT5
    ADC_setupSOC(ADCC_BASE, ADC_SOC_NUMBER3, ADC_TRIGGER_GPIO,ADC_CH_ADCIN15, acqps_12);    // TH3
    ADC_setupSOC(ADCC_BASE, ADC_SOC_NUMBER4, ADC_TRIGGER_GPIO,ADC_CH_ADCIN5, acqps_12);     // TH4

    ADC_setupSOC(ADCD_BASE, ADC_SOC_NUMBER0, ADC_TRIGGER_GPIO,ADC_CH_ADCIN0, acqps_12);     // CT3
    ADC_setupSOC(ADCD_BASE, ADC_SOC_NUMBER1, ADC_TRIGGER_GPIO,ADC_CH_ADCIN1, acqps_12);     // VT3
    ADC_setupSOC(ADCD_BASE, ADC_SOC_NUMBER2, ADC_TRIGGER_GPIO,ADC_CH_ADCIN2, acqps_12);     // CT6
    ADC_setupSOC(ADCD_BASE, ADC_SOC_NUMBER3, ADC_TRIGGER_GPIO,ADC_CH_ADCIN3, acqps_12);     // VT5
    ADC_setupSOC(ADCD_BASE, ADC_SOC_NUMBER4, ADC_TRIGGER_GPIO,ADC_CH_ADCIN4, acqps_12);     // TH1

    XBAR_setOutputLatchMode(XBAR_OUTPUT5,true);     // Latch Enable
    XBAR_invertOutputSignal(XBAR_OUTPUT5,true);     // Low active

    ADC_setInterruptSource(ADCA_BASE, ADC_INT_NUMBER1, ADC_SOC_NUMBER3);
    ADC_enableInterrupt(ADCA_BASE, ADC_INT_NUMBER1);
    ADC_clearInterruptStatus(ADCA_BASE, ADC_INT_NUMBER1);
}

void configEPWM(void)
{
    SysCtl_setEPWMClockDivider(SYSCTL_EPWMCLK_DIV_1);

    N_ConfigSTDInverterEPWMs(EPWM1_BASE, DSP_CAPK, DSP_DEADT);
    N_ConfigSTDInverterEPWMs(EPWM2_BASE, DSP_CAPK, DSP_DEADT);
    N_ConfigSTDInverterEPWMs(EPWM3_BASE, DSP_CAPK, DSP_DEADT);
    N_ConfigSTDInverterEPWMs(EPWM4_BASE, DSP_CAPK, DSP_DEADT);
    N_ConfigSTDInverterEPWMs(EPWM5_BASE, DSP_CAPK, DSP_DEADT);
    N_ConfigSTDInverterEPWMs(EPWM6_BASE, DSP_CAPK, DSP_DEADT);
    N_ConfigSTDInverterEPWMs(EPWM7_BASE, DSP_CAPK, DSP_DEADT);
    N_ConfigSTDInverterEPWMs(EPWM8_BASE, DSP_CAPK, DSP_DEADT);
    N_ConfigSTDInverterEPWMs(EPWM9_BASE, DSP_CAPK, DSP_DEADT);
    N_ConfigSTDInverterEPWMs(EPWM10_BASE, DSP_CAPK, DSP_DEADT);
    N_ConfigSTDInverterEPWMs(EPWM11_BASE, DSP_CAPK, DSP_DEADT);
    N_ConfigSTDInverterEPWMs(EPWM12_BASE, DSP_CAPK, DSP_DEADT);

    //Event-Trigger Submodule Registers
    EPWM_setADCTriggerSource(EPWM1_BASE, EPWM_SOC_A, EPWM_SOC_TBCTR_ZERO);
    EPWM_enableADCTrigger(EPWM1_BASE, EPWM_SOC_A);
    // ŠÔˆø‚«
    EPWM_setADCTriggerEventPrescale(EPWM1_BASE, EPWM_SOC_A, INT_COUNT);
}

extern void Emif1Initialize(void);
void configEMIF(void)
{
    Emif1Initialize();
    //Configure to run EMIF1 on full Rate (EMIF1CLK = CPU1SYSCLK)
    EALLOW;
        ClkCfgRegs.PERCLKDIVSEL.bit.EMIF1CLKDIV = 0x0;
    EDIS;

    EALLOW;
        ///Grab EMIF1 For CPU1
        Emif1ConfigRegs.EMIF1MSEL.all = 0x93A5CE71;
        //Disable Access Protection (CPU_FETCH/CPU_WR/DMA_WR)
        Emif1ConfigRegs.EMIF1ACCPROT0.all = 0x0;
        // Commit the configuration related to protection. Till this bit remains set
        // content of EMIF1ACCPROT0 register can't be changed.
        Emif1ConfigRegs.EMIF1COMMIT.all = 0x1;
        // Lock the configuration so that EMIF1COMMIT register can't be changed any more.
        Emif1ConfigRegs.EMIF1LOCK.all = 0x1;
    EDIS;

      Emif1Regs.ASYNC_CS3_CR.all =  (EMIF_ASYNC_ASIZE_16    | // 16Bit Memory Interface
                                     EMIF_ASYNC_TA_3        | // Turn Around time of 3 Emif Clock
                                     EMIF_ASYNC_RHOLD_1     | // Read Hold time of 1 Emif Clock
                                     EMIF_ASYNC_RSTROBE_8  | // Read Strobe time of 8 Emif Clock
                                     EMIF_ASYNC_RSETUP_1   | // Read Setup time of 1 Emif Clock
                                     EMIF_ASYNC_WHOLD_1     | // Write Hold time of 1 Emif Clock
                                     EMIF_ASYNC_WSTROBE_4  | // Write Strobe time of 1 Emif Clock
                                     EMIF_ASYNC_WSETUP_1   | // Write Setup time of 1 Emif Clock
                                     EMIF_ASYNC_EW_DISABLE  | // Extended Wait Disable.
                                     EMIF_ASYNC_SS_DISABLE    // Strobe Select Mode Disable.
                                    );
}



