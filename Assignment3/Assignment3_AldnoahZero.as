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
	FNCALL	_main,_Init_Follow_IR
	FNCALL	_main,_robotFollow
	FNCALL	_main,_RobotDrive
	FNCALL	_main,_robotTurnSpeed
	FNCALL	_main,_robotMoveSpeed
	FNCALL	_main,_ser_putch
	FNCALL	_main,_robot_turnLeft
	FNCALL	_main,_robot_turnRight
	FNCALL	_main,_ChargeMode
	FNCALL	_robot_turnLeft,_robotTurnSpeed
	FNCALL	_Init_Follow_IR,_calibrateIR
	FNCALL	_Init_Follow_IR,_rotate
	FNCALL	_ChargeMode,_ser_putch
	FNCALL	_ChargeMode,_RobotBattRead
	FNCALL	_ChargeMode,_UpdateDisplay
	FNCALL	_robot_turnRight,_RobotDrive
	FNCALL	_robot_turnRight,_rotate
	FNCALL	_robot_turnRight,_readAvgDistance
	FNCALL	_robot_turnRight,_robot_read
	FNCALL	_robot_turnRight,_UpdateDisplay
	FNCALL	_robot_turnRight,___awdiv
	FNCALL	_robot_turnRight,_abs
	FNCALL	_robotMoveSpeed,_RobotDrive
	FNCALL	_robotMoveSpeed,_robot_read
	FNCALL	_robotMoveSpeed,_UpdateDisplay
	FNCALL	_robotMoveSpeed,_abs
	FNCALL	_robotTurnSpeed,_robotTurn
	FNCALL	_robotTurnSpeed,_robot_read
	FNCALL	_robotTurnSpeed,_UpdateDisplay
	FNCALL	_robotTurnSpeed,_abs
	FNCALL	_robotFollow,_RobotDrive
	FNCALL	_robotFollow,_readAvgDistance
	FNCALL	_robotFollow,_rotate
	FNCALL	_robotFollow,_robot_read
	FNCALL	_robotFollow,_UpdateDisplay
	FNCALL	_calibrateIR,_rotate
	FNCALL	_calibrateIR,_UpdateDisplay
	FNCALL	_UpdateDisplay,_lcd_write_control
	FNCALL	_UpdateDisplay,_sprintf
	FNCALL	_UpdateDisplay,_lcd_set_cursor
	FNCALL	_UpdateDisplay,_lcd_write_string
	FNCALL	_UpdateDisplay,___awmod
	FNCALL	_UpdateDisplay,___awdiv
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
	FNCALL	_sprintf,_isdigit
	FNCALL	_sprintf,___wmul
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
	global	UpdateDisplay@F1265
	global	_rxfifo
	global	_txfifo
	global	_DistHighByte
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
	global	_BattCharge
	global	_BattState
	global	_Disp1
	global	_Disp2
	global	_IRdistance
	global	_RTC_Counter
	global	_TotalDistTravelled
	global	_adcVal
	global	_angleTurned
	global	_distTravelled
	global	_dist_high
	global	_dist_low
	global	_pos
	global	_total
	global	_totalSteps
	global	_AngleHighByte
	global	_AngleLowByte
	global	_BumpSensors
	global	_CenterDebounceCount
	global	_CliffSensors
	global	_DistLowByte
	global	_DownDebounceCount
	global	_LeftDebounceCount
	global	_ROBOTerror
	global	_RightDebounceCount
	global	_RobotPos
	global	_UpDebounceCount
	global	_VictimSensor
	global	_VwallSensor
	global	_buttonPressed
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
	
STR_27:	
	retlw	73	;'I'
	retlw	82	;'R'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	51	;'3'
	retlw	100	;'d'
	retlw	99	;'c'
	retlw	109	;'m'
	retlw	32	;' '
	retlw	67	;'C'
	retlw	80	;'P'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	51	;'3'
	retlw	100	;'d'
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
	retlw	51	;'3'
	retlw	100	;'d'
	retlw	99	;'c'
	retlw	109	;'m'
	retlw	32	;' '
	retlw	68	;'D'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	51	;'3'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_28:	
	retlw	68	;'D'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	52	;'4'
	retlw	100	;'d'
	retlw	99	;'c'
	retlw	109	;'m'
	retlw	32	;' '
	retlw	65	;'A'
	retlw	84	;'T'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	51	;'3'
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
	retlw	65	;'A'
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
_DistHighByte:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
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

_adcVal:
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

_BumpSensors:
       ds      1

_CenterDebounceCount:
       ds      1

_CliffSensors:
       ds      1

_DistLowByte:
       ds      1

_DownDebounceCount:
       ds      1

_LeftDebounceCount:
       ds      1

_ROBOTerror:
       ds      1

_RightDebounceCount:
       ds      1

_RobotPos:
       ds      1

_UpDebounceCount:
       ds      1

_VictimSensor:
       ds      1

_VwallSensor:
       ds      1

_buttonPressed:
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
UpdateDisplay@F1265:
       ds      16

_rxfifo:
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
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+037h)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+030h)
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
	global	?_Init_Follow_IR
?_Init_Follow_IR:	; 0 bytes @ 0x0
	global	?_ser_putch
?_ser_putch:	; 0 bytes @ 0x0
	global	?_robot_turnLeft
?_robot_turnLeft:	; 0 bytes @ 0x0
	global	?_ChargeMode
?_ChargeMode:	; 0 bytes @ 0x0
	global	?_RobotBattRead
?_RobotBattRead:	; 0 bytes @ 0x0
	global	?_ADCconvert
?_ADCconvert:	; 0 bytes @ 0x0
	global	?_isdigit
?_isdigit:	; 1 bit 
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
	global	??_isdigit
??_isdigit:	; 0 bytes @ 0x0
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
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	Menu@BTN_input
Menu@BTN_input:	; 1 bytes @ 0x0
	global	_isdigit$8644
_isdigit$8644:	; 1 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	spi_transfer@temp
spi_transfer@temp:	; 1 bytes @ 0x1
	global	ser_getch@c
ser_getch@c:	; 1 bytes @ 0x1
	global	ser_putch@c
ser_putch@c:	; 1 bytes @ 0x1
	global	isdigit@c
isdigit@c:	; 1 bytes @ 0x1
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
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
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
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
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
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
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
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	global	abs@v
abs@v:	; 2 bytes @ 0x6
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x6
	ds	1
	global	?_lcd_write_string
?_lcd_write_string:	; 0 bytes @ 0x7
	global	adc_read_channel@channel
adc_read_channel@channel:	; 1 bytes @ 0x7
	global	lcd_write_string@s
lcd_write_string@s:	; 2 bytes @ 0x7
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	??_abs
??_abs:	; 0 bytes @ 0x8
	global	?_readDistance
?_readDistance:	; 2 bytes @ 0x8
	global	rotate@i
rotate@i:	; 2 bytes @ 0x8
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x8
	ds	1
	global	?_RobotDrive
?_RobotDrive:	; 0 bytes @ 0x9
	global	??_lcd_write_string
??_lcd_write_string:	; 0 bytes @ 0x9
	global	RobotDrive@speed
RobotDrive@speed:	; 2 bytes @ 0x9
	ds	1
	global	??_readDistance
??_readDistance:	; 0 bytes @ 0xA
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0xA
	ds	1
	global	RobotDrive@radius
RobotDrive@radius:	; 2 bytes @ 0xB
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xB
	ds	1
	global	readDistance@readVal
readDistance@readVal:	; 2 bytes @ 0xC
	ds	1
	global	??_RobotDrive
??_RobotDrive:	; 0 bytes @ 0xD
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xD
	ds	1
	global	??_ADCconvert
??_ADCconvert:	; 0 bytes @ 0xE
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0xE
	global	RobotDrive@speedlowByte
RobotDrive@speedlowByte:	; 1 bytes @ 0xE
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0xE
	ds	1
	global	RobotDrive@speedhighByte
RobotDrive@speedhighByte:	; 1 bytes @ 0xF
	ds	1
	global	??_readAvgDistance
??_readAvgDistance:	; 0 bytes @ 0x10
	global	RobotDrive@radiuslowByte
RobotDrive@radiuslowByte:	; 1 bytes @ 0x10
	global	readAvgDistance@fullval
readAvgDistance@fullval:	; 2 bytes @ 0x10
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x10
	ds	1
	global	RobotDrive@radiushighByte
RobotDrive@radiushighByte:	; 1 bytes @ 0x11
	ds	1
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x12
	global	readAvgDistance@j
readAvgDistance@j:	; 2 bytes @ 0x12
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x13
	ds	1
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x14
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0x14
	global	readAvgDistance@tempIR
readAvgDistance@tempIR:	; 2 bytes @ 0x14
	ds	2
	global	readAvgDistance@i
readAvgDistance@i:	; 2 bytes @ 0x16
	ds	3
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0x19
	ds	3
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x1C
	ds	1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x1D
	ds	1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x1E
	ds	1
	global	sprintf@_val
sprintf@_val:	; 4 bytes @ 0x1F
	ds	4
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0x23
	ds	1
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x24
	ds	2
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x26
	ds	1
	global	??_UpdateDisplay
??_UpdateDisplay:	; 0 bytes @ 0x27
	ds	4
	global	UpdateDisplay@LCDOutput
UpdateDisplay@LCDOutput:	; 16 bytes @ 0x2B
	ds	16
	global	UpdateDisplay@tempDist
UpdateDisplay@tempDist:	; 2 bytes @ 0x3B
	ds	2
	global	??_calibrateIR
??_calibrateIR:	; 0 bytes @ 0x3D
	global	??_Init_Follow_IR
??_Init_Follow_IR:	; 0 bytes @ 0x3D
	global	?_robotFollow
?_robotFollow:	; 0 bytes @ 0x3D
	global	?_robotTurnSpeed
?_robotTurnSpeed:	; 0 bytes @ 0x3D
	global	?_robotMoveSpeed
?_robotMoveSpeed:	; 0 bytes @ 0x3D
	global	?_robot_turnRight
?_robot_turnRight:	; 0 bytes @ 0x3D
	global	??_ChargeMode
??_ChargeMode:	; 0 bytes @ 0x3D
	global	robotFollow@speed
robotFollow@speed:	; 2 bytes @ 0x3D
	global	robot_turnRight@speed
robot_turnRight@speed:	; 2 bytes @ 0x3D
	global	robotMoveSpeed@distance
robotMoveSpeed@distance:	; 2 bytes @ 0x3D
	global	robotTurnSpeed@angle
robotTurnSpeed@angle:	; 2 bytes @ 0x3D
	ds	2
	global	??_robot_turnRight
??_robot_turnRight:	; 0 bytes @ 0x3F
	global	robotFollow@AdcTarget
robotFollow@AdcTarget:	; 2 bytes @ 0x3F
	global	robotMoveSpeed@speed
robotMoveSpeed@speed:	; 2 bytes @ 0x3F
	global	robotTurnSpeed@speed
robotTurnSpeed@speed:	; 2 bytes @ 0x3F
	ds	2
	global	??_robotTurnSpeed
??_robotTurnSpeed:	; 0 bytes @ 0x41
	global	??_robotMoveSpeed
??_robotMoveSpeed:	; 0 bytes @ 0x41
	global	robotFollow@followDir
robotFollow@followDir:	; 1 bytes @ 0x41
	ds	1
	global	??_robotFollow
??_robotFollow:	; 0 bytes @ 0x42
	global	robot_turnRight@turnTarget
robot_turnRight@turnTarget:	; 2 bytes @ 0x42
	ds	2
	global	robot_turnRight@AdcTarget
robot_turnRight@AdcTarget:	; 2 bytes @ 0x44
	global	robotMoveSpeed@temp1
robotMoveSpeed@temp1:	; 2 bytes @ 0x44
	global	robotTurnSpeed@temp1
robotTurnSpeed@temp1:	; 2 bytes @ 0x44
	ds	2
	global	??_robot_turnLeft
??_robot_turnLeft:	; 0 bytes @ 0x46
	global	robotFollow@temp1
robotFollow@temp1:	; 2 bytes @ 0x46
	global	robot_turnRight@temp1
robot_turnRight@temp1:	; 2 bytes @ 0x46
	ds	2
	global	robotFollow@hysterysis
robotFollow@hysterysis:	; 1 bytes @ 0x48
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x49
	ds	3
	global	main@shortwall
main@shortwall:	; 2 bytes @ 0x4C
	ds	2
	global	main@choice
main@choice:	; 1 bytes @ 0x4E
	ds	1
	global	main@currentFlw
main@currentFlw:	; 1 bytes @ 0x4F
	ds	1
;;Data sizes: Strings 200, constant 10, data 13, bss 104, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80     80      80
;; BANK1           80      0      68
;; BANK3           96      0      48
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
;; sprintf@f	PTR const unsigned char  size(1) Largest target is 16
;;		 -> STR_28(CODE[15]), STR_27(CODE[16]), STR_19(CODE[5]), STR_13(CODE[15]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;;		 -> UpdateDisplay@LCDOutput(BANK0[16]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK0[2]), 
;;
;; S8279$_cp	PTR const unsigned char  size(1) Largest target is 0
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
;;   _robot_turnLeft->_robotTurnSpeed
;;   _ChargeMode->_UpdateDisplay
;;   _robot_turnRight->_UpdateDisplay
;;   _robotMoveSpeed->_UpdateDisplay
;;   _robotTurnSpeed->_UpdateDisplay
;;   _robotFollow->_UpdateDisplay
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
;; (0) _main                                                 7     7      0   26413
;;                                             73 BANK0      7     7      0
;;                               _init
;;                      _robotLoadSong
;;                         _robot_read
;;                    _readAvgDistance
;;                      _UpdateDisplay
;;                               _Menu
;;                        _calibrateIR
;;                     _Init_Follow_IR
;;                        _robotFollow
;;                         _RobotDrive
;;                     _robotTurnSpeed
;;                     _robotMoveSpeed
;;                          _ser_putch
;;                     _robot_turnLeft
;;                    _robot_turnRight
;;                         _ChargeMode
;; ---------------------------------------------------------------------------------
;; (1) _robot_turnLeft                                       1     1      0    2621
;;                                             70 BANK0      1     1      0
;;                     _robotTurnSpeed
;; ---------------------------------------------------------------------------------
;; (1) _Init_Follow_IR                                       3     3      0    2412
;;                                             61 BANK0      3     3      0
;;                        _calibrateIR
;;                             _rotate
;; ---------------------------------------------------------------------------------
;; (1) _ChargeMode                                           1     1      0    2287
;;                                             61 BANK0      1     1      0
;;                          _ser_putch
;;                      _RobotBattRead
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (1) _robot_turnRight                                     11     9      2    4347
;;                                             61 BANK0     11     9      2
;;                         _RobotDrive
;;                             _rotate
;;                    _readAvgDistance
;;                         _robot_read
;;                      _UpdateDisplay
;;                            ___awdiv
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (1) _robotMoveSpeed                                       9     5      4    2778
;;                                             61 BANK0      9     5      4
;;                         _RobotDrive
;;                         _robot_read
;;                      _UpdateDisplay
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (2) _robotTurnSpeed                                       9     5      4    2621
;;                                             61 BANK0      9     5      4
;;                          _robotTurn
;;                         _robot_read
;;                      _UpdateDisplay
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (1) _robotFollow                                         12     7      5    3676
;;                                             61 BANK0     12     7      5
;;                         _RobotDrive
;;                    _readAvgDistance
;;                             _rotate
;;                         _robot_read
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (2) _calibrateIR                                          0     0      0    2292
;;                             _rotate
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (2) _UpdateDisplay                                       22    22      0    2172
;;                                             39 BANK0     22    22      0
;;                  _lcd_write_control
;;                            _sprintf
;;                     _lcd_set_cursor
;;                   _lcd_write_string
;;                            ___awmod
;;                            ___awdiv
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
;; (3) _robotTurn                                            2     0      2      66
;;                                              2 BANK0      2     0      2
;;                          _ser_putch
;; ---------------------------------------------------------------------------------
;; (3) _ser_getch                                            2     2      0      23
;;                                              0 BANK0      2     2      0
;;                           _ser_isrx
;; ---------------------------------------------------------------------------------
;; (3) _sprintf                                             19    14      5    1230
;;                                             20 BANK0     19    14      5
;;                            _isdigit
;;                             ___wmul
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (3) _ADCconvert                                           2     2      0     254
;;                                             14 BANK0      2     2      0
;;                             ___wmul
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (2) _rotate                                               7     4      3     120
;;                                              3 BANK0      7     4      3
;;                       _spi_transfer
;; ---------------------------------------------------------------------------------
;; (2) _RobotDrive                                           9     5      4     202
;;                                              9 BANK0      9     5      4
;;                          _ser_putch
;;                            ___awdiv (ARG)
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
;; (3) ___awdiv                                              9     5      4     300
;;                                              0 BANK0      9     5      4
;; ---------------------------------------------------------------------------------
;; (4) ___lwmod                                              6     2      4     159
;;                                             14 BANK0      6     2      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (4) ___lwdiv                                              8     4      4     162
;;                                              6 BANK0      8     4      4
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (4) ___wmul                                               6     2      4      92
;;                                              0 BANK0      6     2      4
;; ---------------------------------------------------------------------------------
;; (4) _isdigit                                              2     2      0      68
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (4) _ser_isrx                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _spi_transfer                                         3     3      0      30
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
;;       _isdigit
;;       ___wmul
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
;;     ___awdiv
;;   _Menu
;;   _calibrateIR
;;     _rotate
;;       _spi_transfer
;;     _UpdateDisplay
;;       _lcd_write_control
;;       _sprintf
;;         _isdigit
;;         ___wmul
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
;;       ___awdiv
;;   _Init_Follow_IR
;;     _calibrateIR
;;       _rotate
;;         _spi_transfer
;;       _UpdateDisplay
;;         _lcd_write_control
;;         _sprintf
;;           _isdigit
;;           ___wmul
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
;;         ___awdiv
;;     _rotate
;;       _spi_transfer
;;   _robotFollow
;;     _RobotDrive
;;       _ser_putch
;;       ___awdiv (ARG)
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
;;         _isdigit
;;         ___wmul
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
;;       ___awdiv
;;   _RobotDrive
;;     _ser_putch
;;     ___awdiv (ARG)
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
;;         _isdigit
;;         ___wmul
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
;;       ___awdiv
;;     _abs
;;       ___wmul
;;   _robotMoveSpeed
;;     _RobotDrive
;;       _ser_putch
;;       ___awdiv (ARG)
;;     _robot_read
;;       _ser_putch
;;       _ser_getch
;;         _ser_isrx
;;     _UpdateDisplay
;;       _lcd_write_control
;;       _sprintf
;;         _isdigit
;;         ___wmul
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
;;       ___awdiv
;;     _abs
;;       ___wmul
;;   _ser_putch
;;   _robot_turnLeft
;;     _robotTurnSpeed
;;       _robotTurn
;;         _ser_putch
;;       _robot_read
;;         _ser_putch
;;         _ser_getch
;;           _ser_isrx
;;       _UpdateDisplay
;;         _lcd_write_control
;;         _sprintf
;;           _isdigit
;;           ___wmul
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
;;         ___awdiv
;;       _abs
;;         ___wmul
;;   _robot_turnRight
;;     _RobotDrive
;;       _ser_putch
;;       ___awdiv (ARG)
;;     _rotate
;;       _spi_transfer
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
;;     _robot_read
;;       _ser_putch
;;       _ser_getch
;;         _ser_isrx
;;     _UpdateDisplay
;;       _lcd_write_control
;;       _sprintf
;;         _isdigit
;;         ___wmul
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
;;       ___awdiv
;;     ___awdiv
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
;;         _isdigit
;;         ___wmul
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
;;       ___awdiv
;;
;; _isr1 (ROOT)
;;   i1___lwmod
;;   _ReadButtons
;;     _Debounce
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0      30       9       50.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      44       7       85.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      DD      12        0.0%
;;ABS                  0      0      D2       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       B       2        0.0%
;;BANK0               50     50      50       5      100.0%
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
;;  shortwall       2   76[BANK0 ] int 
;;  currentFlw      1   79[BANK0 ] unsigned char 
;;  choice          1   78[BANK0 ] unsigned char 
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
;;      Locals:         0       4       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_init
;;		_robotLoadSong
;;		_robot_read
;;		_readAvgDistance
;;		_UpdateDisplay
;;		_Menu
;;		_calibrateIR
;;		_Init_Follow_IR
;;		_robotFollow
;;		_RobotDrive
;;		_robotTurnSpeed
;;		_robotMoveSpeed
;;		_ser_putch
;;		_robot_turnLeft
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
	
l12155:	
;Main.c: 171: unsigned char choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	line	172
	
l12157:	
;Main.c: 172: int shortwall = 0;
	clrf	(main@shortwall)
	clrf	(main@shortwall+1)
	line	173
	
l12159:	
;Main.c: 173: unsigned char currentFlw = 0;
	clrf	(main@currentFlw)
	line	174
	
l12161:	
;Main.c: 174: RobotPos = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_RobotPos)^080h
	line	175
	
