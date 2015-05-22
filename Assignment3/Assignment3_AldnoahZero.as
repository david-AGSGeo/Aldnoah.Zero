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
	FNCALL	_main,_FindVictim
	FNCALL	_main,_GoHome
	FNCALL	_main,_ChargeMode
	FNCALL	_GoHome,_robotTurnSpeed
	FNCALL	_GoHome,_robot_turnArc
	FNCALL	_GoHome,_readAvgDistance
	FNCALL	_GoHome,_robotFollow
	FNCALL	_GoHome,_robot_turnInPlace
	FNCALL	_GoHome,_rotate
	FNCALL	_GoHome,_robotMoveSpeed
	FNCALL	_FindVictim,_readAvgDistance
	FNCALL	_FindVictim,_robotFollow
	FNCALL	_FindVictim,_RobotDrive
	FNCALL	_FindVictim,_robotTurnSpeed
	FNCALL	_FindVictim,_robotMoveSpeed
	FNCALL	_FindVictim,_ser_putch
	FNCALL	_FindVictim,_robot_turnInPlace
	FNCALL	_FindVictim,_robot_turnArc
	FNCALL	_robot_turnInPlace,_robotTurnSpeed
	FNCALL	_Init_Follow_IR,_calibrateIR
	FNCALL	_Init_Follow_IR,_rotate
	FNCALL	_robotMoveSpeed,_RobotDrive
	FNCALL	_robotMoveSpeed,_robot_read
	FNCALL	_robotMoveSpeed,_UpdateDisplay
	FNCALL	_robotMoveSpeed,_abs
	FNCALL	_robotFollow,_RobotDrive
	FNCALL	_robotFollow,_ser_putch
	FNCALL	_robotFollow,_readAvgDistance
	FNCALL	_robotFollow,_rotate
	FNCALL	_robotFollow,_robot_read
	FNCALL	_robotFollow,_UpdateDisplay
	FNCALL	_robot_turnArc,_RobotDrive
	FNCALL	_robot_turnArc,_rotate
	FNCALL	_robot_turnArc,_readAvgDistance
	FNCALL	_robot_turnArc,_robot_read
	FNCALL	_robot_turnArc,_UpdateDisplay
	FNCALL	_robot_turnArc,___awdiv
	FNCALL	_robot_turnArc,_abs
	FNCALL	_robotTurnSpeed,_robotTurn
	FNCALL	_robotTurnSpeed,_robot_read
	FNCALL	_robotTurnSpeed,_UpdateDisplay
	FNCALL	_robotTurnSpeed,_abs
	FNCALL	_ChargeMode,_ser_putch
	FNCALL	_ChargeMode,_RobotBattRead
	FNCALL	_ChargeMode,_UpdateDisplay
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
	FNCALL	_RobotDrive,_ser_putch
	FNCALL	_rotate,_spi_transfer
	FNCALL	_robotLoadSong,_ser_putch
	FNCALL	_robo_init,_ser_putch
	FNCALL	_adc_read_channel,_adc_read
	FNROOT	_main
	FNCALL	_isr1,i1___lwmod
	FNCALL	_isr1,_ReadButtons
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
	global	UpdateDisplay@F1263
	global	_rxfifo
	global	_txfifo
	global	_RobotPos
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
	global	_DistHighByte
	global	_DistLowByte
	global	_DownDebounceCount
	global	_FoundVictim
	global	_LeftDebounceCount
	global	_ROBOTerror
	global	_RightDebounceCount
	global	_UpDebounceCount
	global	_VictimSensor
	global	_VwallSensor
	global	_buttonPressed
	global	_currentMenu
	global	_followDir
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
_RobotPos:
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

_DistHighByte:
       ds      1

_DistLowByte:
       ds      1

_DownDebounceCount:
       ds      1

_FoundVictim:
       ds      1

_LeftDebounceCount:
       ds      1

_ROBOTerror:
       ds      1

_RightDebounceCount:
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

_followDir:
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
UpdateDisplay@F1263:
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
	movlw	low((__pbssBANK1)+039h)
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
	global	??_ReadButtons
??_ReadButtons:	; 0 bytes @ 0x0
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
	global	?_FindVictim
?_FindVictim:	; 0 bytes @ 0x0
	global	?_GoHome
?_GoHome:	; 0 bytes @ 0x0
	global	?_ChargeMode
?_ChargeMode:	; 0 bytes @ 0x0
	global	?_robot_turnInPlace
?_robot_turnInPlace:	; 0 bytes @ 0x0
	global	?_ser_putch
?_ser_putch:	; 0 bytes @ 0x0
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
	ds	2
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
	global	_isdigit$8699
_isdigit$8699:	; 1 bytes @ 0x0
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
	global	??_ChargeMode
??_ChargeMode:	; 0 bytes @ 0x3D
	global	?_robotTurnSpeed
?_robotTurnSpeed:	; 0 bytes @ 0x3D
	global	?_robot_turnArc
?_robot_turnArc:	; 0 bytes @ 0x3D
	global	?_robotFollow
?_robotFollow:	; 0 bytes @ 0x3D
	global	?_robotMoveSpeed
?_robotMoveSpeed:	; 0 bytes @ 0x3D
	global	robotFollow@speed
robotFollow@speed:	; 2 bytes @ 0x3D
	global	robot_turnArc@speed
robot_turnArc@speed:	; 2 bytes @ 0x3D
	global	robotMoveSpeed@distance
robotMoveSpeed@distance:	; 2 bytes @ 0x3D
	global	robotTurnSpeed@angle
robotTurnSpeed@angle:	; 2 bytes @ 0x3D
	ds	2
	global	??_robot_turnArc
??_robot_turnArc:	; 0 bytes @ 0x3F
	global	robotFollow@AdcTarget
robotFollow@AdcTarget:	; 2 bytes @ 0x3F
	global	robotMoveSpeed@speed
robotMoveSpeed@speed:	; 2 bytes @ 0x3F
	global	robotTurnSpeed@speed
robotTurnSpeed@speed:	; 2 bytes @ 0x3F
	ds	2
	global	??_robotTurnSpeed
??_robotTurnSpeed:	; 0 bytes @ 0x41
	global	??_robotFollow
??_robotFollow:	; 0 bytes @ 0x41
	global	??_robotMoveSpeed
??_robotMoveSpeed:	; 0 bytes @ 0x41
	ds	1
	global	robot_turnArc@turnTarget
robot_turnArc@turnTarget:	; 2 bytes @ 0x42
	ds	2
	global	robot_turnArc@AdcTarget
robot_turnArc@AdcTarget:	; 2 bytes @ 0x44
	global	robotMoveSpeed@temp1
robotMoveSpeed@temp1:	; 2 bytes @ 0x44
	global	robotTurnSpeed@temp1
robotTurnSpeed@temp1:	; 2 bytes @ 0x44
	ds	1
	global	robotFollow@temp1
robotFollow@temp1:	; 2 bytes @ 0x45
	ds	1
	global	??_robot_turnInPlace
??_robot_turnInPlace:	; 0 bytes @ 0x46
	global	robot_turnArc@temp1
robot_turnArc@temp1:	; 2 bytes @ 0x46
	ds	1
	global	robotFollow@hysterysis
robotFollow@hysterysis:	; 1 bytes @ 0x47
	ds	1
	global	??_FindVictim
??_FindVictim:	; 0 bytes @ 0x48
	global	??_GoHome
??_GoHome:	; 0 bytes @ 0x48
	ds	3
	global	??_main
??_main:	; 0 bytes @ 0x4B
	ds	2
	global	main@shortwall
main@shortwall:	; 2 bytes @ 0x4D
	ds	2
	global	main@choice
main@choice:	; 1 bytes @ 0x4F
	ds	1
;;Data sizes: Strings 200, constant 10, data 13, bss 106, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80     80      80
;; BANK1           80      0      70
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
;; S8334$_cp	PTR const unsigned char  size(1) Largest target is 0
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
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_FindVictim
;;   _GoHome->_robot_turnArc
;;   _GoHome->_robotFollow
;;   _FindVictim->_robotFollow
;;   _FindVictim->_robot_turnArc
;;   _robot_turnInPlace->_robotTurnSpeed
;;   _robotMoveSpeed->_UpdateDisplay
;;   _robotFollow->_UpdateDisplay
;;   _robot_turnArc->_UpdateDisplay
;;   _robotTurnSpeed->_UpdateDisplay
;;   _ChargeMode->_UpdateDisplay
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
;;   _RobotDrive->___awdiv
;;   _rotate->_spi_transfer
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
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0   43891
;;                                             75 BANK0      5     5      0
;;                               _init
;;                      _robotLoadSong
;;                         _robot_read
;;                    _readAvgDistance
;;                      _UpdateDisplay
;;                               _Menu
;;                        _calibrateIR
;;                     _Init_Follow_IR
;;                         _FindVictim
;;                             _GoHome
;;                         _ChargeMode
;; ---------------------------------------------------------------------------------
;; (1) _GoHome                                               1     1      0   16876
;;                                             72 BANK0      1     1      0
;;                     _robotTurnSpeed
;;                      _robot_turnArc
;;                    _readAvgDistance
;;                        _robotFollow
;;                  _robot_turnInPlace
;;                             _rotate
;;                     _robotMoveSpeed
;; ---------------------------------------------------------------------------------
;; (1) _FindVictim                                           3     3      0   16980
;;                                             72 BANK0      3     3      0
;;                    _readAvgDistance
;;                        _robotFollow
;;                         _RobotDrive
;;                     _robotTurnSpeed
;;                     _robotMoveSpeed
;;                          _ser_putch
;;                  _robot_turnInPlace
;;                      _robot_turnArc
;; ---------------------------------------------------------------------------------
;; (2) _robot_turnInPlace                                    1     1      0    2621
;;                                             70 BANK0      1     1      0
;;                     _robotTurnSpeed
;; ---------------------------------------------------------------------------------
;; (1) _Init_Follow_IR                                       3     3      0    2412
;;                                             61 BANK0      3     3      0
;;                        _calibrateIR
;;                             _rotate
;; ---------------------------------------------------------------------------------
;; (2) _robotMoveSpeed                                       9     5      4    2778
;;                                             61 BANK0      9     5      4
;;                         _RobotDrive
;;                         _robot_read
;;                      _UpdateDisplay
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (2) _robotFollow                                         11     7      4    3742
;;                                             61 BANK0     11     7      4
;;                         _RobotDrive
;;                          _ser_putch
;;                    _readAvgDistance
;;                             _rotate
;;                         _robot_read
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (2) _robot_turnArc                                       11     9      2    4369
;;                                             61 BANK0     11     9      2
;;                         _RobotDrive
;;                             _rotate
;;                    _readAvgDistance
;;                         _robot_read
;;                      _UpdateDisplay
;;                            ___awdiv
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (3) _robotTurnSpeed                                       9     5      4    2621
;;                                             61 BANK0      9     5      4
;;                          _robotTurn
;;                         _robot_read
;;                      _UpdateDisplay
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (1) _ChargeMode                                           1     1      0    2287
;;                                             61 BANK0      1     1      0
;;                          _ser_putch
;;                      _RobotBattRead
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
;; (3) _readAvgDistance                                      8     8      0     625
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
;; (4) _readDistance                                         6     4      2      69
;;                                              8 BANK0      6     4      2
;;                   _adc_read_channel
;; ---------------------------------------------------------------------------------
;; (2) _RobotBattRead                                        4     4      0      93
;;                                              2 BANK0      4     4      0
;;                          _ser_putch
;;                          _ser_getch
;; ---------------------------------------------------------------------------------
;; (3) _robot_read                                           2     2      0     133
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
;; (3) _abs                                                  4     2      2     158
;;                                              6 BANK0      4     2      2
;;                             ___wmul
;; ---------------------------------------------------------------------------------
;; (4) _robotTurn                                            2     0      2      66
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
;; (4) _ADCconvert                                           2     2      0     254
;;                                             14 BANK0      2     2      0
;;                             ___wmul
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (3) _RobotDrive                                           9     5      4     202
;;                                              9 BANK0      9     5      4
;;                          _ser_putch
;;                            ___awdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (2) _rotate                                               7     4      3     120
;;                                              3 BANK0      7     4      3
;;                       _spi_transfer
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
;; (5) _adc_read_channel                                     2     2      0      46
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
;; (6) _adc_read                                             6     4      2      24
;;                                              0 BANK0      6     4      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (7) _isr1                                                 5     5      0     521
;;                                              6 COMMON     5     5      0
;;                          i1___lwmod
;;                        _ReadButtons
;; ---------------------------------------------------------------------------------
;; (8) i1___lwmod                                            6     2      4     521
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (8) _ReadButtons                                          1     1      0       0
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
;;   _FindVictim
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
;;     _robotFollow
;;       _RobotDrive
;;         _ser_putch
;;         ___awdiv (ARG)
;;       _ser_putch
;;       _readAvgDistance
;;         _readDistance
;;           _adc_read_channel
;;             _adc_read
;;         ___lwdiv
;;           ___wmul (ARG)
;;         _ADCconvert
;;           ___wmul
;;           ___lwdiv
;;             ___wmul (ARG)
;;       _rotate
;;         _spi_transfer
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
;;     _RobotDrive
;;       _ser_putch
;;       ___awdiv (ARG)
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
;;     _robotMoveSpeed
;;       _RobotDrive
;;         _ser_putch
;;         ___awdiv (ARG)
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
;;     _ser_putch
;;     _robot_turnInPlace
;;       _robotTurnSpeed
;;         _robotTurn
;;           _ser_putch
;;         _robot_read
;;           _ser_putch
;;           _ser_getch
;;             _ser_isrx
;;         _UpdateDisplay
;;           _lcd_write_control
;;           _sprintf
;;             _isdigit
;;             ___wmul
;;             ___lwdiv
;;               ___wmul (ARG)
;;             ___lwmod
;;               ___lwdiv (ARG)
;;                 ___wmul (ARG)
;;           _lcd_set_cursor
;;             _lcd_write_control
;;           _lcd_write_string
;;             _lcd_write_data
;;             ___awmod (ARG)
;;           ___awmod
;;           ___awdiv
;;         _abs
;;           ___wmul
;;     _robot_turnArc
;;       _RobotDrive
;;         _ser_putch
;;         ___awdiv (ARG)
;;       _rotate
;;         _spi_transfer
;;       _readAvgDistance
;;         _readDistance
;;           _adc_read_channel
;;             _adc_read
;;         ___lwdiv
;;           ___wmul (ARG)
;;         _ADCconvert
;;           ___wmul
;;           ___lwdiv
;;             ___wmul (ARG)
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
;;       ___awdiv
;;       _abs
;;         ___wmul
;;   _GoHome
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
;;     _robot_turnArc
;;       _RobotDrive
;;         _ser_putch
;;         ___awdiv (ARG)
;;       _rotate
;;         _spi_transfer
;;       _readAvgDistance
;;         _readDistance
;;           _adc_read_channel
;;             _adc_read
;;         ___lwdiv
;;           ___wmul (ARG)
;;         _ADCconvert
;;           ___wmul
;;           ___lwdiv
;;             ___wmul (ARG)
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
;;       ___awdiv
;;       _abs
;;         ___wmul
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
;;     _robotFollow
;;       _RobotDrive
;;         _ser_putch
;;         ___awdiv (ARG)
;;       _ser_putch
;;       _readAvgDistance
;;         _readDistance
;;           _adc_read_channel
;;             _adc_read
;;         ___lwdiv
;;           ___wmul (ARG)
;;         _ADCconvert
;;           ___wmul
;;           ___lwdiv
;;             ___wmul (ARG)
;;       _rotate
;;         _spi_transfer
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
;;     _robot_turnInPlace
;;       _robotTurnSpeed
;;         _robotTurn
;;           _ser_putch
;;         _robot_read
;;           _ser_putch
;;           _ser_getch
;;             _ser_isrx
;;         _UpdateDisplay
;;           _lcd_write_control
;;           _sprintf
;;             _isdigit
;;             ___wmul
;;             ___lwdiv
;;               ___wmul (ARG)
;;             ___lwmod
;;               ___lwdiv (ARG)
;;                 ___wmul (ARG)
;;           _lcd_set_cursor
;;             _lcd_write_control
;;           _lcd_write_string
;;             _lcd_write_data
;;             ___awmod (ARG)
;;           ___awmod
;;           ___awdiv
;;         _abs
;;           ___wmul
;;     _rotate
;;       _spi_transfer
;;     _robotMoveSpeed
;;       _RobotDrive
;;         _ser_putch
;;         ___awdiv (ARG)
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
;;BANK1               50      0      46       7       87.5%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      DE      12        0.0%
;;ABS                  0      0      D4       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       A       2        0.0%
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
;;		line 172 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  shortwall       2   77[BANK0 ] int 
;;  choice          1   79[BANK0 ] unsigned char 
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
;;      Temps:          0       2       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
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
;;		_FindVictim
;;		_GoHome
;;		_ChargeMode
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	172
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	173
	
l12549:	
;Main.c: 173: unsigned char choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	line	174
	
l12551:	
;Main.c: 174: int shortwall = 0;
	clrf	(main@shortwall)
	clrf	(main@shortwall+1)
	line	175
	
l12553:	
;Main.c: 175: followDir = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_followDir)^080h
	line	176
	
l12555:	
;Main.c: 176: RobotPos = 0;
	clrf	(_RobotPos)
	line	177
	
l12557:	
;Main.c: 177: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	line	179
	
l12559:	
;Main.c: 179: init();
	fcall	_init
	line	180
	
l12561:	
;Main.c: 180: robotLoadSong();
	fcall	_robotLoadSong
	goto	l12563
	line	182
;Main.c: 182: while(1)
	
l2292:	
	line	184
	
l12563:	
;Main.c: 183: {
;Main.c: 184: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5791
	goto	u5790
u5791:
	goto	l12575
u5790:
	line	186
	
l12565:	
;Main.c: 185: {
;Main.c: 186: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	187
	
l12567:	
;Main.c: 187: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	188
	
l12569:	
;Main.c: 188: readAvgDistance();
	fcall	_readAvgDistance
	line	189
	
l12571:	
;Main.c: 189: Disp2 = RobotPos;
	movf	(_RobotPos),w
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
	line	190
	
l12573:	
;Main.c: 190: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12575
	line	191
	
l2293:	
	line	192
	
l12575:	
;Main.c: 191: }
;Main.c: 192: if (buttonPressed)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_buttonPressed)^080h,w	;volatile
	skipz
	goto	u5800
	goto	l12603
u5800:
	line	195
	
l12577:	
;Main.c: 194: {
;Main.c: 195: choice = Menu(buttonPressed);
	movf	(_buttonPressed)^080h,w	;volatile
	fcall	_Menu
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	line	196
	
l12579:	
;Main.c: 196: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	goto	l12603
	line	197
	
l2294:	
	line	201
;Main.c: 197: }
;Main.c: 201: switch (choice)
	goto	l12603
	line	203
;Main.c: 202: {
;Main.c: 203: case 0:
	
l2296:	
	line	204
	
l12581:	
;Main.c: 204: calibrateIR();
	fcall	_calibrateIR
	line	205
;Main.c: 205: break;
	goto	l12605
	line	206
;Main.c: 206: case 1:
	
l2298:	
	line	207
	
l12583:	
;Main.c: 207: RobotPos = 16;
	movlw	(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_RobotPos)
	line	209
;Main.c: 209: break;
	goto	l12605
	line	210
;Main.c: 210: case 2:
	
l2299:	
	line	211
	
l12585:	
;Main.c: 211: RobotPos = 6;
	movlw	(06h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_RobotPos)
	line	213
;Main.c: 213: break;
	goto	l12605
	line	214
;Main.c: 214: case 3:
	
l2300:	
	line	216
	
l12587:	
;Main.c: 216: RobotPos = 12;
	movlw	(0Ch)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_RobotPos)
	line	217
;Main.c: 217: break;
	goto	l12605
	line	218
;Main.c: 218: case 4:
	
l2301:	
	line	219
;Main.c: 219: FoundVictim = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_FoundVictim)^080h
	line	220
	
l12589:	
;Main.c: 220: Init_Follow_IR();
	fcall	_Init_Follow_IR
	line	221
	
l12591:	
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
	
l12593:	
;Main.c: 222: FindVictim();
	fcall	_FindVictim
	line	223
;Main.c: 223: if (FoundVictim)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_FoundVictim)^080h,w
	skipz
	goto	u5810
	goto	l12597
u5810:
	line	224
	
l12595:	
;Main.c: 224: GoHome();
	fcall	_GoHome
	goto	l12597
	
l2302:	
	line	225
	
l12597:	
;Main.c: 225: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	line	226
;Main.c: 226: break;
	goto	l12605
	line	228
;Main.c: 228: case 5:
	
l2303:	
	line	229
	
