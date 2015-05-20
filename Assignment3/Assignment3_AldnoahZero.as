opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 52 "E:\Aldnoah.Zero\Assignment3\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 52 "E:\Aldnoah.Zero\Assignment3\Main.c"
	dw 0xFFFE & 0xFFFB & 0xFFFF & 0xFFBF & 0xFFF7 & 0xFFFF & 0xFF7F & 0xFFFF ;#
	FNCALL	_main,_init
	FNCALL	_main,_robotLoadSong
	FNCALL	_main,_robot_read
	FNCALL	_main,_readAvgDistance
	FNCALL	_main,_UpdateDisplay
	FNCALL	_main,_Menu
	FNCALL	_main,_calibrateIR
	FNCALL	_main,_ser_putch
	FNCALL	_main,_robotMoveSpeed
	FNCALL	_main,_robotTurnSpeed
	FNCALL	_main,_Init_Follow_IR
	FNCALL	_main,_robotFollow
	FNCALL	_main,_RobotDrive
	FNCALL	_main,_rotate
	FNCALL	_main,_robot_turnRight
	FNCALL	_main,_ChargeMode
	FNCALL	_Init_Follow_IR,_calibrateIR
	FNCALL	_Init_Follow_IR,_rotate
	FNCALL	_ChargeMode,_ser_putch
	FNCALL	_ChargeMode,_RobotBattRead
	FNCALL	_ChargeMode,_UpdateDisplay
	FNCALL	_robot_turnRight,_RobotDrive
	FNCALL	_robot_turnRight,_readAvgDistance
	FNCALL	_robot_turnRight,_ser_putch
	FNCALL	_robot_turnRight,_robot_read
	FNCALL	_robot_turnRight,_UpdateDisplay
	FNCALL	_robot_turnRight,___wmul
	FNCALL	_robot_turnRight,___awdiv
	FNCALL	_robot_turnRight,_abs
	FNCALL	_robotFollow,_RobotDrive
	FNCALL	_robotFollow,_readAvgDistance
	FNCALL	_robotFollow,_rotate
	FNCALL	_robotFollow,_robot_read
	FNCALL	_robotFollow,_UpdateDisplay
	FNCALL	_robotTurnSpeed,_robotTurn
	FNCALL	_robotTurnSpeed,_robot_read
	FNCALL	_robotTurnSpeed,_UpdateDisplay
	FNCALL	_robotTurnSpeed,_abs
	FNCALL	_robotMoveSpeed,_RobotDrive
	FNCALL	_robotMoveSpeed,_robot_read
	FNCALL	_robotMoveSpeed,_UpdateDisplay
	FNCALL	_robotMoveSpeed,_abs
	FNCALL	_calibrateIR,_rotate
	FNCALL	_calibrateIR,_UpdateDisplay
	FNCALL	_UpdateDisplay,_lcd_write_control
	FNCALL	_UpdateDisplay,_sprintf
	FNCALL	_UpdateDisplay,_lcd_set_cursor
	FNCALL	_UpdateDisplay,_lcd_write_string
	FNCALL	_UpdateDisplay,___awmod
	FNCALL	_readAvgDistance,_readDistance
	FNCALL	_readAvgDistance,___lwdiv
	FNCALL	_readAvgDistance,_ADCconvert
	FNCALL	_init,_ser_init
	FNCALL	_init,_init_adc
	FNCALL	_init,_lcd_init
	FNCALL	_init,_robo_init
	FNCALL	_readDistance,_adc_read_channel
	FNCALL	_RobotBattRead,_ser_putch
	FNCALL	_RobotBattRead,_ser_getch
	FNCALL	_robot_read,_ser_putch
	FNCALL	_robot_read,_ser_getch
	FNCALL	_lcd_init,_lcd_write_control
	FNCALL	_lcd_write_string,_lcd_write_data
	FNCALL	_lcd_set_cursor,_lcd_write_control
	FNCALL	_abs,___wmul
	FNCALL	_robotTurn,_ser_putch
	FNCALL	_ser_getch,_ser_isrx
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_ADCconvert,___wmul
	FNCALL	_ADCconvert,___lwdiv
	FNCALL	_rotate,_spi_transfer
	FNCALL	_RobotDrive,_ser_putch
	FNCALL	_robotLoadSong,_ser_putch
	FNCALL	_robo_init,_ser_putch
	FNCALL	_adc_read_channel,_adc_read
	FNROOT	_main
	FNCALL	_isr1,i1___lwmod
	FNCALL	_isr1,_ReadButtons
	FNCALL	_ReadButtons,_Debounce
	FNCALL	intlevel1,_isr1
	global	intlevel1
	FNROOT	intlevel1
	global	_menuStrings
	global	_shortMenuStrings
	global	_current_step
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	49

;initializer for _menuStrings
	retlw	(STR_1-__stringbase)&0ffh
	retlw	(STR_2-__stringbase)&0ffh
	retlw	(STR_3-__stringbase)&0ffh
	retlw	(STR_4-__stringbase)&0ffh
	retlw	(STR_5-__stringbase)&0ffh
	retlw	(STR_6-__stringbase)&0ffh
	line	50

;initializer for _shortMenuStrings
	retlw	(STR_7-__stringbase)&0ffh
	retlw	(STR_8-__stringbase)&0ffh
	retlw	(STR_9-__stringbase)&0ffh
	retlw	(STR_10-__stringbase)&0ffh
	retlw	(STR_11-__stringbase)&0ffh
	retlw	(STR_12-__stringbase)&0ffh
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	45

;initializer for _current_step
	retlw	03Ch
	global	_dpowers
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
	line	350
_dpowers:
	retlw	01h
	retlw	0

	retlw	0Ah
	retlw	0

	retlw	064h
	retlw	0

	retlw	0E8h
	retlw	03h

	retlw	010h
	retlw	027h

	global	_dpowers
	global	_adcVal
	global	_BumpSensors
	global	_DistHighByte
	global	_DistLowByte
	global	_VwallSensor
	global	UpdateDisplay@F1261
	global	_txfifo
	global	_buttonPressed
	global	_CenterPressed
	global	_CenterReleased
	global	_DownPressed
	global	_DownReleased
	global	_LeftPressed
	global	_LeftReleased
	global	_RTC_FLAG_1MS
	global	_RTC_FLAG_250MS
	global	_RTC_FLAG_500MS
	global	_RightPressed
	global	_RightReleased
	global	_UpPressed
	global	_UpReleased
	global	_rxfifo
	global	_BattCharge
	global	_BattState
	global	_Disp1
	global	_Disp2
	global	_IRdistance
	global	_RTC_Counter
	global	_TotalDistTravelled
	global	_angleTurned
	global	_distTravelled
	global	_dist_high
	global	_dist_low
	global	_pos
	global	_total
	global	_totalSteps
	global	_AngleHighByte
	global	_AngleLowByte
	global	_CenterDebounceCount
	global	_CliffSensors
	global	_DownDebounceCount
	global	_LeftDebounceCount
	global	_ROBOTerror
	global	_RightDebounceCount
	global	_UpDebounceCount
	global	_currentMenu
	global	_highByte
	global	_lowByte
	global	_rxiptr
	global	_rxoptr
	global	_ser_tmp
	global	_turnhighByte
	global	_turnlowByte
	global	_txiptr
	global	_txoptr
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTA
_PORTA	set	5
	global	_PORTD
_PORTD	set	8
	global	_PORTE
_PORTE	set	9
	global	_RCREG
_RCREG	set	26
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_TMR0
_TMR0	set	1
	global	_TXREG
_TXREG	set	25
	global	AT25256A@CS0
AT25256A@CS0	set	56
	global	AT25256A@CS1
AT25256A@CS1	set	57
	global	_CARRY
_CARRY	set	24
	global	_CHS0
_CHS0	set	251
	global	_CHS1
_CHS1	set	252
	global	_CHS2
_CHS2	set	253
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_GO
_GO	set	250
	global	_OERR
_OERR	set	193
	global	_PEIE
_PEIE	set	94
	global	_RB0
_RB0	set	48
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RCIF
_RCIF	set	101
	global	_RE0
_RE0	set	72
	global	_RE1
_RE1	set	73
	global	_RE2
_RE2	set	74
	global	_RX9
_RX9	set	198
	global	_SPEN
_SPEN	set	199
	global	_SSPIF
_SSPIF	set	99
	global	_TMR0IE
_TMR0IE	set	93
	global	_TMR0IF
_TMR0IF	set	90
	global	_TXIF
_TXIF	set	100
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_SPBRG
_SPBRG	set	153
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_TRISE
_TRISE	set	137
	global	_BRGH
_BRGH	set	1218
	global	_RCIE
_RCIE	set	1125
	global	_SYNC
_SYNC	set	1220
	global	_TX9
_TX9	set	1222
	global	_TXEN
_TXEN	set	1221
	global	_TXIE
_TXIE	set	1124
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	
STR_18:	
	retlw	32	;' '
	retlw	67	;'C'
	retlw	104	;'h'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	103	;'g'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	32	;' '
	retlw	77	;'M'
	retlw	111	;'o'
	retlw	100	;'d'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_14:	
	retlw	90	;'Z'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	111	;'o'
	retlw	32	;' '
	retlw	83	;'S'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	112	;'p'
	retlw	95	;'_'
	retlw	77	;'M'
	retlw	111	;'o'
	retlw	116	;'t'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	0
psect	strings
	
STR_13:	
	retlw	73	;'I'
	retlw	82	;'R'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	99	;'c'
	retlw	109	;'m'
	retlw	32	;' '
	retlw	68	;'D'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_26:	
	retlw	32	;' '
	retlw	32	;' '
	retlw	69	;'E'
	retlw	88	;'X'
	retlw	73	;'I'
	retlw	84	;'T'
	retlw	32	;' '
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_6:	
	retlw	32	;' '
	retlw	67	;'C'
	retlw	104	;'h'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	103	;'g'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_2:	
	retlw	83	;'S'
	retlw	99	;'c'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	95	;'_'
	retlw	51	;'3'
	retlw	54	;'6'
	retlw	48	;'0'
	retlw	0
psect	strings
	
STR_1:	
	retlw	67	;'C'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	105	;'i'
	retlw	98	;'b'
	retlw	95	;'_'
	retlw	73	;'I'
	retlw	82	;'R'
	retlw	0
psect	strings
	
STR_5:	
	retlw	70	;'F'
	retlw	108	;'l'
	retlw	119	;'w'
	retlw	95	;'_'
	retlw	87	;'W'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	108	;'l'
	retlw	0
psect	strings
	
STR_3:	
	retlw	68	;'D'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	118	;'v'
	retlw	101	;'e'
	retlw	95	;'_'
	retlw	50	;'2'
	retlw	109	;'m'
	retlw	0
psect	strings
	
STR_4:	
	retlw	68	;'D'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	118	;'v'
	retlw	101	;'e'
	retlw	95	;'_'
	retlw	76	;'L'
	retlw	0
psect	strings
	
STR_16:	
	retlw	67	;'C'
	retlw	79	;'O'
	retlw	78	;'N'
	retlw	70	;'F'
	retlw	73	;'I'
	retlw	82	;'R'
	retlw	77	;'M'
	retlw	0
psect	strings
	
STR_19:	
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	109	;'m'
	retlw	86	;'V'
	retlw	0
psect	strings
	
STR_9:	
	retlw	68	;'D'
	retlw	114	;'r'
	retlw	50	;'2'
	retlw	0
psect	strings
	
STR_15:	
	retlw	60	;'<'
	retlw	60	;'<'
	retlw	60	;'<'
	retlw	0
psect	strings
	
STR_17:	
	retlw	62	;'>'
	retlw	62	;'>'
	retlw	62	;'>'
	retlw	0
psect	strings
	
STR_10:	
	retlw	68	;'D'
	retlw	114	;'r'
	retlw	76	;'L'
	retlw	0
psect	strings
	
STR_12:	
	retlw	67	;'C'
	retlw	104	;'h'
	retlw	103	;'g'
	retlw	0
psect	strings
	
STR_7:	
	retlw	67	;'C'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	0
psect	strings
	
STR_8:	
	retlw	83	;'S'
	retlw	99	;'c'
	retlw	110	;'n'
	retlw	0
psect	strings
	
STR_11:	
	retlw	70	;'F'
	retlw	108	;'l'
	retlw	119	;'w'
	retlw	0
psect	strings
	
STR_22:	
	retlw	70	;'F'
	retlw	67	;'C'
	retlw	0
psect	strings
	
STR_20:	
	retlw	78	;'N'
	retlw	67	;'C'
	retlw	0
psect	strings
	
STR_21:	
	retlw	82	;'R'
	retlw	67	;'C'
	retlw	0
psect	strings
	
STR_23:	
	retlw	84	;'T'
	retlw	67	;'C'
	retlw	0
psect	strings
	
STR_24:	
	retlw	87	;'W'
	retlw	97	;'a'
	retlw	0
psect	strings
STR_25	equ	STR_22+0
	file	"Assignment3_AldnoahZero.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_CenterPressed:
       ds      1

_CenterReleased:
       ds      1

_DownPressed:
       ds      1

_DownReleased:
       ds      1

_LeftPressed:
       ds      1

_LeftReleased:
       ds      1

_RTC_FLAG_1MS:
       ds      1

_RTC_FLAG_250MS:
       ds      1

_RTC_FLAG_500MS:
       ds      1

_RightPressed:
       ds      1

_RightReleased:
       ds      1

_UpPressed:
       ds      1

_UpReleased:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_buttonPressed:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_adcVal:
       ds      2

_BumpSensors:
       ds      1

_DistHighByte:
       ds      1

_DistLowByte:
       ds      1

_VwallSensor:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_rxfifo:
       ds      16

_BattCharge:
       ds      2

_BattState:
       ds      2

_Disp1:
       ds      2

_Disp2:
       ds      2

_IRdistance:
       ds      2

_RTC_Counter:
       ds      2

_TotalDistTravelled:
       ds      2

_angleTurned:
       ds      2

_distTravelled:
       ds      2

_dist_high:
       ds      2

_dist_low:
       ds      2

_pos:
       ds      2

_total:
       ds      2

_totalSteps:
       ds      2

_AngleHighByte:
       ds      1

_AngleLowByte:
       ds      1

_CenterDebounceCount:
       ds      1

_CliffSensors:
       ds      1

_DownDebounceCount:
       ds      1

_LeftDebounceCount:
       ds      1

_ROBOTerror:
       ds      1

_RightDebounceCount:
       ds      1

_UpDebounceCount:
       ds      1

_currentMenu:
       ds      1

_highByte:
       ds      1

_lowByte:
       ds      1

_rxiptr:
       ds      1

_rxoptr:
       ds      1

_ser_tmp:
       ds      1

_turnhighByte:
       ds      1

_turnlowByte:
       ds      1

_txiptr:
       ds      1

_txoptr:
       ds      1

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	49
_menuStrings:
       ds      6

psect	dataBANK1
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	50
_shortMenuStrings:
       ds      6

psect	dataBANK1
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	45
_current_step:
       ds      1

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
UpdateDisplay@F1261:
       ds      16

_txfifo:
       ds      16

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
	clrf	((__pbitbssCOMMON/8)+1)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+03Fh)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+020h)
	fcall	clear_ram
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK1
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK1
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK1+13)
	movwf btemp-1,f
	movlw high(__pidataBANK1)
	movwf btemp,f
	movlw low(__pidataBANK1)
	movwf btemp+1,f
	movlw low(__pdataBANK1)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_ser_init
?_ser_init:	; 0 bytes @ 0x0
	global	?_robo_init
?_robo_init:	; 0 bytes @ 0x0
	global	?_robotLoadSong
?_robotLoadSong:	; 0 bytes @ 0x0
	global	?_robot_read
?_robot_read:	; 0 bytes @ 0x0
	global	?_readAvgDistance
?_readAvgDistance:	; 0 bytes @ 0x0
	global	?_UpdateDisplay
?_UpdateDisplay:	; 0 bytes @ 0x0
	global	?_calibrateIR
?_calibrateIR:	; 0 bytes @ 0x0
	global	?_ser_putch
?_ser_putch:	; 0 bytes @ 0x0
	global	?_Init_Follow_IR
?_Init_Follow_IR:	; 0 bytes @ 0x0
	global	?_ChargeMode
?_ChargeMode:	; 0 bytes @ 0x0
	global	?_RobotBattRead
?_RobotBattRead:	; 0 bytes @ 0x0
	global	?_ADCconvert
?_ADCconvert:	; 0 bytes @ 0x0
	global	?_init_adc
?_init_adc:	; 0 bytes @ 0x0
	global	?_lcd_write_control
?_lcd_write_control:	; 0 bytes @ 0x0
	global	?_lcd_write_data
?_lcd_write_data:	; 0 bytes @ 0x0
	global	?_lcd_set_cursor
?_lcd_set_cursor:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_isr1
?_isr1:	; 0 bytes @ 0x0
	global	?_init
?_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_Debounce
?_Debounce:	; 0 bytes @ 0x0
	global	??_Debounce
??_Debounce:	; 0 bytes @ 0x0
	global	?_ser_isrx
?_ser_isrx:	; 1 bit 
	global	?_ReadButtons
?_ReadButtons:	; 1 bytes @ 0x0
	global	?_Menu
?_Menu:	; 1 bytes @ 0x0
	global	?_ser_getch
?_ser_getch:	; 1 bytes @ 0x0
	global	?_adc_read_channel
?_adc_read_channel:	; 1 bytes @ 0x0
	global	?_spi_transfer
?_spi_transfer:	; 1 bytes @ 0x0
	global	?i1___lwmod
?i1___lwmod:	; 2 bytes @ 0x0
	global	i1___lwmod@divisor
i1___lwmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_ReadButtons
??_ReadButtons:	; 0 bytes @ 0x1
	ds	1
	global	i1___lwmod@dividend
i1___lwmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??i1___lwmod
??i1___lwmod:	; 0 bytes @ 0x4
	ds	1
	global	i1___lwmod@counter
i1___lwmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	??_isr1
??_isr1:	; 0 bytes @ 0x6
	ds	5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_ser_init
??_ser_init:	; 0 bytes @ 0x0
	global	??_Menu
??_Menu:	; 0 bytes @ 0x0
	global	??_ser_putch
??_ser_putch:	; 0 bytes @ 0x0
	global	??_ser_getch
??_ser_getch:	; 0 bytes @ 0x0
	global	??_init_adc
??_init_adc:	; 0 bytes @ 0x0
	global	??_lcd_write_control
??_lcd_write_control:	; 0 bytes @ 0x0
	global	??_lcd_write_data
??_lcd_write_data:	; 0 bytes @ 0x0
	global	??_spi_transfer
??_spi_transfer:	; 0 bytes @ 0x0
	global	??_ser_isrx
??_ser_isrx:	; 0 bytes @ 0x0
	global	?_adc_read
?_adc_read:	; 2 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	Menu@BTN_input
Menu@BTN_input:	; 1 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	spi_transfer@temp
spi_transfer@temp:	; 1 bytes @ 0x1
	global	ser_getch@c
ser_getch@c:	; 1 bytes @ 0x1
	global	ser_putch@c
ser_putch@c:	; 1 bytes @ 0x1
	ds	1
	global	??_adc_read
??_adc_read:	; 0 bytes @ 0x2
	global	??_robo_init
??_robo_init:	; 0 bytes @ 0x2
	global	??_robotLoadSong
??_robotLoadSong:	; 0 bytes @ 0x2
	global	??_robot_read
??_robot_read:	; 0 bytes @ 0x2
	global	??_RobotBattRead
??_RobotBattRead:	; 0 bytes @ 0x2
	global	?_robotTurn
?_robotTurn:	; 0 bytes @ 0x2
	global	lcd_write_control@databyte
lcd_write_control@databyte:	; 1 bytes @ 0x2
	global	lcd_write_data@databyte
lcd_write_data@databyte:	; 1 bytes @ 0x2
	global	spi_transfer@data
spi_transfer@data:	; 1 bytes @ 0x2
	global	robotTurn@angle
robotTurn@angle:	; 2 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	?_rotate
?_rotate:	; 0 bytes @ 0x3
	global	??_lcd_set_cursor
??_lcd_set_cursor:	; 0 bytes @ 0x3
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	??_init
??_init:	; 0 bytes @ 0x3
	global	lcd_set_cursor@address
lcd_set_cursor@address:	; 1 bytes @ 0x3
	global	robot_read@readType
robot_read@readType:	; 1 bytes @ 0x3
	global	rotate@numsteps
rotate@numsteps:	; 2 bytes @ 0x3
	ds	1
	global	??_robotTurn
??_robotTurn:	; 0 bytes @ 0x4
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	adc_read@adc_value
adc_read@adc_value:	; 2 bytes @ 0x4
	global	RobotBattRead@temp1
RobotBattRead@temp1:	; 2 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	1
	global	rotate@direction
rotate@direction:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	??_rotate
??_rotate:	; 0 bytes @ 0x6
	global	??_adc_read_channel
??_adc_read_channel:	; 0 bytes @ 0x6
	global	?_abs
?_abs:	; 2 bytes @ 0x6
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x6
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	global	abs@v
abs@v:	; 2 bytes @ 0x6
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x6
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x6
	ds	1
	global	?_lcd_write_string
?_lcd_write_string:	; 0 bytes @ 0x7
	global	adc_read_channel@channel
adc_read_channel@channel:	; 1 bytes @ 0x7
	global	lcd_write_string@s
lcd_write_string@s:	; 2 bytes @ 0x7
	ds	1
	global	??_abs
??_abs:	; 0 bytes @ 0x8
	global	?_readDistance
?_readDistance:	; 2 bytes @ 0x8
	global	rotate@i
rotate@i:	; 2 bytes @ 0x8
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x8
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x8
	ds	1
	global	??_lcd_write_string
??_lcd_write_string:	; 0 bytes @ 0x9
	ds	1
	global	??_readDistance
??_readDistance:	; 0 bytes @ 0xA
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0xA
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0xA
	ds	1
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0xB
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xB
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0xC
	global	readDistance@readVal
readDistance@readVal:	; 2 bytes @ 0xC
	ds	1
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xD
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0xD
	ds	1
	global	??_ADCconvert
??_ADCconvert:	; 0 bytes @ 0xE
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0xE
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0xE
	ds	1
	global	?_RobotDrive
?_RobotDrive:	; 0 bytes @ 0xF
	global	RobotDrive@speed
RobotDrive@speed:	; 2 bytes @ 0xF
	ds	1
	global	??_readAvgDistance
??_readAvgDistance:	; 0 bytes @ 0x10
	global	readAvgDistance@fullval
readAvgDistance@fullval:	; 2 bytes @ 0x10
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x10
	ds	1
	global	RobotDrive@radius
RobotDrive@radius:	; 2 bytes @ 0x11
	ds	1
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x12
	global	readAvgDistance@j
readAvgDistance@j:	; 2 bytes @ 0x12
	ds	1
	global	??_RobotDrive
??_RobotDrive:	; 0 bytes @ 0x13
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x13
	ds	1
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x14
	global	RobotDrive@speedlowByte
RobotDrive@speedlowByte:	; 1 bytes @ 0x14
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0x14
	global	readAvgDistance@tempIR
readAvgDistance@tempIR:	; 2 bytes @ 0x14
	ds	1
	global	RobotDrive@speedhighByte
RobotDrive@speedhighByte:	; 1 bytes @ 0x15
	ds	1
	global	RobotDrive@radiuslowByte
RobotDrive@radiuslowByte:	; 1 bytes @ 0x16
	global	readAvgDistance@i
readAvgDistance@i:	; 2 bytes @ 0x16
	ds	1
	global	RobotDrive@radiushighByte
RobotDrive@radiushighByte:	; 1 bytes @ 0x17
	ds	2
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0x19
	ds	3
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x1C
	ds	1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x1D
	ds	1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x1E
	ds	1
	global	sprintf@_val
sprintf@_val:	; 4 bytes @ 0x1F
	ds	4
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0x23
	ds	1
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x24
	ds	1
	global	??_UpdateDisplay
??_UpdateDisplay:	; 0 bytes @ 0x25
	ds	4
	global	UpdateDisplay@LCDOutput
UpdateDisplay@LCDOutput:	; 16 bytes @ 0x29
	ds	16
	global	??_calibrateIR
??_calibrateIR:	; 0 bytes @ 0x39
	global	?_robotMoveSpeed
?_robotMoveSpeed:	; 0 bytes @ 0x39
	global	?_robotTurnSpeed
?_robotTurnSpeed:	; 0 bytes @ 0x39
	global	??_Init_Follow_IR
??_Init_Follow_IR:	; 0 bytes @ 0x39
	global	?_robotFollow
?_robotFollow:	; 0 bytes @ 0x39
	global	?_robot_turnRight
?_robot_turnRight:	; 0 bytes @ 0x39
	global	??_ChargeMode
??_ChargeMode:	; 0 bytes @ 0x39
	global	robotFollow@speed
robotFollow@speed:	; 2 bytes @ 0x39
	global	robot_turnRight@speed
robot_turnRight@speed:	; 2 bytes @ 0x39
	global	robotMoveSpeed@distance
robotMoveSpeed@distance:	; 2 bytes @ 0x39
	global	robotTurnSpeed@angle
robotTurnSpeed@angle:	; 2 bytes @ 0x39
	ds	2
	global	robotFollow@AdcTarget
robotFollow@AdcTarget:	; 2 bytes @ 0x3B
	global	robot_turnRight@AdcTarget
robot_turnRight@AdcTarget:	; 2 bytes @ 0x3B
	global	robotMoveSpeed@speed
robotMoveSpeed@speed:	; 2 bytes @ 0x3B
	global	robotTurnSpeed@speed
robotTurnSpeed@speed:	; 2 bytes @ 0x3B
	ds	2
	global	??_robotMoveSpeed
??_robotMoveSpeed:	; 0 bytes @ 0x3D
	global	??_robotTurnSpeed
??_robotTurnSpeed:	; 0 bytes @ 0x3D
	global	??_robotFollow