l12163:	
;Main.c: 175: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	line	177
	
l12165:	
;Main.c: 177: init();
	fcall	_init
	line	178
	
l12167:	
;Main.c: 178: robotLoadSong();
	fcall	_robotLoadSong
	goto	l12169
	line	180
;Main.c: 180: while(1)
	
l2254:	
	line	182
	
l12169:	
;Main.c: 181: {
;Main.c: 182: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5521
	goto	u5520
u5521:
	goto	l12181
u5520:
	line	184
	
l12171:	
;Main.c: 183: {
;Main.c: 184: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	185
	
l12173:	
;Main.c: 185: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	186
	
l12175:	
;Main.c: 186: readAvgDistance();
	fcall	_readAvgDistance
	line	187
	
l12177:	
;Main.c: 187: Disp2 = RobotPos;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_Disp2)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_Disp2+1)^080h
	line	188
	
l12179:	
;Main.c: 188: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12181
	line	189
	
l2255:	
	line	190
	
l12181:	
;Main.c: 189: }
;Main.c: 190: if (buttonPressed)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_buttonPressed)^080h,w	;volatile
	skipz
	goto	u5530
	goto	l12263
u5530:
	line	193
	
l12183:	
;Main.c: 192: {
;Main.c: 193: choice = Menu(buttonPressed);
	movf	(_buttonPressed)^080h,w	;volatile
	fcall	_Menu
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	line	194
	
l12185:	
;Main.c: 194: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	goto	l12263
	line	195
	
l2256:	
	line	199
;Main.c: 195: }
;Main.c: 199: switch (choice)
	goto	l12263
	line	201
;Main.c: 200: {
;Main.c: 201: case 0:
	
l2258:	
	line	202
	
l12187:	
;Main.c: 202: calibrateIR();
	fcall	_calibrateIR
	line	203
;Main.c: 203: break;
	goto	l12265
	line	204
;Main.c: 204: case 1:
	
l2260:	
	line	205
;Main.c: 205: RobotPos = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_RobotPos)^080h
	line	207
;Main.c: 207: break;
	goto	l12265
	line	208
;Main.c: 208: case 2:
	
l2261:	
	line	209
	
l12189:	
;Main.c: 209: RobotPos = 6;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_RobotPos)^080h
	line	211
;Main.c: 211: break;
	goto	l12265
	line	212
;Main.c: 212: case 3:
	
l2262:	
	line	214
	
l12191:	
;Main.c: 214: RobotPos = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_RobotPos)^080h
	line	215
;Main.c: 215: break;
	goto	l12265
	line	216
;Main.c: 216: case 4:
	
l2263:	
	line	220
	
l12193:	
;Main.c: 220: Init_Follow_IR();
	fcall	_Init_Follow_IR
	line	221
	
l12195:	
;Main.c: 221: currentMenu = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_currentMenu)^080h	;volatile
	line	222
;Main.c: 222: while (ROBOTerror != 9)
	goto	l12257
	
l2265:	
	line	225
;Main.c: 223: {
;Main.c: 225: switch (ROBOTerror)
	goto	l12255
	line	227
;Main.c: 226: {
;Main.c: 227: case 0:
	
l2267:	
	line	229
	
l12197:	
;Main.c: 229: readAvgDistance();
	fcall	_readAvgDistance
	line	230
;Main.c: 230: robotFollow(200, adcVal, currentFlw);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(0C8h)
	movwf	((?_robotFollow))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_robotFollow)+02h
	addwf	1+(?_robotFollow)+02h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_robotFollow)+02h
	addwf	0+(?_robotFollow)+02h

	movf	(main@currentFlw),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	231
;Main.c: 231: break;
	goto	l12257
	line	232
;Main.c: 232: case 1:
	
l2269:	
	line	233
	
l12199:	
;Main.c: 233: if (RobotPos == 10)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
	xorlw	0Ah
	skipz
	goto	u5541
	goto	u5540
u5541:
	goto	l12211
u5540:
	line	235
	
l12201:	
;Main.c: 234: {
;Main.c: 235: RobotDrive(-200, 0x7FFF);
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
	line	236
	
l12203:	
;Main.c: 236: _delay((unsigned long)((200)*(20000000/4000.0)));
	opt asmopt_off
movlw  6
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u5567:
	decfsz	((??_main+0)+0),f
	goto	u5567
	decfsz	((??_main+0)+0+1),f
	goto	u5567
	decfsz	((??_main+0)+0+2),f
	goto	u5567
	nop2
opt asmopt_on

	line	237
	
l12205:	
;Main.c: 237: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	238
	
l12207:	
;Main.c: 238: ROBOTerror = 0;
	clrf	(_ROBOTerror)^080h
	line	239
	
l12209:	
;Main.c: 239: robotTurnSpeed((-(angleTurned - 75)),400);
	movf	(_angleTurned)^080h,w
	addlw	low(-75)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_angleTurned+1)^080h,w
	skipnc
	addlw	1
	addlw	high(-75)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(??_main+0)+0
	comf	(??_main+0)+0,f
	comf	(??_main+0)+1,f
	incf	(??_main+0)+0,f
	skipnz
	incf	(??_main+0)+1,f
	movf	0+(??_main+0)+0,w
	movwf	(?_robotTurnSpeed)
	movf	1+(??_main+0)+0,w
	movwf	(?_robotTurnSpeed+1)
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	240
;Main.c: 240: }
	goto	l12257
	line	241
	
l2270:	
	line	242
	
l12211:	
;Main.c: 241: else
;Main.c: 242: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l12257
	
l2271:	
	line	243
;Main.c: 243: break;
	goto	l12257
	line	244
;Main.c: 244: case 2:
	
l2272:	
	line	245
	
l12213:	
;Main.c: 245: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	246
;Main.c: 246: break;
	goto	l12257
	line	247
;Main.c: 247: case 3:
	
l2273:	
	line	248
	
l12215:	
;Main.c: 248: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	249
	
l12217:	
;Main.c: 249: ROBOTerror = 0;
	clrf	(_ROBOTerror)^080h
	line	251
	
l12219:	
;Main.c: 251: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	94
movwf	((??_main+0)+0+1),f
	movlw	134
movwf	((??_main+0)+0),f
u5577:
	decfsz	((??_main+0)+0),f
	goto	u5577
	decfsz	((??_main+0)+0+1),f
	goto	u5577
	decfsz	((??_main+0)+0+2),f
	goto	u5577
	clrwdt
opt asmopt_on

	line	252
	
l12221:	
;Main.c: 252: robotMoveSpeed(-200,-200);
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
	line	253
	
l12223:	
;Main.c: 253: robotTurnSpeed((-angleTurned-10),400);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_angleTurned)^080h,w
	addlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_angleTurned+1)^080h,w
	skipnc
	addlw	1
	addlw	high(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(??_main+0)+0
	comf	(??_main+0)+0,f
	comf	(??_main+0)+1,f
	incf	(??_main+0)+0,f
	skipnz
	incf	(??_main+0)+1,f
	movf	0+(??_main+0)+0,w
	movwf	(?_robotTurnSpeed)
	movf	1+(??_main+0)+0,w
	movwf	(?_robotTurnSpeed+1)
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	254
	
l12225:	
;Main.c: 254: robotMoveSpeed(250,200);
	movlw	low(0FAh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(0FAh)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(0C8h)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(0C8h)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	255
	
l12227:	
;Main.c: 255: readAvgDistance();
	fcall	_readAvgDistance
	line	256
	
l12229:	
;Main.c: 256: robotFollow(200, adcVal - 10, currentFlw);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(0C8h)
	movwf	((?_robotFollow))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	addlw	low(-10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?_robotFollow)+02h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	skipnc
	addlw	1
	addlw	high(-10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+0+(?_robotFollow)+02h
	movf	(main@currentFlw),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	257
;Main.c: 257: break;
	goto	l12257
	line	258
;Main.c: 258: case 4:
	
l2274:	
	line	259
	
l12231:	
;Main.c: 259: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	260
;Main.c: 260: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	262
;Main.c: 262: break;
	goto	l12257
	line	263
;Main.c: 263: case 9:
	
l2275:	
	line	264
	
l12233:	
;Main.c: 264: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	265
;Main.c: 265: break;
	goto	l12257
	line	266
;Main.c: 266: case 10:
	
l2276:	
	line	267
	
l12235:	
;Main.c: 267: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	269
	
l12237:	
;Main.c: 269: robot_turnLeft();
	fcall	_robot_turnLeft
	line	272
	
l12239:	
;Main.c: 272: readAvgDistance();
	fcall	_readAvgDistance
	line	273
	
l12241:	
;Main.c: 273: robotFollow(200, adcVal - 10, currentFlw);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(0C8h)
	movwf	((?_robotFollow))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	addlw	low(-10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?_robotFollow)+02h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	skipnc
	addlw	1
	addlw	high(-10)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+0+(?_robotFollow)+02h
	movf	(main@currentFlw),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	274
;Main.c: 274: break;
	goto	l12257
	line	275
;Main.c: 275: case 11:
	
l2277:	
	line	276
	
l12243:	
;Main.c: 276: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	278
	
l12245:	
;Main.c: 278: robot_turnRight(200);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robot_turnRight)
	movlw	high(0C8h)
	movwf	((?_robot_turnRight))+1
	fcall	_robot_turnRight
	line	280
	
l12247:	
;Main.c: 280: readAvgDistance();
	fcall	_readAvgDistance
	line	281
	
l12249:	
;Main.c: 281: robotFollow(200, adcVal, currentFlw);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(0C8h)
	movwf	((?_robotFollow))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_robotFollow)+02h
	addwf	1+(?_robotFollow)+02h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_robotFollow)+02h
	addwf	0+(?_robotFollow)+02h

	movf	(main@currentFlw),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	283
;Main.c: 283: break;
	goto	l12257
	line	284
;Main.c: 284: default:
	
l2278:	
	line	285
	
l12251:	
;Main.c: 285: readAvgDistance();
	fcall	_readAvgDistance
	line	286
;Main.c: 286: robotFollow(200, adcVal, currentFlw);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(0C8h)
	movwf	((?_robotFollow))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_robotFollow)+02h
	addwf	1+(?_robotFollow)+02h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_robotFollow)+02h
	addwf	0+(?_robotFollow)+02h

	movf	(main@currentFlw),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	287
;Main.c: 287: break;
	goto	l12257
	line	289
	
l12253:	
;Main.c: 289: }
	goto	l12257
	line	225
	
l2266:	
	
l12255:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 0 to 11
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
; direct_byte           44     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            16     6 (fixed)
; spacedrange           30     9 (fixed)
; locatedrange          12     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l12197
	xorlw	1^0	; case 1
	skipnz
	goto	l12199
	xorlw	2^1	; case 2
	skipnz
	goto	l12213
	xorlw	3^2	; case 3
	skipnz
	goto	l12215
	xorlw	4^3	; case 4
	skipnz
	goto	l12231
	xorlw	9^4	; case 9
	skipnz
	goto	l12233
	xorlw	10^9	; case 10
	skipnz
	goto	l12235
	xorlw	11^10	; case 11
	skipnz
	goto	l12243
	goto	l12251
	opt asmopt_on

	line	289
	
l2268:	
	goto	l12257
	line	290
	
l2264:	
	line	222
	
l12257:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	xorlw	09h
	skipz
	goto	u5551
	goto	u5550
u5551:
	goto	l12255
u5550:
	
l2279:	
	line	291
;Main.c: 290: }
;Main.c: 291: ROBOTerror = 0;
	clrf	(_ROBOTerror)^080h
	line	292
;Main.c: 292: break;
	goto	l12265
	line	294
;Main.c: 294: case 5:
	
l2280:	
	line	295
	
l12259:	
;Main.c: 295: ChargeMode();
	fcall	_ChargeMode
	line	296
;Main.c: 296: break;
	goto	l12265
	line	297
;Main.c: 297: default:
	
l2281:	
	line	299
;Main.c: 299: break;
	goto	l12265
	line	300
	
l12261:	
;Main.c: 300: }
	goto	l12265
	line	199
	
l2257:	
	
l12263:	
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
	goto	l12187
	xorlw	1^0	; case 1
	skipnz
	goto	l2260
	xorlw	2^1	; case 2
	skipnz
	goto	l12189
	xorlw	3^2	; case 3
	skipnz
	goto	l12191
	xorlw	4^3	; case 4
	skipnz
	goto	l12193
	xorlw	5^4	; case 5
	skipnz
	goto	l12259
	goto	l12265
	opt asmopt_on

	line	300
	
l2259:	
	line	301
	
l12265:	
;Main.c: 301: choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	goto	l12169
	line	302
	
l2282:	
	line	180
	goto	l12169
	
l2283:	
	line	303
	
l2284:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_robot_turnLeft
psect	text1087,local,class=CODE,delta=2
global __ptext1087
__ptext1087:

;; *************** function _robot_turnLeft *****************
;; Defined at:
;;		line 268 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_robotTurnSpeed
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1087
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	268
	global	__size_of_robot_turnLeft
	__size_of_robot_turnLeft	equ	__end_of_robot_turnLeft-_robot_turnLeft
	
_robot_turnLeft:	
	opt	stack 0
; Regs used in _robot_turnLeft: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	269
	
l12137:	
;robot.c: 269: switch (RobotPos)
	goto	l12153
	line	271
;robot.c: 270: {
;robot.c: 271: case 8:
	
l6139:	
	line	272
	
l12139:	
;robot.c: 272: robotTurnSpeed(160,400);
	movlw	low(0A0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(0A0h)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	273
	
l12141:	
;robot.c: 273: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnLeft+0)+0
	movf	(??_robot_turnLeft+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	274
;robot.c: 274: break;
	goto	l6144
	line	275
;robot.c: 275: case 12:
	
l6141:	
	line	276
	
l12143:	
;robot.c: 276: robotTurnSpeed(75,400);
	movlw	low(04Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(04Bh)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	277
;robot.c: 277: break;
	goto	l6144
	line	278
;robot.c: 278: case 15:
	
l6142:	
	line	279
	
l12145:	
;robot.c: 279: robotTurnSpeed(160,400);
	movlw	low(0A0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(0A0h)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	280
	
l12147:	
;robot.c: 280: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnLeft+0)+0
	movf	(??_robot_turnLeft+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	281
;robot.c: 281: break;
	goto	l6144
	line	282
;robot.c: 282: default:
	
l6143:	
	line	283
	
l12149:	
;robot.c: 283: robotTurnSpeed(80,400);
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
	line	284
;robot.c: 284: break;
	goto	l6144
	line	285
	
l12151:	
;robot.c: 285: }
	goto	l6144
	line	269
	
l6138:	
	
l12153:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 8 to 15
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           35    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	8^0	; case 8
	skipnz
	goto	l12139
	xorlw	12^8	; case 12
	skipnz
	goto	l12143
	xorlw	15^12	; case 15
	skipnz
	goto	l12145
	goto	l12149
	opt asmopt_on

	line	285
	
l6140:	
	line	286
	
l6144:	
	return
	opt stack 0
GLOBAL	__end_of_robot_turnLeft
	__end_of_robot_turnLeft:
;; =============== function _robot_turnLeft ends ============

	signat	_robot_turnLeft,88
	global	_Init_Follow_IR
psect	text1088,local,class=CODE,delta=2
global __ptext1088
__ptext1088:

;; *************** function _Init_Follow_IR *****************
;; Defined at:
;;		line 306 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text1088
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	306
	global	__size_of_Init_Follow_IR
	__size_of_Init_Follow_IR	equ	__end_of_Init_Follow_IR-_Init_Follow_IR
	
_Init_Follow_IR:	
	opt	stack 0
; Regs used in _Init_Follow_IR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	307
	
l12131:	
;Main.c: 307: calibrateIR();
	fcall	_calibrateIR
	line	308
	
l12133:	
;Main.c: 308: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_Init_Follow_IR+0)+0+2),f
movlw	175
movwf	((??_Init_Follow_IR+0)+0+1),f
	movlw	193
movwf	((??_Init_Follow_IR+0)+0),f
u5587:
	decfsz	((??_Init_Follow_IR+0)+0),f
	goto	u5587
	decfsz	((??_Init_Follow_IR+0)+0+1),f
	goto	u5587
	decfsz	((??_Init_Follow_IR+0)+0+2),f
	goto	u5587
	clrwdt
opt asmopt_on

	line	309
	
l12135:	
;Main.c: 309: rotate(25, 0);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	310
	
l2287:	
	return
	opt stack 0
GLOBAL	__end_of_Init_Follow_IR
	__end_of_Init_Follow_IR:
;; =============== function _Init_Follow_IR ends ============

	signat	_Init_Follow_IR,88
	global	_ChargeMode
psect	text1089,local,class=CODE,delta=2
global __ptext1089
__ptext1089:

;; *************** function _ChargeMode *****************
;; Defined at:
;;		line 360 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text1089
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	360
	global	__size_of_ChargeMode
	__size_of_ChargeMode	equ	__end_of_ChargeMode-_ChargeMode
	
_ChargeMode:	
	opt	stack 1
; Regs used in _ChargeMode: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	362
	
l12109:	
;Main.c: 362: currentMenu = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ChargeMode+0)+0
	movf	(??_ChargeMode+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_currentMenu)^080h	;volatile
	line	363
	
l12111:	
;Main.c: 363: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	goto	l12113
	line	365
;Main.c: 365: while (1)
	