l12599:	
;Main.c: 229: ChargeMode();
	fcall	_ChargeMode
	line	230
;Main.c: 230: break;
	goto	l12605
	line	231
;Main.c: 231: default:
	
l2304:	
	line	233
;Main.c: 233: break;
	goto	l12605
	line	234
	
l12601:	
;Main.c: 234: }
	goto	l12605
	line	201
	
l2295:	
	
l12603:	
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
	goto	l12581
	xorlw	1^0	; case 1
	skipnz
	goto	l12583
	xorlw	2^1	; case 2
	skipnz
	goto	l12585
	xorlw	3^2	; case 3
	skipnz
	goto	l12587
	xorlw	4^3	; case 4
	skipnz
	goto	l2301
	xorlw	5^4	; case 5
	skipnz
	goto	l12599
	goto	l12605
	opt asmopt_on

	line	234
	
l2297:	
	line	235
	
l12605:	
;Main.c: 235: choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	goto	l12563
	line	236
	
l2305:	
	line	182
	goto	l12563
	
l2306:	
	line	237
	
l2307:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_GoHome
psect	text1111,local,class=CODE,delta=2
global __ptext1111
__ptext1111:

;; *************** function _GoHome *****************
;; Defined at:
;;		line 247 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;		_robot_turnArc
;;		_readAvgDistance
;;		_robotFollow
;;		_robot_turnInPlace
;;		_rotate
;;		_robotMoveSpeed
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1111
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	247
	global	__size_of_GoHome
	__size_of_GoHome	equ	__end_of_GoHome-_GoHome
	
_GoHome:	
	opt	stack 0
; Regs used in _GoHome: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	248
	
l12491:	
;Main.c: 248: switch (RobotPos)
	goto	l12499
	line	250
;Main.c: 249: {
;Main.c: 250: case 7:
	
l2314:	
	line	251
	
l12493:	
;Main.c: 251: robotTurnSpeed(175,400);
	movlw	low(0AFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(0AFh)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	252
;Main.c: 252: break;
	goto	l12547
	line	253
;Main.c: 253: case 15:
	
l2316:	
	line	254
	
l12495:	
;Main.c: 254: robotTurnSpeed(175,400);
	movlw	low(0AFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(0AFh)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	255
;Main.c: 255: robot_turnArc(200);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robot_turnArc)
	movlw	high(0C8h)
	movwf	((?_robot_turnArc))+1
	fcall	_robot_turnArc
	line	256
;Main.c: 256: break;
	goto	l12547
	line	257
	
l12497:	
;Main.c: 257: }
	goto	l12547
	line	248
	
l2313:	
	
l12499:	
	movf	(_RobotPos),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 7 to 15
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte           38    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	7^0	; case 7
	skipnz
	goto	l12493
	xorlw	15^7	; case 15
	skipnz
	goto	l12495
	goto	l12547
	opt asmopt_on

	line	257
	
l2315:	
	line	258
;Main.c: 258: while (ROBOTerror != 9)
	goto	l12547
	
l2318:	
	line	260
;Main.c: 259: {
;Main.c: 260: switch (ROBOTerror)
	goto	l12545
	line	262
;Main.c: 261: {
;Main.c: 262: case 0:
	
l2320:	
	line	263
	
l12501:	
;Main.c: 263: readAvgDistance();
	fcall	_readAvgDistance
	line	264
;Main.c: 264: robotFollow(200, adcVal);
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

	fcall	_robotFollow
	line	265
;Main.c: 265: break;
	goto	l12547
	line	266
;Main.c: 266: case 1:
	
l2322:	
	line	267
	
l12503:	
;Main.c: 267: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	268
;Main.c: 268: break;
	goto	l12547
	line	269
;Main.c: 269: case 2:
	
l2323:	
	line	270
	
l12505:	
;Main.c: 270: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	271
;Main.c: 271: break;
	goto	l12547
	line	272
;Main.c: 272: case 3:
	
l2324:	
	line	273
	
l12507:	
;Main.c: 273: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	274
;Main.c: 274: break;
	goto	l12547
	line	275
;Main.c: 275: case 4:
	
l2325:	
	line	276
;Main.c: 276: ROBOTerror = 0;
	clrf	(_ROBOTerror)^080h
	line	277
;Main.c: 277: break;
	goto	l12547
	line	278
;Main.c: 278: case 9:
	
l2326:	
	line	279
;Main.c: 279: break;
	goto	l12547
	line	280
;Main.c: 280: case 10:
	
l2327:	
	line	281
	
l12509:	
;Main.c: 281: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	addwf	(_RobotPos),f
	line	282
	
l12511:	
;Main.c: 282: if (followDir == 1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,w
	xorlw	01h
	skipz
	goto	u5731
	goto	u5730
u5731:
	goto	l12515
u5730:
	line	283
	
l12513:	
;Main.c: 283: robot_turnArc(200);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robot_turnArc)
	movlw	high(0C8h)
	movwf	((?_robot_turnArc))+1
	fcall	_robot_turnArc
	goto	l12515
	
l2328:	
	line	284
	
l12515:	
;Main.c: 284: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5741
	goto	u5740
u5741:
	goto	l12519
u5740:
	line	285
	
l12517:	
;Main.c: 285: robot_turnInPlace();
	fcall	_robot_turnInPlace
	goto	l12519
	
l2329:	
	line	286
	
l12519:	
;Main.c: 286: if (RobotPos == 17)
	movf	(_RobotPos),w
	xorlw	011h
	skipz
	goto	u5751
	goto	u5750
u5751:
	goto	l12527
u5750:
	line	288
	
l12521:	
;Main.c: 287: {
;Main.c: 288: followDir = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_followDir)^080h
	bsf	status,0
	rlf	(_followDir)^080h,f
	line	289
	
l12523:	
;Main.c: 289: rotate(50,1);
	movlw	low(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(032h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	line	290
	
l12525:	
;Main.c: 290: robotMoveSpeed(250,200);
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
	goto	l12527
	line	291
	
l2330:	
	line	292
	
l12527:	
;Main.c: 291: }
;Main.c: 292: readAvgDistance();
	fcall	_readAvgDistance
	line	293
	
l12529:	
;Main.c: 293: robotFollow(200, adcVal - 10);
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
	fcall	_robotFollow
	line	294
;Main.c: 294: break;
	goto	l12547
	line	295
;Main.c: 295: case 11:
	
l2331:	
	line	296
	
l12531:	
;Main.c: 296: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	addwf	(_RobotPos),f
	line	297
	
l12533:	
;Main.c: 297: if (followDir == 1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,w
	xorlw	01h
	skipz
	goto	u5761
	goto	u5760
u5761:
	goto	l12537
u5760:
	line	298
	
l12535:	
;Main.c: 298: robot_turnArc(200);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robot_turnArc)
	movlw	high(0C8h)
	movwf	((?_robot_turnArc))+1
	fcall	_robot_turnArc
	goto	l12537
	
l2332:	
	line	299
	
l12537:	
;Main.c: 299: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5771
	goto	u5770
u5771:
	goto	l2333
u5770:
	line	300
	
l12539:	
;Main.c: 300: robot_turnInPlace();
	fcall	_robot_turnInPlace
	
l2333:	
	line	301
;Main.c: 301: readAvgDistance();
	fcall	_readAvgDistance
	line	302
;Main.c: 302: robotFollow(200, adcVal);
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

	fcall	_robotFollow
	line	303
;Main.c: 303: break;
	goto	l12547
	line	304
;Main.c: 304: default:
	
l2334:	
	line	305
	
l12541:	
;Main.c: 305: readAvgDistance();
	fcall	_readAvgDistance
	line	306
;Main.c: 306: robotFollow(200, adcVal);
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

	fcall	_robotFollow
	line	307
;Main.c: 307: break;
	goto	l12547
	line	308
	
l12543:	
;Main.c: 308: }
	goto	l12547
	line	260
	
l2319:	
	
l12545:	
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
	goto	l12501
	xorlw	1^0	; case 1
	skipnz
	goto	l12503
	xorlw	2^1	; case 2
	skipnz
	goto	l12505
	xorlw	3^2	; case 3
	skipnz
	goto	l12507
	xorlw	4^3	; case 4
	skipnz
	goto	l2325
	xorlw	9^4	; case 9
	skipnz
	goto	l12547
	xorlw	10^9	; case 10
	skipnz
	goto	l12509
	xorlw	11^10	; case 11
	skipnz
	goto	l12531
	goto	l12541
	opt asmopt_on

	line	308
	
l2321:	
	goto	l12547
	line	309
	
l2317:	
	line	258
	
l12547:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	xorlw	09h
	skipz
	goto	u5781
	goto	u5780
u5781:
	goto	l12545
u5780:
	goto	l2336
	
l2335:	
	line	310
	
l2336:	
	return
	opt stack 0
GLOBAL	__end_of_GoHome
	__end_of_GoHome:
;; =============== function _GoHome ends ============

	signat	_GoHome,88
	global	_FindVictim
psect	text1112,local,class=CODE,delta=2
global __ptext1112
__ptext1112:

;; *************** function _FindVictim *****************
;; Defined at:
;;		line 313 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;		_readAvgDistance
;;		_robotFollow
;;		_RobotDrive
;;		_robotTurnSpeed
;;		_robotMoveSpeed
;;		_ser_putch
;;		_robot_turnInPlace
;;		_robot_turnArc
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1112
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	313
	global	__size_of_FindVictim
	__size_of_FindVictim	equ	__end_of_FindVictim-_FindVictim
	
_FindVictim:	
	opt	stack 0
; Regs used in _FindVictim: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	314
	
l12421:	
;Main.c: 314: while (ROBOTerror != 9)
	goto	l12489
	
l2340:	
	line	317
;Main.c: 315: {
;Main.c: 317: switch (ROBOTerror)
	goto	l12487
	line	319
;Main.c: 318: {
;Main.c: 319: case 0:
	
l2342:	
	line	321
	
l12423:	
;Main.c: 321: readAvgDistance();
	fcall	_readAvgDistance
	line	322
;Main.c: 322: robotFollow(200, adcVal);
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

	fcall	_robotFollow
	line	323
;Main.c: 323: break;
	goto	l12489
	line	324
;Main.c: 324: case 1:
	
l2344:	
	line	325
	
l12425:	
;Main.c: 325: if (RobotPos == 10)
	movf	(_RobotPos),w
	xorlw	0Ah
	skipz
	goto	u5711
	goto	u5710
u5711:
	goto	l12437
u5710:
	line	327
	
l12427:	
;Main.c: 326: {
;Main.c: 327: RobotDrive(-200, 0x7FFF);
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
	line	328
	
l12429:	
;Main.c: 328: _delay((unsigned long)((200)*(20000000/4000.0)));
	opt asmopt_off
movlw  6
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_FindVictim+0)+0+2),f
movlw	19
movwf	((??_FindVictim+0)+0+1),f
	movlw	177
movwf	((??_FindVictim+0)+0),f
u5827:
	decfsz	((??_FindVictim+0)+0),f
	goto	u5827
	decfsz	((??_FindVictim+0)+0+1),f
	goto	u5827
	decfsz	((??_FindVictim+0)+0+2),f
	goto	u5827
	nop2
opt asmopt_on

	line	329
	
l12431:	
;Main.c: 329: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	addwf	(_RobotPos),f
	line	330
	
l12433:	
;Main.c: 330: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	line	331
	
l12435:	
;Main.c: 331: robotTurnSpeed((-(angleTurned - 75)),400);
	movf	(_angleTurned)^080h,w
	addlw	low(-75)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_angleTurned+1)^080h,w
	skipnc
	addlw	1
	addlw	high(-75)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(??_FindVictim+0)+0
	comf	(??_FindVictim+0)+0,f
	comf	(??_FindVictim+0)+1,f
	incf	(??_FindVictim+0)+0,f
	skipnz
	incf	(??_FindVictim+0)+1,f
	movf	0+(??_FindVictim+0)+0,w
	movwf	(?_robotTurnSpeed)
	movf	1+(??_FindVictim+0)+0,w
	movwf	(?_robotTurnSpeed+1)
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	332
;Main.c: 332: }
	goto	l12489
	line	333
	
l2345:	
	line	334
	
l12437:	
;Main.c: 333: else
;Main.c: 334: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l12489
	
l2346:	
	line	335
;Main.c: 335: break;
	goto	l12489
	line	336
;Main.c: 336: case 2:
	
l2347:	
	line	337
	
l12439:	
;Main.c: 337: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	338
;Main.c: 338: break;
	goto	l12489
	line	339
;Main.c: 339: case 3:
	
l2348:	
	line	340
	
l12441:	
;Main.c: 340: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	addwf	(_RobotPos),f
	line	341
	
l12443:	
;Main.c: 341: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	line	343
	
l12445:	
;Main.c: 343: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_FindVictim+0)+0+2),f
movlw	94
movwf	((??_FindVictim+0)+0+1),f
	movlw	134
movwf	((??_FindVictim+0)+0),f
u5837:
	decfsz	((??_FindVictim+0)+0),f
	goto	u5837
	decfsz	((??_FindVictim+0)+0+1),f
	goto	u5837
	decfsz	((??_FindVictim+0)+0+2),f
	goto	u5837
	clrwdt
opt asmopt_on

	line	344
	
l12447:	
;Main.c: 344: robotMoveSpeed(-200,-200);
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
	line	345
	
l12449:	
;Main.c: 345: robotTurnSpeed((-angleTurned-10),400);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_angleTurned)^080h,w
	addlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_angleTurned+1)^080h,w
	skipnc
	addlw	1
	addlw	high(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(??_FindVictim+0)+0
	comf	(??_FindVictim+0)+0,f
	comf	(??_FindVictim+0)+1,f
	incf	(??_FindVictim+0)+0,f
	skipnz
	incf	(??_FindVictim+0)+1,f
	movf	0+(??_FindVictim+0)+0,w
	movwf	(?_robotTurnSpeed)
	movf	1+(??_FindVictim+0)+0,w
	movwf	(?_robotTurnSpeed+1)
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	346
	
l12451:	
;Main.c: 346: robotMoveSpeed(250,200);
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
	line	347
	
l12453:	
;Main.c: 347: readAvgDistance();
	fcall	_readAvgDistance
	line	348
	
l12455:	
;Main.c: 348: robotFollow(200, adcVal - 10);
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
	fcall	_robotFollow
	line	349
;Main.c: 349: break;
	goto	l12489
	line	350
;Main.c: 350: case 4:
	
l2349:	
	line	351
	
l12457:	
;Main.c: 351: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	352
;Main.c: 352: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	353
	
l12459:	
;Main.c: 353: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	addwf	(_RobotPos),f
	line	354
	
l12461:	
;Main.c: 354: FoundVictim = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_FoundVictim)^080h
	bsf	status,0
	rlf	(_FoundVictim)^080h,f
	line	355
	
l12463:	
;Main.c: 355: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	356
;Main.c: 356: break;
	goto	l12489
	line	357
;Main.c: 357: case 9:
	
l2350:	
	line	358
	
l12465:	
;Main.c: 358: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	359
;Main.c: 359: break;
	goto	l12489
	line	360
;Main.c: 360: case 10:
	
l2351:	
	line	361
	
l12467:	
;Main.c: 361: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	addwf	(_RobotPos),f
	line	362
	
l12469:	
;Main.c: 362: robot_turnInPlace();
	fcall	_robot_turnInPlace
	line	363
	
l12471:	
;Main.c: 363: readAvgDistance();
	fcall	_readAvgDistance
	line	364
	
l12473:	
;Main.c: 364: robotFollow(200, adcVal - 10);
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
	fcall	_robotFollow
	line	365
;Main.c: 365: break;
	goto	l12489
	line	366
;Main.c: 366: case 11:
	
l2352:	
	line	367
	
l12475:	
;Main.c: 367: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	addwf	(_RobotPos),f
	line	368
	
l12477:	
;Main.c: 368: robot_turnArc(200);
	movlw	low(0C8h)
	movwf	(?_robot_turnArc)
	movlw	high(0C8h)
	movwf	((?_robot_turnArc))+1
	fcall	_robot_turnArc
	line	369
	
l12479:	
;Main.c: 369: readAvgDistance();
	fcall	_readAvgDistance
	line	370
	
l12481:	
;Main.c: 370: robotFollow(200, adcVal);
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

	fcall	_robotFollow
	line	372
;Main.c: 372: break;
	goto	l12489
	line	373
;Main.c: 373: default:
	
l2353:	
	line	374
	
l12483:	
;Main.c: 374: readAvgDistance();
	fcall	_readAvgDistance
	line	375
;Main.c: 375: robotFollow(200, adcVal);
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

	fcall	_robotFollow
	line	376
;Main.c: 376: break;
	goto	l12489
	line	378
	
l12485:	
;Main.c: 378: }
	goto	l12489
	line	317
	
l2341:	
	
l12487:	
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
	goto	l12423
	xorlw	1^0	; case 1
	skipnz
	goto	l12425
	xorlw	2^1	; case 2
	skipnz
	goto	l12439
	xorlw	3^2	; case 3
	skipnz
	goto	l12441
	xorlw	4^3	; case 4
	skipnz
	goto	l12457
	xorlw	9^4	; case 9
	skipnz
	goto	l12465
	xorlw	10^9	; case 10
	skipnz
	goto	l12467
	xorlw	11^10	; case 11
	skipnz
	goto	l12475
	goto	l12483
	opt asmopt_on

	line	378
	
l2343:	
	goto	l12489
	line	379
	
l2339:	
	line	314
	
l12489:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	xorlw	09h
	skipz
	goto	u5721
	goto	u5720
u5721:
	goto	l12487
u5720:
	goto	l2355
	
l2354:	
	line	380
	
l2355:	
	return
	opt stack 0
GLOBAL	__end_of_FindVictim
	__end_of_FindVictim:
;; =============== function _FindVictim ends ============

	signat	_FindVictim,88
	global	_robot_turnInPlace
psect	text1113,local,class=CODE,delta=2
global __ptext1113
__ptext1113:

;; *************** function _robot_turnInPlace *****************
;; Defined at:
;;		line 282 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;;		_robotTurnSpeed
;; This function is called by:
;;		_GoHome
;;		_FindVictim
;; This function uses a non-reentrant model
;;
psect	text1113
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	282
	global	__size_of_robot_turnInPlace
	__size_of_robot_turnInPlace	equ	__end_of_robot_turnInPlace-_robot_turnInPlace
	
_robot_turnInPlace:	
	opt	stack 0
; Regs used in _robot_turnInPlace: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	283
	
l12399:	
;robot.c: 283: switch (RobotPos)
	goto	l12419
	line	285
;robot.c: 284: {
;robot.c: 285: case 8:
	
l6271:	
	line	286
	
l12401:	
;robot.c: 286: robotTurnSpeed(160,400);
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
	line	287
	
l12403:	
;robot.c: 287: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnInPlace+0)+0
	movf	(??_robot_turnInPlace+0)+0,w
	addwf	(_RobotPos),f
	line	288
;robot.c: 288: break;
	goto	l6278
	line	289
;robot.c: 289: case 12:
	
l6273:	
	line	290
	
l12405:	
;robot.c: 290: robotTurnSpeed(70,400);
	movlw	low(046h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(046h)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	291
;robot.c: 291: break;
	goto	l6278
	line	292
;robot.c: 292: case 15:
	
l6274:	
	line	293
	
l12407:	
;robot.c: 293: robotTurnSpeed(160,400);
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
	line	294
	
l12409:	
;robot.c: 294: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnInPlace+0)+0
	movf	(??_robot_turnInPlace+0)+0,w
	addwf	(_RobotPos),f
	line	295
;robot.c: 295: break;
	goto	l6278
	line	296
;robot.c: 296: case 16:
	
l6275:	
	line	297
	
