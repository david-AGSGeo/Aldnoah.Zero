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
	FNCALL	_GoHome,_robot_turnRight
	FNCALL	_GoHome,_readAvgDistance
	FNCALL	_GoHome,_robotFollow
	FNCALL	_GoHome,_robot_turnLeft
	FNCALL	_GoHome,_rotate
	FNCALL	_GoHome,_robotMoveSpeed
	FNCALL	_FindVictim,_readAvgDistance
	FNCALL	_FindVictim,_robotFollow
	FNCALL	_FindVictim,_RobotDrive
	FNCALL	_FindVictim,_robotTurnSpeed
	FNCALL	_FindVictim,_robotMoveSpeed
	FNCALL	_FindVictim,_ser_putch
	FNCALL	_FindVictim,_robot_turnLeft
	FNCALL	_FindVictim,_robot_turnRight
	FNCALL	_robot_turnLeft,_robotTurnSpeed
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
	FNCALL	_robot_turnRight,_RobotDrive
	FNCALL	_robot_turnRight,_rotate
	FNCALL	_robot_turnRight,_readAvgDistance
	FNCALL	_robot_turnRight,_robot_read
	FNCALL	_robot_turnRight,_UpdateDisplay
	FNCALL	_robot_turnRight,___awdiv
	FNCALL	_robot_turnRight,_abs
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
	global	_adcVal
	global	UpdateDisplay@F1263
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
	global	_FoundVictim
	global	_LeftDebounceCount
	global	_ROBOTerror
	global	_RightDebounceCount
	global	_RobotPos
	global	_UpDebounceCount
	global	_VictimSensor
	global	_VwallSensor
	global	_buttonPressed
	global	_currentFlw
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

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_adcVal:
       ds      2

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

_FoundVictim:
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

_currentFlw:
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
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
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
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	main@shortwall
main@shortwall:	; 2 bytes @ 0x0
	ds	2
	global	main@choice
main@choice:	; 1 bytes @ 0x2
	ds	1
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
	global	?_robot_turnLeft
?_robot_turnLeft:	; 0 bytes @ 0x0
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
	global	?_robot_turnRight
?_robot_turnRight:	; 0 bytes @ 0x3D
	global	?_robotFollow
?_robotFollow:	; 0 bytes @ 0x3D
	global	?_robotMoveSpeed
?_robotMoveSpeed:	; 0 bytes @ 0x3D
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
	global	??_FindVictim
??_FindVictim:	; 0 bytes @ 0x49
	global	??_GoHome
??_GoHome:	; 0 bytes @ 0x49
	ds	3
	global	??_main
??_main:	; 0 bytes @ 0x4C
	ds	2
;;Data sizes: Strings 200, constant 10, data 13, bss 106, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80     78      80
;; BANK1           80      3      71
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
;;   _GoHome->_robotFollow
;;   _FindVictim->_robotFollow
;;   _robot_turnLeft->_robotTurnSpeed
;;   _robotMoveSpeed->_UpdateDisplay
;;   _robotFollow->_UpdateDisplay
;;   _robot_turnRight->_UpdateDisplay
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
;; (0) _main                                                 5     5      0   43937
;;                                             76 BANK0      2     2      0
;;                                              0 BANK1      3     3      0
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
;; (1) _GoHome                                               1     1      0   16899
;;                                             73 BANK0      1     1      0
;;                     _robotTurnSpeed
;;                    _robot_turnRight
;;                    _readAvgDistance
;;                        _robotFollow
;;                     _robot_turnLeft
;;                             _rotate
;;                     _robotMoveSpeed
;; ---------------------------------------------------------------------------------
;; (1) _FindVictim                                           3     3      0   17003
;;                                             73 BANK0      3     3      0
;;                    _readAvgDistance
;;                        _robotFollow
;;                         _RobotDrive
;;                     _robotTurnSpeed
;;                     _robotMoveSpeed
;;                          _ser_putch
;;                     _robot_turnLeft
;;                    _robot_turnRight
;; ---------------------------------------------------------------------------------
;; (2) _robot_turnLeft                                       1     1      0    2621
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
;; (2) _robotFollow                                         12     7      5    3764
;;                                             61 BANK0     12     7      5
;;                         _RobotDrive
;;                          _ser_putch
;;                    _readAvgDistance
;;                             _rotate
;;                         _robot_read
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (2) _robot_turnRight                                     11     9      2    4370
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
;;     _robot_turnLeft
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
;;     _robot_turnRight
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
;;     _robot_turnRight
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
;;     _robot_turnLeft
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
;;BANK1               50      3      47       7       88.8%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      DF      12        0.0%
;;ABS                  0      0      D5       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       A       2        0.0%
;;BANK0               50     4E      50       5      100.0%
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
;;		line 173 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  shortwall       2    0[BANK1 ] int 
;;  choice          1    2[BANK1 ] unsigned char 
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
;;      Locals:         0       0       3       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       3       0       0
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
	line	173
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	174
	
l12488:	
;Main.c: 174: unsigned char choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@choice)^080h
	line	175
	
l12490:	
;Main.c: 175: int shortwall = 0;
	clrf	(main@shortwall)^080h
	clrf	(main@shortwall+1)^080h
	line	176
	
l12492:	
;Main.c: 176: currentFlw = 0;
	clrf	(_currentFlw)^080h
	line	177
	
l12494:	
;Main.c: 177: RobotPos = 0;
	clrf	(_RobotPos)^080h
	line	178
	
l12496:	
;Main.c: 178: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	line	180
	
l12498:	
;Main.c: 180: init();
	fcall	_init
	line	181
	
l12500:	
;Main.c: 181: robotLoadSong();
	fcall	_robotLoadSong
	goto	l12502
	line	183
;Main.c: 183: while(1)
	
l2292:	
	line	185
	
l12502:	
;Main.c: 184: {
;Main.c: 185: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5631
	goto	u5630
u5631:
	goto	l12514
u5630:
	line	187
	
l12504:	
;Main.c: 186: {
;Main.c: 187: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	188
	
l12506:	
;Main.c: 188: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	189
	
l12508:	
;Main.c: 189: readAvgDistance();
	fcall	_readAvgDistance
	line	190
	
l12510:	
;Main.c: 190: Disp2 = RobotPos;
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
	line	191
	
l12512:	
;Main.c: 191: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12514
	line	192
	
l2293:	
	line	193
	
l12514:	
;Main.c: 192: }
;Main.c: 193: if (buttonPressed)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_buttonPressed)^080h,w	;volatile
	skipz
	goto	u5640
	goto	l12540
u5640:
	line	196
	
l12516:	
;Main.c: 195: {
;Main.c: 196: choice = Menu(buttonPressed);
	movf	(_buttonPressed)^080h,w	;volatile
	fcall	_Menu
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@choice)^080h
	line	197
	
l12518:	
;Main.c: 197: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	goto	l12540
	line	198
	
l2294:	
	line	202
;Main.c: 198: }
;Main.c: 202: switch (choice)
	goto	l12540
	line	204
;Main.c: 203: {
;Main.c: 204: case 0:
	
l2296:	
	line	205
	
l12520:	
;Main.c: 205: calibrateIR();
	fcall	_calibrateIR
	line	206
;Main.c: 206: break;
	goto	l12542
	line	207
;Main.c: 207: case 1:
	
l2298:	
	line	208
;Main.c: 208: RobotPos = 0;
	clrf	(_RobotPos)^080h
	line	210
;Main.c: 210: break;
	goto	l12542
	line	211
;Main.c: 211: case 2:
	
l2299:	
	line	212
	
l12522:	
;Main.c: 212: RobotPos = 6;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_RobotPos)^080h
	line	214
;Main.c: 214: break;
	goto	l12542
	line	215
;Main.c: 215: case 3:
	
l2300:	
	line	217
	
l12524:	
;Main.c: 217: RobotPos = 12;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_RobotPos)^080h
	line	218
;Main.c: 218: break;
	goto	l12542
	line	219
;Main.c: 219: case 4:
	
l2301:	
	line	220
;Main.c: 220: FoundVictim = 0;
	clrf	(_FoundVictim)^080h
	line	221
	
l12526:	
;Main.c: 221: Init_Follow_IR();
	fcall	_Init_Follow_IR
	line	222
	
l12528:	
;Main.c: 222: currentMenu = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_currentMenu)^080h	;volatile
	line	223
	
l12530:	
;Main.c: 223: FindVictim();
	fcall	_FindVictim
	line	224
;Main.c: 224: if (FoundVictim)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_FoundVictim)^080h,w
	skipz
	goto	u5650
	goto	l12534
u5650:
	line	225
	
l12532:	
;Main.c: 225: GoHome();
	fcall	_GoHome
	goto	l12534
	
l2302:	
	line	226
	
l12534:	
;Main.c: 226: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	line	227
;Main.c: 227: break;
	goto	l12542
	line	229
;Main.c: 229: case 5:
	
l2303:	
	line	230
	
l12536:	
;Main.c: 230: ChargeMode();
	fcall	_ChargeMode
	line	231
;Main.c: 231: break;
	goto	l12542
	line	232
;Main.c: 232: default:
	
l2304:	
	line	234
;Main.c: 234: break;
	goto	l12542
	line	235
	
l12538:	
;Main.c: 235: }
	goto	l12542
	line	202
	
l2295:	
	
l12540:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@choice)^080h,w
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
	goto	l12520
	xorlw	1^0	; case 1
	skipnz
	goto	l2298
	xorlw	2^1	; case 2
	skipnz
	goto	l12522
	xorlw	3^2	; case 3
	skipnz
	goto	l12524
	xorlw	4^3	; case 4
	skipnz
	goto	l2301
	xorlw	5^4	; case 5
	skipnz
	goto	l12536
	goto	l12542
	opt asmopt_on

	line	235
	
l2297:	
	line	236
	
l12542:	
;Main.c: 236: choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@choice)^080h
	goto	l12502
	line	237
	
l2305:	
	line	183
	goto	l12502
	
l2306:	
	line	238
	
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
;;		line 248 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;		_robot_turnRight
;;		_readAvgDistance
;;		_robotFollow
;;		_robot_turnLeft
;;		_rotate
;;		_robotMoveSpeed
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1111
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	248
	global	__size_of_GoHome
	__size_of_GoHome	equ	__end_of_GoHome-_GoHome
	
_GoHome:	
	opt	stack 0
; Regs used in _GoHome: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	249
	
l12438:	
;Main.c: 249: switch (RobotPos)
	goto	l12446
	line	251
;Main.c: 250: {
;Main.c: 251: case 7:
	
l2314:	
	line	252
	
l12440:	
;Main.c: 252: robotTurnSpeed(175,400);
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
	line	253
;Main.c: 253: break;
	goto	l12486
	line	254
;Main.c: 254: case 15:
	
l2316:	
	line	255
	
l12442:	
;Main.c: 255: robotTurnSpeed(175,400);
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
	line	256
;Main.c: 256: robot_turnRight(200);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robot_turnRight)
	movlw	high(0C8h)
	movwf	((?_robot_turnRight))+1
	fcall	_robot_turnRight
	line	257
;Main.c: 257: break;
	goto	l12486
	line	258
	
l12444:	
;Main.c: 258: }
	goto	l12486
	line	249
	
l2313:	
	
l12446:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
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
	goto	l12440
	xorlw	15^7	; case 15
	skipnz
	goto	l12442
	goto	l12486
	opt asmopt_on

	line	258
	
l2315:	
	line	259
;Main.c: 259: while (ROBOTerror != 9)
	goto	l12486
	
l2318:	
	line	262
;Main.c: 260: {
;Main.c: 262: switch (ROBOTerror)
	goto	l12484
	line	264
;Main.c: 263: {
;Main.c: 264: case 0:
	
l2320:	
	line	266
	
l12448:	
;Main.c: 266: readAvgDistance();
	fcall	_readAvgDistance
	line	267
;Main.c: 267: robotFollow(200, adcVal, currentFlw);
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

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentFlw)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	268
;Main.c: 268: break;
	goto	l12486
	line	269
;Main.c: 269: case 1:
	
l2322:	
	line	270
	
l12450:	
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
	goto	l12486
	line	272
;Main.c: 272: case 2:
	
l2323:	
	line	273
	
l12452:	
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
	goto	l12486
	line	275
;Main.c: 275: case 3:
	
l2324:	
	line	276
	
l12454:	
;Main.c: 276: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	277
;Main.c: 277: break;
	goto	l12486
	line	278
;Main.c: 278: case 4:
	
l2325:	
	line	279
;Main.c: 279: ROBOTerror = 0;
	clrf	(_ROBOTerror)^080h
	line	280
;Main.c: 280: break;
	goto	l12486
	line	281
;Main.c: 281: case 9:
	
l2326:	
	line	283
;Main.c: 283: break;
	goto	l12486
	line	284
;Main.c: 284: case 10:
	
l2327:	
	line	285
	
l12456:	
;Main.c: 285: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	286
	
l12458:	
;Main.c: 286: robot_turnLeft();
	fcall	_robot_turnLeft
	line	287
	
l12460:	
;Main.c: 287: if (RobotPos == 17)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
	xorlw	011h
	skipz
	goto	u5611
	goto	u5610
u5611:
	goto	l12468
u5610:
	line	289
	
l12462:	
;Main.c: 288: {
;Main.c: 289: currentFlw = 1;
	clrf	(_currentFlw)^080h
	bsf	status,0
	rlf	(_currentFlw)^080h,f
	line	290
	
l12464:	
;Main.c: 290: rotate(50,1);
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
	line	291
	
l12466:	
;Main.c: 291: robotMoveSpeed(250,200);
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
	goto	l12468
	line	292
	
l2328:	
	line	293
	
l12468:	
;Main.c: 292: }
;Main.c: 293: readAvgDistance();
	fcall	_readAvgDistance
	line	294
	
l12470:	
;Main.c: 294: robotFollow(200, adcVal - 10, currentFlw);
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentFlw)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	295
;Main.c: 295: break;
	goto	l12486
	line	296
;Main.c: 296: case 11:
	
l2329:	
	line	297
	
l12472:	
;Main.c: 297: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	298
	
l12474:	
;Main.c: 298: robot_turnRight(200);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robot_turnRight)
	movlw	high(0C8h)
	movwf	((?_robot_turnRight))+1
	fcall	_robot_turnRight
	line	299
	
l12476:	
;Main.c: 299: readAvgDistance();
	fcall	_readAvgDistance
	line	300
	
l12478:	
;Main.c: 300: robotFollow(200, adcVal, currentFlw);
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

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentFlw)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	302
;Main.c: 302: break;
	goto	l12486
	line	303
;Main.c: 303: default:
	
l2330:	
	line	304
	
l12480:	
;Main.c: 304: readAvgDistance();
	fcall	_readAvgDistance
	line	305
;Main.c: 305: robotFollow(200, adcVal, currentFlw);
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

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentFlw)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	306
;Main.c: 306: break;
	goto	l12486
	line	308
	
l12482:	
;Main.c: 308: }
	goto	l12486
	line	262
	