l2305:	
	line	367
	
l12113:	
;Main.c: 366: {
;Main.c: 367: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5511
	goto	u5510
u5511:
	goto	l12129
u5510:
	line	369
	
l12115:	
;Main.c: 368: {
;Main.c: 369: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	370
	
l12117:	
;Main.c: 370: RobotBattRead();
	fcall	_RobotBattRead
	line	371
;Main.c: 371: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12129
	line	372
	
l2306:	
	line	373
;Main.c: 372: }
;Main.c: 373: switch (buttonPressed)
	goto	l12129
	line	375
;Main.c: 374: {
;Main.c: 375: case 1:
	
l2308:	
	line	376
;Main.c: 376: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	377
;Main.c: 377: break;
	goto	l12113
	line	378
;Main.c: 378: case 2:
	
l2310:	
	line	379
;Main.c: 379: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	380
;Main.c: 380: break;
	goto	l12113
	line	381
;Main.c: 381: case 3:
	
l2311:	
	line	382
;Main.c: 382: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	383
;Main.c: 383: break;
	goto	l12113
	line	384
;Main.c: 384: case 4:
	
l2312:	
	line	385
;Main.c: 385: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	386
;Main.c: 386: break;
	goto	l12113
	line	387
;Main.c: 387: case 5:
	
l2313:	
	line	388
	
l12119:	
;Main.c: 388: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	389
	
l12121:	
;Main.c: 389: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	390
	
l12123:	
;Main.c: 390: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	goto	l2314
	line	391
	
l12125:	
;Main.c: 391: return;
	goto	l2314
	line	392
;Main.c: 392: default:
	
l2315:	
	line	393
;Main.c: 393: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	394
;Main.c: 394: break;
	goto	l12113
	line	395
	
l12127:	
;Main.c: 395: }
	goto	l12113
	line	373
	
l2307:	
	
l12129:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_buttonPressed)^080h,w	;volatile
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
	goto	l2308
	xorlw	2^1	; case 2
	skipnz
	goto	l2310
	xorlw	3^2	; case 3
	skipnz
	goto	l2311
	xorlw	4^3	; case 4
	skipnz
	goto	l2312
	xorlw	5^4	; case 5
	skipnz
	goto	l12119
	goto	l2315
	opt asmopt_on

	line	395
	
l2309:	
	goto	l12113
	line	396
	
l2316:	
	line	365
	goto	l12113
	
l2317:	
	line	397
	
l2314:	
	return
	opt stack 0
GLOBAL	__end_of_ChargeMode
	__end_of_ChargeMode:
;; =============== function _ChargeMode ends ============

	signat	_ChargeMode,88
	global	_robot_turnRight
psect	text1090,local,class=CODE,delta=2
global __ptext1090
__ptext1090:

;; *************** function _robot_turnRight *****************
;; Defined at:
;;		line 289 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  speed           2   61[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   70[BANK0 ] int 
;;  AdcTarget       2   68[BANK0 ] int 
;;  turnTarget      2   66[BANK0 ] int 
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
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      11       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_RobotDrive
;;		_rotate
;;		_readAvgDistance
;;		_robot_read
;;		_UpdateDisplay
;;		___awdiv
;;		_abs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1090
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	289
	global	__size_of_robot_turnRight
	__size_of_robot_turnRight	equ	__end_of_robot_turnRight-_robot_turnRight
	
_robot_turnRight:	
	opt	stack 0
; Regs used in _robot_turnRight: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	291
	
l11949:	
;robot.c: 291: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	293
;robot.c: 292: int temp1;
;robot.c: 293: int turnTarget = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robot_turnRight@turnTarget)
	clrf	(robot_turnRight@turnTarget+1)
	line	294
	
l11951:	
;robot.c: 294: RobotDrive(speed, 0x7FFF);
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
	line	295
	
l11953:	
;robot.c: 295: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	line	296
	
l11955:	
;robot.c: 296: rotate(25, 0);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	297
	
l11957:	
;robot.c: 297: readAvgDistance();
	fcall	_readAvgDistance
	line	298
	
l11959:	
;robot.c: 298: int AdcTarget = adcVal;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robot_turnRight@AdcTarget+1)	;volatile
	addwf	(robot_turnRight@AdcTarget+1)	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robot_turnRight@AdcTarget)	;volatile
	addwf	(robot_turnRight@AdcTarget)	;volatile

	goto	l11961
	line	300
;robot.c: 300: while (1)
	
l6147:	
	line	302
	
l11961:	
;robot.c: 301: {
;robot.c: 302: readAvgDistance();
	fcall	_readAvgDistance
	line	303
	
l11963:	
;robot.c: 303: if (adcVal > (AdcTarget) && adcVal < (AdcTarget + 15))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robot_turnRight@AdcTarget+1),w
	skipz
	goto	u5365
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robot_turnRight@AdcTarget),w
u5365:
	skipnc
	goto	u5361
	goto	u5360
u5361:
	goto	l11969
u5360:
	
l11965:	
	movf	(robot_turnRight@AdcTarget),w
	addlw	low(0Fh)
	movwf	(??_robot_turnRight+0)+0
	movf	(robot_turnRight@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0Fh)
	movwf	1+(??_robot_turnRight+0)+0
	movf	1+(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	skipz
	goto	u5375
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5375:
	skipnc
	goto	u5371
	goto	u5370
u5371:
	goto	l11969
u5370:
	line	305
	
l11967:	
;robot.c: 304: {
;robot.c: 305: RobotDrive(speed, 1700);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	line	306
;robot.c: 306: }
	goto	l6149
	line	307
	
l6148:	
	
l11969:	
;robot.c: 307: else if (adcVal < (AdcTarget) && adcVal > (AdcTarget - 15))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@AdcTarget+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	skipz
	goto	u5385
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@AdcTarget),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5385:
	skipnc
	goto	u5381
	goto	u5380
u5381:
	goto	l11975
u5380:
	
l11971:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@AdcTarget),w
	addlw	low(0FFF1h)
	movwf	(??_robot_turnRight+0)+0
	movf	(robot_turnRight@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0FFF1h)
	movwf	1+(??_robot_turnRight+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	1+(??_robot_turnRight+0)+0,w
	skipz
	goto	u5395
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robot_turnRight+0)+0,w
u5395:
	skipnc
	goto	u5391
	goto	u5390
u5391:
	goto	l11975
u5390:
	line	309
	
l11973:	
;robot.c: 308: {
;robot.c: 309: RobotDrive(speed, -1700);
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
	line	310
;robot.c: 310: }
	goto	l6149
	line	311
	
l6150:	
	
l11975:	
;robot.c: 311: else if (adcVal <= (AdcTarget - 50) || adcVal >= (AdcTarget + 15))
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	1+(??_robot_turnRight+0)+0,w
	skipz
	goto	u5405
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robot_turnRight+0)+0,w
u5405:
	skipnc
	goto	u5401
	goto	u5400
u5401:
	goto	l12023
u5400:
	
l11977:	
	movf	(robot_turnRight@AdcTarget),w
	addlw	low(0Fh)
	movwf	(??_robot_turnRight+0)+0
	movf	(robot_turnRight@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0Fh)
	movwf	1+(??_robot_turnRight+0)+0
	movf	1+(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	skipz
	goto	u5415
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5415:
	skipc
	goto	u5411
	goto	u5410
u5411:
	goto	l11981
u5410:
	goto	l12023
	
l6154:	
	line	313
;robot.c: 312: {
;robot.c: 313: break;
	goto	l12023
	line	314
	
l11979:	
;robot.c: 314: }
	goto	l6149
	line	316
	
l6152:	
	line	318
	
l11981:	
;robot.c: 316: else
;robot.c: 317: {
;robot.c: 318: RobotDrive(speed, 0x7FFF);
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
	goto	l6149
	line	319
	
l6156:	
	goto	l6149
	
l6151:	
	
l6149:	
	line	320
;robot.c: 319: }
;robot.c: 320: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	321
	
l11983:	
;robot.c: 321: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5420
	goto	l11989
u5420:
	line	323
	
l11985:	
;robot.c: 322: {
;robot.c: 323: RobotDrive(0, 0x7FFF);
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
	line	324
	
l11987:	
;robot.c: 324: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	325
;robot.c: 325: break;
	goto	l12023
	line	326
	
l6157:	
	line	327
	
l11989:	
;robot.c: 326: }
;robot.c: 327: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5430
	goto	l11995
u5430:
	line	329
	
l11991:	
;robot.c: 328: {
;robot.c: 329: RobotDrive(0, 0x7FFF);
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
	line	330
	
l11993:	
;robot.c: 330: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	331
;robot.c: 331: break;
	goto	l12023
	line	332
	
l6158:	
	line	333
	
l11995:	
;robot.c: 332: }
;robot.c: 333: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5440
	goto	l12001
u5440:
	line	335
	
l11997:	
;robot.c: 334: {
;robot.c: 335: RobotDrive(-200, 0x7FFF);
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
	line	336
	
l11999:	
;robot.c: 336: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	337
;robot.c: 337: break;
	goto	l12023
	line	338
	
l6159:	
	line	339
	
l12001:	
;robot.c: 338: }
;robot.c: 339: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5451
	goto	u5450
u5451:
	goto	l12007
u5450:
	line	341
	
l12003:	
;robot.c: 340: {
;robot.c: 341: RobotDrive(0, 0x7FFF);
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
	line	342
	
l12005:	
;robot.c: 342: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	343
;robot.c: 343: break;
	goto	l12023
	line	344
	
l6160:	
	line	345
	
l12007:	
;robot.c: 344: }
;robot.c: 345: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	346
	
l12009:	
;robot.c: 346: temp1 = temp1 << 8;
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
	line	347
	
l12011:	
;robot.c: 347: temp1 += DistLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_DistLowByte)^080h,w	;volatile
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
	line	348
	
l12013:	
;robot.c: 348: distTravelled += temp1;
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
	line	349
	
l12015:	
;robot.c: 349: TotalDistTravelled += temp1;
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
	line	350
	
l12017:	
;robot.c: 350: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	351
	
l12019:	
;robot.c: 351: temp1 = temp1 << 8;
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
	line	352
;robot.c: 352: temp1 += AngleLowByte;
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
	line	353
;robot.c: 353: angleTurned += temp1;
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
	line	354
;robot.c: 354: Disp2 = RobotPos;
	movf	(_RobotPos)^080h,w
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
	line	355
	
l12021:	
;robot.c: 355: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11961
	line	356
	
l6161:	
	line	300
	goto	l11961
	
l6155:	
	line	358
	
l12023:	
;robot.c: 356: }
;robot.c: 358: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	359
;robot.c: 359: switch (RobotPos)
	goto	l12055
	line	361
;robot.c: 360: {
;robot.c: 361: case 3:
	
l6163:	
	line	362
	
l12025:	
;robot.c: 362: RobotDrive((speed /2), -400);
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awdiv)
	movlw	high(02h)
	movwf	((?___awdiv))+1
	movf	(robot_turnRight@speed+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(robot_turnRight@speed),w
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
	line	363
	
l12027:	
;robot.c: 363: turnTarget = -90;
	movlw	low(-90)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-90)
	movwf	((robot_turnRight@turnTarget))+1
	line	364
;robot.c: 364: break;
	goto	l12057
	line	366
;robot.c: 366: case 7:
	
l6165:	
	line	367
	
l12029:	
;robot.c: 367: RobotDrive((speed), -400-100);
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_turnRight@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnRight@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-500)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-500)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	368
	
l12031:	
;robot.c: 368: turnTarget = -185;
	movlw	low(-185)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-185)
	movwf	((robot_turnRight@turnTarget))+1
	line	369
;robot.c: 369: break;
	goto	l12057
	line	370
;robot.c: 370: case 10:
	
l6166:	
	line	371
	
l12033:	
;robot.c: 371: RobotDrive((speed), -400-100);
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_turnRight@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnRight@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-500)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-500)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	372
	
l12035:	
;robot.c: 372: turnTarget = -90;
	movlw	low(-90)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-90)
	movwf	((robot_turnRight@turnTarget))+1
	line	373
;robot.c: 373: break;
	goto	l12057
	line	374
;robot.c: 374: case 11:
	
l6167:	
	line	375
	
l12037:	
;robot.c: 375: RobotDrive((speed), -400 - 100);
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_turnRight@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnRight@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-500)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-500)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	376
	
l12039:	
;robot.c: 376: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnRight@turnTarget))+1
	line	377
;robot.c: 377: break;
	goto	l12057
	line	378
;robot.c: 378: case 12:
	
l6168:	
	line	379
	
l12041:	
;robot.c: 379: RobotDrive((speed), -400 - 50);
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_turnRight@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnRight@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-450)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-450)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	380
	
l12043:	
;robot.c: 380: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnRight@turnTarget))+1
	line	381
;robot.c: 381: break;
	goto	l12057
	line	382
;robot.c: 382: case 17:
	
l6169:	
	line	383
	
l12045:	
;robot.c: 383: RobotDrive((speed), -400 - 100);
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_turnRight@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnRight@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-500)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-500)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	384
	
l12047:	
;robot.c: 384: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnRight@turnTarget))+1
	line	385
;robot.c: 385: break;
	goto	l12057
	line	386
;robot.c: 386: default:
	
l6170:	
	line	387
	
l12049:	
;robot.c: 387: RobotDrive((speed), -400);
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_turnRight@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnRight@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-400)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-400)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	388
	
l12051:	
;robot.c: 388: turnTarget = -75;
	movlw	low(-75)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-75)
	movwf	((robot_turnRight@turnTarget))+1
	line	389
;robot.c: 389: break;
	goto	l12057
	line	390
	
l12053:	
;robot.c: 390: }
	goto	l12057
	line	359
	
l6162:	
	
l12055:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 3 to 17
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
; direct_byte           56    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	3^0	; case 3
	skipnz
	goto	l12025
	xorlw	7^3	; case 7
	skipnz
	goto	l12029
	xorlw	10^7	; case 10
	skipnz
	goto	l12033
	xorlw	11^10	; case 11
	skipnz
	goto	l12037
	xorlw	12^11	; case 12
	skipnz
	goto	l12041
	xorlw	17^12	; case 17
	skipnz
	goto	l12045
	goto	l12049
	opt asmopt_on

	line	390
	
l6164:	
	line	391
	
l12057:	
;robot.c: 391: rotate(25, 1);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	line	392
;robot.c: 392: while (abs(angleTurned) < abs(turnTarget))
	goto	l12103
	
l6172:	
	line	394
	
l12059:	
;robot.c: 393: {
;robot.c: 394: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	395
	
l12061:	
;robot.c: 395: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5460
	goto	l12067
u5460:
	line	397
	
l12063:	
;robot.c: 396: {
;robot.c: 397: RobotDrive(0, 0x7FFF);
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
	
l12065:	
;robot.c: 398: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	399
;robot.c: 399: break;
	goto	l12105
	line	400
	
l6173:	
	line	401
	
l12067:	
;robot.c: 400: }
;robot.c: 401: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5470
	goto	l12073
u5470:
	line	403
	
l12069:	
;robot.c: 402: {
;robot.c: 403: RobotDrive(0, 0x7FFF);
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
	line	404
	
l12071:	
;robot.c: 404: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	405
;robot.c: 405: break;
	goto	l12105
	line	406
	
l6175:	
	line	407
	
l12073:	
;robot.c: 406: }
;robot.c: 407: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5480
	goto	l12079
u5480:
	line	409
	
l12075:	
;robot.c: 408: {
;robot.c: 409: RobotDrive(-200, 0x7FFF);
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
	line	410
	
l12077:	
;robot.c: 410: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	411
;robot.c: 411: break;
	goto	l12105
	line	412
	
l6176:	
	line	413
	
l12079:	
;robot.c: 412: }
;robot.c: 413: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5491
	goto	u5490
u5491:
	goto	l12085
u5490:
	line	415
	
l12081:	
;robot.c: 414: {
;robot.c: 415: RobotDrive(0, 0x7FFF);
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
	line	416
	
l12083:	
;robot.c: 416: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	417
;robot.c: 417: break;
	goto	l12105
	line	418
	
l6177:	
	line	419
	
l12085:	
;robot.c: 418: }
;robot.c: 419: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	420
	
l12087:	
;robot.c: 420: temp1 = temp1 << 8;
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
	line	421
	
l12089:	
;robot.c: 421: temp1 += AngleLowByte;
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
	line	422
	
l12091:	
;robot.c: 422: angleTurned += temp1;
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
	line	423
	
l12093:	
;robot.c: 423: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	424
;robot.c: 424: temp1 = temp1 << 8;
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
	line	425
	
l12095:	
;robot.c: 425: temp1 += DistLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_DistLowByte)^080h,w	;volatile
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
	line	426
	
l12097:	
;robot.c: 426: distTravelled += temp1;
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
	line	427
	
l12099:	
;robot.c: 427: TotalDistTravelled += temp1;
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
	line	429
	
l12101:	
;robot.c: 429: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12103
	line	430
	
l6171:	
	line	392
	
l12103:	
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
	movf	(robot_turnRight@turnTarget+1),w
	clrf	(?_abs+1)
	addwf	(?_abs+1)
	movf	(robot_turnRight@turnTarget),w
	clrf	(?_abs)
	addwf	(?_abs)

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
	goto	u5505
	movf	(0+(?_abs)),w
	subwf	0+(??_robot_turnRight+0)+0,w
u5505:

	skipc
	goto	u5501
	goto	u5500
u5501:
	goto	l12059
u5500:
	goto	l12105
	
l6174:	
	line	431
	
l12105:	
;robot.c: 430: }
;robot.c: 431: Disp2 = ROBOTerror;
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
	line	432
	
l12107:	
;robot.c: 432: UpdateDisplay();
	fcall	_UpdateDisplay
	line	435
	
l6178:	
	return
	opt stack 0
GLOBAL	__end_of_robot_turnRight
	__end_of_robot_turnRight:
;; =============== function _robot_turnRight ends ============

	signat	_robot_turnRight,4216
	global	_robotMoveSpeed
psect	text1091,local,class=CODE,delta=2
global __ptext1091
__ptext1091:

;; *************** function _robotMoveSpeed *****************
;; Defined at:
;;		line 440 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  distance        2   61[BANK0 ] int 
;;  speed           2   63[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   68[BANK0 ] int 
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
psect	text1091
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	440
	global	__size_of_robotMoveSpeed
	__size_of_robotMoveSpeed	equ	__end_of_robotMoveSpeed-_robotMoveSpeed
	
_robotMoveSpeed:	
	opt	stack 1
; Regs used in _robotMoveSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	441
	
l11905:	
;robot.c: 441: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	443
	
l11907:	
;robot.c: 442: int temp1;
;robot.c: 443: RobotDrive(speed, 0x7FFF);
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
	line	446
;robot.c: 446: while (abs(distTravelled) < abs(distance))
	goto	l11941
	
l6182:	
	line	448
	
l11909:	
;robot.c: 447: {
;robot.c: 448: robot_read(0);
	movlw	(0)
	fcall	_robot_read
	line	449
	
l11911:	
;robot.c: 449: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5310
	goto	l11915
u5310:
	line	451
	
l11913:	
;robot.c: 450: {
;robot.c: 451: ROBOTerror = 1;
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	452
;robot.c: 452: break;
	goto	l11943
	line	453
	
l6183:	
	line	454
	
l11915:	
;robot.c: 453: }
;robot.c: 454: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5320
	goto	l11919
u5320:
	line	456
	
l11917:	
;robot.c: 455: {
;robot.c: 456: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	457
;robot.c: 457: break;
	goto	l11943
	line	458
	
l6185:	
	line	459
	
l11919:	
;robot.c: 458: }
;robot.c: 459: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5330
	goto	l11923
u5330:
	line	461
	
l11921:	
;robot.c: 460: {
;robot.c: 461: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	462
;robot.c: 462: break;
	goto	l11943
	line	463
	
l6186:	
	line	464
	
l11923:	
;robot.c: 463: }
;robot.c: 464: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5341
	goto	u5340
u5341:
	goto	l11927
u5340:
	line	466
	
l11925:	
;robot.c: 465: {
;robot.c: 466: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	467
;robot.c: 467: break;
	goto	l11943
	line	468
	
l6187:	
	line	469
	
l11927:	
;robot.c: 468: }
;robot.c: 469: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	clrf	(??_robotMoveSpeed+0)+0+1
	movf	0+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1)
	movf	1+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1+1)
	line	470
	
l11929:	
;robot.c: 470: temp1 = temp1 << 8;
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
	line	471
	
l11931:	
;robot.c: 471: temp1 += DistLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_DistLowByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	clrf	(??_robotMoveSpeed+0)+0+1
	movf	0+(??_robotMoveSpeed+0)+0,w
	addwf	(robotMoveSpeed@temp1),f
	skipnc
	incf	(robotMoveSpeed@temp1+1),f
	movf	1+(??_robotMoveSpeed+0)+0,w
	addwf	(robotMoveSpeed@temp1+1),f
	line	472
	
l11933:	
;robot.c: 472: distTravelled += temp1;
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
	line	473
	
l11935:	
;robot.c: 473: TotalDistTravelled += temp1;
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
	line	474
	
l11937:	
;robot.c: 474: Disp2 = distTravelled;
	movf	(_distTravelled+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_distTravelled)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	475
	
l11939:	
;robot.c: 475: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11941
	line	481
	
l6181:	
	line	446
	
l11941:	
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
	goto	u5355
	movf	(0+(?_abs)),w
	subwf	0+(??_robotMoveSpeed+0)+0,w
u5355:

	skipc
	goto	u5351
	goto	u5350
u5351:
	goto	l11909
u5350:
	goto	l11943
	
l6184:	
	line	482
	
l11943:	
;robot.c: 481: }
;robot.c: 482: Disp2 = ROBOTerror;
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
	line	483
	
l11945:	
;robot.c: 483: UpdateDisplay();
	fcall	_UpdateDisplay
	line	484
	
l11947:	
;robot.c: 484: RobotDrive(0, 0x7FFF);
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
	line	486
	
l6188:	
	return
	opt stack 0
GLOBAL	__end_of_robotMoveSpeed
	__end_of_robotMoveSpeed:
;; =============== function _robotMoveSpeed ends ============

	signat	_robotMoveSpeed,8312
	global	_robotTurnSpeed
psect	text1092,local,class=CODE,delta=2
global __ptext1092
__ptext1092:

;; *************** function _robotTurnSpeed *****************
;; Defined at:
;;		line 493 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  angle           2   61[BANK0 ] int 
;;  speed           2   63[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   68[BANK0 ] int 
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
;;		_robot_turnLeft
;; This function uses a non-reentrant model
;;
psect	text1092
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	493
	global	__size_of_robotTurnSpeed
	__size_of_robotTurnSpeed	equ	__end_of_robotTurnSpeed-_robotTurnSpeed
	
_robotTurnSpeed:	
	opt	stack 0
; Regs used in _robotTurnSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	494
	
l11877:	
;robot.c: 494: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	495
;robot.c: 495: int temp1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robotTurnSpeed@temp1)
	clrf	(robotTurnSpeed@temp1+1)
	line	497
	
l11879:	
;robot.c: 497: robotTurn(angle);
	movf	(robotTurnSpeed@angle+1),w
	clrf	(?_robotTurn+1)
	addwf	(?_robotTurn+1)
	movf	(robotTurnSpeed@angle),w
	clrf	(?_robotTurn)
	addwf	(?_robotTurn)

	fcall	_robotTurn
	line	500
;robot.c: 500: while (abs(angleTurned) < abs(angle))
	goto	l11901
	
l6192:	
	line	502
	
l11881:	
;robot.c: 501: {
;robot.c: 502: robot_read(1);
	movlw	(01h)
	fcall	_robot_read
	line	503
	
l11883:	
;robot.c: 503: if (BumpSensors || VwallSensor)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,f
	skipz	;volatile
	goto	u5281
	goto	u5280
u5281:
	goto	l11887
u5280:
	
l11885:	
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5290
	goto	l11889
u5290:
	goto	l11887
	
l6195:	
	line	505
	
l11887:	
;robot.c: 504: {
;robot.c: 505: ROBOTerror = 1;
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	506
;robot.c: 506: break;
	goto	l11903
	line	507
	
l6193:	
	line	508
	
l11889:	
;robot.c: 507: }
;robot.c: 508: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotTurnSpeed+0)+0
	clrf	(??_robotTurnSpeed+0)+0+1
	movf	0+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1)
	movf	1+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1+1)
	line	509
	
l11891:	
;robot.c: 509: temp1 = temp1 << 8;
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
	line	510
	
l11893:	
;robot.c: 510: temp1 += AngleLowByte;
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
	line	511
	
l11895:	
;robot.c: 511: angleTurned += temp1;
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
	line	512
	
l11897:	
;robot.c: 512: Disp2 = angleTurned;
	movf	(_angleTurned+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_angleTurned)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	513
	
l11899:	
;robot.c: 513: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11901
	line	514
	
l6191:	
	line	500
	
l11901:	
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
	goto	u5305
	movf	(0+(?_abs)),w
	subwf	0+(??_robotTurnSpeed+0)+0,w
u5305:

	skipc
	goto	u5301
	goto	u5300
u5301:
	goto	l11881
u5300:
	goto	l11903
	
l6196:	
	line	516
	
l11903:	
;robot.c: 514: }
;robot.c: 516: robotTurn(0);
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurn)
	movlw	high(0)
	movwf	((?_robotTurn))+1
	fcall	_robotTurn
	line	517
	
l6197:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurnSpeed
	__end_of_robotTurnSpeed:
;; =============== function _robotTurnSpeed ends ============

	signat	_robotTurnSpeed,8312
	global	_robotFollow
psect	text1093,local,class=CODE,delta=2
global __ptext1093
__ptext1093:

;; *************** function _robotFollow *****************
;; Defined at:
;;		line 187 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  speed           2   61[BANK0 ] int 
;;  AdcTarget       2   63[BANK0 ] int 
;;  followDir       1   65[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  temp1           2   70[BANK0 ] int 
;;  hysterysis      1   72[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       5       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      12       0       0       0
;;Total ram usage:       12 bytes
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
psect	text1093
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	187
	global	__size_of_robotFollow
	__size_of_robotFollow	equ	__end_of_robotFollow-_robotFollow
	
_robotFollow:	
	opt	stack 0
; Regs used in _robotFollow: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	188
	
l11785:	
;robot.c: 188: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	190
	
l11787:	
;robot.c: 189: int temp1;
;robot.c: 190: unsigned char hysterysis = 20;
	movlw	(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	movwf	(robotFollow@hysterysis)
	line	191
	
l11789:	
;robot.c: 191: RobotDrive(speed, 0x7FFF);
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
	line	192
	
l11791:	
;robot.c: 192: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	goto	l11793
	line	195
;robot.c: 195: while (1)
	
l6116:	
	line	199
	
l11793:	
;robot.c: 196: {
;robot.c: 199: if (AdcTarget > 100)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(065h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5155
	movlw	low(065h)
	subwf	(robotFollow@AdcTarget),w
u5155:

	skipc
	goto	u5151
	goto	u5150
u5151:
	goto	l11797
u5150:
	line	200
	
l11795:	
;robot.c: 200: AdcTarget--;
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(robotFollow@AdcTarget),f
	skipnc
	incf	(robotFollow@AdcTarget+1),f
	movlw	high(-1)
	addwf	(robotFollow@AdcTarget+1),f
	goto	l11797
	
l6117:	
	line	201
	
l11797:	
;robot.c: 201: if (AdcTarget < 100)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(064h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5165
	movlw	low(064h)
	subwf	(robotFollow@AdcTarget),w
u5165:

	skipnc
	goto	u5161
	goto	u5160
u5161:
	goto	l11801
u5160:
	line	202
	
l11799:	
;robot.c: 202: AdcTarget++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(robotFollow@AdcTarget),f
	skipnc
	incf	(robotFollow@AdcTarget+1),f
	movlw	high(01h)
	addwf	(robotFollow@AdcTarget+1),f
	goto	l11801
	
l6118:	
	line	203
	
l11801:	
;robot.c: 203: readAvgDistance();
	fcall	_readAvgDistance
	line	204
	
l11803:	
;robot.c: 204: if (adcVal > (AdcTarget) && adcVal < (AdcTarget + hysterysis))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robotFollow@AdcTarget+1),w
	skipz
	goto	u5175
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robotFollow@AdcTarget),w
u5175:
	skipnc
	goto	u5171
	goto	u5170
u5171:
	goto	l11809
u5170:
	
l11805:	
	movf	(robotFollow@hysterysis),w
	addwf	(robotFollow@AdcTarget),w
	movwf	(??_robotFollow+0)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	incf	(robotFollow@AdcTarget+1),w
	movwf	((??_robotFollow+0)+0)+1
	movf	1+(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	skipz
	goto	u5185
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5185:
	skipnc
	goto	u5181
	goto	u5180
u5181:
	goto	l11809
u5180:
	line	206
	
l11807:	
;robot.c: 205: {
;robot.c: 206: RobotDrive(speed, 1700);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	line	207
;robot.c: 207: }
	goto	l6120
	line	208
	
l6119:	
	
l11809:	
;robot.c: 208: else if (adcVal < (AdcTarget) && adcVal > (AdcTarget - hysterysis))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	skipz
	goto	u5195
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5195:
	skipnc
	goto	u5191
	goto	u5190
u5191:
	goto	l11815
u5190:
	
l11811:	
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	1+(??_robotFollow+2)+0,w
	skipz
	goto	u5205
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robotFollow+2)+0,w
u5205:
	skipnc
	goto	u5201
	goto	u5200
u5201:
	goto	l11815
u5200:
	line	210
	
l11813:	
;robot.c: 209: {
;robot.c: 210: RobotDrive(speed, -1700);
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
	line	211
;robot.c: 211: }
	goto	l6120
	line	212
	
l6121:	
	
l11815:	
;robot.c: 212: else if (adcVal <= (AdcTarget - hysterysis) || adcVal >= (AdcTarget + hysterysis))
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	1+(??_robotFollow+2)+0,w
	skipz
	goto	u5215
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robotFollow+2)+0,w
u5215:
	skipnc
	goto	u5211
	goto	u5210
u5211:
	goto	l11819
u5210:
	
l11817:	
	movf	(robotFollow@hysterysis),w
	addwf	(robotFollow@AdcTarget),w
	movwf	(??_robotFollow+0)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	incf	(robotFollow@AdcTarget+1),w
	movwf	((??_robotFollow+0)+0)+1
	movf	1+(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	skipz
	goto	u5225
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5225:
	skipc
	goto	u5221
	goto	u5220
u5221:
	goto	l11833
u5220:
	goto	l11819
	
l6125:	
	line	214
	
l11819:	
;robot.c: 213: {
;robot.c: 214: rotate(10,1);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	line	215
	
l11821:	
;robot.c: 215: readAvgDistance();
	fcall	_readAvgDistance
	line	216
	
l11823:	
;robot.c: 216: rotate(10,0);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	217
	
l11825:	
;robot.c: 217: if (adcVal < 50)
	movlw	high(032h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(032h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u5231
	goto	u5230
u5231:
	goto	l11829
u5230:
	line	218
	
l11827:	
;robot.c: 218: ROBOTerror = 11;
	movlw	(0Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l11873
	line	219
	
l6126:	
	line	220
	
l11829:	
;robot.c: 219: else
;robot.c: 220: ROBOTerror = 10;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l11873
	
l6127:	
	line	222
;robot.c: 222: break;
	goto	l11873
	line	223
	
l11831:	
;robot.c: 223: }
	goto	l6120
	line	224
	
l6123:	
	line	226
	
l11833:	
;robot.c: 224: else
;robot.c: 225: {
;robot.c: 226: RobotDrive(speed, 0x7FFF);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	l6120
	line	227
	
l6129:	
	goto	l6120
	
l6122:	
	
l6120:	
	line	228
;robot.c: 227: }
;robot.c: 228: robot_read(0);
	movlw	(0)
	fcall	_robot_read
	line	229
	
l11835:	
;robot.c: 229: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5240
	goto	l11841
u5240:
	line	231
	
l11837:	
;robot.c: 230: {
;robot.c: 231: RobotDrive(0, 0x7FFF);
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
	line	232
	
l11839:	
;robot.c: 232: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	233
;robot.c: 233: break;
	goto	l11873
	line	234
	
l6130:	
	line	235
	
l11841:	
;robot.c: 234: }
;robot.c: 235: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5250
	goto	l11847
u5250:
	line	237
	
l11843:	
;robot.c: 236: {
;robot.c: 237: RobotDrive(0, 0x7FFF);
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
	line	238
	
l11845:	
;robot.c: 238: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	239
;robot.c: 239: break;
	goto	l11873
	line	240
	
l6131:	
	line	241
	
l11847:	
;robot.c: 240: }
;robot.c: 241: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5260
	goto	l11853
u5260:
	line	243
	
l11849:	
;robot.c: 242: {
;robot.c: 243: RobotDrive(-200, 0x7FFF);
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
	line	244
	
l11851:	
;robot.c: 244: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	245
;robot.c: 245: break;
	goto	l11873
	line	246
	
l6132:	
	line	247
	
l11853:	
;robot.c: 246: }
;robot.c: 247: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5271
	goto	u5270
u5271:
	goto	l11859
u5270:
	line	249
	
l11855:	
;robot.c: 248: {
;robot.c: 249: RobotDrive(0, 0x7FFF);
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
	line	250
	
l11857:	
;robot.c: 250: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	251
;robot.c: 251: break;
	goto	l11873
	line	252
	
l6133:	
	line	253
	
l11859:	
;robot.c: 252: }
;robot.c: 253: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	clrf	(??_robotFollow+0)+0+1
	movf	0+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1)
	movf	1+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1+1)
	line	254
	
l11861:	
;robot.c: 254: temp1 = temp1 << 8;
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
	line	255
	
l11863:	
;robot.c: 255: temp1 += DistLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_DistLowByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	clrf	(??_robotFollow+0)+0+1
	movf	0+(??_robotFollow+0)+0,w
	addwf	(robotFollow@temp1),f
	skipnc
	incf	(robotFollow@temp1+1),f
	movf	1+(??_robotFollow+0)+0,w
	addwf	(robotFollow@temp1+1),f
	line	256
	
l11865:	
;robot.c: 256: distTravelled += temp1;
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
	line	257
	
l11867:	
;robot.c: 257: TotalDistTravelled += temp1;
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
	line	259
	
l11869:	
;robot.c: 259: Disp2 = RobotPos;
	movf	(_RobotPos)^080h,w
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
	line	260
	
l11871:	
;robot.c: 260: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11793
	line	261
	
l6134:	
	line	195
	goto	l11793
	
l6128:	
	line	263
	
l11873:	
;robot.c: 261: }
;robot.c: 263: Disp2 = RobotPos;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
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
	line	264
	
l11875:	
;robot.c: 264: UpdateDisplay();
	fcall	_UpdateDisplay
	line	265
	
l6135:	
	return
	opt stack 0
GLOBAL	__end_of_robotFollow
	__end_of_robotFollow:
;; =============== function _robotFollow ends ============

	signat	_robotFollow,12408
	global	_calibrateIR
psect	text1094,local,class=CODE,delta=2
global __ptext1094
__ptext1094:

;; *************** function _calibrateIR *****************
;; Defined at:
;;		line 318 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text1094
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	318
	global	__size_of_calibrateIR
	__size_of_calibrateIR	equ	__end_of_calibrateIR-_calibrateIR
	
_calibrateIR:	
	opt	stack 0
; Regs used in _calibrateIR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	319
	
l11753:	
;Main.c: 319: currentMenu = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h	;volatile
	bsf	status,0
	rlf	(_currentMenu)^080h,f	;volatile
	line	320
	
l11755:	
;Main.c: 320: rotate(8, 0);
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(08h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	321
	
l11757:	
;Main.c: 321: rotate(8, 1);
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
	goto	l11759
	line	322
;Main.c: 322: while (1)
	
l2290:	
	line	324
	
l11759:	
;Main.c: 323: {
;Main.c: 324: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5141
	goto	u5140
u5141:
	goto	l11783
u5140:
	line	326
	
l11761:	
;Main.c: 325: {
;Main.c: 326: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	327
	
l11763:	
;Main.c: 327: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11783
	line	328
	
l2291:	
	line	329
;Main.c: 328: }
;Main.c: 329: switch (buttonPressed)
	goto	l11783
	line	331
;Main.c: 330: {
;Main.c: 331: case 1:
	
l2293:	
	line	332
;Main.c: 332: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	333
;Main.c: 333: break;
	goto	l11759
	line	334
;Main.c: 334: case 2:
	
l2295:	
	line	335
;Main.c: 335: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	336
;Main.c: 336: break;
	goto	l11759
	line	337
;Main.c: 337: case 3:
	
l2296:	
	line	338
	
l11765:	
;Main.c: 338: rotate(1, 1);
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
	line	339
	
l11767:	
;Main.c: 339: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	340
;Main.c: 340: break;
	goto	l11759
	line	341
;Main.c: 341: case 4:
	
l2297:	
	line	342
	
l11769:	
;Main.c: 342: rotate(1, 0);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(01h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	343
	
l11771:	
;Main.c: 343: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	344
;Main.c: 344: break;
	goto	l11759
	line	345
;Main.c: 345: case 5:
	
l2298:	
	line	347
	
l11773:	
;Main.c: 347: totalSteps = 0;
	clrf	(_totalSteps)^080h
	clrf	(_totalSteps+1)^080h
	line	348
	
l11775:	
;Main.c: 348: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	349
	
l11777:	
;Main.c: 349: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	goto	l2299
	line	350
	
l11779:	
;Main.c: 350: return;
	goto	l2299
	line	351
;Main.c: 351: default:
	
l2300:	
	line	352
;Main.c: 352: break;
	goto	l11759
	line	353
	
l11781:	
;Main.c: 353: }
	goto	l11759
	line	329
	
l2292:	
	
l11783:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_buttonPressed)^080h,w	;volatile
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
	goto	l2293
	xorlw	2^1	; case 2
	skipnz
	goto	l2295
	xorlw	3^2	; case 3
	skipnz
	goto	l11765
	xorlw	4^3	; case 4
	skipnz
	goto	l11769
	xorlw	5^4	; case 5
	skipnz
	goto	l11773
	goto	l11759
	opt asmopt_on

	line	353
	
l2294:	
	goto	l11759
	line	354
	
l2301:	
	line	322
	goto	l11759
	
l2302:	
	line	355
	
l2299:	
	return
	opt stack 0
GLOBAL	__end_of_calibrateIR
	__end_of_calibrateIR:
;; =============== function _calibrateIR ends ============

	signat	_calibrateIR,88
	global	_UpdateDisplay
psect	text1095,local,class=CODE,delta=2
global __ptext1095
__ptext1095:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 236 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tempDist        2   59[BANK0 ] int 
;;  LCDOutput      16   43[BANK0 ] unsigned char [16]
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
;;      Locals:         0      18       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      22       0       0       0
;;Total ram usage:       22 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_lcd_write_control
;;		_sprintf
;;		_lcd_set_cursor
;;		_lcd_write_string
;;		___awmod
;;		___awdiv
;; This function is called by:
;;		_main
;;		_calibrateIR
;;		_ChargeMode
;;		_robotFollow
;;		_robot_turnRight
;;		_robotMoveSpeed
;;		_robotTurnSpeed
;; This function uses a non-reentrant model
;;
psect	text1095
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	236
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
	opt	stack 1
; Regs used in _UpdateDisplay: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	237
	
l11671:	
;HMI.c: 237: char LCDOutput[16] = "";
	movlw	(UpdateDisplay@LCDOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1265)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	fsr0,w
	movwf	((??_UpdateDisplay+0)+0+1)
	movlw	16
	movwf	((??_UpdateDisplay+0)+0+2)
u5120:
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
	goto	u5120
	line	238
;HMI.c: 238: switch (currentMenu)
	goto	l11747
	line	240
;HMI.c: 239: {
;HMI.c: 240: case 0:
	
l4581:	
	line	241
	
l11673:	
;HMI.c: 241: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	242
	
l11675:	
;HMI.c: 242: sprintf(LCDOutput,"IR:%3dcm D:%3d",Disp1, Disp2);
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
	
l11677:	
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
	
l11679:	
;HMI.c: 245: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	246
	
l11681:	
;HMI.c: 246: if (pos > 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5135
	movlw	low(01h)
	subwf	(_pos)^080h,w
u5135:

	skipc
	goto	u5131
	goto	u5130
u5131:
	goto	l11685
u5130:
	line	247
	
l11683:	
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
	goto	l11687
	line	248
	
l4582:	
	line	249
	
l11685:	
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
	goto	l11687
	
l4583:	
	line	250
	
l11687:	
;HMI.c: 250: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	251
	
l11689:	
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
	
l11691:	
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
	goto	l4597
	line	255
;HMI.c: 255: case 1:
	
l4585:	
	line	256
	
l11693:	
;HMI.c: 256: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	257
;HMI.c: 257: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	258
	
l11695:	
;HMI.c: 258: lcd_write_string("Zero Step_Motor");
	movlw	low((STR_14-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	259
	
l11697:	
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
	
l11699:	
;HMI.c: 261: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	262
	
l11701:	
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
	
l11703:	
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
	goto	l4597
	line	266
;HMI.c: 266: case 2:
	
l4586:	
	line	267
	
l11705:	
;HMI.c: 267: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	268
;HMI.c: 268: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	269
	
l11707:	
;HMI.c: 269: lcd_write_string(" Charging Mode ");
	movlw	low((STR_18-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	270
	
l11709:	
;HMI.c: 270: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	271
;HMI.c: 271: sprintf(LCDOutput,"%dmA", BattCharge);
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
	
l11711:	
;HMI.c: 273: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	274
;HMI.c: 274: switch(BattState)
	goto	l11727
	line	276
;HMI.c: 275: {
;HMI.c: 276: case 0:
	
l4588:	
	line	277
	
l11713:	
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
	goto	l11729
	line	279
;HMI.c: 279: case 1:
	
l4590:	
	line	280
	
l11715:	
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
	goto	l11729
	line	282
;HMI.c: 282: case 2:
	
l4591:	
	line	283
	
l11717:	
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
	goto	l11729
	line	285
;HMI.c: 285: case 3:
	
l4592:	
	line	286
	
l11719:	
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
	goto	l11729
	line	288
;HMI.c: 288: case 4:
	
l4593:	
	line	289
	
l11721:	
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
	goto	l11729
	line	291
;HMI.c: 291: case 5:
	
l4594:	
	line	292
	
l11723:	
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
	goto	l11729
	line	294
	
l11725:	
;HMI.c: 294: }
	goto	l11729
	line	274
	
l4587:	
	
l11727:	
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
	goto	l12287
	goto	l11729
	opt asmopt_on
	
l12287:	
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
	goto	l11713
	xorlw	1^0	; case 1
	skipnz
	goto	l11715
	xorlw	2^1	; case 2
	skipnz
	goto	l11717
	xorlw	3^2	; case 3
	skipnz
	goto	l11719
	xorlw	4^3	; case 4
	skipnz
	goto	l11721
	xorlw	5^4	; case 5
	skipnz
	goto	l11723
	goto	l11729
	opt asmopt_on

	line	294
	
l4589:	
	line	296
	
l11729:	
;HMI.c: 296: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	297
	
l11731:	
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
	goto	l4597
	line	299
;HMI.c: 299: case 3:
	
l4595:	
	line	300
	
l11733:	
;HMI.c: 300: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	301
	
l11735:	
;HMI.c: 301: sprintf(LCDOutput,"IR:%3dcm CP:%3d",adcVal, RobotPos);
	movlw	((STR_27-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	(??_UpdateDisplay+0)+0,w
	movwf	(?_sprintf)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+01h
	addwf	0+(?_sprintf)+01h

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+1)+0
	clrf	(??_UpdateDisplay+1)+0+1
	movf	0+(??_UpdateDisplay+1)+0,w
	movwf	0+(?_sprintf)+03h
	movf	1+(??_UpdateDisplay+1)+0,w
	movwf	1+(?_sprintf)+03h
	movlw	(UpdateDisplay@LCDOutput)&0ffh
	fcall	_sprintf
	line	302
	
l11737:	
;HMI.c: 302: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	303
;HMI.c: 303: lcd_write_string(LCDOutput);
	movlw	(UpdateDisplay@LCDOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	304
	
l11739:	
;HMI.c: 304: int tempDist = (TotalDistTravelled/ 10);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_TotalDistTravelled+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_TotalDistTravelled)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awdiv)),w
	clrf	(UpdateDisplay@tempDist+1)
	addwf	(UpdateDisplay@tempDist+1)
	movf	(0+(?___awdiv)),w
	clrf	(UpdateDisplay@tempDist)
	addwf	(UpdateDisplay@tempDist)

	line	306
	
l11741:	
;HMI.c: 306: sprintf(LCDOutput,"D:%4dcm AT:%3d",tempDist, angleTurned);
	movlw	((STR_28-__stringbase))&0ffh
	movwf	(??_UpdateDisplay+0)+0
	movf	(??_UpdateDisplay+0)+0,w
	movwf	(?_sprintf)
	movf	(UpdateDisplay@tempDist+1),w
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	movf	(UpdateDisplay@tempDist),w
	clrf	0+(?_sprintf)+01h
	addwf	0+(?_sprintf)+01h

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_angleTurned+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+03h
	addwf	1+(?_sprintf)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_angleTurned)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+03h
	addwf	0+(?_sprintf)+03h

	movlw	(UpdateDisplay@LCDOutput)&0ffh
	fcall	_sprintf
	line	307
;HMI.c: 307: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	308
	
l11743:	
;HMI.c: 308: lcd_write_string(LCDOutput);
	movlw	(UpdateDisplay@LCDOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	309
;HMI.c: 309: break;
	goto	l4597
	line	310
;HMI.c: 310: default:
	
l4596:	
	line	311
;HMI.c: 311: break;
	goto	l4597
	line	312
	
l11745:	
;HMI.c: 312: }
	goto	l4597
	line	238
	
l4580:	
	
l11747:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentMenu)^080h,w	;volatile
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           20     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l11673
	xorlw	1^0	; case 1
	skipnz
	goto	l11693
	xorlw	2^1	; case 2
	skipnz
	goto	l11705
	xorlw	3^2	; case 3
	skipnz
	goto	l11733
	goto	l4597
	opt asmopt_on

	line	312
	
l4584:	
	line	313
	
l4597:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,88
	global	_readAvgDistance
psect	text1096,local,class=CODE,delta=2
global __ptext1096
__ptext1096:

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
;; This function uses a non-reentrant model
;;
psect	text1096
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	28
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	29
	
l11653:	
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
	
l11655:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5095
	movlw	low(08h)
	subwf	(readAvgDistance@i),w
u5095:

	skipc
	goto	u5091
	goto	u5090
u5091:
	goto	l11659
u5090:
	goto	l11667
	
l11657:	
	goto	l11667
	line	33
	
l3024:	
	line	34
	
l11659:	
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
	
l11661:	
;infrared.c: 35: if (tempIR <= 1000)
	movlw	high(03E9h)
	subwf	(readAvgDistance@tempIR+1),w
	movlw	low(03E9h)
	skipnz
	subwf	(readAvgDistance@tempIR),w
	skipnc
	goto	u5101
	goto	u5100
u5101:
	goto	l3026
u5100:
	line	37
	
l11663:	
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
	
l11665:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5115
	movlw	low(08h)
	subwf	(readAvgDistance@i),w
u5115:

	skipc
	goto	u5111
	goto	u5110
u5111:
	goto	l11659
u5110:
	goto	l11667
	
l3025:	
	line	41
	
l11667:	
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_adcVal+1)^080h	;volatile
	addwf	(_adcVal+1)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwdiv)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_adcVal)^080h	;volatile
	addwf	(_adcVal)^080h	;volatile

	line	42
;infrared.c: 42: ADCconvert();
	fcall	_ADCconvert
	line	43
	
l11669:	
;infrared.c: 43: Disp1 = adcVal;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	clrf	(_Disp1+1)^080h	;volatile
	addwf	(_Disp1+1)^080h	;volatile
	movf	(_adcVal)^080h,w	;volatile
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
psect	text1097,local,class=CODE,delta=2
global __ptext1097
__ptext1097:

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
psect	text1097
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	137
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 2
; Regs used in _init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	138
	
l11627:	
;Main.c: 138: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	140
	
l11629:	
;Main.c: 140: TRISB = 0b11111100;
	movlw	(0FCh)
	movwf	(134)^080h	;volatile
	line	141
	
l11631:	
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
	
l11633:	
;Main.c: 144: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	145
	
l11635:	
;Main.c: 145: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	148
	
l11637:	
;Main.c: 148: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	151
	
l11639:	
;Main.c: 151: ser_init();
	fcall	_ser_init
	line	152
	
l11641:	
;Main.c: 152: init_adc();
	fcall	_init_adc
	line	153
	
l11643:	
;Main.c: 153: lcd_init();
	fcall	_lcd_init
	line	154
	
l11645:	
;Main.c: 154: robo_init();
	fcall	_robo_init
	line	158
	
l11647:	
;Main.c: 158: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	160
	
l11649:	
;Main.c: 160: PEIE=1;
	bsf	(94/8),(94)&7
	line	162
	
l11651:	
;Main.c: 162: (GIE = 1);
	bsf	(95/8),(95)&7
	line	163
	
l2251:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_readDistance
psect	text1098,local,class=CODE,delta=2
global __ptext1098
__ptext1098:

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
psect	text1098
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	78
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	81
	
l11621:	
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
	
l11623:	
;infrared.c: 83: return readVal;
	movf	(readDistance@readVal+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@readVal),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	l3030
	
l11625:	
	line	84
	
l3030:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_RobotBattRead
psect	text1099,local,class=CODE,delta=2
global __ptext1099
__ptext1099:

;; *************** function _RobotBattRead *****************
;; Defined at:
;;		line 520 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1099
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	520
	global	__size_of_RobotBattRead
	__size_of_RobotBattRead	equ	__end_of_RobotBattRead-_RobotBattRead
	
_RobotBattRead:	
	opt	stack 1
; Regs used in _RobotBattRead: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	521
	
l11593:	
;robot.c: 521: int temp1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(RobotBattRead@temp1)
	clrf	(RobotBattRead@temp1+1)
	line	522
	
l11595:	
;robot.c: 522: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	523
	
l11597:	
;robot.c: 523: ser_putch(25);
	movlw	(019h)
	fcall	_ser_putch
	line	524
	
l11599:	
;robot.c: 524: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_RobotBattRead+0)+0+1),f
	movlw	118
movwf	((??_RobotBattRead+0)+0),f
u5597:
	decfsz	((??_RobotBattRead+0)+0),f
	goto	u5597
	decfsz	((??_RobotBattRead+0)+0+1),f
	goto	u5597
	clrwdt
opt asmopt_on

	line	525
	
l11601:	
;robot.c: 525: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	movf	(??_RobotBattRead+0)+0,w
	movwf	(_DistHighByte)	;volatile
	line	526
	
l11603:	
;robot.c: 526: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	movf	(??_RobotBattRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	527
	
l11605:	
;robot.c: 527: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	528
	
l11607:	
;robot.c: 528: ser_putch(21);
	movlw	(015h)
	fcall	_ser_putch
	line	529
	
l11609:	
;robot.c: 529: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_RobotBattRead+0)+0+1),f
	movlw	118
movwf	((??_RobotBattRead+0)+0),f
u5607:
	decfsz	((??_RobotBattRead+0)+0),f
	goto	u5607
	decfsz	((??_RobotBattRead+0)+0+1),f
	goto	u5607
	clrwdt
opt asmopt_on

	line	530
	
l11611:	
;robot.c: 530: BattState = ser_getch();
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
	line	533
	
l11613:	
;robot.c: 533: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	clrf	(??_RobotBattRead+0)+0+1
	movf	0+(??_RobotBattRead+0)+0,w
	movwf	(RobotBattRead@temp1)
	movf	1+(??_RobotBattRead+0)+0,w
	movwf	(RobotBattRead@temp1+1)
	line	534
	
l11615:	
;robot.c: 534: temp1 = temp1 << 8;
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
	line	535
	
l11617:	
;robot.c: 535: temp1 += DistLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_DistLowByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	clrf	(??_RobotBattRead+0)+0+1
	movf	0+(??_RobotBattRead+0)+0,w
	addwf	(RobotBattRead@temp1),f
	skipnc
	incf	(RobotBattRead@temp1+1),f
	movf	1+(??_RobotBattRead+0)+0,w
	addwf	(RobotBattRead@temp1+1),f
	line	536
	
l11619:	
;robot.c: 536: BattCharge = temp1;
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

	line	537
	
l6200:	
	return
	opt stack 0
GLOBAL	__end_of_RobotBattRead
	__end_of_RobotBattRead:
;; =============== function _RobotBattRead ends ============

	signat	_RobotBattRead,88
	global	_robot_read
psect	text1100,local,class=CODE,delta=2
global __ptext1100
__ptext1100:

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
psect	text1100
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
	
l11577:	
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_BumpSensors)^080h	;volatile
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_VwallSensor)^080h	;volatile
	line	75
;robot.c: 75: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	76
;robot.c: 76: ser_putch(17);
	movlw	(011h)
	fcall	_ser_putch
	line	78
;robot.c: 78: VictimSensor = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_VictimSensor)^080h	;volatile
	line	82
	
l11579:	
;robot.c: 82: if (readType == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_read@readType),f
	skipz
	goto	u5061
	goto	u5060
u5061:
	goto	l11583
u5060:
	line	84
	
l11581:	
;robot.c: 83: {
;robot.c: 84: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	85
;robot.c: 85: ser_putch(19);
	movlw	(013h)
	fcall	_ser_putch
	line	87
;robot.c: 87: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	movwf	(_DistHighByte)	;volatile
	line	88
;robot.c: 88: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	89
;robot.c: 89: }
	goto	l6103
	line	90
	
l6096:	
	
l11583:	
;robot.c: 90: else if (readType == 1)
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_read@readType),w
	xorlw	01h
	skipz
	goto	u5071
	goto	u5070
u5071:
	goto	l11587
u5070:
	line	92
	
l11585:	
;robot.c: 91: {
;robot.c: 92: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	93
;robot.c: 93: ser_putch(20);
	movlw	(014h)
	fcall	_ser_putch
	line	95
;robot.c: 95: AngleHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleHighByte)^080h	;volatile
	line	96
;robot.c: 96: AngleLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleLowByte)^080h	;volatile
	line	97
;robot.c: 97: }
	goto	l6103
	line	98
	
l6098:	
	
l11587:	
;robot.c: 98: else if (readType == 2)
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_read@readType),w
	xorlw	02h
	skipz
	goto	u5081
	goto	u5080
u5081:
	goto	l6103
u5080:
	line	101
	
l11589:	
;robot.c: 99: {
;robot.c: 101: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	102
;robot.c: 102: ser_putch(19);
	movlw	(013h)
	fcall	_ser_putch
	line	104
;robot.c: 104: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	movwf	(_DistHighByte)	;volatile
	line	105
;robot.c: 105: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	106
;robot.c: 106: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	107
;robot.c: 107: ser_putch(20);
	movlw	(014h)
	fcall	_ser_putch
	line	109
;robot.c: 109: AngleHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleHighByte)^080h	;volatile
	line	110
;robot.c: 110: AngleLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleLowByte)^080h	;volatile
	line	111
;robot.c: 111: }
	goto	l6103
	line	113
	
l6100:	
	goto	l6103
	
l11591:	
	goto	l6103
	line	116