l12411:	
;robot.c: 297: robotTurnSpeed(70,400);
	movlw	low(046h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(046h)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	298
;robot.c: 298: break;
	goto	l6278
	line	299
;robot.c: 299: case 17:
	
l6276:	
	line	300
	
l12413:	
;robot.c: 300: robotTurnSpeed(85,400);
	movlw	low(055h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(055h)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	301
;robot.c: 301: break;
	goto	l6278
	line	302
;robot.c: 302: default:
	
l6277:	
	line	303
	
l12415:	
;robot.c: 303: robotTurnSpeed(80,400);
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
	line	304
;robot.c: 304: break;
	goto	l6278
	line	305
	
l12417:	
;robot.c: 305: }
	goto	l6278
	line	283
	
l6270:	
	
l12419:	
	movf	(_RobotPos),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 8 to 17
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           41    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	8^0	; case 8
	skipnz
	goto	l12401
	xorlw	12^8	; case 12
	skipnz
	goto	l12405
	xorlw	15^12	; case 15
	skipnz
	goto	l12407
	xorlw	16^15	; case 16
	skipnz
	goto	l12411
	xorlw	17^16	; case 17
	skipnz
	goto	l12413
	goto	l12415
	opt asmopt_on

	line	305
	
l6272:	
	line	306
	
l6278:	
	return
	opt stack 0
GLOBAL	__end_of_robot_turnInPlace
	__end_of_robot_turnInPlace:
;; =============== function _robot_turnInPlace ends ============

	signat	_robot_turnInPlace,88
	global	_Init_Follow_IR
psect	text1114,local,class=CODE,delta=2
global __ptext1114
__ptext1114:

;; *************** function _Init_Follow_IR *****************
;; Defined at:
;;		line 240 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_calibrateIR
;;		_rotate
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1114
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	240
	global	__size_of_Init_Follow_IR
	__size_of_Init_Follow_IR	equ	__end_of_Init_Follow_IR-_Init_Follow_IR
	
_Init_Follow_IR:	
	opt	stack 1
; Regs used in _Init_Follow_IR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	241
	
l12393:	
;Main.c: 241: calibrateIR();
	fcall	_calibrateIR
	line	242
	
l12395:	
;Main.c: 242: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_Init_Follow_IR+0)+0+2),f
movlw	175
movwf	((??_Init_Follow_IR+0)+0+1),f
	movlw	193
movwf	((??_Init_Follow_IR+0)+0),f
u5847:
	decfsz	((??_Init_Follow_IR+0)+0),f
	goto	u5847
	decfsz	((??_Init_Follow_IR+0)+0+1),f
	goto	u5847
	decfsz	((??_Init_Follow_IR+0)+0+2),f
	goto	u5847
	clrwdt
opt asmopt_on

	line	243
	
l12397:	
;Main.c: 243: rotate(25, 0);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	244
	
l2310:	
	return
	opt stack 0
GLOBAL	__end_of_Init_Follow_IR
	__end_of_Init_Follow_IR:
;; =============== function _Init_Follow_IR ends ============

	signat	_Init_Follow_IR,88
	global	_robotMoveSpeed
psect	text1115,local,class=CODE,delta=2
global __ptext1115
__ptext1115:

;; *************** function _robotMoveSpeed *****************
;; Defined at:
;;		line 479 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_RobotDrive
;;		_robot_read
;;		_UpdateDisplay
;;		_abs
;; This function is called by:
;;		_GoHome
;;		_FindVictim
;; This function uses a non-reentrant model
;;
psect	text1115
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	479
	global	__size_of_robotMoveSpeed
	__size_of_robotMoveSpeed	equ	__end_of_robotMoveSpeed-_robotMoveSpeed
	
_robotMoveSpeed:	
	opt	stack 1
; Regs used in _robotMoveSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	480
	
l12349:	
;robot.c: 480: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	482
	
l12351:	
;robot.c: 481: int temp1;
;robot.c: 482: RobotDrive(speed, 0x7FFF);
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
	line	485
;robot.c: 485: while (abs(distTravelled) < abs(distance))
	goto	l12385
	
l6322:	
	line	487
	
l12353:	
;robot.c: 486: {
;robot.c: 487: robot_read(0);
	movlw	(0)
	fcall	_robot_read
	line	488
	
l12355:	
;robot.c: 488: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5660
	goto	l12359
u5660:
	line	490
	
l12357:	
;robot.c: 489: {
;robot.c: 490: ROBOTerror = 1;
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	491
;robot.c: 491: break;
	goto	l12387
	line	492
	
l6323:	
	line	493
	
l12359:	
;robot.c: 492: }
;robot.c: 493: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5670
	goto	l12363
u5670:
	line	495
	
l12361:	
;robot.c: 494: {
;robot.c: 495: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	496
;robot.c: 496: break;
	goto	l12387
	line	497
	
l6325:	
	line	498
	
l12363:	
;robot.c: 497: }
;robot.c: 498: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5680
	goto	l12367
u5680:
	line	500
	
l12365:	
;robot.c: 499: {
;robot.c: 500: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	501
;robot.c: 501: break;
	goto	l12387
	line	502
	
l6326:	
	line	503
	
l12367:	
;robot.c: 502: }
;robot.c: 503: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5691
	goto	u5690
u5691:
	goto	l12371
u5690:
	line	505
	
l12369:	
;robot.c: 504: {
;robot.c: 505: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	506
;robot.c: 506: break;
	goto	l12387
	line	507
	
l6327:	
	line	508
	
l12371:	
;robot.c: 507: }
;robot.c: 508: temp1 = DistHighByte;
	movf	(_DistHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	clrf	(??_robotMoveSpeed+0)+0+1
	movf	0+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1)
	movf	1+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1+1)
	line	509
	
l12373:	
;robot.c: 509: temp1 = temp1 << 8;
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
	line	510
	
l12375:	
;robot.c: 510: temp1 += DistLowByte;
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
	line	511
	
l12377:	
;robot.c: 511: distTravelled += temp1;
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
	line	512
	
l12379:	
;robot.c: 512: TotalDistTravelled += temp1;
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
	line	513
	
l12381:	
;robot.c: 513: Disp2 = distTravelled;
	movf	(_distTravelled+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_distTravelled)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	514
	
l12383:	
;robot.c: 514: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12385
	line	520
	
l6321:	
	line	485
	
l12385:	
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
	goto	u5705
	movf	(0+(?_abs)),w
	subwf	0+(??_robotMoveSpeed+0)+0,w
u5705:

	skipc
	goto	u5701
	goto	u5700
u5701:
	goto	l12353
u5700:
	goto	l12387
	
l6324:	
	line	521
	
l12387:	
;robot.c: 520: }
;robot.c: 521: Disp2 = ROBOTerror;
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
	line	522
	
l12389:	
;robot.c: 522: UpdateDisplay();
	fcall	_UpdateDisplay
	line	523
	
l12391:	
;robot.c: 523: RobotDrive(0, 0x7FFF);
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
	line	525
	
l6328:	
	return
	opt stack 0
GLOBAL	__end_of_robotMoveSpeed
	__end_of_robotMoveSpeed:
;; =============== function _robotMoveSpeed ends ============

	signat	_robotMoveSpeed,8312
	global	_robotFollow
psect	text1116,local,class=CODE,delta=2
global __ptext1116
__ptext1116:

;; *************** function _robotFollow *****************
;; Defined at:
;;		line 189 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  speed           2   61[BANK0 ] int 
;;  AdcTarget       2   63[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   69[BANK0 ] int 
;;  hysterysis      1   71[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_RobotDrive
;;		_ser_putch
;;		_readAvgDistance
;;		_rotate
;;		_robot_read
;;		_UpdateDisplay
;; This function is called by:
;;		_GoHome
;;		_FindVictim
;; This function uses a non-reentrant model
;;
psect	text1116
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	189
	global	__size_of_robotFollow
	__size_of_robotFollow	equ	__end_of_robotFollow-_robotFollow
	
_robotFollow:	
	opt	stack 0
; Regs used in _robotFollow: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	190
	
l12245:	
;robot.c: 190: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	192
	
l12247:	
;robot.c: 191: int temp1;
;robot.c: 192: unsigned char hysterysis = 20;
	movlw	(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	movwf	(robotFollow@hysterysis)
	line	193
	
l12249:	
;robot.c: 193: RobotDrive(speed, 0x7FFF);
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
	line	194
	
l12251:	
;robot.c: 194: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	goto	l12253
	line	197
;robot.c: 197: while (1)
	
l6245:	
	line	199
	
l12253:	
;robot.c: 198: {
;robot.c: 199: if ((AdcTarget + 100) <= hysterysis)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget),w
	addlw	low(064h)
	movwf	(??_robotFollow+0)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(064h)
	movwf	1+(??_robotFollow+0)+0
	movf	1+(??_robotFollow+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u5515
	movf	0+(??_robotFollow+0)+0,w
	subwf	(robotFollow@hysterysis),w
u5515:

	skipc
	goto	u5511
	goto	u5510
u5511:
	goto	l12257
u5510:
	line	201
	
l12255:	
;robot.c: 200: {
;robot.c: 201: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	202
;robot.c: 202: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	goto	l12257
	line	203
	
l6246:	
	line	204
	
l12257:	
;robot.c: 203: }
;robot.c: 204: if (AdcTarget > 100)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(065h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5525
	movlw	low(065h)
	subwf	(robotFollow@AdcTarget),w
u5525:

	skipc
	goto	u5521
	goto	u5520
u5521:
	goto	l12261
u5520:
	line	205
	
l12259:	
;robot.c: 205: AdcTarget--;
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(robotFollow@AdcTarget),f
	skipnc
	incf	(robotFollow@AdcTarget+1),f
	movlw	high(-1)
	addwf	(robotFollow@AdcTarget+1),f
	goto	l12261
	
l6247:	
	line	206
	
l12261:	
;robot.c: 206: if (AdcTarget < 100)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(064h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5535
	movlw	low(064h)
	subwf	(robotFollow@AdcTarget),w
u5535:

	skipnc
	goto	u5531
	goto	u5530
u5531:
	goto	l12265
u5530:
	line	207
	
l12263:	
;robot.c: 207: AdcTarget++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(robotFollow@AdcTarget),f
	skipnc
	incf	(robotFollow@AdcTarget+1),f
	movlw	high(01h)
	addwf	(robotFollow@AdcTarget+1),f
	goto	l12265
	
l6248:	
	line	208
	
l12265:	
;robot.c: 208: readAvgDistance();
	fcall	_readAvgDistance
	line	209
	
l12267:	
;robot.c: 209: if (adcVal > (AdcTarget) && adcVal < (AdcTarget + hysterysis))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robotFollow@AdcTarget+1),w
	skipz
	goto	u5545
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robotFollow@AdcTarget),w
u5545:
	skipnc
	goto	u5541
	goto	u5540
u5541:
	goto	l12273
u5540:
	
l12269:	
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
	goto	u5555
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5555:
	skipnc
	goto	u5551
	goto	u5550
u5551:
	goto	l12273
u5550:
	line	211
	
l12271:	
;robot.c: 210: {
;robot.c: 211: RobotDrive(speed, 1700);
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
	line	212
;robot.c: 212: }
	goto	l6250
	line	213
	
l6249:	
	
l12273:	
;robot.c: 213: else if (adcVal < (AdcTarget) && adcVal > (AdcTarget - hysterysis))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	skipz
	goto	u5565
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5565:
	skipnc
	goto	u5561
	goto	u5560
u5561:
	goto	l12279
u5560:
	
l12275:	
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
	goto	u5575
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robotFollow+2)+0,w
u5575:
	skipnc
	goto	u5571
	goto	u5570
u5571:
	goto	l12279
u5570:
	line	215
	
l12277:	
;robot.c: 214: {
;robot.c: 215: RobotDrive(speed, -1700);
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
	line	216
;robot.c: 216: }
	goto	l6250
	line	217
	
l6251:	
	
l12279:	
;robot.c: 217: else if (adcVal <= (AdcTarget - hysterysis) || adcVal >= (AdcTarget + hysterysis))
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
	goto	u5585
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robotFollow+2)+0,w
u5585:
	skipnc
	goto	u5581
	goto	u5580
u5581:
	goto	l12283
u5580:
	
l12281:	
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
	goto	u5595
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5595:
	skipc
	goto	u5591
	goto	u5590
u5591:
	goto	l12305
u5590:
	goto	l12283
	
l6255:	
	line	219
	
l12283:	
;robot.c: 218: {
;robot.c: 219: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5601
	goto	u5600
u5601:
	goto	l12291
u5600:
	line	221
	
l12285:	
;robot.c: 220: {
;robot.c: 221: rotate(10,1);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	line	222
	
l12287:	
;robot.c: 222: readAvgDistance();
	fcall	_readAvgDistance
	line	223
	
l12289:	
;robot.c: 223: rotate(10,0);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	224
;robot.c: 224: }
	goto	l12297
	line	225
	
l6256:	
	line	227
	
l12291:	
;robot.c: 225: else
;robot.c: 226: {
;robot.c: 227: rotate(10,0);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	228
	
l12293:	
;robot.c: 228: readAvgDistance();
	fcall	_readAvgDistance
	line	229
	
l12295:	
;robot.c: 229: rotate(10,1);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	goto	l12297
	line	230
	
l6257:	
	line	231
	
l12297:	
;robot.c: 230: }
;robot.c: 231: if (adcVal < 50)
	movlw	high(032h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(032h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u5611
	goto	u5610
u5611:
	goto	l12301
u5610:
	line	232
	
l12299:	
;robot.c: 232: ROBOTerror = 11;
	movlw	(0Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l12345
	line	233
	
l6258:	
	line	234
	
l12301:	
;robot.c: 233: else
;robot.c: 234: ROBOTerror = 10;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l12345
	
l6259:	
	line	236
;robot.c: 236: break;
	goto	l12345
	line	237
	
l12303:	
;robot.c: 237: }
	goto	l6250
	line	238
	
l6253:	
	line	240
	
l12305:	
;robot.c: 238: else
;robot.c: 239: {
;robot.c: 240: RobotDrive(speed, 0x7FFF);
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
	goto	l6250
	line	241
	
l6261:	
	goto	l6250
	
l6252:	
	
l6250:	
	line	242
;robot.c: 241: }
;robot.c: 242: robot_read(0);
	movlw	(0)
	fcall	_robot_read
	line	243
	
l12307:	
;robot.c: 243: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5620
	goto	l12313
u5620:
	line	245
	
l12309:	
;robot.c: 244: {
;robot.c: 245: RobotDrive(0, 0x7FFF);
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
	line	246
	
l12311:	
;robot.c: 246: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	247
;robot.c: 247: break;
	goto	l12345
	line	248
	
l6262:	
	line	249
	
l12313:	
;robot.c: 248: }
;robot.c: 249: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5630
	goto	l12319
u5630:
	line	251
	
l12315:	
;robot.c: 250: {
;robot.c: 251: RobotDrive(0, 0x7FFF);
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
	line	252
	
l12317:	
;robot.c: 252: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	253
;robot.c: 253: break;
	goto	l12345
	line	254
	
l6263:	
	line	255
	
l12319:	
;robot.c: 254: }
;robot.c: 255: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5640
	goto	l12325
u5640:
	line	257
	
l12321:	
;robot.c: 256: {
;robot.c: 257: RobotDrive(-200, 0x7FFF);
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
	line	258
	
l12323:	
;robot.c: 258: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	259
;robot.c: 259: break;
	goto	l12345
	line	260
	
l6264:	
	line	261
	
l12325:	
;robot.c: 260: }
;robot.c: 261: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5651
	goto	u5650
u5651:
	goto	l12331
u5650:
	line	263
	
l12327:	
;robot.c: 262: {
;robot.c: 263: RobotDrive(0, 0x7FFF);
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
	line	264
	
l12329:	
;robot.c: 264: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	265
;robot.c: 265: break;
	goto	l12345
	line	266
	
l6265:	
	line	267
	
l12331:	
;robot.c: 266: }
;robot.c: 267: temp1 = DistHighByte;
	movf	(_DistHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	clrf	(??_robotFollow+0)+0+1
	movf	0+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1)
	movf	1+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1+1)
	line	268
	
l12333:	
;robot.c: 268: temp1 = temp1 << 8;
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
	line	269
	
l12335:	
;robot.c: 269: temp1 += DistLowByte;
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
	line	270
	
l12337:	
;robot.c: 270: distTravelled += temp1;
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
	line	271
	
l12339:	
;robot.c: 271: TotalDistTravelled += temp1;
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
	line	273
	
l12341:	
;robot.c: 273: Disp2 = RobotPos;
	movf	(_RobotPos),w
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
	line	274
	
l12343:	
;robot.c: 274: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12253
	line	275
	
l6266:	
	line	197
	goto	l12253
	
l6260:	
	line	277
	
l12345:	
;robot.c: 275: }
;robot.c: 277: Disp2 = RobotPos;
	movf	(_RobotPos),w
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
	line	278
	
l12347:	
;robot.c: 278: UpdateDisplay();
	fcall	_UpdateDisplay
	line	279
	
l6267:	
	return
	opt stack 0
GLOBAL	__end_of_robotFollow
	__end_of_robotFollow:
;; =============== function _robotFollow ends ============

	signat	_robotFollow,8312
	global	_robot_turnArc
psect	text1117,local,class=CODE,delta=2
global __ptext1117
__ptext1117:

;; *************** function _robot_turnArc *****************
;; Defined at:
;;		line 309 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_RobotDrive
;;		_rotate
;;		_readAvgDistance
;;		_robot_read
;;		_UpdateDisplay
;;		___awdiv
;;		_abs
;; This function is called by:
;;		_GoHome
;;		_FindVictim
;; This function uses a non-reentrant model
;;
psect	text1117
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	309
	global	__size_of_robot_turnArc
	__size_of_robot_turnArc	equ	__end_of_robot_turnArc-_robot_turnArc
	
_robot_turnArc:	
	opt	stack 0
; Regs used in _robot_turnArc: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	311
	
l12071:	
;robot.c: 311: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	313
;robot.c: 312: int temp1;
;robot.c: 313: int turnTarget = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robot_turnArc@turnTarget)
	clrf	(robot_turnArc@turnTarget+1)
	line	314
	
l12073:	
;robot.c: 314: RobotDrive(speed, 0x7FFF);
	movf	(robot_turnArc@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnArc@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(07FFFh)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(07FFFh)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	315
	
l12075:	
;robot.c: 315: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	line	316
	
l12077:	
;robot.c: 316: if (followDir == 0)
	movf	(_followDir)^080h,f
	skipz
	goto	u5321
	goto	u5320
u5321:
	goto	l12081
u5320:
	line	318
	
l12079:	
;robot.c: 317: {
;robot.c: 318: rotate(25,0);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	319
;robot.c: 319: }
	goto	l12083
	line	320
	
l6281:	
	line	322
	
l12081:	
;robot.c: 320: else
;robot.c: 321: {
;robot.c: 322: rotate(25,1);
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
	goto	l12083
	line	323
	
l6282:	
	line	324
	
l12083:	
;robot.c: 323: }
;robot.c: 324: readAvgDistance();
	fcall	_readAvgDistance
	line	325
	
l12085:	
;robot.c: 325: int AdcTarget = adcVal;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robot_turnArc@AdcTarget+1)	;volatile
	addwf	(robot_turnArc@AdcTarget+1)	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robot_turnArc@AdcTarget)	;volatile
	addwf	(robot_turnArc@AdcTarget)	;volatile

	goto	l12087
	line	327
;robot.c: 327: while (1)
	
l6283:	
	line	329
	
l12087:	
;robot.c: 328: {
;robot.c: 329: readAvgDistance();
	fcall	_readAvgDistance
	line	330
	
l12089:	
;robot.c: 330: if (adcVal > (AdcTarget) && adcVal < (AdcTarget + 15))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robot_turnArc@AdcTarget+1),w
	skipz
	goto	u5335
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robot_turnArc@AdcTarget),w
u5335:
	skipnc
	goto	u5331
	goto	u5330
u5331:
	goto	l12095
u5330:
	
l12091:	
	movf	(robot_turnArc@AdcTarget),w
	addlw	low(0Fh)
	movwf	(??_robot_turnArc+0)+0
	movf	(robot_turnArc@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0Fh)
	movwf	1+(??_robot_turnArc+0)+0
	movf	1+(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	skipz
	goto	u5345
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5345:
	skipnc
	goto	u5341
	goto	u5340
u5341:
	goto	l12095
u5340:
	line	332
	
l12093:	
;robot.c: 331: {
;robot.c: 332: RobotDrive(speed, 1700);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnArc@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(06A4h)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(06A4h)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	333
;robot.c: 333: }
	goto	l6285
	line	334
	
l6284:	
	
l12095:	
;robot.c: 334: else if (adcVal < (AdcTarget) && adcVal > (AdcTarget - 15))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@AdcTarget+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	skipz
	goto	u5355
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@AdcTarget),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5355:
	skipnc
	goto	u5351
	goto	u5350
u5351:
	goto	l12101
u5350:
	
l12097:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@AdcTarget),w
	addlw	low(0FFF1h)
	movwf	(??_robot_turnArc+0)+0
	movf	(robot_turnArc@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0FFF1h)
	movwf	1+(??_robot_turnArc+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	1+(??_robot_turnArc+0)+0,w
	skipz
	goto	u5365
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robot_turnArc+0)+0,w
u5365:
	skipnc
	goto	u5361
	goto	u5360
u5361:
	goto	l12101
u5360:
	line	336
	
l12099:	
;robot.c: 335: {
;robot.c: 336: RobotDrive(speed, -1700);
	movf	(robot_turnArc@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnArc@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-1700)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-1700)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	337
;robot.c: 337: }
	goto	l6285
	line	338
	
l6286:	
	