l2319:	
	
l12484:	
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
	goto	l12448
	xorlw	1^0	; case 1
	skipnz
	goto	l12450
	xorlw	2^1	; case 2
	skipnz
	goto	l12452
	xorlw	3^2	; case 3
	skipnz
	goto	l12454
	xorlw	4^3	; case 4
	skipnz
	goto	l2325
	xorlw	9^4	; case 9
	skipnz
	goto	l12486
	xorlw	10^9	; case 10
	skipnz
	goto	l12456
	xorlw	11^10	; case 11
	skipnz
	goto	l12472
	goto	l12480
	opt asmopt_on

	line	308
	
l2321:	
	goto	l12486
	line	309
	
l2317:	
	line	259
	
l12486:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	xorlw	09h
	skipz
	goto	u5621
	goto	u5620
u5621:
	goto	l12484
u5620:
	goto	l2332
	
l2331:	
	line	311
	
l2332:	
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
;;		line 314 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;		_robot_turnLeft
;;		_robot_turnRight
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1112
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	314
	global	__size_of_FindVictim
	__size_of_FindVictim	equ	__end_of_FindVictim-_FindVictim
	
_FindVictim:	
	opt	stack 0
; Regs used in _FindVictim: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	315
	
l12368:	
;Main.c: 315: while (ROBOTerror != 9)
	goto	l12436
	
l2336:	
	line	318
;Main.c: 316: {
;Main.c: 318: switch (ROBOTerror)
	goto	l12434
	line	320
;Main.c: 319: {
;Main.c: 320: case 0:
	
l2338:	
	line	322
	
l12370:	
;Main.c: 322: readAvgDistance();
	fcall	_readAvgDistance
	line	323
;Main.c: 323: robotFollow(200, adcVal, currentFlw);
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

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentFlw)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	324
;Main.c: 324: break;
	goto	l12436
	line	325
;Main.c: 325: case 1:
	
l2340:	
	line	326
	
l12372:	
;Main.c: 326: if (RobotPos == 10)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
	xorlw	0Ah
	skipz
	goto	u5591
	goto	u5590
u5591:
	goto	l12384
u5590:
	line	328
	
l12374:	
;Main.c: 327: {
;Main.c: 328: RobotDrive(-200, 0x7FFF);
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
	line	329
	
l12376:	
;Main.c: 329: _delay((unsigned long)((200)*(20000000/4000.0)));
	opt asmopt_off
movlw  6
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_FindVictim+0)+0+2),f
movlw	19
movwf	((??_FindVictim+0)+0+1),f
	movlw	177
movwf	((??_FindVictim+0)+0),f
u5667:
	decfsz	((??_FindVictim+0)+0),f
	goto	u5667
	decfsz	((??_FindVictim+0)+0+1),f
	goto	u5667
	decfsz	((??_FindVictim+0)+0+2),f
	goto	u5667
	nop2
opt asmopt_on

	line	330
	
l12378:	
;Main.c: 330: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	331
	
l12380:	
;Main.c: 331: ROBOTerror = 0;
	clrf	(_ROBOTerror)^080h
	line	332
	
l12382:	
;Main.c: 332: robotTurnSpeed((-(angleTurned - 75)),400);
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
	line	333
;Main.c: 333: }
	goto	l12436
	line	334
	
l2341:	
	line	335
	
l12384:	
;Main.c: 334: else
;Main.c: 335: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l12436
	
l2342:	
	line	336
;Main.c: 336: break;
	goto	l12436
	line	337
;Main.c: 337: case 2:
	
l2343:	
	line	338
	
l12386:	
;Main.c: 338: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	339
;Main.c: 339: break;
	goto	l12436
	line	340
;Main.c: 340: case 3:
	
l2344:	
	line	341
	
l12388:	
;Main.c: 341: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	342
	
l12390:	
;Main.c: 342: ROBOTerror = 0;
	clrf	(_ROBOTerror)^080h
	line	344
	
l12392:	
;Main.c: 344: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_FindVictim+0)+0+2),f
movlw	94
movwf	((??_FindVictim+0)+0+1),f
	movlw	134
movwf	((??_FindVictim+0)+0),f
u5677:
	decfsz	((??_FindVictim+0)+0),f
	goto	u5677
	decfsz	((??_FindVictim+0)+0+1),f
	goto	u5677
	decfsz	((??_FindVictim+0)+0+2),f
	goto	u5677
	clrwdt
opt asmopt_on

	line	345
	
l12394:	
;Main.c: 345: robotMoveSpeed(-200,-200);
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
	line	346
	
l12396:	
;Main.c: 346: robotTurnSpeed((-angleTurned-10),400);
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
	line	347
	
l12398:	
;Main.c: 347: robotMoveSpeed(250,200);
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
	line	348
	
l12400:	
;Main.c: 348: readAvgDistance();
	fcall	_readAvgDistance
	line	349
	
l12402:	
;Main.c: 349: robotFollow(200, adcVal - 10, currentFlw);
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentFlw)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	350
;Main.c: 350: break;
	goto	l12436
	line	351
;Main.c: 351: case 4:
	
l2345:	
	line	352
	
l12404:	
;Main.c: 352: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	353
;Main.c: 353: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	354
	
l12406:	
;Main.c: 354: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	355
	
l12408:	
;Main.c: 355: FoundVictim = 1;
	clrf	(_FoundVictim)^080h
	bsf	status,0
	rlf	(_FoundVictim)^080h,f
	line	356
	
l12410:	
;Main.c: 356: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	357
;Main.c: 357: break;
	goto	l12436
	line	358
;Main.c: 358: case 9:
	
l2346:	
	line	359
	
l12412:	
;Main.c: 359: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	360
;Main.c: 360: break;
	goto	l12436
	line	361
;Main.c: 361: case 10:
	
l2347:	
	line	362
	
l12414:	
;Main.c: 362: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	364
	
l12416:	
;Main.c: 364: robot_turnLeft();
	fcall	_robot_turnLeft
	line	367
	
l12418:	
;Main.c: 367: readAvgDistance();
	fcall	_readAvgDistance
	line	368
	
l12420:	
;Main.c: 368: robotFollow(200, adcVal - 10, currentFlw);
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentFlw)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	369
;Main.c: 369: break;
	goto	l12436
	line	370
;Main.c: 370: case 11:
	
l2348:	
	line	371
	
l12422:	
;Main.c: 371: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	373
	
l12424:	
;Main.c: 373: robot_turnRight(200);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robot_turnRight)
	movlw	high(0C8h)
	movwf	((?_robot_turnRight))+1
	fcall	_robot_turnRight
	line	375
	
l12426:	
;Main.c: 375: readAvgDistance();
	fcall	_readAvgDistance
	line	376
	
l12428:	
;Main.c: 376: robotFollow(200, adcVal, currentFlw);
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

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentFlw)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	378
;Main.c: 378: break;
	goto	l12436
	line	379
;Main.c: 379: default:
	
l2349:	
	line	380
	
l12430:	
;Main.c: 380: readAvgDistance();
	fcall	_readAvgDistance
	line	381
;Main.c: 381: robotFollow(200, adcVal, currentFlw);
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

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentFlw)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	movwf	0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	382
;Main.c: 382: break;
	goto	l12436
	line	384
	
l12432:	
;Main.c: 384: }
	goto	l12436
	line	318
	
l2337:	
	
l12434:	
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
	goto	l12370
	xorlw	1^0	; case 1
	skipnz
	goto	l12372
	xorlw	2^1	; case 2
	skipnz
	goto	l12386
	xorlw	3^2	; case 3
	skipnz
	goto	l12388
	xorlw	4^3	; case 4
	skipnz
	goto	l12404
	xorlw	9^4	; case 9
	skipnz
	goto	l12412
	xorlw	10^9	; case 10
	skipnz
	goto	l12414
	xorlw	11^10	; case 11
	skipnz
	goto	l12422
	goto	l12430
	opt asmopt_on

	line	384
	
l2339:	
	goto	l12436
	line	385
	
l2335:	
	line	315
	
l12436:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	xorlw	09h
	skipz
	goto	u5601
	goto	u5600
u5601:
	goto	l12434
u5600:
	goto	l2351
	
l2350:	
	line	386
	
l2351:	
	return
	opt stack 0
GLOBAL	__end_of_FindVictim
	__end_of_FindVictim:
;; =============== function _FindVictim ends ============

	signat	_FindVictim,88
	global	_robot_turnLeft
psect	text1113,local,class=CODE,delta=2
global __ptext1113
__ptext1113:

;; *************** function _robot_turnLeft *****************
;; Defined at:
;;		line 280 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
	line	280
	global	__size_of_robot_turnLeft
	__size_of_robot_turnLeft	equ	__end_of_robot_turnLeft-_robot_turnLeft
	
_robot_turnLeft:	
	opt	stack 0
; Regs used in _robot_turnLeft: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	281
	
l12350:	
;robot.c: 281: switch (RobotPos)
	goto	l12366
	line	283
;robot.c: 282: {
;robot.c: 283: case 8:
	
l6263:	
	line	284
	
l12352:	
;robot.c: 284: robotTurnSpeed(160,400);
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
	line	285
	
l12354:	
;robot.c: 285: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnLeft+0)+0
	movf	(??_robot_turnLeft+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	286
;robot.c: 286: break;
	goto	l6268
	line	287
;robot.c: 287: case 12:
	
l6265:	
	line	288
	
l12356:	
;robot.c: 288: robotTurnSpeed(70,400);
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
	line	289
;robot.c: 289: break;
	goto	l6268
	line	290
;robot.c: 290: case 15:
	
l6266:	
	line	291
	
l12358:	
;robot.c: 291: robotTurnSpeed(160,400);
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
	line	292
	
l12360:	
;robot.c: 292: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnLeft+0)+0
	movf	(??_robot_turnLeft+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	293
;robot.c: 293: break;
	goto	l6268
	line	294
;robot.c: 294: default:
	
l6267:	
	line	295
	
l12362:	
;robot.c: 295: robotTurnSpeed(80,400);
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
	line	296
;robot.c: 296: break;
	goto	l6268
	line	297
	
l12364:	
;robot.c: 297: }
	goto	l6268
	line	281
	
l6262:	
	
l12366:	
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
	goto	l12352
	xorlw	12^8	; case 12
	skipnz
	goto	l12356
	xorlw	15^12	; case 15
	skipnz
	goto	l12358
	goto	l12362
	opt asmopt_on

	line	297
	
l6264:	
	line	298
	
l6268:	
	return
	opt stack 0
GLOBAL	__end_of_robot_turnLeft
	__end_of_robot_turnLeft:
;; =============== function _robot_turnLeft ends ============

	signat	_robot_turnLeft,88
	global	_Init_Follow_IR
psect	text1114,local,class=CODE,delta=2
global __ptext1114
__ptext1114:

;; *************** function _Init_Follow_IR *****************
;; Defined at:
;;		line 241 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
	line	241
	global	__size_of_Init_Follow_IR
	__size_of_Init_Follow_IR	equ	__end_of_Init_Follow_IR-_Init_Follow_IR
	
_Init_Follow_IR:	
	opt	stack 1
; Regs used in _Init_Follow_IR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	242
	
l12344:	
;Main.c: 242: calibrateIR();
	fcall	_calibrateIR
	line	243
	
l12346:	
;Main.c: 243: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_Init_Follow_IR+0)+0+2),f
movlw	175
movwf	((??_Init_Follow_IR+0)+0+1),f
	movlw	193
movwf	((??_Init_Follow_IR+0)+0),f
u5687:
	decfsz	((??_Init_Follow_IR+0)+0),f
	goto	u5687
	decfsz	((??_Init_Follow_IR+0)+0+1),f
	goto	u5687
	decfsz	((??_Init_Follow_IR+0)+0+2),f
	goto	u5687
	clrwdt
opt asmopt_on

	line	244
	
l12348:	
;Main.c: 244: rotate(25, 0);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	245
	
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
;;		line 456 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
	line	456
	global	__size_of_robotMoveSpeed
	__size_of_robotMoveSpeed	equ	__end_of_robotMoveSpeed-_robotMoveSpeed
	
_robotMoveSpeed:	
	opt	stack 1
; Regs used in _robotMoveSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	457
	
l12300:	
;robot.c: 457: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	459
	
l12302:	
;robot.c: 458: int temp1;
;robot.c: 459: RobotDrive(speed, 0x7FFF);
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
	line	462
;robot.c: 462: while (abs(distTravelled) < abs(distance))
	goto	l12336
	
l6307:	
	line	464
	
l12304:	
;robot.c: 463: {
;robot.c: 464: robot_read(0);
	movlw	(0)
	fcall	_robot_read
	line	465
	
l12306:	
;robot.c: 465: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5540
	goto	l12310
u5540:
	line	467
	
l12308:	
;robot.c: 466: {
;robot.c: 467: ROBOTerror = 1;
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	468
;robot.c: 468: break;
	goto	l12338
	line	469
	
l6308:	
	line	470
	
l12310:	
;robot.c: 469: }
;robot.c: 470: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5550
	goto	l12314
u5550:
	line	472
	
l12312:	
;robot.c: 471: {
;robot.c: 472: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	473
;robot.c: 473: break;
	goto	l12338
	line	474
	
l6310:	
	line	475
	
l12314:	
;robot.c: 474: }
;robot.c: 475: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5560
	goto	l12318
u5560:
	line	477
	
l12316:	
;robot.c: 476: {
;robot.c: 477: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	478
;robot.c: 478: break;
	goto	l12338
	line	479
	
l6311:	
	line	480
	
l12318:	
;robot.c: 479: }
;robot.c: 480: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5571
	goto	u5570
u5571:
	goto	l12322
u5570:
	line	482
	
l12320:	
;robot.c: 481: {
;robot.c: 482: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	483
;robot.c: 483: break;
	goto	l12338
	line	484
	
l6312:	
	line	485
	
l12322:	
;robot.c: 484: }
;robot.c: 485: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	clrf	(??_robotMoveSpeed+0)+0+1
	movf	0+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1)
	movf	1+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1+1)
	line	486
	
l12324:	
;robot.c: 486: temp1 = temp1 << 8;
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
	line	487
	
l12326:	
;robot.c: 487: temp1 += DistLowByte;
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
	line	488
	
l12328:	
;robot.c: 488: distTravelled += temp1;
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
	line	489
	
l12330:	
;robot.c: 489: TotalDistTravelled += temp1;
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
	line	490
	
l12332:	
;robot.c: 490: Disp2 = distTravelled;
	movf	(_distTravelled+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_distTravelled)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	491
	
l12334:	
;robot.c: 491: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12336
	line	497
	
l6306:	
	line	462
	
l12336:	
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
	goto	u5585
	movf	(0+(?_abs)),w
	subwf	0+(??_robotMoveSpeed+0)+0,w
u5585:

	skipc
	goto	u5581
	goto	u5580
u5581:
	goto	l12304
u5580:
	goto	l12338
	
l6309:	
	line	498
	