;robot.c: 114: {
	
l6102:	
	goto	l6103
	line	117
	
l6101:	
	goto	l6103
	
l6099:	
	goto	l6103
	
l6097:	
	
l6103:	
	return
	opt stack 0
GLOBAL	__end_of_robot_read
	__end_of_robot_read:
;; =============== function _robot_read ends ============

	signat	_robot_read,4216
	global	_lcd_init
psect	text1101,local,class=CODE,delta=2
global __ptext1101
__ptext1101:

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
psect	text1101
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 2
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l11557:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l11559:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l11561:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l11563:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l11565:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l11567:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l11569:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l11571:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l11573:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l11575:	
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
psect	text1102,local,class=CODE,delta=2
global __ptext1102
__ptext1102:

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
psect	text1102
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 1
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
l11549:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	l11555
	
l1409:	
	
l11551:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
l11553:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
	goto	l11555
	
l1408:	
	
l11555:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u5051
	goto	u5050
u5051:
	goto	l11551
u5050:
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
psect	text1103,local,class=CODE,delta=2
global __ptext1103
__ptext1103:

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
psect	text1103
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
	
l11545:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
l11547:	
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
psect	text1104,local,class=CODE,delta=2
global __ptext1104
__ptext1104:

;; *************** function _abs *****************
;; Defined at:
;;		line 542 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1104
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	542
	global	__size_of_abs
	__size_of_abs	equ	__end_of_abs-_abs
	
_abs:	
	opt	stack 2
; Regs used in _abs: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	543
	
l11541:	
;robot.c: 543: return (v * ((v > 0) - (v < 0)));
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
	goto	u5045
	movlw	low(01h)
	subwf	(abs@v),w
u5045:

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

	goto	l6203
	
l11543:	
	line	544
	
l6203:	
	return
	opt stack 0
GLOBAL	__end_of_abs
	__end_of_abs:
;; =============== function _abs ends ============

	signat	_abs,4218
	global	_robotTurn
psect	text1105,local,class=CODE,delta=2
global __ptext1105
__ptext1105:

;; *************** function _robotTurn *****************
;; Defined at:
;;		line 143 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1105
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	143
	global	__size_of_robotTurn
	__size_of_robotTurn	equ	__end_of_robotTurn-_robotTurn
	
_robotTurn:	
	opt	stack 1
; Regs used in _robotTurn: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	145
	
l11533:	
;robot.c: 145: if (angle > 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotTurn@angle+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5025
	movlw	low(01h)
	subwf	(robotTurn@angle),w
u5025:

	skipc
	goto	u5021
	goto	u5020
u5021:
	goto	l6109
u5020:
	line	147
	
l11535:	
;robot.c: 146: {
;robot.c: 147: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	149
;robot.c: 149: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	151
;robot.c: 151: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	153
;robot.c: 153: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	155
;robot.c: 155: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	156
;robot.c: 156: }
	goto	l6113
	line	157
	
l6109:	
;robot.c: 157: else if (angle < 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(robotTurn@angle+1),7
	goto	u5031
	goto	u5030
u5031:
	goto	l11539
u5030:
	line	159
	
l11537:	
;robot.c: 158: {
;robot.c: 159: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	161
;robot.c: 161: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	163
;robot.c: 163: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	165
;robot.c: 165: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	167
;robot.c: 167: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	168
;robot.c: 168: }
	goto	l6113
	line	169
	
l6111:	
	line	171
	
l11539:	
;robot.c: 169: else
;robot.c: 170: {
;robot.c: 171: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	173
;robot.c: 173: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	175
;robot.c: 175: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	177
;robot.c: 177: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	179
;robot.c: 179: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	goto	l6113
	line	180
	
l6112:	
	goto	l6113
	
l6110:	
	line	181
	
l6113:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurn
	__end_of_robotTurn:
;; =============== function _robotTurn ends ============

	signat	_robotTurn,4216
	global	_ser_getch
psect	text1106,local,class=CODE,delta=2
global __ptext1106
__ptext1106:

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
psect	text1106
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	55
	global	__size_of_ser_getch
	__size_of_ser_getch	equ	__end_of_ser_getch-_ser_getch
	
_ser_getch:	
	opt	stack 1
; Regs used in _ser_getch: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	58
	
l11517:	
;ser.c: 56: unsigned char c;
;ser.c: 58: while (ser_isrx()==0)
	goto	l11519
	
l6910:	
	line	59
;ser.c: 59: continue;
	goto	l11519
	
l6909:	
	line	58
	
l11519:	
	fcall	_ser_isrx
	btfss	status,0
	goto	u5011
	goto	u5010
u5011:
	goto	l11519
u5010:
	
l6911:	
	line	61
;ser.c: 61: GIE=0;
	bcf	(95/8),(95)&7
	line	62
	
l11521:	
;ser.c: 62: c=rxfifo[rxoptr];
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_rxoptr)^080h,w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ser_getch+0)+0
	movf	(??_ser_getch+0)+0,w
	movwf	(ser_getch@c)
	line	63
	
l11523:	
;ser.c: 63: ++rxoptr;
	movlw	(01h)
	movwf	(??_ser_getch+0)+0
	movf	(??_ser_getch+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_rxoptr)^080h,f	;volatile
	line	64
	
l11525:	
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
	
l11527:	
;ser.c: 65: GIE=1;
	bsf	(95/8),(95)&7
	line	66
	
l11529:	
;ser.c: 66: return c;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(ser_getch@c),w
	goto	l6912
	
l11531:	
	line	67
	
l6912:	
	return
	opt stack 0
GLOBAL	__end_of_ser_getch
	__end_of_ser_getch:
;; =============== function _ser_getch ends ============

	signat	_ser_getch,89
	global	_sprintf
psect	text1107,local,class=CODE,delta=2
global __ptext1107
__ptext1107:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> UpdateDisplay@LCDOutput(16), 
;;  f               1   20[BANK0 ] PTR const unsigned char 
;;		 -> STR_28(15), STR_27(16), STR_19(5), STR_13(15), 
;; Auto vars:     Size  Location     Type
;;  sp              1   35[BANK0 ] PTR unsigned char 
;;		 -> UpdateDisplay@LCDOutput(16), 
;;  _val            4   31[BANK0 ] struct .
;;  width           2   36[BANK0 ] int 
;;  c               1   38[BANK0 ] char 
;;  flag            1   30[BANK0 ] unsigned char 
;;  prec            1   29[BANK0 ] char 
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
;;      Locals:         0      11       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      19       0       0       0
;;Total ram usage:       19 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_isdigit
;;		___wmul
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1107
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
	
l11427:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	l11511
	
l6952:	
	line	542
	
l11429:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u4861
	goto	u4860
u4861:
	goto	l11435
u4860:
	line	545
	
l11431:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11433:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	l11511
	line	547
	
l6953:	
	line	550
	
l11435:	
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	line	552
	
l11437:	
	clrf	(sprintf@flag)
	line	601
	
l11439:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfss	status,0
	goto	u4871
	goto	u4870
u4871:
	goto	l11451
u4870:
	line	602
	
l11441:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l11443
	line	603
	
l6955:	
	line	604
	
l11443:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@width+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(sprintf@width),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(0Ah)
	movwf	0+(?___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	addwf	(0+(?___wmul)),w
	movwf	(??_sprintf+0)+0
	movlw	0
	skipnc
	movlw	1
	addwf	(1+(?___wmul)),w
	movwf	1+(??_sprintf+0)+0
	movf	0+(??_sprintf+0)+0,w
	addlw	low(0FFD0h)
	movwf	(sprintf@width)
	movf	1+(??_sprintf+0)+0,w
	skipnc
	addlw	1
	addlw	high(0FFD0h)
	movwf	1+(sprintf@width)
	
l11445:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@f),f
	line	605
	
l11447:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfsc	status,0
	goto	u4881
	goto	u4880
u4881:
	goto	l11443
u4880:
	goto	l11451
	
l6956:	
	goto	l11451
	line	611
	
l6954:	
	line	638
	goto	l11451
	line	640
	
l6958:	
	line	641
	goto	l11513
	line	700
	
l6960:	
	goto	l11453
	line	701
	
l6961:	
	line	702
	goto	l11453
	line	805
	
l6963:	
	line	816
	goto	l11511
	line	825
	
l11449:	
	goto	l11453
	line	638
	
l6957:	
	
l11451:	
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	l11513
	xorlw	100^0	; case 100
	skipnz
	goto	l11453
	xorlw	105^100	; case 105
	skipnz
	goto	l11453
	goto	l11511
	opt asmopt_on

	line	825
	
l6962:	
	line	1254
	
l11453:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
l11455:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
l11457:	
	btfss	(sprintf@_val+1),7
	goto	u4891
	goto	u4890
u4891:
	goto	l11463
u4890:
	line	1257
	
l11459:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
l11461:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	l11463
	line	1259
	
l6964:	
	line	1300
	
l11463:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
l11465:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u4901
	goto	u4900
u4901:
	goto	l11469
u4900:
	goto	l11477
	
l11467:	
	goto	l11477
	line	1301
	
l6965:	
	
l11469:	
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
	goto	u4915
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u4915:
	skipnc
	goto	u4911
	goto	u4910
u4911:
	goto	l11473
u4910:
	goto	l11477
	line	1302
	
l11471:	
	goto	l11477
	
l6967:	
	line	1300
	
l11473:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
l11475:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u4921
	goto	u4920
u4921:
	goto	l11469
u4920:
	goto	l11477
	
l6966:	
	line	1340
	
l11477:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u4931
	goto	u4930
u4931:
	goto	l6968
u4930:
	
l11479:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u4941
	goto	u4940
u4941:
	goto	l6968
u4940:
	line	1341
	
l11481:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	
l6968:	
	line	1376
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	clrf	(??_sprintf+0)+0+1
	btfsc	(??_sprintf+0)+0,7
	decf	(??_sprintf+0)+0+1,f
	movf	1+(??_sprintf+0)+0,w
	xorlw	80h
	movwf	(??_sprintf+2)+0
	movf	(sprintf@width+1),w
	xorlw	80h
	subwf	(??_sprintf+2)+0,w
	skipz
	goto	u4955
	movf	(sprintf@width),w
	subwf	0+(??_sprintf+0)+0,w
u4955:

	skipnc
	goto	u4951
	goto	u4950
u4951:
	goto	l11485
u4950:
	line	1377
	
l11483:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	clrf	(??_sprintf+0)+0+1
	btfsc	(??_sprintf+0)+0,7
	decf	(??_sprintf+0)+0+1,f
	movf	0+(??_sprintf+0)+0,w
	subwf	(sprintf@width),f
	movf	1+(??_sprintf+0)+0,w
	skipc
	decf	(sprintf@width+1),f
	subwf	(sprintf@width+1),f
	goto	l11487
	line	1378
	
l6969:	
	line	1379
	
l11485:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l11487
	
l6970:	
	line	1423
	
l11487:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u4961
	goto	u4960
u4961:
	goto	l11495
u4960:
	goto	l11489
	line	1424
	
l6972:	
	line	1425
	
l11489:	
	movlw	(020h)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11491:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	1426
	
l11493:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	movf	(((sprintf@width+1))),w
	iorwf	(((sprintf@width))),w
	skipz
	goto	u4971
	goto	u4970
u4971:
	goto	l11489
u4970:
	goto	l11495
	
l6973:	
	goto	l11495
	
l6971:	
	line	1433
	
l11495:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u4981
	goto	u4980
u4981:
	goto	l11501
u4980:
	line	1434
	
l11497:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11499:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l11501
	
l6974:	
	line	1467
	
l11501:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	l11509
	
l6976:	
	line	1484
	
l11503:	
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
	
l11505:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11507:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l11509
	line	1517
	
l6975:	
	line	1469
	
l11509:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u4991
	goto	u4990
u4991:
	goto	l11503
u4990:
	goto	l11511
	
l6977:	
	goto	l11511
	line	1525
	
l6951:	
	line	540
	
l11511:	
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	u5001
	goto	u5000
u5001:
	goto	l11429
u5000:
	goto	l11513
	
l6978:	
	goto	l11513
	line	1527
	
l6959:	
	line	1530
	
l11513:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l6979
	line	1532
	
l11515:	
	line	1533
;	Return value of _sprintf is never used
	
l6979:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ADCconvert
psect	text1108,local,class=CODE,delta=2
global __ptext1108
__ptext1108:

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
psect	text1108
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	89
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [wreg+status,2+status,0+pclath+cstack]
	line	95
	
l11385:	
;infrared.c: 95: if (adcVal >= 213 && adcVal < 234)
	movlw	high(0D5h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4721
	goto	u4720
u4721:
	goto	l11391
u4720:
	
l11387:	
	movlw	high(0EAh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0EAh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4731
	goto	u4730
u4731:
	goto	l11391
u4730:
	line	97
	
l11389:	
;infrared.c: 96: {
;infrared.c: 97: IRdistance = 15 + ((20 - 15)*(234 - adcVal)) / (234 - 213);
	movlw	low(015h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwdiv)
	movlw	high(015h)
	movwf	((?___lwdiv))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	
l11391:	
;infrared.c: 99: else if (adcVal >= 170 && adcVal < 213)
	movlw	high(0AAh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4741
	goto	u4740
u4741:
	goto	l11397
u4740:
	
l11393:	
	movlw	high(0D5h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4751
	goto	u4750
u4751:
	goto	l11397
u4750:
	line	101
	
l11395:	
;infrared.c: 100: {
;infrared.c: 101: IRdistance = 20 + ((30 - 20)*(213 - adcVal)) / (213 - 170);
	movlw	low(02Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwdiv)
	movlw	high(02Bh)
	movwf	((?___lwdiv))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	
l11397:	
;infrared.c: 103: else if (adcVal >= 128 && adcVal < 170)
	movlw	high(080h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4761
	goto	u4760
u4761:
	goto	l11403
u4760:
	
l11399:	
	movlw	high(0AAh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4771
	goto	u4770
u4771:
	goto	l11403
u4770:
	line	105
	
l11401:	
;infrared.c: 104: {
;infrared.c: 105: IRdistance = 30 + ((40 - 30)*(170 - adcVal)) / (170 - 128);
	movlw	low(02Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwdiv)
	movlw	high(02Ah)
	movwf	((?___lwdiv))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	
l11403:	
;infrared.c: 107: else if (adcVal >= 107 && adcVal < 128)
	movlw	high(06Bh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4781
	goto	u4780
u4781:
	goto	l11409
u4780:
	
l11405:	
	movlw	high(080h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4791
	goto	u4790
u4791:
	goto	l11409
u4790:
	line	109
	
l11407:	
;infrared.c: 108: {
;infrared.c: 109: IRdistance = 40 + ((50 - 40)*(128 - adcVal)) / (128 - 107);
	movlw	low(015h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwdiv)
	movlw	high(015h)
	movwf	((?___lwdiv))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	
l11409:	
;infrared.c: 111: else if (adcVal >= 77 && adcVal < 107)
	movlw	high(04Dh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4801
	goto	u4800
u4801:
	goto	l11415
u4800:
	
l11411:	
	movlw	high(06Bh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4811
	goto	u4810
u4811:
	goto	l11415
u4810:
	line	113
	
l11413:	
;infrared.c: 112: {
;infrared.c: 113: IRdistance = 50 + ((60 - 50)*(107 - adcVal)) / (107 - 77);
	movlw	low(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwdiv)
	movlw	high(01Eh)
	movwf	((?___lwdiv))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	
l11415:	
;infrared.c: 115: else if (adcVal >= 56 && adcVal < 77)
	movlw	high(038h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4821
	goto	u4820
u4821:
	goto	l11421
u4820:
	
l11417:	
	movlw	high(04Dh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4831
	goto	u4830
u4831:
	goto	l11421
u4830:
	line	117
	
l11419:	
;infrared.c: 116: {
;infrared.c: 117: IRdistance = 60 + ((70 - 60)*(77 - adcVal)) / (77 - 56);
	movlw	low(015h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwdiv)
	movlw	high(015h)
	movwf	((?___lwdiv))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	
l11421:	
;infrared.c: 119: else if (adcVal >= 43 && adcVal < 56)
	movlw	high(02Bh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(02Bh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4841
	goto	u4840
u4841:
	goto	l3046
u4840:
	
l11423:	
	movlw	high(038h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4851
	goto	u4850
u4851:
	goto	l3046
u4850:
	line	121
	
l11425:	
;infrared.c: 120: {
;infrared.c: 121: IRdistance = 70 + ((80 - 70)*(56 - adcVal)) / (56 - 43);
	movlw	low(0Dh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwdiv)
	movlw	high(0Dh)
	movwf	((?___lwdiv))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
psect	text1109,local,class=CODE,delta=2
global __ptext1109
__ptext1109:

;; *************** function _rotate *****************
;; Defined at:
;;		line 67 in file "E:\Aldnoah.Zero\Assignment3\steppermotor.c"
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
;;		_Init_Follow_IR
;;		_calibrateIR
;;		_robotFollow
;;		_robot_turnRight
;; This function uses a non-reentrant model
;;
psect	text1109
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	67
	global	__size_of_rotate
	__size_of_rotate	equ	__end_of_rotate-_rotate
	
_rotate:	
	opt	stack 2
; Regs used in _rotate: [wreg+status,2+status,0+pclath+cstack]
	line	69
	
l11353:	
;steppermotor.c: 69: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	70
	
l11355:	
;steppermotor.c: 70: if (direction == 0)
	movf	(rotate@direction),f
	skipz
	goto	u4691
	goto	u4690
u4691:
	goto	l11359
u4690:
	line	71
	
l11357:	
;steppermotor.c: 71: spi_transfer(0b00001011);
	movlw	(0Bh)
	fcall	_spi_transfer
	goto	l11361
	line	72
	
l3749:	
	line	73
	
l11359:	
;steppermotor.c: 72: else
;steppermotor.c: 73: spi_transfer(0b00001001);
	movlw	(09h)
	fcall	_spi_transfer
	goto	l11361
	
l3750:	
	line	74
	
l11361:	
;steppermotor.c: 74: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11363:	
	bcf	(57/8),(57)&7
	line	75
	
l11365:	
;steppermotor.c: 75: for (unsigned int i = 0; i < numsteps; i++)
	clrf	(rotate@i)
	clrf	(rotate@i+1)
	goto	l3751
	line	76
	
l3752:	
	line	77
;steppermotor.c: 76: {
;steppermotor.c: 77: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	nop
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	78
	
l11367:	
;steppermotor.c: 78: if (direction)
	movf	(rotate@direction),w
	skipz
	goto	u4700
	goto	l11371
u4700:
	line	79
	
l11369:	
;steppermotor.c: 79: totalSteps++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_totalSteps)^080h,f
	skipnc
	incf	(_totalSteps+1)^080h,f
	movlw	high(01h)
	addwf	(_totalSteps+1)^080h,f
	goto	l3754
	line	80
	
l3753:	
	line	81
	
l11371:	
;steppermotor.c: 80: else
;steppermotor.c: 81: totalSteps--;
	movlw	low(-1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_totalSteps)^080h,f
	skipnc
	incf	(_totalSteps+1)^080h,f
	movlw	high(-1)
	addwf	(_totalSteps+1)^080h,f
	
l3754:	
	line	82
;steppermotor.c: 82: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_rotate+0)+0+1),f
	movlw	101
movwf	((??_rotate+0)+0),f
u5617:
	decfsz	((??_rotate+0)+0),f
	goto	u5617
	decfsz	((??_rotate+0)+0+1),f
	goto	u5617
	nop2
opt asmopt_on

	line	75
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
	goto	u4715
	movf	(rotate@numsteps),w
	subwf	(rotate@i),w
u4715:
	skipc
	goto	u4711
	goto	u4710
u4711:
	goto	l3752
u4710:
	
l3755:	
	line	84
;steppermotor.c: 83: }
;steppermotor.c: 84: RC0 = 1; RC1 = 1;;
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	85
	
l11373:	
;steppermotor.c: 85: spi_transfer(0b00000000);
	movlw	(0)
	fcall	_spi_transfer
	line	86
	
l11375:	
;steppermotor.c: 86: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11377:	
	bcf	(57/8),(57)&7
	line	87
	
l11379:	
;steppermotor.c: 87: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l11381:	
	nop
	
l11383:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	88
	
l3756:	
	return
	opt stack 0
GLOBAL	__end_of_rotate
	__end_of_rotate:
;; =============== function _rotate ends ============

	signat	_rotate,8312
	global	_RobotDrive
psect	text1110,local,class=CODE,delta=2
global __ptext1110
__ptext1110:

;; *************** function _RobotDrive *****************
;; Defined at:
;;		line 122 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  speed           2    9[BANK0 ] int 
;;  radius          2   11[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  radiushighBy    1   17[BANK0 ] unsigned char 
;;  radiuslowByt    1   16[BANK0 ] unsigned char 
;;  speedhighByt    1   15[BANK0 ] unsigned char 
;;  speedlowByte    1   14[BANK0 ] unsigned char 
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
psect	text1110
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	122
	global	__size_of_RobotDrive
	__size_of_RobotDrive	equ	__end_of_RobotDrive-_RobotDrive
	
_RobotDrive:	
	opt	stack 2
; Regs used in _RobotDrive: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	124
	
l11337:	
;robot.c: 124: unsigned char speedlowByte = (unsigned char)(speed);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speed),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@speedlowByte)
	line	125
	
l11339:	
;robot.c: 125: unsigned char speedhighByte = (unsigned char)(speed >> 8);
	movf	(RobotDrive@speed+1),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@speedhighByte)
	line	126
	
l11341:	
;robot.c: 126: unsigned char radiuslowByte = (unsigned char)(radius);
	movf	(RobotDrive@radius),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@radiuslowByte)
	line	127
;robot.c: 127: unsigned char radiushighByte = (unsigned char)(radius >> 8);
	movf	(RobotDrive@radius+1),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@radiushighByte)
	line	129
	
l11343:	
;robot.c: 129: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	131
	
l11345:	
;robot.c: 131: ser_putch(speedhighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speedhighByte),w
	fcall	_ser_putch
	line	133
	
l11347:	
;robot.c: 133: ser_putch(speedlowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speedlowByte),w
	fcall	_ser_putch
	line	135
	
l11349:	
;robot.c: 135: ser_putch(radiushighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@radiushighByte),w
	fcall	_ser_putch
	line	137
	
l11351:	
;robot.c: 137: ser_putch(radiuslowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@radiuslowByte),w
	fcall	_ser_putch
	line	138
	
l6106:	
	return
	opt stack 0
GLOBAL	__end_of_RobotDrive
	__end_of_RobotDrive:
;; =============== function _RobotDrive ends ============

	signat	_RobotDrive,8312
	global	_robotLoadSong
psect	text1111,local,class=CODE,delta=2
global __ptext1111
__ptext1111:

;; *************** function _robotLoadSong *****************
;; Defined at:
;;		line 548 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1111
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	548
	global	__size_of_robotLoadSong
	__size_of_robotLoadSong	equ	__end_of_robotLoadSong-_robotLoadSong
	
_robotLoadSong:	
	opt	stack 3
; Regs used in _robotLoadSong: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	549
	
l11335:	
;robot.c: 549: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	550
;robot.c: 550: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	551
;robot.c: 551: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	552
;robot.c: 552: ser_putch(72);
	movlw	(048h)
	fcall	_ser_putch
	line	553
;robot.c: 553: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	554
;robot.c: 554: ser_putch(84);
	movlw	(054h)
	fcall	_ser_putch
	line	555
;robot.c: 555: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	557
;robot.c: 557: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	558
;robot.c: 558: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	559
;robot.c: 559: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	560
;robot.c: 560: ser_putch(84);
	movlw	(054h)
	fcall	_ser_putch
	line	561
;robot.c: 561: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	562
;robot.c: 562: ser_putch(72);
	movlw	(048h)
	fcall	_ser_putch
	line	563
;robot.c: 563: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	564
	
l6206:	
	return
	opt stack 0
GLOBAL	__end_of_robotLoadSong
	__end_of_robotLoadSong:
;; =============== function _robotLoadSong ends ============

	signat	_robotLoadSong,88
	global	_robo_init
psect	text1112,local,class=CODE,delta=2
global __ptext1112
__ptext1112:

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
psect	text1112
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	42
	global	__size_of_robo_init
	__size_of_robo_init	equ	__end_of_robo_init-_robo_init
	
_robo_init:	
	opt	stack 2
; Regs used in _robo_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	43
	
l11333:	
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
	
l6093:	
	return
	opt stack 0
GLOBAL	__end_of_robo_init
	__end_of_robo_init:
;; =============== function _robo_init ends ============

	signat	_robo_init,88
	global	_lcd_write_data
psect	text1113,local,class=CODE,delta=2
global __ptext1113
__ptext1113:

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
psect	text1113
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
	
l11325:	
;lcd.c: 31: RE2 = 0;
	bcf	(74/8),(74)&7
	line	32
;lcd.c: 32: RE1 = 0;
	bcf	(73/8),(73)&7
	line	33
;lcd.c: 33: RE0 = 1;
	bsf	(72/8),(72)&7
	line	34
	
l11327:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
l11329:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
l11331:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u5627:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u5627
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u5627
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
psect	text1114,local,class=CODE,delta=2
global __ptext1114
__ptext1114:

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
psect	text1114
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
	
l11317:	
;lcd.c: 19: RE2 = 0;
	bcf	(74/8),(74)&7
	line	20
;lcd.c: 20: RE1 = 0;
	bcf	(73/8),(73)&7
	line	21
;lcd.c: 21: RE0 = 0;
	bcf	(72/8),(72)&7
	line	22
	
l11319:	
;lcd.c: 22: PORTD = databyte;
	movf	(lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
l11321:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l11323:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??_lcd_write_control+0)+0),f
u5637:
	decfsz	((??_lcd_write_control+0)+0),f
	goto	u5637
	decfsz	((??_lcd_write_control+0)+0+1),f
	goto	u5637
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
psect	text1115,local,class=CODE,delta=2
global __ptext1115
__ptext1115:

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
psect	text1115
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 3
; Regs used in _init_adc: [wreg+status,2]
	line	63
	
l11307:	
;adc.c: 63: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	64
	
l11309:	
;adc.c: 64: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	67
	
l11311:	
;adc.c: 67: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	68
	
l11313:	
;adc.c: 68: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	70
	
l11315:	
;adc.c: 70: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_init_adc+0)+0,f
u5647:
decfsz	(??_init_adc+0)+0,f
	goto	u5647
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
psect	text1116,local,class=CODE,delta=2
global __ptext1116
__ptext1116:

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
psect	text1116
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
	
l11291:	
;adc.c: 21: switch(channel)
	goto	l11299
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
	goto	l11301
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
	goto	l11301
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
	goto	l11301
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
	goto	l11301
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
	goto	l11301
	line	50
;adc.c: 50: default:
	
l696:	
	line	51
	
l11293:	
;adc.c: 51: return 0;
	movlw	(0)
	goto	l697
	
l11295:	
	goto	l697
	line	52
	
l11297:	
;adc.c: 52: }
	goto	l11301
	line	21
	
l689:	
	
l11299:	
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
	goto	l11293
	opt asmopt_on

	line	52
	
l691:	
	line	54
	
l11301:	
;adc.c: 54: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u5657:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u5657
opt asmopt_on

	line	56
	
l11303:	
;adc.c: 56: return adc_read();
	fcall	_adc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_adc_read)),w
	goto	l697
	
l11305:	
	line	58
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
psect	text1117,local,class=CODE,delta=2
global __ptext1117
__ptext1117:

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
psect	text1117
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l11235:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u4541
	goto	u4540
u4541:
	goto	l11239
u4540:
	line	10
	
l11237:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l11239
	line	12
	
l7875:	
	line	13
	
l11239:	
	btfss	(___awmod@divisor+1),7
	goto	u4551
	goto	u4550
u4551:
	goto	l11243
u4550:
	line	14
	
l11241:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l11243
	
l7876:	
	line	15
	
l11243:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u4561
	goto	u4560
u4561:
	goto	l11261
u4560:
	line	16
	
l11245:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l11251
	
l7879:	
	line	18
	
l11247:	
	movlw	01h
	
u4575:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4575
	line	19
	
l11249:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l11251
	line	20
	
l7878:	
	line	17
	
l11251:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u4581
	goto	u4580
u4581:
	goto	l11247
u4580:
	goto	l11253
	
l7880:	
	goto	l11253
	line	21
	
l7881:	
	line	22
	
l11253:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u4595
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u4595:
	skipc
	goto	u4591
	goto	u4590
u4591:
	goto	l11257
u4590:
	line	23
	
l11255:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l11257
	
l7882:	
	line	24
	
l11257:	
	movlw	01h
	
u4605:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u4605
	line	25
	
l11259:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u4611
	goto	u4610
u4611:
	goto	l11253
u4610:
	goto	l11261
	
l7883:	
	goto	l11261
	line	26
	
l7877:	
	line	27
	
l11261:	
	movf	(___awmod@sign),w
	skipz
	goto	u4620
	goto	l11265
u4620:
	line	28
	
l11263:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l11265
	
l7884:	
	line	29
	
l11265:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l7885
	
l11267:	
	line	30
	
l7885:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text1118,local,class=CODE,delta=2
global __ptext1118
__ptext1118:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] int 
;;  dividend        2    2[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[BANK0 ] int 
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
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_UpdateDisplay
;;		_robot_turnRight
;; This function uses a non-reentrant model
;;
psect	text1118
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 2
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l11195:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u4441
	goto	u4440
u4441:
	goto	l11199
u4440:
	line	11
	
l11197:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l11199
	line	13
	
l7807:	
	line	14
	
l11199:	
	btfss	(___awdiv@dividend+1),7
	goto	u4451
	goto	u4450
u4451:
	goto	l11205
u4450:
	line	15
	
l11201:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l11203:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l11205
	line	17
	
l7808:	
	line	18
	
l11205:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l11207:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u4461
	goto	u4460
u4461:
	goto	l11227
u4460:
	line	20
	
l11209:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l11215
	
l7811:	
	line	22
	
l11211:	
	movlw	01h
	
u4475:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u4475
	line	23
	
l11213:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l11215
	line	24
	
l7810:	
	line	21
	
l11215:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u4481
	goto	u4480
u4481:
	goto	l11211
u4480:
	goto	l11217
	
l7812:	
	goto	l11217
	line	25
	
l7813:	
	line	26
	
l11217:	
	movlw	01h
	
u4495:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u4495
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u4505
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u4505:
	skipc
	goto	u4501
	goto	u4500
u4501:
	goto	l11223
u4500:
	line	28
	
l11219:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l11221:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l11223
	line	30
	
l7814:	
	line	31
	
l11223:	
	movlw	01h
	
u4515:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u4515
	line	32
	
l11225:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u4521
	goto	u4520
u4521:
	goto	l11217
u4520:
	goto	l11227
	
l7815:	
	goto	l11227
	line	33
	
l7809:	
	line	34
	
l11227:	
	movf	(___awdiv@sign),w
	skipz
	goto	u4530
	goto	l11231
u4530:
	line	35
	
l11229:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l11231
	
l7816:	
	line	36
	
l11231:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l7817
	
l11233:	
	line	37
	
l7817:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___lwmod
psect	text1119,local,class=CODE,delta=2
global __ptext1119
__ptext1119:

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
psect	text1119
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l11173:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u4381
	goto	u4380
u4381:
	goto	l11191
u4380:
	line	9
	
l11175:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l11181
	
l7685:	
	line	11
	
l11177:	
	movlw	01h
	
u4395:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4395
	line	12
	
l11179:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l11181
	line	13
	
l7684:	
	line	10
	
l11181:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u4401
	goto	u4400
u4401:
	goto	l11177
u4400:
	goto	l11183
	
l7686:	
	goto	l11183
	line	14
	
l7687:	
	line	15
	
l11183:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u4415
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u4415:
	skipc
	goto	u4411
	goto	u4410
u4411:
	goto	l11187
u4410:
	line	16
	
l11185:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l11187
	
l7688:	
	line	17
	
l11187:	
	movlw	01h
	
u4425:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u4425
	line	18
	
l11189:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u4431
	goto	u4430
u4431:
	goto	l11183
u4430:
	goto	l11191
	
l7689:	
	goto	l11191
	line	19
	
l7683:	
	line	20
	
l11191:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l7690
	
l11193:	
	line	21
	
l7690:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text1120,local,class=CODE,delta=2
global __ptext1120
__ptext1120:

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
psect	text1120
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l11147:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l11149:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u4311
	goto	u4310
u4311:
	goto	l11169
u4310:
	line	11
	
l11151:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l11157
	
l7675:	
	line	13
	
l11153:	
	movlw	01h
	
u4325:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u4325
	line	14
	
l11155:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l11157
	line	15
	
l7674:	
	line	12
	
l11157:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u4331
	goto	u4330
u4331:
	goto	l11153
u4330:
	goto	l11159
	
l7676:	
	goto	l11159
	line	16
	
l7677:	
	line	17
	
l11159:	
	movlw	01h
	
u4345:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u4345
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u4355
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u4355:
	skipc
	goto	u4351
	goto	u4350
u4351:
	goto	l11165
u4350:
	line	19
	
l11161:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l11163:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l11165
	line	21
	
l7678:	
	line	22
	
l11165:	
	movlw	01h
	
u4365:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u4365
	line	23
	
l11167:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u4371
	goto	u4370
u4371:
	goto	l11159
u4370:
	goto	l11169
	
l7679:	
	goto	l11169
	line	24
	
l7673:	
	line	25
	
l11169:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l7680
	
l11171:	
	line	26
	
l7680:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text1121,local,class=CODE,delta=2
global __ptext1121
__ptext1121:

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
;;		_abs
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text1121
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 1
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l11135:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l11137
	line	6
	
l7667:	
	line	7
	
l11137:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u4271
	goto	u4270
u4271:
	goto	l7668
u4270:
	line	8
	
l11139:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l7668:	
	line	9
	movlw	01h
	
u4285:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u4285
	line	10
	
l11141:	
	movlw	01h
	
u4295:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u4295
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u4301
	goto	u4300
u4301:
	goto	l11137
u4300:
	goto	l11143
	
l7669:	
	line	12
	
l11143:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l7670
	
l11145:	
	line	13
	
l7670:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_isdigit
psect	text1122,local,class=CODE,delta=2
global __ptext1122
__ptext1122:

;; *************** function _isdigit *****************
;; Defined at:
;;		line 13 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\isdigit.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    1[BANK0 ] unsigned char 
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
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text1122
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\isdigit.c"
	global	__size_of_isdigit
	__size_of_isdigit	equ	__end_of_isdigit-_isdigit
	
_isdigit:	
	opt	stack 1
; Regs used in _isdigit: [wreg+status,2+status,0]
;isdigit@c stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(isdigit@c)
	line	14
	
l11123:	
	clrf	(_isdigit$8644)
	
l11125:	
	movlw	(03Ah)
	subwf	(isdigit@c),w
	skipnc
	goto	u4251
	goto	u4250
u4251:
	goto	l11131
u4250:
	
l11127:	
	movlw	(030h)
	subwf	(isdigit@c),w
	skipc
	goto	u4261
	goto	u4260
u4261:
	goto	l11131
u4260:
	
l11129:	
	clrf	(_isdigit$8644)
	bsf	status,0
	rlf	(_isdigit$8644),f
	goto	l11131
	
l7657:	
	
l11131:	
	rrf	(_isdigit$8644),w
	
	goto	l7658
	
l11133:	
	line	15
	
l7658:	
	return
	opt stack 0
GLOBAL	__end_of_isdigit
	__end_of_isdigit:
;; =============== function _isdigit ends ============

	signat	_isdigit,4216
	global	_ser_isrx
psect	text1123,local,class=CODE,delta=2
global __ptext1123
__ptext1123:

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
psect	text1123
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	45
	global	__size_of_ser_isrx
	__size_of_ser_isrx	equ	__end_of_ser_isrx-_ser_isrx
	
_ser_isrx:	
	opt	stack 1
; Regs used in _ser_isrx: [wreg+status,2+status,0]
	line	46
	
l11075:	
;ser.c: 46: if(OERR) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(193/8),(193)&7
	goto	u4181
	goto	u4180
u4181:
	goto	l11083
u4180:
	line	47
	
l11077:	
;ser.c: 47: CREN = 0;
	bcf	(196/8),(196)&7
	line	48
;ser.c: 48: CREN = 1;
	bsf	(196/8),(196)&7
	line	49
	
l11079:	
;ser.c: 49: return 0;
	clrc
	
	goto	l6906
	
l11081:	
	goto	l6906
	line	50
	
l6905:	
	line	51
	
l11083:	
;ser.c: 50: }
;ser.c: 51: return (rxiptr!=rxoptr);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_rxiptr)^080h,w	;volatile
	xorwf	(_rxoptr)^080h,w	;volatile
	skipz
	goto	u4191
	goto	u4190
u4191:
	goto	l11087
u4190:
	
l11085:	
	clrc
	
	goto	l6906
	
l10833:	
	
l11087:	
	setc
	
	goto	l6906
	
l10835:	
	goto	l6906
	
l11089:	
	line	52
	
l6906:	
	return
	opt stack 0
GLOBAL	__end_of_ser_isrx
	__end_of_ser_isrx:
;; =============== function _ser_isrx ends ============

	signat	_ser_isrx,88
	global	_spi_transfer
psect	text1124,local,class=CODE,delta=2
global __ptext1124
__ptext1124:

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
psect	text1124
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	50
	global	__size_of_spi_transfer
	__size_of_spi_transfer	equ	__end_of_spi_transfer-_spi_transfer
	
_spi_transfer:	
	opt	stack 2
; Regs used in _spi_transfer: [wreg]
;spi_transfer@data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(spi_transfer@data)
	line	51
	
l11023:	
;steppermotor.c: 51: unsigned char temp = 0;
	clrf	(spi_transfer@temp)
	line	53
;steppermotor.c: 53: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	54
	
l11025:	
;steppermotor.c: 54: SSPBUF = data;
	movf	(spi_transfer@data),w
	movwf	(19)	;volatile
	line	56
;steppermotor.c: 56: while (SSPIF == 0);
	goto	l3743
	
l3744:	
	
l3743:	
	btfss	(99/8),(99)&7
	goto	u4021
	goto	u4020
u4021:
	goto	l3743
u4020:
	goto	l11027
	
l3745:	
	line	57
	
l11027:	
;steppermotor.c: 57: temp = SSPBUF;
	movf	(19),w	;volatile
	movwf	(??_spi_transfer+0)+0
	movf	(??_spi_transfer+0)+0,w
	movwf	(spi_transfer@temp)
	line	58
	
l11029:	
;steppermotor.c: 58: SSPIF = 0;
	bcf	(99/8),(99)&7
	goto	l3746
	line	60
	
l11031:	
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
psect	text1125,local,class=CODE,delta=2
global __ptext1125
__ptext1125:

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
;;		_RobotBattRead
;;		_robotLoadSong
;;		_ser_puts
;;		_ser_puts2
;;		_ser_puthex
;; This function uses a non-reentrant model
;;
psect	text1125
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
	
l11011:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l11013
	
l6916:	
	line	72
;ser.c: 72: continue;
	goto	l11013
	
l6915:	
	line	71
	
l11013:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_txiptr)^080h,w	;volatile
	addlw	01h
	andlw	0Fh
	xorwf	(_txoptr)^080h,w	;volatile
	skipnz
	goto	u4011
	goto	u4010
u4011:
	goto	l11013
u4010:
	
l6917:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l11015:	
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
	
l11017:	
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
	
l11019:	
;ser.c: 76: TXIE=1;
	bsf	(1124/8)^080h,(1124)&7
	line	77
	
l11021:	
;ser.c: 77: GIE=1;
	bsf	(95/8),(95)&7
	line	78
	
l6918:	
	return
	opt stack 0
GLOBAL	__end_of_ser_putch
	__end_of_ser_putch:
;; =============== function _ser_putch ends ============

	signat	_ser_putch,4216
	global	_Menu
psect	text1126,local,class=CODE,delta=2
global __ptext1126
__ptext1126:

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
psect	text1126
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
	
l10987:	
;HMI.c: 202: switch (BTN_input)
	goto	l11005
	line	204
;HMI.c: 203: {
;HMI.c: 204: case 1:
	
l4566:	
	line	206
;HMI.c: 206: break;
	goto	l11007
	line	207
;HMI.c: 207: case 2:
	
l4568:	
	line	209
;HMI.c: 209: break;
	goto	l11007
	line	210
;HMI.c: 210: case 3:
	
l4569:	
	line	211
	
l10989:	
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
	
l10991:	
;HMI.c: 212: if (pos < 0)
	btfss	(_pos+1)^080h,7
	goto	u3991
	goto	u3990
u3991:
	goto	l11007
u3990:
	line	213
	
l10993:	
;HMI.c: 213: pos = 6 - 1;
	movlw	low(05h)
	movwf	(_pos)^080h
	movlw	high(05h)
	movwf	((_pos)^080h)+1
	goto	l11007
	
l4570:	
	line	215
;HMI.c: 215: break;
	goto	l11007
	line	216
;HMI.c: 216: case 4:
	
l4571:	
	line	217
	
l10995:	
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
	goto	u4001
	goto	u4000
u4001:
	goto	l11007
u4000:
	line	219
	
l10997:	
;HMI.c: 219: pos = 0;
	clrf	(_pos)^080h
	clrf	(_pos+1)^080h
	goto	l11007
	
l4572:	
	line	221
;HMI.c: 221: break;
	goto	l11007
	line	222
;HMI.c: 222: case 5:
	
l4573:	
	line	223
	
l10999:	
;HMI.c: 223: return pos;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	goto	l4574
	
l11001:	
	goto	l4574
	line	226
;HMI.c: 226: default:
	
l4575:	
	line	228
;HMI.c: 228: break;
	goto	l11007
	line	229
	
l11003:	
;HMI.c: 229: }
	goto	l11007
	line	202
	
l4565:	
	
l11005:	
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
	goto	l11007
	xorlw	2^1	; case 2
	skipnz
	goto	l11007
	xorlw	3^2	; case 3
	skipnz
	goto	l10989
	xorlw	4^3	; case 4
	skipnz
	goto	l10995
	xorlw	5^4	; case 5
	skipnz
	goto	l10999
	goto	l11007
	opt asmopt_on

	line	229
	
l4567:	
	line	230
	
l11007:	
;HMI.c: 230: return 255;
	movlw	(0FFh)
	goto	l4574
	
l11009:	
	line	231
	
l4574:	
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4217
	global	_ser_init
psect	text1127,local,class=CODE,delta=2
global __ptext1127
__ptext1127:

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
psect	text1127
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 3
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l10961:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l10963:	
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
	
l10965:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l10967:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l10969:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l10971:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l10973:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l10975:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l10977:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l10979:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l10981:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l10983:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l10985:	
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
	
l6940:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_adc_read
psect	text1128,local,class=CODE,delta=2
global __ptext1128
__ptext1128:

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
psect	text1128
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	76
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	79
	
l10841:	
;adc.c: 77: volatile unsigned int adc_value;
;adc.c: 79: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	81
	
l10843:	
;adc.c: 81: GO = 1;
	bsf	(250/8),(250)&7
	line	82
;adc.c: 82: while(GO) continue;
	goto	l703
	
l704:	
	
l703:	
	btfsc	(250/8),(250)&7
	goto	u3801
	goto	u3800
u3801:
	goto	l703
u3800:
	
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
psect	text1128
	line	88
	
l10845:	
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
	
u3815:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u3815
	line	90
;adc.c: 90: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	93
	
l10847:	
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
	
l10849:	
	line	94
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
	global	_isr1
psect	text1129,local,class=CODE,delta=2
global __ptext1129
__ptext1129:

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
psect	text1129
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
psect	text1129
	line	108
	
i1l10877:	
;Main.c: 108: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u385_21
	goto	u385_20
u385_21:
	goto	i1l10899
u385_20:
	line	110
	
i1l10879:	
;Main.c: 109: {
;Main.c: 110: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	111
	
i1l10881:	
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
	
i1l10883:	
;Main.c: 116: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	117
	
i1l10885:	
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
	goto	u386_21
	goto	u386_20
u386_21:
	goto	i1l10889
u386_20:
	line	119
	
i1l10887:	
;Main.c: 118: {
;Main.c: 119: RTC_FLAG_250MS = 1;
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l10889
	line	120
	
i1l2241:	
	line	121
	
i1l10889:	
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
	goto	u387_21
	goto	u387_20
u387_21:
	goto	i1l10895
u387_20:
	line	123
	
i1l10891:	
;Main.c: 122: {
;Main.c: 123: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	124
	
i1l10893:	
;Main.c: 124: RB0 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l10895
	line	125
	
i1l2242:	
	line	126
	
i1l10895:	
;Main.c: 125: }
;Main.c: 126: if (buttonPressed == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_buttonPressed)^080h,f
	skipz	;volatile
	goto	u388_21
	goto	u388_20
u388_21:
	goto	i1l10899
u388_20:
	line	128
	
i1l10897:	
;Main.c: 127: {
;Main.c: 128: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_buttonPressed)^080h	;volatile
	goto	i1l10899
	line	129
	
i1l2243:	
	goto	i1l10899
	line	130
	
i1l2240:	
	line	131
	
i1l10899:	
;Main.c: 129: }
;Main.c: 130: }
;Main.c: 131: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	bcf	status, 5	;RP0=0, select bank0
	btfss	(101/8),(101)&7
	goto	u389_21
	goto	u389_20
u389_21:
	goto	i1l10909
u389_20:
	
i1l10901:	
	movf	(26),w	;volatile
	movwf	(??_isr1+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_rxiptr)^080h,w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	movf	(??_isr1+0)+0,w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	
i1l10903:	
	movf	(_rxiptr)^080h,w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_ser_tmp)^080h
	
i1l10905:	
	movf	(_ser_tmp)^080h,w
	xorwf	(_rxoptr)^080h,w	;volatile
	skipnz
	goto	u390_21
	goto	u390_20
u390_21:
	goto	i1l10909
u390_20:
	
i1l10907:	
	movf	(_ser_tmp)^080h,w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)^080h	;volatile
	goto	i1l10909
	
i1l2245:	
	goto	i1l10909
	
i1l2244:	
	
i1l10909:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(100/8),(100)&7
	goto	u391_21
	goto	u391_20
u391_21:
	goto	i1l2248
u391_20:
	
i1l10911:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l2248
u392_20:
	
i1l10913:	
	movf	(_txoptr)^080h,w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	
i1l10915:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_txoptr)^080h,f	;volatile
	
i1l10917:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr)^080h,f	;volatile
	
i1l10919:	
	movf	(_txoptr)^080h,w	;volatile
	xorwf	(_txiptr)^080h,w	;volatile
	skipz
	goto	u393_21
	goto	u393_20
u393_21:
	goto	i1l2248
u393_20:
	
i1l10921:	
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2248
	
i1l2247:	
	goto	i1l2248
	
i1l2246:	
	line	132
	
i1l2248:	
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
psect	text1130,local,class=CODE,delta=2
global __ptext1130
__ptext1130:

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
psect	text1130
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	159
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 0
; Regs used in _ReadButtons: [wreg+status,2+status,0+pclath+cstack]
	line	161
	
i1l10923:	
;HMI.c: 161: Debounce();
	fcall	_Debounce
	line	163
	
i1l10925:	
;HMI.c: 163: if(UpPressed)
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u394_21
	goto	u394_20
u394_21:
	goto	i1l4557
u394_20:
	line	165
	
i1l10927:	
;HMI.c: 164: {
;HMI.c: 165: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	166
	
i1l10929:	
;HMI.c: 166: return 1;
	movlw	(01h)
	goto	i1l4558
	
i1l10931:	
	goto	i1l4558
	line	168
	
i1l4557:	
	line	170
;HMI.c: 168: }
;HMI.c: 170: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u395_21
	goto	u395_20
u395_21:
	goto	i1l4559
u395_20:
	line	172
	
i1l10933:	
;HMI.c: 171: {
;HMI.c: 172: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	173
	
i1l10935:	
;HMI.c: 173: return 2;
	movlw	(02h)
	goto	i1l4558
	
i1l10937:	
	goto	i1l4558
	line	175
	
i1l4559:	
	line	176
;HMI.c: 175: }
;HMI.c: 176: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u396_21
	goto	u396_20
u396_21:
	goto	i1l4560
u396_20:
	line	178
	
i1l10939:	
;HMI.c: 177: {
;HMI.c: 178: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	179
	
i1l10941:	
;HMI.c: 179: return 3;
	movlw	(03h)
	goto	i1l4558
	
i1l10943:	
	goto	i1l4558
	line	181
	
i1l4560:	
	line	182
;HMI.c: 181: }
;HMI.c: 182: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u397_21
	goto	u397_20
u397_21:
	goto	i1l4561
u397_20:
	line	184
	
i1l10945:	
;HMI.c: 183: {
;HMI.c: 184: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	185
	
i1l10947:	
;HMI.c: 185: return 4;
	movlw	(04h)
	goto	i1l4558
	
i1l10949:	
	goto	i1l4558
	line	187
	
i1l4561:	
	line	189
;HMI.c: 187: }
;HMI.c: 189: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u398_21
	goto	u398_20
u398_21:
	goto	i1l10957
u398_20:
	line	191
	
i1l10951:	
;HMI.c: 190: {
;HMI.c: 191: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	192
	
i1l10953:	
;HMI.c: 192: return 5;
	movlw	(05h)
	goto	i1l4558
	
i1l10955:	
	goto	i1l4558
	line	194
	
i1l4562:	
	line	195
	
i1l10957:	
;HMI.c: 194: }
;HMI.c: 195: return 0;
	movlw	(0)
	goto	i1l4558
	
i1l10959:	
	line	196
	
i1l4558:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
	global	i1___lwmod
psect	text1131,local,class=CODE,delta=2
global __ptext1131
__ptext1131:

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
psect	text1131
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_ofi1___lwmod
	__size_ofi1___lwmod	equ	__end_ofi1___lwmod-i1___lwmod
	
i1___lwmod:	
	opt	stack 1
; Regs used in i1___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l11269:	
	movf	(i1___lwmod@divisor+1),w
	iorwf	(i1___lwmod@divisor),w
	skipnz
	goto	u463_21
	goto	u463_20
u463_21:
	goto	i1l11287
u463_20:
	line	9
	
i1l11271:	
	clrf	(i1___lwmod@counter)
	bsf	status,0
	rlf	(i1___lwmod@counter),f
	line	10
	goto	i1l11277
	
i1l7685:	
	line	11
	
i1l11273:	
	movlw	01h
	
u464_25:
	clrc
	rlf	(i1___lwmod@divisor),f
	rlf	(i1___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u464_25
	line	12
	
i1l11275:	
	movlw	(01h)
	movwf	(??i1___lwmod+0)+0
	movf	(??i1___lwmod+0)+0,w
	addwf	(i1___lwmod@counter),f
	goto	i1l11277
	line	13
	
i1l7684:	
	line	10
	
i1l11277:	
	btfss	(i1___lwmod@divisor+1),(15)&7
	goto	u465_21
	goto	u465_20
u465_21:
	goto	i1l11273
u465_20:
	goto	i1l11279
	
i1l7686:	
	goto	i1l11279
	line	14
	
i1l7687:	
	line	15
	
i1l11279:	
	movf	(i1___lwmod@divisor+1),w
	subwf	(i1___lwmod@dividend+1),w
	skipz
	goto	u466_25
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),w
u466_25:
	skipc
	goto	u466_21
	goto	u466_20
u466_21:
	goto	i1l11283
u466_20:
	line	16
	
i1l11281:	
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),f
	movf	(i1___lwmod@divisor+1),w
	skipc
	decf	(i1___lwmod@dividend+1),f
	subwf	(i1___lwmod@dividend+1),f
	goto	i1l11283
	
i1l7688:	
	line	17
	
i1l11283:	
	movlw	01h
	
u467_25:
	clrc
	rrf	(i1___lwmod@divisor+1),f
	rrf	(i1___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u467_25
	line	18
	
i1l11285:	
	movlw	low(01h)
	subwf	(i1___lwmod@counter),f
	btfss	status,2
	goto	u468_21
	goto	u468_20
u468_21:
	goto	i1l11279
u468_20:
	goto	i1l11287
	
i1l7689:	
	goto	i1l11287
	line	19
	
i1l7683:	
	line	20
	
i1l11287:	
	movf	(i1___lwmod@dividend+1),w
	clrf	(?i1___lwmod+1)
	addwf	(?i1___lwmod+1)
	movf	(i1___lwmod@dividend),w
	clrf	(?i1___lwmod)
	addwf	(?i1___lwmod)

	goto	i1l7690
	
i1l11289:	
	line	21
	
i1l7690:	
	return
	opt stack 0
GLOBAL	__end_ofi1___lwmod
	__end_ofi1___lwmod:
;; =============== function i1___lwmod ends ============

	signat	i1___lwmod,90
	global	_Debounce
psect	text1132,local,class=CODE,delta=2
global __ptext1132
__ptext1132:

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
psect	text1132
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	77
	global	__size_of_Debounce
	__size_of_Debounce	equ	__end_of_Debounce-_Debounce
	
_Debounce:	
	opt	stack 0
; Regs used in _Debounce: [wreg+status,2+status,0]
	line	79
	
i1l11033:	
;HMI.c: 79: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u403_21
	goto	u403_20
u403_21:
	goto	i1l4539
u403_20:
	line	81
	
i1l11035:	
;HMI.c: 80: {
;HMI.c: 81: UpDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_UpDebounceCount)^080h,f	;volatile
	line	82
	
i1l11037:	
;HMI.c: 82: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount)^080h,w	;volatile
	skipc
	goto	u404_21
	goto	u404_20
u404_21:
	goto	i1l4541
u404_20:
	
i1l11039:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u405_21
	goto	u405_20
u405_21:
	goto	i1l4541
u405_20:
	line	84
	
i1l11041:	
;HMI.c: 83: {
;HMI.c: 84: UpPressed = 1;
	bsf	(_UpPressed/8),(_UpPressed)&7
	line	85
;HMI.c: 85: UpReleased = 0;
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l4541
	line	86
	
i1l4540:	
	line	87
;HMI.c: 86: }
;HMI.c: 87: }
	goto	i1l4541
	line	88
	
i1l4539:	
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
	
i1l4541:	
	line	95
;HMI.c: 92: }
;HMI.c: 95: if(!RB3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(51/8),(51)&7
	goto	u406_21
	goto	u406_20
u406_21:
	goto	i1l4542
u406_20:
	line	97
	
i1l11043:	
;HMI.c: 96: {
;HMI.c: 97: DownDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_DownDebounceCount)^080h,f	;volatile
	line	98
	
i1l11045:	
;HMI.c: 98: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount)^080h,w	;volatile
	skipc
	goto	u407_21
	goto	u407_20
u407_21:
	goto	i1l4544
u407_20:
	
i1l11047:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u408_21
	goto	u408_20
u408_21:
	goto	i1l4544
u408_20:
	line	100
	
i1l11049:	
;HMI.c: 99: {
;HMI.c: 100: DownPressed = 1;
	bsf	(_DownPressed/8),(_DownPressed)&7
	line	101
;HMI.c: 101: DownReleased = 0;
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l4544
	line	102
	
i1l4543:	
	line	103
;HMI.c: 102: }
;HMI.c: 103: }
	goto	i1l4544
	line	104
	
i1l4542:	
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
	
i1l4544:	
	line	110
;HMI.c: 108: }
;HMI.c: 110: if(!RB4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(52/8),(52)&7
	goto	u409_21
	goto	u409_20
u409_21:
	goto	i1l4545
u409_20:
	line	112
	
i1l11051:	
;HMI.c: 111: {
;HMI.c: 112: LeftDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_LeftDebounceCount)^080h,f	;volatile
	line	113
	
i1l11053:	
;HMI.c: 113: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount)^080h,w	;volatile
	skipc
	goto	u410_21
	goto	u410_20