l12101:	
;robot.c: 338: else if (adcVal <= (AdcTarget - 50) || adcVal >= (AdcTarget + 15))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@AdcTarget),w
	addlw	low(0FFCEh)
	movwf	(??_robot_turnArc+0)+0
	movf	(robot_turnArc@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0FFCEh)
	movwf	1+(??_robot_turnArc+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	1+(??_robot_turnArc+0)+0,w
	skipz
	goto	u5375
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robot_turnArc+0)+0,w
u5375:
	skipnc
	goto	u5371
	goto	u5370
u5371:
	goto	l12149
u5370:
	
l12103:	
	movf	(robot_turnArc@AdcTarget),w
	addlw	low(0Fh)
	movwf	(??_robot_turnArc+0)+0
	movf	(robot_turnArc@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0Fh)
	movwf	1+(??_robot_turnArc+0)+0
	movf	1+(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	skipz
	goto	u5385
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5385:
	skipc
	goto	u5381
	goto	u5380
u5381:
	goto	l12107
u5380:
	goto	l12149
	
l6290:	
	line	340
;robot.c: 339: {
;robot.c: 340: break;
	goto	l12149
	line	341
	
l12105:	
;robot.c: 341: }
	goto	l6285
	line	343
	
l6288:	
	line	345
	
l12107:	
;robot.c: 343: else
;robot.c: 344: {
;robot.c: 345: RobotDrive(speed, 0x7FFF);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnArc@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(07FFFh)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(07FFFh)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	goto	l6285
	line	346
	
l6292:	
	goto	l6285
	
l6287:	
	
l6285:	
	line	347
;robot.c: 346: }
;robot.c: 347: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	348
	
l12109:	
;robot.c: 348: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5390
	goto	l12115
u5390:
	line	350
	
l12111:	
;robot.c: 349: {
;robot.c: 350: RobotDrive(0, 0x7FFF);
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
	line	351
	
l12113:	
;robot.c: 351: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	352
;robot.c: 352: break;
	goto	l12149
	line	353
	
l6293:	
	line	354
	
l12115:	
;robot.c: 353: }
;robot.c: 354: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5400
	goto	l12121
u5400:
	line	356
	
l12117:	
;robot.c: 355: {
;robot.c: 356: RobotDrive(0, 0x7FFF);
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
	line	357
	
l12119:	
;robot.c: 357: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	358
;robot.c: 358: break;
	goto	l12149
	line	359
	
l6294:	
	line	360
	
l12121:	
;robot.c: 359: }
;robot.c: 360: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5410
	goto	l12127
u5410:
	line	362
	
l12123:	
;robot.c: 361: {
;robot.c: 362: RobotDrive(-200, 0x7FFF);
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
	line	363
	
l12125:	
;robot.c: 363: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	364
;robot.c: 364: break;
	goto	l12149
	line	365
	
l6295:	
	line	366
	
l12127:	
;robot.c: 365: }
;robot.c: 366: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5421
	goto	u5420
u5421:
	goto	l12133
u5420:
	line	368
	
l12129:	
;robot.c: 367: {
;robot.c: 368: RobotDrive(0, 0x7FFF);
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
	line	369
	
l12131:	
;robot.c: 369: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	370
;robot.c: 370: break;
	goto	l12149
	line	371
	
l6296:	
	line	372
	
l12133:	
;robot.c: 371: }
;robot.c: 372: temp1 = DistHighByte;
	movf	(_DistHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1)
	movf	1+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1+1)
	line	373
	
l12135:	
;robot.c: 373: temp1 = temp1 << 8;
	movf	(robot_turnArc@temp1+1),w
	movwf	(??_robot_turnArc+0)+0+1
	movf	(robot_turnArc@temp1),w
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	movwf	(??_robot_turnArc+0)+1
	clrf	(??_robot_turnArc+0)+0
	movf	0+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1)
	movf	1+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1+1)
	line	374
	
l12137:	
;robot.c: 374: temp1 += DistLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_DistLowByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	addwf	(robot_turnArc@temp1),f
	skipnc
	incf	(robot_turnArc@temp1+1),f
	movf	1+(??_robot_turnArc+0)+0,w
	addwf	(robot_turnArc@temp1+1),f
	line	375
	
l12139:	
;robot.c: 375: distTravelled += temp1;
	movf	(robot_turnArc@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_distTravelled)^080h,f
	skipnc
	incf	(_distTravelled+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_distTravelled+1)^080h,f
	line	376
	
l12141:	
;robot.c: 376: TotalDistTravelled += temp1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_TotalDistTravelled)^080h,f
	skipnc
	incf	(_TotalDistTravelled+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_TotalDistTravelled+1)^080h,f
	line	377
	
l12143:	
;robot.c: 377: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1)
	movf	1+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1+1)
	line	378
	
l12145:	
;robot.c: 378: temp1 = temp1 << 8;
	movf	(robot_turnArc@temp1+1),w
	movwf	(??_robot_turnArc+0)+0+1
	movf	(robot_turnArc@temp1),w
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	movwf	(??_robot_turnArc+0)+1
	clrf	(??_robot_turnArc+0)+0
	movf	0+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1)
	movf	1+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1+1)
	line	379
;robot.c: 379: temp1 += AngleLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_AngleLowByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	addwf	(robot_turnArc@temp1),f
	skipnc
	incf	(robot_turnArc@temp1+1),f
	movf	1+(??_robot_turnArc+0)+0,w
	addwf	(robot_turnArc@temp1+1),f
	line	380
;robot.c: 380: angleTurned += temp1;
	movf	(robot_turnArc@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_angleTurned)^080h,f
	skipnc
	incf	(_angleTurned+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_angleTurned+1)^080h,f
	line	381
;robot.c: 381: Disp2 = RobotPos;
	movf	(_RobotPos),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_Disp2)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_Disp2+1)^080h
	line	382
	
l12147:	
;robot.c: 382: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12087
	line	383
	
l6297:	
	line	327
	goto	l12087
	
l6291:	
	line	385
	
l12149:	
;robot.c: 383: }
;robot.c: 385: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	386
;robot.c: 386: switch (RobotPos)
	goto	l12187
	line	388
;robot.c: 387: {
;robot.c: 388: case 3:
	
l6299:	
	line	389
	
l12151:	
;robot.c: 389: RobotDrive((speed /2), -400);
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___awdiv)
	movlw	high(02h)
	movwf	((?___awdiv))+1
	movf	(robot_turnArc@speed+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(robot_turnArc@speed),w
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
	line	390
	
l12153:	
;robot.c: 390: turnTarget = -90;
	movlw	low(-90)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-90)
	movwf	((robot_turnArc@turnTarget))+1
	line	391
;robot.c: 391: break;
	goto	l12189
	line	393
;robot.c: 393: case 7:
	
l6301:	
	line	394
	
l12155:	
;robot.c: 394: RobotDrive((speed), -400-100);
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_turnArc@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnArc@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-500)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-500)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	395
	
l12157:	
;robot.c: 395: turnTarget = -185;
	movlw	low(-185)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-185)
	movwf	((robot_turnArc@turnTarget))+1
	line	396
;robot.c: 396: break;
	goto	l12189
	line	397
;robot.c: 397: case 10:
	
l6302:	
	line	398
	
l12159:	
;robot.c: 398: RobotDrive((speed), -400 );
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_turnArc@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnArc@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-400)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-400)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	399
	
l12161:	
;robot.c: 399: turnTarget = -90;
	movlw	low(-90)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-90)
	movwf	((robot_turnArc@turnTarget))+1
	line	400
;robot.c: 400: break;
	goto	l12189
	line	401
;robot.c: 401: case 11:
	
l6303:	
	line	402
	
l12163:	
;robot.c: 402: RobotDrive((speed), -400 - 100);
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_turnArc@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnArc@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-500)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-500)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	403
	
l12165:	
;robot.c: 403: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnArc@turnTarget))+1
	line	404
;robot.c: 404: break;
	goto	l12189
	line	405
;robot.c: 405: case 12:
	
l6304:	
	line	406
	
l12167:	
;robot.c: 406: RobotDrive((speed), -400 - 50);
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_turnArc@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnArc@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-450)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-450)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	407
	
l12169:	
;robot.c: 407: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnArc@turnTarget))+1
	line	408
;robot.c: 408: break;
	goto	l12189
	line	409
;robot.c: 409: case 15:
	
l6305:	
	line	410
	
l12171:	
;robot.c: 410: RobotDrive((speed), -400 - 100);
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_turnArc@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnArc@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-500)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-500)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	411
	
l12173:	
;robot.c: 411: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnArc@turnTarget))+1
	line	412
;robot.c: 412: break;
	goto	l12189
	line	413
;robot.c: 413: default:
	
l6306:	
	line	414
	
l12175:	
;robot.c: 414: if (followDir == 1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,w
	xorlw	01h
	skipz
	goto	u5431
	goto	u5430
u5431:
	goto	l12179
u5430:
	line	415
	
l12177:	
;robot.c: 415: RobotDrive((speed), 400);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnArc@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(0190h)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(0190h)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	goto	l12179
	
l6307:	
	line	416
	
l12179:	
;robot.c: 416: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5441
	goto	u5440
u5441:
	goto	l12183
u5440:
	line	417
	
l12181:	
;robot.c: 417: RobotDrive((speed), -400);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robot_turnArc@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-400)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-400)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	goto	l12183
	
l6308:	
	line	419
	
l12183:	
;robot.c: 419: turnTarget = -75;
	movlw	low(-75)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-75)
	movwf	((robot_turnArc@turnTarget))+1
	line	420
;robot.c: 420: break;
	goto	l12189
	line	421
	
l12185:	
;robot.c: 421: }
	goto	l12189
	line	386
	
l6298:	
	
l12187:	
	movf	(_RobotPos),w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 3 to 15
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
; direct_byte           50    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	3^0	; case 3
	skipnz
	goto	l12151
	xorlw	7^3	; case 7
	skipnz
	goto	l12155
	xorlw	10^7	; case 10
	skipnz
	goto	l12159
	xorlw	11^10	; case 11
	skipnz
	goto	l12163
	xorlw	12^11	; case 12
	skipnz
	goto	l12167
	xorlw	15^12	; case 15
	skipnz
	goto	l12171
	goto	l12175
	opt asmopt_on

	line	421
	
l6300:	
	line	422
	
l12189:	
;robot.c: 422: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5451
	goto	u5450
u5451:
	goto	l12193
u5450:
	line	424
	
l12191:	
;robot.c: 423: {
;robot.c: 424: rotate(25,1);
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
	line	425
;robot.c: 425: }
	goto	l12239
	line	426
	
l6309:	
	line	428
	
l12193:	
;robot.c: 426: else
;robot.c: 427: {
;robot.c: 428: rotate(25,0);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	goto	l12239
	line	429
	
l6310:	
	line	431
;robot.c: 429: }
;robot.c: 431: while (abs(angleTurned) < abs(turnTarget))
	goto	l12239
	
l6312:	
	line	433
	
l12195:	
;robot.c: 432: {
;robot.c: 433: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	434
	
l12197:	
;robot.c: 434: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5460
	goto	l12203
u5460:
	line	436
	
l12199:	
;robot.c: 435: {
;robot.c: 436: RobotDrive(0, 0x7FFF);
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
	line	437
	
l12201:	
;robot.c: 437: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	438
;robot.c: 438: break;
	goto	l12241
	line	439
	
l6313:	
	line	440
	
l12203:	
;robot.c: 439: }
;robot.c: 440: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5470
	goto	l12209
u5470:
	line	442
	
l12205:	
;robot.c: 441: {
;robot.c: 442: RobotDrive(0, 0x7FFF);
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
	line	443
	
l12207:	
;robot.c: 443: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	444
;robot.c: 444: break;
	goto	l12241
	line	445
	
l6315:	
	line	446
	
l12209:	
;robot.c: 445: }
;robot.c: 446: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5480
	goto	l12215
u5480:
	line	448
	
l12211:	
;robot.c: 447: {
;robot.c: 448: RobotDrive(-200, 0x7FFF);
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
	line	449
	
l12213:	
;robot.c: 449: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	450
;robot.c: 450: break;
	goto	l12241
	line	451
	
l6316:	
	line	452
	
l12215:	
;robot.c: 451: }
;robot.c: 452: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5491
	goto	u5490
u5491:
	goto	l12221
u5490:
	line	454
	
l12217:	
;robot.c: 453: {
;robot.c: 454: RobotDrive(0, 0x7FFF);
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
	line	455
	
l12219:	
;robot.c: 455: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	456
;robot.c: 456: break;
	goto	l12241
	line	457
	
l6317:	
	line	458
	
l12221:	
;robot.c: 457: }
;robot.c: 458: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1)
	movf	1+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1+1)
	line	459
	
l12223:	
;robot.c: 459: temp1 = temp1 << 8;
	movf	(robot_turnArc@temp1+1),w
	movwf	(??_robot_turnArc+0)+0+1
	movf	(robot_turnArc@temp1),w
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	movwf	(??_robot_turnArc+0)+1
	clrf	(??_robot_turnArc+0)+0
	movf	0+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1)
	movf	1+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1+1)
	line	460
	
l12225:	
;robot.c: 460: temp1 += AngleLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_AngleLowByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	addwf	(robot_turnArc@temp1),f
	skipnc
	incf	(robot_turnArc@temp1+1),f
	movf	1+(??_robot_turnArc+0)+0,w
	addwf	(robot_turnArc@temp1+1),f
	line	461
	
l12227:	
;robot.c: 461: angleTurned += temp1;
	movf	(robot_turnArc@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_angleTurned)^080h,f
	skipnc
	incf	(_angleTurned+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_angleTurned+1)^080h,f
	line	462
	
l12229:	
;robot.c: 462: temp1 = DistHighByte;
	movf	(_DistHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1)
	movf	1+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1+1)
	line	463
;robot.c: 463: temp1 = temp1 << 8;
	movf	(robot_turnArc@temp1+1),w
	movwf	(??_robot_turnArc+0)+0+1
	movf	(robot_turnArc@temp1),w
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	movwf	(??_robot_turnArc+0)+1
	clrf	(??_robot_turnArc+0)+0
	movf	0+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1)
	movf	1+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1+1)
	line	464
	
l12231:	
;robot.c: 464: temp1 += DistLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_DistLowByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	addwf	(robot_turnArc@temp1),f
	skipnc
	incf	(robot_turnArc@temp1+1),f
	movf	1+(??_robot_turnArc+0)+0,w
	addwf	(robot_turnArc@temp1+1),f
	line	465
	
l12233:	
;robot.c: 465: distTravelled += temp1;
	movf	(robot_turnArc@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_distTravelled)^080h,f
	skipnc
	incf	(_distTravelled+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_distTravelled+1)^080h,f
	line	466
	
l12235:	
;robot.c: 466: TotalDistTravelled += temp1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@temp1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_TotalDistTravelled)^080h,f
	skipnc
	incf	(_TotalDistTravelled+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@temp1+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_TotalDistTravelled+1)^080h,f
	line	468
	
l12237:	
;robot.c: 468: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12239
	line	469
	
l6311:	
	line	431
	
l12239:	
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
	movwf	(??_robot_turnArc+0)+0
	movf	(1+?_abs),w
	movwf	((??_robot_turnArc+0)+0+1)
	movf	(robot_turnArc@turnTarget+1),w
	clrf	(?_abs+1)
	addwf	(?_abs+1)
	movf	(robot_turnArc@turnTarget),w
	clrf	(?_abs)
	addwf	(?_abs)

	fcall	_abs
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_robot_turnArc+0)+0,w
	xorlw	80h
	movwf	(??_robot_turnArc+2)+0
	movf	(1+(?_abs)),w
	xorlw	80h
	subwf	(??_robot_turnArc+2)+0,w
	skipz
	goto	u5505
	movf	(0+(?_abs)),w
	subwf	0+(??_robot_turnArc+0)+0,w
u5505:

	skipc
	goto	u5501
	goto	u5500
u5501:
	goto	l12195
u5500:
	goto	l12241
	
l6314:	
	line	470
	
l12241:	
;robot.c: 469: }
;robot.c: 470: Disp2 = ROBOTerror;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_Disp2)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_Disp2+1)^080h
	line	471
	
l12243:	
;robot.c: 471: UpdateDisplay();
	fcall	_UpdateDisplay
	line	474
	
l6318:	
	return
	opt stack 0
GLOBAL	__end_of_robot_turnArc
	__end_of_robot_turnArc:
;; =============== function _robot_turnArc ends ============

	signat	_robot_turnArc,4216
	global	_robotTurnSpeed
psect	text1118,local,class=CODE,delta=2
global __ptext1118
__ptext1118:

;; *************** function _robotTurnSpeed *****************
;; Defined at:
;;		line 532 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_robotTurn
;;		_robot_read
;;		_UpdateDisplay
;;		_abs
;; This function is called by:
;;		_GoHome
;;		_FindVictim
;;		_robot_turnInPlace
;; This function uses a non-reentrant model
;;
psect	text1118
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	532
	global	__size_of_robotTurnSpeed
	__size_of_robotTurnSpeed	equ	__end_of_robotTurnSpeed-_robotTurnSpeed
	
_robotTurnSpeed:	
	opt	stack 0
; Regs used in _robotTurnSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	533
	
l12043:	
;robot.c: 533: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	534
;robot.c: 534: int temp1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robotTurnSpeed@temp1)
	clrf	(robotTurnSpeed@temp1+1)
	line	536
	
l12045:	
;robot.c: 536: robotTurn(angle);
	movf	(robotTurnSpeed@angle+1),w
	clrf	(?_robotTurn+1)
	addwf	(?_robotTurn+1)
	movf	(robotTurnSpeed@angle),w
	clrf	(?_robotTurn)
	addwf	(?_robotTurn)

	fcall	_robotTurn
	line	539
;robot.c: 539: while (abs(angleTurned) < abs(angle))
	goto	l12067
	
l6332:	
	line	541
	
l12047:	
;robot.c: 540: {
;robot.c: 541: robot_read(1);
	movlw	(01h)
	fcall	_robot_read
	line	542
	
l12049:	
;robot.c: 542: if (BumpSensors || VwallSensor)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,f
	skipz	;volatile
	goto	u5291
	goto	u5290
u5291:
	goto	l12053
u5290:
	
l12051:	
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5300
	goto	l12055
u5300:
	goto	l12053
	
l6335:	
	line	544
	
l12053:	
;robot.c: 543: {
;robot.c: 544: ROBOTerror = 1;
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	545
;robot.c: 545: break;
	goto	l12069
	line	546
	
l6333:	
	line	547
	
l12055:	
;robot.c: 546: }
;robot.c: 547: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotTurnSpeed+0)+0
	clrf	(??_robotTurnSpeed+0)+0+1
	movf	0+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1)
	movf	1+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1+1)
	line	548
	
l12057:	
;robot.c: 548: temp1 = temp1 << 8;
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
	line	549
	
l12059:	
;robot.c: 549: temp1 += AngleLowByte;
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
	line	550
	
l12061:	
;robot.c: 550: angleTurned += temp1;
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
	line	551
	
l12063:	
;robot.c: 551: Disp2 = angleTurned;
	movf	(_angleTurned+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_angleTurned)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	552
	
l12065:	
;robot.c: 552: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12067
	line	553
	
l6331:	
	line	539
	
l12067:	
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
	goto	u5315
	movf	(0+(?_abs)),w
	subwf	0+(??_robotTurnSpeed+0)+0,w
u5315:

	skipc
	goto	u5311
	goto	u5310
u5311:
	goto	l12047
u5310:
	goto	l12069
	
l6336:	
	line	555
	
l12069:	
;robot.c: 553: }
;robot.c: 555: robotTurn(0);
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurn)
	movlw	high(0)
	movwf	((?_robotTurn))+1
	fcall	_robotTurn
	line	556
	
l6337:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurnSpeed
	__end_of_robotTurnSpeed:
;; =============== function _robotTurnSpeed ends ============

	signat	_robotTurnSpeed,8312
	global	_ChargeMode
psect	text1119,local,class=CODE,delta=2
global __ptext1119
__ptext1119:

;; *************** function _ChargeMode *****************
;; Defined at:
;;		line 428 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ser_putch
;;		_RobotBattRead
;;		_UpdateDisplay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1119
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	428
	global	__size_of_ChargeMode
	__size_of_ChargeMode	equ	__end_of_ChargeMode-_ChargeMode
	
_ChargeMode:	
	opt	stack 2
; Regs used in _ChargeMode: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	430
	
l12021:	
;Main.c: 430: currentMenu = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ChargeMode+0)+0
	movf	(??_ChargeMode+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_currentMenu)^080h	;volatile
	line	431
	
l12023:	
;Main.c: 431: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	goto	l12025
	line	433
;Main.c: 433: while (1)
	
l2373:	
	line	435
	