l12338:	
;robot.c: 497: }
;robot.c: 498: Disp2 = ROBOTerror;
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
	line	499
	
l12340:	
;robot.c: 499: UpdateDisplay();
	fcall	_UpdateDisplay
	line	500
	
l12342:	
;robot.c: 500: RobotDrive(0, 0x7FFF);
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
	line	502
	
l6313:	
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
	line	187
	global	__size_of_robotFollow
	__size_of_robotFollow	equ	__end_of_robotFollow-_robotFollow
	
_robotFollow:	
	opt	stack 0
; Regs used in _robotFollow: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	188
	
l12196:	
;robot.c: 188: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	190
	
l12198:	
;robot.c: 189: int temp1;
;robot.c: 190: unsigned char hysterysis = 20;
	movlw	(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	movwf	(robotFollow@hysterysis)
	line	191
	
l12200:	
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
	
l12202:	
;robot.c: 192: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	goto	l12204
	line	195
;robot.c: 195: while (1)
	
l6237:	
	line	197
	
l12204:	
;robot.c: 196: {
;robot.c: 197: if ((AdcTarget + 100) <= hysterysis)
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
	goto	u5395
	movf	0+(??_robotFollow+0)+0,w
	subwf	(robotFollow@hysterysis),w
u5395:

	skipc
	goto	u5391
	goto	u5390
u5391:
	goto	l12208
u5390:
	line	199
	
l12206:	
;robot.c: 198: {
;robot.c: 199: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	200
;robot.c: 200: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	goto	l12208
	line	201
	
l6238:	
	line	202
	
l12208:	
;robot.c: 201: }
;robot.c: 202: if (AdcTarget > 100)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(065h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5405
	movlw	low(065h)
	subwf	(robotFollow@AdcTarget),w
u5405:

	skipc
	goto	u5401
	goto	u5400
u5401:
	goto	l12212
u5400:
	line	203
	
l12210:	
;robot.c: 203: AdcTarget--;
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(robotFollow@AdcTarget),f
	skipnc
	incf	(robotFollow@AdcTarget+1),f
	movlw	high(-1)
	addwf	(robotFollow@AdcTarget+1),f
	goto	l12212
	
l6239:	
	line	204
	
l12212:	
;robot.c: 204: if (AdcTarget < 100)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(064h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5415
	movlw	low(064h)
	subwf	(robotFollow@AdcTarget),w
u5415:

	skipnc
	goto	u5411
	goto	u5410
u5411:
	goto	l12216
u5410:
	line	205
	
l12214:	
;robot.c: 205: AdcTarget++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(robotFollow@AdcTarget),f
	skipnc
	incf	(robotFollow@AdcTarget+1),f
	movlw	high(01h)
	addwf	(robotFollow@AdcTarget+1),f
	goto	l12216
	
l6240:	
	line	206
	
l12216:	
;robot.c: 206: readAvgDistance();
	fcall	_readAvgDistance
	line	207
	
l12218:	
;robot.c: 207: if (adcVal > (AdcTarget) && adcVal < (AdcTarget + hysterysis))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	subwf	(robotFollow@AdcTarget+1),w
	skipz
	goto	u5425
	movf	(_adcVal),w	;volatile
	subwf	(robotFollow@AdcTarget),w
u5425:
	skipnc
	goto	u5421
	goto	u5420
u5421:
	goto	l12224
u5420:
	
l12220:	
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
	goto	u5435
	movf	0+(??_robotFollow+0)+0,w
	subwf	(_adcVal),w	;volatile
u5435:
	skipnc
	goto	u5431
	goto	u5430
u5431:
	goto	l12224
u5430:
	line	209
	
l12222:	
;robot.c: 208: {
;robot.c: 209: RobotDrive(speed, 1700);
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
	line	210
;robot.c: 210: }
	goto	l6242
	line	211
	
l6241:	
	
l12224:	
;robot.c: 211: else if (adcVal < (AdcTarget) && adcVal > (AdcTarget - hysterysis))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	subwf	(_adcVal+1),w	;volatile
	skipz
	goto	u5445
	movf	(robotFollow@AdcTarget),w
	subwf	(_adcVal),w	;volatile
u5445:
	skipnc
	goto	u5441
	goto	u5440
u5441:
	goto	l12230
u5440:
	
l12226:	
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
	goto	u5455
	movf	(_adcVal),w	;volatile
	subwf	0+(??_robotFollow+2)+0,w
u5455:
	skipnc
	goto	u5451
	goto	u5450
u5451:
	goto	l12230
u5450:
	line	213
	
l12228:	
;robot.c: 212: {
;robot.c: 213: RobotDrive(speed, -1700);
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
	line	214
;robot.c: 214: }
	goto	l6242
	line	215
	
l6243:	
	
l12230:	
;robot.c: 215: else if (adcVal <= (AdcTarget - hysterysis) || adcVal >= (AdcTarget + hysterysis))
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
	goto	u5465
	movf	(_adcVal),w	;volatile
	subwf	0+(??_robotFollow+2)+0,w
u5465:
	skipnc
	goto	u5461
	goto	u5460
u5461:
	goto	l12234
u5460:
	
l12232:	
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
	goto	u5475
	movf	0+(??_robotFollow+0)+0,w
	subwf	(_adcVal),w	;volatile
u5475:
	skipc
	goto	u5471
	goto	u5470
u5471:
	goto	l12256
u5470:
	goto	l12234
	
l6247:	
	line	217
	
l12234:	
;robot.c: 216: {
;robot.c: 217: if (followDir == 0)
	movf	(robotFollow@followDir),f
	skipz
	goto	u5481
	goto	u5480
u5481:
	goto	l12242
u5480:
	line	219
	
l12236:	
;robot.c: 218: {
;robot.c: 219: rotate(10,1);
	movlw	low(0Ah)
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	line	220
	
l12238:	
;robot.c: 220: readAvgDistance();
	fcall	_readAvgDistance
	line	221
	
l12240:	
;robot.c: 221: rotate(10,0);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	222
;robot.c: 222: }
	goto	l12248
	line	223
	
l6248:	
	line	225
	
l12242:	
;robot.c: 223: else
;robot.c: 224: {
;robot.c: 225: rotate(10,0);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	226
	
l12244:	
;robot.c: 226: readAvgDistance();
	fcall	_readAvgDistance
	line	227
	
l12246:	
;robot.c: 227: rotate(10,1);
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
	goto	l12248
	line	228
	
l6249:	
	line	229
	
l12248:	
;robot.c: 228: }
;robot.c: 229: if (adcVal < 50)
	movlw	high(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(032h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u5491
	goto	u5490
u5491:
	goto	l12252
u5490:
	line	230
	
l12250:	
;robot.c: 230: ROBOTerror = 11;
	movlw	(0Bh)
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l12296
	line	231
	
l6250:	
	line	232
	
l12252:	
;robot.c: 231: else
;robot.c: 232: ROBOTerror = 10;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l12296
	
l6251:	
	line	234
;robot.c: 234: break;
	goto	l12296
	line	235
	
l12254:	
;robot.c: 235: }
	goto	l6242
	line	236
	
l6245:	
	line	238
	
l12256:	
;robot.c: 236: else
;robot.c: 237: {
;robot.c: 238: RobotDrive(speed, 0x7FFF);
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
	goto	l6242
	line	239
	
l6253:	
	goto	l6242
	
l6244:	
	
l6242:	
	line	240
;robot.c: 239: }
;robot.c: 240: robot_read(0);
	movlw	(0)
	fcall	_robot_read
	line	241
	
l12258:	
;robot.c: 241: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5500
	goto	l12264
u5500:
	line	243
	
l12260:	
;robot.c: 242: {
;robot.c: 243: RobotDrive(0, 0x7FFF);
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
	line	244
	
l12262:	
;robot.c: 244: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	245
;robot.c: 245: break;
	goto	l12296
	line	246
	
l6254:	
	line	247
	
l12264:	
;robot.c: 246: }
;robot.c: 247: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5510
	goto	l12270
u5510:
	line	249
	
l12266:	
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
	
l12268:	
;robot.c: 250: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	251
;robot.c: 251: break;
	goto	l12296
	line	252
	
l6255:	
	line	253
	
l12270:	
;robot.c: 252: }
;robot.c: 253: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5520
	goto	l12276
u5520:
	line	255
	
l12272:	
;robot.c: 254: {
;robot.c: 255: RobotDrive(-200, 0x7FFF);
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
	line	256
	
l12274:	
;robot.c: 256: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	257
;robot.c: 257: break;
	goto	l12296
	line	258
	
l6256:	
	line	259
	
l12276:	
;robot.c: 258: }
;robot.c: 259: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5531
	goto	u5530
u5531:
	goto	l12282
u5530:
	line	261
	
l12278:	
;robot.c: 260: {
;robot.c: 261: RobotDrive(0, 0x7FFF);
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
	line	262
	
l12280:	
;robot.c: 262: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	263
;robot.c: 263: break;
	goto	l12296
	line	264
	
l6257:	
	line	265
	
l12282:	
;robot.c: 264: }
;robot.c: 265: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	clrf	(??_robotFollow+0)+0+1
	movf	0+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1)
	movf	1+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1+1)
	line	266
	
l12284:	
;robot.c: 266: temp1 = temp1 << 8;
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
	line	267
	
l12286:	
;robot.c: 267: temp1 += DistLowByte;
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
	line	268
	
l12288:	
;robot.c: 268: distTravelled += temp1;
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
	line	269
	
l12290:	
;robot.c: 269: TotalDistTravelled += temp1;
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
	line	271
	
l12292:	
;robot.c: 271: Disp2 = RobotPos;
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
	line	272
	
l12294:	
;robot.c: 272: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12204
	line	273
	
l6258:	
	line	195
	goto	l12204
	
l6252:	
	line	275
	
l12296:	
;robot.c: 273: }
;robot.c: 275: Disp2 = RobotPos;
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
	line	276
	
l12298:	
;robot.c: 276: UpdateDisplay();
	fcall	_UpdateDisplay
	line	277
	
l6259:	
	return
	opt stack 0
GLOBAL	__end_of_robotFollow
	__end_of_robotFollow:
;; =============== function _robotFollow ends ============

	signat	_robotFollow,12408
	global	_robot_turnRight
psect	text1117,local,class=CODE,delta=2
global __ptext1117
__ptext1117:

;; *************** function _robot_turnRight *****************
;; Defined at:
;;		line 301 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
	line	301
	global	__size_of_robot_turnRight
	__size_of_robot_turnRight	equ	__end_of_robot_turnRight-_robot_turnRight
	
_robot_turnRight:	
	opt	stack 0
; Regs used in _robot_turnRight: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	303
	
l12032:	
;robot.c: 303: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	305
;robot.c: 304: int temp1;
;robot.c: 305: int turnTarget = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robot_turnRight@turnTarget)
	clrf	(robot_turnRight@turnTarget+1)
	line	306
	
l12034:	
;robot.c: 306: RobotDrive(speed, 0x7FFF);
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
	line	307
	
l12036:	
;robot.c: 307: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	line	308
	
l12038:	
;robot.c: 308: rotate(25, 0);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	309
	
l12040:	
;robot.c: 309: readAvgDistance();
	fcall	_readAvgDistance
	line	310
	
l12042:	
;robot.c: 310: int AdcTarget = adcVal;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(robot_turnRight@AdcTarget+1)	;volatile
	addwf	(robot_turnRight@AdcTarget+1)	;volatile
	movf	(_adcVal),w	;volatile
	clrf	(robot_turnRight@AdcTarget)	;volatile
	addwf	(robot_turnRight@AdcTarget)	;volatile

	goto	l12044
	line	312
;robot.c: 312: while (1)
	
l6271:	
	line	314
	
l12044:	
;robot.c: 313: {
;robot.c: 314: readAvgDistance();
	fcall	_readAvgDistance
	line	315
	
l12046:	
;robot.c: 315: if (adcVal > (AdcTarget) && adcVal < (AdcTarget + 15))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	subwf	(robot_turnRight@AdcTarget+1),w
	skipz
	goto	u5245
	movf	(_adcVal),w	;volatile
	subwf	(robot_turnRight@AdcTarget),w
u5245:
	skipnc
	goto	u5241
	goto	u5240
u5241:
	goto	l12052
u5240:
	
l12048:	
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
	goto	u5255
	movf	0+(??_robot_turnRight+0)+0,w
	subwf	(_adcVal),w	;volatile
u5255:
	skipnc
	goto	u5251
	goto	u5250
u5251:
	goto	l12052
u5250:
	line	317
	
l12050:	
;robot.c: 316: {
;robot.c: 317: RobotDrive(speed, 1700);
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
	line	318
;robot.c: 318: }
	goto	l6273
	line	319
	
l6272:	
	
l12052:	
;robot.c: 319: else if (adcVal < (AdcTarget) && adcVal > (AdcTarget - 15))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnRight@AdcTarget+1),w
	subwf	(_adcVal+1),w	;volatile
	skipz
	goto	u5265
	movf	(robot_turnRight@AdcTarget),w
	subwf	(_adcVal),w	;volatile
u5265:
	skipnc
	goto	u5261
	goto	u5260
u5261:
	goto	l12058
u5260:
	
l12054:	
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
	goto	u5275
	movf	(_adcVal),w	;volatile
	subwf	0+(??_robot_turnRight+0)+0,w
u5275:
	skipnc
	goto	u5271
	goto	u5270
u5271:
	goto	l12058
u5270:
	line	321
	
l12056:	
;robot.c: 320: {
;robot.c: 321: RobotDrive(speed, -1700);
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
	line	322
;robot.c: 322: }
	goto	l6273
	line	323
	
l6274:	
	
l12058:	
;robot.c: 323: else if (adcVal <= (AdcTarget - 50) || adcVal >= (AdcTarget + 15))
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
	goto	u5285
	movf	(_adcVal),w	;volatile
	subwf	0+(??_robot_turnRight+0)+0,w
u5285:
	skipnc
	goto	u5281
	goto	u5280
u5281:
	goto	l12106
u5280:
	
l12060:	
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
	goto	u5295
	movf	0+(??_robot_turnRight+0)+0,w
	subwf	(_adcVal),w	;volatile
u5295:
	skipc
	goto	u5291
	goto	u5290
u5291:
	goto	l12064
u5290:
	goto	l12106
	
l6278:	
	line	325
;robot.c: 324: {
;robot.c: 325: break;
	goto	l12106
	line	326
	
l12062:	
;robot.c: 326: }
	goto	l6273
	line	328
	
l6276:	
	line	330
	
l12064:	
;robot.c: 328: else
;robot.c: 329: {
;robot.c: 330: RobotDrive(speed, 0x7FFF);
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
	goto	l6273
	line	331
	
l6280:	
	goto	l6273
	
l6275:	
	
l6273:	
	line	332
;robot.c: 331: }
;robot.c: 332: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	333
	
l12066:	
;robot.c: 333: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5300
	goto	l12072
u5300:
	line	335
	
l12068:	
;robot.c: 334: {
;robot.c: 335: RobotDrive(0, 0x7FFF);
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
	line	336
	
l12070:	
;robot.c: 336: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	337
;robot.c: 337: break;
	goto	l12106
	line	338
	
l6281:	
	line	339
	
l12072:	
;robot.c: 338: }
;robot.c: 339: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5310
	goto	l12078
u5310:
	line	341
	
l12074:	
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
	
l12076:	
;robot.c: 342: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	343
;robot.c: 343: break;
	goto	l12106
	line	344
	
l6282:	
	line	345
	
l12078:	
;robot.c: 344: }
;robot.c: 345: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5320
	goto	l12084