u410_21:
	goto	i1l4547
u410_20:
	
i1l11055:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l4547
u411_20:
	line	115
	
i1l11057:	
;HMI.c: 114: {
;HMI.c: 115: LeftPressed = 1;
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	line	116
;HMI.c: 116: LeftReleased = 0;
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l4547
	line	117
	
i1l4546:	
	line	118
;HMI.c: 117: }
;HMI.c: 118: }
	goto	i1l4547
	line	119
	
i1l4545:	
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
	
i1l4547:	
	line	125
;HMI.c: 123: }
;HMI.c: 125: if(!RB5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u412_21
	goto	u412_20
u412_21:
	goto	i1l4548
u412_20:
	line	127
	
i1l11059:	
;HMI.c: 126: {
;HMI.c: 127: RightDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RightDebounceCount)^080h,f	;volatile
	line	128
	
i1l11061:	
;HMI.c: 128: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount)^080h,w	;volatile
	skipc
	goto	u413_21
	goto	u413_20
u413_21:
	goto	i1l4550
u413_20:
	
i1l11063:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u414_21
	goto	u414_20
u414_21:
	goto	i1l4550
u414_20:
	line	130
	
i1l11065:	
;HMI.c: 129: {
;HMI.c: 130: RightPressed = 1;
	bsf	(_RightPressed/8),(_RightPressed)&7
	line	131
;HMI.c: 131: RightReleased = 0;
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l4550
	line	132
	
i1l4549:	
	line	133
;HMI.c: 132: }
;HMI.c: 133: }
	goto	i1l4550
	line	134
	