??_robotFollow:	; 0 bytes @ 0x3D
	global	??_robot_turnRight
??_robot_turnRight:	; 0 bytes @ 0x3D
	ds	3
	global	robot_turnRight@temp1
robot_turnRight@temp1:	; 2 bytes @ 0x40
	global	robotMoveSpeed@temp1
robotMoveSpeed@temp1:	; 2 bytes @ 0x40
	global	robotTurnSpeed@temp1
robotTurnSpeed@temp1:	; 2 bytes @ 0x40
	ds	1
	global	robotFollow@temp1
robotFollow@temp1:	; 2 bytes @ 0x41
	ds	2
	global	robotFollow@hysterysis
robotFollow@hysterysis:	; 1 bytes @ 0x43
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x44
	ds	3
	global	main@shortwall
main@shortwall:	; 2 bytes @ 0x47
	ds	2
	global	main@choice
main@choice:	; 1 bytes @ 0x49
	ds	1
;;Data sizes: Strings 167, constant 10, data 13, bss 102, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80     74      80
;; BANK1           80      0      76
;; BANK3           96      0      32
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?i1___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?_abs	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?_readDistance	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?_adc_read	unsigned int  size(1) Largest target is 0
;;
;; sprintf@f	PTR const unsigned char  size(1) Largest target is 13
;;		 -> STR_19(CODE[5]), STR_13(CODE[13]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;;		 -> UpdateDisplay@LCDOutput(BANK0[16]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK0[2]), 
;;
;; S8260$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; shortMenuStrings	PTR const unsigned char [6] size(1) Largest target is 4
;;		 -> STR_12(CODE[4]), STR_11(CODE[4]), STR_10(CODE[4]), STR_9(CODE[4]), 
;;		 -> STR_8(CODE[4]), STR_7(CODE[4]), 
;;
;; menuStrings	PTR const unsigned char [6] size(1) Largest target is 9
;;		 -> STR_6(CODE[9]), STR_5(CODE[9]), STR_4(CODE[8]), STR_3(CODE[9]), 
;;		 -> STR_2(CODE[9]), STR_1(CODE[9]), 
;;
;; lcd_write_string@s	PTR unsigned char  size(2) Largest target is 16
;;		 -> STR_26(CODE[9]), STR_25(CODE[3]), STR_24(CODE[3]), STR_23(CODE[3]), 
;;		 -> STR_22(CODE[3]), STR_21(CODE[3]), STR_20(CODE[3]), STR_18(CODE[16]), 
;;		 -> STR_17(CODE[4]), STR_16(CODE[8]), STR_15(CODE[4]), STR_14(CODE[16]), 
;;		 -> UpdateDisplay@LCDOutput(BANK0[16]), STR_12(CODE[4]), STR_11(CODE[4]), STR_10(CODE[4]), 
;;		 -> STR_9(CODE[4]), STR_8(CODE[4]), STR_7(CODE[4]), STR_6(CODE[9]), 
;;		 -> STR_5(CODE[9]), STR_4(CODE[8]), STR_3(CODE[9]), STR_2(CODE[9]), 
;;		 -> STR_1(CODE[9]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr1 in COMMON
;;
;;   _isr1->i1___lwmod
;;   _ReadButtons->_Debounce
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_robotFollow
;;   _ChargeMode->_UpdateDisplay
;;   _robot_turnRight->_UpdateDisplay
;;   _robotFollow->_UpdateDisplay
;;   _robotTurnSpeed->_UpdateDisplay
;;   _robotMoveSpeed->_UpdateDisplay
;;   _calibrateIR->_UpdateDisplay
;;   _UpdateDisplay->_sprintf
;;   _readAvgDistance->_ADCconvert
;;   _readDistance->_adc_read_channel
;;   _RobotBattRead->_ser_putch
;;   _RobotBattRead->_ser_getch
;;   _robot_read->_ser_putch
;;   _robot_read->_ser_getch
;;   _lcd_init->_lcd_write_control
;;   _lcd_write_string->___awmod
;;   _lcd_set_cursor->_lcd_write_control
;;   _abs->___wmul
;;   _robotTurn->_ser_putch
;;   _sprintf->___lwmod
;;   _ADCconvert->___lwdiv
;;   _rotate->_spi_transfer
;;   _RobotDrive->___awdiv
;;   _robotLoadSong->_ser_putch
;;   _robo_init->_ser_putch
;;   _adc_read_channel->_adc_read
;;   ___awdiv->___wmul
;;   ___lwmod->___lwdiv
;;   ___lwdiv->___wmul
;;
;; Critical Paths under _isr1 in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr1 in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _isr1 in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr1 in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 6     6      0   16803
;;                                             68 BANK0      6     6      0
;;                               _init
;;                      _robotLoadSong
;;                         _robot_read
;;                    _readAvgDistance
;;                      _UpdateDisplay
;;                               _Menu
;;                        _calibrateIR
;;                          _ser_putch
;;                     _robotMoveSpeed
;;                     _robotTurnSpeed
;;                     _Init_Follow_IR
;;                        _robotFollow
;;                         _RobotDrive
;;                             _rotate
;;                    _robot_turnRight
;;                         _ChargeMode
;; ---------------------------------------------------------------------------------
;; (1) _Init_Follow_IR                                       3     3      0    1567
;;                                             57 BANK0      3     3      0
;;                        _calibrateIR
;;                             _rotate
;; ---------------------------------------------------------------------------------
;; (1) _ChargeMode                                           1     1      0    1442
;;                                             57 BANK0      1     1      0
;;                          _ser_putch
;;                      _RobotBattRead
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (1) _robot_turnRight                                      9     5      4    3264
;;                                             57 BANK0      9     5      4
;;                         _RobotDrive
;;                    _readAvgDistance
;;                          _ser_putch
;;                         _robot_read
;;                      _UpdateDisplay
;;                             ___wmul
;;                            ___awdiv
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (1) _robotFollow                                         11     7      4    2831
;;                                             57 BANK0     11     7      4
;;                         _RobotDrive
;;                    _readAvgDistance
;;                             _rotate
;;                         _robot_read
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (1) _robotTurnSpeed                                       9     5      4    1776
;;                                             57 BANK0      9     5      4
;;                          _robotTurn
;;                         _robot_read
;;                      _UpdateDisplay
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (1) _robotMoveSpeed                                       9     5      4    1933
;;                                             57 BANK0      9     5      4
;;                         _RobotDrive
;;                         _robot_read
;;                      _UpdateDisplay
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (2) _calibrateIR                                          0     0      0    1447
;;                             _rotate
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (2) _UpdateDisplay                                       20    20      0    1327
;;                                             37 BANK0     20    20      0
;;                  _lcd_write_control
;;                            _sprintf
;;                     _lcd_set_cursor
;;                   _lcd_write_string
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (2) _readAvgDistance                                      8     8      0     625
;;                                             16 BANK0      8     8      0
;;                       _readDistance
;;                            ___lwdiv
;;                         _ADCconvert
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 1     1      0      44
;;                                              3 BANK0      1     1      0
;;                           _ser_init
;;                           _init_adc
;;                           _lcd_init
;;                          _robo_init
;; ---------------------------------------------------------------------------------
;; (3) _readDistance                                         6     4      2      69
;;                                              8 BANK0      6     4      2
;;                   _adc_read_channel
;; ---------------------------------------------------------------------------------
;; (2) _RobotBattRead                                        4     4      0      93
;;                                              2 BANK0      4     4      0
;;                          _ser_putch
;;                          _ser_getch
;; ---------------------------------------------------------------------------------
;; (2) _robot_read                                           2     2      0     133
;;                                              2 BANK0      2     2      0
;;                          _ser_putch
;;                          _ser_getch
;; ---------------------------------------------------------------------------------
;; (2) _lcd_init                                             0     0      0      22
;;                  _lcd_write_control
;; ---------------------------------------------------------------------------------
;; (3) _lcd_write_string                                     2     0      2      67
;;                                              7 BANK0      2     0      2
;;                     _lcd_write_data
;;                            ___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (3) _lcd_set_cursor                                       1     1      0      45
;;                                              3 BANK0      1     1      0
;;                  _lcd_write_control
;; ---------------------------------------------------------------------------------
;; (2) _abs                                                  4     2      2     158
;;                                              6 BANK0      4     2      2
;;                             ___wmul
;; ---------------------------------------------------------------------------------
;; (2) _robotTurn                                            2     0      2      66
;;                                              2 BANK0      2     0      2
;;                          _ser_putch
;; ---------------------------------------------------------------------------------
;; (3) _ser_getch                                            2     2      0      23
;;                                              0 BANK0      2     2      0
;;                           _ser_isrx
;; ---------------------------------------------------------------------------------
;; (3) _sprintf                                             17    12      5     798
;;                                             20 BANK0     17    12      5
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (3) _ADCconvert                                           2     2      0     254
;;                                             14 BANK0      2     2      0
;;                             ___wmul
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (1) _rotate                                               7     4      3     120
;;                                              3 BANK0      7     4      3
;;                       _spi_transfer
;; ---------------------------------------------------------------------------------
;; (2) _RobotDrive                                           9     5      4     202
;;                                             15 BANK0      9     5      4
;;                          _ser_putch
;;                            ___awdiv (ARG)
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _robotLoadSong                                        0     0      0      22
;;                          _ser_putch
;; ---------------------------------------------------------------------------------
;; (2) _robo_init                                            0     0      0      22
;;                          _ser_putch
;; ---------------------------------------------------------------------------------
;; (4) _lcd_write_data                                       3     3      0      22
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (4) _lcd_write_control                                    3     3      0      22
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _init_adc                                             1     1      0       0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (4) _adc_read_channel                                     2     2      0      46
;;                                              6 BANK0      2     2      0
;;                           _adc_read
;; ---------------------------------------------------------------------------------
;; (3) ___awmod                                              7     3      4     296
;;                                              0 BANK0      7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              6 BANK0      9     5      4
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (4) ___lwmod                                              6     2      4     159
;;                                             14 BANK0      6     2      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (4) ___lwdiv                                              8     4      4     162
;;                                              6 BANK0      8     4      4
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (3) ___wmul                                               6     2      4      92
;;                                              0 BANK0      6     2      4
;; ---------------------------------------------------------------------------------
;; (4) _ser_isrx                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _spi_transfer                                         3     3      0      30
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (3) _ser_putch                                            2     2      0      22
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _Menu                                                 1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _ser_init                                             1     1      0       0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (5) _adc_read                                             6     4      2      24
;;                                              0 BANK0      6     4      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (6) _isr1                                                 5     5      0     521
;;                                              6 COMMON     5     5      0
;;                          i1___lwmod
;;                        _ReadButtons
;; ---------------------------------------------------------------------------------
;; (7) _ReadButtons                                          0     0      0       0
;;                           _Debounce
;; ---------------------------------------------------------------------------------
;; (7) i1___lwmod                                            6     2      4     521
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (8) _Debounce                                             1     1      0       0
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 8
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;     _ser_init
;;     _init_adc
;;     _lcd_init
;;       _lcd_write_control
;;     _robo_init
;;       _ser_putch
;;   _robotLoadSong
;;     _ser_putch
;;   _robot_read
;;     _ser_putch
;;     _ser_getch
;;       _ser_isrx
;;   _readAvgDistance
;;     _readDistance
;;       _adc_read_channel
;;         _adc_read
;;     ___lwdiv
;;       ___wmul (ARG)
;;     _ADCconvert
;;       ___wmul
;;       ___lwdiv
;;         ___wmul (ARG)
;;   _UpdateDisplay
;;     _lcd_write_control
;;     _sprintf
;;       ___lwdiv
;;         ___wmul (ARG)
;;       ___lwmod
;;         ___lwdiv (ARG)
;;           ___wmul (ARG)
;;     _lcd_set_cursor
;;       _lcd_write_control
;;     _lcd_write_string
;;       _lcd_write_data
;;       ___awmod (ARG)
;;     ___awmod
;;   _Menu
;;   _calibrateIR
;;     _rotate
;;       _spi_transfer
;;     _UpdateDisplay
;;       _lcd_write_control
;;       _sprintf
;;         ___lwdiv
;;           ___wmul (ARG)
;;         ___lwmod
;;           ___lwdiv (ARG)
;;             ___wmul (ARG)
;;       _lcd_set_cursor
;;         _lcd_write_control
;;       _lcd_write_string
;;         _lcd_write_data
;;         ___awmod (ARG)
;;       ___awmod
;;   _ser_putch
;;   _robotMoveSpeed
;;     _RobotDrive
;;       _ser_putch
;;       ___awdiv (ARG)
;;         ___wmul (ARG)
;;       ___wmul (ARG)
;;     _robot_read
;;       _ser_putch
;;       _ser_getch
;;         _ser_isrx
;;     _UpdateDisplay
;;       _lcd_write_control
;;       _sprintf
;;         ___lwdiv
;;           ___wmul (ARG)
;;         ___lwmod
;;           ___lwdiv (ARG)
;;             ___wmul (ARG)
;;       _lcd_set_cursor
;;         _lcd_write_control
;;       _lcd_write_string
;;         _lcd_write_data
;;         ___awmod (ARG)
;;       ___awmod
;;     _abs
;;       ___wmul
;;   _robotTurnSpeed
;;     _robotTurn
;;       _ser_putch
;;     _robot_read
;;       _ser_putch
;;       _ser_getch
;;         _ser_isrx
;;     _UpdateDisplay
;;       _lcd_write_control
;;       _sprintf
;;         ___lwdiv
;;           ___wmul (ARG)
;;         ___lwmod
;;           ___lwdiv (ARG)
;;             ___wmul (ARG)
;;       _lcd_set_cursor
;;         _lcd_write_control
;;       _lcd_write_string
;;         _lcd_write_data
;;         ___awmod (ARG)
;;       ___awmod
;;     _abs
;;       ___wmul
;;   _Init_Follow_IR
;;     _calibrateIR
;;       _rotate
;;         _spi_transfer
;;       _UpdateDisplay
;;         _lcd_write_control
;;         _sprintf
;;           ___lwdiv
;;             ___wmul (ARG)
;;           ___lwmod
;;             ___lwdiv (ARG)
;;               ___wmul (ARG)
;;         _lcd_set_cursor
;;           _lcd_write_control
;;         _lcd_write_string
;;           _lcd_write_data
;;           ___awmod (ARG)
;;         ___awmod
;;     _rotate
;;       _spi_transfer
;;   _robotFollow
;;     _RobotDrive
;;       _ser_putch
;;       ___awdiv (ARG)
;;         ___wmul (ARG)
;;       ___wmul (ARG)
;;     _readAvgDistance
;;       _readDistance
;;         _adc_read_channel
;;           _adc_read
;;       ___lwdiv
;;         ___wmul (ARG)
;;       _ADCconvert
;;         ___wmul
;;         ___lwdiv
;;           ___wmul (ARG)
;;     _rotate
;;       _spi_transfer
;;     _robot_read
;;       _ser_putch
;;       _ser_getch
;;         _ser_isrx
;;     _UpdateDisplay
;;       _lcd_write_control
;;       _sprintf
;;         ___lwdiv
;;           ___wmul (ARG)
;;         ___lwmod
;;           ___lwdiv (ARG)
;;             ___wmul (ARG)
;;       _lcd_set_cursor
;;         _lcd_write_control
;;       _lcd_write_string
;;         _lcd_write_data
;;         ___awmod (ARG)
;;       ___awmod
;;   _RobotDrive
;;     _ser_putch
;;     ___awdiv (ARG)
;;       ___wmul (ARG)
;;     ___wmul (ARG)
;;   _rotate
;;     _spi_transfer
;;   _robot_turnRight
;;     _RobotDrive
;;       _ser_putch
;;       ___awdiv (ARG)
;;         ___wmul (ARG)
;;       ___wmul (ARG)
;;     _readAvgDistance
;;       _readDistance
;;         _adc_read_channel
;;           _adc_read
;;       ___lwdiv
;;         ___wmul (ARG)
;;       _ADCconvert
;;         ___wmul
;;         ___lwdiv
;;           ___wmul (ARG)
;;     _ser_putch
;;     _robot_read
;;       _ser_putch
;;       _ser_getch
;;         _ser_isrx
;;     _UpdateDisplay
;;       _lcd_write_control
;;       _sprintf
;;         ___lwdiv
;;           ___wmul (ARG)
;;         ___lwmod
;;           ___lwdiv (ARG)
;;             ___wmul (ARG)
;;       _lcd_set_cursor
;;         _lcd_write_control
;;       _lcd_write_string
;;         _lcd_write_data
;;         ___awmod (ARG)
;;       ___awmod
;;     ___wmul
;;     ___awdiv
;;       ___wmul (ARG)
;;     _abs
;;       ___wmul
;;   _ChargeMode
;;     _ser_putch
;;     _RobotBattRead
;;       _ser_putch
;;       _ser_getch
;;         _ser_isrx
;;     _UpdateDisplay
;;       _lcd_write_control
;;       _sprintf
;;         ___lwdiv
;;           ___wmul (ARG)
;;         ___lwmod
;;           ___lwdiv (ARG)
;;             ___wmul (ARG)
;;       _lcd_set_cursor
;;         _lcd_write_control
;;       _lcd_write_string
;;         _lcd_write_data
;;         ___awmod (ARG)
;;       ___awmod
;;
;; _isr1 (ROOT)
;;   i1___lwmod
;;   _ReadButtons
;;     _Debounce
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0      20       9       33.3%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      4C       7       95.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      D5      12        0.0%
;;ABS                  0      0      CA       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       B       2        0.0%
;;BANK0               50     4A      50       5      100.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      B       E       1      100.0%
;;BITCOMMON            E      0       2       0       14.3%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 170 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  shortwall       2   71[BANK0 ] int 
;;  choice          1   73[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_init
;;		_robotLoadSong
;;		_robot_read
;;		_readAvgDistance
;;		_UpdateDisplay
;;		_Menu
;;		_calibrateIR
;;		_ser_putch
;;		_robotMoveSpeed
;;		_robotTurnSpeed
;;		_Init_Follow_IR
;;		_robotFollow
;;		_RobotDrive
;;		_rotate
;;		_robot_turnRight
;;		_ChargeMode
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	170
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	171
	
l11824:	
;Main.c: 171: unsigned char choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	line	172
	
l11826:	
;Main.c: 172: int shortwall = 0;
	clrf	(main@shortwall)
	clrf	(main@shortwall+1)
	line	175
	
l11828:	
;Main.c: 175: init();
	fcall	_init
	line	176
	
l11830:	
;Main.c: 176: robotLoadSong();
	fcall	_robotLoadSong
	goto	l11832
	line	178
;Main.c: 178: while(1)
	
l2248:	
	line	180
	
l11832:	
;Main.c: 179: {
;Main.c: 180: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5331
	goto	u5330
u5331:
	goto	l11842
u5330:
	line	182
	
l11834:	
;Main.c: 181: {
;Main.c: 182: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	183
	
l11836:	
;Main.c: 183: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	184
	
l11838:	
;Main.c: 184: readAvgDistance();
	fcall	_readAvgDistance
	line	185
	
l11840:	
;Main.c: 185: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11842
	line	186
	
l2249:	
	line	187
	
l11842:	
;Main.c: 186: }
;Main.c: 187: if (buttonPressed)
	movf	(_buttonPressed),w	;volatile
	skipz
	goto	u5340
	goto	l11910
u5340:
	line	190
	
l11844:	
;Main.c: 189: {
;Main.c: 190: choice = Menu(buttonPressed);
	movf	(_buttonPressed),w	;volatile
	fcall	_Menu
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	line	191
	
l11846:	
;Main.c: 191: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	goto	l11910
	line	192
	
l2250:	
	line	196
;Main.c: 192: }
;Main.c: 196: switch (choice)
	goto	l11910
	line	198
;Main.c: 197: {
;Main.c: 198: case 0:
	
l2252:	
	line	199
	
l11848:	
;Main.c: 199: calibrateIR();
	fcall	_calibrateIR
	line	200
;Main.c: 200: break;
	goto	l11912
	line	201
;Main.c: 201: case 1:
	
l2254:	
	line	206
	
l11850:	
;Main.c: 206: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	208
;Main.c: 208: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	209
;Main.c: 209: break;
	goto	l11912
	line	210
;Main.c: 210: case 2:
	
l2255:	
	line	212
	
l11852:	
;Main.c: 212: robotMoveSpeed(-200,-200);
	movlw	low(-200)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(-200)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(-200)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(-200)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	213
;Main.c: 213: break;
	goto	l11912
	line	214
;Main.c: 214: case 3:
	
l2256:	
	line	216
	
l11854:	
;Main.c: 216: robotTurnSpeed(-70,400);
	movlw	low(-70)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(-70)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	217
	
l11856:	
;Main.c: 217: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	94
movwf	((??_main+0)+0+1),f
	movlw	134
movwf	((??_main+0)+0),f
u5367:
	decfsz	((??_main+0)+0),f
	goto	u5367
	decfsz	((??_main+0)+0+1),f
	goto	u5367
	decfsz	((??_main+0)+0+2),f
	goto	u5367
	clrwdt
opt asmopt_on

	line	218
	
l11858:	
;Main.c: 218: robotTurnSpeed(-80,400);
	movlw	low(-80)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(-80)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	219
;Main.c: 219: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	94
movwf	((??_main+0)+0+1),f
	movlw	134
movwf	((??_main+0)+0),f
u5377:
	decfsz	((??_main+0)+0),f
	goto	u5377
	decfsz	((??_main+0)+0+1),f
	goto	u5377
	decfsz	((??_main+0)+0+2),f
	goto	u5377
	clrwdt
opt asmopt_on

	line	220
	
l11860:	
;Main.c: 220: robotTurnSpeed(-90,400);
	movlw	low(-90)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(-90)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	221
	
l11862:	
;Main.c: 221: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	94
movwf	((??_main+0)+0+1),f
	movlw	134
movwf	((??_main+0)+0),f
u5387:
	decfsz	((??_main+0)+0),f
	goto	u5387
	decfsz	((??_main+0)+0+1),f
	goto	u5387
	decfsz	((??_main+0)+0+2),f
	goto	u5387
	clrwdt
opt asmopt_on

	line	222
;Main.c: 222: robotTurnSpeed(-100,400);
	movlw	low(-100)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(-100)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	223
;Main.c: 223: break;
	goto	l11912
	line	224
;Main.c: 224: case 4:
	
l2257:	
	line	225
	
l11864:	
;Main.c: 225: Init_Follow_IR();
	fcall	_Init_Follow_IR
	line	226
;Main.c: 226: while (ROBOTerror != 1)
	goto	l11904
	
l2259:	
	line	228
;Main.c: 227: {
;Main.c: 228: switch (ROBOTerror)
	goto	l11902
	line	230
;Main.c: 229: {
;Main.c: 230: case 0:
	
l2261:	
	line	231
	
l11866:	
;Main.c: 231: readAvgDistance();
	fcall	_readAvgDistance
	line	232
;Main.c: 232: robotFollow(200, adcVal);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(0C8h)
	movwf	((?_robotFollow))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?_robotFollow)+02h
	addwf	1+(?_robotFollow)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?_robotFollow)+02h
	addwf	0+(?_robotFollow)+02h

	fcall	_robotFollow
	line	233
;Main.c: 233: break;
	goto	l11904
	line	234
;Main.c: 234: case 1:
	
l2263:	
	line	235
	
l11868:	
;Main.c: 235: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	236
;Main.c: 236: break;
	goto	l11904
	line	237
;Main.c: 237: case 2:
	
l2264:	
	line	238
	
l11870:	
;Main.c: 238: ROBOTerror = 1;
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	239
;Main.c: 239: break;
	goto	l11904
	line	240
;Main.c: 240: case 3:
	
l2265:	
	line	241
;Main.c: 241: ROBOTerror = 0;
	clrf	(_ROBOTerror)^080h
	line	242
	
l11872:	
;Main.c: 242: RobotDrive(-200, 0x7FFF);
	movlw	low(-200)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_RobotDrive)
	movlw	high(-200)
	movwf	((?_RobotDrive))+1
	movlw	low(07FFFh)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(07FFFh)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	243
	
l11874:	
;Main.c: 243: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	94
movwf	((??_main+0)+0+1),f
	movlw	134
movwf	((??_main+0)+0),f
u5397:
	decfsz	((??_main+0)+0),f
	goto	u5397
	decfsz	((??_main+0)+0+1),f
	goto	u5397
	decfsz	((??_main+0)+0+2),f
	goto	u5397
	clrwdt
opt asmopt_on

	line	244
	
l11876:	
;Main.c: 244: robotMoveSpeed(-200,-200);
	movlw	low(-200)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(-200)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(-200)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(-200)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	245
	
l11878:	
;Main.c: 245: robotTurnSpeed(-angleTurned,400);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_angleTurned)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_angleTurned+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??_main+0)+0+1)
	incf	(??_main+0)+0,f
	skipnz
	incf	((??_main+0)+0+1),f
	movf	0+(??_main+0)+0,w
	movwf	(?_robotTurnSpeed)
	movf	1+(??_main+0)+0,w
	movwf	(?_robotTurnSpeed+1)
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	246
	
l11880:	
;Main.c: 246: robotMoveSpeed(300,200);
	movlw	low(012Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(012Ch)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(0C8h)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(0C8h)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	247
	
l11882:	
;Main.c: 247: readAvgDistance();
	fcall	_readAvgDistance
	line	248
	
l11884:	
;Main.c: 248: robotFollow(200, adcVal - 10);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(0C8h)
	movwf	((?_robotFollow))+1
	movf	(_adcVal),w	;volatile
	addlw	low(-10)
	movwf	0+(?_robotFollow)+02h
	movf	(_adcVal+1),w	;volatile
	skipnc
	addlw	1
	addlw	high(-10)
	movwf	1+0+(?_robotFollow)+02h
	fcall	_robotFollow
	line	249
;Main.c: 249: break;
	goto	l11904
	line	250
;Main.c: 250: case 10:
	
l2266:	
	line	252
	
l11886:	
;Main.c: 252: robotTurnSpeed(80,400);
	movlw	low(050h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(050h)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	254
;Main.c: 254: readAvgDistance();
	fcall	_readAvgDistance
	line	255
;Main.c: 255: robotFollow(200, adcVal - 10);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(0C8h)
	movwf	((?_robotFollow))+1
	movf	(_adcVal),w	;volatile
	addlw	low(-10)
	movwf	0+(?_robotFollow)+02h
	movf	(_adcVal+1),w	;volatile
	skipnc
	addlw	1
	addlw	high(-10)
	movwf	1+0+(?_robotFollow)+02h
	fcall	_robotFollow
	line	256
;Main.c: 256: break;
	goto	l11904
	line	257
;Main.c: 257: case 11:
	
l2267:	
	line	259
	
l11888:	
;Main.c: 259: rotate(25, 0);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	260
	
l11890:	
;Main.c: 260: readAvgDistance();
	fcall	_readAvgDistance
	line	261
	
l11892:	
;Main.c: 261: robot_turnRight(200, adcVal);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robot_turnRight)
	movlw	high(0C8h)
	movwf	((?_robot_turnRight))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?_robot_turnRight)+02h
	addwf	1+(?_robot_turnRight)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?_robot_turnRight)+02h
	addwf	0+(?_robot_turnRight)+02h

	fcall	_robot_turnRight
	line	262