u5320:
	line	347
	
l12080:	
;robot.c: 346: {
;robot.c: 347: RobotDrive(-200, 0x7FFF);
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
	line	348
	
l12082:	
;robot.c: 348: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	349
;robot.c: 349: break;
	goto	l12106
	line	350
	
l6283:	
	line	351
	
l12084:	
;robot.c: 350: }
;robot.c: 351: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5331
	goto	u5330
u5331:
	goto	l12090
u5330:
	line	353
	
l12086:	
;robot.c: 352: {
;robot.c: 353: RobotDrive(0, 0x7FFF);
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
	line	354
	
l12088:	
;robot.c: 354: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	355
;robot.c: 355: break;
	goto	l12106
	line	356
	
l6284:	
	line	357
	
l12090:	
;robot.c: 356: }
;robot.c: 357: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	358
	
l12092:	
;robot.c: 358: temp1 = temp1 << 8;
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
	line	359
	
l12094:	
;robot.c: 359: temp1 += DistLowByte;
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
	line	360
	
l12096:	
;robot.c: 360: distTravelled += temp1;
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
	line	361
	
l12098:	
;robot.c: 361: TotalDistTravelled += temp1;
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
	line	362
	
l12100:	
;robot.c: 362: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	363
	
l12102:	
;robot.c: 363: temp1 = temp1 << 8;
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
	line	364
;robot.c: 364: temp1 += AngleLowByte;
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
	line	365
;robot.c: 365: angleTurned += temp1;
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
	line	366
;robot.c: 366: Disp2 = RobotPos;
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
	line	367
	
l12104:	
;robot.c: 367: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12044
	line	368
	
l6285:	
	line	312
	goto	l12044
	
l6279:	
	line	370
	
l12106:	
;robot.c: 368: }
;robot.c: 370: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	371
;robot.c: 371: switch (RobotPos)
	goto	l12142
	line	373
;robot.c: 372: {
;robot.c: 373: case 3:
	
l6287:	
	line	374
	
l12108:	
;robot.c: 374: RobotDrive((speed /2), -400);
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
	line	375
	
l12110:	
;robot.c: 375: turnTarget = -90;
	movlw	low(-90)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-90)
	movwf	((robot_turnRight@turnTarget))+1
	line	376
;robot.c: 376: break;
	goto	l12144
	line	378
;robot.c: 378: case 7:
	
l6289:	
	line	379
	
l12112:	
;robot.c: 379: RobotDrive((speed), -400-100);
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
	line	380
	
l12114:	
;robot.c: 380: turnTarget = -185;
	movlw	low(-185)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-185)
	movwf	((robot_turnRight@turnTarget))+1
	line	381
;robot.c: 381: break;
	goto	l12144
	line	382
;robot.c: 382: case 10:
	
l6290:	
	line	383
	
l12116:	
;robot.c: 383: RobotDrive((speed), -400 );
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
	line	384
	
l12118:	
;robot.c: 384: turnTarget = -90;
	movlw	low(-90)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-90)
	movwf	((robot_turnRight@turnTarget))+1
	line	385
;robot.c: 385: break;
	goto	l12144
	line	386
;robot.c: 386: case 11:
	
l6291:	
	line	387
	
l12120:	
;robot.c: 387: RobotDrive((speed), -400 - 100);
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
	line	388
	
l12122:	
;robot.c: 388: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnRight@turnTarget))+1
	line	389
;robot.c: 389: break;
	goto	l12144
	line	390
;robot.c: 390: case 12:
	
l6292:	
	line	391
	
l12124:	
;robot.c: 391: RobotDrive((speed), -400 - 50);
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
	line	392
	
l12126:	
;robot.c: 392: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnRight@turnTarget))+1
	line	393
;robot.c: 393: break;
	goto	l12144
	line	394
;robot.c: 394: case 15:
	
l6293:	
	line	395
	
l12128:	
;robot.c: 395: RobotDrive((speed), -400 - 100);
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
	line	396
	
l12130:	
;robot.c: 396: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnRight@turnTarget))+1
	line	397
;robot.c: 397: break;
	goto	l12144
	line	398
;robot.c: 398: case 17:
	
l6294:	
	line	399
	
l12132:	
;robot.c: 399: RobotDrive((speed), -400 - 100);
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
	line	400
	
l12134:	
;robot.c: 400: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnRight@turnTarget))+1
	line	401
;robot.c: 401: break;
	goto	l12144
	line	402
;robot.c: 402: default:
	
l6295:	
	line	403
	
l12136:	
;robot.c: 403: RobotDrive((speed), -400);
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
	line	404
	
l12138:	
;robot.c: 404: turnTarget = -75;
	movlw	low(-75)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnRight@turnTarget)
	movlw	high(-75)
	movwf	((robot_turnRight@turnTarget))+1
	line	405
;robot.c: 405: break;
	goto	l12144
	line	406
	
l12140:	
;robot.c: 406: }
	goto	l12144
	line	371
	
l6286:	
	
l12142:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 3 to 17
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           22    12 (average)
; direct_byte           56    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	3^0	; case 3
	skipnz
	goto	l12108
	xorlw	7^3	; case 7
	skipnz
	goto	l12112
	xorlw	10^7	; case 10
	skipnz
	goto	l12116
	xorlw	11^10	; case 11
	skipnz
	goto	l12120
	xorlw	12^11	; case 12
	skipnz
	goto	l12124
	xorlw	15^12	; case 15
	skipnz
	goto	l12128
	xorlw	17^15	; case 17
	skipnz
	goto	l12132
	goto	l12136
	opt asmopt_on

	line	406
	
l6288:	
	line	407
	
l12144:	
;robot.c: 407: rotate(25, 1);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	line	408
;robot.c: 408: while (abs(angleTurned) < abs(turnTarget))
	goto	l12190
	
l6297:	
	line	410
	
l12146:	
;robot.c: 409: {
;robot.c: 410: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	411
	
l12148:	
;robot.c: 411: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5340
	goto	l12154
u5340:
	line	413
	
l12150:	
;robot.c: 412: {
;robot.c: 413: RobotDrive(0, 0x7FFF);
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
	line	414
	
l12152:	
;robot.c: 414: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	415
;robot.c: 415: break;
	goto	l12192
	line	416
	
l6298:	
	line	417
	
l12154:	
;robot.c: 416: }
;robot.c: 417: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5350
	goto	l12160
u5350:
	line	419
	
l12156:	
;robot.c: 418: {
;robot.c: 419: RobotDrive(0, 0x7FFF);
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
	line	420
	
l12158:	
;robot.c: 420: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	421
;robot.c: 421: break;
	goto	l12192
	line	422
	
l6300:	
	line	423
	
l12160:	
;robot.c: 422: }
;robot.c: 423: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5360
	goto	l12166
u5360:
	line	425
	
l12162:	
;robot.c: 424: {
;robot.c: 425: RobotDrive(-200, 0x7FFF);
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
	line	426
	
l12164:	
;robot.c: 426: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	427
;robot.c: 427: break;
	goto	l12192
	line	428
	
l6301:	
	line	429
	
l12166:	
;robot.c: 428: }
;robot.c: 429: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5371
	goto	u5370
u5371:
	goto	l12172
u5370:
	line	431
	
l12168:	
;robot.c: 430: {
;robot.c: 431: RobotDrive(0, 0x7FFF);
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
	line	432
	
l12170:	
;robot.c: 432: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	movf	(??_robot_turnRight+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	433
;robot.c: 433: break;
	goto	l12192
	line	434
	
l6302:	
	line	435
	
l12172:	
;robot.c: 434: }
;robot.c: 435: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	436
	
l12174:	
;robot.c: 436: temp1 = temp1 << 8;
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
	line	437
	
l12176:	
;robot.c: 437: temp1 += AngleLowByte;
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
	line	438
	
l12178:	
;robot.c: 438: angleTurned += temp1;
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
	line	439
	
l12180:	
;robot.c: 439: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnRight+0)+0
	clrf	(??_robot_turnRight+0)+0+1
	movf	0+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1)
	movf	1+(??_robot_turnRight+0)+0,w
	movwf	(robot_turnRight@temp1+1)
	line	440
;robot.c: 440: temp1 = temp1 << 8;
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
	line	441
	
l12182:	
;robot.c: 441: temp1 += DistLowByte;
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
	line	442
	
l12184:	
;robot.c: 442: distTravelled += temp1;
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
	line	443
	
l12186:	
;robot.c: 443: TotalDistTravelled += temp1;
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
	line	445
	
l12188:	
;robot.c: 445: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12190
	line	446
	
l6296:	
	line	408
	
l12190:	
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
	goto	u5385
	movf	(0+(?_abs)),w
	subwf	0+(??_robot_turnRight+0)+0,w
u5385:

	skipc
	goto	u5381
	goto	u5380
u5381:
	goto	l12146
u5380:
	goto	l12192
	
l6299:	
	line	447
	
l12192:	
;robot.c: 446: }
;robot.c: 447: Disp2 = ROBOTerror;
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
	line	448
	
l12194:	
;robot.c: 448: UpdateDisplay();
	fcall	_UpdateDisplay
	line	451
	
l6303:	
	return
	opt stack 0
GLOBAL	__end_of_robot_turnRight
	__end_of_robot_turnRight:
;; =============== function _robot_turnRight ends ============

	signat	_robot_turnRight,4216
	global	_robotTurnSpeed
psect	text1118,local,class=CODE,delta=2
global __ptext1118
__ptext1118:

;; *************** function _robotTurnSpeed *****************
;; Defined at:
;;		line 509 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;;		_robot_turnLeft
;; This function uses a non-reentrant model
;;
psect	text1118
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	509
	global	__size_of_robotTurnSpeed
	__size_of_robotTurnSpeed	equ	__end_of_robotTurnSpeed-_robotTurnSpeed
	
_robotTurnSpeed:	
	opt	stack 0
; Regs used in _robotTurnSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	510
	
l12004:	
;robot.c: 510: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	511
;robot.c: 511: int temp1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robotTurnSpeed@temp1)
	clrf	(robotTurnSpeed@temp1+1)
	line	513
	
l12006:	
;robot.c: 513: robotTurn(angle);
	movf	(robotTurnSpeed@angle+1),w
	clrf	(?_robotTurn+1)
	addwf	(?_robotTurn+1)
	movf	(robotTurnSpeed@angle),w
	clrf	(?_robotTurn)
	addwf	(?_robotTurn)

	fcall	_robotTurn
	line	516
;robot.c: 516: while (abs(angleTurned) < abs(angle))
	goto	l12028
	
l6317:	
	line	518
	
l12008:	
;robot.c: 517: {
;robot.c: 518: robot_read(1);
	movlw	(01h)
	fcall	_robot_read
	line	519
	
l12010:	
;robot.c: 519: if (BumpSensors || VwallSensor)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,f
	skipz	;volatile
	goto	u5211
	goto	u5210
u5211:
	goto	l12014
u5210:
	
l12012:	
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5220
	goto	l12016
u5220:
	goto	l12014
	
l6320:	
	line	521
	
l12014:	
;robot.c: 520: {
;robot.c: 521: ROBOTerror = 1;
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	522
;robot.c: 522: break;
	goto	l12030
	line	523
	
l6318:	
	line	524
	
l12016:	
;robot.c: 523: }
;robot.c: 524: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotTurnSpeed+0)+0
	clrf	(??_robotTurnSpeed+0)+0+1
	movf	0+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1)
	movf	1+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1+1)
	line	525
	
l12018:	
;robot.c: 525: temp1 = temp1 << 8;
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
	line	526
	
l12020:	
;robot.c: 526: temp1 += AngleLowByte;
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
	line	527
	
l12022:	
;robot.c: 527: angleTurned += temp1;
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
	line	528
	
l12024:	
;robot.c: 528: Disp2 = angleTurned;
	movf	(_angleTurned+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_angleTurned)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	529
	
l12026:	
;robot.c: 529: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12028
	line	530
	
l6316:	
	line	516
	
l12028:	
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
	goto	u5235
	movf	(0+(?_abs)),w
	subwf	0+(??_robotTurnSpeed+0)+0,w
u5235:

	skipc
	goto	u5231
	goto	u5230
u5231:
	goto	l12008
u5230:
	goto	l12030
	
l6321:	
	line	532
	
l12030:	
;robot.c: 530: }
;robot.c: 532: robotTurn(0);
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurn)
	movlw	high(0)
	movwf	((?_robotTurn))+1
	fcall	_robotTurn
	line	533
	
l6322:	
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
;;		line 434 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
	line	434
	global	__size_of_ChargeMode
	__size_of_ChargeMode	equ	__end_of_ChargeMode-_ChargeMode
	
_ChargeMode:	
	opt	stack 2
; Regs used in _ChargeMode: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	436
	
l11982:	
;Main.c: 436: currentMenu = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ChargeMode+0)+0
	movf	(??_ChargeMode+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_currentMenu)^080h	;volatile
	line	437
	
l11984:	
;Main.c: 437: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	goto	l11986
	line	439
;Main.c: 439: while (1)
	
l2369:	
	line	441
	