l12025:	
;Main.c: 434: {
;Main.c: 435: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5281
	goto	u5280
u5281:
	goto	l12041
u5280:
	line	437
	
l12027:	
;Main.c: 436: {
;Main.c: 437: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	438
	
l12029:	
;Main.c: 438: RobotBattRead();
	fcall	_RobotBattRead
	line	439
;Main.c: 439: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12041
	line	440
	
l2374:	
	line	441
;Main.c: 440: }
;Main.c: 441: switch (buttonPressed)
	goto	l12041
	line	443
;Main.c: 442: {
;Main.c: 443: case 1:
	
l2376:	
	line	444
;Main.c: 444: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	445
;Main.c: 445: break;
	goto	l12025
	line	446
;Main.c: 446: case 2:
	
l2378:	
	line	447
;Main.c: 447: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	448
;Main.c: 448: break;
	goto	l12025
	line	449
;Main.c: 449: case 3:
	
l2379:	
	line	450
;Main.c: 450: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	451
;Main.c: 451: break;
	goto	l12025
	line	452
;Main.c: 452: case 4:
	
l2380:	
	line	453
;Main.c: 453: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	454
;Main.c: 454: break;
	goto	l12025
	line	455
;Main.c: 455: case 5:
	
l2381:	
	line	456
	
l12031:	
;Main.c: 456: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	457
	
l12033:	
;Main.c: 457: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	458
	
l12035:	
;Main.c: 458: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	goto	l2382
	line	459
	
l12037:	
;Main.c: 459: return;
	goto	l2382
	line	460
;Main.c: 460: default:
	
l2383:	
	line	461
;Main.c: 461: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	462
;Main.c: 462: break;
	goto	l12025
	line	463
	
l12039:	
;Main.c: 463: }
	goto	l12025
	line	441
	
l2375:	
	
l12041:	
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
	goto	l2376
	xorlw	2^1	; case 2
	skipnz
	goto	l2378
	xorlw	3^2	; case 3
	skipnz
	goto	l2379
	xorlw	4^3	; case 4
	skipnz
	goto	l2380
	xorlw	5^4	; case 5
	skipnz
	goto	l12031
	goto	l2383
	opt asmopt_on

	line	463
	
l2377:	
	goto	l12025
	line	464
	
l2384:	
	line	433
	goto	l12025
	
l2385:	
	line	465
	
l2382:	
	return
	opt stack 0
GLOBAL	__end_of_ChargeMode
	__end_of_ChargeMode:
;; =============== function _ChargeMode ends ============

	signat	_ChargeMode,88
	global	_calibrateIR
psect	text1120,local,class=CODE,delta=2
global __ptext1120
__ptext1120:

;; *************** function _calibrateIR *****************
;; Defined at:
;;		line 386 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_rotate
;;		_UpdateDisplay
;; This function is called by:
;;		_main
;;		_Init_Follow_IR
;; This function uses a non-reentrant model
;;
psect	text1120
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	386
	global	__size_of_calibrateIR
	__size_of_calibrateIR	equ	__end_of_calibrateIR-_calibrateIR
	
_calibrateIR:	
	opt	stack 1
; Regs used in _calibrateIR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	387
	
l11989:	
;Main.c: 387: currentMenu = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h	;volatile
	bsf	status,0
	rlf	(_currentMenu)^080h,f	;volatile
	line	388
	
l11991:	
;Main.c: 388: rotate(8, 0);
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(08h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	389
	
l11993:	
;Main.c: 389: rotate(8, 1);
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
	goto	l11995
	line	390
;Main.c: 390: while (1)
	
l2358:	
	line	392
	
l11995:	
;Main.c: 391: {
;Main.c: 392: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5271
	goto	u5270
u5271:
	goto	l12019
u5270:
	line	394
	
l11997:	
;Main.c: 393: {
;Main.c: 394: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	395
	
l11999:	
;Main.c: 395: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12019
	line	396
	
l2359:	
	line	397
;Main.c: 396: }
;Main.c: 397: switch (buttonPressed)
	goto	l12019
	line	399
;Main.c: 398: {
;Main.c: 399: case 1:
	
l2361:	
	line	400
;Main.c: 400: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	401
;Main.c: 401: break;
	goto	l11995
	line	402
;Main.c: 402: case 2:
	
l2363:	
	line	403
;Main.c: 403: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	404
;Main.c: 404: break;
	goto	l11995
	line	405
;Main.c: 405: case 3:
	
l2364:	
	line	406
	
l12001:	
;Main.c: 406: rotate(1, 1);
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
	line	407
	
l12003:	
;Main.c: 407: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	408
;Main.c: 408: break;
	goto	l11995
	line	409
;Main.c: 409: case 4:
	
l2365:	
	line	410
	
l12005:	
;Main.c: 410: rotate(1, 0);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(01h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	411
	
l12007:	
;Main.c: 411: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	412
;Main.c: 412: break;
	goto	l11995
	line	413
;Main.c: 413: case 5:
	
l2366:	
	line	415
	
l12009:	
;Main.c: 415: totalSteps = 0;
	clrf	(_totalSteps)^080h
	clrf	(_totalSteps+1)^080h
	line	416
	
l12011:	
;Main.c: 416: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	417
	
l12013:	
;Main.c: 417: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	goto	l2367
	line	418
	
l12015:	
;Main.c: 418: return;
	goto	l2367
	line	419
;Main.c: 419: default:
	
l2368:	
	line	420
;Main.c: 420: break;
	goto	l11995
	line	421
	
l12017:	
;Main.c: 421: }
	goto	l11995
	line	397
	
l2360:	
	
l12019:	
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
	goto	l2361
	xorlw	2^1	; case 2
	skipnz
	goto	l2363
	xorlw	3^2	; case 3
	skipnz
	goto	l12001
	xorlw	4^3	; case 4
	skipnz
	goto	l12005
	xorlw	5^4	; case 5
	skipnz
	goto	l12009
	goto	l11995
	opt asmopt_on

	line	421
	
l2362:	
	goto	l11995
	line	422
	
l2369:	
	line	390
	goto	l11995
	
l2370:	
	line	423
	
l2367:	
	return
	opt stack 0
GLOBAL	__end_of_calibrateIR
	__end_of_calibrateIR:
;; =============== function _calibrateIR ends ============

	signat	_calibrateIR,88
	global	_UpdateDisplay
psect	text1121,local,class=CODE,delta=2
global __ptext1121
__ptext1121:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 139 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
;; Hardware stack levels required when called:    4
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
;;		_robot_turnArc
;;		_robotMoveSpeed
;;		_robotTurnSpeed
;; This function uses a non-reentrant model
;;
psect	text1121
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	139
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
	opt	stack 2
; Regs used in _UpdateDisplay: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	140
	
l11907:	
;HMI.c: 140: char LCDOutput[16] = "";
	movlw	(UpdateDisplay@LCDOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1263)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	fsr0,w
	movwf	((??_UpdateDisplay+0)+0+1)
	movlw	16
	movwf	((??_UpdateDisplay+0)+0+2)
u5250:
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
	goto	u5250
	line	141
;HMI.c: 141: switch (currentMenu)
	goto	l11983
	line	143
;HMI.c: 142: {
;HMI.c: 143: case 0:
	
l4678:	
	line	144
	
l11909:	
;HMI.c: 144: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	145
	
l11911:	
;HMI.c: 145: sprintf(LCDOutput,"IR:%3dcm D:%3d",Disp1, Disp2);
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
	line	146
	
l11913:	
;HMI.c: 146: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	147
;HMI.c: 147: lcd_write_string(LCDOutput);
	movlw	(UpdateDisplay@LCDOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	148
	
l11915:	
;HMI.c: 148: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	149
	
l11917:	
;HMI.c: 149: if (pos > 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5265
	movlw	low(01h)
	subwf	(_pos)^080h,w
u5265:

	skipc
	goto	u5261
	goto	u5260
u5261:
	goto	l11921
u5260:
	line	150
	
l11919:	
;HMI.c: 150: lcd_write_string(shortMenuStrings[pos - 1]);
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
	goto	l11923
	line	151
	
l4679:	
	line	152
	
l11921:	
;HMI.c: 151: else
;HMI.c: 152: lcd_write_string(shortMenuStrings[pos + 6 - 1]);
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
	goto	l11923
	
l4680:	
	line	153
	
l11923:	
;HMI.c: 153: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	154
	
l11925:	
;HMI.c: 154: lcd_write_string(menuStrings[pos]);
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
	line	155
;HMI.c: 155: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	156
	
l11927:	
;HMI.c: 156: lcd_write_string(shortMenuStrings[(pos + 1) % 6]);
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
	line	157
;HMI.c: 157: break;
	goto	l4694
	line	158
;HMI.c: 158: case 1:
	
l4682:	
	line	159
	
l11929:	
;HMI.c: 159: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	160
;HMI.c: 160: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	161
	
l11931:	
;HMI.c: 161: lcd_write_string("Zero Step_Motor");
	movlw	low((STR_14-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	162
	
l11933:	
;HMI.c: 162: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	163
;HMI.c: 163: lcd_write_string("<<<");
	movlw	low((STR_15-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	164
	
l11935:	
;HMI.c: 164: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	165
	
l11937:	
;HMI.c: 165: lcd_write_string("CONFIRM");
	movlw	low((STR_16-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	166
;HMI.c: 166: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	167
	
l11939:	
;HMI.c: 167: lcd_write_string(">>>");
	movlw	low((STR_17-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	168
;HMI.c: 168: break;
	goto	l4694
	line	169
;HMI.c: 169: case 2:
	
l4683:	
	line	170
	
l11941:	
;HMI.c: 170: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	171
;HMI.c: 171: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	172
	
l11943:	
;HMI.c: 172: lcd_write_string(" Charging Mode ");
	movlw	low((STR_18-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	173
	
l11945:	
;HMI.c: 173: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	174
;HMI.c: 174: sprintf(LCDOutput,"%dmA", BattCharge);
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
	line	175
;HMI.c: 175: lcd_write_string(LCDOutput);
	movlw	(UpdateDisplay@LCDOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	176
	
l11947:	
;HMI.c: 176: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	177
;HMI.c: 177: switch(BattState)
	goto	l11963
	line	179
;HMI.c: 178: {
;HMI.c: 179: case 0:
	
l4685:	
	line	180
	
l11949:	
;HMI.c: 180: lcd_write_string("NC");
	movlw	low((STR_20-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	181
;HMI.c: 181: break;
	goto	l11965
	line	182
;HMI.c: 182: case 1:
	
l4687:	
	line	183
	
l11951:	
;HMI.c: 183: lcd_write_string("RC");
	movlw	low((STR_21-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	184
;HMI.c: 184: break;
	goto	l11965
	line	185
;HMI.c: 185: case 2:
	
l4688:	
	line	186
	
l11953:	
;HMI.c: 186: lcd_write_string("FC");
	movlw	low((STR_22-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	187
;HMI.c: 187: break;
	goto	l11965
	line	188
;HMI.c: 188: case 3:
	
l4689:	
	line	189
	
l11955:	
;HMI.c: 189: lcd_write_string("TC");
	movlw	low((STR_23-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	190
;HMI.c: 190: break;
	goto	l11965
	line	191
;HMI.c: 191: case 4:
	
l4690:	
	line	192
	
l11957:	
;HMI.c: 192: lcd_write_string("Wa");
	movlw	low((STR_24-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	193
;HMI.c: 193: break;
	goto	l11965
	line	194
;HMI.c: 194: case 5:
	
l4691:	
	line	195
	
l11959:	
;HMI.c: 195: lcd_write_string("FC");
	movlw	low((STR_25-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	196
;HMI.c: 196: break;
	goto	l11965
	line	197
	
l11961:	
;HMI.c: 197: }
	goto	l11965
	line	177
	
l4684:	
	
l11963:	
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
	goto	l12627
	goto	l11965
	opt asmopt_on
	
l12627:	
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
	goto	l11949
	xorlw	1^0	; case 1
	skipnz
	goto	l11951
	xorlw	2^1	; case 2
	skipnz
	goto	l11953
	xorlw	3^2	; case 3
	skipnz
	goto	l11955
	xorlw	4^3	; case 4
	skipnz
	goto	l11957
	xorlw	5^4	; case 5
	skipnz
	goto	l11959
	goto	l11965
	opt asmopt_on

	line	197
	
l4686:	
	line	199
	
l11965:	
;HMI.c: 199: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	200
	
l11967:	
;HMI.c: 200: lcd_write_string("  EXIT  ");
	movlw	low((STR_26-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	201
;HMI.c: 201: break;
	goto	l4694
	line	202
;HMI.c: 202: case 3:
	
l4692:	
	line	203
	
l11969:	
;HMI.c: 203: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	204
	
l11971:	
;HMI.c: 204: sprintf(LCDOutput,"IR:%3dcm CP:%3d",adcVal, RobotPos);
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

	movf	(_RobotPos),w
	movwf	(??_UpdateDisplay+1)+0
	clrf	(??_UpdateDisplay+1)+0+1
	movf	0+(??_UpdateDisplay+1)+0,w
	movwf	0+(?_sprintf)+03h
	movf	1+(??_UpdateDisplay+1)+0,w
	movwf	1+(?_sprintf)+03h
	movlw	(UpdateDisplay@LCDOutput)&0ffh
	fcall	_sprintf
	line	205
	
l11973:	
;HMI.c: 205: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	206
;HMI.c: 206: lcd_write_string(LCDOutput);
	movlw	(UpdateDisplay@LCDOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	207
	
l11975:	
;HMI.c: 207: int tempDist = (TotalDistTravelled/ 10);
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

	line	209
	
l11977:	
;HMI.c: 209: sprintf(LCDOutput,"D:%4dcm AT:%3d",tempDist, angleTurned);
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
	line	210
;HMI.c: 210: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	211
	
l11979:	
;HMI.c: 211: lcd_write_string(LCDOutput);
	movlw	(UpdateDisplay@LCDOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	212
;HMI.c: 212: break;
	goto	l4694
	line	213
;HMI.c: 213: default:
	
l4693:	
	line	214
;HMI.c: 214: break;
	goto	l4694
	line	215
	
l11981:	
;HMI.c: 215: }
	goto	l4694
	line	141
	
l4677:	
	
l11983:	
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
	goto	l11909
	xorlw	1^0	; case 1
	skipnz
	goto	l11929
	xorlw	2^1	; case 2
	skipnz
	goto	l11941
	xorlw	3^2	; case 3
	skipnz
	goto	l11969
	goto	l4694
	opt asmopt_on

	line	215
	
l4681:	
	line	216
	
l4694:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,88
	global	_readAvgDistance
psect	text1122,local,class=CODE,delta=2
global __ptext1122
__ptext1122:

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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_readDistance
;;		___lwdiv
;;		_ADCconvert
;; This function is called by:
;;		_main
;;		_GoHome
;;		_FindVictim
;;		_robotFollow
;;		_robot_turnArc
;; This function uses a non-reentrant model
;;
psect	text1122
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	28
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	29
	
l11889:	
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
	
l11891:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5225
	movlw	low(08h)
	subwf	(readAvgDistance@i),w
u5225:

	skipc
	goto	u5221
	goto	u5220
u5221:
	goto	l11895
u5220:
	goto	l11903
	
l11893:	
	goto	l11903
	line	33
	
l3122:	
	line	34
	
l11895:	
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
	
l11897:	
;infrared.c: 35: if (tempIR <= 1000)
	movlw	high(03E9h)
	subwf	(readAvgDistance@tempIR+1),w
	movlw	low(03E9h)
	skipnz
	subwf	(readAvgDistance@tempIR),w
	skipnc
	goto	u5231
	goto	u5230
u5231:
	goto	l3124
u5230:
	line	37
	
l11899:	
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
	
l3124:	
	line	32
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
l11901:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5245
	movlw	low(08h)
	subwf	(readAvgDistance@i),w
u5245:

	skipc
	goto	u5241
	goto	u5240
u5241:
	goto	l11895
u5240:
	goto	l11903
	
l3123:	
	line	41
	
l11903:	
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
	
l11905:	
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
	
l3125:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,88
	global	_init
psect	text1123,local,class=CODE,delta=2
global __ptext1123
__ptext1123:

;; *************** function _init *****************
;; Defined at:
;;		line 139 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ser_init
;;		_init_adc
;;		_lcd_init
;;		_robo_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1123
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	139
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 3
; Regs used in _init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	140
	
l11863:	
;Main.c: 140: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	142
	
l11865:	
;Main.c: 142: TRISB = 0b11111100;
	movlw	(0FCh)
	movwf	(134)^080h	;volatile
	line	143
	
l11867:	
;Main.c: 143: TRISC &= 0b10010000;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_init+0)+0
	movf	(??_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	(135)^080h,f	;volatile
	line	146
	
l11869:	
;Main.c: 146: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	147
	
l11871:	
;Main.c: 147: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	150
	
l11873:	
;Main.c: 150: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	153
	
l11875:	
;Main.c: 153: ser_init();
	fcall	_ser_init
	line	154
	
l11877:	
;Main.c: 154: init_adc();
	fcall	_init_adc
	line	155
	
l11879:	
;Main.c: 155: lcd_init();
	fcall	_lcd_init
	line	156
	
l11881:	
;Main.c: 156: robo_init();
	fcall	_robo_init
	line	160
	
l11883:	
;Main.c: 160: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	162
	
l11885:	
;Main.c: 162: PEIE=1;
	bsf	(94/8),(94)&7
	line	164
	
l11887:	
;Main.c: 164: (GIE = 1);
	bsf	(95/8),(95)&7
	line	165
	
l2289:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_readDistance
psect	text1124,local,class=CODE,delta=2
global __ptext1124
__ptext1124:

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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_adc_read_channel
;; This function is called by:
;;		_readAvgDistance
;; This function uses a non-reentrant model
;;
psect	text1124
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	78
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	81
	
l11857:	
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
	
l11859:	
;infrared.c: 83: return readVal;
	movf	(readDistance@readVal+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@readVal),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	l3128
	
l11861:	
	line	84
	
l3128:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_RobotBattRead
psect	text1125,local,class=CODE,delta=2
global __ptext1125
__ptext1125:

;; *************** function _RobotBattRead *****************
;; Defined at:
;;		line 559 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ser_putch
;;		_ser_getch
;; This function is called by:
;;		_ChargeMode
;; This function uses a non-reentrant model
;;
psect	text1125
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	559
	global	__size_of_RobotBattRead
	__size_of_RobotBattRead	equ	__end_of_RobotBattRead-_RobotBattRead
	
_RobotBattRead:	
	opt	stack 2
; Regs used in _RobotBattRead: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	560
	
l11829:	
;robot.c: 560: int temp1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(RobotBattRead@temp1)
	clrf	(RobotBattRead@temp1+1)
	line	561
	
l11831:	
;robot.c: 561: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	562
	
l11833:	
;robot.c: 562: ser_putch(25);
	movlw	(019h)
	fcall	_ser_putch
	line	563
	
l11835:	
;robot.c: 563: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_RobotBattRead+0)+0+1),f
	movlw	118
movwf	((??_RobotBattRead+0)+0),f
u5857:
	decfsz	((??_RobotBattRead+0)+0),f
	goto	u5857
	decfsz	((??_RobotBattRead+0)+0+1),f
	goto	u5857
	clrwdt
opt asmopt_on

	line	564
	
l11837:	
;robot.c: 564: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	movf	(??_RobotBattRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistHighByte)^080h	;volatile
	line	565
	
l11839:	
;robot.c: 565: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	movf	(??_RobotBattRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	566
	
l11841:	
;robot.c: 566: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	567
	
l11843:	
;robot.c: 567: ser_putch(21);
	movlw	(015h)
	fcall	_ser_putch
	line	568
	
l11845:	
;robot.c: 568: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_RobotBattRead+0)+0+1),f
	movlw	118
movwf	((??_RobotBattRead+0)+0),f
u5867:
	decfsz	((??_RobotBattRead+0)+0),f
	goto	u5867
	decfsz	((??_RobotBattRead+0)+0+1),f
	goto	u5867
	clrwdt
opt asmopt_on

	line	569
	
l11847:	
;robot.c: 569: BattState = ser_getch();
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
	line	572
	
l11849:	
;robot.c: 572: temp1 = DistHighByte;
	movf	(_DistHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	clrf	(??_RobotBattRead+0)+0+1
	movf	0+(??_RobotBattRead+0)+0,w
	movwf	(RobotBattRead@temp1)
	movf	1+(??_RobotBattRead+0)+0,w
	movwf	(RobotBattRead@temp1+1)
	line	573
	
l11851:	
;robot.c: 573: temp1 = temp1 << 8;
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
	line	574
	
l11853:	
;robot.c: 574: temp1 += DistLowByte;
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
	line	575
	
l11855:	
;robot.c: 575: BattCharge = temp1;
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

	line	576
	
l6340:	
	return
	opt stack 0
GLOBAL	__end_of_RobotBattRead
	__end_of_RobotBattRead:
;; =============== function _RobotBattRead ends ============

	signat	_RobotBattRead,88
	global	_robot_read
psect	text1126,local,class=CODE,delta=2
global __ptext1126
__ptext1126:

;; *************** function _robot_read *****************
;; Defined at:
;;		line 54 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ser_putch
;;		_ser_getch
;; This function is called by:
;;		_main
;;		_robotFollow
;;		_robot_turnArc
;;		_robotMoveSpeed
;;		_robotTurnSpeed
;; This function uses a non-reentrant model
;;
psect	text1126
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	54
	global	__size_of_robot_read
	__size_of_robot_read	equ	__end_of_robot_read-_robot_read
	
_robot_read:	
	opt	stack 1
; Regs used in _robot_read: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;robot_read@readType stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_read@readType)
	line	55
	
l11813:	
;robot.c: 55: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	56
;robot.c: 56: ser_putch(10);
	movlw	(0Ah)
	fcall	_ser_putch
	line	58
;robot.c: 58: CliffSensors = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_CliffSensors)^080h	;volatile
	line	60
;robot.c: 60: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	61
;robot.c: 61: ser_putch(11);
	movlw	(0Bh)
	fcall	_ser_putch
	line	63
;robot.c: 63: CliffSensors += ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_CliffSensors)^080h,f	;volatile
	line	67
;robot.c: 67: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	68
;robot.c: 68: ser_putch(7);
	movlw	(07h)
	fcall	_ser_putch
	line	70
;robot.c: 70: BumpSensors = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_BumpSensors)^080h	;volatile
	line	72
;robot.c: 72: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	73
;robot.c: 73: ser_putch(13);
	movlw	(0Dh)
	fcall	_ser_putch
	line	75
;robot.c: 75: VwallSensor = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_VwallSensor)^080h	;volatile
	line	77
;robot.c: 77: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	78
;robot.c: 78: ser_putch(17);
	movlw	(011h)
	fcall	_ser_putch
	line	80
;robot.c: 80: VictimSensor = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_VictimSensor)^080h	;volatile
	line	84
	
l11815:	
;robot.c: 84: if (readType == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_read@readType),f
	skipz
	goto	u5191
	goto	u5190
u5191:
	goto	l11819
u5190:
	line	86
	
l11817:	
;robot.c: 85: {
;robot.c: 86: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	87
;robot.c: 87: ser_putch(19);
	movlw	(013h)
	fcall	_ser_putch
	line	89
;robot.c: 89: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistHighByte)^080h	;volatile
	line	90
;robot.c: 90: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	91
;robot.c: 91: }
	goto	l6232
	line	92
	
l6225:	
	
l11819:	
;robot.c: 92: else if (readType == 1)
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_read@readType),w
	xorlw	01h
	skipz
	goto	u5201
	goto	u5200
u5201:
	goto	l11823
u5200:
	line	94
	
l11821:	
;robot.c: 93: {
;robot.c: 94: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	95
;robot.c: 95: ser_putch(20);
	movlw	(014h)
	fcall	_ser_putch
	line	97
;robot.c: 97: AngleHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleHighByte)^080h	;volatile
	line	98
;robot.c: 98: AngleLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleLowByte)^080h	;volatile
	line	99
;robot.c: 99: }
	goto	l6232
	line	100
	
l6227:	
	
l11823:	
;robot.c: 100: else if (readType == 2)
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_read@readType),w
	xorlw	02h
	skipz
	goto	u5211
	goto	u5210
u5211:
	goto	l6232
u5210:
	line	103
	
l11825:	
;robot.c: 101: {
;robot.c: 103: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	104
;robot.c: 104: ser_putch(19);
	movlw	(013h)
	fcall	_ser_putch
	line	106
;robot.c: 106: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistHighByte)^080h	;volatile
	line	107
;robot.c: 107: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	108
;robot.c: 108: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	109
;robot.c: 109: ser_putch(20);
	movlw	(014h)
	fcall	_ser_putch
	line	111
;robot.c: 111: AngleHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleHighByte)^080h	;volatile
	line	112
;robot.c: 112: AngleLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleLowByte)^080h	;volatile
	line	113
;robot.c: 113: }
	goto	l6232
	line	115
	
l6229:	
	goto	l6232
	
l11827:	
	goto	l6232
	line	118
;robot.c: 116: {
	
l6231:	
	goto	l6232
	line	119
	
l6230:	
	goto	l6232
	
l6228:	
	goto	l6232
	
l6226:	
	
l6232:	
	return
	opt stack 0
GLOBAL	__end_of_robot_read
	__end_of_robot_read:
;; =============== function _robot_read ends ============

	signat	_robot_read,4216
	global	_lcd_init
psect	text1127,local,class=CODE,delta=2
global __ptext1127
__ptext1127:

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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_write_control
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text1127
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 3
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l11793:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l11795:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l11797:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l11799:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l11801:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l11803:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l11805:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l11807:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l11809:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l11811:	
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
psect	text1128,local,class=CODE,delta=2
global __ptext1128
__ptext1128:

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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_write_data
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1128
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 2
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
l11785:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	l11791
	
l1409:	
	
l11787:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
l11789:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
	goto	l11791
	
l1408:	
	
l11791:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u5181
	goto	u5180
u5181:
	goto	l11787
u5180:
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
psect	text1129,local,class=CODE,delta=2
global __ptext1129
__ptext1129:

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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_write_control
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1129
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	42
	global	__size_of_lcd_set_cursor
	__size_of_lcd_set_cursor	equ	__end_of_lcd_set_cursor-_lcd_set_cursor
	
_lcd_set_cursor:	
	opt	stack 2
; Regs used in _lcd_set_cursor: [wreg+status,2+status,0+pclath+cstack]
;lcd_set_cursor@address stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_set_cursor@address)
	line	43
	
l11781:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
l11783:	
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
psect	text1130,local,class=CODE,delta=2
global __ptext1130
__ptext1130:

;; *************** function _abs *****************
;; Defined at:
;;		line 581 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___wmul
;; This function is called by:
;;		_robot_turnArc
;;		_robotMoveSpeed
;;		_robotTurnSpeed
;; This function uses a non-reentrant model
;;
psect	text1130
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	581
	global	__size_of_abs
	__size_of_abs	equ	__end_of_abs-_abs
	
_abs:	
	opt	stack 2
; Regs used in _abs: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	582
	
l11777:	
;robot.c: 582: return (v * ((v > 0) - (v < 0)));
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
	goto	u5175
	movlw	low(01h)
	subwf	(abs@v),w
u5175:

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

	goto	l6343
	
l11779:	
	line	583
	
l6343:	
	return
	opt stack 0
GLOBAL	__end_of_abs
	__end_of_abs:
;; =============== function _abs ends ============

	signat	_abs,4218
	global	_robotTurn
psect	text1131,local,class=CODE,delta=2
global __ptext1131
__ptext1131:

;; *************** function _robotTurn *****************
;; Defined at:
;;		line 145 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_robotTurnSpeed
;; This function uses a non-reentrant model
;;
psect	text1131
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	145
	global	__size_of_robotTurn
	__size_of_robotTurn	equ	__end_of_robotTurn-_robotTurn
	
_robotTurn:	
	opt	stack 1
; Regs used in _robotTurn: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	147
	
l11769:	
;robot.c: 147: if (angle > 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotTurn@angle+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5155
	movlw	low(01h)
	subwf	(robotTurn@angle),w
u5155:

	skipc
	goto	u5151
	goto	u5150
u5151:
	goto	l6238
u5150:
	line	149
	
l11771:	
;robot.c: 148: {
;robot.c: 149: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	151
;robot.c: 151: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	153
;robot.c: 153: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	155
;robot.c: 155: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	157
;robot.c: 157: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	158
;robot.c: 158: }
	goto	l6242
	line	159
	
l6238:	
;robot.c: 159: else if (angle < 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(robotTurn@angle+1),7
	goto	u5161
	goto	u5160
u5161:
	goto	l11775
u5160:
	line	161
	
l11773:	
;robot.c: 160: {
;robot.c: 161: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	163
;robot.c: 163: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	165
;robot.c: 165: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	167
;robot.c: 167: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	169
;robot.c: 169: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	170
;robot.c: 170: }
	goto	l6242
	line	171
	
l6240:	
	line	173
	
l11775:	
;robot.c: 171: else
;robot.c: 172: {
;robot.c: 173: ser_putch(137);
	movlw	(089h)
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
	line	181
;robot.c: 181: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	goto	l6242
	line	182
	
l6241:	
	goto	l6242
	
l6239:	
	line	183
	
l6242:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurn
	__end_of_robotTurn:
;; =============== function _robotTurn ends ============

	signat	_robotTurn,4216
	global	_ser_getch
psect	text1132,local,class=CODE,delta=2
global __ptext1132
__ptext1132:

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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ser_isrx
;; This function is called by:
;;		_robot_read
;;		_RobotBattRead
;; This function uses a non-reentrant model
;;
psect	text1132
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	55
	global	__size_of_ser_getch
	__size_of_ser_getch	equ	__end_of_ser_getch-_ser_getch
	
_ser_getch:	
	opt	stack 2
; Regs used in _ser_getch: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	58
	
l11753:	
;ser.c: 56: unsigned char c;
;ser.c: 58: while (ser_isrx()==0)
	goto	l11755
	
l7050:	
	line	59
;ser.c: 59: continue;
	goto	l11755
	
l7049:	
	line	58
	
l11755:	
	fcall	_ser_isrx
	btfss	status,0
	goto	u5141
	goto	u5140
u5141:
	goto	l11755
u5140:
	
l7051:	
	line	61
;ser.c: 61: GIE=0;
	bcf	(95/8),(95)&7
	line	62
	
l11757:	
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
	
l11759:	
;ser.c: 63: ++rxoptr;
	movlw	(01h)
	movwf	(??_ser_getch+0)+0
	movf	(??_ser_getch+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_rxoptr)^080h,f	;volatile
	line	64
	
l11761:	
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
	
l11763:	
;ser.c: 65: GIE=1;
	bsf	(95/8),(95)&7
	line	66
	
l11765:	
;ser.c: 66: return c;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(ser_getch@c),w
	goto	l7052
	
l11767:	
	line	67
	
l7052:	
	return
	opt stack 0
GLOBAL	__end_of_ser_getch
	__end_of_ser_getch:
;; =============== function _ser_getch ends ============

	signat	_ser_getch,89
	global	_sprintf
psect	text1133,local,class=CODE,delta=2
global __ptext1133
__ptext1133:

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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_isdigit
;;		___wmul
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1133
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\doprnt.c"
	line	488
	global	__size_of_sprintf
	__size_of_sprintf	equ	__end_of_sprintf-_sprintf
	
_sprintf:	
	opt	stack 2
; Regs used in _sprintf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;sprintf@sp stored from wreg
	line	537
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(sprintf@sp)
	
l11663:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	l11747
	
l7092:	
	line	542
	
l11665:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u4991
	goto	u4990
u4991:
	goto	l11671
u4990:
	line	545
	
l11667:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11669:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	l11747
	line	547
	
l7093:	
	line	550
	
l11671:	
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	line	552
	
l11673:	
	clrf	(sprintf@flag)
	line	601
	
l11675:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfss	status,0
	goto	u5001
	goto	u5000
u5001:
	goto	l11687
u5000:
	line	602
	
l11677:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l11679
	line	603
	
l7095:	
	line	604
	
l11679:	
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
	
l11681:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@f),f
	line	605
	
l11683:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfsc	status,0
	goto	u5011
	goto	u5010
u5011:
	goto	l11679
u5010:
	goto	l11687
	
l7096:	
	goto	l11687
	line	611
	
l7094:	
	line	638
	goto	l11687
	line	640
	
l7098:	
	line	641
	goto	l11749
	line	700
	
l7100:	
	goto	l11689
	line	701
	
l7101:	
	line	702
	goto	l11689
	line	805
	
l7103:	
	line	816
	goto	l11747
	line	825
	
l11685:	
	goto	l11689
	line	638
	
l7097:	
	
l11687:	
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
	goto	l11749
	xorlw	100^0	; case 100
	skipnz
	goto	l11689
	xorlw	105^100	; case 105
	skipnz
	goto	l11689
	goto	l11747
	opt asmopt_on

	line	825
	
l7102:	
	line	1254
	
l11689:	
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
	
l11691:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
l11693:	
	btfss	(sprintf@_val+1),7
	goto	u5021
	goto	u5020
u5021:
	goto	l11699
u5020:
	line	1257
	
l11695:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
l11697:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	l11699
	line	1259
	
l7104:	
	line	1300
	
l11699:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
l11701:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u5031
	goto	u5030
u5031:
	goto	l11705
u5030:
	goto	l11713
	
l11703:	
	goto	l11713
	line	1301
	
l7105:	
	
l11705:	
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
	goto	u5045
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u5045:
	skipnc
	goto	u5041
	goto	u5040
u5041:
	goto	l11709
u5040:
	goto	l11713
	line	1302
	
l11707:	
	goto	l11713
	
l7107:	
	line	1300
	
l11709:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
l11711:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u5051
	goto	u5050
u5051:
	goto	l11705
u5050:
	goto	l11713
	
l7106:	
	line	1340
	
l11713:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u5061
	goto	u5060
u5061:
	goto	l7108
u5060:
	
l11715:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u5071
	goto	u5070
u5071:
	goto	l7108
u5070:
	line	1341
	
l11717:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	
l7108:	
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
	goto	u5085
	movf	(sprintf@width),w
	subwf	0+(??_sprintf+0)+0,w
u5085:

	skipnc
	goto	u5081
	goto	u5080
u5081:
	goto	l11721
u5080:
	line	1377
	
l11719:	
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
	goto	l11723
	line	1378
	
l7109:	
	line	1379
	
l11721:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l11723
	
l7110:	
	line	1423
	
l11723:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u5091
	goto	u5090
u5091:
	goto	l11731
u5090:
	goto	l11725
	line	1424
	
l7112:	
	line	1425
	
l11725:	
	movlw	(020h)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11727:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	1426
	
l11729:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	movf	(((sprintf@width+1))),w
	iorwf	(((sprintf@width))),w
	skipz
	goto	u5101
	goto	u5100
u5101:
	goto	l11725
u5100:
	goto	l11731
	
l7113:	
	goto	l11731
	
l7111:	
	line	1433
	
l11731:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u5111
	goto	u5110
u5111:
	goto	l11737
u5110:
	line	1434
	
l11733:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11735:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l11737
	
l7114:	
	line	1467
	
l11737:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	l11745
	
l7116:	
	line	1484
	
l11739:	
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
	
l11741:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11743:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l11745
	line	1517
	
l7115:	
	line	1469
	
l11745:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u5121
	goto	u5120
u5121:
	goto	l11739
u5120:
	goto	l11747
	
l7117:	
	goto	l11747
	line	1525
	
l7091:	
	line	540
	
l11747:	
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
	goto	u5131
	goto	u5130
u5131:
	goto	l11665
u5130:
	goto	l11749
	
l7118:	
	goto	l11749
	line	1527
	
l7099:	
	line	1530
	
l11749:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l7119
	line	1532
	
l11751:	
	line	1533
;	Return value of _sprintf is never used
	
l7119:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ADCconvert
psect	text1134,local,class=CODE,delta=2
global __ptext1134
__ptext1134:

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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___wmul
;;		___lwdiv
;; This function is called by:
;;		_readAvgDistance
;; This function uses a non-reentrant model
;;
psect	text1134
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	89
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [wreg+status,2+status,0+pclath+cstack]
	line	95
	
l11621:	
;infrared.c: 95: if (adcVal >= 213 && adcVal < 234)
	movlw	high(0D5h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4851
	goto	u4850
u4851:
	goto	l11627
u4850:
	
l11623:	
	movlw	high(0EAh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0EAh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4861
	goto	u4860
u4861:
	goto	l11627
u4860:
	line	97
	
l11625:	
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
	goto	l3144
	line	99
	
l3131:	
	
l11627:	
;infrared.c: 99: else if (adcVal >= 170 && adcVal < 213)
	movlw	high(0AAh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4871
	goto	u4870
u4871:
	goto	l11633
u4870:
	
l11629:	
	movlw	high(0D5h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4881
	goto	u4880
u4881:
	goto	l11633
u4880:
	line	101
	
l11631:	
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
	goto	l3144
	line	103
	
l3133:	
	
l11633:	
;infrared.c: 103: else if (adcVal >= 128 && adcVal < 170)
	movlw	high(080h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4891
	goto	u4890
u4891:
	goto	l11639
u4890:
	
l11635:	
	movlw	high(0AAh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4901
	goto	u4900
u4901:
	goto	l11639
u4900:
	line	105
	
l11637:	
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
	goto	l3144
	line	107
	
l3135:	
	
l11639:	
;infrared.c: 107: else if (adcVal >= 107 && adcVal < 128)
	movlw	high(06Bh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4911
	goto	u4910
u4911:
	goto	l11645
u4910:
	
l11641:	
	movlw	high(080h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4921
	goto	u4920
u4921:
	goto	l11645
u4920:
	line	109
	
l11643:	
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
	goto	l3144
	line	111
	
l3137:	
	
l11645:	
;infrared.c: 111: else if (adcVal >= 77 && adcVal < 107)
	movlw	high(04Dh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4931
	goto	u4930
u4931:
	goto	l11651
u4930:
	
l11647:	
	movlw	high(06Bh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4941
	goto	u4940
u4941:
	goto	l11651
u4940:
	line	113
	
l11649:	
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
	goto	l3144
	line	115
	
l3139:	
	
l11651:	
;infrared.c: 115: else if (adcVal >= 56 && adcVal < 77)
	movlw	high(038h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4951
	goto	u4950
u4951:
	goto	l11657
u4950:
	
l11653:	
	movlw	high(04Dh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4961
	goto	u4960
u4961:
	goto	l11657
u4960:
	line	117
	
l11655:	
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
	goto	l3144
	line	119
	
l3141:	
	
l11657:	
;infrared.c: 119: else if (adcVal >= 43 && adcVal < 56)
	movlw	high(02Bh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(02Bh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u4971
	goto	u4970
u4971:
	goto	l3144
u4970:
	
l11659:	
	movlw	high(038h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u4981
	goto	u4980
u4981:
	goto	l3144
u4980:
	line	121
	
l11661:	
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
	goto	l3144
	line	122
	
l3143:	
	goto	l3144
	line	123
	
l3142:	
	goto	l3144
	
l3140:	
	goto	l3144
	
l3138:	
	goto	l3144
	
l3136:	
	goto	l3144
	
l3134:	
	goto	l3144
	
l3132:	
	
l3144:	
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,88
	global	_RobotDrive
psect	text1135,local,class=CODE,delta=2
global __ptext1135
__ptext1135:

;; *************** function _RobotDrive *****************
;; Defined at:
;;		line 124 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_FindVictim
;;		_robotFollow
;;		_robot_turnArc
;;		_robotMoveSpeed
;; This function uses a non-reentrant model
;;
psect	text1135
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	124
	global	__size_of_RobotDrive
	__size_of_RobotDrive	equ	__end_of_RobotDrive-_RobotDrive
	
_RobotDrive:	
	opt	stack 2
; Regs used in _RobotDrive: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	126
	
l11605:	
;robot.c: 126: unsigned char speedlowByte = (unsigned char)(speed);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speed),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@speedlowByte)
	line	127
	
l11607:	
;robot.c: 127: unsigned char speedhighByte = (unsigned char)(speed >> 8);
	movf	(RobotDrive@speed+1),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@speedhighByte)
	line	128
	
l11609:	
;robot.c: 128: unsigned char radiuslowByte = (unsigned char)(radius);
	movf	(RobotDrive@radius),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@radiuslowByte)
	line	129
;robot.c: 129: unsigned char radiushighByte = (unsigned char)(radius >> 8);
	movf	(RobotDrive@radius+1),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@radiushighByte)
	line	131
	
l11611:	
;robot.c: 131: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	133
	
l11613:	
;robot.c: 133: ser_putch(speedhighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speedhighByte),w
	fcall	_ser_putch
	line	135
	
l11615:	
;robot.c: 135: ser_putch(speedlowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speedlowByte),w
	fcall	_ser_putch
	line	137
	
l11617:	
;robot.c: 137: ser_putch(radiushighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@radiushighByte),w
	fcall	_ser_putch
	line	139
	
l11619:	
;robot.c: 139: ser_putch(radiuslowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@radiuslowByte),w
	fcall	_ser_putch
	line	140
	
l6235:	
	return
	opt stack 0
GLOBAL	__end_of_RobotDrive
	__end_of_RobotDrive:
;; =============== function _RobotDrive ends ============

	signat	_RobotDrive,8312
	global	_rotate
psect	text1136,local,class=CODE,delta=2
global __ptext1136
__ptext1136:

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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_spi_transfer
;; This function is called by:
;;		_Init_Follow_IR
;;		_GoHome
;;		_calibrateIR
;;		_robotFollow
;;		_robot_turnArc
;; This function uses a non-reentrant model
;;
psect	text1136
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	67
	global	__size_of_rotate
	__size_of_rotate	equ	__end_of_rotate-_rotate
	
_rotate:	
	opt	stack 3
; Regs used in _rotate: [wreg+status,2+status,0+pclath+cstack]
	line	69
	
l11573:	
;steppermotor.c: 69: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	70
	
l11575:	
;steppermotor.c: 70: if (direction == 0)
	movf	(rotate@direction),f
	skipz
	goto	u4821
	goto	u4820
u4821:
	goto	l11579
u4820:
	line	71
	
l11577:	
;steppermotor.c: 71: spi_transfer(0b00001011);
	movlw	(0Bh)
	fcall	_spi_transfer
	goto	l11581
	line	72
	
l3847:	
	line	73
	
l11579:	
;steppermotor.c: 72: else
;steppermotor.c: 73: spi_transfer(0b00001001);
	movlw	(09h)
	fcall	_spi_transfer
	goto	l11581
	
l3848:	
	line	74
	
l11581:	
;steppermotor.c: 74: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11583:	
	bcf	(57/8),(57)&7
	line	75
	
l11585:	
;steppermotor.c: 75: for (unsigned int i = 0; i < numsteps; i++)
	clrf	(rotate@i)
	clrf	(rotate@i+1)
	goto	l3849
	line	76
	
l3850:	
	line	77
;steppermotor.c: 76: {
;steppermotor.c: 77: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	nop
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	78
	
l11587:	
;steppermotor.c: 78: if (direction)
	movf	(rotate@direction),w
	skipz
	goto	u4830
	goto	l11591
u4830:
	line	79
	
l11589:	
;steppermotor.c: 79: totalSteps++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_totalSteps)^080h,f
	skipnc
	incf	(_totalSteps+1)^080h,f
	movlw	high(01h)
	addwf	(_totalSteps+1)^080h,f
	goto	l3852
	line	80
	
l3851:	
	line	81
	
l11591:	
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
	
l3852:	
	line	82
;steppermotor.c: 82: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_rotate+0)+0+1),f
	movlw	101
movwf	((??_rotate+0)+0),f
u5877:
	decfsz	((??_rotate+0)+0),f
	goto	u5877
	decfsz	((??_rotate+0)+0+1),f
	goto	u5877
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
	
l3849:	
	movf	(rotate@numsteps+1),w
	subwf	(rotate@i+1),w
	skipz
	goto	u4845
	movf	(rotate@numsteps),w
	subwf	(rotate@i),w
u4845:
	skipc
	goto	u4841
	goto	u4840
u4841:
	goto	l3850
u4840:
	
l3853:	
	line	84
;steppermotor.c: 83: }
;steppermotor.c: 84: RC0 = 1; RC1 = 1;;
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	85
	
l11593:	
;steppermotor.c: 85: spi_transfer(0b00000000);
	movlw	(0)
	fcall	_spi_transfer
	line	86
	
l11595:	
;steppermotor.c: 86: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11597:	
	bcf	(57/8),(57)&7
	line	87
	
l11599:	
;steppermotor.c: 87: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l11601:	
	nop
	
l11603:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	88
	
l3854:	
	return
	opt stack 0
GLOBAL	__end_of_rotate
	__end_of_rotate:
;; =============== function _rotate ends ============

	signat	_rotate,8312
	global	_robotLoadSong
psect	text1137,local,class=CODE,delta=2
global __ptext1137
__ptext1137:

;; *************** function _robotLoadSong *****************
;; Defined at:
;;		line 587 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1137
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	587
	global	__size_of_robotLoadSong
	__size_of_robotLoadSong	equ	__end_of_robotLoadSong-_robotLoadSong
	
_robotLoadSong:	
	opt	stack 4
; Regs used in _robotLoadSong: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	588
	
l11571:	
;robot.c: 588: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	589
;robot.c: 589: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	590
;robot.c: 590: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	591
;robot.c: 591: ser_putch(72);
	movlw	(048h)
	fcall	_ser_putch
	line	592
;robot.c: 592: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	593
;robot.c: 593: ser_putch(84);
	movlw	(054h)
	fcall	_ser_putch
	line	594
;robot.c: 594: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	596
;robot.c: 596: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	597
;robot.c: 597: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	598
;robot.c: 598: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	599
;robot.c: 599: ser_putch(84);
	movlw	(054h)
	fcall	_ser_putch
	line	600
;robot.c: 600: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	601
;robot.c: 601: ser_putch(72);
	movlw	(048h)
	fcall	_ser_putch
	line	602
;robot.c: 602: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	603
	
l6346:	
	return
	opt stack 0
GLOBAL	__end_of_robotLoadSong
	__end_of_robotLoadSong:
;; =============== function _robotLoadSong ends ============

	signat	_robotLoadSong,88
	global	_robo_init
psect	text1138,local,class=CODE,delta=2
global __ptext1138
__ptext1138:

;; *************** function _robo_init *****************
;; Defined at:
;;		line 44 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text1138
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	44
	global	__size_of_robo_init
	__size_of_robo_init	equ	__end_of_robo_init-_robo_init
	
_robo_init:	
	opt	stack 3
; Regs used in _robo_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	45
	
l11569:	
;robot.c: 45: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	46
;robot.c: 46: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	47
;robot.c: 47: ser_putch(150);
	movlw	(096h)
	fcall	_ser_putch
	line	48
;robot.c: 48: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	49
	
l6222:	
	return
	opt stack 0
GLOBAL	__end_of_robo_init
	__end_of_robo_init:
;; =============== function _robo_init ends ============

	signat	_robo_init,88
	global	_lcd_write_data
psect	text1139,local,class=CODE,delta=2
global __ptext1139
__ptext1139:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_write_string
;;		_lcd_write_2_digit_bcd
;;		_lcd_write_3_digit_bcd
;; This function uses a non-reentrant model
;;
psect	text1139
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	30
	global	__size_of_lcd_write_data
	__size_of_lcd_write_data	equ	__end_of_lcd_write_data-_lcd_write_data
	
_lcd_write_data:	
	opt	stack 2
; Regs used in _lcd_write_data: [wreg]
;lcd_write_data@databyte stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_write_data@databyte)
	line	31
	
l11561:	
;lcd.c: 31: RE2 = 0;
	bcf	(74/8),(74)&7
	line	32
;lcd.c: 32: RE1 = 0;
	bcf	(73/8),(73)&7
	line	33
;lcd.c: 33: RE0 = 1;
	bsf	(72/8),(72)&7
	line	34
	
l11563:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
l11565:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
l11567:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u5887:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u5887
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u5887
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
psect	text1140,local,class=CODE,delta=2
global __ptext1140
__ptext1140:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_set_cursor
;;		_lcd_init
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1140
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	18
	global	__size_of_lcd_write_control
	__size_of_lcd_write_control	equ	__end_of_lcd_write_control-_lcd_write_control
	
_lcd_write_control:	
	opt	stack 2
; Regs used in _lcd_write_control: [wreg]
;lcd_write_control@databyte stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_write_control@databyte)
	line	19
	
l11553:	
;lcd.c: 19: RE2 = 0;
	bcf	(74/8),(74)&7
	line	20
;lcd.c: 20: RE1 = 0;
	bcf	(73/8),(73)&7
	line	21
;lcd.c: 21: RE0 = 0;
	bcf	(72/8),(72)&7
	line	22
	
l11555:	
;lcd.c: 22: PORTD = databyte;
	movf	(lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
l11557:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l11559:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??_lcd_write_control+0)+0),f
u5897:
	decfsz	((??_lcd_write_control+0)+0),f
	goto	u5897
	decfsz	((??_lcd_write_control+0)+0+1),f
	goto	u5897
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
psect	text1141,local,class=CODE,delta=2
global __ptext1141
__ptext1141:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text1141
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 4
; Regs used in _init_adc: [wreg+status,2]
	line	63
	
l11543:	
;adc.c: 63: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	64
	
l11545:	
;adc.c: 64: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	67
	
l11547:	
;adc.c: 67: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	68
	
l11549:	
;adc.c: 68: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	70
	
l11551:	
;adc.c: 70: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_init_adc+0)+0,f
u5907:
decfsz	(??_init_adc+0)+0,f
	goto	u5907
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
psect	text1142,local,class=CODE,delta=2
global __ptext1142
__ptext1142:

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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_adc_read
;; This function is called by:
;;		_readDistance
;; This function uses a non-reentrant model
;;
psect	text1142
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
	
l11527:	
;adc.c: 21: switch(channel)
	goto	l11535
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
	goto	l11537
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
	goto	l11537
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
	goto	l11537
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
	goto	l11537
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
	goto	l11537
	line	50
;adc.c: 50: default:
	
l696:	
	line	51
	
l11529:	
;adc.c: 51: return 0;
	movlw	(0)
	goto	l697
	
l11531:	
	goto	l697
	line	52
	
l11533:	
;adc.c: 52: }
	goto	l11537
	line	21
	
l689:	
	
l11535:	
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
	goto	l11529
	opt asmopt_on

	line	52
	
l691:	
	line	54
	
l11537:	
;adc.c: 54: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u5917:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u5917
opt asmopt_on

	line	56
	
l11539:	
;adc.c: 56: return adc_read();
	fcall	_adc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_adc_read)),w
	goto	l697
	
l11541:	
	line	58
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
psect	text1143,local,class=CODE,delta=2
global __ptext1143
__ptext1143:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1143
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 3
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l11471:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u4671
	goto	u4670
u4671:
	goto	l11475
u4670:
	line	10
	
l11473:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l11475
	line	12
	
l8015:	
	line	13
	
l11475:	
	btfss	(___awmod@divisor+1),7
	goto	u4681
	goto	u4680
u4681:
	goto	l11479
u4680:
	line	14
	
l11477:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l11479
	
l8016:	
	line	15
	
l11479:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u4691
	goto	u4690
u4691:
	goto	l11497
u4690:
	line	16
	
l11481:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l11487
	
l8019:	
	line	18
	
l11483:	
	movlw	01h
	
u4705:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4705
	line	19
	
l11485:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l11487
	line	20
	
l8018:	
	line	17
	
l11487:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u4711
	goto	u4710
u4711:
	goto	l11483
u4710:
	goto	l11489
	
l8020:	
	goto	l11489
	line	21
	
l8021:	
	line	22
	
l11489:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u4725
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u4725:
	skipc
	goto	u4721
	goto	u4720
u4721:
	goto	l11493
u4720:
	line	23
	
l11491:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l11493
	
l8022:	
	line	24
	
l11493:	
	movlw	01h
	
u4735:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u4735
	line	25
	
l11495:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u4741
	goto	u4740
u4741:
	goto	l11489
u4740:
	goto	l11497
	
l8023:	
	goto	l11497
	line	26
	
l8017:	
	line	27
	
l11497:	
	movf	(___awmod@sign),w
	skipz
	goto	u4750
	goto	l11501
u4750:
	line	28
	
l11499:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l11501
	
l8024:	
	line	29
	
l11501:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l8025
	
l11503:	
	line	30
	
l8025:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text1144,local,class=CODE,delta=2
global __ptext1144
__ptext1144:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_UpdateDisplay
;;		_robot_turnArc
;; This function uses a non-reentrant model
;;
psect	text1144
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 3
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l11431:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u4571
	goto	u4570
u4571:
	goto	l11435
u4570:
	line	11
	
l11433:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l11435
	line	13
	
l7947:	
	line	14
	
l11435:	
	btfss	(___awdiv@dividend+1),7
	goto	u4581
	goto	u4580
u4581:
	goto	l11441
u4580:
	line	15
	
l11437:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l11439:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l11441
	line	17
	
l7948:	
	line	18
	
l11441:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l11443:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u4591
	goto	u4590
u4591:
	goto	l11463
u4590:
	line	20
	
l11445:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l11451
	
l7951:	
	line	22
	
l11447:	
	movlw	01h
	
u4605:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u4605
	line	23
	
l11449:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l11451
	line	24
	
l7950:	
	line	21
	
l11451:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u4611
	goto	u4610
u4611:
	goto	l11447
u4610:
	goto	l11453
	
l7952:	
	goto	l11453
	line	25
	
l7953:	
	line	26
	
l11453:	
	movlw	01h
	
u4625:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u4625
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u4635
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u4635:
	skipc
	goto	u4631
	goto	u4630
u4631:
	goto	l11459
u4630:
	line	28
	
l11455:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l11457:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l11459
	line	30
	
l7954:	
	line	31
	
l11459:	
	movlw	01h
	
u4645:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u4645
	line	32
	
l11461:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u4651
	goto	u4650
u4651:
	goto	l11453
u4650:
	goto	l11463
	
l7955:	
	goto	l11463
	line	33
	
l7949:	
	line	34
	
l11463:	
	movf	(___awdiv@sign),w
	skipz
	goto	u4660
	goto	l11467
u4660:
	line	35
	
l11465:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l11467
	
l7956:	
	line	36
	
l11467:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l7957
	
l11469:	
	line	37
	
l7957:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___lwmod
psect	text1145,local,class=CODE,delta=2
global __ptext1145
__ptext1145:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text1145
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 2
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l11409:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u4511
	goto	u4510
u4511:
	goto	l11427
u4510:
	line	9
	
l11411:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l11417
	
l7825:	
	line	11
	
l11413:	
	movlw	01h
	
u4525:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4525
	line	12
	
l11415:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l11417
	line	13
	
l7824:	
	line	10
	
l11417:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u4531
	goto	u4530
u4531:
	goto	l11413
u4530:
	goto	l11419
	
l7826:	
	goto	l11419
	line	14
	
l7827:	
	line	15
	
l11419:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u4545
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u4545:
	skipc
	goto	u4541
	goto	u4540
u4541:
	goto	l11423
u4540:
	line	16
	
l11421:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l11423
	
l7828:	
	line	17
	
l11423:	
	movlw	01h
	
u4555:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u4555
	line	18
	
l11425:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u4561
	goto	u4560
u4561:
	goto	l11419
u4560:
	goto	l11427
	
l7829:	
	goto	l11427
	line	19
	
l7823:	
	line	20
	
l11427:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l7830
	
l11429:	
	line	21
	
l7830:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text1146,local,class=CODE,delta=2
global __ptext1146
__ptext1146:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_readAvgDistance
;;		_ADCconvert
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text1146
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 2
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l11383:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l11385:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u4441
	goto	u4440
u4441:
	goto	l11405
u4440:
	line	11
	
l11387:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l11393
	
l7815:	
	line	13
	
l11389:	
	movlw	01h
	
u4455:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u4455
	line	14
	
l11391:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l11393
	line	15
	
l7814:	
	line	12
	
l11393:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u4461
	goto	u4460
u4461:
	goto	l11389
u4460:
	goto	l11395
	
l7816:	
	goto	l11395
	line	16
	
l7817:	
	line	17
	
l11395:	
	movlw	01h
	
u4475:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u4475
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u4485
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u4485:
	skipc
	goto	u4481
	goto	u4480
u4481:
	goto	l11401
u4480:
	line	19
	
l11397:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l11399:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l11401
	line	21
	
l7818:	
	line	22
	
l11401:	
	movlw	01h
	
u4495:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u4495
	line	23
	
l11403:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u4501
	goto	u4500
u4501:
	goto	l11395
u4500:
	goto	l11405
	
l7819:	
	goto	l11405
	line	24
	
l7813:	
	line	25
	
l11405:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l7820
	
l11407:	
	line	26
	
l7820:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text1147,local,class=CODE,delta=2
global __ptext1147
__ptext1147:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCconvert
;;		_abs
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text1147
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 2
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l11371:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l11373
	line	6
	
l7807:	
	line	7
	
l11373:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u4401
	goto	u4400
u4401:
	goto	l7808
u4400:
	line	8
	
l11375:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l7808:	
	line	9
	movlw	01h
	
u4415:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u4415
	line	10
	
l11377:	
	movlw	01h
	
u4425:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u4425
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u4431
	goto	u4430
u4431:
	goto	l11373
u4430:
	goto	l11379
	
l7809:	
	line	12
	
l11379:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l7810
	
l11381:	
	line	13
	
l7810:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_isdigit
psect	text1148,local,class=CODE,delta=2
global __ptext1148
__ptext1148:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text1148
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\isdigit.c"
	global	__size_of_isdigit
	__size_of_isdigit	equ	__end_of_isdigit-_isdigit
	
_isdigit:	
	opt	stack 2
; Regs used in _isdigit: [wreg+status,2+status,0]
;isdigit@c stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(isdigit@c)
	line	14
	
l11359:	
	clrf	(_isdigit$8699)
	
l11361:	
	movlw	(03Ah)
	subwf	(isdigit@c),w
	skipnc
	goto	u4381
	goto	u4380
u4381:
	goto	l11367
u4380:
	
l11363:	
	movlw	(030h)
	subwf	(isdigit@c),w
	skipc
	goto	u4391
	goto	u4390
u4391:
	goto	l11367
u4390:
	
l11365:	
	clrf	(_isdigit$8699)
	bsf	status,0
	rlf	(_isdigit$8699),f
	goto	l11367
	
l7797:	
	
l11367:	
	rrf	(_isdigit$8699),w
	
	goto	l7798
	
l11369:	
	line	15
	
l7798:	
	return
	opt stack 0
GLOBAL	__end_of_isdigit
	__end_of_isdigit:
;; =============== function _isdigit ends ============

	signat	_isdigit,4216
	global	_ser_isrx
psect	text1149,local,class=CODE,delta=2
global __ptext1149
__ptext1149:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ser_getch
;; This function uses a non-reentrant model
;;
psect	text1149
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	45
	global	__size_of_ser_isrx
	__size_of_ser_isrx	equ	__end_of_ser_isrx-_ser_isrx
	
_ser_isrx:	
	opt	stack 2
; Regs used in _ser_isrx: [wreg+status,2+status,0]
	line	46
	
l11311:	
;ser.c: 46: if(OERR) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(193/8),(193)&7
	goto	u4311
	goto	u4310
u4311:
	goto	l11319
u4310:
	line	47
	
l11313:	
;ser.c: 47: CREN = 0;
	bcf	(196/8),(196)&7
	line	48
;ser.c: 48: CREN = 1;
	bsf	(196/8),(196)&7
	line	49
	
l11315:	
;ser.c: 49: return 0;
	clrc
	
	goto	l7046
	
l11317:	
	goto	l7046
	line	50
	
l7045:	
	line	51
	
l11319:	
;ser.c: 50: }
;ser.c: 51: return (rxiptr!=rxoptr);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_rxiptr)^080h,w	;volatile
	xorwf	(_rxoptr)^080h,w	;volatile
	skipz
	goto	u4321
	goto	u4320
u4321:
	goto	l11323
u4320:
	
l11321:	
	clrc
	
	goto	l7046
	
l11073:	
	
l11323:	
	setc
	
	goto	l7046
	
l11075:	
	goto	l7046
	
l11325:	
	line	52
	
l7046:	
	return
	opt stack 0
GLOBAL	__end_of_ser_isrx
	__end_of_ser_isrx:
;; =============== function _ser_isrx ends ============

	signat	_ser_isrx,88
	global	_spi_transfer
psect	text1150,local,class=CODE,delta=2
global __ptext1150
__ptext1150:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rotate
;; This function uses a non-reentrant model
;;
psect	text1150
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
	
l11301:	
;steppermotor.c: 51: unsigned char temp = 0;
	clrf	(spi_transfer@temp)
	line	53
;steppermotor.c: 53: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	54
	
l11303:	
;steppermotor.c: 54: SSPBUF = data;
	movf	(spi_transfer@data),w
	movwf	(19)	;volatile
	line	56
;steppermotor.c: 56: while (SSPIF == 0);
	goto	l3841
	
l3842:	
	
l3841:	
	btfss	(99/8),(99)&7
	goto	u4301
	goto	u4300
u4301:
	goto	l3841
u4300:
	goto	l11305
	
l3843:	
	line	57
	
l11305:	
;steppermotor.c: 57: temp = SSPBUF;
	movf	(19),w	;volatile
	movwf	(??_spi_transfer+0)+0
	movf	(??_spi_transfer+0)+0,w
	movwf	(spi_transfer@temp)
	line	58
	
l11307:	
;steppermotor.c: 58: SSPIF = 0;
	bcf	(99/8),(99)&7
	goto	l3844
	line	60
	
l11309:	
	line	61
;steppermotor.c: 60: return temp;
;	Return value of _spi_transfer is never used
	
l3844:	
	return
	opt stack 0
GLOBAL	__end_of_spi_transfer
	__end_of_spi_transfer:
;; =============== function _spi_transfer ends ============

	signat	_spi_transfer,4217
	global	_ser_putch
psect	text1151,local,class=CODE,delta=2
global __ptext1151
__ptext1151:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_FindVictim
;;		_ChargeMode
;;		_robo_init
;;		_robot_read
;;		_RobotDrive
;;		_robotTurn
;;		_robotFollow
;;		_RobotBattRead
;;		_robotLoadSong
;;		_ser_puts
;;		_ser_puts2
;;		_ser_puthex
;; This function uses a non-reentrant model
;;
psect	text1151
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	70
	global	__size_of_ser_putch
	__size_of_ser_putch	equ	__end_of_ser_putch-_ser_putch
	
_ser_putch:	
	opt	stack 3
; Regs used in _ser_putch: [wreg-fsr0h+status,2+status,0]
;ser_putch@c stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ser_putch@c)
	line	71
	
l11289:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l11291
	
l7056:	
	line	72
;ser.c: 72: continue;
	goto	l11291
	
l7055:	
	line	71
	
l11291:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_txiptr)^080h,w	;volatile
	addlw	01h
	andlw	0Fh
	xorwf	(_txoptr)^080h,w	;volatile
	skipnz
	goto	u4291
	goto	u4290
u4291:
	goto	l11291
u4290:
	
l7057:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l11293:	
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
	
l11295:	
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
	
l11297:	
;ser.c: 76: TXIE=1;
	bsf	(1124/8)^080h,(1124)&7
	line	77
	
l11299:	
;ser.c: 77: GIE=1;
	bsf	(95/8),(95)&7
	line	78
	
l7058:	
	return
	opt stack 0
GLOBAL	__end_of_ser_putch
	__end_of_ser_putch:
;; =============== function _ser_putch ends ============

	signat	_ser_putch,4216
	global	_Menu
psect	text1152,local,class=CODE,delta=2
global __ptext1152
__ptext1152:

;; *************** function _Menu *****************
;; Defined at:
;;		line 104 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1152
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	104
	global	__size_of_Menu
	__size_of_Menu	equ	__end_of_Menu-_Menu
	
_Menu:	
	opt	stack 5
; Regs used in _Menu: [wreg-fsr0h+status,2+status,0]
;Menu@BTN_input stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Menu@BTN_input)
	line	105
	
l11265:	
;HMI.c: 105: switch (BTN_input)
	goto	l11283
	line	107
;HMI.c: 106: {
;HMI.c: 107: case 1:
	
l4663:	
	line	109
;HMI.c: 109: break;
	goto	l11285
	line	110
;HMI.c: 110: case 2:
	
l4665:	
	line	112
;HMI.c: 112: break;
	goto	l11285
	line	113
;HMI.c: 113: case 3:
	
l4666:	
	line	114
	
l11267:	
;HMI.c: 114: pos--;
	movlw	low(-1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(-1)
	addwf	(_pos+1)^080h,f
	line	115
	
l11269:	
;HMI.c: 115: if (pos < 0)
	btfss	(_pos+1)^080h,7
	goto	u4271
	goto	u4270
u4271:
	goto	l11285
u4270:
	line	116
	
l11271:	
;HMI.c: 116: pos = 6 - 1;
	movlw	low(05h)
	movwf	(_pos)^080h
	movlw	high(05h)
	movwf	((_pos)^080h)+1
	goto	l11285
	
l4667:	
	line	118
;HMI.c: 118: break;
	goto	l11285
	line	119
;HMI.c: 119: case 4:
	
l4668:	
	line	120
	
l11273:	
;HMI.c: 120: pos++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(01h)
	addwf	(_pos+1)^080h,f
	line	121
;HMI.c: 121: if (pos == 6)
	movlw	06h
	xorwf	(_pos)^080h,w
	iorwf	(_pos+1)^080h,w
	skipz
	goto	u4281
	goto	u4280
u4281:
	goto	l11285
u4280:
	line	122
	
l11275:	
;HMI.c: 122: pos = 0;
	clrf	(_pos)^080h
	clrf	(_pos+1)^080h
	goto	l11285
	
l4669:	
	line	124
;HMI.c: 124: break;
	goto	l11285
	line	125
;HMI.c: 125: case 5:
	
l4670:	
	line	126
	
l11277:	
;HMI.c: 126: return pos;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	goto	l4671
	
l11279:	
	goto	l4671
	line	129
;HMI.c: 129: default:
	
l4672:	
	line	131
;HMI.c: 131: break;
	goto	l11285
	line	132
	
l11281:	
;HMI.c: 132: }
	goto	l11285
	line	105
	
l4662:	
	
l11283:	
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
	goto	l11285
	xorlw	2^1	; case 2
	skipnz
	goto	l11285
	xorlw	3^2	; case 3
	skipnz
	goto	l11267
	xorlw	4^3	; case 4
	skipnz
	goto	l11273
	xorlw	5^4	; case 5
	skipnz
	goto	l11277
	goto	l11285
	opt asmopt_on

	line	132
	
l4664:	
	line	133
	
l11285:	
;HMI.c: 133: return 255;
	movlw	(0FFh)
	goto	l4671
	
l11287:	
	line	134
	
l4671:	
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4217
	global	_ser_init
psect	text1153,local,class=CODE,delta=2
global __ptext1153
__ptext1153:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text1153
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 4
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l11239:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l11241:	
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
	
l11243:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l11245:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l11247:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l11249:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l11251:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l11253:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l11255:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l11257:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l11259:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l11261:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l11263:	
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
	
l7080:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_adc_read
psect	text1154,local,class=CODE,delta=2
global __ptext1154
__ptext1154:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_adc_read_channel
;; This function uses a non-reentrant model
;;
psect	text1154
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	76
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	79
	
l11081:	
;adc.c: 77: volatile unsigned int adc_value;
;adc.c: 79: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	81
	
l11083:	
;adc.c: 81: GO = 1;
	bsf	(250/8),(250)&7
	line	82
;adc.c: 82: while(GO) continue;
	goto	l703
	
l704:	
	
l703:	
	btfsc	(250/8),(250)&7
	goto	u3931
	goto	u3930
u3931:
	goto	l703
u3930:
	
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
psect	text1154
	line	88
	
l11085:	
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
	
u3945:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u3945
	line	90
;adc.c: 90: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	93
	
l11087:	
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
	
l11089:	
	line	94
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
	global	_isr1
psect	text1155,local,class=CODE,delta=2
global __ptext1155
__ptext1155:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 109 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;      Temps:          5       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1___lwmod
;;		_ReadButtons
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1155
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	109
	global	__size_of_isr1
	__size_of_isr1	equ	__end_of_isr1-_isr1
	
_isr1:	
	opt	stack 0
; Regs used in _isr1: [wreg-fsr0h+status,2+status,0+pclath+cstack]
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
psect	text1155
	line	110
	
i1l11117:	
;Main.c: 110: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u398_21
	goto	u398_20
u398_21:
	goto	i1l11139
u398_20:
	line	112
	
i1l11119:	
;Main.c: 111: {
;Main.c: 112: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	113
	
i1l11121:	
;Main.c: 113: TMR0 = 100;
	movlw	(064h)
	movwf	(1)	;volatile
	line	115
;Main.c: 115: RTC_Counter++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RTC_Counter)^080h,f	;volatile
	skipnc
	incf	(_RTC_Counter+1)^080h,f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1)^080h,f	;volatile
	line	118
	
i1l11123:	
;Main.c: 118: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	119
	
i1l11125:	
;Main.c: 119: if(RTC_Counter % 250 == 0)
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
	goto	u399_21
	goto	u399_20
u399_21:
	goto	i1l11129
u399_20:
	line	121
	
i1l11127:	
;Main.c: 120: {
;Main.c: 121: RTC_FLAG_250MS = 1;
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l11129
	line	122
	
i1l2279:	
	line	123
	
i1l11129:	
;Main.c: 122: }
;Main.c: 123: if(RTC_Counter % 500 == 0)
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
	goto	u400_21
	goto	u400_20
u400_21:
	goto	i1l11135
u400_20:
	line	125
	
i1l11131:	
;Main.c: 124: {
;Main.c: 125: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	126
	
i1l11133:	
;Main.c: 126: RB0 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l11135
	line	127
	
i1l2280:	
	line	128
	
i1l11135:	
;Main.c: 127: }
;Main.c: 128: if (buttonPressed == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_buttonPressed)^080h,f
	skipz	;volatile
	goto	u401_21
	goto	u401_20
u401_21:
	goto	i1l11139
u401_20:
	line	130
	
i1l11137:	
;Main.c: 129: {
;Main.c: 130: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_buttonPressed)^080h	;volatile
	goto	i1l11139
	line	131
	
i1l2281:	
	goto	i1l11139
	line	132
	
i1l2278:	
	line	133
	
i1l11139:	
;Main.c: 131: }
;Main.c: 132: }
;Main.c: 133: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	bcf	status, 5	;RP0=0, select bank0
	btfss	(101/8),(101)&7
	goto	u402_21
	goto	u402_20
u402_21:
	goto	i1l11149
u402_20:
	
i1l11141:	
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
	
i1l11143:	
	movf	(_rxiptr)^080h,w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_ser_tmp)^080h
	
i1l11145:	
	movf	(_ser_tmp)^080h,w
	xorwf	(_rxoptr)^080h,w	;volatile
	skipnz
	goto	u403_21
	goto	u403_20
u403_21:
	goto	i1l11149
u403_20:
	
i1l11147:	
	movf	(_ser_tmp)^080h,w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)^080h	;volatile
	goto	i1l11149
	
i1l2283:	
	goto	i1l11149
	
i1l2282:	
	
i1l11149:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(100/8),(100)&7
	goto	u404_21
	goto	u404_20
u404_21:
	goto	i1l2286
u404_20:
	
i1l11151:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u405_21
	goto	u405_20
u405_21:
	goto	i1l2286
u405_20:
	
i1l11153:	
	movf	(_txoptr)^080h,w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	
i1l11155:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_txoptr)^080h,f	;volatile
	
i1l11157:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr)^080h,f	;volatile
	
i1l11159:	
	movf	(_txoptr)^080h,w	;volatile
	xorwf	(_txiptr)^080h,w	;volatile
	skipz
	goto	u406_21
	goto	u406_20
u406_21:
	goto	i1l2286
u406_20:
	
i1l11161:	
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2286
	
i1l2285:	
	goto	i1l2286
	
i1l2284:	
	line	134
	
i1l2286:	
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
	global	i1___lwmod
psect	text1156,local,class=CODE,delta=2
global __ptext1156
__ptext1156:

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
psect	text1156
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_ofi1___lwmod
	__size_ofi1___lwmod	equ	__end_ofi1___lwmod-i1___lwmod
	
i1___lwmod:	
	opt	stack 0
; Regs used in i1___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l11505:	
	movf	(i1___lwmod@divisor+1),w
	iorwf	(i1___lwmod@divisor),w
	skipnz
	goto	u476_21
	goto	u476_20
u476_21:
	goto	i1l11523
u476_20:
	line	9
	
i1l11507:	
	clrf	(i1___lwmod@counter)
	bsf	status,0
	rlf	(i1___lwmod@counter),f
	line	10
	goto	i1l11513
	
i1l7825:	
	line	11
	
i1l11509:	
	movlw	01h
	
u477_25:
	clrc
	rlf	(i1___lwmod@divisor),f
	rlf	(i1___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u477_25
	line	12
	
i1l11511:	
	movlw	(01h)
	movwf	(??i1___lwmod+0)+0
	movf	(??i1___lwmod+0)+0,w
	addwf	(i1___lwmod@counter),f
	goto	i1l11513
	line	13
	
i1l7824:	
	line	10
	
i1l11513:	
	btfss	(i1___lwmod@divisor+1),(15)&7
	goto	u478_21
	goto	u478_20
u478_21:
	goto	i1l11509
u478_20:
	goto	i1l11515
	
i1l7826:	
	goto	i1l11515
	line	14
	
i1l7827:	
	line	15
	
i1l11515:	
	movf	(i1___lwmod@divisor+1),w
	subwf	(i1___lwmod@dividend+1),w
	skipz
	goto	u479_25
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),w
u479_25:
	skipc
	goto	u479_21
	goto	u479_20
u479_21:
	goto	i1l11519
u479_20:
	line	16
	
i1l11517:	
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),f
	movf	(i1___lwmod@divisor+1),w
	skipc
	decf	(i1___lwmod@dividend+1),f
	subwf	(i1___lwmod@dividend+1),f
	goto	i1l11519
	
i1l7828:	
	line	17
	
i1l11519:	
	movlw	01h
	
u480_25:
	clrc
	rrf	(i1___lwmod@divisor+1),f
	rrf	(i1___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u480_25
	line	18
	
i1l11521:	
	movlw	low(01h)
	subwf	(i1___lwmod@counter),f
	btfss	status,2
	goto	u481_21
	goto	u481_20
u481_21:
	goto	i1l11515
u481_20:
	goto	i1l11523
	
i1l7829:	
	goto	i1l11523
	line	19
	
i1l7823:	
	line	20
	
i1l11523:	
	movf	(i1___lwmod@dividend+1),w
	clrf	(?i1___lwmod+1)
	addwf	(?i1___lwmod+1)
	movf	(i1___lwmod@dividend),w
	clrf	(?i1___lwmod)
	addwf	(?i1___lwmod)

	goto	i1l7830
	
i1l11525:	
	line	21
	
i1l7830:	
	return
	opt stack 0
GLOBAL	__end_ofi1___lwmod
	__end_ofi1___lwmod:
;; =============== function i1___lwmod ends ============

	signat	i1___lwmod,90
	global	_ReadButtons
psect	text1157,local,class=CODE,delta=2
global __ptext1157
__ptext1157:

;; *************** function _ReadButtons *****************
;; Defined at:
;;		line 62 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
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
;;		_isr1
;; This function uses a non-reentrant model
;;
psect	text1157
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	62
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 0
; Regs used in _ReadButtons: [wreg+status,2+status,0]
	line	64
	
i1l11163:	
;HMI.c: 64: if(!RB2) { UpDebounceCount++; if(UpDebounceCount >= 10 & UpReleased) { UpPressed = 1; UpReleased = 0; } } else { UpDebounceCount = 0; UpReleased = 1; } if(!RB3) { DownDebounceCount++; if(DownDebounceCount >= 10 & DownReleased) { DownPressed = 1; Down
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u407_21
	goto	u407_20
u407_21:
	goto	i1l4639
u407_20:
	
i1l11165:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_UpDebounceCount)^080h,f	;volatile
	
i1l11167:	
	movlw	(0Ah)
	subwf	(_UpDebounceCount)^080h,w	;volatile
	skipc
	goto	u408_21
	goto	u408_20
u408_21:
	goto	i1l4641
u408_20:
	
i1l11169:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u409_21
	goto	u409_20
u409_21:
	goto	i1l4641
u409_20:
	
i1l11171:	
	bsf	(_UpPressed/8),(_UpPressed)&7
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l4641
	
i1l4640:	
	goto	i1l4641
	
i1l4639:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_UpDebounceCount)^080h	;volatile
	bsf	(_UpReleased/8),(_UpReleased)&7
	
i1l4641:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(51/8),(51)&7
	goto	u410_21
	goto	u410_20
u410_21:
	goto	i1l4642
u410_20:
	
i1l11173:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_DownDebounceCount)^080h,f	;volatile
	
i1l11175:	
	movlw	(0Ah)
	subwf	(_DownDebounceCount)^080h,w	;volatile
	skipc
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l4644
u411_20:
	
i1l11177:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u412_21
	goto	u412_20
u412_21:
	goto	i1l4644
u412_20:
	
i1l11179:	
	bsf	(_DownPressed/8),(_DownPressed)&7
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l4644
	
i1l4643:	
	goto	i1l4644
	
i1l4642:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_DownDebounceCount)^080h	;volatile
	bsf	(_DownReleased/8),(_DownReleased)&7
	
i1l4644:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(52/8),(52)&7
	goto	u413_21
	goto	u413_20
u413_21:
	goto	i1l4645
u413_20:
	
i1l11181:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_LeftDebounceCount)^080h,f	;volatile
	
i1l11183:	
	movlw	(0Ah)
	subwf	(_LeftDebounceCount)^080h,w	;volatile
	skipc
	goto	u414_21
	goto	u414_20
u414_21:
	goto	i1l4647
u414_20:
	
i1l11185:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u415_21
	goto	u415_20
u415_21:
	goto	i1l4647
u415_20:
	
i1l11187:	
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l4647
	
i1l4646:	
	goto	i1l4647
	
i1l4645:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_LeftDebounceCount)^080h	;volatile
	bsf	(_LeftReleased/8),(_LeftReleased)&7
	
i1l4647:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u416_21
	goto	u416_20
u416_21:
	goto	i1l4648
u416_20:
	
i1l11189:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RightDebounceCount)^080h,f	;volatile
	
i1l11191:	
	movlw	(0Ah)
	subwf	(_RightDebounceCount)^080h,w	;volatile
	skipc
	goto	u417_21
	goto	u417_20
u417_21:
	goto	i1l4650
u417_20:
	
i1l11193:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u418_21
	goto	u418_20
u418_21:
	goto	i1l4650
u418_20:
	
i1l11195:	
	bsf	(_RightPressed/8),(_RightPressed)&7
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l4650
	
i1l4649:	
	goto	i1l4650
	
i1l4648:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_RightDebounceCount)^080h	;volatile
	bsf	(_RightReleased/8),(_RightReleased)&7
	
i1l4650:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u419_21
	goto	u419_20
u419_21:
	goto	i1l4651
u419_20:
	
i1l11197:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_CenterDebounceCount)^080h,f	;volatile
	
i1l11199:	
	movlw	(0Ah)
	subwf	(_CenterDebounceCount)^080h,w	;volatile
	skipc
	goto	u420_21
	goto	u420_20
u420_21:
	goto	i1l4653
u420_20:
	
i1l11201:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u421_21
	goto	u421_20
u421_21:
	goto	i1l4653
u421_20:
	
i1l11203:	
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l4653
	
i1l4652:	
	goto	i1l4653
	
i1l4651:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_CenterDebounceCount)^080h	;volatile
	bsf	(_CenterReleased/8),(_CenterReleased)&7
	