;Main.c: 262: rotate(25, 1);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	line	263
	
l11894:	
;Main.c: 263: readAvgDistance();
	fcall	_readAvgDistance
	line	264
	
l11896:	
;Main.c: 264: robotFollow(200, adcVal);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(0C8h)
	movwf	((?_robotFollow))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?_robotFollow)+02h
	addwf	1+(?_robotFollow)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?_robotFollow)+02h
	addwf	0+(?_robotFollow)+02h

	fcall	_robotFollow
	line	276
;Main.c: 276: break;
	goto	l11904
	line	277
;Main.c: 277: default:
	
l2268:	
	line	278
	
l11898:	
;Main.c: 278: readAvgDistance();
	fcall	_readAvgDistance
	line	279
;Main.c: 279: robotFollow(200, adcVal);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(0C8h)
	movwf	((?_robotFollow))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?_robotFollow)+02h
	addwf	1+(?_robotFollow)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?_robotFollow)+02h
	addwf	0+(?_robotFollow)+02h

	fcall	_robotFollow
	line	280
;Main.c: 280: break;
	goto	l11904
	line	282
	
l11900:	
;Main.c: 282: }
	goto	l11904
	line	228
	
l2260:	
	
l11902:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 11
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
; direct_byte           44     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            16     6 (fixed)
; spacedrange           30     9 (fixed)
; locatedrange          12     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l11866
	xorlw	1^0	; case 1
	skipnz
	goto	l11868
	xorlw	2^1	; case 2
	skipnz
	goto	l11870
	xorlw	3^2	; case 3
	skipnz
	goto	l2265
	xorlw	10^3	; case 10
	skipnz
	goto	l11886
	xorlw	11^10	; case 11
	skipnz
	goto	l11888
	goto	l11898
	opt asmopt_on

	line	282
	
l2262:	
	goto	l11904
	line	283
	
l2258:	
	line	226
	
l11904:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	xorlw	01h
	skipz
	goto	u5351
	goto	u5350
u5351:
	goto	l11902
u5350:
	
l2269:	
	line	284
;Main.c: 283: }
;Main.c: 284: ROBOTerror = 0;
	clrf	(_ROBOTerror)^080h
	line	285
;Main.c: 285: break;
	goto	l11912
	line	287
;Main.c: 287: case 5:
	
l2270:	
	line	288
	
l11906:	
;Main.c: 288: ChargeMode();
	fcall	_ChargeMode
	line	289
;Main.c: 289: break;
	goto	l11912
	line	290
;Main.c: 290: default:
	
l2271:	
	line	292
;Main.c: 292: break;
	goto	l11912
	line	293
	
l11908:	
;Main.c: 293: }
	goto	l11912
	line	196
	
l2251:	
	
l11910:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@choice),w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
; direct_byte           26     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            10     6 (fixed)
; spacedrange           18     9 (fixed)
; locatedrange           6     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l11848
	xorlw	1^0	; case 1
	skipnz
	goto	l11850
	xorlw	2^1	; case 2
	skipnz
	goto	l11852
	xorlw	3^2	; case 3
	skipnz
	goto	l11854
	xorlw	4^3	; case 4
	skipnz
	goto	l11864
	xorlw	5^4	; case 5
	skipnz
	goto	l11906
	goto	l11912
	opt asmopt_on

	line	293
	
l2253:	
	line	294
	
l11912:	
;Main.c: 294: choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	goto	l11832
	line	295
	
l2272:	
	line	178
	goto	l11832
	
l2273:	
	line	296
	
l2274:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_Init_Follow_IR
psect	text1062,local,class=CODE,delta=2
global __ptext1062
__ptext1062:

;; *************** function _Init_Follow_IR *****************
;; Defined at:
;;		line 299 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_calibrateIR
;;		_rotate
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1062
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	299
	global	__size_of_Init_Follow_IR
	__size_of_Init_Follow_IR	equ	__end_of_Init_Follow_IR-_Init_Follow_IR
	
_Init_Follow_IR:	
	opt	stack 0
; Regs used in _Init_Follow_IR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	300
	
l11818:	
;Main.c: 300: calibrateIR();
	fcall	_calibrateIR
	line	301
	
l11820:	
;Main.c: 301: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_Init_Follow_IR+0)+0+2),f
movlw	175
movwf	((??_Init_Follow_IR+0)+0+1),f
	movlw	193
movwf	((??_Init_Follow_IR+0)+0),f
u5407:
	decfsz	((??_Init_Follow_IR+0)+0),f
	goto	u5407
	decfsz	((??_Init_Follow_IR+0)+0+1),f
	goto	u5407
	decfsz	((??_Init_Follow_IR+0)+0+2),f
	goto	u5407
	clrwdt
opt asmopt_on

	line	302
	
l11822:	
;Main.c: 302: rotate(25, 0);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	303
	
l2277:	
	return
	opt stack 0
GLOBAL	__end_of_Init_Follow_IR
	__end_of_Init_Follow_IR:
;; =============== function _Init_Follow_IR ends ============

	signat	_Init_Follow_IR,88
	global	_ChargeMode
psect	text1063,local,class=CODE,delta=2
global __ptext1063
__ptext1063:

;; *************** function _ChargeMode *****************
;; Defined at:
;;		line 358 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_ser_putch
;;		_RobotBattRead
;;		_UpdateDisplay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1063
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	358
	global	__size_of_ChargeMode
	__size_of_ChargeMode	equ	__end_of_ChargeMode-_ChargeMode
	
_ChargeMode:	
	opt	stack 1
; Regs used in _ChargeMode: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	360
	
l11796:	
;Main.c: 360: currentMenu = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ChargeMode+0)+0
	movf	(??_ChargeMode+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_currentMenu)^080h	;volatile
	line	361
	
l11798:	
;Main.c: 361: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	goto	l11800
	line	363
;Main.c: 363: while (1)
	
l2298:	
	line	365
	
l11800:	
;Main.c: 364: {
;Main.c: 365: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5321
	goto	u5320
u5321:
	goto	l11816
u5320:
	line	367
	
l11802:	
;Main.c: 366: {
;Main.c: 367: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	368
	
l11804:	
;Main.c: 368: RobotBattRead();
	fcall	_RobotBattRead
	line	369
;Main.c: 369: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11816
	line	370
	
l2299:	
	line	371
;Main.c: 370: }
;Main.c: 371: switch (buttonPressed)
	goto	l11816
	line	373
;Main.c: 372: {
;Main.c: 373: case 1:
	
l2301:	
	line	374
;Main.c: 374: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	375
;Main.c: 375: break;
	goto	l11800
	line	376
;Main.c: 376: case 2:
	
l2303:	
	line	377
;Main.c: 377: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	378
;Main.c: 378: break;
	goto	l11800
	line	379
;Main.c: 379: case 3:
	
l2304:	
	line	380
;Main.c: 380: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	381
;Main.c: 381: break;
	goto	l11800
	line	382
;Main.c: 382: case 4:
	
l2305:	
	line	383
;Main.c: 383: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	384
;Main.c: 384: break;
	goto	l11800
	line	385
;Main.c: 385: case 5:
	
l2306:	
	line	386
	
l11806:	
;Main.c: 386: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	387
	
l11808:	
;Main.c: 387: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	388
	
l11810:	
;Main.c: 388: currentMenu = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h	;volatile
	goto	l2307
	line	389
	
l11812:	
;Main.c: 389: return;
	goto	l2307
	line	390
;Main.c: 390: default:
	
l2308:	
	line	391
;Main.c: 391: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	392
;Main.c: 392: break;
	goto	l11800
	line	393
	
l11814:	
;Main.c: 393: }
	goto	l11800
	line	371
	
l2300:	
	
l11816:	
	movf	(_buttonPressed),w	;volatile
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 1 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           26    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l2301
	xorlw	2^1	; case 2
	skipnz
	goto	l2303
	xorlw	3^2	; case 3
	skipnz
	goto	l2304
	xorlw	4^3	; case 4
	skipnz
	goto	l2305
	xorlw	5^4	; case 5
	skipnz
	goto	l11806
	goto	l2308
	opt asmopt_on

	line	393
	
l2302:	
	goto	l11800
	line	394
	
l2309:	
	line	363
	goto	l11800
	
l2310:	
	line	395
	
l2307:	
	return
	opt stack 0
GLOBAL	__end_of_ChargeMode
	__end_of_ChargeMode:
;; =============== function _ChargeMode ends ============

	signat	_ChargeMode,88
	global	_robot_turnRight
psect	text1064,local,class=CODE,delta=2
global __ptext1064
__ptext1064:

;; *************** function _robot_turnRight *****************
;; Defined at:
;;		line 257 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  speed           2   57[BANK0 ] int 
;;  AdcTarget       2   59[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   64[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_RobotDrive
;;		_readAvgDistance
;;		_ser_putch
;;		_robot_read
;;		_UpdateDisplay
;;		___wmul
;;		___awdiv
;;		_abs
;; This function is called by:
;;		_main
;;		_RightTurn
;; This function uses a non-reentrant model
;;
psect	text1064
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	257
	global	__size_of_robot_turnRight
	__size_of_robot_turnRight	equ	__end_of_robot_turnRight-_robot_turnRight
	
_robot_turnRight:	
	opt	stack 0
; Regs used in _robot_turnRight: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	258
	
l11698:	
;robot.c: 258: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	260
	
l11700:	
;robot.c: 259: int temp1;
;robot.c: 260: RobotDrive(speed, 0x7FFF);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnRight@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(07FFFh)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(07FFFh)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	261
	
l11702:	
;robot.c: 261: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	goto	l11704
	line	264
;robot.c: 264: while (1)
	
l6126:	
	line	266
	
l11704:	
;robot.c: 265: {
;robot.c: 266: readAvgDistance();
	fcall	_readAvgDistance
	line	267
	
l11706:	
;robot.c: 267: if (adcVal > (AdcTarget) && adcVal < (AdcTarget + 15))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	subwf	(robot_turnRight@AdcTarget+1),w
	skipz
	goto	u5195
	movf	(_adcVal),w	;volatile
	subwf	(robot_turnRight@AdcTarget),w
u5195:
	skipnc
	goto	u5191
	goto	u5190
u5191:
	goto	l11712
u5190:
	
l11708:	
	movf	(robot_turnRight@AdcTarget),w
	addlw	low(0Fh)
	movwf	(??_robot_turnRight+0)+0
	movf	(robot_turnRight@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0Fh)
	movwf	1+(??_robot_turnRight+0)+0
	movf	1+(??_robot_turnRight+0)+0,w
	subwf	(_adcVal+1),w	;volatile
	skipz
	goto	u5205
	movf	0+(??_robot_turnRight+0)+0,w
	subwf	(_adcVal),w	;volatile
u5205:
	skipnc
	goto	u5201
	goto	u5200
u5201:
	goto	l11712
u5200:
	line	269
	
l11710:	
;robot.c: 268: {
;robot.c: 269: RobotDrive(speed, 1700);
	movf	(robot_turnRight@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnRight@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(06A4h)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(06A4h)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	270
;robot.c: 270: }
	goto	l6128
	line	271
	
l6127:	
	
l11712:	
;robot.c: 271: else if (adcVal < (AdcTarget) && adcVal > (AdcTarget - 15))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@AdcTarget+1),w
	subwf	(_adcVal+1),w	;volatile
	skipz
	goto	u5215
	movf	(robot_turnRight@AdcTarget),w
	subwf	(_adcVal),w	;volatile
u5215:
	skipnc
	goto	u5211
	goto	u5210
u5211:
	goto	l11718
u5210:
	
l11714:	
	movf	(robot_turnRight@AdcTarget),w
	addlw	low(0FFF1h)
	movwf	(??_robot_turnRight+0)+0
	movf	(robot_turnRight@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0FFF1h)
	movwf	1+(??_robot_turnRight+0)+0
	movf	(_adcVal+1),w	;volatile
	subwf	1+(??_robot_turnRight+0)+0,w
	skipz
	goto	u5225
	movf	(_adcVal),w	;volatile
	subwf	0+(??_robot_turnRight+0)+0,w
u5225:
	skipnc
	goto	u5221
	goto	u5220
u5221:
	goto	l11718
u5220:
	line	273
	
l11716:	
;robot.c: 272: {
;robot.c: 273: RobotDrive(speed, -1700);
	movf	(robot_turnRight@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnRight@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-1700)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-1700)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	274
;robot.c: 274: }
	goto	l6128
	line	275
	
l6129:	
	
l11718:	
;robot.c: 275: else if (adcVal <= (AdcTarget - 50) || adcVal >= (AdcTarget + 15))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@AdcTarget),w
	addlw	low(0FFCEh)
	movwf	(??_robot_turnRight+0)+0
	movf	(robot_turnRight@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0FFCEh)
	movwf	1+(??_robot_turnRight+0)+0
	movf	(_adcVal+1),w	;volatile
	subwf	1+(??_robot_turnRight+0)+0,w
	skipz
	goto	u5235
	movf	(_adcVal),w	;volatile
	subwf	0+(??_robot_turnRight+0)+0,w
u5235:
	skipnc
	goto	u5231
	goto	u5230
u5231:
	goto	l11722
u5230:
	
l11720:	
	movf	(robot_turnRight@AdcTarget),w
	addlw	low(0Fh)
	movwf	(??_robot_turnRight+0)+0
	movf	(robot_turnRight@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0Fh)
	movwf	1+(??_robot_turnRight+0)+0
	movf	1+(??_robot_turnRight+0)+0,w
	subwf	(_adcVal+1),w	;volatile
	skipz
	goto	u5245
	movf	0+(??_robot_turnRight+0)+0,w
	subwf	(_adcVal),w	;volatile
u5245:
	skipc
	goto	u5241
	goto	u5240
u5241:
	goto	l11726
u5240:
	goto	l11722
	
l6133:	
	line	282
	
l11722:	
;robot.c: 276: {
;robot.c: 282: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	283
;robot.c: 283: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	284
;robot.c: 284: break;
	goto	l11758
	line	286
	
l11724:	
;robot.c: 286: }
	goto	l6128
	line	288
	
l6131:	
	line	290
	
l11726:	
;robot.c: 288: else
;robot.c: 289: {
;robot.c: 290: RobotDrive(speed, 0x7FFF);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnRight@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(07FFFh)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(07FFFh)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	goto	l6128
	line	291
	
l6135:	
	goto	l6128
	
l6130:	
	
l6128:	
	line	292
;robot.c: 291: }
;robot.c: 292: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	293
	
l11728:	
;robot.c: 293: if (BumpSensors)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_BumpSensors),w	;volatile
	skipz
	goto	u5250
	goto	l11732
u5250:
	line	295
	
l11730:	
;robot.c: 294: {
;robot.c: 295: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	296
;robot.c: 296: break;
	goto	l11758
	line	297
	
l6136:	
	line	298
	
l11732:	
;robot.c: 297: }
;robot.c: 298: if (VwallSensor)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_VwallSensor),w	;volatile
	skipz
	goto	u5260
	goto	l11736
u5260:
	line	300
	
l11734:	
;robot.c: 299: {
;robot.c: 300: ROBOTerror = 2;
	movlw	(02h)
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	301
;robot.c: 301: break;
	goto	l11758
	line	302
	
l6137:	
	line	303
	
l11736:	
;robot.c: 302: }
;robot.c: 303: if (CliffSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5270
	goto	l11740
u5270:
	line	305
	
l11738:	
;robot.c: 304: {
;robot.c: 305: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	306
;robot.c: 306: break;
	goto	l11758
	line	307
	
l6138:	
	line	308
	
l11740:	
;robot.c: 307: }
;robot.c: 308: temp1 = DistHighByte;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_DistHighByte),w	;volatile
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	309
	
l11742:	
;robot.c: 309: temp1 = temp1 << 8;
	movf	(robot_turnRight@temp1+1),w
	movwf	(??_robot_turnRight+0)+0+1
	movf	(robot_turnRight@temp1),w
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	movwf	(??_robot_turnRight+0)+1
	clrf	(??_robot_turnRight+0)+0
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	310
	
l11744:	
;robot.c: 310: temp1 += DistLowByte;
	movf	(_DistLowByte),w	;volatile
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	addwf	(robot_turnRight@temp1),f
	skipnc
	incf	(robot_turnRight@temp1+1),f
	movf	1+(??_robot_turnRight+0)+0,w
	addwf	(robot_turnRight@temp1+1),f
	line	311
	
l11746:	
;robot.c: 311: distTravelled += temp1;
	movf	(robot_turnRight@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_distTravelled)^080h,f
	skipnc
	incf	(_distTravelled+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_distTravelled+1)^080h,f
	line	312
	
l11748:	
;robot.c: 312: TotalDistTravelled += temp1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_TotalDistTravelled)^080h,f
	skipnc
	incf	(_TotalDistTravelled+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_TotalDistTravelled+1)^080h,f
	line	313
	
l11750:	
;robot.c: 313: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	314
	
l11752:	
;robot.c: 314: temp1 = temp1 << 8;
	movf	(robot_turnRight@temp1+1),w
	movwf	(??_robot_turnRight+0)+0+1
	movf	(robot_turnRight@temp1),w
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	movwf	(??_robot_turnRight+0)+1
	clrf	(??_robot_turnRight+0)+0
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	315
;robot.c: 315: temp1 += AngleLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_AngleLowByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	addwf	(robot_turnRight@temp1),f
	skipnc
	incf	(robot_turnRight@temp1+1),f
	movf	1+(??_robot_turnRight+0)+0,w
	addwf	(robot_turnRight@temp1+1),f
	line	316
;robot.c: 316: angleTurned += temp1;
	movf	(robot_turnRight@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_angleTurned)^080h,f
	skipnc
	incf	(_angleTurned+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_angleTurned+1)^080h,f
	line	317
	
l11754:	
;robot.c: 317: Disp2 = angleTurned;
	movf	(_angleTurned+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_angleTurned)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	318
	
l11756:	
;robot.c: 318: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11704
	line	319
	
l6139:	
	line	264
	goto	l11704
	
l6134:	
	line	320
	
l11758:	
;robot.c: 319: }
;robot.c: 320: RobotDrive((speed * 3/4), -400);
	movlw	low(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awdiv)
	movlw	high(04h)
	movwf	((?___awdiv))+1
	movf	(robot_turnRight@speed+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(robot_turnRight@speed),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(03h)
	movwf	0+(?___wmul)+02h
	movlw	high(03h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___wmul)),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awdiv)),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(0+(?___awdiv)),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-400)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-400)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	321
	
l11760:	
;robot.c: 321: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	322
;robot.c: 322: while (abs(angleTurned) < abs(-70))
	goto	l11788
	
l6141:	
	line	324
	
l11762:	
;robot.c: 323: {
;robot.c: 324: robot_read(1);
	movlw	(01h)
	fcall	_robot_read
	line	325
	
l11764:	
;robot.c: 325: if (BumpSensors)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_BumpSensors),w	;volatile
	skipz
	goto	u5280
	goto	l11768
u5280:
	line	327
	
l11766:	
;robot.c: 326: {
;robot.c: 327: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	328
;robot.c: 328: break;
	goto	l11790
	line	329
	
l6142:	
	line	330
	
l11768:	
;robot.c: 329: }
;robot.c: 330: if (VwallSensor)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_VwallSensor),w	;volatile
	skipz
	goto	u5290
	goto	l11772
u5290:
	line	332
	
l11770:	
;robot.c: 331: {
;robot.c: 332: ROBOTerror = 2;
	movlw	(02h)
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	333
;robot.c: 333: break;
	goto	l11790
	line	334
	
l6144:	
	line	335
	
l11772:	
;robot.c: 334: }
;robot.c: 335: if (CliffSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5300
	goto	l11776
u5300:
	line	337
	
l11774:	
;robot.c: 336: {
;robot.c: 337: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	338
;robot.c: 338: break;
	goto	l11790
	line	339
	
l6145:	
	line	340
	
l11776:	
;robot.c: 339: }
;robot.c: 340: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	341
	
l11778:	
;robot.c: 341: temp1 = temp1 << 8;
	movf	(robot_turnRight@temp1+1),w
	movwf	(??_robot_turnRight+0)+0+1
	movf	(robot_turnRight@temp1),w
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	movwf	(??_robot_turnRight+0)+1
	clrf	(??_robot_turnRight+0)+0
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	342
	
l11780:	
;robot.c: 342: temp1 += AngleLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_AngleLowByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	addwf	(robot_turnRight@temp1),f
	skipnc
	incf	(robot_turnRight@temp1+1),f
	movf	1+(??_robot_turnRight+0)+0,w
	addwf	(robot_turnRight@temp1+1),f
	line	343
	
l11782:	
;robot.c: 343: angleTurned += temp1;
	movf	(robot_turnRight@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_angleTurned)^080h,f
	skipnc
	incf	(_angleTurned+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_angleTurned+1)^080h,f
	line	344
	
l11784:	
;robot.c: 344: Disp2 = angleTurned;
	movf	(_angleTurned+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_angleTurned)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	345
	
l11786:	
;robot.c: 345: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11788
	line	346
	
l6140:	
	line	322
	
l11788:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_angleTurned+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_abs+1)
	addwf	(?_abs+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_angleTurned)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_abs)
	addwf	(?_abs)

	fcall	_abs
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+?_abs),w
	movwf	(??_robot_turnRight+0)+0
	movf	(1+?_abs),w
	movwf	((??_robot_turnRight+0)+0+1)
	movlw	low(-70)
	movwf	(?_abs)
	movlw	high(-70)
	movwf	((?_abs))+1
	fcall	_abs
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_robot_turnRight+0)+0,w
	xorlw	80h
	movwf	(??_robot_turnRight+2)+0
	movf	(1+(?_abs)),w
	xorlw	80h
	subwf	(??_robot_turnRight+2)+0,w
	skipz
	goto	u5315
	movf	(0+(?_abs)),w
	subwf	0+(??_robot_turnRight+0)+0,w
u5315:

	skipc
	goto	u5311
	goto	u5310
u5311:
	goto	l11762
u5310:
	goto	l11790
	
l6143:	
	line	347
	
l11790:	
;robot.c: 346: }
;robot.c: 347: RobotDrive(0, 0x7FFF);
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_RobotDrive)
	movlw	high(0)
	movwf	((?_RobotDrive))+1
	movlw	low(07FFFh)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(07FFFh)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	348
	
l11792:	
;robot.c: 348: Disp2 = ROBOTerror;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_Disp2)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_Disp2+1)^080h
	line	349
	
l11794:	
;robot.c: 349: UpdateDisplay();
	fcall	_UpdateDisplay
	line	352
	
l6146:	
	return
	opt stack 0
GLOBAL	__end_of_robot_turnRight
	__end_of_robot_turnRight:
;; =============== function _robot_turnRight ends ============

	signat	_robot_turnRight,8312
	global	_robotFollow
psect	text1065,local,class=CODE,delta=2
global __ptext1065
__ptext1065:

;; *************** function _robotFollow *****************
;; Defined at:
;;		line 181 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  speed           2   57[BANK0 ] int 
;;  AdcTarget       2   59[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   65[BANK0 ] int 
;;  hysterysis      1   67[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      11       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_RobotDrive
;;		_readAvgDistance
;;		_rotate
;;		_robot_read
;;		_UpdateDisplay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1065
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	181
	global	__size_of_robotFollow
	__size_of_robotFollow	equ	__end_of_robotFollow-_robotFollow
	
_robotFollow:	
	opt	stack 0
; Regs used in _robotFollow: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	182
	
l11616:	
;robot.c: 182: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	184
	
l11618:	
;robot.c: 183: int temp1;
;robot.c: 184: unsigned char hysterysis = 20;
	movlw	(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	movwf	(robotFollow@hysterysis)
	line	185
	
l11620:	
;robot.c: 185: RobotDrive(speed, 0x7FFF);
	movf	(robotFollow@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robotFollow@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(07FFFh)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(07FFFh)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	186
	
l11622:	
;robot.c: 186: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	goto	l11624
	line	189
;robot.c: 189: while (1)
	
l6105:	
	line	193
	
l11624:	
;robot.c: 190: {
;robot.c: 193: if (AdcTarget > 100)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(065h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5075
	movlw	low(065h)
	subwf	(robotFollow@AdcTarget),w
u5075:

	skipc
	goto	u5071
	goto	u5070
u5071:
	goto	l11628
u5070:
	line	194
	
l11626:	
;robot.c: 194: AdcTarget--;
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(robotFollow@AdcTarget),f
	skipnc
	incf	(robotFollow@AdcTarget+1),f
	movlw	high(-1)
	addwf	(robotFollow@AdcTarget+1),f
	goto	l11628
	
l6106:	
	line	195
	
l11628:	
;robot.c: 195: if (AdcTarget < 100)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(064h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5085
	movlw	low(064h)
	subwf	(robotFollow@AdcTarget),w
u5085:

	skipnc
	goto	u5081
	goto	u5080
u5081:
	goto	l11632
u5080:
	line	196
	
l11630:	
;robot.c: 196: AdcTarget++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(robotFollow@AdcTarget),f
	skipnc
	incf	(robotFollow@AdcTarget+1),f
	movlw	high(01h)
	addwf	(robotFollow@AdcTarget+1),f
	goto	l11632
	
l6107:	
	line	197
	
l11632:	
;robot.c: 197: readAvgDistance();
	fcall	_readAvgDistance
	line	198
	
l11634:	
;robot.c: 198: if (adcVal > (AdcTarget) && adcVal < (AdcTarget + hysterysis))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	subwf	(robotFollow@AdcTarget+1),w
	skipz
	goto	u5095
	movf	(_adcVal),w	;volatile
	subwf	(robotFollow@AdcTarget),w
u5095:
	skipnc
	goto	u5091
	goto	u5090
u5091:
	goto	l11640
u5090:
	
l11636:	
	movf	(robotFollow@hysterysis),w
	addwf	(robotFollow@AdcTarget),w
	movwf	(??_robotFollow+0)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	incf	(robotFollow@AdcTarget+1),w
	movwf	((??_robotFollow+0)+0)+1
	movf	1+(??_robotFollow+0)+0,w
	subwf	(_adcVal+1),w	;volatile
	skipz
	goto	u5105
	movf	0+(??_robotFollow+0)+0,w
	subwf	(_adcVal),w	;volatile
u5105:
	skipnc
	goto	u5101
	goto	u5100
u5101:
	goto	l11640
u5100:
	line	200
	
l11638:	
;robot.c: 199: {
;robot.c: 200: RobotDrive(speed, 1700);
	movf	(robotFollow@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robotFollow@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(06A4h)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(06A4h)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	201
;robot.c: 201: }
	goto	l6109
	line	202
	
l6108:	
	
l11640:	
;robot.c: 202: else if (adcVal < (AdcTarget) && adcVal > (AdcTarget - hysterysis))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	subwf	(_adcVal+1),w	;volatile
	skipz
	goto	u5115
	movf	(robotFollow@AdcTarget),w
	subwf	(_adcVal),w	;volatile
u5115:
	skipnc
	goto	u5111
	goto	u5110
u5111:
	goto	l11646
u5110:
	
l11642:	
	movf	(robotFollow@hysterysis),w
	movwf	(??_robotFollow+0)+0
	clrf	(??_robotFollow+0)+0+1
	comf	(??_robotFollow+0)+0,f
	comf	(??_robotFollow+0)+1,f
	incf	(??_robotFollow+0)+0,f
	skipnz
	incf	(??_robotFollow+0)+1,f
	movf	(robotFollow@AdcTarget),w
	addwf	0+(??_robotFollow+0)+0,w
	movwf	(??_robotFollow+2)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	incf	(robotFollow@AdcTarget+1),w
	addwf	1+(??_robotFollow+0)+0,w
	movwf	1+(??_robotFollow+2)+0
	movf	(_adcVal+1),w	;volatile
	subwf	1+(??_robotFollow+2)+0,w
	skipz
	goto	u5125
	movf	(_adcVal),w	;volatile
	subwf	0+(??_robotFollow+2)+0,w
u5125:
	skipnc
	goto	u5121
	goto	u5120
u5121:
	goto	l11646
u5120:
	line	204
	
l11644:	
;robot.c: 203: {
;robot.c: 204: RobotDrive(speed, -1700);
	movf	(robotFollow@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robotFollow@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-1700)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-1700)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	205
;robot.c: 205: }
	goto	l6109
	line	206
	
l6110:	
	
l11646:	
;robot.c: 206: else if (adcVal <= (AdcTarget - hysterysis) || adcVal >= (AdcTarget + hysterysis))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@hysterysis),w
	movwf	(??_robotFollow+0)+0
	clrf	(??_robotFollow+0)+0+1
	comf	(??_robotFollow+0)+0,f
	comf	(??_robotFollow+0)+1,f
	incf	(??_robotFollow+0)+0,f
	skipnz
	incf	(??_robotFollow+0)+1,f
	movf	(robotFollow@AdcTarget),w
	addwf	0+(??_robotFollow+0)+0,w
	movwf	(??_robotFollow+2)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	incf	(robotFollow@AdcTarget+1),w
	addwf	1+(??_robotFollow+0)+0,w
	movwf	1+(??_robotFollow+2)+0
	movf	(_adcVal+1),w	;volatile
	subwf	1+(??_robotFollow+2)+0,w
	skipz
	goto	u5135
	movf	(_adcVal),w	;volatile
	subwf	0+(??_robotFollow+2)+0,w
u5135:
	skipnc
	goto	u5131
	goto	u5130
u5131:
	goto	l11650
u5130:
	
l11648:	
	movf	(robotFollow@hysterysis),w
	addwf	(robotFollow@AdcTarget),w
	movwf	(??_robotFollow+0)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	incf	(robotFollow@AdcTarget+1),w
	movwf	((??_robotFollow+0)+0)+1
	movf	1+(??_robotFollow+0)+0,w
	subwf	(_adcVal+1),w	;volatile
	skipz
	goto	u5145
	movf	0+(??_robotFollow+0)+0,w
	subwf	(_adcVal),w	;volatile
u5145:
	skipc
	goto	u5141
	goto	u5140
u5141:
	goto	l11664
u5140:
	goto	l11650
	
l6114:	
	line	208
	
l11650:	
;robot.c: 207: {
;robot.c: 208: rotate(10,1);
	movlw	low(0Ah)
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	line	209
	
l11652:	
;robot.c: 209: readAvgDistance();
	fcall	_readAvgDistance
	line	210
	
l11654:	
;robot.c: 210: rotate(10,0);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	211
	
l11656:	
;robot.c: 211: if (adcVal < 50)
	movlw	high(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(032h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u5151
	goto	u5150
u5151:
	goto	l11660
u5150:
	line	212
	
l11658:	
;robot.c: 212: ROBOTerror = 11;
	movlw	(0Bh)
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l11692
	line	213
	
l6115:	
	line	214
	
l11660:	
;robot.c: 213: else
;robot.c: 214: ROBOTerror = 10;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l11692
	
l6116:	
	line	216
;robot.c: 216: break;
	goto	l11692
	line	217
	
l11662:	
;robot.c: 217: }
	goto	l6109
	line	218
	
l6112:	
	line	220
	
l11664:	
;robot.c: 218: else
;robot.c: 219: {
;robot.c: 220: RobotDrive(speed, 0x7FFF);
	bcf	status, 5	;RP0=0, select bank0
	movf	(robotFollow@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robotFollow@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(07FFFh)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(07FFFh)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	goto	l6109
	line	221
	
l6118:	
	goto	l6109
	
l6111:	
	
l6109:	
	line	222
;robot.c: 221: }
;robot.c: 222: robot_read(0);
	movlw	(0)
	fcall	_robot_read
	line	223
	
l11666:	
;robot.c: 223: if (BumpSensors)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_BumpSensors),w	;volatile
	skipz
	goto	u5160
	goto	l11670
u5160:
	line	225
	
l11668:	
;robot.c: 224: {
;robot.c: 225: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	226
;robot.c: 226: break;
	goto	l11692
	line	227
	
l6119:	
	line	228
	
l11670:	
;robot.c: 227: }
;robot.c: 228: if (VwallSensor)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_VwallSensor),w	;volatile
	skipz
	goto	u5170
	goto	l11674
u5170:
	line	230
	
l11672:	
;robot.c: 229: {
;robot.c: 230: ROBOTerror = 2;
	movlw	(02h)
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	231
;robot.c: 231: break;
	goto	l11692
	line	232
	
l6120:	
	line	233
	
l11674:	
;robot.c: 232: }
;robot.c: 233: if (CliffSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5180
	goto	l11678
u5180:
	line	235
	
l11676:	
;robot.c: 234: {
;robot.c: 235: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	236
;robot.c: 236: break;
	goto	l11692
	line	237
	
l6121:	
	line	238
	
l11678:	
;robot.c: 237: }
;robot.c: 238: temp1 = DistHighByte;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_DistHighByte),w	;volatile
	movwf	(??_robotFollow+0)+0
	clrf	(??_robotFollow+0)+0+1
	movf	0+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1)
	movf	1+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1+1)
	line	239
	
l11680:	
;robot.c: 239: temp1 = temp1 << 8;
	movf	(robotFollow@temp1+1),w
	movwf	(??_robotFollow+0)+0+1
	movf	(robotFollow@temp1),w
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	movwf	(??_robotFollow+0)+1
	clrf	(??_robotFollow+0)+0
	movf	0+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1)
	movf	1+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1+1)
	line	240
	
l11682:	
;robot.c: 240: temp1 += DistLowByte;
	movf	(_DistLowByte),w	;volatile
	movwf	(??_robotFollow+0)+0
	clrf	(??_robotFollow+0)+0+1
	movf	0+(??_robotFollow+0)+0,w
	addwf	(robotFollow@temp1),f
	skipnc
	incf	(robotFollow@temp1+1),f
	movf	1+(??_robotFollow+0)+0,w
	addwf	(robotFollow@temp1+1),f
	line	241
	
l11684:	
;robot.c: 241: distTravelled += temp1;
	movf	(robotFollow@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_distTravelled)^080h,f
	skipnc
	incf	(_distTravelled+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_distTravelled+1)^080h,f
	line	242
	
l11686:	
;robot.c: 242: TotalDistTravelled += temp1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_TotalDistTravelled)^080h,f
	skipnc
	incf	(_TotalDistTravelled+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_TotalDistTravelled+1)^080h,f
	line	244
	
l11688:	
;robot.c: 244: Disp2 = distTravelled;
	movf	(_distTravelled+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_distTravelled)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	245
	
l11690:	
;robot.c: 245: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11624
	line	246
	
l6122:	
	line	189
	goto	l11624
	
l6117:	
	line	247
	
l11692:	
;robot.c: 246: }
;robot.c: 247: RobotDrive(0, 0x7FFF);
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_RobotDrive)
	movlw	high(0)
	movwf	((?_RobotDrive))+1
	movlw	low(07FFFh)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(07FFFh)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	248
	
l11694:	
;robot.c: 248: Disp2 = ROBOTerror;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	clrf	(??_robotFollow+0)+0+1
	movf	0+(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_Disp2)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_Disp2+1)^080h
	line	249
	
l11696:	
;robot.c: 249: UpdateDisplay();
	fcall	_UpdateDisplay
	line	252
	
l6123:	
	return
	opt stack 0
GLOBAL	__end_of_robotFollow
	__end_of_robotFollow:
;; =============== function _robotFollow ends ============

	signat	_robotFollow,8312
	global	_robotTurnSpeed
psect	text1066,local,class=CODE,delta=2
global __ptext1066
__ptext1066:

;; *************** function _robotTurnSpeed *****************
;; Defined at:
;;		line 405 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  angle           2   57[BANK0 ] int 
;;  speed           2   59[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   64[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_robotTurn
;;		_robot_read
;;		_UpdateDisplay
;;		_abs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1066
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	405
	global	__size_of_robotTurnSpeed
	__size_of_robotTurnSpeed	equ	__end_of_robotTurnSpeed-_robotTurnSpeed
	
_robotTurnSpeed:	
	opt	stack 1
; Regs used in _robotTurnSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	406
	
l11588:	
;robot.c: 406: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	407
;robot.c: 407: int temp1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robotTurnSpeed@temp1)
	clrf	(robotTurnSpeed@temp1+1)
	line	409
	
l11590:	
;robot.c: 409: robotTurn(angle);
	movf	(robotTurnSpeed@angle+1),w
	clrf	(?_robotTurn+1)
	addwf	(?_robotTurn+1)
	movf	(robotTurnSpeed@angle),w
	clrf	(?_robotTurn)
	addwf	(?_robotTurn)

	fcall	_robotTurn
	line	412
;robot.c: 412: while (abs(angleTurned) < abs(angle))
	goto	l11612
	
l6159:	
	line	414
	
l11592:	
;robot.c: 413: {
;robot.c: 414: robot_read(1);
	movlw	(01h)
	fcall	_robot_read
	line	415
	
l11594:	
;robot.c: 415: if (BumpSensors || VwallSensor)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_BumpSensors),f
	skipz	;volatile
	goto	u5041
	goto	u5040
u5041:
	goto	l11598
u5040:
	
l11596:	
	movf	(_VwallSensor),w	;volatile
	skipz
	goto	u5050
	goto	l11600
u5050:
	goto	l11598
	
l6162:	
	line	417
	
l11598:	
;robot.c: 416: {
;robot.c: 417: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	418
;robot.c: 418: break;
	goto	l11614
	line	419
	
l6160:	
	line	420
	
l11600:	
;robot.c: 419: }
;robot.c: 420: temp1 = AngleHighByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotTurnSpeed+0)+0
	clrf	(??_robotTurnSpeed+0)+0+1
	movf	0+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1)
	movf	1+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1+1)
	line	421
	
l11602:	
;robot.c: 421: temp1 = temp1 << 8;
	movf	(robotTurnSpeed@temp1+1),w
	movwf	(??_robotTurnSpeed+0)+0+1
	movf	(robotTurnSpeed@temp1),w
	movwf	(??_robotTurnSpeed+0)+0
	movf	(??_robotTurnSpeed+0)+0,w
	movwf	(??_robotTurnSpeed+0)+1
	clrf	(??_robotTurnSpeed+0)+0
	movf	0+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1)
	movf	1+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1+1)
	line	422
	
l11604:	
;robot.c: 422: temp1 += AngleLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_AngleLowByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotTurnSpeed+0)+0
	clrf	(??_robotTurnSpeed+0)+0+1
	movf	0+(??_robotTurnSpeed+0)+0,w
	addwf	(robotTurnSpeed@temp1),f
	skipnc
	incf	(robotTurnSpeed@temp1+1),f
	movf	1+(??_robotTurnSpeed+0)+0,w
	addwf	(robotTurnSpeed@temp1+1),f
	line	423
	
l11606:	
;robot.c: 423: angleTurned += temp1;
	movf	(robotTurnSpeed@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_angleTurned)^080h,f
	skipnc
	incf	(_angleTurned+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotTurnSpeed@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_angleTurned+1)^080h,f
	line	424
	
l11608:	
;robot.c: 424: Disp2 = angleTurned;
	movf	(_angleTurned+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_angleTurned)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	425
	
l11610:	
;robot.c: 425: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11612
	line	426
	
l6158:	
	line	412
	
l11612:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_angleTurned+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_abs+1)
	addwf	(?_abs+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_angleTurned)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_abs)
	addwf	(?_abs)

	fcall	_abs
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+?_abs),w
	movwf	(??_robotTurnSpeed+0)+0
	movf	(1+?_abs),w
	movwf	((??_robotTurnSpeed+0)+0+1)
	movf	(robotTurnSpeed@angle+1),w
	clrf	(?_abs+1)
	addwf	(?_abs+1)
	movf	(robotTurnSpeed@angle),w
	clrf	(?_abs)
	addwf	(?_abs)

	fcall	_abs
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_robotTurnSpeed+0)+0,w
	xorlw	80h
	movwf	(??_robotTurnSpeed+2)+0
	movf	(1+(?_abs)),w
	xorlw	80h
	subwf	(??_robotTurnSpeed+2)+0,w
	skipz
	goto	u5065
	movf	(0+(?_abs)),w
	subwf	0+(??_robotTurnSpeed+0)+0,w
u5065:

	skipc
	goto	u5061
	goto	u5060
u5061:
	goto	l11592
u5060:
	goto	l11614
	
l6163:	
	line	428
	
l11614:	
;robot.c: 426: }
;robot.c: 428: robotTurn(0);
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurn)
	movlw	high(0)
	movwf	((?_robotTurn))+1
	fcall	_robotTurn
	line	429
	
l6164:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurnSpeed
	__end_of_robotTurnSpeed:
;; =============== function _robotTurnSpeed ends ============

	signat	_robotTurnSpeed,8312
	global	_robotMoveSpeed
psect	text1067,local,class=CODE,delta=2
global __ptext1067
__ptext1067:

;; *************** function _robotMoveSpeed *****************
;; Defined at:
;;		line 357 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  distance        2   57[BANK0 ] int 
;;  speed           2   59[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   64[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_RobotDrive
;;		_robot_read
;;		_UpdateDisplay
;;		_abs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1067
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	357
	global	__size_of_robotMoveSpeed
	__size_of_robotMoveSpeed	equ	__end_of_robotMoveSpeed-_robotMoveSpeed
	
_robotMoveSpeed:	
	opt	stack 1
; Regs used in _robotMoveSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	358
	
l11548:	
;robot.c: 358: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	360
	
l11550:	
;robot.c: 359: int temp1;
;robot.c: 360: RobotDrive(speed, 0x7FFF);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotMoveSpeed@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robotMoveSpeed@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(07FFFh)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(07FFFh)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	363
;robot.c: 363: while (abs(distTravelled) < abs(distance))
	goto	l11580
	
l6150:	
	line	365
	
l11552:	
;robot.c: 364: {
;robot.c: 365: robot_read(0);
	movlw	(0)
	fcall	_robot_read
	line	366
	
l11554:	
;robot.c: 366: if (BumpSensors)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_BumpSensors),w	;volatile
	skipz
	goto	u5000
	goto	l11558
u5000:
	line	368
	
l11556:	
;robot.c: 367: {
;robot.c: 368: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	369
;robot.c: 369: break;
	goto	l11582
	line	370
	
l6151:	
	line	371
	
l11558:	
;robot.c: 370: }
;robot.c: 371: if (VwallSensor)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_VwallSensor),w	;volatile
	skipz
	goto	u5010
	goto	l11562
u5010:
	line	373
	
l11560:	
;robot.c: 372: {
;robot.c: 373: ROBOTerror = 2;
	movlw	(02h)
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	374
;robot.c: 374: break;
	goto	l11582
	line	375
	
l6153:	
	line	376
	
l11562:	
;robot.c: 375: }
;robot.c: 376: if (CliffSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5020
	goto	l11566
u5020:
	line	378
	
l11564:	
;robot.c: 377: {
;robot.c: 378: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	379
;robot.c: 379: break;
	goto	l11582
	line	380
	
l6154:	
	line	381
	
l11566:	
;robot.c: 380: }
;robot.c: 381: temp1 = DistHighByte;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_DistHighByte),w	;volatile
	movwf	(??_robotMoveSpeed+0)+0
	clrf	(??_robotMoveSpeed+0)+0+1
	movf	0+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1)
	movf	1+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1+1)
	line	382
	
l11568:	
;robot.c: 382: temp1 = temp1 << 8;
	movf	(robotMoveSpeed@temp1+1),w
	movwf	(??_robotMoveSpeed+0)+0+1
	movf	(robotMoveSpeed@temp1),w
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	movwf	(??_robotMoveSpeed+0)+1
	clrf	(??_robotMoveSpeed+0)+0
	movf	0+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1)
	movf	1+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1+1)
	line	383
	
l11570:	
;robot.c: 383: temp1 += DistLowByte;
	movf	(_DistLowByte),w	;volatile
	movwf	(??_robotMoveSpeed+0)+0
	clrf	(??_robotMoveSpeed+0)+0+1
	movf	0+(??_robotMoveSpeed+0)+0,w
	addwf	(robotMoveSpeed@temp1),f
	skipnc
	incf	(robotMoveSpeed@temp1+1),f
	movf	1+(??_robotMoveSpeed+0)+0,w
	addwf	(robotMoveSpeed@temp1+1),f
	line	384
	
l11572:	
;robot.c: 384: distTravelled += temp1;
	movf	(robotMoveSpeed@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_distTravelled)^080h,f
	skipnc
	incf	(_distTravelled+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotMoveSpeed@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_distTravelled+1)^080h,f
	line	385
	
l11574:	
;robot.c: 385: TotalDistTravelled += temp1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotMoveSpeed@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_TotalDistTravelled)^080h,f
	skipnc
	incf	(_TotalDistTravelled+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotMoveSpeed@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_TotalDistTravelled+1)^080h,f
	line	386
	
l11576:	
;robot.c: 386: Disp2 = distTravelled;
	movf	(_distTravelled+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_distTravelled)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	387
	
l11578:	
;robot.c: 387: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11580
	line	393
	
l6149:	
	line	363
	
l11580:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_abs+1)
	addwf	(?_abs+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_abs)
	addwf	(?_abs)

	fcall	_abs
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+?_abs),w
	movwf	(??_robotMoveSpeed+0)+0
	movf	(1+?_abs),w
	movwf	((??_robotMoveSpeed+0)+0+1)
	movf	(robotMoveSpeed@distance+1),w
	clrf	(?_abs+1)
	addwf	(?_abs+1)
	movf	(robotMoveSpeed@distance),w
	clrf	(?_abs)
	addwf	(?_abs)

	fcall	_abs
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_robotMoveSpeed+0)+0,w
	xorlw	80h
	movwf	(??_robotMoveSpeed+2)+0
	movf	(1+(?_abs)),w
	xorlw	80h
	subwf	(??_robotMoveSpeed+2)+0,w
	skipz
	goto	u5035
	movf	(0+(?_abs)),w
	subwf	0+(??_robotMoveSpeed+0)+0,w
u5035:

	skipc
	goto	u5031
	goto	u5030
u5031:
	goto	l11552
u5030:
	goto	l11582
	
l6152:	
	line	394
	
l11582:	
;robot.c: 393: }
;robot.c: 394: Disp2 = ROBOTerror;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	clrf	(??_robotMoveSpeed+0)+0+1
	movf	0+(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_Disp2)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_Disp2+1)^080h
	line	395
	
l11584:	
;robot.c: 395: UpdateDisplay();
	fcall	_UpdateDisplay
	line	396
	
l11586:	
;robot.c: 396: RobotDrive(0, 0x7FFF);
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_RobotDrive)
	movlw	high(0)
	movwf	((?_RobotDrive))+1
	movlw	low(07FFFh)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(07FFFh)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	398
	
l6155:	
	return
	opt stack 0
GLOBAL	__end_of_robotMoveSpeed
	__end_of_robotMoveSpeed:
;; =============== function _robotMoveSpeed ends ============

	signat	_robotMoveSpeed,8312
	global	_calibrateIR
psect	text1068,local,class=CODE,delta=2
global __ptext1068
__ptext1068:

;; *************** function _calibrateIR *****************
;; Defined at:
;;		line 316 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_rotate
;;		_UpdateDisplay
;; This function is called by:
;;		_main
;;		_Init_Follow_IR
;; This function uses a non-reentrant model
;;
psect	text1068
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	316
	global	__size_of_calibrateIR
	__size_of_calibrateIR	equ	__end_of_calibrateIR-_calibrateIR
	
_calibrateIR:	
	opt	stack 0
; Regs used in _calibrateIR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	317
	
l11516:	
;Main.c: 317: currentMenu = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h	;volatile
	bsf	status,0
	rlf	(_currentMenu)^080h,f	;volatile
	line	318
	