l11986:	
;Main.c: 440: {
;Main.c: 441: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5201
	goto	u5200
u5201:
	goto	l12002
u5200:
	line	443
	
l11988:	
;Main.c: 442: {
;Main.c: 443: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	444
	
l11990:	
;Main.c: 444: RobotBattRead();
	fcall	_RobotBattRead
	line	445
;Main.c: 445: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12002
	line	446
	
l2370:	
	line	447
;Main.c: 446: }
;Main.c: 447: switch (buttonPressed)
	goto	l12002
	line	449
;Main.c: 448: {
;Main.c: 449: case 1:
	
l2372:	
	line	450
;Main.c: 450: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	451
;Main.c: 451: break;
	goto	l11986
	line	452
;Main.c: 452: case 2:
	
l2374:	
	line	453
;Main.c: 453: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	454
;Main.c: 454: break;
	goto	l11986
	line	455
;Main.c: 455: case 3:
	
l2375:	
	line	456
;Main.c: 456: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	457
;Main.c: 457: break;
	goto	l11986
	line	458
;Main.c: 458: case 4:
	
l2376:	
	line	459
;Main.c: 459: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	460
;Main.c: 460: break;
	goto	l11986
	line	461
;Main.c: 461: case 5:
	
l2377:	
	line	462
	
l11992:	
;Main.c: 462: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	463
	
l11994:	
;Main.c: 463: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	464
	
l11996:	
;Main.c: 464: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	goto	l2378
	line	465
	
l11998:	
;Main.c: 465: return;
	goto	l2378
	line	466
;Main.c: 466: default:
	
l2379:	
	line	467
;Main.c: 467: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	468
;Main.c: 468: break;
	goto	l11986
	line	469
	
l12000:	
;Main.c: 469: }
	goto	l11986
	line	447
	
l2371:	
	
l12002:	
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
	goto	l2372
	xorlw	2^1	; case 2
	skipnz
	goto	l2374
	xorlw	3^2	; case 3
	skipnz
	goto	l2375
	xorlw	4^3	; case 4
	skipnz
	goto	l2376
	xorlw	5^4	; case 5
	skipnz
	goto	l11992
	goto	l2379
	opt asmopt_on

	line	469
	
l2373:	
	goto	l11986
	line	470
	
l2380:	
	line	439
	goto	l11986
	
l2381:	
	line	471
	
l2378:	
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
;;		line 392 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
	line	392
	global	__size_of_calibrateIR
	__size_of_calibrateIR	equ	__end_of_calibrateIR-_calibrateIR
	
_calibrateIR:	
	opt	stack 1
; Regs used in _calibrateIR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	393
	
l11950:	
;Main.c: 393: currentMenu = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h	;volatile
	bsf	status,0
	rlf	(_currentMenu)^080h,f	;volatile
	line	394
	
l11952:	
;Main.c: 394: rotate(8, 0);
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(08h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	395
	
l11954:	
;Main.c: 395: rotate(8, 1);
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
	goto	l11956
	line	396
;Main.c: 396: while (1)
	
l2354:	
	line	398
	
l11956:	
;Main.c: 397: {
;Main.c: 398: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5191
	goto	u5190
u5191:
	goto	l11980
u5190:
	line	400
	
l11958:	
;Main.c: 399: {
;Main.c: 400: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	401
	
l11960:	
;Main.c: 401: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11980
	line	402
	
l2355:	
	line	403
;Main.c: 402: }
;Main.c: 403: switch (buttonPressed)
	goto	l11980
	line	405
;Main.c: 404: {
;Main.c: 405: case 1:
	
l2357:	
	line	406
;Main.c: 406: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	407
;Main.c: 407: break;
	goto	l11956
	line	408
;Main.c: 408: case 2:
	
l2359:	
	line	409
;Main.c: 409: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	410
;Main.c: 410: break;
	goto	l11956
	line	411
;Main.c: 411: case 3:
	
l2360:	
	line	412
	
l11962:	
;Main.c: 412: rotate(1, 1);
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
	line	413
	
l11964:	
;Main.c: 413: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	414
;Main.c: 414: break;
	goto	l11956
	line	415
;Main.c: 415: case 4:
	
l2361:	
	line	416
	
l11966:	
;Main.c: 416: rotate(1, 0);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(01h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	417
	
l11968:	
;Main.c: 417: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	418
;Main.c: 418: break;
	goto	l11956
	line	419
;Main.c: 419: case 5:
	
l2362:	
	line	421
	
l11970:	
;Main.c: 421: totalSteps = 0;
	clrf	(_totalSteps)^080h
	clrf	(_totalSteps+1)^080h
	line	422
	
l11972:	
;Main.c: 422: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	423
	
l11974:	
;Main.c: 423: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	goto	l2363
	line	424
	
l11976:	
;Main.c: 424: return;
	goto	l2363
	line	425
;Main.c: 425: default:
	
l2364:	
	line	426
;Main.c: 426: break;
	goto	l11956
	line	427
	
l11978:	
;Main.c: 427: }
	goto	l11956
	line	403
	
l2356:	
	
l11980:	
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
	goto	l2357
	xorlw	2^1	; case 2
	skipnz
	goto	l2359
	xorlw	3^2	; case 3
	skipnz
	goto	l11962
	xorlw	4^3	; case 4
	skipnz
	goto	l11966
	xorlw	5^4	; case 5
	skipnz
	goto	l11970
	goto	l11956
	opt asmopt_on

	line	427
	
l2358:	
	goto	l11956
	line	428
	
l2365:	
	line	396
	goto	l11956
	
l2366:	
	line	429
	
l2363:	
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
;;		_robot_turnRight
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
	
l11868:	
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
u5170:
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
	goto	u5170
	line	141
;HMI.c: 141: switch (currentMenu)
	goto	l11944
	line	143
;HMI.c: 142: {
;HMI.c: 143: case 0:
	
l4672:	
	line	144
	
l11870:	
;HMI.c: 144: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	145
	
l11872:	
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
	
l11874:	
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
	
l11876:	
;HMI.c: 148: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	149
	
l11878:	
;HMI.c: 149: if (pos > 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5185
	movlw	low(01h)
	subwf	(_pos)^080h,w
u5185:

	skipc
	goto	u5181
	goto	u5180
u5181:
	goto	l11882
u5180:
	line	150
	
l11880:	
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
	goto	l11884
	line	151
	
l4673:	
	line	152
	
l11882:	
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
	goto	l11884
	
l4674:	
	line	153
	
l11884:	
;HMI.c: 153: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	154
	
l11886:	
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
	
l11888:	
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
	goto	l4688
	line	158
;HMI.c: 158: case 1:
	
l4676:	
	line	159
	
l11890:	
;HMI.c: 159: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	160
;HMI.c: 160: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	161
	
l11892:	
;HMI.c: 161: lcd_write_string("Zero Step_Motor");
	movlw	low((STR_14-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	162
	
l11894:	
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
	
l11896:	
;HMI.c: 164: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	165
	
l11898:	
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
	
l11900:	
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
	goto	l4688
	line	169
;HMI.c: 169: case 2:
	
l4677:	
	line	170
	
l11902:	
;HMI.c: 170: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	171
;HMI.c: 171: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	172
	
l11904:	
;HMI.c: 172: lcd_write_string(" Charging Mode ");
	movlw	low((STR_18-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	173
	
l11906:	
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
	
l11908:	
;HMI.c: 176: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	177
;HMI.c: 177: switch(BattState)
	goto	l11924
	line	179
;HMI.c: 178: {
;HMI.c: 179: case 0:
	
l4679:	
	line	180
	
l11910:	
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
	goto	l11926
	line	182
;HMI.c: 182: case 1:
	
l4681:	
	line	183
	
l11912:	
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
	goto	l11926
	line	185
;HMI.c: 185: case 2:
	
l4682:	
	line	186
	
l11914:	
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
	goto	l11926
	line	188
;HMI.c: 188: case 3:
	
l4683:	
	line	189
	
l11916:	
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
	goto	l11926
	line	191
;HMI.c: 191: case 4:
	
l4684:	
	line	192
	
l11918:	
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
	goto	l11926
	line	194
;HMI.c: 194: case 5:
	
l4685:	
	line	195
	
l11920:	
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
	goto	l11926
	line	197
	
l11922:	
;HMI.c: 197: }
	goto	l11926
	line	177
	
l4678:	
	
l11924:	
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
	goto	l12564
	goto	l11926
	opt asmopt_on
	
l12564:	
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
	goto	l11910
	xorlw	1^0	; case 1
	skipnz
	goto	l11912
	xorlw	2^1	; case 2
	skipnz
	goto	l11914
	xorlw	3^2	; case 3
	skipnz
	goto	l11916
	xorlw	4^3	; case 4
	skipnz
	goto	l11918
	xorlw	5^4	; case 5
	skipnz
	goto	l11920
	goto	l11926
	opt asmopt_on

	line	197
	
l4680:	
	line	199
	
l11926:	
;HMI.c: 199: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	200
	
l11928:	
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
	goto	l4688
	line	202
;HMI.c: 202: case 3:
	
l4686:	
	line	203
	
l11930:	
;HMI.c: 203: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	204
	
l11932:	
;HMI.c: 204: sprintf(LCDOutput,"IR:%3dcm CP:%3d",adcVal, RobotPos);
	movlw	((STR_27-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	(??_UpdateDisplay+0)+0,w
	movwf	(?_sprintf)
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	movf	(_adcVal),w	;volatile
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
	line	205
	
l11934:	
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
	
l11936:	
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
	
l11938:	
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
	
l11940:	
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
	goto	l4688
	line	213
;HMI.c: 213: default:
	
l4687:	
	line	214
;HMI.c: 214: break;
	goto	l4688
	line	215
	
l11942:	
;HMI.c: 215: }
	goto	l4688
	line	141
	
l4671:	
	
l11944:	
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
	goto	l11870
	xorlw	1^0	; case 1
	skipnz
	goto	l11890
	xorlw	2^1	; case 2
	skipnz
	goto	l11902
	xorlw	3^2	; case 3
	skipnz
	goto	l11930
	goto	l4688
	opt asmopt_on

	line	215
	
l4675:	
	line	216
	
l4688:	
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
;;		_robot_turnRight
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
	
l11850:	
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
	
l11852:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5145
	movlw	low(08h)
	subwf	(readAvgDistance@i),w
u5145:

	skipc
	goto	u5141
	goto	u5140
u5141:
	goto	l11856
u5140:
	goto	l11864
	
l11854:	
	goto	l11864
	line	33
	
l3118:	
	line	34
	
l11856:	
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
	
l11858:	
;infrared.c: 35: if (tempIR <= 1000)
	movlw	high(03E9h)
	subwf	(readAvgDistance@tempIR+1),w
	movlw	low(03E9h)
	skipnz
	subwf	(readAvgDistance@tempIR),w
	skipnc
	goto	u5151
	goto	u5150
u5151:
	goto	l3120
u5150:
	line	37
	
l11860:	
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
	
l3120:	
	line	32
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
l11862:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5165
	movlw	low(08h)
	subwf	(readAvgDistance@i),w
u5165:

	skipc
	goto	u5161
	goto	u5160
u5161:
	goto	l11856
u5160:
	goto	l11864
	
l3119:	
	line	41
	
l11864:	
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
	
l11866:	
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
	
l3121:	
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
;;		line 140 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
	line	140
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 3
; Regs used in _init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	141
	
l11824:	
;Main.c: 141: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	143
	
l11826:	
;Main.c: 143: TRISB = 0b11111100;
	movlw	(0FCh)
	movwf	(134)^080h	;volatile
	line	144
	
l11828:	
;Main.c: 144: TRISC &= 0b10010000;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_init+0)+0
	movf	(??_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	(135)^080h,f	;volatile
	line	147
	
l11830:	
;Main.c: 147: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	148
	
l11832:	
;Main.c: 148: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	151
	
l11834:	
;Main.c: 151: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	154
	
l11836:	
;Main.c: 154: ser_init();
	fcall	_ser_init
	line	155
	
l11838:	
;Main.c: 155: init_adc();
	fcall	_init_adc
	line	156
	
l11840:	
;Main.c: 156: lcd_init();
	fcall	_lcd_init
	line	157
	
l11842:	
;Main.c: 157: robo_init();
	fcall	_robo_init
	line	161
	
l11844:	
;Main.c: 161: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	163
	
l11846:	
;Main.c: 163: PEIE=1;
	bsf	(94/8),(94)&7
	line	165
	
l11848:	
;Main.c: 165: (GIE = 1);
	bsf	(95/8),(95)&7
	line	166
	
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
	
l11818:	
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
	
l11820:	
;infrared.c: 83: return readVal;
	movf	(readDistance@readVal+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@readVal),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	l3124
	
l11822:	
	line	84
	
l3124:	
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
;;		line 536 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
	line	536
	global	__size_of_RobotBattRead
	__size_of_RobotBattRead	equ	__end_of_RobotBattRead-_RobotBattRead
	
_RobotBattRead:	
	opt	stack 2
; Regs used in _RobotBattRead: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	537
	
l11790:	
;robot.c: 537: int temp1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(RobotBattRead@temp1)
	clrf	(RobotBattRead@temp1+1)
	line	538
	
l11792:	
;robot.c: 538: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	539
	
l11794:	
;robot.c: 539: ser_putch(25);
	movlw	(019h)
	fcall	_ser_putch
	line	540
	
l11796:	
;robot.c: 540: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_RobotBattRead+0)+0+1),f
	movlw	118
movwf	((??_RobotBattRead+0)+0),f
u5697:
	decfsz	((??_RobotBattRead+0)+0),f
	goto	u5697
	decfsz	((??_RobotBattRead+0)+0+1),f
	goto	u5697
	clrwdt
opt asmopt_on

	line	541
	
l11798:	
;robot.c: 541: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	movf	(??_RobotBattRead+0)+0,w
	movwf	(_DistHighByte)	;volatile
	line	542
	
l11800:	
;robot.c: 542: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	movf	(??_RobotBattRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	543
	
l11802:	
;robot.c: 543: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	544
	
l11804:	
;robot.c: 544: ser_putch(21);
	movlw	(015h)
	fcall	_ser_putch
	line	545
	
l11806:	
;robot.c: 545: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_RobotBattRead+0)+0+1),f
	movlw	118
movwf	((??_RobotBattRead+0)+0),f
u5707:
	decfsz	((??_RobotBattRead+0)+0),f
	goto	u5707
	decfsz	((??_RobotBattRead+0)+0+1),f
	goto	u5707
	clrwdt
opt asmopt_on

	line	546
	
l11808:	
;robot.c: 546: BattState = ser_getch();
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
	line	549
	
l11810:	
;robot.c: 549: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	clrf	(??_RobotBattRead+0)+0+1
	movf	0+(??_RobotBattRead+0)+0,w
	movwf	(RobotBattRead@temp1)
	movf	1+(??_RobotBattRead+0)+0,w
	movwf	(RobotBattRead@temp1+1)
	line	550
	
l11812:	
;robot.c: 550: temp1 = temp1 << 8;
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
	line	551
	
l11814:	
;robot.c: 551: temp1 += DistLowByte;
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
	line	552
	
l11816:	
;robot.c: 552: BattCharge = temp1;
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

	line	553
	
l6325:	
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
;; Hardware stack levels required when called:    4
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
psect	text1126
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
	
l11774:	
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
	
l11776:	
;robot.c: 82: if (readType == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_read@readType),f
	skipz
	goto	u5111
	goto	u5110
u5111:
	goto	l11780
u5110:
	line	84
	
l11778:	
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
	goto	l6224
	line	90
	
l6217:	
	
l11780:	
;robot.c: 90: else if (readType == 1)
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_read@readType),w
	xorlw	01h
	skipz
	goto	u5121
	goto	u5120
u5121:
	goto	l11784
u5120:
	line	92
	
l11782:	
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
	goto	l6224
	line	98
	
l6219:	
	
l11784:	
;robot.c: 98: else if (readType == 2)
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_read@readType),w
	xorlw	02h
	skipz
	goto	u5131
	goto	u5130
u5131:
	goto	l6224
u5130:
	line	101
	
l11786:	
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
	goto	l6224
	line	113
	
l6221:	
	goto	l6224
	
l11788:	
	goto	l6224
	line	116
;robot.c: 114: {
	
l6223:	
	goto	l6224
	line	117
	
l6222:	
	goto	l6224
	
l6220:	
	goto	l6224
	
l6218:	
	
l6224:	
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
	
l11754:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l11756:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l11758:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l11760:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l11762:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l11764:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l11766:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l11768:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l11770:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l11772:	
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
	
l11746:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	l11752
	
l1409:	
	
l11748:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
l11750:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
	goto	l11752
	
l1408:	
	
l11752:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u5101
	goto	u5100
u5101:
	goto	l11748
u5100:
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
	
l11742:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
l11744:	
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
;;		line 558 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;;		_robot_turnRight
;;		_robotMoveSpeed
;;		_robotTurnSpeed
;; This function uses a non-reentrant model
;;
psect	text1130
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	558
	global	__size_of_abs
	__size_of_abs	equ	__end_of_abs-_abs
	
_abs:	
	opt	stack 2
; Regs used in _abs: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	559
	
l11738:	
;robot.c: 559: return (v * ((v > 0) - (v < 0)));
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
	goto	u5095
	movlw	low(01h)
	subwf	(abs@v),w
u5095:

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

	goto	l6328
	
l11740:	
	line	560
	
l6328:	
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_robotTurnSpeed
;; This function uses a non-reentrant model
;;
psect	text1131
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	143
	global	__size_of_robotTurn
	__size_of_robotTurn	equ	__end_of_robotTurn-_robotTurn
	
_robotTurn:	
	opt	stack 1
; Regs used in _robotTurn: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	145
	
l11730:	
;robot.c: 145: if (angle > 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotTurn@angle+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5075
	movlw	low(01h)
	subwf	(robotTurn@angle),w
u5075:

	skipc
	goto	u5071
	goto	u5070
u5071:
	goto	l6230
u5070:
	line	147
	
l11732:	
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
	goto	l6234
	line	157
	
l6230:	
;robot.c: 157: else if (angle < 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(robotTurn@angle+1),7
	goto	u5081
	goto	u5080
u5081:
	goto	l11736
u5080:
	line	159
	
l11734:	
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
	goto	l6234
	line	169
	
l6232:	
	line	171
	
l11736:	
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
	goto	l6234
	line	180
	
l6233:	
	goto	l6234
	
l6231:	
	line	181
	
l6234:	
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
	
l11714:	
;ser.c: 56: unsigned char c;
;ser.c: 58: while (ser_isrx()==0)
	goto	l11716
	
l7035:	
	line	59
;ser.c: 59: continue;
	goto	l11716
	
l7034:	
	line	58
	
l11716:	
	fcall	_ser_isrx
	btfss	status,0
	goto	u5061
	goto	u5060
u5061:
	goto	l11716
u5060:
	
l7036:	
	line	61
;ser.c: 61: GIE=0;
	bcf	(95/8),(95)&7
	line	62
	
l11718:	
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
	
l11720:	
;ser.c: 63: ++rxoptr;
	movlw	(01h)
	movwf	(??_ser_getch+0)+0
	movf	(??_ser_getch+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_rxoptr)^080h,f	;volatile
	line	64
	
l11722:	
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
	
l11724:	
;ser.c: 65: GIE=1;
	bsf	(95/8),(95)&7
	line	66
	
l11726:	
;ser.c: 66: return c;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(ser_getch@c),w
	goto	l7037
	
l11728:	
	line	67
	
l7037:	
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
	
l11624:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	l11708
	
l7077:	
	line	542
	
l11626:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u4911
	goto	u4910
u4911:
	goto	l11632
u4910:
	line	545
	
l11628:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11630:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	l11708
	line	547
	
l7078:	
	line	550
	
l11632:	
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	line	552
	
l11634:	
	clrf	(sprintf@flag)
	line	601
	
l11636:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfss	status,0
	goto	u4921
	goto	u4920
u4921:
	goto	l11648
u4920:
	line	602
	
l11638:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l11640
	line	603
	
l7080:	
	line	604
	
l11640:	
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
	
l11642:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@f),f
	line	605
	
l11644:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfsc	status,0
	goto	u4931
	goto	u4930
u4931:
	goto	l11640
u4930:
	goto	l11648
	
l7081:	
	goto	l11648
	line	611
	
l7079:	
	line	638
	goto	l11648
	line	640
	
l7083:	
	line	641
	goto	l11710
	line	700
	
l7085:	
	goto	l11650
	line	701
	
l7086:	
	line	702
	goto	l11650
	line	805
	
l7088:	
	line	816
	goto	l11708
	line	825
	
l11646:	
	goto	l11650
	line	638
	
l7082:	
	
l11648:	
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
	goto	l11710
	xorlw	100^0	; case 100
	skipnz
	goto	l11650
	xorlw	105^100	; case 105
	skipnz
	goto	l11650
	goto	l11708
	opt asmopt_on

	line	825
	
l7087:	
	line	1254
	
l11650:	
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
	
l11652:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
l11654:	
	btfss	(sprintf@_val+1),7
	goto	u4941
	goto	u4940
u4941:
	goto	l11660
u4940:
	line	1257
	
l11656:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
l11658:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	l11660
	line	1259
	
l7089:	
	line	1300
	
l11660:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
l11662:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u4951
	goto	u4950
u4951:
	goto	l11666
u4950:
	goto	l11674
	
l11664:	
	goto	l11674
	line	1301
	
l7090:	
	
l11666:	
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
	goto	u4965
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u4965:
	skipnc
	goto	u4961
	goto	u4960
u4961:
	goto	l11670
u4960:
	goto	l11674
	line	1302
	
l11668:	
	goto	l11674
	
l7092:	
	line	1300
	
l11670:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
l11672:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u4971
	goto	u4970
u4971:
	goto	l11666
u4970:
	goto	l11674
	
l7091:	
	line	1340
	
l11674:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u4981
	goto	u4980
u4981:
	goto	l7093
u4980:
	
l11676:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u4991
	goto	u4990
u4991:
	goto	l7093
u4990:
	line	1341
	
l11678:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	
l7093:	
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
	goto	u5005
	movf	(sprintf@width),w
	subwf	0+(??_sprintf+0)+0,w
u5005:

	skipnc
	goto	u5001
	goto	u5000
u5001:
	goto	l11682
u5000:
	line	1377
	
l11680:	
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
	goto	l11684
	line	1378
	
l7094:	
	line	1379
	
l11682:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l11684
	
l7095:	
	line	1423
	
l11684:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u5011
	goto	u5010
u5011:
	goto	l11692
u5010:
	goto	l11686
	line	1424
	
l7097:	
	line	1425
	
l11686:	
	movlw	(020h)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11688:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	1426
	
l11690:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	movf	(((sprintf@width+1))),w
	iorwf	(((sprintf@width))),w
	skipz
	goto	u5021
	goto	u5020
u5021:
	goto	l11686
u5020:
	goto	l11692
	
l7098:	
	goto	l11692
	
l7096:	
	line	1433
	
l11692:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u5031
	goto	u5030
u5031:
	goto	l11698
u5030:
	line	1434
	
l11694:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11696:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l11698
	
l7099:	
	line	1467
	
l11698:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	l11706
	
l7101:	
	line	1484
	
l11700:	
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
	
l11702:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11704:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l11706
	line	1517
	
l7100:	
	line	1469
	
l11706:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u5041
	goto	u5040
u5041:
	goto	l11700
u5040:
	goto	l11708
	
l7102:	
	goto	l11708
	line	1525
	
l7076:	
	line	540
	
l11708:	
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
	goto	u5051
	goto	u5050
u5051:
	goto	l11626
u5050:
	goto	l11710
	
l7103:	
	goto	l11710
	line	1527
	
l7084:	
	line	1530
	
l11710:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l7104
	line	1532
	
l11712:	
	line	1533
;	Return value of _sprintf is never used
	
l7104:	
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
	
l11582:	
;infrared.c: 95: if (adcVal >= 213 && adcVal < 234)
	movlw	high(0D5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4771
	goto	u4770
u4771:
	goto	l11588
u4770:
	
l11584:	
	movlw	high(0EAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0EAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4781
	goto	u4780
u4781:
	goto	l11588
u4780:
	line	97
	
l11586:	
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
	goto	l3140
	line	99
	
l3127:	
	
l11588:	
;infrared.c: 99: else if (adcVal >= 170 && adcVal < 213)
	movlw	high(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4791
	goto	u4790
u4791:
	goto	l11594
u4790:
	
l11590:	
	movlw	high(0D5h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4801
	goto	u4800
u4801:
	goto	l11594
u4800:
	line	101
	
l11592:	
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
	goto	l3140
	line	103
	
l3129:	
	
l11594:	
;infrared.c: 103: else if (adcVal >= 128 && adcVal < 170)
	movlw	high(080h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4811
	goto	u4810
u4811:
	goto	l11600
u4810:
	
l11596:	
	movlw	high(0AAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4821
	goto	u4820
u4821:
	goto	l11600
u4820:
	line	105
	
l11598:	
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
	goto	l3140
	line	107
	
l3131:	
	
l11600:	
;infrared.c: 107: else if (adcVal >= 107 && adcVal < 128)
	movlw	high(06Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4831
	goto	u4830
u4831:
	goto	l11606
u4830:
	
l11602:	
	movlw	high(080h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4841
	goto	u4840
u4841:
	goto	l11606
u4840:
	line	109
	
l11604:	
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
	goto	l3140
	line	111
	
l3133:	
	
l11606:	
;infrared.c: 111: else if (adcVal >= 77 && adcVal < 107)
	movlw	high(04Dh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4851
	goto	u4850
u4851:
	goto	l11612
u4850:
	
l11608:	
	movlw	high(06Bh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4861
	goto	u4860
u4861:
	goto	l11612
u4860:
	line	113
	
l11610:	
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
	goto	l3140
	line	115
	
l3135:	
	
l11612:	
;infrared.c: 115: else if (adcVal >= 56 && adcVal < 77)
	movlw	high(038h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4871
	goto	u4870
u4871:
	goto	l11618
u4870:
	
l11614:	
	movlw	high(04Dh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4881
	goto	u4880
u4881:
	goto	l11618
u4880:
	line	117
	
l11616:	
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
	goto	l3140
	line	119
	
l3137:	
	
l11618:	
;infrared.c: 119: else if (adcVal >= 43 && adcVal < 56)
	movlw	high(02Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(02Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4891
	goto	u4890
u4891:
	goto	l3140
u4890:
	
l11620:	
	movlw	high(038h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4901
	goto	u4900
u4901:
	goto	l3140
u4900:
	line	121
	
l11622:	
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
	goto	l3140
	line	122
	
l3139:	
	goto	l3140
	line	123
	
l3138:	
	goto	l3140
	
l3136:	
	goto	l3140
	
l3134:	
	goto	l3140
	
l3132:	
	goto	l3140
	
l3130:	
	goto	l3140
	
l3128:	
	
l3140:	
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_FindVictim
;;		_robotFollow
;;		_robot_turnRight
;;		_robotMoveSpeed
;; This function uses a non-reentrant model
;;
psect	text1135
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	122
	global	__size_of_RobotDrive
	__size_of_RobotDrive	equ	__end_of_RobotDrive-_RobotDrive
	
_RobotDrive:	
	opt	stack 2
; Regs used in _RobotDrive: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	124
	
l11566:	
;robot.c: 124: unsigned char speedlowByte = (unsigned char)(speed);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speed),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@speedlowByte)
	line	125
	
l11568:	
;robot.c: 125: unsigned char speedhighByte = (unsigned char)(speed >> 8);
	movf	(RobotDrive@speed+1),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@speedhighByte)
	line	126
	
l11570:	
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
	
l11572:	
;robot.c: 129: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	131
	
l11574:	
;robot.c: 131: ser_putch(speedhighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speedhighByte),w
	fcall	_ser_putch
	line	133
	
l11576:	
;robot.c: 133: ser_putch(speedlowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speedlowByte),w
	fcall	_ser_putch
	line	135
	
l11578:	
;robot.c: 135: ser_putch(radiushighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@radiushighByte),w
	fcall	_ser_putch
	line	137
	
l11580:	
;robot.c: 137: ser_putch(radiuslowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@radiuslowByte),w
	fcall	_ser_putch
	line	138
	
l6227:	
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
;;		_robot_turnRight
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
	
l11534:	
;steppermotor.c: 69: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	70
	
l11536:	
;steppermotor.c: 70: if (direction == 0)
	movf	(rotate@direction),f
	skipz
	goto	u4741
	goto	u4740
u4741:
	goto	l11540
u4740:
	line	71
	
l11538:	
;steppermotor.c: 71: spi_transfer(0b00001011);
	movlw	(0Bh)
	fcall	_spi_transfer
	goto	l11542
	line	72
	
l3843:	
	line	73
	
l11540:	
;steppermotor.c: 72: else
;steppermotor.c: 73: spi_transfer(0b00001001);
	movlw	(09h)
	fcall	_spi_transfer
	goto	l11542
	
l3844:	
	line	74
	
l11542:	
;steppermotor.c: 74: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11544:	
	bcf	(57/8),(57)&7
	line	75
	
l11546:	
;steppermotor.c: 75: for (unsigned int i = 0; i < numsteps; i++)
	clrf	(rotate@i)
	clrf	(rotate@i+1)
	goto	l3845
	line	76
	
l3846:	
	line	77
;steppermotor.c: 76: {
;steppermotor.c: 77: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	nop
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	78
	
l11548:	
;steppermotor.c: 78: if (direction)
	movf	(rotate@direction),w
	skipz
	goto	u4750
	goto	l11552
u4750:
	line	79
	
l11550:	
;steppermotor.c: 79: totalSteps++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_totalSteps)^080h,f
	skipnc
	incf	(_totalSteps+1)^080h,f
	movlw	high(01h)
	addwf	(_totalSteps+1)^080h,f
	goto	l3848
	line	80
	
l3847:	
	line	81
	
l11552:	
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
	
l3848:	
	line	82
;steppermotor.c: 82: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_rotate+0)+0+1),f
	movlw	101
movwf	((??_rotate+0)+0),f
u5717:
	decfsz	((??_rotate+0)+0),f
	goto	u5717
	decfsz	((??_rotate+0)+0+1),f
	goto	u5717
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
	
l3845:	
	movf	(rotate@numsteps+1),w
	subwf	(rotate@i+1),w
	skipz
	goto	u4765
	movf	(rotate@numsteps),w
	subwf	(rotate@i),w
u4765:
	skipc
	goto	u4761
	goto	u4760
u4761:
	goto	l3846
u4760:
	
l3849:	
	line	84
;steppermotor.c: 83: }
;steppermotor.c: 84: RC0 = 1; RC1 = 1;;
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	85
	
l11554:	
;steppermotor.c: 85: spi_transfer(0b00000000);
	movlw	(0)
	fcall	_spi_transfer
	line	86
	
l11556:	
;steppermotor.c: 86: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11558:	
	bcf	(57/8),(57)&7
	line	87
	
l11560:	
;steppermotor.c: 87: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l11562:	
	nop
	
l11564:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	88
	
l3850:	
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
;;		line 564 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
	line	564
	global	__size_of_robotLoadSong
	__size_of_robotLoadSong	equ	__end_of_robotLoadSong-_robotLoadSong
	
_robotLoadSong:	
	opt	stack 4
; Regs used in _robotLoadSong: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	565
	
l11532:	
;robot.c: 565: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	566
;robot.c: 566: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	567
;robot.c: 567: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	568
;robot.c: 568: ser_putch(72);
	movlw	(048h)
	fcall	_ser_putch
	line	569
;robot.c: 569: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	570
;robot.c: 570: ser_putch(84);
	movlw	(054h)
	fcall	_ser_putch
	line	571
;robot.c: 571: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	573
;robot.c: 573: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	574
;robot.c: 574: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	575
;robot.c: 575: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	576
;robot.c: 576: ser_putch(84);
	movlw	(054h)
	fcall	_ser_putch
	line	577
;robot.c: 577: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	578
;robot.c: 578: ser_putch(72);
	movlw	(048h)
	fcall	_ser_putch
	line	579
;robot.c: 579: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	580
	
l6331:	
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text1138
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	42
	global	__size_of_robo_init
	__size_of_robo_init	equ	__end_of_robo_init-_robo_init
	
_robo_init:	
	opt	stack 3
; Regs used in _robo_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	43
	
l11530:	
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
	
l6214:	
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
	
l11522:	
;lcd.c: 31: RE2 = 0;
	bcf	(74/8),(74)&7
	line	32
;lcd.c: 32: RE1 = 0;
	bcf	(73/8),(73)&7
	line	33
;lcd.c: 33: RE0 = 1;
	bsf	(72/8),(72)&7
	line	34
	
l11524:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
l11526:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
l11528:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u5727:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u5727
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u5727
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
	
l11514:	
;lcd.c: 19: RE2 = 0;
	bcf	(74/8),(74)&7
	line	20
;lcd.c: 20: RE1 = 0;
	bcf	(73/8),(73)&7
	line	21
;lcd.c: 21: RE0 = 0;
	bcf	(72/8),(72)&7
	line	22
	
l11516:	
;lcd.c: 22: PORTD = databyte;
	movf	(lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
l11518:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l11520:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??_lcd_write_control+0)+0),f
u5737:
	decfsz	((??_lcd_write_control+0)+0),f
	goto	u5737
	decfsz	((??_lcd_write_control+0)+0+1),f
	goto	u5737
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
	
l11504:	
;adc.c: 63: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	64
	
l11506:	
;adc.c: 64: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	67
	
l11508:	
;adc.c: 67: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	68
	
l11510:	
;adc.c: 68: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	70
	
l11512:	
;adc.c: 70: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_init_adc+0)+0,f
u5747:
decfsz	(??_init_adc+0)+0,f
	goto	u5747
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
	
l11488:	
;adc.c: 21: switch(channel)
	goto	l11496
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
	goto	l11498
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
	goto	l11498
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
	goto	l11498
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
	goto	l11498
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
	goto	l11498
	line	50
;adc.c: 50: default:
	
l696:	
	line	51
	
l11490:	
;adc.c: 51: return 0;
	movlw	(0)
	goto	l697
	
l11492:	
	goto	l697
	line	52
	
l11494:	
;adc.c: 52: }
	goto	l11498
	line	21
	
l689:	
	
l11496:	
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
	goto	l11490
	opt asmopt_on

	line	52
	
l691:	
	line	54
	
l11498:	
;adc.c: 54: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u5757:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u5757
opt asmopt_on

	line	56
	
l11500:	
;adc.c: 56: return adc_read();
	fcall	_adc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_adc_read)),w
	goto	l697
	
l11502:	
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
	
l11432:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u4591
	goto	u4590
u4591:
	goto	l11436
u4590:
	line	10
	
l11434:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l11436
	line	12
	
l8000:	
	line	13
	
l11436:	
	btfss	(___awmod@divisor+1),7
	goto	u4601
	goto	u4600
u4601:
	goto	l11440
u4600:
	line	14
	
l11438:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l11440
	
l8001:	
	line	15
	
l11440:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u4611
	goto	u4610
u4611:
	goto	l11458
u4610:
	line	16
	
l11442:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l11448
	
l8004:	
	line	18
	
l11444:	
	movlw	01h
	
u4625:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4625
	line	19
	
l11446:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l11448
	line	20
	
l8003:	
	line	17
	
l11448:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u4631
	goto	u4630
u4631:
	goto	l11444
u4630:
	goto	l11450
	
l8005:	
	goto	l11450
	line	21
	
l8006:	
	line	22
	
l11450:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u4645
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u4645:
	skipc
	goto	u4641
	goto	u4640
u4641:
	goto	l11454
u4640:
	line	23
	
l11452:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l11454
	
l8007:	
	line	24
	
l11454:	
	movlw	01h
	
u4655:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u4655
	line	25
	
l11456:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u4661
	goto	u4660
u4661:
	goto	l11450
u4660:
	goto	l11458
	
l8008:	
	goto	l11458
	line	26
	
l8002:	
	line	27
	
l11458:	
	movf	(___awmod@sign),w
	skipz
	goto	u4670
	goto	l11462
u4670:
	line	28
	
l11460:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l11462
	
l8009:	
	line	29
	
l11462:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l8010
	
l11464:	
	line	30
	
l8010:	
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
;;		_robot_turnRight
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
	
l11392:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u4491
	goto	u4490
u4491:
	goto	l11396
u4490:
	line	11
	
l11394:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l11396
	line	13
	
l7932:	
	line	14
	
l11396:	
	btfss	(___awdiv@dividend+1),7
	goto	u4501
	goto	u4500
u4501:
	goto	l11402
u4500:
	line	15
	
l11398:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l11400:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l11402
	line	17
	
l7933:	
	line	18
	
l11402:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l11404:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u4511
	goto	u4510
u4511:
	goto	l11424
u4510:
	line	20
	
l11406:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l11412
	
l7936:	
	line	22
	
l11408:	
	movlw	01h
	
u4525:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u4525
	line	23
	
l11410:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l11412
	line	24
	
l7935:	
	line	21
	
l11412:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u4531
	goto	u4530
u4531:
	goto	l11408
u4530:
	goto	l11414
	
l7937:	
	goto	l11414
	line	25
	
l7938:	
	line	26
	
l11414:	
	movlw	01h
	
u4545:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u4545
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u4555
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u4555:
	skipc
	goto	u4551
	goto	u4550
u4551:
	goto	l11420
u4550:
	line	28
	
l11416:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l11418:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l11420
	line	30
	
l7939:	
	line	31
	
l11420:	
	movlw	01h
	
u4565:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u4565
	line	32
	
l11422:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u4571
	goto	u4570
u4571:
	goto	l11414
u4570:
	goto	l11424
	
l7940:	
	goto	l11424
	line	33
	
l7934:	
	line	34
	
l11424:	
	movf	(___awdiv@sign),w
	skipz
	goto	u4580
	goto	l11428
u4580:
	line	35
	
l11426:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l11428
	
l7941:	
	line	36
	
l11428:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l7942
	
l11430:	
	line	37
	
l7942:	
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
	
l11370:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u4431
	goto	u4430
u4431:
	goto	l11388
u4430:
	line	9
	
l11372:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l11378
	
l7810:	
	line	11
	
l11374:	
	movlw	01h
	
u4445:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4445
	line	12
	
l11376:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l11378
	line	13
	
l7809:	
	line	10
	
l11378:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u4451
	goto	u4450
u4451:
	goto	l11374
u4450:
	goto	l11380
	
l7811:	
	goto	l11380
	line	14
	
l7812:	
	line	15
	
l11380:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u4465
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u4465:
	skipc
	goto	u4461
	goto	u4460
u4461:
	goto	l11384
u4460:
	line	16
	
l11382:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l11384
	
l7813:	
	line	17
	
l11384:	
	movlw	01h
	
u4475:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u4475
	line	18
	
l11386:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u4481
	goto	u4480
u4481:
	goto	l11380
u4480:
	goto	l11388
	
l7814:	
	goto	l11388
	line	19
	
l7808:	
	line	20
	
l11388:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l7815
	
l11390:	
	line	21
	
l7815:	
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
	
l11344:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l11346:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u4361
	goto	u4360
u4361:
	goto	l11366
u4360:
	line	11
	
l11348:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l11354
	
l7800:	
	line	13
	
l11350:	
	movlw	01h
	
u4375:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u4375
	line	14
	
l11352:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l11354
	line	15
	
l7799:	
	line	12
	
l11354:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u4381
	goto	u4380
u4381:
	goto	l11350
u4380:
	goto	l11356
	
l7801:	
	goto	l11356
	line	16
	
l7802:	
	line	17
	
l11356:	
	movlw	01h
	
u4395:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u4395
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u4405
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u4405:
	skipc
	goto	u4401
	goto	u4400
u4401:
	goto	l11362
u4400:
	line	19
	
l11358:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l11360:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l11362
	line	21
	
l7803:	
	line	22
	
l11362:	
	movlw	01h
	
u4415:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u4415
	line	23
	
l11364:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u4421
	goto	u4420
u4421:
	goto	l11356
u4420:
	goto	l11366
	
l7804:	
	goto	l11366
	line	24
	
l7798:	
	line	25
	
l11366:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l7805
	
l11368:	
	line	26
	
l7805:	
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
	
l11332:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l11334
	line	6
	
l7792:	
	line	7
	
l11334:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u4321
	goto	u4320
u4321:
	goto	l7793
u4320:
	line	8
	
l11336:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l7793:	
	line	9
	movlw	01h
	
u4335:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u4335
	line	10
	
l11338:	
	movlw	01h
	
u4345:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u4345
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u4351
	goto	u4350
u4351:
	goto	l11334
u4350:
	goto	l11340
	
l7794:	
	line	12
	
l11340:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l7795
	
l11342:	
	line	13
	
l7795:	
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
	
l11320:	
	clrf	(_isdigit$8699)
	
l11322:	
	movlw	(03Ah)
	subwf	(isdigit@c),w
	skipnc
	goto	u4301
	goto	u4300
u4301:
	goto	l11328
u4300:
	
l11324:	
	movlw	(030h)
	subwf	(isdigit@c),w
	skipc
	goto	u4311
	goto	u4310
u4311:
	goto	l11328
u4310:
	
l11326:	
	clrf	(_isdigit$8699)
	bsf	status,0
	rlf	(_isdigit$8699),f
	goto	l11328
	
l7782:	
	
l11328:	
	rrf	(_isdigit$8699),w
	
	goto	l7783
	
l11330:	
	line	15
	
l7783:	
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
	
l11272:	
;ser.c: 46: if(OERR) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(193/8),(193)&7
	goto	u4231
	goto	u4230
u4231:
	goto	l11280
u4230:
	line	47
	
l11274:	
;ser.c: 47: CREN = 0;
	bcf	(196/8),(196)&7
	line	48
;ser.c: 48: CREN = 1;
	bsf	(196/8),(196)&7
	line	49
	
l11276:	
;ser.c: 49: return 0;
	clrc
	
	goto	l7031
	
l11278:	
	goto	l7031
	line	50
	
l7030:	
	line	51
	
l11280:	
;ser.c: 50: }
;ser.c: 51: return (rxiptr!=rxoptr);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_rxiptr)^080h,w	;volatile
	xorwf	(_rxoptr)^080h,w	;volatile
	skipz
	goto	u4241
	goto	u4240
u4241:
	goto	l11284
u4240:
	
l11282:	
	clrc
	
	goto	l7031
	
l11034:	
	
l11284:	
	setc
	
	goto	l7031
	
l11036:	
	goto	l7031
	
l11286:	
	line	52
	
l7031:	
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
	
l11262:	
;steppermotor.c: 51: unsigned char temp = 0;
	clrf	(spi_transfer@temp)
	line	53
;steppermotor.c: 53: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	54
	
l11264:	
;steppermotor.c: 54: SSPBUF = data;
	movf	(spi_transfer@data),w
	movwf	(19)	;volatile
	line	56
;steppermotor.c: 56: while (SSPIF == 0);
	goto	l3837
	
l3838:	
	
l3837:	
	btfss	(99/8),(99)&7
	goto	u4221
	goto	u4220
u4221:
	goto	l3837
u4220:
	goto	l11266
	
l3839:	
	line	57
	
l11266:	
;steppermotor.c: 57: temp = SSPBUF;
	movf	(19),w	;volatile
	movwf	(??_spi_transfer+0)+0
	movf	(??_spi_transfer+0)+0,w
	movwf	(spi_transfer@temp)
	line	58
	
l11268:	
;steppermotor.c: 58: SSPIF = 0;
	bcf	(99/8),(99)&7
	goto	l3840
	line	60
	
l11270:	
	line	61
;steppermotor.c: 60: return temp;
;	Return value of _spi_transfer is never used
	
l3840:	
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
	
l11250:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l11252
	
l7041:	
	line	72
;ser.c: 72: continue;
	goto	l11252
	
l7040:	
	line	71
	
l11252:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_txiptr)^080h,w	;volatile
	addlw	01h
	andlw	0Fh
	xorwf	(_txoptr)^080h,w	;volatile
	skipnz
	goto	u4211
	goto	u4210
u4211:
	goto	l11252
u4210:
	
l7042:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l11254:	
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
	
l11256:	
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
	
l11258:	
;ser.c: 76: TXIE=1;
	bsf	(1124/8)^080h,(1124)&7
	line	77
	
l11260:	
;ser.c: 77: GIE=1;
	bsf	(95/8),(95)&7
	line	78
	
l7043:	
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
	
l11226:	
;HMI.c: 105: switch (BTN_input)
	goto	l11244
	line	107
;HMI.c: 106: {
;HMI.c: 107: case 1:
	
l4657:	
	line	109
;HMI.c: 109: break;
	goto	l11246
	line	110
;HMI.c: 110: case 2:
	
l4659:	
	line	112
;HMI.c: 112: break;
	goto	l11246
	line	113
;HMI.c: 113: case 3:
	
l4660:	
	line	114
	
l11228:	
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
	
l11230:	
;HMI.c: 115: if (pos < 0)
	btfss	(_pos+1)^080h,7
	goto	u4191
	goto	u4190
u4191:
	goto	l11246
u4190:
	line	116
	
l11232:	
;HMI.c: 116: pos = 6 - 1;
	movlw	low(05h)
	movwf	(_pos)^080h
	movlw	high(05h)
	movwf	((_pos)^080h)+1
	goto	l11246
	
l4661:	
	line	118
;HMI.c: 118: break;
	goto	l11246
	line	119
;HMI.c: 119: case 4:
	
l4662:	
	line	120
	
l11234:	
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
	goto	u4201
	goto	u4200
u4201:
	goto	l11246
u4200:
	line	122
	
l11236:	
;HMI.c: 122: pos = 0;
	clrf	(_pos)^080h
	clrf	(_pos+1)^080h
	goto	l11246
	
l4663:	
	line	124
;HMI.c: 124: break;
	goto	l11246
	line	125
;HMI.c: 125: case 5:
	
l4664:	
	line	126
	
l11238:	
;HMI.c: 126: return pos;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	goto	l4665
	
l11240:	
	goto	l4665
	line	129
;HMI.c: 129: default:
	
l4666:	
	line	131
;HMI.c: 131: break;
	goto	l11246
	line	132
	
l11242:	
;HMI.c: 132: }
	goto	l11246
	line	105
	
l4656:	
	
l11244:	
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
	goto	l11246
	xorlw	2^1	; case 2
	skipnz
	goto	l11246
	xorlw	3^2	; case 3
	skipnz
	goto	l11228
	xorlw	4^3	; case 4
	skipnz
	goto	l11234
	xorlw	5^4	; case 5
	skipnz
	goto	l11238
	goto	l11246
	opt asmopt_on

	line	132
	
l4658:	
	line	133
	
l11246:	
;HMI.c: 133: return 255;
	movlw	(0FFh)
	goto	l4665
	
l11248:	
	line	134
	
l4665:	
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
	
l11200:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l11202:	
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
	
l11204:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l11206:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l11208:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l11210:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l11212:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l11214:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l11216:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l11218:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l11220:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l11222:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l11224:	
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
	
l7065:	
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
	
l11042:	
;adc.c: 77: volatile unsigned int adc_value;
;adc.c: 79: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	81
	
l11044:	
;adc.c: 81: GO = 1;
	bsf	(250/8),(250)&7
	line	82
;adc.c: 82: while(GO) continue;
	goto	l703
	
l704:	
	
l703:	
	btfsc	(250/8),(250)&7
	goto	u3851
	goto	u3850
u3851:
	goto	l703
u3850:
	
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
	
l11046:	
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
	
u3865:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u3865
	line	90
;adc.c: 90: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	93
	
l11048:	
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
	
l11050:	
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
;;		line 110 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
	line	110
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
	line	111
	
i1l11078:	
;Main.c: 111: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u390_21
	goto	u390_20
u390_21:
	goto	i1l11100
u390_20:
	line	113
	
i1l11080:	
;Main.c: 112: {
;Main.c: 113: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	114
	
i1l11082:	
;Main.c: 114: TMR0 = 100;
	movlw	(064h)
	movwf	(1)	;volatile
	line	116
;Main.c: 116: RTC_Counter++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RTC_Counter)^080h,f	;volatile
	skipnc
	incf	(_RTC_Counter+1)^080h,f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1)^080h,f	;volatile
	line	119
	
i1l11084:	
;Main.c: 119: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	120
	
i1l11086:	
;Main.c: 120: if(RTC_Counter % 250 == 0)
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
	goto	u391_21
	goto	u391_20
u391_21:
	goto	i1l11090
u391_20:
	line	122
	
i1l11088:	
;Main.c: 121: {
;Main.c: 122: RTC_FLAG_250MS = 1;
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l11090
	line	123
	
i1l2279:	
	line	124
	
i1l11090:	
;Main.c: 123: }
;Main.c: 124: if(RTC_Counter % 500 == 0)
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
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l11096
u392_20:
	line	126
	
i1l11092:	
;Main.c: 125: {
;Main.c: 126: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	127
	
i1l11094:	
;Main.c: 127: RB0 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l11096
	line	128
	
i1l2280:	
	line	129
	
i1l11096:	
;Main.c: 128: }
;Main.c: 129: if (buttonPressed == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_buttonPressed)^080h,f
	skipz	;volatile
	goto	u393_21
	goto	u393_20
u393_21:
	goto	i1l11100
u393_20:
	line	131
	
i1l11098:	
;Main.c: 130: {
;Main.c: 131: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_buttonPressed)^080h	;volatile
	goto	i1l11100
	line	132
	
i1l2281:	
	goto	i1l11100
	line	133
	
i1l2278:	
	line	134
	
i1l11100:	
;Main.c: 132: }
;Main.c: 133: }
;Main.c: 134: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	bcf	status, 5	;RP0=0, select bank0
	btfss	(101/8),(101)&7
	goto	u394_21
	goto	u394_20
u394_21:
	goto	i1l11110
u394_20:
	
i1l11102:	
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
	
i1l11104:	
	movf	(_rxiptr)^080h,w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_ser_tmp)^080h
	
i1l11106:	
	movf	(_ser_tmp)^080h,w
	xorwf	(_rxoptr)^080h,w	;volatile
	skipnz
	goto	u395_21
	goto	u395_20
u395_21:
	goto	i1l11110
u395_20:
	
i1l11108:	
	movf	(_ser_tmp)^080h,w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)^080h	;volatile
	goto	i1l11110
	
i1l2283:	
	goto	i1l11110
	
i1l2282:	
	
i1l11110:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(100/8),(100)&7
	goto	u396_21
	goto	u396_20
u396_21:
	goto	i1l2286
u396_20:
	
i1l11112:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u397_21
	goto	u397_20
u397_21:
	goto	i1l2286
u397_20:
	
i1l11114:	
	movf	(_txoptr)^080h,w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	
i1l11116:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_txoptr)^080h,f	;volatile
	
i1l11118:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr)^080h,f	;volatile
	
i1l11120:	
	movf	(_txoptr)^080h,w	;volatile
	xorwf	(_txiptr)^080h,w	;volatile
	skipz
	goto	u398_21
	goto	u398_20
u398_21:
	goto	i1l2286
u398_20:
	
i1l11122:	
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2286
	
i1l2285:	
	goto	i1l2286
	
i1l2284:	
	line	135
	
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
	
i1l11466:	
	movf	(i1___lwmod@divisor+1),w
	iorwf	(i1___lwmod@divisor),w
	skipnz
	goto	u468_21
	goto	u468_20
u468_21:
	goto	i1l11484
u468_20:
	line	9
	
i1l11468:	
	clrf	(i1___lwmod@counter)
	bsf	status,0
	rlf	(i1___lwmod@counter),f
	line	10
	goto	i1l11474
	
i1l7810:	
	line	11
	
i1l11470:	
	movlw	01h
	
u469_25:
	clrc
	rlf	(i1___lwmod@divisor),f
	rlf	(i1___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u469_25
	line	12
	
i1l11472:	
	movlw	(01h)
	movwf	(??i1___lwmod+0)+0
	movf	(??i1___lwmod+0)+0,w
	addwf	(i1___lwmod@counter),f
	goto	i1l11474
	line	13
	
i1l7809:	
	line	10
	
i1l11474:	
	btfss	(i1___lwmod@divisor+1),(15)&7
	goto	u470_21
	goto	u470_20
u470_21:
	goto	i1l11470
u470_20:
	goto	i1l11476
	
i1l7811:	
	goto	i1l11476
	line	14
	
i1l7812:	
	line	15
	
i1l11476:	
	movf	(i1___lwmod@divisor+1),w
	subwf	(i1___lwmod@dividend+1),w
	skipz
	goto	u471_25
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),w
u471_25:
	skipc
	goto	u471_21
	goto	u471_20
u471_21:
	goto	i1l11480
u471_20:
	line	16
	
i1l11478:	
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),f
	movf	(i1___lwmod@divisor+1),w
	skipc
	decf	(i1___lwmod@dividend+1),f
	subwf	(i1___lwmod@dividend+1),f
	goto	i1l11480
	
i1l7813:	
	line	17
	
i1l11480:	
	movlw	01h
	
u472_25:
	clrc
	rrf	(i1___lwmod@divisor+1),f
	rrf	(i1___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u472_25
	line	18
	
i1l11482:	
	movlw	low(01h)
	subwf	(i1___lwmod@counter),f
	btfss	status,2
	goto	u473_21
	goto	u473_20
u473_21:
	goto	i1l11476
u473_20:
	goto	i1l11484
	
i1l7814:	
	goto	i1l11484
	line	19
	
i1l7808:	
	line	20
	
i1l11484:	
	movf	(i1___lwmod@dividend+1),w
	clrf	(?i1___lwmod+1)
	addwf	(?i1___lwmod+1)
	movf	(i1___lwmod@dividend),w
	clrf	(?i1___lwmod)
	addwf	(?i1___lwmod)

	goto	i1l7815
	
i1l11486:	
	line	21
	
i1l7815:	
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
	
i1l11124:	
;HMI.c: 64: if(!RB2) { UpDebounceCount++; if(UpDebounceCount >= 10 & UpReleased) { UpPressed = 1; UpReleased = 0; } } else { UpDebounceCount = 0; UpReleased = 1; } if(!RB3) { DownDebounceCount++; if(DownDebounceCount >= 10 & DownReleased) { DownPressed = 1; Down
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u399_21
	goto	u399_20
u399_21:
	goto	i1l4633
u399_20:
	
i1l11126:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_UpDebounceCount)^080h,f	;volatile
	
i1l11128:	
	movlw	(0Ah)
	subwf	(_UpDebounceCount)^080h,w	;volatile
	skipc
	goto	u400_21
	goto	u400_20
u400_21:
	goto	i1l4635
u400_20:
	
i1l11130:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u401_21
	goto	u401_20
u401_21:
	goto	i1l4635
u401_20:
	
i1l11132:	
	bsf	(_UpPressed/8),(_UpPressed)&7
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l4635
	
i1l4634:	
	goto	i1l4635
	
i1l4633:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_UpDebounceCount)^080h	;volatile
	bsf	(_UpReleased/8),(_UpReleased)&7
	
i1l4635:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(51/8),(51)&7
	goto	u402_21
	goto	u402_20
u402_21:
	goto	i1l4636
u402_20:
	
i1l11134:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_DownDebounceCount)^080h,f	;volatile
	
i1l11136:	
	movlw	(0Ah)
	subwf	(_DownDebounceCount)^080h,w	;volatile
	skipc
	goto	u403_21
	goto	u403_20
u403_21:
	goto	i1l4638
u403_20:
	
i1l11138:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u404_21
	goto	u404_20
u404_21:
	goto	i1l4638
u404_20:
	
i1l11140:	
	bsf	(_DownPressed/8),(_DownPressed)&7
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l4638
	
i1l4637:	
	goto	i1l4638
	
i1l4636:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_DownDebounceCount)^080h	;volatile
	bsf	(_DownReleased/8),(_DownReleased)&7
	