i1l4653:	
	line	66
;HMI.c: 66: if(UpPressed)
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u422_21
	goto	u422_20
u422_21:
	goto	i1l4654
u422_20:
	line	68
	
i1l11205:	
;HMI.c: 67: {
;HMI.c: 68: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	69
	
i1l11207:	
;HMI.c: 69: return 1;
	movlw	(01h)
	goto	i1l4655
	
i1l11209:	
	goto	i1l4655
	line	71
	
i1l4654:	
	line	73
;HMI.c: 71: }
;HMI.c: 73: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u423_21
	goto	u423_20
u423_21:
	goto	i1l4656
u423_20:
	line	75
	
i1l11211:	
;HMI.c: 74: {
;HMI.c: 75: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	76
	
i1l11213:	
;HMI.c: 76: return 2;
	movlw	(02h)
	goto	i1l4655
	
i1l11215:	
	goto	i1l4655
	line	78
	
i1l4656:	
	line	79
;HMI.c: 78: }
;HMI.c: 79: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u424_21
	goto	u424_20
u424_21:
	goto	i1l4657
u424_20:
	line	81
	
i1l11217:	
;HMI.c: 80: {
;HMI.c: 81: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	82
	
i1l11219:	
;HMI.c: 82: return 3;
	movlw	(03h)
	goto	i1l4655
	
i1l11221:	
	goto	i1l4655
	line	84
	
i1l4657:	
	line	85
;HMI.c: 84: }
;HMI.c: 85: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u425_21
	goto	u425_20
u425_21:
	goto	i1l4658
u425_20:
	line	87
	
i1l11223:	
;HMI.c: 86: {
;HMI.c: 87: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	88
	
i1l11225:	
;HMI.c: 88: return 4;
	movlw	(04h)
	goto	i1l4655
	
i1l11227:	
	goto	i1l4655
	line	90
	
i1l4658:	
	line	92
;HMI.c: 90: }
;HMI.c: 92: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u426_21
	goto	u426_20
u426_21:
	goto	i1l11235
u426_20:
	line	94
	
i1l11229:	
;HMI.c: 93: {
;HMI.c: 94: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	95
	
i1l11231:	
;HMI.c: 95: return 5;
	movlw	(05h)
	goto	i1l4655
	
i1l11233:	
	goto	i1l4655
	line	97
	
i1l4659:	
	line	98
	
i1l11235:	
;HMI.c: 97: }
;HMI.c: 98: return 0;
	movlw	(0)
	goto	i1l4655
	
i1l11237:	
	line	99
	
i1l4655:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
psect	text1158,local,class=CODE,delta=2
global __ptext1158
__ptext1158:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
