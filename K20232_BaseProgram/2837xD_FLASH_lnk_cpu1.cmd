
MEMORY
{
PAGE 0 :  /* Program Memory */
          /* Memory (RAM/FLASH) blocks can be moved to PAGE1 for data allocation */
          /* BEGIN is used for the "boot to Flash" bootloader mode   */

   BEGIN           	: origin = 0x080000, length = 0x000002
   RAMM0           	: origin = 0x000123, length = 0x0002DD
   RAMD0           	: origin = 0x00B000, length = 0x000800
   RAMLS0          	: origin = 0x008000, length = 0x000800
   RAMLS1          	: origin = 0x008800, length = 0x000800
   RAMLS2      		: origin = 0x009000, length = 0x000800
   RAMLS3      		: origin = 0x009800, length = 0x000800
   RAMLS4      		: origin = 0x00A000, length = 0x000800
   RAMGS14          : origin = 0x01A000, length = 0x001000     /* Only Available on F28379D, F28377D, F28375D devices. Remove line on other devices. */
   RAMGS15          : origin = 0x01B000, length = 0x000FF8     /* Only Available on F28379D, F28377D, F28375D devices. Remove line on other devices. */

//   RAMGS15_RSVD     : origin = 0x01BFF8, length = 0x000008    /* Reserve and do not use for code as per the errata advisory "Memory: Prefetching Beyond Valid Memory" */

   RESET           	: origin = 0x3FFFC0, length = 0x000002

   /* Flash sectors */
   FLASHA           : origin = 0x080002, length = 0x001FFE	/* on-chip Flash */
   FLASHB           : origin = 0x082000, length = 0x002000	/* on-chip Flash */
   FLASHC           : origin = 0x084000, length = 0x002000	/* on-chip Flash */
   FLASHD           : origin = 0x086000, length = 0x002000	/* on-chip Flash */
   FLASHE           : origin = 0x088000, length = 0x008000	/* on-chip Flash */
   FLASHF           : origin = 0x090000, length = 0x008000	/* on-chip Flash */
   FLASHG           : origin = 0x098000, length = 0x008000	/* on-chip Flash */
   FLASHH           : origin = 0x0A0000, length = 0x008000	/* on-chip Flash */
   FLASHI           : origin = 0x0A8000, length = 0x008000	/* on-chip Flash */
   FLASHJ           : origin = 0x0B0000, length = 0x008000	/* on-chip Flash */
   FLASHK           : origin = 0x0B8000, length = 0x002000	/* on-chip Flash */
   FLASHL           : origin = 0x0BA000, length = 0x002000	/* on-chip Flash */
   FLASHM           : origin = 0x0BC000, length = 0x002000	/* on-chip Flash */
   FLASHN           : origin = 0x0BE000, length = 0x001FF0	/* on-chip Flash */

//   FLASHN_RSVD     : origin = 0x0BFFF0, length = 0x000010    /* Reserve and do not use for code as per the errata advisory "Memory: Prefetching Beyond Valid Memory" */

PAGE 1 : /* Data Memory */
         /* Memory (RAM/FLASH) blocks can be moved to PAGE0 for program allocation */

   BOOT_RSVD       : origin = 0x000002, length = 0x000121     /* Part of M0, BOOT rom will use this for stack */
   RAMM1           : origin = 0x000400, length = 0x0003F8     /* on-chip RAM block M1 */
//   RAMM1_RSVD      : origin = 0x0007F8, length = 0x000008     /* Reserve and do not use for code as per the errata advisory "Memory: Prefetching Beyond Valid Memory" */
   RAMD1           : origin = 0x00B800, length = 0x000800

   RAMLS5      : origin = 0x00A800, length = 0x000800

   RAMGS0      : origin = 0x00C000, length = 0x001000
   RAMGS1      : origin = 0x00D000, length = 0x001000
   RAMGS2      : origin = 0x00E000, length = 0x001000
   RAMGS3      : origin = 0x00F000, length = 0x001000
   RAMGS4      : origin = 0x010000, length = 0x001000
   RAMGS5      : origin = 0x011000, length = 0x001000
   RAMGS6      : origin = 0x012000, length = 0x001000
   RAMGS7      : origin = 0x013000, length = 0x001000
   RAMGS8      : origin = 0x014000, length = 0x001000
   RAMGS9      : origin = 0x015000, length = 0x001000
   RAMGS10     : origin = 0x016000, length = 0x001000

//   RAMGS11     : origin = 0x017000, length = 0x000FF8   /* Uncomment for F28374D, F28376D devices */

//   RAMGS11_RSVD : origin = 0x017FF8, length = 0x000008    /* Reserve and do not use for code as per the errata advisory "Memory: Prefetching Beyond Valid Memory" */

   RAMGS11     : origin = 0x017000, length = 0x001000     /* Only Available on F28379D, F28377D, F28375D devices. Remove line on other devices. */
   RAMGS12     : origin = 0x018000, length = 0x001000     /* Only Available on F28379D, F28377D, F28375D devices. Remove line on other devices. */
   RAMGS13     : origin = 0x019000, length = 0x001000     /* Only Available on F28379D, F28377D, F28375D devices. Remove line on other devices. */


   CPU2TOCPU1RAM   : origin = 0x03F800, length = 0x000400
   CPU1TOCPU2RAM   : origin = 0x03FC00, length = 0x000400

   /* FPGA Window */
 	REG_ARRY_OUT_0 		:	origin = 0x00300000, length = 0x00000001
 	REG_ARRY_OUT_1 		:	origin = 0x00300001, length = 0x00000001
 	REG_ARRY_OUT_2 		:	origin = 0x00300002, length = 0x00000001
 	REG_ARRY_OUT_3 		:	origin = 0x00300003, length = 0x00000001
 	REG_ARRY_OUT_4 		:	origin = 0x00300004, length = 0x00000001
 	REG_ARRY_OUT_5 		:	origin = 0x00300005, length = 0x00000001
 	REG_ARRY_OUT_6 		:	origin = 0x00300006, length = 0x00000001
 	REG_ARRY_OUT_7 		:	origin = 0x00300007, length = 0x00000001
 	REG_ARRY_OUT_8 		:	origin = 0x00300008, length = 0x00000001
 	REG_ARRY_OUT_9 		:	origin = 0x00300009, length = 0x00000001
 	REG_ARRY_OUT_a 		:	origin = 0x0030000a, length = 0x00000001
 	REG_ARRY_OUT_b 		:	origin = 0x0030000b, length = 0x00000001
 	REG_ARRY_OUT_c 		:	origin = 0x0030000c, length = 0x00000001
 	REG_ARRY_OUT_d 		:	origin = 0x0030000d, length = 0x00000001
 	REG_ARRY_OUT_e 		:	origin = 0x0030000e, length = 0x00000001
 	REG_ARRY_OUT_f 		:	origin = 0x0030000f, length = 0x00000001
 	REG_ARRY_OUT_10		:	origin = 0x00300010, length = 0x00000001
 	REG_ARRY_OUT_11		:	origin = 0x00300011, length = 0x00000001
 	REG_ARRY_OUT_12		:	origin = 0x00300012, length = 0x00000001
 	REG_ARRY_OUT_13		:	origin = 0x00300013, length = 0x00000001
 	REG_ARRY_OUT_14		:	origin = 0x00300014, length = 0x00000001
 	REG_ARRY_OUT_15		:	origin = 0x00300015, length = 0x00000001
 	REG_ARRY_OUT_16		:	origin = 0x00300016, length = 0x00000001
 	REG_ARRY_OUT_17		:	origin = 0x00300017, length = 0x00000001
 	REG_ARRY_OUT_18		:	origin = 0x00300018, length = 0x00000001
 	REG_ARRY_OUT_19		:	origin = 0x00300019, length = 0x00000001
 	REG_ARRY_OUT_1a		:	origin = 0x0030001a, length = 0x00000001
 	REG_ARRY_OUT_1b		:	origin = 0x0030001b, length = 0x00000001
 	REG_ARRY_OUT_1c		:	origin = 0x0030001c, length = 0x00000001
 	REG_ARRY_OUT_1d		:	origin = 0x0030001d, length = 0x00000001
 	REG_ARRY_OUT_1e		:	origin = 0x0030001e, length = 0x00000001
 	REG_ARRY_OUT_1f		:	origin = 0x0030001f, length = 0x00000001
 	REG_ARRY_OUT_20		:	origin = 0x00300020, length = 0x00000001
 	REG_ARRY_OUT_21		:	origin = 0x00300021, length = 0x00000001
 	REG_ARRY_OUT_22		:	origin = 0x00300022, length = 0x00000001
 	REG_ARRY_OUT_23		:	origin = 0x00300023, length = 0x00000001
 	REG_ARRY_OUT_24		:	origin = 0x00300024, length = 0x00000001
 	REG_ARRY_OUT_25		:	origin = 0x00300025, length = 0x00000001
 	REG_ARRY_OUT_26		:	origin = 0x00300026, length = 0x00000001
 	REG_ARRY_OUT_27		:	origin = 0x00300027, length = 0x00000001
 	REG_ARRY_OUT_28		:	origin = 0x00300028, length = 0x00000001
 	REG_ARRY_OUT_29		:	origin = 0x00300029, length = 0x00000001
 	REG_ARRY_OUT_2a		:	origin = 0x0030002a, length = 0x00000001
 	REG_ARRY_OUT_2b		:	origin = 0x0030002b, length = 0x00000001
 	REG_ARRY_OUT_2c		:	origin = 0x0030002c, length = 0x00000001
 	REG_ARRY_OUT_2d		:	origin = 0x0030002d, length = 0x00000001
 	REG_ARRY_OUT_2e		:	origin = 0x0030002e, length = 0x00000001
 	REG_ARRY_OUT_2f		:	origin = 0x0030002f, length = 0x00000001
 	REG_ARRY_OUT_30		:	origin = 0x00300030, length = 0x00000001
 	REG_ARRY_OUT_31		:	origin = 0x00300031, length = 0x00000001
 	REG_ARRY_OUT_32		:	origin = 0x00300032, length = 0x00000001
 	REG_ARRY_OUT_33		:	origin = 0x00300033, length = 0x00000001
 	REG_ARRY_OUT_34		:	origin = 0x00300034, length = 0x00000001
 	REG_ARRY_OUT_35		:	origin = 0x00300035, length = 0x00000001
 	REG_ARRY_OUT_36		:	origin = 0x00300036, length = 0x00000001
 	REG_ARRY_OUT_37		:	origin = 0x00300037, length = 0x00000001
 	REG_ARRY_OUT_38		:	origin = 0x00300038, length = 0x00000001
 	REG_ARRY_OUT_39		:	origin = 0x00300039, length = 0x00000001
 	REG_ARRY_OUT_3a		:	origin = 0x0030003a, length = 0x00000001
 	REG_ARRY_OUT_3b		:	origin = 0x0030003b, length = 0x00000001
 	REG_ARRY_OUT_3c		:	origin = 0x0030003c, length = 0x00000001
 	REG_ARRY_OUT_3d		:	origin = 0x0030003d, length = 0x00000001
 	REG_ARRY_OUT_3e		:	origin = 0x0030003e, length = 0x00000001
 	REG_ARRY_OUT_3f		:	origin = 0x0030003f, length = 0x00000001
	REG_MAPPED_PORT_40	:	origin = 0x00300040, length = 0x00000001
	REG_MAPPED_PORT_41	:	origin = 0x00300041, length = 0x00000001
	REG_MAPPED_PORT_42	:	origin = 0x00300042, length = 0x00000001
	REG_MAPPED_PORT_43	:	origin = 0x00300043, length = 0x00000001
	REG_MAPPED_PORT_44	:	origin = 0x00300044, length = 0x00000001
	REG_MAPPED_PORT_45	:	origin = 0x00300045, length = 0x00000001
	REG_MAPPED_PORT_46	:	origin = 0x00300046, length = 0x00000001
	REG_MAPPED_PORT_47	:	origin = 0x00300047, length = 0x00000001
	REG_MAPPED_PORT_48	:	origin = 0x00300048, length = 0x00000001
	REG_MAPPED_PORT_49	:	origin = 0x00300049, length = 0x00000001
	REG_MAPPED_PORT_4a	:	origin = 0x0030004a, length = 0x00000001
	REG_MAPPED_PORT_4b	:	origin = 0x0030004b, length = 0x00000001
	REG_MAPPED_PORT_4c	:	origin = 0x0030004c, length = 0x00000001
	REG_MAPPED_PORT_4d	:	origin = 0x0030004d, length = 0x00000001
	REG_MAPPED_PORT_4e	:	origin = 0x0030004e, length = 0x00000001
	REG_MAPPED_PORT_4f	:	origin = 0x0030004f, length = 0x00000001
}