i1l4638:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(52/8),(52)&7
	goto	u405_21
	goto	u405_20
u405_21:
	goto	i1l4639
u405_20:
	
i1l11142:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_LeftDebounceCount)^080h,f	;volatile
	
i1l11144:	
	movlw	(0Ah)
	subwf	(_LeftDebounceCount)^080h,w	;volatile
	skipc
	goto	u406_21
	goto	u406_20
u406_21:
	goto	i1l4641
u406_20:
	
i1l11146:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u407_21
	goto	u407_20
u407_21:
	goto	i1l4641
u407_20:
	
i1l11148:	
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l4641
	
i1l4640:	
	goto	i1l4641
	
i1l4639:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_LeftDebounceCount)^080h	;volatile
	bsf	(_LeftReleased/8),(_LeftReleased)&7
	
i1l4641:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u408_21
	goto	u408_20
u408_21:
	goto	i1l4642
u408_20:
	
i1l11150:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RightDebounceCount)^080h,f	;volatile
	
i1l11152:	
	movlw	(0Ah)
	subwf	(_RightDebounceCount)^080h,w	;volatile
	skipc
	goto	u409_21
	goto	u409_20
u409_21:
	goto	i1l4644
u409_20:
	
i1l11154:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u410_21
	goto	u410_20
