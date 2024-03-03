;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1170 (Feb 16 2022) (MSVC)
; This file was generated Fri Mar 01 07:07:23 2024
;--------------------------------------------------------
$name lab4
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _get_phase
	public _GPIO_Init
	public _ADC_Read
	public _ADC_Init
	public _getsn
	public _LCDprint
	public _LCD_4BIT
	public _WriteCommand
	public _WriteData
	public _LCD_byte
	public _LCD_pulse
	public _waitms
	public _Timer3us
	public __c51_external_startup
	public _LCDprint_PARM_3
	public _getsn_PARM_2
	public _LCDprint_PARM_2
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_LCDprint_PARM_2:
	ds 1
_getsn_PARM_2:
	ds 2
_getsn_buff_1_64:
	ds 3
_getsn_sloc0_1_0:
	ds 2
_main_buff_1_79:
	ds 17
_main_sloc0_1_0:
	ds 4
_main_sloc1_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
_main_voltage_1_79:
	ds 4
_main_angle_1_79:
	ds 4
_main_vr_1_79:
	ds 4
_main_vi_1_79:
	ds 4
_main_cr_1_79:
	ds 4
_main_ci_1_79:
	ds 4
_main_zr_1_79:
	ds 4
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_LCDprint_PARM_3:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:34: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:37: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:38: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:39: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:46: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:47: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:48: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:69: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:70: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:71: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:72: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:73: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:74: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:79: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:80: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:81: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:82: XBR2     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:88: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:89: CKCON0 |= 0b_0000_0000 ; // Timer 1 uses the system clock divided by 12.
	mov	_CKCON0,_CKCON0
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:90: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:91: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:92: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:93: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:94: TR1 = 1; // START Timer1
	setb	_TR1
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:95: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:97: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:102: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:107: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:109: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:110: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:112: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:113: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L003004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L003007?
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:115: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L003001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L003001?
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:116: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:113: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L003004?
L003007?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:118: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:121: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:125: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L004005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L004009?
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:126: for (k=0; k<4; k++) Timer3us(250);
	mov	r6,#0x00
L004001?:
	cjne	r6,#0x04,L004018?
L004018?:
	jnc	L004007?
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Timer3us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
	sjmp	L004001?
L004007?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:125: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L004005?
	inc	r5
	sjmp	L004005?
L004009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:129: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:131: LCD_E=1;
	setb	_P2_0
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:132: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:133: LCD_E=0;
	clr	_P2_0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:136: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:139: ACC=x; //Send high nible
	mov	_ACC,r2
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:140: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P1_0,c
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:141: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P1_1,c
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:142: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P1_2,c
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:143: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P1_3,c
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:144: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:145: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
	pop	ar2
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:146: ACC=x; //Send low nible
	mov	_ACC,r2
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:147: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P1_0,c
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:148: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P1_1,c
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:149: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P1_2,c
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:150: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P1_3,c
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:151: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:154: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:156: LCD_RS=1;
	setb	_P1_7
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:157: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:158: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:161: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:163: LCD_RS=0;
	clr	_P1_7
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:164: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:165: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:168: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:170: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_0
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:172: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:174: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:175: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:176: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:179: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:180: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:181: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:182: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:185: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:189: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L010013?
	mov	r5,#0xC0
	sjmp	L010014?
L010013?:
	mov	r5,#0x80
L010014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:190: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:191: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L010003?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L010006?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L010003?
	inc	r6
	sjmp	L010003?
L010006?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:192: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L010011?
	mov	ar2,r5
	mov	ar3,r6
L010007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L010011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L010007?
	inc	r3
	sjmp	L010007?
L010011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getsn'
;------------------------------------------------------------
;len                       Allocated with name '_getsn_PARM_2'
;buff                      Allocated with name '_getsn_buff_1_64'
;j                         Allocated with name '_getsn_sloc0_1_0'
;c                         Allocated to registers r3 
;sloc0                     Allocated with name '_getsn_sloc0_1_0'
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:195: int getsn (char * buff, int len)
;	-----------------------------------------
;	 function getsn
;	-----------------------------------------
_getsn:
	mov	_getsn_buff_1_64,dpl
	mov	(_getsn_buff_1_64 + 1),dph
	mov	(_getsn_buff_1_64 + 2),b
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:200: for(j=0; j<(len-1); j++)
	clr	a
	mov	_getsn_sloc0_1_0,a
	mov	(_getsn_sloc0_1_0 + 1),a
	mov	a,_getsn_PARM_2
	add	a,#0xff
	mov	r7,a
	mov	a,(_getsn_PARM_2 + 1)
	addc	a,#0xff
	mov	r0,a
	mov	r1,#0x00
	mov	r2,#0x00