SECTIONS
{
   /* Allocate program areas: */
   .cinit              : > FLASHF,     PAGE = 0, ALIGN(8)
   .text               : >> FLASHB | FLASHC | FLASHD | FLASHE,      PAGE = 0, ALIGN(8)
   codestart           : > BEGIN       PAGE = 0, ALIGN(8)
   /* Allocate uninitalized data sections: */
   .stack              : > RAMM1       PAGE = 1
   .switch             : > FLASHB      PAGE = 0, ALIGN(8)
   .reset              : > RESET,      PAGE = 0, TYPE = DSECT /* not used, */

#if defined(__TI_EABI__)
   .init_array         : > FLASHB,       PAGE = 0,       ALIGN(8)
   .bss                : > RAMGS0,       PAGE = 1
   .bss:output         : > RAMLS3,       PAGE = 0
   .bss:cio            : > RAMGS0,       PAGE = 1
   .data               : > RAMGS0,       PAGE = 1
   .sysmem             : > RAMGS0,       PAGE = 1
   /* Initalized sections go in Flash */
   .const              : > FLASHF,       PAGE = 0,       ALIGN(8)
#else
   .pinit              : > FLASHB,       PAGE = 0,       ALIGN(8)
   .ebss               : >> RAMGS0 | RAMGS1 | RAMGS2       PAGE = 1
   .esysmem            : > RAMGS0,       PAGE = 1
   .cio                : > RAMLS5,       PAGE = 1

   /* Initalized sections go in Flash */
   .econst             : >> FLASHF      PAGE = 0, ALIGN(8)
#endif

   Filter_RegsFile     : > RAMGS0,	   PAGE = 1

   SHARERAMGS0		: > RAMGS0,		PAGE = 1
   SHARERAMGS1		: > RAMGS1,		PAGE = 1
   ramgs0           : > RAMGS0,     PAGE = 1
   ramgs1           : > RAMGS1,     PAGE = 1

#ifdef __TI_COMPILER_VERSION__
    #if __TI_COMPILER_VERSION__ >= 15009000
        #if defined(__TI_EABI__)
            .TI.ramfunc : {} LOAD = FLASHD,
                                 RUN = RAMLS0,
                                 LOAD_START(RamfuncsLoadStart),
                                 LOAD_SIZE(RamfuncsLoadSize),
                                 LOAD_END(RamfuncsLoadEnd),
                                 RUN_START(RamfuncsRunStart),
                                 RUN_SIZE(RamfuncsRunSize),
                                 RUN_END(RamfuncsRunEnd),
                                 PAGE = 0, ALIGN(8)
        #else
            .TI.ramfunc : {} LOAD = FLASHD,
                             RUN = RAMLS0,
                             LOAD_START(_RamfuncsLoadStart),
                             LOAD_SIZE(_RamfuncsLoadSize),
                             LOAD_END(_RamfuncsLoadEnd),
                             RUN_START(_RamfuncsRunStart),
                             RUN_SIZE(_RamfuncsRunSize),
                             RUN_END(_RamfuncsRunEnd),
                             PAGE = 0, ALIGN(8)
        #endif
    #else
   ramfuncs            : LOAD = FLASHD,
                         RUN = RAMLS0,
                         LOAD_START(_RamfuncsLoadStart),
                         LOAD_SIZE(_RamfuncsLoadSize),
                         LOAD_END(_RamfuncsLoadEnd),
                         RUN_START(_RamfuncsRunStart),
                         RUN_SIZE(_RamfuncsRunSize),
                         RUN_END(_RamfuncsRunEnd),
                         PAGE = 0, ALIGN(8)
    #endif

#endif

   /* The following section definitions are required when using the IPC API Drivers */
    GROUP : > CPU1TOCPU2RAM, PAGE = 1
    {
        PUTBUFFER
        PUTWRITEIDX
        GETREADIDX
    }

    GROUP : > CPU2TOCPU1RAM, PAGE = 1
    {
        GETBUFFER :    TYPE = DSECT
        GETWRITEIDX :  TYPE = DSECT
        PUTREADIDX :   TYPE = DSECT
    }

   /* The following section definition are for SDFM examples */
   Filter1_RegsFile : > RAMGS1,	PAGE = 1, fill=0x1111
   Filter2_RegsFile : > RAMGS2,	PAGE = 1, fill=0x2222
   Filter3_RegsFile : > RAMGS3,	PAGE = 1, fill=0x3333
   Filter4_RegsFile : > RAMGS4,	PAGE = 1, fill=0x4444
   Difference_RegsFile : >RAMGS5, 	PAGE = 1, fill=0x3333

   // FPGA sextion
   	REG_ARRY_OUT_0 		:	> REG_ARRY_OUT_0 	, PAGE = 1
   	REG_ARRY_OUT_1 		:	> REG_ARRY_OUT_1 	, PAGE = 1
   	REG_ARRY_OUT_2 		:	> REG_ARRY_OUT_2 	, PAGE = 1
   	REG_ARRY_OUT_3 		:	> REG_ARRY_OUT_3 	, PAGE = 1
   	REG_ARRY_OUT_4 		:	> REG_ARRY_OUT_4 	, PAGE = 1
   	REG_ARRY_OUT_5 		:	> REG_ARRY_OUT_5 	, PAGE = 1
   	REG_ARRY_OUT_6 		:	> REG_ARRY_OUT_6 	, PAGE = 1
   	REG_ARRY_OUT_7 		:	> REG_ARRY_OUT_7 	, PAGE = 1
   	REG_ARRY_OUT_8 		:	> REG_ARRY_OUT_8 	, PAGE = 1
   	REG_ARRY_OUT_9 		:	> REG_ARRY_OUT_9 	, PAGE = 1
   	REG_ARRY_OUT_a 		:	> REG_ARRY_OUT_a 	, PAGE = 1
   	REG_ARRY_OUT_b 		:	> REG_ARRY_OUT_b 	, PAGE = 1
   	REG_ARRY_OUT_c 		:	> REG_ARRY_OUT_c 	, PAGE = 1
   	REG_ARRY_OUT_d 		:	> REG_ARRY_OUT_d 	, PAGE = 1
   	REG_ARRY_OUT_e 		:	> REG_ARRY_OUT_e 	, PAGE = 1
   	REG_ARRY_OUT_f 		:	> REG_ARRY_OUT_f 	, PAGE = 1
   	REG_ARRY_OUT_10		:	> REG_ARRY_OUT_10	, PAGE = 1
   	REG_ARRY_OUT_11		:	> REG_ARRY_OUT_11	, PAGE = 1
   	REG_ARRY_OUT_12		:	> REG_ARRY_OUT_12	, PAGE = 1
   	REG_ARRY_OUT_13		:	> REG_ARRY_OUT_13	, PAGE = 1
   	REG_ARRY_OUT_14		:	> REG_ARRY_OUT_14	, PAGE = 1
   	REG_ARRY_OUT_15		:	> REG_ARRY_OUT_15	, PAGE = 1
   	REG_ARRY_OUT_16		:	> REG_ARRY_OUT_16	, PAGE = 1
   	REG_ARRY_OUT_17		:	> REG_ARRY_OUT_17	, PAGE = 1
   	REG_ARRY_OUT_18		:	> REG_ARRY_OUT_18	, PAGE = 1
   	REG_ARRY_OUT_19		:	> REG_ARRY_OUT_19	, PAGE = 1
   	REG_ARRY_OUT_1a		:	> REG_ARRY_OUT_1a	, PAGE = 1
   	REG_ARRY_OUT_1b		:	> REG_ARRY_OUT_1b	, PAGE = 1
   	REG_ARRY_OUT_1c		:	> REG_ARRY_OUT_1c	, PAGE = 1
   	REG_ARRY_OUT_1d		:	> REG_ARRY_OUT_1d	, PAGE = 1
   	REG_ARRY_OUT_1e		:	> REG_ARRY_OUT_1e	, PAGE = 1
   	REG_ARRY_OUT_1f		:	> REG_ARRY_OUT_1f	, PAGE = 1
   	REG_ARRY_OUT_20		:	> REG_ARRY_OUT_20	, PAGE = 1
   	REG_ARRY_OUT_21		:	> REG_ARRY_OUT_21	, PAGE = 1
   	REG_ARRY_OUT_22		:	> REG_ARRY_OUT_22	, PAGE = 1
   	REG_ARRY_OUT_23		:	> REG_ARRY_OUT_23	, PAGE = 1
   	REG_ARRY_OUT_24		:	> REG_ARRY_OUT_24	, PAGE = 1
   	REG_ARRY_OUT_25		:	> REG_ARRY_OUT_25	, PAGE = 1
   	REG_ARRY_OUT_26		:	> REG_ARRY_OUT_26	, PAGE = 1
   	REG_ARRY_OUT_27		:	> REG_ARRY_OUT_27	, PAGE = 1
   	REG_ARRY_OUT_28		:	> REG_ARRY_OUT_28	, PAGE = 1
   	REG_ARRY_OUT_29		:	> REG_ARRY_OUT_29	, PAGE = 1
   	REG_ARRY_OUT_2a		:	> REG_ARRY_OUT_2a	, PAGE = 1
   	REG_ARRY_OUT_2b		:	> REG_ARRY_OUT_2b	, PAGE = 1
   	REG_ARRY_OUT_2c		:	> REG_ARRY_OUT_2c	, PAGE = 1
   	REG_ARRY_OUT_2d		:	> REG_ARRY_OUT_2d	, PAGE = 1
   	REG_ARRY_OUT_2e		:	> REG_ARRY_OUT_2e	, PAGE = 1
   	REG_ARRY_OUT_2f		:	> REG_ARRY_OUT_2f	, PAGE = 1
   	REG_ARRY_OUT_30		:	> REG_ARRY_OUT_30	, PAGE = 1
   	REG_ARRY_OUT_31		:	> REG_ARRY_OUT_31	, PAGE = 1
   	REG_ARRY_OUT_32		:	> REG_ARRY_OUT_32	, PAGE = 1
   	REG_ARRY_OUT_33		:	> REG_ARRY_OUT_33	, PAGE = 1
   	REG_ARRY_OUT_34		:	> REG_ARRY_OUT_34	, PAGE = 1
   	REG_ARRY_OUT_35		:	> REG_ARRY_OUT_35	, PAGE = 1
   	REG_ARRY_OUT_36		:	> REG_ARRY_OUT_36	, PAGE = 1
   	REG_ARRY_OUT_37		:	> REG_ARRY_OUT_37	, PAGE = 1
   	REG_ARRY_OUT_38		:	> REG_ARRY_OUT_38	, PAGE = 1
   	REG_ARRY_OUT_39		:	> REG_ARRY_OUT_39	, PAGE = 1
   	REG_ARRY_OUT_3a		:	> REG_ARRY_OUT_3a	, PAGE = 1
   	REG_ARRY_OUT_3b		:	> REG_ARRY_OUT_3b	, PAGE = 1
   	REG_ARRY_OUT_3c		:	> REG_ARRY_OUT_3c	, PAGE = 1
   	REG_ARRY_OUT_3d		:	> REG_ARRY_OUT_3d	, PAGE = 1
   	REG_ARRY_OUT_3e		:	> REG_ARRY_OUT_3e	, PAGE = 1
   	REG_ARRY_OUT_3f		:	> REG_ARRY_OUT_3f	, PAGE = 1
	REG_MAPPED_PORT_40	:	> REG_MAPPED_PORT_40, PAGE = 1
	REG_MAPPED_PORT_41	:	> REG_MAPPED_PORT_41, PAGE = 1
	REG_MAPPED_PORT_42	:	> REG_MAPPED_PORT_42, PAGE = 1
	REG_MAPPED_PORT_43	:	> REG_MAPPED_PORT_43, PAGE = 1
	REG_MAPPED_PORT_44	:	> REG_MAPPED_PORT_44, PAGE = 1
	REG_MAPPED_PORT_45	:	> REG_MAPPED_PORT_45, PAGE = 1
	REG_MAPPED_PORT_46	:	> REG_MAPPED_PORT_46, PAGE = 1
	REG_MAPPED_PORT_47	:	> REG_MAPPED_PORT_47, PAGE = 1
	REG_MAPPED_PORT_48	:	> REG_MAPPED_PORT_48, PAGE = 1
	REG_MAPPED_PORT_49	:	> REG_MAPPED_PORT_49, PAGE = 1
	REG_MAPPED_PORT_4a	:	> REG_MAPPED_PORT_4a, PAGE = 1
	REG_MAPPED_PORT_4b	:	> REG_MAPPED_PORT_4b, PAGE = 1
	REG_MAPPED_PORT_4c	:	> REG_MAPPED_PORT_4c, PAGE = 1
	REG_MAPPED_PORT_4d	:	> REG_MAPPED_PORT_4d, PAGE = 1
	REG_MAPPED_PORT_4e	:	> REG_MAPPED_PORT_4e, PAGE = 1
	REG_MAPPED_PORT_4f	:	> REG_MAPPED_PORT_4f, PAGE = 1
}

/*
//===========================================================================
// End of file.
//===========================================================================
*/