u410_21:
	goto	i1l4644
u410_20:
	
i1l11156:	
	bsf	(_RightPressed/8),(_RightPressed)&7
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l4644
	
i1l4643:	
	goto	i1l4644
	
i1l4642:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_RightDebounceCount)^080h	;volatile
	bsf	(_RightReleased/8),(_RightReleased)&7
	
i1l4644:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l4645
u411_20:
	
i1l11158:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_CenterDebounceCount)^080h,f	;volatile
	
i1l11160:	
	movlw	(0Ah)
	subwf	(_CenterDebounceCount)^080h,w	;volatile
	skipc
	goto	u412_21
	goto	u412_20
u412_21:
	goto	i1l4647
u412_20:
	
i1l11162:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u413_21
	goto	u413_20
u413_21:
	goto	i1l4647
u413_20:
	
i1l11164:	
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l4647
	
i1l4646:	
	goto	i1l4647
	
i1l4645:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_CenterDebounceCount)^080h	;volatile
	bsf	(_CenterReleased/8),(_CenterReleased)&7
	
i1l4647:	
	line	66
;HMI.c: 66: if(UpPressed)
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u414_21
	goto	u414_20
u414_21:
	goto	i1l4648
u414_20:
	line	68
	
i1l11166:	
;HMI.c: 67: {
;HMI.c: 68: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	69
	
i1l11168:	
;HMI.c: 69: return 1;
	movlw	(01h)
	goto	i1l4649
	
i1l11170:	
	goto	i1l4649
	line	71
	
i1l4648:	
	line	73
;HMI.c: 71: }
;HMI.c: 73: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u415_21
	goto	u415_20