i1l4548:	
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
	
i1l4550:	
	line	140
;HMI.c: 138: }
;HMI.c: 140: if(!RB6)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u415_21
	goto	u415_20
u415_21:
	goto	i1l4551
u415_20:
	line	142
	
i1l11067:	
;HMI.c: 141: {
;HMI.c: 142: CenterDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_CenterDebounceCount)^080h,f	;volatile
	line	143
	
i1l11069:	
;HMI.c: 143: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount)^080h,w	;volatile
	skipc
	goto	u416_21
	goto	u416_20
u416_21:
	goto	i1l4554
u416_20:
	
i1l11071:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u417_21
	goto	u417_20
u417_21:
	goto	i1l4554
u417_20:
	line	145
	
i1l11073:	
;HMI.c: 144: {
;HMI.c: 145: CenterPressed = 1;
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	line	146
;HMI.c: 146: CenterReleased = 0;
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l4554
	line	147
	
i1l4552:	
	line	148
;HMI.c: 147: }
;HMI.c: 148: }
	goto	i1l4554
	line	149
	
i1l4551:	
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
	goto	i1l4554
	line	153
	
i1l4553:	
	line	154
	
i1l4554:	
	return
	opt stack 0
GLOBAL	__end_of_Debounce
	__end_of_Debounce:
;; =============== function _Debounce ends ============

	signat	_Debounce,88
psect	text1133,local,class=CODE,delta=2
global __ptext1133
__ptext1133:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