l11518:	
;Main.c: 318: rotate(8, 0);
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(08h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	319
	
l11520:	
;Main.c: 319: rotate(8, 1);
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(08h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	goto	l11522
	line	320
;Main.c: 320: while (1)
	
l2283:	
	line	322
	
l11522:	
;Main.c: 321: {
;Main.c: 322: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u4991
	goto	u4990
u4991:
	goto	l11546
u4990:
	line	324
	
l11524:	
;Main.c: 323: {
;Main.c: 324: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	325
	
l11526:	
;Main.c: 325: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11546
	line	326
	
l2284:	
	line	327
;Main.c: 326: }
;Main.c: 327: switch (buttonPressed)
	goto	l11546
	line	329
;Main.c: 328: {
;Main.c: 329: case 1:
	
l2286:	
	line	330
;Main.c: 330: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	331
;Main.c: 331: break;
	goto	l11522
	line	332
;Main.c: 332: case 2:
	
l2288:	
	line	333
;Main.c: 333: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	334
;Main.c: 334: break;
	goto	l11522
	line	335
;Main.c: 335: case 3:
	
l2289:	
	line	336
	
l11528:	
;Main.c: 336: rotate(1, 1);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(01h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	line	337
	
l11530:	
;Main.c: 337: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	338
;Main.c: 338: break;
	goto	l11522
	line	339
;Main.c: 339: case 4:
	
l2290:	
	line	340
	
l11532:	
;Main.c: 340: rotate(1, 0);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(01h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	341
	
l11534:	
;Main.c: 341: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	342
;Main.c: 342: break;
	goto	l11522
	line	343
;Main.c: 343: case 5:
	
l2291:	
	line	345
	
l11536:	
;Main.c: 345: totalSteps = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_totalSteps)^080h
	clrf	(_totalSteps+1)^080h
	line	346
	
l11538:	
;Main.c: 346: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	347
	
l11540:	
;Main.c: 347: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	goto	l2292
	line	348
	
l11542:	
;Main.c: 348: return;
	goto	l2292
	line	349
;Main.c: 349: default:
	
l2293:	
	line	350
;Main.c: 350: break;
	goto	l11522
	line	351
	
l11544:	
;Main.c: 351: }
	goto	l11522
	line	327
	
l2285:	
	
l11546:	
	movf	(_buttonPressed),w	;volatile
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 1 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           26    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l2286
	xorlw	2^1	; case 2
	skipnz
	goto	l2288
	xorlw	3^2	; case 3
	skipnz
	goto	l11528
	xorlw	4^3	; case 4
	skipnz
	goto	l11532
	xorlw	5^4	; case 5
	skipnz
	goto	l11536
	goto	l11522
	opt asmopt_on

	line	351
	
l2287:	
	goto	l11522
	line	352
	
l2294:	
	line	320
	goto	l11522
	
l2295:	
	line	353
	
l2292:	
	return
	opt stack 0
GLOBAL	__end_of_calibrateIR
	__end_of_calibrateIR:
;; =============== function _calibrateIR ends ============

	signat	_calibrateIR,88
	global	_UpdateDisplay
psect	text1069,local,class=CODE,delta=2
global __ptext1069
__ptext1069:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 236 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  LCDOutput      16   41[BANK0 ] unsigned char [16]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      16       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      20       0       0       0
;;Total ram usage:       20 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_lcd_write_control
;;		_sprintf
;;		_lcd_set_cursor
;;		_lcd_write_string
;;		___awmod
;; This function is called by:
;;		_main
;;		_calibrateIR
;;		_ChargeMode
;;		_robotFollow
;;		_robot_turnRight
;;		_robotMoveSpeed
;;		_robotTurnSpeed
;;		_scan360
;; This function uses a non-reentrant model
;;
psect	text1069
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	236
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
	opt	stack 1
; Regs used in _UpdateDisplay: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	237
	
l11446:	
;HMI.c: 237: char LCDOutput[16] = "";
	movlw	(UpdateDisplay@LCDOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1261)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	fsr0,w
	movwf	((??_UpdateDisplay+0)+0+1)
	movlw	16
	movwf	((??_UpdateDisplay+0)+0+2)
u4970:
	movf	(??_UpdateDisplay+0)+0,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	
	movf	indf,w
	movwf	((??_UpdateDisplay+0)+0+3)
	incf	(??_UpdateDisplay+0)+0,f
	movf	((??_UpdateDisplay+0)+0+1),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	((??_UpdateDisplay+0)+0+3),w
	movwf	indf
	incf	((??_UpdateDisplay+0)+0+1),f
	decfsz	((??_UpdateDisplay+0)+0+2),f
	goto	u4970
	line	238
;HMI.c: 238: switch (currentMenu)
	goto	l11510
	line	240
;HMI.c: 239: {
;HMI.c: 240: case 0:
	
l4577:	
	line	241
	
l11448:	
;HMI.c: 241: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	242
	
l11450:	
;HMI.c: 242: sprintf(LCDOutput,"IR:%dcm D:%d",Disp1, Disp2);
	movlw	((STR_13-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	(??_UpdateDisplay+0)+0,w
	movwf	(?_sprintf)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_Disp1+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_Disp1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+01h
	addwf	0+(?_sprintf)+01h

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_Disp2+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+03h
	addwf	1+(?_sprintf)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_Disp2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+03h
	addwf	0+(?_sprintf)+03h

	movlw	(UpdateDisplay@LCDOutput)&0ffh
	fcall	_sprintf
	line	243
	
l11452:	
;HMI.c: 243: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	244
;HMI.c: 244: lcd_write_string(LCDOutput);
	movlw	(UpdateDisplay@LCDOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	245
	
l11454:	
;HMI.c: 245: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	246
	
l11456:	
;HMI.c: 246: if (pos > 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4985
	movlw	low(01h)
	subwf	(_pos)^080h,w
u4985:

	skipc
	goto	u4981
	goto	u4980
u4981:
	goto	l11460
u4980:
	line	247
	
l11458:	
;HMI.c: 247: lcd_write_string(shortMenuStrings[pos - 1]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	0FFh
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	goto	l11462
	line	248
	
l4578:	
	line	249
	
l11460:	
;HMI.c: 248: else
;HMI.c: 249: lcd_write_string(shortMenuStrings[pos + 6 - 1]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	05h
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	goto	l11462
	
l4579:	
	line	250
	
l11462:	
;HMI.c: 250: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	251
	
l11464:	
;HMI.c: 251: lcd_write_string(menuStrings[pos]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	_menuStrings&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	252
;HMI.c: 252: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	253
	
l11466:	
;HMI.c: 253: lcd_write_string(shortMenuStrings[(pos + 1) % 6]);
	movlw	low(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awmod)
	movlw	high(06h)
	movwf	((?___awmod))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___awmod)+02h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos+1)^080h,w
	skipnc
	addlw	1
	addlw	high(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+0+(?___awmod)+02h
	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	254
;HMI.c: 254: break;
	goto	l4592
	line	255
;HMI.c: 255: case 1:
	
l4581:	
	line	256
	
l11468:	
;HMI.c: 256: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	257
;HMI.c: 257: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	258
	
l11470:	
;HMI.c: 258: lcd_write_string("Zero Step_Motor");
	movlw	low((STR_14-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	259
	
l11472:	
;HMI.c: 259: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	260
;HMI.c: 260: lcd_write_string("<<<");
	movlw	low((STR_15-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	261
	
l11474:	
;HMI.c: 261: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	262
	
l11476:	
;HMI.c: 262: lcd_write_string("CONFIRM");
	movlw	low((STR_16-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	263
;HMI.c: 263: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	264
	
l11478:	
;HMI.c: 264: lcd_write_string(">>>");
	movlw	low((STR_17-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	265
;HMI.c: 265: break;
	goto	l4592
	line	266
;HMI.c: 266: case 2:
	
l4582:	
	line	267
	
l11480:	
;HMI.c: 267: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	268
;HMI.c: 268: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	269
	
l11482:	
;HMI.c: 269: lcd_write_string(" Charging Mode ");
	movlw	low((STR_18-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	270
	
l11484:	
;HMI.c: 270: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	271
;HMI.c: 271: sprintf(LCDOutput,"%dmV", BattCharge);
	movlw	((STR_19-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	(??_UpdateDisplay+0)+0,w
	movwf	(?_sprintf)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BattCharge+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BattCharge)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+01h
	addwf	0+(?_sprintf)+01h

	movlw	(UpdateDisplay@LCDOutput)&0ffh
	fcall	_sprintf
	line	272
;HMI.c: 272: lcd_write_string(LCDOutput);
	movlw	(UpdateDisplay@LCDOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	273
	
l11486:	
;HMI.c: 273: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	274
;HMI.c: 274: switch(BattState)
	goto	l11502
	line	276
;HMI.c: 275: {
;HMI.c: 276: case 0:
	
l4584:	
	line	277
	
l11488:	
;HMI.c: 277: lcd_write_string("NC");
	movlw	low((STR_20-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	278
;HMI.c: 278: break;
	goto	l11504
	line	279
;HMI.c: 279: case 1:
	
l4586:	
	line	280
	
l11490:	
;HMI.c: 280: lcd_write_string("RC");
	movlw	low((STR_21-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	281
;HMI.c: 281: break;
	goto	l11504
	line	282
;HMI.c: 282: case 2:
	
l4587:	
	line	283
	
l11492:	
;HMI.c: 283: lcd_write_string("FC");
	movlw	low((STR_22-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	284
;HMI.c: 284: break;
	goto	l11504
	line	285
;HMI.c: 285: case 3:
	
l4588:	
	line	286
	
l11494:	
;HMI.c: 286: lcd_write_string("TC");
	movlw	low((STR_23-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	287
;HMI.c: 287: break;
	goto	l11504
	line	288
;HMI.c: 288: case 4:
	
l4589:	
	line	289
	
l11496:	
;HMI.c: 289: lcd_write_string("Wa");
	movlw	low((STR_24-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	290
;HMI.c: 290: break;
	goto	l11504
	line	291
;HMI.c: 291: case 5:
	
l4590:	
	line	292
	
l11498:	
;HMI.c: 292: lcd_write_string("FC");
	movlw	low((STR_25-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	293
;HMI.c: 293: break;
	goto	l11504
	line	294
	
l11500:	
;HMI.c: 294: }
	goto	l11504
	line	274
	
l4583:	
	
l11502:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf (_BattState+1)^080h,w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l11934
	goto	l11504
	opt asmopt_on
	
l11934:	
; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
; direct_byte           26     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            10     6 (fixed)
; spacedrange           18     9 (fixed)
; locatedrange           6     3 (fixed)
;	Chosen strategy is simple_byte

	movf (_BattState)^080h,w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l11488
	xorlw	1^0	; case 1
	skipnz
	goto	l11490
	xorlw	2^1	; case 2
	skipnz
	goto	l11492
	xorlw	3^2	; case 3
	skipnz
	goto	l11494
	xorlw	4^3	; case 4
	skipnz
	goto	l11496
	xorlw	5^4	; case 5
	skipnz
	goto	l11498
	goto	l11504
	opt asmopt_on

	line	294
	
l4585:	
	line	296
	
l11504:	
;HMI.c: 296: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	297
	
l11506:	
;HMI.c: 297: lcd_write_string("  EXIT  ");
	movlw	low((STR_26-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	298
;HMI.c: 298: break;
	goto	l4592
	line	299
;HMI.c: 299: default:
	
l4591:	
	line	300
;HMI.c: 300: break;
	goto	l4592
	line	301
	
l11508:	
;HMI.c: 301: }
	goto	l4592
	line	238
	
l4576:	
	
l11510:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentMenu)^080h,w	;volatile
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l11448
	xorlw	1^0	; case 1
	skipnz
	goto	l11468
	xorlw	2^1	; case 2
	skipnz
	goto	l11480
	goto	l4592
	opt asmopt_on

	line	301
	
l4580:	
	line	302
	
l4592:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,88
	global	_readAvgDistance
psect	text1070,local,class=CODE,delta=2
global __ptext1070
__ptext1070:

;; *************** function _readAvgDistance *****************
;; Defined at:
;;		line 28 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   22[BANK0 ] int 
;;  tempIR          2   20[BANK0 ] unsigned int 
;;  j               2   18[BANK0 ] int 
;;  fullval         2   16[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       8       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_readDistance
;;		___lwdiv
;;		_ADCconvert
;; This function is called by:
;;		_main
;;		_robotFollow
;;		_robot_turnRight
;;		_RightTurn
;;		_scan360
;; This function uses a non-reentrant model
;;
psect	text1070
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	28
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	29
	
l11428:	
;infrared.c: 29: unsigned int fullval = 0, tempIR = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(readAvgDistance@fullval)
	clrf	(readAvgDistance@fullval+1)
	clrf	(readAvgDistance@tempIR)
	clrf	(readAvgDistance@tempIR+1)
	line	30
;infrared.c: 30: int j = 0;
	clrf	(readAvgDistance@j)
	clrf	(readAvgDistance@j+1)
	line	32
;infrared.c: 32: for (int i = 0; i < 8; i++)
	clrf	(readAvgDistance@i)
	clrf	(readAvgDistance@i+1)
	
l11430:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4945
	movlw	low(08h)
	subwf	(readAvgDistance@i),w
u4945:

	skipc
	goto	u4941
	goto	u4940
u4941:
	goto	l11434
u4940:
	goto	l11442
	
l11432:	
	goto	l11442
	line	33
	
l3024:	
	line	34
	
l11434:	
;infrared.c: 33: {
;infrared.c: 34: tempIR = readDistance();
	fcall	_readDistance
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_readDistance)),w
	clrf	(readAvgDistance@tempIR+1)
	addwf	(readAvgDistance@tempIR+1)
	movf	(0+(?_readDistance)),w
	clrf	(readAvgDistance@tempIR)
	addwf	(readAvgDistance@tempIR)

	line	35
	
l11436:	
;infrared.c: 35: if (tempIR <= 1000)
	movlw	high(03E9h)
	subwf	(readAvgDistance@tempIR+1),w
	movlw	low(03E9h)
	skipnz
	subwf	(readAvgDistance@tempIR),w
	skipnc
	goto	u4951
	goto	u4950
u4951:
	goto	l3026
u4950:
	line	37
	
l11438:	
;infrared.c: 36: {
;infrared.c: 37: fullval += tempIR;
	movf	(readAvgDistance@tempIR),w
	addwf	(readAvgDistance@fullval),f
	skipnc
	incf	(readAvgDistance@fullval+1),f
	movf	(readAvgDistance@tempIR+1),w
	addwf	(readAvgDistance@fullval+1),f
	line	38
;infrared.c: 38: j++;
	movlw	low(01h)
	addwf	(readAvgDistance@j),f
	skipnc
	incf	(readAvgDistance@j+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@j+1),f
	line	39
	
l3026:	
	line	32
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
l11440:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4965
	movlw	low(08h)
	subwf	(readAvgDistance@i),w
u4965:

	skipc
	goto	u4961
	goto	u4960
u4961:
	goto	l11434
u4960:
	goto	l11442
	
l3025:	
	line	41
	
l11442:	
;infrared.c: 39: }
;infrared.c: 40: }
;infrared.c: 41: adcVal = fullval / j;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(readAvgDistance@j+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(readAvgDistance@j),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	movf	(readAvgDistance@fullval+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(readAvgDistance@fullval),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	(_adcVal+1)	;volatile
	addwf	(_adcVal+1)	;volatile
	movf	(0+(?___lwdiv)),w
	clrf	(_adcVal)	;volatile
	addwf	(_adcVal)	;volatile

	line	42
;infrared.c: 42: ADCconvert();
	fcall	_ADCconvert
	line	43
	
l11444:	
;infrared.c: 43: Disp1 = adcVal;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_Disp1+1)^080h	;volatile
	addwf	(_Disp1+1)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_Disp1)^080h	;volatile
	addwf	(_Disp1)^080h	;volatile

	line	44
	
l3027:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,88
	global	_init
psect	text1071,local,class=CODE,delta=2
global __ptext1071
__ptext1071:

;; *************** function _init *****************
;; Defined at:
;;		line 137 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ser_init
;;		_init_adc
;;		_lcd_init
;;		_robo_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1071
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	137
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 2
; Regs used in _init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	138
	
l11402:	
;Main.c: 138: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	140
	
l11404:	
;Main.c: 140: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	141
	
l11406:	
;Main.c: 141: TRISC &= 0b10010000;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_init+0)+0
	movf	(??_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	(135)^080h,f	;volatile
	line	144
	
l11408:	
;Main.c: 144: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	145
	
l11410:	
;Main.c: 145: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	148
	
l11412:	
;Main.c: 148: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	151
	
l11414:	
;Main.c: 151: ser_init();
	fcall	_ser_init
	line	152
	
l11416:	
;Main.c: 152: init_adc();
	fcall	_init_adc
	line	153
	
l11418:	
;Main.c: 153: lcd_init();
	fcall	_lcd_init
	line	154
	
l11420:	
;Main.c: 154: robo_init();
	fcall	_robo_init
	line	158
	
l11422:	
;Main.c: 158: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	160
	
l11424:	
;Main.c: 160: PEIE=1;
	bsf	(94/8),(94)&7
	line	162
	
l11426:	
;Main.c: 162: (GIE = 1);
	bsf	(95/8),(95)&7
	line	163
	
l2245:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_readDistance
psect	text1072,local,class=CODE,delta=2
global __ptext1072
__ptext1072:

;; *************** function _readDistance *****************
;; Defined at:
;;		line 78 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  readVal         2   12[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    8[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_adc_read_channel
;; This function is called by:
;;		_readAvgDistance
;; This function uses a non-reentrant model
;;
psect	text1072
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	78
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	81
	
l11396:	
;infrared.c: 79: unsigned int readVal;
;infrared.c: 81: readVal = adc_read_channel(0);
	movlw	(0)
	fcall	_adc_read_channel
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_readDistance+0)+0
	clrf	(??_readDistance+0)+0+1
	movf	0+(??_readDistance+0)+0,w
	movwf	(readDistance@readVal)
	movf	1+(??_readDistance+0)+0,w
	movwf	(readDistance@readVal+1)
	line	83
	
l11398:	
;infrared.c: 83: return readVal;
	movf	(readDistance@readVal+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@readVal),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	l3030
	
l11400:	
	line	84
	
l3030:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_RobotBattRead
psect	text1073,local,class=CODE,delta=2
global __ptext1073
__ptext1073:

;; *************** function _RobotBattRead *****************
;; Defined at:
;;		line 432 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp1           2    4[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ser_putch
;;		_ser_getch
;; This function is called by:
;;		_ChargeMode
;; This function uses a non-reentrant model
;;
psect	text1073
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	432
	global	__size_of_RobotBattRead
	__size_of_RobotBattRead	equ	__end_of_RobotBattRead-_RobotBattRead
	
_RobotBattRead:	
	opt	stack 1
; Regs used in _RobotBattRead: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	433
	
l11368:	
;robot.c: 433: int temp1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(RobotBattRead@temp1)
	clrf	(RobotBattRead@temp1+1)
	line	434
	
l11370:	
;robot.c: 434: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	435
	
l11372:	
;robot.c: 435: ser_putch(25);
	movlw	(019h)
	fcall	_ser_putch
	line	436
	
l11374:	
;robot.c: 436: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_RobotBattRead+0)+0+1),f
	movlw	118
movwf	((??_RobotBattRead+0)+0),f
u5417:
	decfsz	((??_RobotBattRead+0)+0),f
	goto	u5417
	decfsz	((??_RobotBattRead+0)+0+1),f
	goto	u5417
	clrwdt
opt asmopt_on

	line	437
	
l11376:	
;robot.c: 437: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	movf	(??_RobotBattRead+0)+0,w
	movwf	(_DistHighByte)	;volatile
	line	438
	
l11378:	
;robot.c: 438: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	movf	(??_RobotBattRead+0)+0,w
	movwf	(_DistLowByte)	;volatile
	line	439
	
l11380:	
;robot.c: 439: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	440
	
l11382:	
;robot.c: 440: ser_putch(21);
	movlw	(015h)
	fcall	_ser_putch
	line	441
	
l11384:	
;robot.c: 441: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_RobotBattRead+0)+0+1),f
	movlw	118
movwf	((??_RobotBattRead+0)+0),f
u5427:
	decfsz	((??_RobotBattRead+0)+0),f
	goto	u5427
	decfsz	((??_RobotBattRead+0)+0+1),f
	goto	u5427
	clrwdt
opt asmopt_on

	line	442
	
l11386:	
;robot.c: 442: BattState = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	clrf	(??_RobotBattRead+0)+0+1
	movf	0+(??_RobotBattRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_BattState)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_RobotBattRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_BattState+1)^080h
	line	445
	
l11388:	
;robot.c: 445: temp1 = DistHighByte;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_DistHighByte),w	;volatile
	movwf	(??_RobotBattRead+0)+0
	clrf	(??_RobotBattRead+0)+0+1
	movf	0+(??_RobotBattRead+0)+0,w
	movwf	(RobotBattRead@temp1)
	movf	1+(??_RobotBattRead+0)+0,w
	movwf	(RobotBattRead@temp1+1)
	line	446
	
l11390:	
;robot.c: 446: temp1 = temp1 << 8;
	movf	(RobotBattRead@temp1+1),w
	movwf	(??_RobotBattRead+0)+0+1
	movf	(RobotBattRead@temp1),w
	movwf	(??_RobotBattRead+0)+0
	movf	(??_RobotBattRead+0)+0,w
	movwf	(??_RobotBattRead+0)+1
	clrf	(??_RobotBattRead+0)+0
	movf	0+(??_RobotBattRead+0)+0,w
	movwf	(RobotBattRead@temp1)
	movf	1+(??_RobotBattRead+0)+0,w
	movwf	(RobotBattRead@temp1+1)
	line	447
	
l11392:	
;robot.c: 447: temp1 += DistLowByte;
	movf	(_DistLowByte),w	;volatile
	movwf	(??_RobotBattRead+0)+0
	clrf	(??_RobotBattRead+0)+0+1
	movf	0+(??_RobotBattRead+0)+0,w
	addwf	(RobotBattRead@temp1),f
	skipnc
	incf	(RobotBattRead@temp1+1),f
	movf	1+(??_RobotBattRead+0)+0,w
	addwf	(RobotBattRead@temp1+1),f
	line	448
	
l11394:	
;robot.c: 448: BattCharge = temp1;
	movf	(RobotBattRead@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_BattCharge+1)^080h
	addwf	(_BattCharge+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotBattRead@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_BattCharge)^080h
	addwf	(_BattCharge)^080h

	line	449
	
l6167:	
	return
	opt stack 0
GLOBAL	__end_of_RobotBattRead
	__end_of_RobotBattRead:
;; =============== function _RobotBattRead ends ============

	signat	_RobotBattRead,88
	global	_robot_read
psect	text1074,local,class=CODE,delta=2
global __ptext1074
__ptext1074:

;; *************** function _robot_read *****************
;; Defined at:
;;		line 52 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  readType        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  readType        1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ser_putch
;;		_ser_getch
;; This function is called by:
;;		_main
;;		_robotFollow
;;		_robot_turnRight
;;		_robotMoveSpeed
;;		_robotTurnSpeed
;; This function uses a non-reentrant model
;;
psect	text1074
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	52
	global	__size_of_robot_read
	__size_of_robot_read	equ	__end_of_robot_read-_robot_read
	
_robot_read:	
	opt	stack 1
; Regs used in _robot_read: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;robot_read@readType stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_read@readType)
	line	53
	
l11352:	
;robot.c: 53: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	54
;robot.c: 54: ser_putch(10);
	movlw	(0Ah)
	fcall	_ser_putch
	line	56
;robot.c: 56: CliffSensors = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_CliffSensors)^080h	;volatile
	line	58
;robot.c: 58: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	59
;robot.c: 59: ser_putch(11);
	movlw	(0Bh)
	fcall	_ser_putch
	line	61
;robot.c: 61: CliffSensors += ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_CliffSensors)^080h,f	;volatile
	line	65
;robot.c: 65: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	66
;robot.c: 66: ser_putch(7);
	movlw	(07h)
	fcall	_ser_putch
	line	68
;robot.c: 68: BumpSensors = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	movwf	(_BumpSensors)	;volatile
	line	70
;robot.c: 70: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	71
;robot.c: 71: ser_putch(13);
	movlw	(0Dh)
	fcall	_ser_putch
	line	73
;robot.c: 73: VwallSensor = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	movwf	(_VwallSensor)	;volatile
	line	77
	
l11354:	
;robot.c: 77: if (readType == 0)
	movf	(robot_read@readType),f
	skipz
	goto	u4911
	goto	u4910
u4911:
	goto	l11358
u4910:
	line	79
	
l11356:	
;robot.c: 78: {
;robot.c: 79: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	80
;robot.c: 80: ser_putch(19);
	movlw	(013h)
	fcall	_ser_putch
	line	82
;robot.c: 82: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	movwf	(_DistHighByte)	;volatile
	line	83
;robot.c: 83: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	movwf	(_DistLowByte)	;volatile
	line	84
;robot.c: 84: }
	goto	l6092
	line	85
	
l6085:	
	
l11358:	
;robot.c: 85: else if (readType == 1)
	movf	(robot_read@readType),w
	xorlw	01h
	skipz
	goto	u4921
	goto	u4920
u4921:
	goto	l11362
u4920:
	line	87
	
l11360:	
;robot.c: 86: {
;robot.c: 87: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	88
;robot.c: 88: ser_putch(20);
	movlw	(014h)
	fcall	_ser_putch
	line	90
;robot.c: 90: AngleHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleHighByte)^080h	;volatile
	line	91
;robot.c: 91: AngleLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleLowByte)^080h	;volatile
	line	92
;robot.c: 92: }
	goto	l6092
	line	93
	
l6087:	
	
l11362:	
;robot.c: 93: else if (readType == 2)
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_read@readType),w
	xorlw	02h
	skipz
	goto	u4931
	goto	u4930
u4931:
	goto	l6092
u4930:
	line	96
	
l11364:	
;robot.c: 94: {
;robot.c: 96: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	97
;robot.c: 97: ser_putch(19);
	movlw	(013h)
	fcall	_ser_putch
	line	99
;robot.c: 99: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	movwf	(_DistHighByte)	;volatile
	line	100
;robot.c: 100: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	movwf	(_DistLowByte)	;volatile
	line	101
;robot.c: 101: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	102
;robot.c: 102: ser_putch(20);
	movlw	(014h)
	fcall	_ser_putch
	line	104
;robot.c: 104: AngleHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleHighByte)^080h	;volatile
	line	105
;robot.c: 105: AngleLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleLowByte)^080h	;volatile
	line	106
;robot.c: 106: }
	goto	l6092
	line	107
	
l6089:	
	goto	l6092
	
l11366:	
	goto	l6092
	line	110
;robot.c: 108: {
	
l6091:	
	goto	l6092
	line	111
	
l6090:	
	goto	l6092
	
l6088:	
	goto	l6092
	
l6086:	
	
l6092:	
	return
	opt stack 0
GLOBAL	__end_of_robot_read
	__end_of_robot_read:
;; =============== function _robot_read ends ============

	signat	_robot_read,4216
	global	_lcd_init
psect	text1075,local,class=CODE,delta=2
global __ptext1075
__ptext1075:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 101 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_write_control
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text1075
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 2
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l11332:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l11334:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l11336:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l11338:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l11340:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l11342:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l11344:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l11346:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l11348:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l11350:	
;lcd.c: 119: lcd_write_control(0b00000010);
	movlw	(02h)
	fcall	_lcd_write_control
	line	121
	
l1429:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_write_string
psect	text1076,local,class=CODE,delta=2
global __ptext1076
__ptext1076:

;; *************** function _lcd_write_string *****************
;; Defined at:
;;		line 48 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               2    7[BANK0 ] PTR unsigned char 
;;		 -> STR_26(9), STR_25(3), STR_24(3), STR_23(3), 
;;		 -> STR_22(3), STR_21(3), STR_20(3), STR_18(16), 
;;		 -> STR_17(4), STR_16(8), STR_15(4), STR_14(16), 
;;		 -> UpdateDisplay@LCDOutput(16), STR_12(4), STR_11(4), STR_10(4), 
;;		 -> STR_9(4), STR_8(4), STR_7(4), STR_6(9), 
;;		 -> STR_5(9), STR_4(8), STR_3(9), STR_2(9), 
;;		 -> STR_1(9), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_write_data
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1076
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 1
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
l11324:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	l11330
	
l1409:	
	
l11326:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
l11328:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
	goto	l11330
	
l1408:	
	
l11330:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u4901
	goto	u4900
u4901:
	goto	l11326
u4900:
	goto	l1411
	
l1410:	
	line	51
	
l1411:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_string
	__end_of_lcd_write_string:
;; =============== function _lcd_write_string ends ============

	signat	_lcd_write_string,4216
	global	_lcd_set_cursor
psect	text1077,local,class=CODE,delta=2
global __ptext1077
__ptext1077:

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 42 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd_write_control
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1077
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	42
	global	__size_of_lcd_set_cursor
	__size_of_lcd_set_cursor	equ	__end_of_lcd_set_cursor-_lcd_set_cursor
	
_lcd_set_cursor:	
	opt	stack 1
; Regs used in _lcd_set_cursor: [wreg+status,2+status,0+pclath+cstack]
;lcd_set_cursor@address stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_set_cursor@address)
	line	43
	
l11320:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
l11322:	
;lcd.c: 44: lcd_write_control(address);
	movf	(lcd_set_cursor@address),w
	fcall	_lcd_write_control
	line	45
	
l1405:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
;; =============== function _lcd_set_cursor ends ============

	signat	_lcd_set_cursor,4216
	global	_abs
psect	text1078,local,class=CODE,delta=2
global __ptext1078
__ptext1078:

;; *************** function _abs *****************
;; Defined at:
;;		line 454 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  v               2    6[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    6[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___wmul
;; This function is called by:
;;		_robot_turnRight
;;		_robotMoveSpeed
;;		_robotTurnSpeed
;; This function uses a non-reentrant model
;;
psect	text1078
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	454
	global	__size_of_abs
	__size_of_abs	equ	__end_of_abs-_abs
	
_abs:	
	opt	stack 2
; Regs used in _abs: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	455
	
l11316:	
;robot.c: 455: return (v * ((v > 0) - (v < 0)));
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(abs@v+1),7
	movlw	1
	movwf	(??_abs+0)+0
	clrf	(??_abs+0)+0+1
	comf	(??_abs+0)+0,f
	comf	(??_abs+0)+1,f
	incf	(??_abs+0)+0,f
	skipnz
	incf	(??_abs+0)+1,f
	movf	(abs@v+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4895
	movlw	low(01h)
	subwf	(abs@v),w
u4895:

	movlw	0
	skipnc
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	0+(??_abs+0)+0,w
	movwf	(?___wmul)
	movf	1+(??_abs+0)+0,w
	skipnc
	incf	1+(??_abs+0)+0,w
	movwf	((?___wmul))+1
	movf	(abs@v+1),w
	clrf	1+(?___wmul)+02h
	addwf	1+(?___wmul)+02h
	movf	(abs@v),w
	clrf	0+(?___wmul)+02h
	addwf	0+(?___wmul)+02h

	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___wmul)),w
	clrf	(?_abs+1)
	addwf	(?_abs+1)
	movf	(0+(?___wmul)),w
	clrf	(?_abs)
	addwf	(?_abs)

	goto	l6170
	
l11318:	
	line	456
	
l6170:	
	return
	opt stack 0
GLOBAL	__end_of_abs
	__end_of_abs:
;; =============== function _abs ends ============

	signat	_abs,4218
	global	_robotTurn
psect	text1079,local,class=CODE,delta=2
global __ptext1079
__ptext1079:

;; *************** function _robotTurn *****************
;; Defined at:
;;		line 137 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  angle           2    2[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_robotTurnSpeed
;; This function uses a non-reentrant model
;;
psect	text1079
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	137
	global	__size_of_robotTurn
	__size_of_robotTurn	equ	__end_of_robotTurn-_robotTurn
	
_robotTurn:	
	opt	stack 2
; Regs used in _robotTurn: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	139
	
l11308:	
;robot.c: 139: if (angle > 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotTurn@angle+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4875
	movlw	low(01h)
	subwf	(robotTurn@angle),w
u4875:

	skipc
	goto	u4871
	goto	u4870
u4871:
	goto	l6098
u4870:
	line	141
	
l11310:	
;robot.c: 140: {
;robot.c: 141: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	143
;robot.c: 143: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	145
;robot.c: 145: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	147
;robot.c: 147: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	149
;robot.c: 149: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	150
;robot.c: 150: }
	goto	l6102
	line	151
	
l6098:	
;robot.c: 151: else if (angle < 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(robotTurn@angle+1),7
	goto	u4881
	goto	u4880
u4881:
	goto	l11314
u4880:
	line	153
	
l11312:	
;robot.c: 152: {
;robot.c: 153: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	155
;robot.c: 155: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	157
;robot.c: 157: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	159
;robot.c: 159: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	161
;robot.c: 161: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	162
;robot.c: 162: }
	goto	l6102
	line	163
	
l6100:	
	line	165
	
l11314:	
;robot.c: 163: else
;robot.c: 164: {
;robot.c: 165: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	167
;robot.c: 167: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	169
;robot.c: 169: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	171
;robot.c: 171: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	173
;robot.c: 173: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	goto	l6102
	line	174
	
l6101:	
	goto	l6102
	
l6099:	
	line	175
	
l6102:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurn
	__end_of_robotTurn:
;; =============== function _robotTurn ends ============

	signat	_robotTurn,4216
	global	_ser_getch
psect	text1080,local,class=CODE,delta=2
global __ptext1080
__ptext1080:

;; *************** function _ser_getch *****************
;; Defined at:
;;		line 55 in file "E:\Aldnoah.Zero\Assignment3\ser.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  c               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ser_isrx
;; This function is called by:
;;		_robot_read
;;		_RobotBattRead
;; This function uses a non-reentrant model
;;
psect	text1080
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	55
	global	__size_of_ser_getch
	__size_of_ser_getch	equ	__end_of_ser_getch-_ser_getch
	
_ser_getch:	
	opt	stack 1
; Regs used in _ser_getch: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	58
	
l11292:	
;ser.c: 56: unsigned char c;
;ser.c: 58: while (ser_isrx()==0)
	goto	l11294
	
l6877:	
	line	59
;ser.c: 59: continue;
	goto	l11294
	
l6876:	
	line	58
	
l11294:	
	fcall	_ser_isrx
	btfss	status,0
	goto	u4861
	goto	u4860
u4861:
	goto	l11294
u4860:
	
l6878:	
	line	61
;ser.c: 61: GIE=0;
	bcf	(95/8),(95)&7
	line	62
	
l11296:	
;ser.c: 62: c=rxfifo[rxoptr];
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_rxoptr)^080h,w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ser_getch+0)+0
	movf	(??_ser_getch+0)+0,w
	movwf	(ser_getch@c)
	line	63
	
l11298:	
;ser.c: 63: ++rxoptr;
	movlw	(01h)
	movwf	(??_ser_getch+0)+0
	movf	(??_ser_getch+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_rxoptr)^080h,f	;volatile
	line	64
	
l11300:	
;ser.c: 64: rxoptr &= (16-1);
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ser_getch+0)+0
	movf	(??_ser_getch+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	(_rxoptr)^080h,f	;volatile
	line	65
	
l11302:	
;ser.c: 65: GIE=1;
	bsf	(95/8),(95)&7
	line	66
	
l11304:	
;ser.c: 66: return c;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(ser_getch@c),w
	goto	l6879
	
l11306:	
	line	67
	
l6879:	
	return
	opt stack 0
GLOBAL	__end_of_ser_getch
	__end_of_ser_getch:
;; =============== function _ser_getch ends ============

	signat	_ser_getch,89
	global	_sprintf
psect	text1081,local,class=CODE,delta=2
global __ptext1081
__ptext1081:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> UpdateDisplay@LCDOutput(16), 
;;  f               1   20[BANK0 ] PTR const unsigned char 
;;		 -> STR_19(5), STR_13(13), 
;; Auto vars:     Size  Location     Type
;;  sp              1   35[BANK0 ] PTR unsigned char 
;;		 -> UpdateDisplay@LCDOutput(16), 
;;  _val            4   31[BANK0 ] struct .
;;  c               1   36[BANK0 ] char 
;;  prec            1   30[BANK0 ] char 
;;  flag            1   29[BANK0 ] unsigned char 
;;  ap              1   28[BANK0 ] PTR void [1]
;;		 -> ?_sprintf(2), 
;; Return value:  Size  Location     Type
;;                  2   20[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       5       0       0       0
;;      Locals:         0       9       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      17       0       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1081
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\doprnt.c"
	line	488
	global	__size_of_sprintf
	__size_of_sprintf	equ	__end_of_sprintf-_sprintf
	
_sprintf:	
	opt	stack 1
; Regs used in _sprintf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;sprintf@sp stored from wreg
	line	537
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(sprintf@sp)
	
l11234:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	l11286
	
l6917:	
	line	542
	
l11236:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u4781
	goto	u4780
u4781:
	goto	l6918
u4780:
	line	545
	
l11238:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11240:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	l11286
	line	547
	
l6918:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	l11244
	line	640
	
l6920:	
	line	641
	goto	l11288
	line	700
	
l6922:	
	goto	l11246
	line	701
	
l6923:	
	line	702
	goto	l11246
	line	805
	
l6925:	
	line	816
	goto	l11286
	line	825
	
l11242:	
	goto	l11246
	line	638
	
l6919:	
	
l11244:	
	movlw	01h
	addwf	(sprintf@f),f
	movlw	-01h
	addwf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(sprintf@c)
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 105
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; jumptable            260     6 (fixed)
; rangetable           110     6 (fixed)
; spacedrange          218     9 (fixed)
; locatedrange         106     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l11288
	xorlw	100^0	; case 100
	skipnz
	goto	l11246
	xorlw	105^100	; case 105
	skipnz
	goto	l11246
	goto	l11286
	opt asmopt_on

	line	825
	
l6924:	
	line	1254
	
l11246:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
l11248:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
l11250:	
	btfss	(sprintf@_val+1),7
	goto	u4791
	goto	u4790
u4791:
	goto	l11256
u4790:
	line	1257
	
l11252:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
l11254:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	l11256
	line	1259
	
l6926:	
	line	1300
	
l11256:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
l11258:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u4801
	goto	u4800
u4801:
	goto	l11262
u4800:
	goto	l11270
	
l11260:	
	goto	l11270
	line	1301
	
l6927:	
	
l11262:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	addwf	(??_sprintf+0)+0,w
	addlw	low((_dpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+1)+0
	fcall	stringdir
	movwf	(??_sprintf+1)+0+1
	movf	1+(??_sprintf+1)+0,w
	subwf	(sprintf@_val+1),w
	skipz
	goto	u4815
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u4815:
	skipnc
	goto	u4811
	goto	u4810
u4811:
	goto	l11266
u4810:
	goto	l11270
	line	1302
	
l11264:	
	goto	l11270
	
l6929:	
	line	1300
	
l11266:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
l11268:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u4821
	goto	u4820
u4821:
	goto	l11262
u4820:
	goto	l11270
	
l6928:	
	line	1433
	
l11270:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u4831
	goto	u4830
u4831:
	goto	l11276
u4830:
	line	1434
	
l11272:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11274:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l11276
	
l6930:	
	line	1467
	
l11276:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	l11284
	
l6932:	
	line	1484
	
l11278:	
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(sprintf@prec),w
	movwf	(??_sprintf+0)+0
	addwf	(??_sprintf+0)+0,w
	addlw	low((_dpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?___lwdiv)
	fcall	stringdir
	movwf	(?___lwdiv+1)
	movf	(sprintf@_val+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(sprintf@_val),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	addlw	030h
	movwf	(??_sprintf+1)+0
	movf	(??_sprintf+1)+0,w
	movwf	(sprintf@c)
	line	1516
	
l11280:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11282:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l11284
	line	1517
	
l6931:	
	line	1469
	
l11284:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u4841
	goto	u4840
u4841:
	goto	l11278
u4840:
	goto	l11286
	
l6933:	
	goto	l11286
	line	1525
	
l6916:	
	line	540
	
l11286:	
	movlw	01h
	addwf	(sprintf@f),f
	movlw	-01h
	addwf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@c)
	movf	((sprintf@c)),f
	skipz
	goto	u4851
	goto	u4850
u4851:
	goto	l11236
u4850:
	goto	l11288
	
l6934:	
	goto	l11288
	line	1527
	
l6921:	
	line	1530
	
l11288:	
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l6935
	line	1532
	
l11290:	
	line	1533
;	Return value of _sprintf is never used
	
l6935:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ADCconvert
psect	text1082,local,class=CODE,delta=2
global __ptext1082
__ptext1082:

;; *************** function _ADCconvert *****************
;; Defined at:
;;		line 89 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___wmul
;;		___lwdiv
;; This function is called by:
;;		_readAvgDistance
;; This function uses a non-reentrant model
;;
psect	text1082
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	89
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [wreg+status,2+status,0+pclath+cstack]
	line	95
	
l11192:	
;infrared.c: 95: if (adcVal >= 213 && adcVal < 234)
	movlw	high(0D5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4641
	goto	u4640
u4641:
	goto	l11198
u4640:
	
l11194:	
	movlw	high(0EAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0EAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4651
	goto	u4650
u4651:
	goto	l11198
u4650:
	line	97
	
l11196:	
;infrared.c: 96: {
;infrared.c: 97: IRdistance = 15 + ((20 - 15)*(234 - adcVal)) / (234 - 213);
	movlw	low(015h)
	movwf	(?___lwdiv)
	movlw	high(015h)
	movwf	((?___lwdiv))+1
	comf	(_adcVal),w	;volatile
	movwf	(??_ADCconvert+0)+0
	comf	(_adcVal+1),w	;volatile
	movwf	((??_ADCconvert+0)+0+1)
	incf	(??_ADCconvert+0)+0,f
	skipnz
	incf	((??_ADCconvert+0)+0+1),f
	movf	0+(??_ADCconvert+0)+0,w
	addlw	low(0EAh)
	movwf	(?___wmul)
	movf	1+(??_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(0EAh)
	movwf	1+(?___wmul)
	movlw	low(05h)
	movwf	0+(?___wmul)+02h
	movlw	high(05h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwdiv)),w
	addlw	low(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_IRdistance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_IRdistance)^080h	;volatile
	line	98
;infrared.c: 98: }
	goto	l3046
	line	99
	
l3033:	
	
l11198:	
;infrared.c: 99: else if (adcVal >= 170 && adcVal < 213)
	movlw	high(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4661
	goto	u4660
u4661:
	goto	l11204
u4660:
	
l11200:	
	movlw	high(0D5h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4671
	goto	u4670
u4671:
	goto	l11204
u4670:
	line	101
	
l11202:	
;infrared.c: 100: {
;infrared.c: 101: IRdistance = 20 + ((30 - 20)*(213 - adcVal)) / (213 - 170);
	movlw	low(02Bh)
	movwf	(?___lwdiv)
	movlw	high(02Bh)
	movwf	((?___lwdiv))+1
	comf	(_adcVal),w	;volatile
	movwf	(??_ADCconvert+0)+0
	comf	(_adcVal+1),w	;volatile
	movwf	((??_ADCconvert+0)+0+1)
	incf	(??_ADCconvert+0)+0,f
	skipnz
	incf	((??_ADCconvert+0)+0+1),f
	movf	0+(??_ADCconvert+0)+0,w
	addlw	low(0D5h)
	movwf	(?___wmul)
	movf	1+(??_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(0D5h)
	movwf	1+(?___wmul)
	movlw	low(0Ah)
	movwf	0+(?___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwdiv)),w
	addlw	low(014h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_IRdistance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(014h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_IRdistance)^080h	;volatile
	line	102
;infrared.c: 102: }
	goto	l3046
	line	103
	
l3035:	
	
l11204:	
;infrared.c: 103: else if (adcVal >= 128 && adcVal < 170)
	movlw	high(080h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4681
	goto	u4680
u4681:
	goto	l11210
u4680:
	
l11206:	
	movlw	high(0AAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4691
	goto	u4690
u4691:
	goto	l11210
u4690:
	line	105
	
l11208:	
;infrared.c: 104: {
;infrared.c: 105: IRdistance = 30 + ((40 - 30)*(170 - adcVal)) / (170 - 128);
	movlw	low(02Ah)
	movwf	(?___lwdiv)
	movlw	high(02Ah)
	movwf	((?___lwdiv))+1
	comf	(_adcVal),w	;volatile
	movwf	(??_ADCconvert+0)+0
	comf	(_adcVal+1),w	;volatile
	movwf	((??_ADCconvert+0)+0+1)
	incf	(??_ADCconvert+0)+0,f
	skipnz
	incf	((??_ADCconvert+0)+0+1),f
	movf	0+(??_ADCconvert+0)+0,w
	addlw	low(0AAh)
	movwf	(?___wmul)
	movf	1+(??_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(0AAh)
	movwf	1+(?___wmul)
	movlw	low(0Ah)
	movwf	0+(?___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwdiv)),w
	addlw	low(01Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_IRdistance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(01Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_IRdistance)^080h	;volatile
	line	106
;infrared.c: 106: }
	goto	l3046
	line	107
	
l3037:	
	
l11210:	
;infrared.c: 107: else if (adcVal >= 107 && adcVal < 128)
	movlw	high(06Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4701
	goto	u4700
u4701:
	goto	l11216
u4700:
	
l11212:	
	movlw	high(080h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4711
	goto	u4710
u4711:
	goto	l11216
u4710:
	line	109
	
l11214:	
;infrared.c: 108: {
;infrared.c: 109: IRdistance = 40 + ((50 - 40)*(128 - adcVal)) / (128 - 107);
	movlw	low(015h)
	movwf	(?___lwdiv)
	movlw	high(015h)
	movwf	((?___lwdiv))+1
	comf	(_adcVal),w	;volatile
	movwf	(??_ADCconvert+0)+0
	comf	(_adcVal+1),w	;volatile
	movwf	((??_ADCconvert+0)+0+1)
	incf	(??_ADCconvert+0)+0,f
	skipnz
	incf	((??_ADCconvert+0)+0+1),f
	movf	0+(??_ADCconvert+0)+0,w
	addlw	low(080h)
	movwf	(?___wmul)
	movf	1+(??_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(080h)
	movwf	1+(?___wmul)
	movlw	low(0Ah)
	movwf	0+(?___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwdiv)),w
	addlw	low(028h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_IRdistance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(028h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_IRdistance)^080h	;volatile
	line	110
;infrared.c: 110: }
	goto	l3046
	line	111
	
l3039:	
	
l11216:	
;infrared.c: 111: else if (adcVal >= 77 && adcVal < 107)
	movlw	high(04Dh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4721
	goto	u4720
u4721:
	goto	l11222
u4720:
	
l11218:	
	movlw	high(06Bh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4731
	goto	u4730
u4731:
	goto	l11222
u4730:
	line	113
	
l11220:	
;infrared.c: 112: {
;infrared.c: 113: IRdistance = 50 + ((60 - 50)*(107 - adcVal)) / (107 - 77);
	movlw	low(01Eh)
	movwf	(?___lwdiv)
	movlw	high(01Eh)
	movwf	((?___lwdiv))+1
	comf	(_adcVal),w	;volatile
	movwf	(??_ADCconvert+0)+0
	comf	(_adcVal+1),w	;volatile
	movwf	((??_ADCconvert+0)+0+1)
	incf	(??_ADCconvert+0)+0,f
	skipnz
	incf	((??_ADCconvert+0)+0+1),f
	movf	0+(??_ADCconvert+0)+0,w
	addlw	low(06Bh)
	movwf	(?___wmul)
	movf	1+(??_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(06Bh)
	movwf	1+(?___wmul)
	movlw	low(0Ah)
	movwf	0+(?___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwdiv)),w
	addlw	low(032h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_IRdistance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(032h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_IRdistance)^080h	;volatile
	line	114
;infrared.c: 114: }
	goto	l3046
	line	115
	
l3041:	
	
l11222:	
;infrared.c: 115: else if (adcVal >= 56 && adcVal < 77)
	movlw	high(038h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4741
	goto	u4740
u4741:
	goto	l11228
u4740:
	
l11224:	
	movlw	high(04Dh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4751
	goto	u4750
u4751:
	goto	l11228
u4750:
	line	117
	
l11226:	
;infrared.c: 116: {
;infrared.c: 117: IRdistance = 60 + ((70 - 60)*(77 - adcVal)) / (77 - 56);
	movlw	low(015h)
	movwf	(?___lwdiv)
	movlw	high(015h)
	movwf	((?___lwdiv))+1
	comf	(_adcVal),w	;volatile
	movwf	(??_ADCconvert+0)+0
	comf	(_adcVal+1),w	;volatile
	movwf	((??_ADCconvert+0)+0+1)
	incf	(??_ADCconvert+0)+0,f
	skipnz
	incf	((??_ADCconvert+0)+0+1),f
	movf	0+(??_ADCconvert+0)+0,w
	addlw	low(04Dh)
	movwf	(?___wmul)
	movf	1+(??_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(04Dh)
	movwf	1+(?___wmul)
	movlw	low(0Ah)
	movwf	0+(?___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwdiv)),w
	addlw	low(03Ch)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_IRdistance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(03Ch)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_IRdistance)^080h	;volatile
	line	118
;infrared.c: 118: }
	goto	l3046
	line	119
	
l3043:	
	
l11228:	
;infrared.c: 119: else if (adcVal >= 43 && adcVal < 56)
	movlw	high(02Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(02Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4761
	goto	u4760
u4761:
	goto	l3046
u4760:
	
l11230:	
	movlw	high(038h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4771
	goto	u4770
u4771:
	goto	l3046
u4770:
	line	121
	
l11232:	
;infrared.c: 120: {
;infrared.c: 121: IRdistance = 70 + ((80 - 70)*(56 - adcVal)) / (56 - 43);
	movlw	low(0Dh)
	movwf	(?___lwdiv)
	movlw	high(0Dh)
	movwf	((?___lwdiv))+1
	comf	(_adcVal),w	;volatile
	movwf	(??_ADCconvert+0)+0
	comf	(_adcVal+1),w	;volatile
	movwf	((??_ADCconvert+0)+0+1)
	incf	(??_ADCconvert+0)+0,f
	skipnz
	incf	((??_ADCconvert+0)+0+1),f
	movf	0+(??_ADCconvert+0)+0,w
	addlw	low(038h)
	movwf	(?___wmul)
	movf	1+(??_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(038h)
	movwf	1+(?___wmul)
	movlw	low(0Ah)
	movwf	0+(?___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwdiv)),w
	addlw	low(046h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_IRdistance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(046h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_IRdistance)^080h	;volatile
	goto	l3046
	line	122
	
l3045:	
	goto	l3046
	line	123
	
l3044:	
	goto	l3046
	
l3042:	
	goto	l3046
	
l3040:	
	goto	l3046
	
l3038:	
	goto	l3046
	
l3036:	
	goto	l3046
	
l3034:	
	
l3046:	
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,88
	global	_rotate
psect	text1083,local,class=CODE,delta=2
global __ptext1083
__ptext1083:

;; *************** function _rotate *****************
;; Defined at:
;;		line 66 in file "E:\Aldnoah.Zero\Assignment3\steppermotor.c"
;; Parameters:    Size  Location     Type
;;  numsteps        2    3[BANK0 ] unsigned int 
;;  direction       1    5[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  i               2    8[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_spi_transfer
;; This function is called by:
;;		_main
;;		_Init_Follow_IR
;;		_calibrateIR
;;		_robotFollow
;;		_RightTurn
;;		_scan360
;; This function uses a non-reentrant model
;;
psect	text1083
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	66
	global	__size_of_rotate
	__size_of_rotate	equ	__end_of_rotate-_rotate
	
_rotate:	
	opt	stack 3
; Regs used in _rotate: [wreg+status,2+status,0+pclath+cstack]
	line	68
	
l11160:	
;steppermotor.c: 68: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	69
	
l11162:	
;steppermotor.c: 69: if (direction == 0)
	movf	(rotate@direction),f
	skipz
	goto	u4611
	goto	u4610
u4611:
	goto	l11166
u4610:
	line	70
	
l11164:	
;steppermotor.c: 70: spi_transfer(0b00001011);
	movlw	(0Bh)
	fcall	_spi_transfer
	goto	l11168
	line	71
	
l3749:	
	line	72
	
l11166:	
;steppermotor.c: 71: else
;steppermotor.c: 72: spi_transfer(0b00001001);
	movlw	(09h)
	fcall	_spi_transfer
	goto	l11168
	
l3750:	
	line	73
	
l11168:	
;steppermotor.c: 73: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11170:	
	bcf	(57/8),(57)&7
	line	74
	
l11172:	
;steppermotor.c: 74: for (unsigned int i = 0; i < numsteps; i++)
	clrf	(rotate@i)
	clrf	(rotate@i+1)
	goto	l3751
	line	75
	
l3752:	
	line	76
;steppermotor.c: 75: {
;steppermotor.c: 76: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	nop
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	77
	
l11174:	
;steppermotor.c: 77: if (direction)
	movf	(rotate@direction),w
	skipz
	goto	u4620
	goto	l11178
u4620:
	line	78
	
l11176:	
;steppermotor.c: 78: totalSteps++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_totalSteps)^080h,f
	skipnc
	incf	(_totalSteps+1)^080h,f
	movlw	high(01h)
	addwf	(_totalSteps+1)^080h,f
	goto	l3754
	line	79
	
l3753:	
	line	80
	
l11178:	
;steppermotor.c: 79: else
;steppermotor.c: 80: totalSteps--;
	movlw	low(-1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_totalSteps)^080h,f
	skipnc
	incf	(_totalSteps+1)^080h,f
	movlw	high(-1)
	addwf	(_totalSteps+1)^080h,f
	
l3754:	
	line	81
;steppermotor.c: 81: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_rotate+0)+0+1),f
	movlw	101
movwf	((??_rotate+0)+0),f
u5437:
	decfsz	((??_rotate+0)+0),f
	goto	u5437
	decfsz	((??_rotate+0)+0+1),f
	goto	u5437
	nop2
opt asmopt_on

	line	74
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(rotate@i),f
	skipnc
	incf	(rotate@i+1),f
	movlw	high(01h)
	addwf	(rotate@i+1),f
	
l3751:	
	movf	(rotate@numsteps+1),w
	subwf	(rotate@i+1),w
	skipz
	goto	u4635
	movf	(rotate@numsteps),w
	subwf	(rotate@i),w
u4635:
	skipc
	goto	u4631
	goto	u4630
u4631:
	goto	l3752
u4630:
	
l3755:	
	line	83
;steppermotor.c: 82: }
;steppermotor.c: 83: RC0 = 1; RC1 = 1;;
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	84
	
l11180:	
;steppermotor.c: 84: spi_transfer(0b00000000);
	movlw	(0)
	fcall	_spi_transfer
	line	85
	
l11182:	
;steppermotor.c: 85: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11184:	
	bcf	(57/8),(57)&7
	line	86
	
l11186:	
;steppermotor.c: 86: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l11188:	
	nop
	
l11190:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	87
	
l3756:	
	return
	opt stack 0
GLOBAL	__end_of_rotate
	__end_of_rotate:
;; =============== function _rotate ends ============

	signat	_rotate,8312
	global	_RobotDrive
psect	text1084,local,class=CODE,delta=2
global __ptext1084
__ptext1084:

;; *************** function _RobotDrive *****************
;; Defined at:
;;		line 116 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  speed           2   15[BANK0 ] int 
;;  radius          2   17[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  radiushighBy    1   23[BANK0 ] unsigned char 
;;  radiuslowByt    1   22[BANK0 ] unsigned char 
;;  speedhighByt    1   21[BANK0 ] unsigned char 
;;  speedlowByte    1   20[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_main
;;		_robotFollow
;;		_robot_turnRight
;;		_robotMoveSpeed
;; This function uses a non-reentrant model
;;
psect	text1084
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	116
	global	__size_of_RobotDrive
	__size_of_RobotDrive	equ	__end_of_RobotDrive-_RobotDrive
	
_RobotDrive:	
	opt	stack 2
; Regs used in _RobotDrive: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	118
	
l11144:	
;robot.c: 118: unsigned char speedlowByte = (unsigned char)(speed);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speed),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@speedlowByte)
	line	119
	
l11146:	
;robot.c: 119: unsigned char speedhighByte = (unsigned char)(speed >> 8);
	movf	(RobotDrive@speed+1),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@speedhighByte)
	line	120
	
l11148:	
;robot.c: 120: unsigned char radiuslowByte = (unsigned char)(radius);
	movf	(RobotDrive@radius),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@radiuslowByte)
	line	121
;robot.c: 121: unsigned char radiushighByte = (unsigned char)(radius >> 8);
	movf	(RobotDrive@radius+1),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@radiushighByte)
	line	123
	
l11150:	
;robot.c: 123: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	125
	
l11152:	
;robot.c: 125: ser_putch(speedhighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speedhighByte),w
	fcall	_ser_putch
	line	127
	
l11154:	
;robot.c: 127: ser_putch(speedlowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speedlowByte),w
	fcall	_ser_putch
	line	129
	
l11156:	
;robot.c: 129: ser_putch(radiushighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@radiushighByte),w
	fcall	_ser_putch
	line	131
	
l11158:	
;robot.c: 131: ser_putch(radiuslowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@radiuslowByte),w
	fcall	_ser_putch
	line	132
	
l6095:	
	return
	opt stack 0
GLOBAL	__end_of_RobotDrive
	__end_of_RobotDrive:
;; =============== function _RobotDrive ends ============

	signat	_RobotDrive,8312
	global	_robotLoadSong
psect	text1085,local,class=CODE,delta=2
global __ptext1085
__ptext1085:

;; *************** function _robotLoadSong *****************
;; Defined at:
;;		line 460 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1085
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	460
	global	__size_of_robotLoadSong
	__size_of_robotLoadSong	equ	__end_of_robotLoadSong-_robotLoadSong
	
_robotLoadSong:	
	opt	stack 3
; Regs used in _robotLoadSong: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	461
	
l11142:	
;robot.c: 461: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	462
;robot.c: 462: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	463
;robot.c: 463: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	464
;robot.c: 464: ser_putch(72);
	movlw	(048h)
	fcall	_ser_putch
	line	465
;robot.c: 465: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	466
;robot.c: 466: ser_putch(84);
	movlw	(054h)
	fcall	_ser_putch
	line	467
;robot.c: 467: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	468
	
l6173:	
	return
	opt stack 0
GLOBAL	__end_of_robotLoadSong
	__end_of_robotLoadSong:
;; =============== function _robotLoadSong ends ============

	signat	_robotLoadSong,88
	global	_robo_init
psect	text1086,local,class=CODE,delta=2
global __ptext1086
__ptext1086:

;; *************** function _robo_init *****************
;; Defined at:
;;		line 42 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text1086
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	42
	global	__size_of_robo_init
	__size_of_robo_init	equ	__end_of_robo_init-_robo_init
	
_robo_init:	
	opt	stack 2
; Regs used in _robo_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	43
	
l11140:	
;robot.c: 43: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	44
;robot.c: 44: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	45
;robot.c: 45: ser_putch(150);
	movlw	(096h)
	fcall	_ser_putch
	line	46
;robot.c: 46: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	47
	
l6082:	
	return
	opt stack 0
GLOBAL	__end_of_robo_init
	__end_of_robo_init:
;; =============== function _robo_init ends ============

	signat	_robo_init,88
	global	_lcd_write_data
psect	text1087,local,class=CODE,delta=2
global __ptext1087
__ptext1087:

;; *************** function _lcd_write_data *****************
;; Defined at:
;;		line 30 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  databyte        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  databyte        1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_write_string
;;		_lcd_write_2_digit_bcd
;;		_lcd_write_3_digit_bcd
;; This function uses a non-reentrant model
;;
psect	text1087
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	30
	global	__size_of_lcd_write_data
	__size_of_lcd_write_data	equ	__end_of_lcd_write_data-_lcd_write_data
	
_lcd_write_data:	
	opt	stack 1
; Regs used in _lcd_write_data: [wreg]
;lcd_write_data@databyte stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_write_data@databyte)
	line	31
	
l11132:	
;lcd.c: 31: RE2 = 0;
	bcf	(74/8),(74)&7
	line	32
;lcd.c: 32: RE1 = 0;
	bcf	(73/8),(73)&7
	line	33
;lcd.c: 33: RE0 = 1;
	bsf	(72/8),(72)&7
	line	34
	
l11134:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
l11136:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
l11138:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u5447:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u5447
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u5447
opt asmopt_on

	line	38
	
l1402:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_data
	__end_of_lcd_write_data:
;; =============== function _lcd_write_data ends ============

	signat	_lcd_write_data,4216
	global	_lcd_write_control
psect	text1088,local,class=CODE,delta=2
global __ptext1088
__ptext1088:

;; *************** function _lcd_write_control *****************
;; Defined at:
;;		line 18 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  databyte        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  databyte        1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_set_cursor
;;		_lcd_init
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1088
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	18
	global	__size_of_lcd_write_control
	__size_of_lcd_write_control	equ	__end_of_lcd_write_control-_lcd_write_control
	
_lcd_write_control:	
	opt	stack 1
; Regs used in _lcd_write_control: [wreg]
;lcd_write_control@databyte stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_write_control@databyte)
	line	19
	
l11124:	
;lcd.c: 19: RE2 = 0;
	bcf	(74/8),(74)&7
	line	20
;lcd.c: 20: RE1 = 0;
	bcf	(73/8),(73)&7
	line	21
;lcd.c: 21: RE0 = 0;
	bcf	(72/8),(72)&7
	line	22
	
l11126:	
;lcd.c: 22: PORTD = databyte;
	movf	(lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
l11128:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l11130:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??_lcd_write_control+0)+0),f
u5457:
	decfsz	((??_lcd_write_control+0)+0),f
	goto	u5457
	decfsz	((??_lcd_write_control+0)+0+1),f
	goto	u5457
	nop2
opt asmopt_on

	line	26
	
l1399:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_control
	__end_of_lcd_write_control:
;; =============== function _lcd_write_control ends ============

	signat	_lcd_write_control,4216
	global	_init_adc
psect	text1089,local,class=CODE,delta=2
global __ptext1089
__ptext1089:

;; *************** function _init_adc *****************
;; Defined at:
;;		line 61 in file "E:\Aldnoah.Zero\Assignment3\adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text1089
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 3
; Regs used in _init_adc: [wreg+status,2]
	line	63
	
l11114:	
;adc.c: 63: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	64
	
l11116:	
;adc.c: 64: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	67
	
l11118:	
;adc.c: 67: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	68
	
l11120:	
;adc.c: 68: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	70
	
l11122:	
;adc.c: 70: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_init_adc+0)+0,f
u5467:
decfsz	(??_init_adc+0)+0,f
	goto	u5467
opt asmopt_on

	line	72
	
l700:	
	return
	opt stack 0
GLOBAL	__end_of_init_adc
	__end_of_init_adc:
;; =============== function _init_adc ends ============

	signat	_init_adc,88
	global	_adc_read_channel
psect	text1090,local,class=CODE,delta=2
global __ptext1090
__ptext1090:

;; *************** function _adc_read_channel *****************
;; Defined at:
;;		line 20 in file "E:\Aldnoah.Zero\Assignment3\adc.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_adc_read
;; This function is called by:
;;		_readDistance
;; This function uses a non-reentrant model
;;
psect	text1090
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	20
	global	__size_of_adc_read_channel
	__size_of_adc_read_channel	equ	__end_of_adc_read_channel-_adc_read_channel
	
_adc_read_channel:	
	opt	stack 0
; Regs used in _adc_read_channel: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;adc_read_channel@channel stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(adc_read_channel@channel)
	line	21
	
l11098:	
;adc.c: 21: switch(channel)
	goto	l11106
	line	23
;adc.c: 22: {
;adc.c: 23: case 0:
	
l690:	
	line	24
;adc.c: 24: CHS0 = 0;
	bcf	(251/8),(251)&7
	line	25
;adc.c: 25: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	26
;adc.c: 26: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	27
;adc.c: 27: break;
	goto	l11108
	line	28
;adc.c: 28: case 1:
	
l692:	
	line	29
;adc.c: 29: CHS0 = 1;
	bsf	(251/8),(251)&7
	line	30
;adc.c: 30: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	31
;adc.c: 31: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	32
;adc.c: 32: break;
	goto	l11108
	line	33
;adc.c: 33: case 2:
	
l693:	
	line	34
;adc.c: 34: CHS0 = 0;
	bcf	(251/8),(251)&7
	line	35
;adc.c: 35: CHS1 = 1;
	bsf	(252/8),(252)&7
	line	36
;adc.c: 36: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	37
;adc.c: 37: break;
	goto	l11108
	line	38
;adc.c: 38: case 3:
	
l694:	
	line	39
;adc.c: 39: CHS0 = 1;
	bsf	(251/8),(251)&7
	line	40
;adc.c: 40: CHS1 = 1;
	bsf	(252/8),(252)&7
	line	41
;adc.c: 41: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	42
;adc.c: 42: break;
	goto	l11108
	line	43
;adc.c: 43: case 4:
	
l695:	
	line	44
;adc.c: 44: CHS0 = 0;
	bcf	(251/8),(251)&7
	line	45
;adc.c: 45: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	46
;adc.c: 46: CHS2 = 1;
	bsf	(253/8),(253)&7
	line	47
;adc.c: 47: break;
	goto	l11108
	line	50
;adc.c: 50: default:
	
l696:	
	line	51
	
l11100:	
;adc.c: 51: return 0;
	movlw	(0)
	goto	l697
	
l11102:	
	goto	l697
	line	52
	
l11104:	
;adc.c: 52: }
	goto	l11108
	line	21
	
l689:	
	
l11106:	
	movf	(adc_read_channel@channel),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           23     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             9     6 (fixed)
; spacedrange           16     9 (fixed)
; locatedrange           5     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l690
	xorlw	1^0	; case 1
	skipnz
	goto	l692
	xorlw	2^1	; case 2
	skipnz
	goto	l693
	xorlw	3^2	; case 3
	skipnz
	goto	l694
	xorlw	4^3	; case 4
	skipnz
	goto	l695
	goto	l11100
	opt asmopt_on

	line	52
	
l691:	
	line	54
	
l11108:	
;adc.c: 54: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u5477:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u5477
opt asmopt_on

	line	56
	
l11110:	
;adc.c: 56: return adc_read();
	fcall	_adc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_adc_read)),w
	goto	l697
	
l11112:	
	line	58
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
psect	text1091,local,class=CODE,delta=2
global __ptext1091
__ptext1091:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] int 
;;  dividend        2    2[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[BANK0 ] unsigned char 
;;  counter         1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1091
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l11042:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u4461
	goto	u4460
u4461:
	goto	l11046
u4460:
	line	10
	
l11044:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l11046
	line	12
	
l7826:	
	line	13
	
l11046:	
	btfss	(___awmod@divisor+1),7
	goto	u4471
	goto	u4470
u4471:
	goto	l11050
u4470:
	line	14
	
l11048:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l11050
	
l7827:	
	line	15
	
l11050:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u4481
	goto	u4480
u4481:
	goto	l11068
u4480:
	line	16
	
l11052:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l11058
	
l7830:	
	line	18
	
l11054:	
	movlw	01h
	
u4495:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4495
	line	19
	
l11056:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l11058
	line	20
	
l7829:	
	line	17
	
l11058:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u4501
	goto	u4500
u4501:
	goto	l11054
u4500:
	goto	l11060
	
l7831:	
	goto	l11060
	line	21
	
l7832:	
	line	22
	
l11060:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u4515
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u4515:
	skipc
	goto	u4511
	goto	u4510
u4511:
	goto	l11064
u4510:
	line	23
	
l11062:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l11064
	
l7833:	
	line	24
	
l11064:	
	movlw	01h
	
u4525:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u4525
	line	25
	
l11066:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u4531
	goto	u4530
u4531:
	goto	l11060
u4530:
	goto	l11068
	
l7834:	
	goto	l11068
	line	26
	
l7828:	
	line	27
	
l11068:	
	movf	(___awmod@sign),w
	skipz
	goto	u4540
	goto	l11072
u4540:
	line	28
	
l11070:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l11072
	
l7835:	
	line	29
	
l11072:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l7836
	
l11074:	
	line	30
	
l7836:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text1092,local,class=CODE,delta=2
global __ptext1092
__ptext1092:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[BANK0 ] int 
;;  dividend        2    8[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   13[BANK0 ] int 
;;  sign            1   12[BANK0 ] unsigned char 
;;  counter         1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_robot_turnRight
;; This function uses a non-reentrant model
;;
psect	text1092
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 3
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l11002:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u4361
	goto	u4360
u4361:
	goto	l11006
u4360:
	line	11
	
l11004:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l11006
	line	13
	
l7758:	
	line	14
	
l11006:	
	btfss	(___awdiv@dividend+1),7
	goto	u4371
	goto	u4370
u4371:
	goto	l11012
u4370:
	line	15
	
l11008:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l11010:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l11012
	line	17
	
l7759:	
	line	18
	
l11012:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l11014:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u4381
	goto	u4380
u4381:
	goto	l11034
u4380:
	line	20
	
l11016:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l11022
	
l7762:	
	line	22
	
l11018:	
	movlw	01h
	
u4395:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u4395
	line	23
	
l11020:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l11022
	line	24
	
l7761:	
	line	21
	
l11022:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u4401
	goto	u4400
u4401:
	goto	l11018
u4400:
	goto	l11024
	
l7763:	
	goto	l11024
	line	25
	
l7764:	
	line	26
	
l11024:	
	movlw	01h
	
u4415:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u4415
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u4425
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u4425:
	skipc
	goto	u4421
	goto	u4420
u4421:
	goto	l11030
u4420:
	line	28
	
l11026:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l11028:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l11030
	line	30
	
l7765:	
	line	31
	
l11030:	
	movlw	01h
	
u4435:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u4435
	line	32
	
l11032:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u4441
	goto	u4440
u4441:
	goto	l11024
u4440:
	goto	l11034
	
l7766:	
	goto	l11034
	line	33
	
l7760:	
	line	34
	
l11034:	
	movf	(___awdiv@sign),w
	skipz
	goto	u4450
	goto	l11038
u4450:
	line	35
	
l11036:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l11038
	
l7767:	
	line	36
	
l11038:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l7768
	
l11040:	
	line	37
	
l7768:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___lwmod
psect	text1093,local,class=CODE,delta=2
global __ptext1093
__ptext1093:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2   14[BANK0 ] unsigned int 
;;  dividend        2   16[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   19[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   14[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text1093
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l10980:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u4301
	goto	u4300
u4301:
	goto	l10998
u4300:
	line	9
	
l10982:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l10988
	
l7636:	
	line	11
	
l10984:	
	movlw	01h
	
u4315:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4315
	line	12
	
l10986:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l10988
	line	13
	
l7635:	
	line	10
	
l10988:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u4321
	goto	u4320
u4321:
	goto	l10984
u4320:
	goto	l10990
	
l7637:	
	goto	l10990
	line	14
	
l7638:	
	line	15
	
l10990:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u4335
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u4335:
	skipc
	goto	u4331
	goto	u4330
u4331:
	goto	l10994
u4330:
	line	16
	
l10992:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l10994
	
l7639:	
	line	17
	
l10994:	
	movlw	01h
	
u4345:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u4345
	line	18
	
l10996:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u4351
	goto	u4350
u4351:
	goto	l10990
u4350:
	goto	l10998
	
l7640:	
	goto	l10998
	line	19
	
l7634:	
	line	20
	
l10998:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l7641
	
l11000:	
	line	21
	
l7641:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text1094,local,class=CODE,delta=2
global __ptext1094
__ptext1094:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[BANK0 ] unsigned int 
;;  dividend        2    8[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   11[BANK0 ] unsigned int 
;;  counter         1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_readAvgDistance
;;		_ADCconvert
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text1094
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l10954:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l10956:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u4231
	goto	u4230
u4231:
	goto	l10976
u4230:
	line	11
	
l10958:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l10964
	
l7626:	
	line	13
	
l10960:	
	movlw	01h
	
u4245:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u4245
	line	14
	
l10962:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l10964
	line	15
	
l7625:	
	line	12
	
l10964:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u4251
	goto	u4250
u4251:
	goto	l10960
u4250:
	goto	l10966
	
l7627:	
	goto	l10966
	line	16
	
l7628:	
	line	17
	
l10966:	
	movlw	01h
	
u4265:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u4265
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u4275
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u4275:
	skipc
	goto	u4271
	goto	u4270
u4271:
	goto	l10972
u4270:
	line	19
	
l10968:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l10970:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l10972
	line	21
	
l7629:	
	line	22
	
l10972:	
	movlw	01h
	
u4285:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u4285
	line	23
	
l10974:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u4291
	goto	u4290
u4291:
	goto	l10966
u4290:
	goto	l10976
	
l7630:	
	goto	l10976
	line	24
	
l7624:	
	line	25
	
l10976:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l7631
	
l10978:	
	line	26
	
l7631:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text1095,local,class=CODE,delta=2
global __ptext1095
__ptext1095:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[BANK0 ] unsigned int 
;;  multiplicand    2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCconvert
;;		_robot_turnRight
;;		_abs
;; This function uses a non-reentrant model
;;
psect	text1095
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 2
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l10942:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l10944
	line	6
	
l7618:	
	line	7
	
l10944:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u4191
	goto	u4190
u4191:
	goto	l7619
u4190:
	line	8
	
l10946:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l7619:	
	line	9
	movlw	01h
	
u4205:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u4205
	line	10
	
l10948:	
	movlw	01h
	
u4215:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u4215
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u4221
	goto	u4220
u4221:
	goto	l10944
u4220:
	goto	l10950
	
l7620:	
	line	12
	
l10950:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l7621
	
l10952:	
	line	13
	
l7621:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_ser_isrx
psect	text1096,local,class=CODE,delta=2
global __ptext1096
__ptext1096:

;; *************** function _ser_isrx *****************
;; Defined at:
;;		line 45 in file "E:\Aldnoah.Zero\Assignment3\ser.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ser_getch
;; This function uses a non-reentrant model
;;
psect	text1096
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	45
	global	__size_of_ser_isrx
	__size_of_ser_isrx	equ	__end_of_ser_isrx-_ser_isrx
	
_ser_isrx:	
	opt	stack 1
; Regs used in _ser_isrx: [wreg+status,2+status,0]
	line	46
	
l10894:	
;ser.c: 46: if(OERR) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(193/8),(193)&7
	goto	u4121
	goto	u4120
u4121:
	goto	l10902
u4120:
	line	47
	
l10896:	
;ser.c: 47: CREN = 0;
	bcf	(196/8),(196)&7
	line	48
;ser.c: 48: CREN = 1;
	bsf	(196/8),(196)&7
	line	49
	
l10898:	
;ser.c: 49: return 0;
	clrc
	
	goto	l6873
	
l10900:	
	goto	l6873
	line	50
	
l6872:	
	line	51
	
l10902:	
;ser.c: 50: }
;ser.c: 51: return (rxiptr!=rxoptr);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_rxiptr)^080h,w	;volatile
	xorwf	(_rxoptr)^080h,w	;volatile
	skipz
	goto	u4131
	goto	u4130
u4131:
	goto	l10906
u4130:
	
l10904:	
	clrc
	
	goto	l6873
	
l10622:	
	
l10906:	
	setc
	
	goto	l6873
	
l10624:	
	goto	l6873
	
l10908:	
	line	52
	
l6873:	
	return
	opt stack 0
GLOBAL	__end_of_ser_isrx
	__end_of_ser_isrx:
;; =============== function _ser_isrx ends ============

	signat	_ser_isrx,88
	global	_spi_transfer
psect	text1097,local,class=CODE,delta=2
global __ptext1097
__ptext1097:

;; *************** function _spi_transfer *****************
;; Defined at:
;;		line 50 in file "E:\Aldnoah.Zero\Assignment3\steppermotor.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[BANK0 ] unsigned char 
;;  temp            1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rotate
;; This function uses a non-reentrant model
;;
psect	text1097
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	50
	global	__size_of_spi_transfer
	__size_of_spi_transfer	equ	__end_of_spi_transfer-_spi_transfer
	
_spi_transfer:	
	opt	stack 3
; Regs used in _spi_transfer: [wreg]
;spi_transfer@data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(spi_transfer@data)
	line	51
	
l10842:	
;steppermotor.c: 51: unsigned char temp = 0;
	clrf	(spi_transfer@temp)
	line	53
;steppermotor.c: 53: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	54
	
l10844:	
;steppermotor.c: 54: SSPBUF = data;
	movf	(spi_transfer@data),w
	movwf	(19)	;volatile
	line	56
;steppermotor.c: 56: while (SSPIF == 0);
	goto	l3743
	
l3744:	
	
l3743:	
	btfss	(99/8),(99)&7
	goto	u3961
	goto	u3960
u3961:
	goto	l3743
u3960:
	goto	l10846
	
l3745:	
	line	57
	
l10846:	
;steppermotor.c: 57: temp = SSPBUF;
	movf	(19),w	;volatile
	movwf	(??_spi_transfer+0)+0
	movf	(??_spi_transfer+0)+0,w
	movwf	(spi_transfer@temp)
	line	58
	
l10848:	
;steppermotor.c: 58: SSPIF = 0;
	bcf	(99/8),(99)&7
	goto	l3746
	line	60
	
l10850:	
	line	61
;steppermotor.c: 60: return temp;
;	Return value of _spi_transfer is never used
	
l3746:	
	return
	opt stack 0
GLOBAL	__end_of_spi_transfer
	__end_of_spi_transfer:
;; =============== function _spi_transfer ends ============

	signat	_spi_transfer,4217
	global	_ser_putch
psect	text1098,local,class=CODE,delta=2
global __ptext1098
__ptext1098:

;; *************** function _ser_putch *****************
;; Defined at:
;;		line 70 in file "E:\Aldnoah.Zero\Assignment3\ser.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_ChargeMode
;;		_robo_init
;;		_robot_read
;;		_RobotDrive
;;		_robotTurn
;;		_robot_turnRight
;;		_RobotBattRead
;;		_robotLoadSong
;;		_ser_puts
;;		_ser_puts2
;;		_ser_puthex
;; This function uses a non-reentrant model
;;
psect	text1098
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	70
	global	__size_of_ser_putch
	__size_of_ser_putch	equ	__end_of_ser_putch-_ser_putch
	
_ser_putch:	
	opt	stack 2
; Regs used in _ser_putch: [wreg-fsr0h+status,2+status,0]
;ser_putch@c stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ser_putch@c)
	line	71
	
l10800:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l10802
	
l6883:	
	line	72
;ser.c: 72: continue;
	goto	l10802
	
l6882:	
	line	71
	
l10802:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_txiptr)^080h,w	;volatile
	addlw	01h
	andlw	0Fh
	xorwf	(_txoptr)^080h,w	;volatile
	skipnz
	goto	u3911
	goto	u3910
u3911:
	goto	l10802
u3910:
	
l6884:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l10804:	
;ser.c: 74: txfifo[txiptr] = c;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(ser_putch@c),w
	movwf	(??_ser_putch+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_txiptr)^080h,w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_ser_putch+0)+0,w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	line	75
	
l10806:	
;ser.c: 75: txiptr=(txiptr+1) & (16-1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_txiptr)^080h,w	;volatile
	addlw	01h
	andlw	0Fh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ser_putch+0)+0
	movf	(??_ser_putch+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_txiptr)^080h	;volatile
	line	76
	
l10808:	
;ser.c: 76: TXIE=1;
	bsf	(1124/8)^080h,(1124)&7
	line	77
	
l10810:	
;ser.c: 77: GIE=1;
	bsf	(95/8),(95)&7
	line	78
	
l6885:	
	return
	opt stack 0
GLOBAL	__end_of_ser_putch
	__end_of_ser_putch:
;; =============== function _ser_putch ends ============

	signat	_ser_putch,4216
	global	_Menu
psect	text1099,local,class=CODE,delta=2
global __ptext1099
__ptext1099:

;; *************** function _Menu *****************
;; Defined at:
;;		line 201 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;  BTN_input       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  BTN_input       1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1099
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	201
	global	__size_of_Menu
	__size_of_Menu	equ	__end_of_Menu-_Menu
	
_Menu:	
	opt	stack 4
; Regs used in _Menu: [wreg-fsr0h+status,2+status,0]
;Menu@BTN_input stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Menu@BTN_input)
	line	202
	
l10776:	
;HMI.c: 202: switch (BTN_input)
	goto	l10794
	line	204
;HMI.c: 203: {
;HMI.c: 204: case 1:
	
l4562:	
	line	206
;HMI.c: 206: break;
	goto	l10796
	line	207
;HMI.c: 207: case 2:
	
l4564:	
	line	209
;HMI.c: 209: break;
	goto	l10796
	line	210
;HMI.c: 210: case 3:
	
l4565:	
	line	211
	
l10778:	
;HMI.c: 211: pos--;
	movlw	low(-1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(-1)
	addwf	(_pos+1)^080h,f
	line	212
	
l10780:	
;HMI.c: 212: if (pos < 0)
	btfss	(_pos+1)^080h,7
	goto	u3891
	goto	u3890
u3891:
	goto	l10796
u3890:
	line	213
	
l10782:	
;HMI.c: 213: pos = 6 - 1;
	movlw	low(05h)
	movwf	(_pos)^080h
	movlw	high(05h)
	movwf	((_pos)^080h)+1
	goto	l10796
	
l4566:	
	line	215
;HMI.c: 215: break;
	goto	l10796
	line	216
;HMI.c: 216: case 4:
	
l4567:	
	line	217
	
l10784:	
;HMI.c: 217: pos++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(01h)
	addwf	(_pos+1)^080h,f
	line	218
;HMI.c: 218: if (pos == 6)
	movlw	06h
	xorwf	(_pos)^080h,w
	iorwf	(_pos+1)^080h,w
	skipz
	goto	u3901
	goto	u3900
u3901:
	goto	l10796
u3900:
	line	219
	
l10786:	
;HMI.c: 219: pos = 0;
	clrf	(_pos)^080h
	clrf	(_pos+1)^080h
	goto	l10796
	
l4568:	
	line	221
;HMI.c: 221: break;
	goto	l10796
	line	222
;HMI.c: 222: case 5:
	
l4569:	
	line	223
	
l10788:	
;HMI.c: 223: return pos;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	goto	l4570
	
l10790:	
	goto	l4570
	line	226
;HMI.c: 226: default:
	
l4571:	
	line	228
;HMI.c: 228: break;
	goto	l10796
	line	229
	
l10792:	
;HMI.c: 229: }
	goto	l10796
	line	202
	
l4561:	
	
l10794:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(Menu@BTN_input),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 1 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           26    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l10796
	xorlw	2^1	; case 2
	skipnz
	goto	l10796
	xorlw	3^2	; case 3
	skipnz
	goto	l10778
	xorlw	4^3	; case 4
	skipnz
	goto	l10784
	xorlw	5^4	; case 5
	skipnz
	goto	l10788
	goto	l10796
	opt asmopt_on

	line	229
	
l4563:	
	line	230
	
l10796:	
;HMI.c: 230: return 255;
	movlw	(0FFh)
	goto	l4570
	
l10798:	
	line	231
	
l4570:	
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4217
	global	_ser_init
psect	text1100,local,class=CODE,delta=2
global __ptext1100
__ptext1100:

;; *************** function _ser_init *****************
;; Defined at:
;;		line 113 in file "E:\Aldnoah.Zero\Assignment3\ser.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text1100
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 3
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l10750:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l10752:	
;ser.c: 115: TRISC &= 0b10111111;
	movlw	(0BFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ser_init+0)+0
	movf	(??_ser_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	(135)^080h,f	;volatile
	line	116
	
l10754:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l10756:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l10758:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l10760:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l10762:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l10764:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l10766:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l10768:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l10770:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l10772:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l10774:	
;ser.c: 132: rxiptr=rxoptr=txiptr=txoptr=0;
	movlw	(0)
	movwf	(_txoptr)^080h	;volatile
	movwf	(_txiptr)^080h	;volatile
	movwf	(_rxoptr)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ser_init+0)+0
	movf	(??_ser_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_rxiptr)^080h	;volatile
	line	133
	
l6907:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_adc_read
psect	text1101,local,class=CODE,delta=2
global __ptext1101
__ptext1101:

;; *************** function _adc_read *****************
;; Defined at:
;;		line 76 in file "E:\Aldnoah.Zero\Assignment3\adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adc_value       2    4[BANK0 ] volatile unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_adc_read_channel
;; This function uses a non-reentrant model
;;
psect	text1101
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	76
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	79
	
l10630:	
;adc.c: 77: volatile unsigned int adc_value;
;adc.c: 79: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	81
	
l10632:	
;adc.c: 81: GO = 1;
	bsf	(250/8),(250)&7
	line	82
;adc.c: 82: while(GO) continue;
	goto	l703
	
l704:	
	
l703:	
	btfsc	(250/8),(250)&7
	goto	u3701
	goto	u3700
u3701:
	goto	l703
u3700:
	
l705:	
	line	83
# 83 "E:\Aldnoah.Zero\Assignment3\adc.c"
nop ;#
	line	84
# 84 "E:\Aldnoah.Zero\Assignment3\adc.c"
nop ;#
	line	85
# 85 "E:\Aldnoah.Zero\Assignment3\adc.c"
nop ;#
psect	text1101
	line	88
	
l10634:	
;adc.c: 88: adc_value = ADRESH;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(30),w	;volatile
	movwf	(??_adc_read+0)+0
	clrf	(??_adc_read+0)+0+1
	movf	0+(??_adc_read+0)+0,w
	movwf	(adc_read@adc_value)	;volatile
	movf	1+(??_adc_read+0)+0,w
	movwf	(adc_read@adc_value+1)	;volatile
	line	89
;adc.c: 89: adc_value <<= 1;
	movlw	01h
	
u3715:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u3715
	line	90
;adc.c: 90: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	93
	
l10636:	
;adc.c: 93: return (adc_value);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(adc_read@adc_value+1),w	;volatile
	clrf	(?_adc_read+1)
	addwf	(?_adc_read+1)
	movf	(adc_read@adc_value),w	;volatile
	clrf	(?_adc_read)
	addwf	(?_adc_read)

	goto	l706
	
l10638:	
	line	94
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
	global	_isr1
psect	text1102,local,class=CODE,delta=2
global __ptext1102
__ptext1102:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 107 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          5       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		i1___lwmod
;;		_ReadButtons
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1102
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	107
	global	__size_of_isr1
	__size_of_isr1	equ	__end_of_isr1-_isr1
	
_isr1:	
	opt	stack 0
; Regs used in _isr1: [allreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_isr1+1)
	movf	fsr0,w
	movwf	(??_isr1+2)
	movf	pclath,w
	movwf	(??_isr1+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_isr1+4)
	ljmp	_isr1
psect	text1102
	line	108
	
i1l10666:	
;Main.c: 108: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u375_21
	goto	u375_20
u375_21:
	goto	i1l10688
u375_20:
	line	110
	
i1l10668:	
;Main.c: 109: {
;Main.c: 110: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	111
	
i1l10670:	
;Main.c: 111: TMR0 = 100;
	movlw	(064h)
	movwf	(1)	;volatile
	line	113
;Main.c: 113: RTC_Counter++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RTC_Counter)^080h,f	;volatile
	skipnc
	incf	(_RTC_Counter+1)^080h,f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1)^080h,f	;volatile
	line	116
	
i1l10672:	
;Main.c: 116: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	117
	
i1l10674:	
;Main.c: 117: if(RTC_Counter % 250 == 0)
	movlw	low(0FAh)
	movwf	(?i1___lwmod)
	movlw	high(0FAh)
	movwf	((?i1___lwmod))+1
	movf	(_RTC_Counter+1)^080h,w	;volatile
	clrf	1+(?i1___lwmod)+02h
	addwf	1+(?i1___lwmod)+02h
	movf	(_RTC_Counter)^080h,w	;volatile
	clrf	0+(?i1___lwmod)+02h
	addwf	0+(?i1___lwmod)+02h

	fcall	i1___lwmod
	movf	((1+(?i1___lwmod))),w
	iorwf	((0+(?i1___lwmod))),w
	skipz
	goto	u376_21
	goto	u376_20
u376_21:
	goto	i1l10678
u376_20:
	line	119
	
i1l10676:	
;Main.c: 118: {
;Main.c: 119: RTC_FLAG_250MS = 1;
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l10678
	line	120
	
i1l2235:	
	line	121
	
i1l10678:	
;Main.c: 120: }
;Main.c: 121: if(RTC_Counter % 500 == 0)
	movlw	low(01F4h)
	movwf	(?i1___lwmod)
	movlw	high(01F4h)
	movwf	((?i1___lwmod))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RTC_Counter+1)^080h,w	;volatile
	clrf	1+(?i1___lwmod)+02h
	addwf	1+(?i1___lwmod)+02h
	movf	(_RTC_Counter)^080h,w	;volatile
	clrf	0+(?i1___lwmod)+02h
	addwf	0+(?i1___lwmod)+02h

	fcall	i1___lwmod
	movf	((1+(?i1___lwmod))),w
	iorwf	((0+(?i1___lwmod))),w
	skipz
	goto	u377_21
	goto	u377_20
u377_21:
	goto	i1l10684
u377_20:
	line	123
	
i1l10680:	
;Main.c: 122: {
;Main.c: 123: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	124
	
i1l10682:	
;Main.c: 124: RB0 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l10684
	line	125
	
i1l2236:	
	line	126
	
i1l10684:	
;Main.c: 125: }
;Main.c: 126: if (buttonPressed == 0)
	movf	(_buttonPressed),f
	skipz	;volatile
	goto	u378_21
	goto	u378_20
u378_21:
	goto	i1l10688
u378_20:
	line	128
	
i1l10686:	
;Main.c: 127: {
;Main.c: 128: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_buttonPressed)	;volatile
	goto	i1l10688
	line	129
	
i1l2237:	
	goto	i1l10688
	line	130
	
i1l2234:	
	line	131
	
i1l10688:	
;Main.c: 129: }
;Main.c: 130: }
;Main.c: 131: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u379_21
	goto	u379_20
u379_21:
	goto	i1l10698
u379_20:
	
i1l10690:	
	movf	(26),w	;volatile
	movwf	(??_isr1+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_rxiptr)^080h,w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	movf	(??_isr1+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
i1l10692:	
	movf	(_rxiptr)^080h,w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_ser_tmp)^080h
	
i1l10694:	
	movf	(_ser_tmp)^080h,w
	xorwf	(_rxoptr)^080h,w	;volatile
	skipnz
	goto	u380_21
	goto	u380_20
u380_21:
	goto	i1l10698
u380_20:
	
i1l10696:	
	movf	(_ser_tmp)^080h,w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)^080h	;volatile
	goto	i1l10698
	
i1l2239:	
	goto	i1l10698
	
i1l2238:	
	
i1l10698:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(100/8),(100)&7
	goto	u381_21
	goto	u381_20
u381_21:
	goto	i1l2242
u381_20:
	
i1l10700:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u382_21
	goto	u382_20
u382_21:
	goto	i1l2242
u382_20:
	
i1l10702:	
	movf	(_txoptr)^080h,w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	
i1l10704:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_txoptr)^080h,f	;volatile
	
i1l10706:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr)^080h,f	;volatile
	
i1l10708:	
	movf	(_txoptr)^080h,w	;volatile
	xorwf	(_txiptr)^080h,w	;volatile
	skipz
	goto	u383_21
	goto	u383_20
u383_21:
	goto	i1l2242
u383_20:
	
i1l10710:	
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2242
	
i1l2241:	
	goto	i1l2242
	
i1l2240:	
	line	132
	
i1l2242:	
	movf	(??_isr1+4),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	btemp+1
	movf	(??_isr1+3),w
	movwf	pclath
	movf	(??_isr1+2),w
	movwf	fsr0
	swapf	(??_isr1+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr1
	__end_of_isr1:
;; =============== function _isr1 ends ============

	signat	_isr1,88
	global	_ReadButtons
psect	text1103,local,class=CODE,delta=2
global __ptext1103
__ptext1103:

;; *************** function _ReadButtons *****************
;; Defined at:
;;		line 159 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Debounce
;; This function is called by:
;;		_isr1
;; This function uses a non-reentrant model
;;
psect	text1103
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	159
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 0
; Regs used in _ReadButtons: [wreg+status,2+status,0+pclath+cstack]
	line	161
	
i1l10712:	
;HMI.c: 161: Debounce();
	fcall	_Debounce
	line	163
	
i1l10714:	
;HMI.c: 163: if(UpPressed)
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u384_21
	goto	u384_20
u384_21:
	goto	i1l4553
u384_20:
	line	165
	
i1l10716:	
;HMI.c: 164: {
;HMI.c: 165: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	166
	
i1l10718:	
;HMI.c: 166: return 1;
	movlw	(01h)
	goto	i1l4554
	
i1l10720:	
	goto	i1l4554
	line	168
	
i1l4553:	
	line	170
;HMI.c: 168: }
;HMI.c: 170: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u385_21
	goto	u385_20
u385_21:
	goto	i1l4555
u385_20:
	line	172
	
i1l10722:	
;HMI.c: 171: {
;HMI.c: 172: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	173
	
i1l10724:	
;HMI.c: 173: return 2;
	movlw	(02h)
	goto	i1l4554
	
i1l10726:	
	goto	i1l4554
	line	175
	
i1l4555:	
	line	176
;HMI.c: 175: }
;HMI.c: 176: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u386_21
	goto	u386_20
u386_21:
	goto	i1l4556
u386_20:
	line	178
	
i1l10728:	
;HMI.c: 177: {
;HMI.c: 178: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	179
	
i1l10730:	
;HMI.c: 179: return 3;
	movlw	(03h)
	goto	i1l4554
	
i1l10732:	
	goto	i1l4554
	line	181
	
i1l4556:	
	line	182
;HMI.c: 181: }
;HMI.c: 182: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u387_21
	goto	u387_20
u387_21:
	goto	i1l4557
u387_20:
	line	184
	
i1l10734:	
;HMI.c: 183: {
;HMI.c: 184: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	185
	
i1l10736:	
;HMI.c: 185: return 4;
	movlw	(04h)
	goto	i1l4554
	
i1l10738:	
	goto	i1l4554
	line	187
	
i1l4557:	
	line	189
;HMI.c: 187: }
;HMI.c: 189: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u388_21
	goto	u388_20
u388_21:
	goto	i1l10746
u388_20:
	line	191
	
i1l10740:	
;HMI.c: 190: {
;HMI.c: 191: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	192
	
i1l10742:	
;HMI.c: 192: return 5;
	movlw	(05h)
	goto	i1l4554
	
i1l10744:	
	goto	i1l4554
	line	194
	
i1l4558:	
	line	195
	
i1l10746:	
;HMI.c: 194: }
;HMI.c: 195: return 0;
	movlw	(0)
	goto	i1l4554
	
i1l10748:	
	line	196
	
i1l4554:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
	global	i1___lwmod
psect	text1104,local,class=CODE,delta=2
global __ptext1104
__ptext1104:

;; *************** function i1___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  __lwmod         2    0[COMMON] unsigned int 
;;  __lwmod         2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  __lwmod         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr1
;; This function uses a non-reentrant model
;;
psect	text1104
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_ofi1___lwmod
	__size_ofi1___lwmod	equ	__end_ofi1___lwmod-i1___lwmod
	
i1___lwmod:	
	opt	stack 1
; Regs used in i1___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l11076:	
	movf	(i1___lwmod@divisor+1),w
	iorwf	(i1___lwmod@divisor),w
	skipnz
	goto	u455_21
	goto	u455_20
u455_21:
	goto	i1l11094
u455_20:
	line	9
	
i1l11078:	
	clrf	(i1___lwmod@counter)
	bsf	status,0
	rlf	(i1___lwmod@counter),f
	line	10
	goto	i1l11084
	
i1l7636:	
	line	11
	
i1l11080:	
	movlw	01h
	
u456_25:
	clrc
	rlf	(i1___lwmod@divisor),f
	rlf	(i1___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u456_25
	line	12
	
i1l11082:	
	movlw	(01h)
	movwf	(??i1___lwmod+0)+0
	movf	(??i1___lwmod+0)+0,w
	addwf	(i1___lwmod@counter),f
	goto	i1l11084
	line	13
	
i1l7635:	
	line	10
	
i1l11084:	
	btfss	(i1___lwmod@divisor+1),(15)&7
	goto	u457_21
	goto	u457_20
u457_21:
	goto	i1l11080
u457_20:
	goto	i1l11086
	
i1l7637:	
	goto	i1l11086
	line	14
	
i1l7638:	
	line	15
	
i1l11086:	
	movf	(i1___lwmod@divisor+1),w
	subwf	(i1___lwmod@dividend+1),w
	skipz
	goto	u458_25
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),w
u458_25:
	skipc
	goto	u458_21
	goto	u458_20
u458_21:
	goto	i1l11090
u458_20:
	line	16
	
i1l11088:	
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),f
	movf	(i1___lwmod@divisor+1),w
	skipc
	decf	(i1___lwmod@dividend+1),f
	subwf	(i1___lwmod@dividend+1),f
	goto	i1l11090
	
i1l7639:	
	line	17
	
i1l11090:	
	movlw	01h
	
u459_25:
	clrc
	rrf	(i1___lwmod@divisor+1),f
	rrf	(i1___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u459_25
	line	18
	
i1l11092:	
	movlw	low(01h)
	subwf	(i1___lwmod@counter),f
	btfss	status,2
	goto	u460_21
	goto	u460_20
u460_21:
	goto	i1l11086
u460_20:
	goto	i1l11094
	
i1l7640:	
	goto	i1l11094
	line	19
	
i1l7634:	
	line	20
	
i1l11094:	
	movf	(i1___lwmod@dividend+1),w
	clrf	(?i1___lwmod+1)
	addwf	(?i1___lwmod+1)
	movf	(i1___lwmod@dividend),w
	clrf	(?i1___lwmod)
	addwf	(?i1___lwmod)

	goto	i1l7641
	
i1l11096:	
	line	21
	
i1l7641:	
	return
	opt stack 0
GLOBAL	__end_ofi1___lwmod
	__end_ofi1___lwmod:
;; =============== function i1___lwmod ends ============

	signat	i1___lwmod,90
	global	_Debounce
psect	text1105,local,class=CODE,delta=2
global __ptext1105
__ptext1105:

;; *************** function _Debounce *****************
;; Defined at:
;;		line 77 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ReadButtons
;; This function uses a non-reentrant model
;;
psect	text1105
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	77
	global	__size_of_Debounce
	__size_of_Debounce	equ	__end_of_Debounce-_Debounce
	
_Debounce:	
	opt	stack 0
; Regs used in _Debounce: [wreg+status,2+status,0]
	line	79
	
i1l10852:	
;HMI.c: 79: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u397_21
	goto	u397_20
u397_21:
	goto	i1l4535
u397_20:
	line	81
	
i1l10854:	
;HMI.c: 80: {
;HMI.c: 81: UpDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_UpDebounceCount)^080h,f	;volatile
	line	82
	
i1l10856:	
;HMI.c: 82: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount)^080h,w	;volatile
	skipc
	goto	u398_21
	goto	u398_20
u398_21:
	goto	i1l4537
u398_20:
	
i1l10858:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u399_21
	goto	u399_20
u399_21:
	goto	i1l4537
u399_20:
	line	84
	
i1l10860:	
;HMI.c: 83: {
;HMI.c: 84: UpPressed = 1;
	bsf	(_UpPressed/8),(_UpPressed)&7
	line	85
;HMI.c: 85: UpReleased = 0;
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l4537
	line	86
	
i1l4536:	
	line	87
;HMI.c: 86: }
;HMI.c: 87: }
	goto	i1l4537
	line	88
	
i1l4535:	
	line	90
;HMI.c: 88: else
;HMI.c: 89: {
;HMI.c: 90: UpDebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_UpDebounceCount)^080h	;volatile
	line	91
;HMI.c: 91: UpReleased = 1;
	bsf	(_UpReleased/8),(_UpReleased)&7
	line	92
	
i1l4537:	
	line	95
;HMI.c: 92: }
;HMI.c: 95: if(!RB3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(51/8),(51)&7
	goto	u400_21
	goto	u400_20
u400_21:
	goto	i1l4538
u400_20:
	line	97
	
i1l10862:	
;HMI.c: 96: {
;HMI.c: 97: DownDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_DownDebounceCount)^080h,f	;volatile
	line	98
	
i1l10864:	
;HMI.c: 98: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount)^080h,w	;volatile
	skipc
	goto	u401_21
	goto	u401_20
u401_21:
	goto	i1l4540
u401_20:
	
i1l10866:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u402_21
	goto	u402_20
u402_21:
	goto	i1l4540
u402_20:
	line	100
	
i1l10868:	
;HMI.c: 99: {
;HMI.c: 100: DownPressed = 1;
	bsf	(_DownPressed/8),(_DownPressed)&7
	line	101
;HMI.c: 101: DownReleased = 0;
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l4540
	line	102
	
i1l4539:	
	line	103
;HMI.c: 102: }
;HMI.c: 103: }
	goto	i1l4540
	line	104
	
i1l4538:	
	line	106
;HMI.c: 104: else
;HMI.c: 105: {
;HMI.c: 106: DownDebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_DownDebounceCount)^080h	;volatile
	line	107
;HMI.c: 107: DownReleased = 1;
	bsf	(_DownReleased/8),(_DownReleased)&7
	line	108
	
i1l4540:	
	line	110
;HMI.c: 108: }
;HMI.c: 110: if(!RB4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(52/8),(52)&7
	goto	u403_21
	goto	u403_20
u403_21:
	goto	i1l4541
u403_20:
	line	112
	
i1l10870:	
;HMI.c: 111: {
;HMI.c: 112: LeftDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_LeftDebounceCount)^080h,f	;volatile
	line	113
	
i1l10872:	
;HMI.c: 113: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount)^080h,w	;volatile
	skipc
	goto	u404_21
	goto	u404_20
u404_21:
	goto	i1l4543
u404_20:
	
i1l10874:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u405_21
	goto	u405_20
u405_21:
	goto	i1l4543
u405_20:
	line	115
	
i1l10876:	
;HMI.c: 114: {
;HMI.c: 115: LeftPressed = 1;
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	line	116
;HMI.c: 116: LeftReleased = 0;
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l4543
	line	117
	
i1l4542:	
	line	118
;HMI.c: 117: }
;HMI.c: 118: }
	goto	i1l4543
	line	119
	
i1l4541:	
	line	121
;HMI.c: 119: else
;HMI.c: 120: {
;HMI.c: 121: LeftDebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_LeftDebounceCount)^080h	;volatile
	line	122
;HMI.c: 122: LeftReleased = 1;
	bsf	(_LeftReleased/8),(_LeftReleased)&7
	line	123
	
i1l4543:	
	line	125
;HMI.c: 123: }
;HMI.c: 125: if(!RB5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u406_21
	goto	u406_20
u406_21:
	goto	i1l4544
u406_20:
	line	127
	
i1l10878:	
;HMI.c: 126: {
;HMI.c: 127: RightDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RightDebounceCount)^080h,f	;volatile
	line	128
	
i1l10880:	
;HMI.c: 128: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount)^080h,w	;volatile
	skipc
	goto	u407_21
	goto	u407_20
u407_21:
	goto	i1l4546
u407_20:
	
i1l10882:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u408_21
	goto	u408_20
u408_21:
	goto	i1l4546
u408_20:
	line	130
	
i1l10884:	
;HMI.c: 129: {
;HMI.c: 130: RightPressed = 1;
	bsf	(_RightPressed/8),(_RightPressed)&7
	line	131
;HMI.c: 131: RightReleased = 0;
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l4546
	line	132
	
i1l4545:	
	line	133
;HMI.c: 132: }
;HMI.c: 133: }
	goto	i1l4546
	line	134
	
i1l4544:	
	line	136
;HMI.c: 134: else
;HMI.c: 135: {
;HMI.c: 136: RightDebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_RightDebounceCount)^080h	;volatile
	line	137
;HMI.c: 137: RightReleased = 1;
	bsf	(_RightReleased/8),(_RightReleased)&7
	line	138
	
i1l4546:	
	line	140
;HMI.c: 138: }
;HMI.c: 140: if(!RB6)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u409_21
	goto	u409_20
u409_21:
	goto	i1l4547
u409_20:
	line	142
	
i1l10886:	
;HMI.c: 141: {
;HMI.c: 142: CenterDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_CenterDebounceCount)^080h,f	;volatile
	line	143
	
i1l10888:	
;HMI.c: 143: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount)^080h,w	;volatile
	skipc
	goto	u410_21
	goto	u410_20
u410_21:
	goto	i1l4550
u410_20:
	
i1l10890:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l4550
u411_20:
	line	145
	
i1l10892:	
;HMI.c: 144: {
;HMI.c: 145: CenterPressed = 1;
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	line	146
;HMI.c: 146: CenterReleased = 0;
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l4550
	line	147
	
i1l4548:	
	line	148
;HMI.c: 147: }
;HMI.c: 148: }
	goto	i1l4550
	line	149
	
i1l4547:	
	line	151
;HMI.c: 149: else
;HMI.c: 150: {
;HMI.c: 151: CenterDebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_CenterDebounceCount)^080h	;volatile
	line	152
;HMI.c: 152: CenterReleased = 1;
	bsf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l4550
	line	153
	
i1l4549:	
	line	154
	
i1l4550:	
	return
	opt stack 0
GLOBAL	__end_of_Debounce
	__end_of_Debounce:
;; =============== function _Debounce ends ============

	signat	_Debounce,88
psect	text1106,local,class=CODE,delta=2
global __ptext1106
__ptext1106:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