u415_21:
	goto	i1l4650
u415_20:
	line	75
	
i1l11172:	
;HMI.c: 74: {
;HMI.c: 75: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	76
	
i1l11174:	
;HMI.c: 76: return 2;
	movlw	(02h)
	goto	i1l4649
	
i1l11176:	
	goto	i1l4649
	line	78
	
i1l4650:	
	line	79
;HMI.c: 78: }
;HMI.c: 79: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u416_21
	goto	u416_20
u416_21:
	goto	i1l4651
u416_20:
	line	81
	
i1l11178:	
;HMI.c: 80: {
;HMI.c: 81: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	82
	
i1l11180:	
;HMI.c: 82: return 3;
	movlw	(03h)
	goto	i1l4649
	
i1l11182:	
	goto	i1l4649
	line	84
	
i1l4651:	
	line	85
;HMI.c: 84: }
;HMI.c: 85: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u417_21
	goto	u417_20
u417_21:
	goto	i1l4652
u417_20:
	line	87
	
i1l11184:	
;HMI.c: 86: {
;HMI.c: 87: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	88
	
i1l11186:	
;HMI.c: 88: return 4;
	movlw	(04h)
	goto	i1l4649
	
i1l11188:	
	goto	i1l4649
	line	90
	
i1l4652:	
	line	92
;HMI.c: 90: }
;HMI.c: 92: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u418_21
	goto	u418_20
u418_21:
	goto	i1l11196
u418_20:
	line	94
	
i1l11190:	
;HMI.c: 93: {
;HMI.c: 94: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	95
	
i1l11192:	
;HMI.c: 95: return 5;
	movlw	(05h)
	goto	i1l4649
	
i1l11194:	
	goto	i1l4649
	line	97
	
i1l4653:	
	line	98
	
i1l11196:	
;HMI.c: 97: }
;HMI.c: 98: return 0;
	movlw	(0)
	goto	i1l4649
	
i1l11198:	
	line	99
	
i1l4649:	
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