L011005?:
	clr	c
	mov	a,r1
	subb	a,r7
	mov	a,r2
	xrl	a,#0x80
	mov	b,r0
	xrl	b,#0x80
	subb	a,b
	jnc	L011008?
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:202: c=getchar();
	push	ar2
	push	ar7
	push	ar0
	push	ar1
	lcall	_getchar
	mov	r3,dpl
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar2
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:203: if ( (c=='\n') || (c=='\r') )
	cjne	r3,#0x0A,L011015?
	sjmp	L011001?
L011015?:
	cjne	r3,#0x0D,L011002?
L011001?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:205: buff[j]=0;
	mov	a,_getsn_sloc0_1_0
	add	a,_getsn_buff_1_64
	mov	r4,a
	mov	a,(_getsn_sloc0_1_0 + 1)
	addc	a,(_getsn_buff_1_64 + 1)
	mov	r5,a
	mov	r6,(_getsn_buff_1_64 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	clr	a
	lcall	__gptrput
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:206: return j;
	mov	dpl,_getsn_sloc0_1_0
	mov	dph,(_getsn_sloc0_1_0 + 1)
	ret
L011002?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:210: buff[j]=c;
	mov	a,r1
	add	a,_getsn_buff_1_64
	mov	r4,a
	mov	a,r2
	addc	a,(_getsn_buff_1_64 + 1)
	mov	r5,a
	mov	r6,(_getsn_buff_1_64 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r3
	lcall	__gptrput
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:200: for(j=0; j<(len-1); j++)
	inc	r1
	cjne	r1,#0x00,L011018?
	inc	r2
L011018?:
	mov	_getsn_sloc0_1_0,r1
	mov	(_getsn_sloc0_1_0 + 1),r2
	sjmp	L011005?
L011008?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:213: buff[j]=0;
	mov	a,_getsn_sloc0_1_0
	add	a,_getsn_buff_1_64
	mov	r2,a
	mov	a,(_getsn_sloc0_1_0 + 1)
	addc	a,(_getsn_buff_1_64 + 1)
	mov	r3,a
	mov	r4,(_getsn_buff_1_64 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:214: return len;
	mov	dpl,_getsn_PARM_2
	mov	dph,(_getsn_PARM_2 + 1)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:217: void ADC_Init(void)
;	-----------------------------------------
;	 function ADC_Init
;	-----------------------------------------
_ADC_Init:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:223: ADC0MX = QFP32_MUX_P2_6;
	mov	_ADC0MX,#0x13
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:226: ADC0CN1 = 0x81; // Set ADC0 to 14-bit mode
	mov	_ADC0CN1,#0x81
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:230: REF0CN = 0x80; // Set Vref to use internal reference (2.4V)
	mov	_REF0CN,#0x80
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:233: ADC0CN0 = 0x80; // Enable the ADC0
	mov	_ADC0CN0,#0x80
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_Read'
;------------------------------------------------------------
;ans                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:236: uint16_t ADC_Read(void)
;	-----------------------------------------
;	 function ADC_Read
;	-----------------------------------------
_ADC_Read:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:241: ADC0CN0 |= 0x10; // Start an ADC conversion
	orl	_ADC0CN0,#0x10
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:244: while ((ADC0CN0 & 0x20) == 0x00);
L013001?:
	mov	a,_ADC0CN0
	jnb	acc.5,L013001?
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:245: ADC0CN0 &= ~0x20; // Clear the conversion complete flag
	anl	_ADC0CN0,#0xDF
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:247: ans = ADC0H;
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:248: ans <<= 8;
	mov	r3,_ADC0H
	mov	r2,#0x00
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:249: ans |= ADC0L;
	mov	r4,_ADC0L
	mov	r5,#0x00
	mov	a,r4
	orl	ar2,a
	mov	a,r5
	orl	ar3,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:251: return ans;
	mov	dpl,r2
	mov	dph,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GPIO_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:254: void GPIO_Init(void)
;	-----------------------------------------
;	 function GPIO_Init
;	-----------------------------------------
_GPIO_Init:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:257: PHASE_A = 1;
	setb	_P3_2
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:258: PHASE_B = 1;
	setb	_P3_3
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:259: PHASE_SIGN = 1;
	setb	_P3_7
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:260: P3MDOUT = 0x00;
	mov	_P3MDOUT,#0x00
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:261: P3MDIN = 0x8c;
	mov	_P3MDIN,#0x8C
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get_phase'
;------------------------------------------------------------
;i                         Allocated to registers r4 r5 
;phase                     Allocated to registers r2 r3 
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:265: uint16_t get_phase(void)
;	-----------------------------------------
;	 function get_phase
;	-----------------------------------------
_get_phase:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:268: uint16_t phase = 0;
	mov	r2,#0x00
	mov	r3,#0x00
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:269: for(i = 0; i < 4096; i++){
	mov	r4,#0x00
	mov	r5,#0x00
L015001?:
	mov	a,#0x100 - 0x10
	add	a,r5
	jc	L015004?
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:270: phase += PHASE_A ^ PHASE_B;
	mov	c,_P3_2
	clr	a
	rlc	a
	mov	r6,a
	mov	c,_P3_3
	clr	a
	rlc	a
	xrl	ar6,a
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	a,r6
	add	a,r2
	mov	r2,a
	mov	a,r7
	addc	a,r3
	mov	r3,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:269: for(i = 0; i < 4096; i++){
	inc	r4
	cjne	r4,#0x00,L015001?
	inc	r5
	sjmp	L015001?
L015004?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:272: return phase;
	mov	dpl,r2
	mov	dph,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;buff                      Allocated with name '_main_buff_1_79'
;result                    Allocated to registers 
;capacitance               Allocated to registers r2 r3 r4 r5 
;sloc0                     Allocated with name '_main_sloc0_1_0'
;sloc1                     Allocated with name '_main_sloc1_1_0'
;voltage                   Allocated with name '_main_voltage_1_79'
;angle                     Allocated with name '_main_angle_1_79'
;vr                        Allocated with name '_main_vr_1_79'
;vi                        Allocated with name '_main_vi_1_79'
;cr                        Allocated with name '_main_cr_1_79'
;ci                        Allocated with name '_main_ci_1_79'
;zr                        Allocated with name '_main_zr_1_79'
;zi                        Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:276: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:287: GPIO_Init();
	lcall	_GPIO_Init
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:290: LCD_4BIT();
	lcall	_LCD_4BIT
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:291: ADC_Init();
	lcall	_ADC_Init
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:293: LCDprint("LCD 4-bit test:", 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_0
	mov	b,#0x80
	lcall	_LCDprint
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:294: LCDprint("qwedqeee", 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_1
	mov	b,#0x80
	lcall	_LCDprint
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:295: while(1)
L016015?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:297: result = ADC_Read();
	lcall	_ADC_Read
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:299: voltage = (float)result * VREF / (4*16383.0f);
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0xD3
	mov	a,#0x3F
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xFC
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x47
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r0,#_main_voltage_1_79
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:308: angle= (float)get_phase() * PI / 4096.0f;
	lcall	_get_phase
	lcall	___uint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dptr,#0x0FDB
	mov	b,#0x49
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x45
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r0,#_main_angle_1_79
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:309: if( PHASE_SIGN == 0) angle = -angle;
	jb	_P3_7,L016002?
	mov	r0,#_main_angle_1_79
	mov	a,@r0
	mov	@r0,a
	inc	r0
	mov	a,@r0
	mov	@r0,a
	inc	r0
	mov	a,@r0
	mov	@r0,a
	inc	r0
	mov	a,@r0
	cpl	acc.7
	mov	@r0,a
L016002?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:312: vr = voltage * cosf(angle);
	mov	r0,#_main_angle_1_79
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	_cosf
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	r0,#_main_voltage_1_79
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	___fsmul
	mov	r0,#_main_vr_1_79
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:313: vi = voltage * sinf(angle);
	mov	r0,#_main_angle_1_79
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	_sinf
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	r0,#_main_voltage_1_79
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	___fsmul
	mov	r0,#_main_vi_1_79
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:316: cr = (OPEN_CIRCUIT_VOLTAGE - vr) / DIVISOR;
	mov	r0,#_main_vr_1_79
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	dptr,#0x0000
	mov	b,#0xB0
	mov	a,#0x3F
	lcall	___fssub
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0x60
	push	acc
	mov	a,#0x9F
	push	acc
	mov	a,#0x45
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
	lcall	___fsdiv
	mov	r0,#_main_cr_1_79
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:317: ci = -vi / DIVISOR;
	mov	r0,#_main_vi_1_79
	mov	ar6,@r0
	inc	r0
	mov	ar7,@r0
	inc	r0
	mov	ar2,@r0
	inc	r0
	mov	a,@r0
	cpl	acc.7
	mov	r3,a
	clr	a
	push	acc
	mov	a,#0x60
	push	acc
	mov	a,#0x9F
	push	acc
	mov	a,#0x45
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
	lcall	___fsdiv
	mov	r0,#_main_ci_1_79
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:320: zr = (vr * cr + vi * ci) / (cr * cr + ci * ci) * Z_CAL;
	mov	r0,#_main_cr_1_79
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	r0,#_main_vr_1_79
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	___fsmul
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r0,#_main_ci_1_79
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	r0,#_main_vi_1_79
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r0,#_main_cr_1_79
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	r0,#_main_cr_1_79
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	___fsmul
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r0,#_main_ci_1_79
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	r0,#_main_ci_1_79
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	dpl,_main_sloc1_1_0
	mov	dph,(_main_sloc1_1_0 + 1)
	mov	b,(_main_sloc1_1_0 + 2)
	mov	a,(_main_sloc1_1_0 + 3)
	lcall	___fsadd
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsdiv
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dptr,#0xCCCD
	mov	b,#0x4C
	mov	a,#0x3F
	lcall	___fsmul
	mov	r0,#_main_zr_1_79
	mov	@r0,dpl
	inc	r0
	mov	@r0,dph
	inc	r0
	mov	@r0,b
	inc	r0
	mov	@r0,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:321: zi = (vi * cr - vr * ci) / (cr * cr + ci * ci) * Z_CAL;
	mov	r0,#_main_cr_1_79
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	r0,#_main_vi_1_79
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	___fsmul
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r0,#_main_ci_1_79
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	r0,#_main_vr_1_79
	mov	dpl,@r0
	inc	r0
	mov	dph,@r0
	inc	r0
	mov	b,@r0
	inc	r0
	mov	a,@r0
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xCCCD
	mov	b,#0x4C
	mov	a,#0x3F
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:325: sprintf(buff, "ZR: %.3f", zr);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	r0,#_main_zr_1_79
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	inc	r0
	mov	a,@r0
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_buff_1_79
	push	acc
	mov	a,#(_main_buff_1_79 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:326: LCDprint(buff, 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_buff_1_79
	mov	b,#0x40
	lcall	_LCDprint
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:332: if( zi > 0.0 ){
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jnz	L016026?
	ljmp	L016012?
L016026?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:333: sprintf(buff, "L: %.3fmH", zi / OMEGA * 1000.0f);
	mov	a,#0x2A
	push	acc
	mov	a,#0xDD
	push	acc
	mov	a,#0x0E
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsmul
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_buff_1_79
	push	acc
	mov	a,#(_main_buff_1_79 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:334: LCDprint(buff, 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_buff_1_79
	mov	b,#0x40
	lcall	_LCDprint
	ljmp	L016015?
L016012?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:337: capacitance = -1.0f / (zi * OMEGA) * 1000000.0f;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xDD2A
	mov	b,#0x0E
	mov	a,#0x46
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0xBF
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x2400
	mov	b,#0x74
	mov	a,#0x49
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:338: if(capacitance < 0.0001f){
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#0x17
	push	acc
	mov	a,#0xB7
	push	acc
	mov	a,#0xD1
	push	acc
	mov	a,#0x38
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L016009?
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:339: capacitance = 0.0;
	mov	r2,#0x00
	mov	r3,#0x00
	mov	r4,#0x00
	mov	r5,#0x00
	ljmp	L016010?
L016009?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:340: }else if(capacitance < 0.020f){
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#0x0A
	push	acc
	mov	a,#0xD7
	push	acc
	mov	a,#0xA3
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L016006?
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:341: capacitance *= 0.85;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x999A
	mov	b,#0x59
	mov	a,#0x3F
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	sjmp	L016010?
L016006?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:342: }else if (capacitance > 0.30f)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0x3E
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L016010?
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:344: capacitance *= 2.3;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0x13
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
L016010?:
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:347: sprintf(buff, "C: %.3fuF", capacitance);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_buff_1_79
	push	acc
	mov	a,#(_main_buff_1_79 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	D:\UBC\ELEC 291\Lab4\src\lab4.c:348: LCDprint(buff, 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_buff_1_79
	mov	b,#0x40
	lcall	_LCDprint
	ljmp	L016015?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'LCD 4-bit test:'
	db 0x00
__str_1:
	db 'qwedqeee'
	db 0x00
__str_2:
	db 'ZR: %.3f'
	db 0x00
__str_3:
	db 'L: %.3fmH'
	db 0x00
__str_4:
	db 'C: %.3fuF'
	db 0x00

	CSEG

end
