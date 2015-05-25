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
	FNCALL	_main,_GoHome
	FNCALL	_main,_ser_putch
	FNCALL	_main,_FindVictim
	FNCALL	_main,_ChargeMode
	FNCALL	_FindVictim,_readAvgDistance
	FNCALL	_FindVictim,_robotFollow
	FNCALL	_FindVictim,_RobotDrive
	FNCALL	_FindVictim,_robotTurnSpeed
	FNCALL	_FindVictim,_ser_putch
	FNCALL	_FindVictim,_robotMoveSpeed
	FNCALL	_FindVictim,_robot_turnInPlace
	FNCALL	_FindVictim,_robot_turnArc
	FNCALL	_GoHome,_robotTurnSpeed
	FNCALL	_GoHome,_robot_turnArc
	FNCALL	_GoHome,_readAvgDistance
	FNCALL	_GoHome,_robotFollow
	FNCALL	_GoHome,_ser_putch
	FNCALL	_GoHome,_robot_turnInPlace
	FNCALL	_robot_turnInPlace,_robotTurnSpeed
	FNCALL	_robot_turnInPlace,_ser_putch
	FNCALL	_robot_turnInPlace,_RobotDrive
	FNCALL	_robotFollow,_RobotDrive
	FNCALL	_robotFollow,_ser_putch
	FNCALL	_robotFollow,_robotTurnSpeed
	FNCALL	_robotFollow,_robotMoveSpeed
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
	FNCALL	_robot_turnArc,_robotMoveSpeed
	FNCALL	_robot_turnArc,_abs
	FNCALL	_Init_Follow_IR,_calibrateIR
	FNCALL	_Init_Follow_IR,_rotate
	FNCALL	_robotMoveSpeed,_robot_read
	FNCALL	_robotMoveSpeed,_RobotDrive
	FNCALL	_robotMoveSpeed,_UpdateDisplay
	FNCALL	_robotMoveSpeed,_abs
	FNCALL	_robotTurnSpeed,_robot_read
	FNCALL	_robotTurnSpeed,_robotTurn
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
	global	UpdateDisplay@F1260
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
	global	_trackingDist
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

_trackingDist:
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

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
UpdateDisplay@F1260:
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
	movlw	low((__pbssBANK1)+03Bh)
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
	movlw low(__pdataBANK1+12)
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
	global	main@choice
main@choice:	; 1 bytes @ 0x0
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
	global	?_GoHome
?_GoHome:	; 0 bytes @ 0x0
	global	?_ser_putch
?_ser_putch:	; 0 bytes @ 0x0
	global	?_FindVictim
?_FindVictim:	; 0 bytes @ 0x0
	global	?_ChargeMode
?_ChargeMode:	; 0 bytes @ 0x0
	global	?_robot_turnInPlace
?_robot_turnInPlace:	; 0 bytes @ 0x0
	global	?_RobotBattRead
?_RobotBattRead:	; 0 bytes @ 0x0
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
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	Menu@BTN_input
Menu@BTN_input:	; 1 bytes @ 0x0
	global	_isdigit$8696
_isdigit$8696:	; 1 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
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
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
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
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
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
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	??_rotate
??_rotate:	; 0 bytes @ 0x6
	global	??_adc_read_channel
??_adc_read_channel:	; 0 bytes @ 0x6
	global	?_abs
?_abs:	; 2 bytes @ 0x6
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	global	abs@v
abs@v:	; 2 bytes @ 0x6
	ds	1
	global	?_lcd_write_string
?_lcd_write_string:	; 0 bytes @ 0x7
	global	adc_read_channel@channel
adc_read_channel@channel:	; 1 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	global	lcd_write_string@s
lcd_write_string@s:	; 2 bytes @ 0x7
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	??_abs
??_abs:	; 0 bytes @ 0x8
	global	?_readDistance
?_readDistance:	; 2 bytes @ 0x8
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x8
	global	rotate@i
rotate@i:	; 2 bytes @ 0x8
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x8
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
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xA
	ds	1
	global	RobotDrive@radius
RobotDrive@radius:	; 2 bytes @ 0xB
	ds	1
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0xC
	global	readDistance@readVal
readDistance@readVal:	; 2 bytes @ 0xC
	ds	1
	global	??_RobotDrive
??_RobotDrive:	; 0 bytes @ 0xD
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xD
	ds	1
	global	??_readAvgDistance
??_readAvgDistance:	; 0 bytes @ 0xE
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0xE
	global	RobotDrive@speedlowByte
RobotDrive@speedlowByte:	; 1 bytes @ 0xE
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0xE
	global	readAvgDistance@fullval
readAvgDistance@fullval:	; 2 bytes @ 0xE
	ds	1
	global	RobotDrive@speedhighByte
RobotDrive@speedhighByte:	; 1 bytes @ 0xF
	ds	1
	global	RobotDrive@radiuslowByte
RobotDrive@radiuslowByte:	; 1 bytes @ 0x10
	global	readAvgDistance@j
readAvgDistance@j:	; 2 bytes @ 0x10
	ds	1
	global	RobotDrive@radiushighByte
RobotDrive@radiushighByte:	; 1 bytes @ 0x11
	ds	1
	global	readAvgDistance@tempIR
readAvgDistance@tempIR:	; 2 bytes @ 0x12
	ds	1
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0x13
	ds	1
	global	readAvgDistance@i
readAvgDistance@i:	; 2 bytes @ 0x14
	ds	2
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x16
	ds	1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x17
	ds	1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x18
	ds	1
	global	sprintf@_val
sprintf@_val:	; 4 bytes @ 0x19
	ds	4
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0x1D
	ds	1
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x1E
	ds	2
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x20
	ds	1
	global	??_UpdateDisplay
??_UpdateDisplay:	; 0 bytes @ 0x21
	ds	4
	global	UpdateDisplay@LCDOutput
UpdateDisplay@LCDOutput:	; 16 bytes @ 0x25
	ds	16
	global	UpdateDisplay@tempDist
UpdateDisplay@tempDist:	; 2 bytes @ 0x35
	ds	2
	global	??_calibrateIR
??_calibrateIR:	; 0 bytes @ 0x37
	global	??_Init_Follow_IR
??_Init_Follow_IR:	; 0 bytes @ 0x37
	global	??_ChargeMode
??_ChargeMode:	; 0 bytes @ 0x37
	global	?_robotTurnSpeed
?_robotTurnSpeed:	; 0 bytes @ 0x37
	global	?_robotMoveSpeed
?_robotMoveSpeed:	; 0 bytes @ 0x37
	global	robotMoveSpeed@distance
robotMoveSpeed@distance:	; 2 bytes @ 0x37
	global	robotTurnSpeed@angle
robotTurnSpeed@angle:	; 2 bytes @ 0x37
	ds	2
	global	robotMoveSpeed@speed
robotMoveSpeed@speed:	; 2 bytes @ 0x39
	global	robotTurnSpeed@speed
robotTurnSpeed@speed:	; 2 bytes @ 0x39
	ds	2
	global	??_robotTurnSpeed
??_robotTurnSpeed:	; 0 bytes @ 0x3B
	global	??_robotMoveSpeed
??_robotMoveSpeed:	; 0 bytes @ 0x3B
	ds	3
	global	robotMoveSpeed@temp1
robotMoveSpeed@temp1:	; 2 bytes @ 0x3E
	global	robotTurnSpeed@temp1
robotTurnSpeed@temp1:	; 2 bytes @ 0x3E
	ds	2
	global	?_robot_turnArc
?_robot_turnArc:	; 0 bytes @ 0x40
	global	?_robotFollow
?_robotFollow:	; 0 bytes @ 0x40
	global	??_robot_turnInPlace
??_robot_turnInPlace:	; 0 bytes @ 0x40
	global	robotFollow@speed
robotFollow@speed:	; 2 bytes @ 0x40
	global	robot_turnArc@speed
robot_turnArc@speed:	; 2 bytes @ 0x40
	ds	2
	global	??_robot_turnArc
??_robot_turnArc:	; 0 bytes @ 0x42
	global	robotFollow@AdcTarget
robotFollow@AdcTarget:	; 2 bytes @ 0x42
	ds	2
	global	??_robotFollow
??_robotFollow:	; 0 bytes @ 0x44
	ds	1
	global	robot_turnArc@turnTarget
robot_turnArc@turnTarget:	; 2 bytes @ 0x45
	ds	2
	global	robot_turnArc@AdcTarget
robot_turnArc@AdcTarget:	; 2 bytes @ 0x47
	ds	1
	global	robotFollow@temp1
robotFollow@temp1:	; 2 bytes @ 0x48
	ds	1
	global	robot_turnArc@temp1
robot_turnArc@temp1:	; 2 bytes @ 0x49
	ds	1
	global	robotFollow@hysterysis
robotFollow@hysterysis:	; 1 bytes @ 0x4A
	ds	1
	global	??_GoHome
??_GoHome:	; 0 bytes @ 0x4B
	global	??_FindVictim
??_FindVictim:	; 0 bytes @ 0x4B
	ds	3
	global	??_main
??_main:	; 0 bytes @ 0x4E
	ds	2
;;Data sizes: Strings 200, constant 10, data 12, bss 108, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80     80      80
;; BANK1           80      1      72
;; BANK3           96      0      48
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?i1___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?_abs	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
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
;; S8331$_cp	PTR const unsigned char  size(1) Largest target is 0
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
;;   _FindVictim->_robotFollow
;;   _FindVictim->_robot_turnArc
;;   _GoHome->_robot_turnArc
;;   _GoHome->_robotFollow
;;   _robot_turnInPlace->_robotTurnSpeed
;;   _robotFollow->_robotTurnSpeed
;;   _robotFollow->_robotMoveSpeed
;;   _robot_turnArc->_robotMoveSpeed
;;   _robotMoveSpeed->_UpdateDisplay
;;   _robotTurnSpeed->_UpdateDisplay
;;   _ChargeMode->_UpdateDisplay
;;   _calibrateIR->_UpdateDisplay
;;   _UpdateDisplay->_sprintf
;;   _readAvgDistance->_readDistance
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
;;   _RobotDrive->___awdiv
;;   _rotate->_spi_transfer
;;   _robotLoadSong->_ser_putch
;;   _robo_init->_ser_putch
;;   _adc_read_channel->_adc_read
;;   ___lwmod->___lwdiv
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
;; (0) _main                                                 3     3      0   55802
;;                                             78 BANK0      2     2      0
;;                                              0 BANK1      1     1      0
;;                               _init
;;                      _robotLoadSong
;;                         _robot_read
;;                    _readAvgDistance
;;                      _UpdateDisplay
;;                               _Menu
;;                        _calibrateIR
;;                     _Init_Follow_IR
;;                             _GoHome
;;                          _ser_putch
;;                         _FindVictim
;;                         _ChargeMode
;; ---------------------------------------------------------------------------------
;; (1) _FindVictim                                           3     3      0   24490
;;                                             75 BANK0      3     3      0
;;                    _readAvgDistance
;;                        _robotFollow
;;                         _RobotDrive
;;                     _robotTurnSpeed
;;                          _ser_putch
;;                     _robotMoveSpeed
;;                  _robot_turnInPlace
;;                      _robot_turnArc
;; ---------------------------------------------------------------------------------
;; (1) _GoHome                                               1     1      0   21532
;;                                             75 BANK0      1     1      0
;;                     _robotTurnSpeed
;;                      _robot_turnArc
;;                    _readAvgDistance
;;                        _robotFollow
;;                          _ser_putch
;;                  _robot_turnInPlace
;; ---------------------------------------------------------------------------------
;; (2) _robot_turnInPlace                                    1     1      0    2823
;;                                             64 BANK0      1     1      0
;;                     _robotTurnSpeed
;;                          _ser_putch
;;                         _RobotDrive
;; ---------------------------------------------------------------------------------
;; (2) _robotFollow                                         11     7      4    8843
;;                                             64 BANK0     11     7      4
;;                         _RobotDrive
;;                          _ser_putch
;;                     _robotTurnSpeed
;;                     _robotMoveSpeed
;;                    _readAvgDistance
;;                             _rotate
;;                         _robot_read
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (2) _robot_turnArc                                       11     9      2    6874
;;                                             64 BANK0     11     9      2
;;                         _RobotDrive
;;                             _rotate
;;                    _readAvgDistance
;;                         _robot_read
;;                      _UpdateDisplay
;;                            ___awdiv
;;                     _robotMoveSpeed
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (1) _Init_Follow_IR                                       3     3      0    2412
;;                                             55 BANK0      3     3      0
;;                        _calibrateIR
;;                             _rotate
;; ---------------------------------------------------------------------------------
;; (3) _robotMoveSpeed                                       9     5      4    2756
;;                                             55 BANK0      9     5      4
;;                         _robot_read
;;                         _RobotDrive
;;                      _UpdateDisplay
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (3) _robotTurnSpeed                                       9     5      4    2599
;;                                             55 BANK0      9     5      4
;;                         _robot_read
;;                          _robotTurn
;;                      _UpdateDisplay
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (1) _ChargeMode                                           1     1      0    2287
;;                                             55 BANK0      1     1      0
;;                          _ser_putch
;;                      _RobotBattRead
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (2) _calibrateIR                                          0     0      0    2292
;;                             _rotate
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (2) _UpdateDisplay                                       22    22      0    2172
;;                                             33 BANK0     22    22      0
;;                  _lcd_write_control
;;                            _sprintf
;;                     _lcd_set_cursor
;;                   _lcd_write_string
;;                            ___awmod
;;                            ___awdiv
;; ---------------------------------------------------------------------------------
;; (3) _readAvgDistance                                      8     8      0     371
;;                                             14 BANK0      8     8      0
;;                       _readDistance
;;                            ___lwdiv
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
;; (4) _robot_read                                           2     2      0     111
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
;;                                             14 BANK0     19    14      5
;;                            _isdigit
;;                             ___wmul
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (4) _RobotDrive                                           9     5      4     202
;;                                              9 BANK0      9     5      4
;;                          _ser_putch
;;                            ___awdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (3) _rotate                                               7     4      3     120
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
;;                                              8 BANK0      6     2      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (4) ___lwdiv                                              8     4      4     162
;;                                              0 BANK0      8     4      4
;; ---------------------------------------------------------------------------------
;; (4) ___wmul                                               6     2      4      92
;;                                              0 BANK0      6     2      4
;; ---------------------------------------------------------------------------------
;; (4) _isdigit                                              2     2      0      68
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (4) _ser_isrx                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _spi_transfer                                         3     3      0      30
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
;;   _UpdateDisplay
;;     _lcd_write_control
;;     _sprintf
;;       _isdigit
;;       ___wmul
;;       ___lwdiv
;;       ___lwmod
;;         ___lwdiv (ARG)
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
;;         ___lwmod
;;           ___lwdiv (ARG)
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
;;           ___lwmod
;;             ___lwdiv (ARG)
;;         _lcd_set_cursor
;;           _lcd_write_control
;;         _lcd_write_string
;;           _lcd_write_data
;;           ___awmod (ARG)
;;         ___awmod
;;         ___awdiv
;;     _rotate
;;       _spi_transfer
;;   _GoHome
;;     _robotTurnSpeed
;;       _robot_read
;;         _ser_putch
;;         _ser_getch
;;           _ser_isrx
;;       _robotTurn
;;         _ser_putch
;;       _UpdateDisplay
;;         _lcd_write_control
;;         _sprintf
;;           _isdigit
;;           ___wmul
;;           ___lwdiv
;;           ___lwmod
;;             ___lwdiv (ARG)
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
;;           ___lwmod
;;             ___lwdiv (ARG)
;;         _lcd_set_cursor
;;           _lcd_write_control
;;         _lcd_write_string
;;           _lcd_write_data
;;           ___awmod (ARG)
;;         ___awmod
;;         ___awdiv
;;       ___awdiv
;;       _robotMoveSpeed
;;         _robot_read
;;           _ser_putch
;;           _ser_getch
;;             _ser_isrx
;;         _RobotDrive
;;           _ser_putch
;;           ___awdiv (ARG)
;;         _UpdateDisplay
;;           _lcd_write_control
;;           _sprintf
;;             _isdigit
;;             ___wmul
;;             ___lwdiv
;;             ___lwmod
;;               ___lwdiv (ARG)
;;           _lcd_set_cursor
;;             _lcd_write_control
;;           _lcd_write_string
;;             _lcd_write_data
;;             ___awmod (ARG)
;;           ___awmod
;;           ___awdiv
;;         _abs
;;           ___wmul
;;       _abs
;;         ___wmul
;;     _readAvgDistance
;;       _readDistance
;;         _adc_read_channel
;;           _adc_read
;;       ___lwdiv
;;     _robotFollow
;;       _RobotDrive
;;         _ser_putch
;;         ___awdiv (ARG)
;;       _ser_putch
;;       _robotTurnSpeed
;;         _robot_read
;;           _ser_putch
;;           _ser_getch
;;             _ser_isrx
;;         _robotTurn
;;           _ser_putch
;;         _UpdateDisplay
;;           _lcd_write_control
;;           _sprintf
;;             _isdigit
;;             ___wmul
;;             ___lwdiv
;;             ___lwmod
;;               ___lwdiv (ARG)
;;           _lcd_set_cursor
;;             _lcd_write_control
;;           _lcd_write_string
;;             _lcd_write_data
;;             ___awmod (ARG)
;;           ___awmod
;;           ___awdiv
;;         _abs
;;           ___wmul
;;       _robotMoveSpeed
;;         _robot_read
;;           _ser_putch
;;           _ser_getch
;;             _ser_isrx
;;         _RobotDrive
;;           _ser_putch
;;           ___awdiv (ARG)
;;         _UpdateDisplay
;;           _lcd_write_control
;;           _sprintf
;;             _isdigit
;;             ___wmul
;;             ___lwdiv
;;             ___lwmod
;;               ___lwdiv (ARG)
;;           _lcd_set_cursor
;;             _lcd_write_control
;;           _lcd_write_string
;;             _lcd_write_data
;;             ___awmod (ARG)
;;           ___awmod
;;           ___awdiv
;;         _abs
;;           ___wmul
;;       _readAvgDistance
;;         _readDistance
;;           _adc_read_channel
;;             _adc_read
;;         ___lwdiv
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
;;           ___lwmod
;;             ___lwdiv (ARG)
;;         _lcd_set_cursor
;;           _lcd_write_control
;;         _lcd_write_string
;;           _lcd_write_data
;;           ___awmod (ARG)
;;         ___awmod
;;         ___awdiv
;;     _ser_putch
;;     _robot_turnInPlace
;;       _robotTurnSpeed
;;         _robot_read
;;           _ser_putch
;;           _ser_getch
;;             _ser_isrx
;;         _robotTurn
;;           _ser_putch
;;         _UpdateDisplay
;;           _lcd_write_control
;;           _sprintf
;;             _isdigit
;;             ___wmul
;;             ___lwdiv
;;             ___lwmod
;;               ___lwdiv (ARG)
;;           _lcd_set_cursor
;;             _lcd_write_control
;;           _lcd_write_string
;;             _lcd_write_data
;;             ___awmod (ARG)
;;           ___awmod
;;           ___awdiv
;;         _abs
;;           ___wmul
;;       _ser_putch
;;       _RobotDrive
;;         _ser_putch
;;         ___awdiv (ARG)
;;   _ser_putch
;;   _FindVictim
;;     _readAvgDistance
;;       _readDistance
;;         _adc_read_channel
;;           _adc_read
;;       ___lwdiv
;;     _robotFollow
;;       _RobotDrive
;;         _ser_putch
;;         ___awdiv (ARG)
;;       _ser_putch
;;       _robotTurnSpeed
;;         _robot_read
;;           _ser_putch
;;           _ser_getch
;;             _ser_isrx
;;         _robotTurn
;;           _ser_putch
;;         _UpdateDisplay
;;           _lcd_write_control
;;           _sprintf
;;             _isdigit
;;             ___wmul
;;             ___lwdiv
;;             ___lwmod
;;               ___lwdiv (ARG)
;;           _lcd_set_cursor
;;             _lcd_write_control
;;           _lcd_write_string
;;             _lcd_write_data
;;             ___awmod (ARG)
;;           ___awmod
;;           ___awdiv
;;         _abs
;;           ___wmul
;;       _robotMoveSpeed
;;         _robot_read
;;           _ser_putch
;;           _ser_getch
;;             _ser_isrx
;;         _RobotDrive
;;           _ser_putch
;;           ___awdiv (ARG)
;;         _UpdateDisplay
;;           _lcd_write_control
;;           _sprintf
;;             _isdigit
;;             ___wmul
;;             ___lwdiv
;;             ___lwmod
;;               ___lwdiv (ARG)
;;           _lcd_set_cursor
;;             _lcd_write_control
;;           _lcd_write_string
;;             _lcd_write_data
;;             ___awmod (ARG)
;;           ___awmod
;;           ___awdiv
;;         _abs
;;           ___wmul
;;       _readAvgDistance
;;         _readDistance
;;           _adc_read_channel
;;             _adc_read
;;         ___lwdiv
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
;;           ___lwmod
;;             ___lwdiv (ARG)
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
;;       _robot_read
;;         _ser_putch
;;         _ser_getch
;;           _ser_isrx
;;       _robotTurn
;;         _ser_putch
;;       _UpdateDisplay
;;         _lcd_write_control
;;         _sprintf
;;           _isdigit
;;           ___wmul
;;           ___lwdiv
;;           ___lwmod
;;             ___lwdiv (ARG)
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
;;     _robotMoveSpeed
;;       _robot_read
;;         _ser_putch
;;         _ser_getch
;;           _ser_isrx
;;       _RobotDrive
;;         _ser_putch
;;         ___awdiv (ARG)
;;       _UpdateDisplay
;;         _lcd_write_control
;;         _sprintf
;;           _isdigit
;;           ___wmul
;;           ___lwdiv
;;           ___lwmod
;;             ___lwdiv (ARG)
;;         _lcd_set_cursor
;;           _lcd_write_control
;;         _lcd_write_string
;;           _lcd_write_data
;;           ___awmod (ARG)
;;         ___awmod
;;         ___awdiv
;;       _abs
;;         ___wmul
;;     _robot_turnInPlace
;;       _robotTurnSpeed
;;         _robot_read
;;           _ser_putch
;;           _ser_getch
;;             _ser_isrx
;;         _robotTurn
;;           _ser_putch
;;         _UpdateDisplay
;;           _lcd_write_control
;;           _sprintf
;;             _isdigit
;;             ___wmul
;;             ___lwdiv
;;             ___lwmod
;;               ___lwdiv (ARG)
;;           _lcd_set_cursor
;;             _lcd_write_control
;;           _lcd_write_string
;;             _lcd_write_data
;;             ___awmod (ARG)
;;           ___awmod
;;           ___awdiv
;;         _abs
;;           ___wmul
;;       _ser_putch
;;       _RobotDrive
;;         _ser_putch
;;         ___awdiv (ARG)
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
;;           ___lwmod
;;             ___lwdiv (ARG)
;;         _lcd_set_cursor
;;           _lcd_write_control
;;         _lcd_write_string
;;           _lcd_write_data
;;           ___awmod (ARG)
;;         ___awmod
;;         ___awdiv
;;       ___awdiv
;;       _robotMoveSpeed
;;         _robot_read
;;           _ser_putch
;;           _ser_getch
;;             _ser_isrx
;;         _RobotDrive
;;           _ser_putch
;;           ___awdiv (ARG)
;;         _UpdateDisplay
;;           _lcd_write_control
;;           _sprintf
;;             _isdigit
;;             ___wmul
;;             ___lwdiv
;;             ___lwmod
;;               ___lwdiv (ARG)
;;           _lcd_set_cursor
;;             _lcd_write_control
;;           _lcd_write_string
;;             _lcd_write_data
;;             ___awmod (ARG)
;;           ___awmod
;;           ___awdiv
;;         _abs
;;           ___wmul
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
;;         ___lwmod
;;           ___lwdiv (ARG)
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
;;BANK1               50      1      48       7       90.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      E0      12        0.0%
;;ABS                  0      0      D6       3        0.0%
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
;;  choice          1    0[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       1       0       0
;;Total ram usage:        3 bytes
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
;;		_GoHome
;;		_ser_putch
;;		_FindVictim
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
	
l12389:	
;Main.c: 173: unsigned char choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@choice)^080h
	line	174
	
l12391:	
;Main.c: 174: followDir = 0;
	clrf	(_followDir)^080h
	line	175
	
l12393:	
;Main.c: 175: RobotPos = 0;
	clrf	(_RobotPos)^080h
	line	176
	
l12395:	
;Main.c: 176: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	line	178
	
l12397:	
;Main.c: 178: init();
	fcall	_init
	line	179
	
l12399:	
;Main.c: 179: robotLoadSong();
	fcall	_robotLoadSong
	goto	l12401
	line	181
;Main.c: 181: while(1)
	
l2294:	
	line	183
	
l12401:	
;Main.c: 182: {
;Main.c: 183: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5691
	goto	u5690
u5691:
	goto	l12413
u5690:
	line	185
	
l12403:	
;Main.c: 184: {
;Main.c: 185: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	186
	
l12405:	
;Main.c: 186: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	187
	
l12407:	
;Main.c: 187: readAvgDistance();
	fcall	_readAvgDistance
	line	188
	
l12409:	
;Main.c: 188: Disp2 = RobotPos;
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
	line	189
	
l12411:	
;Main.c: 189: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12413
	line	190
	
l2295:	
	line	191
	
l12413:	
;Main.c: 190: }
;Main.c: 191: if (buttonPressed)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_buttonPressed)^080h,w	;volatile
	skipz
	goto	u5700
	goto	l12449
u5700:
	line	194
	
l12415:	
;Main.c: 193: {
;Main.c: 194: choice = Menu(buttonPressed);
	movf	(_buttonPressed)^080h,w	;volatile
	fcall	_Menu
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@choice)^080h
	line	195
	
l12417:	
;Main.c: 195: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	goto	l12449
	line	196
	
l2296:	
	line	200
;Main.c: 196: }
;Main.c: 200: switch (choice)
	goto	l12449
	line	202
;Main.c: 201: {
;Main.c: 202: case 0:
	
l2298:	
	line	203
	
l12419:	
;Main.c: 203: calibrateIR();
	fcall	_calibrateIR
	line	204
;Main.c: 204: break;
	goto	l12451
	line	205
;Main.c: 205: case 1:
	
l2300:	
	line	206
	
l12421:	
;Main.c: 206: RobotPos = 16;
	movlw	(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_RobotPos)^080h
	line	207
	
l12423:	
;Main.c: 207: Init_Follow_IR();
	fcall	_Init_Follow_IR
	line	208
	
l12425:	
;Main.c: 208: GoHome();
	fcall	_GoHome
	line	209
;Main.c: 209: break;
	goto	l12451
	line	210
;Main.c: 210: case 2:
	
l2301:	
	line	211
	
l12427:	
;Main.c: 211: RobotPos = 6;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_RobotPos)^080h
	line	212
	
l12429:	
;Main.c: 212: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	213
	
l12431:	
;Main.c: 213: ser_putch(4);
	movlw	(04h)
	fcall	_ser_putch
	line	214
;Main.c: 214: break;
	goto	l12451
	line	215
;Main.c: 215: case 3:
	
l2302:	
	line	217
	
l12433:	
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
	goto	l12451
	line	219
;Main.c: 219: case 4:
	
l2303:	
	line	220
;Main.c: 220: FoundVictim = 0;
	clrf	(_FoundVictim)^080h
	line	221
	
l12435:	
;Main.c: 221: Init_Follow_IR();
	fcall	_Init_Follow_IR
	line	222
	
l12437:	
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
	
l12439:	
;Main.c: 223: FindVictim();
	fcall	_FindVictim
	line	224
;Main.c: 224: if (FoundVictim)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_FoundVictim)^080h,w
	skipz
	goto	u5710
	goto	l12443
u5710:
	line	225
	
l12441:	
;Main.c: 225: GoHome();
	fcall	_GoHome
	goto	l12443
	
l2304:	
	line	226
	
l12443:	
;Main.c: 226: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	line	227
;Main.c: 227: break;
	goto	l12451
	line	229
;Main.c: 229: case 5:
	
l2305:	
	line	230
	
l12445:	
;Main.c: 230: ChargeMode();
	fcall	_ChargeMode
	line	231
;Main.c: 231: break;
	goto	l12451
	line	232
;Main.c: 232: default:
	
l2306:	
	line	234
;Main.c: 234: break;
	goto	l12451
	line	235
	
l12447:	
;Main.c: 235: }
	goto	l12451
	line	200
	
l2297:	
	
l12449:	
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
	goto	l12419
	xorlw	1^0	; case 1
	skipnz
	goto	l12421
	xorlw	2^1	; case 2
	skipnz
	goto	l12427
	xorlw	3^2	; case 3
	skipnz
	goto	l12433
	xorlw	4^3	; case 4
	skipnz
	goto	l2303
	xorlw	5^4	; case 5
	skipnz
	goto	l12445
	goto	l12451
	opt asmopt_on

	line	235
	
l2299:	
	line	236
	
l12451:	
;Main.c: 236: choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@choice)^080h
	goto	l12401
	line	237
	
l2307:	
	line	181
	goto	l12401
	
l2308:	
	line	238
	
l2309:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_FindVictim
psect	text1093,local,class=CODE,delta=2
global __ptext1093
__ptext1093:

;; *************** function _FindVictim *****************
;; Defined at:
;;		line 325 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;		_ser_putch
;;		_robotMoveSpeed
;;		_robot_turnInPlace
;;		_robot_turnArc
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1093
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	325
	global	__size_of_FindVictim
	__size_of_FindVictim	equ	__end_of_FindVictim-_FindVictim
	
_FindVictim:	
	opt	stack 0
; Regs used in _FindVictim: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	326
	
l12305:	
;Main.c: 326: while (ROBOTerror != 9)
	goto	l12387
	
l2343:	
	line	329
;Main.c: 327: {
;Main.c: 329: switch (ROBOTerror)
	goto	l12385
	line	331
;Main.c: 330: {
;Main.c: 331: case 0:
	
l2345:	
	line	333
	
l12307:	
;Main.c: 333: readAvgDistance();
	fcall	_readAvgDistance
	line	334
;Main.c: 334: robotFollow(200, adcVal);
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
	line	335
;Main.c: 335: break;
	goto	l12387
	line	336
;Main.c: 336: case 1:
	
l2347:	
	line	337
	
l12309:	
;Main.c: 337: if (RobotPos == 10)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
	xorlw	0Ah
	skipz
	goto	u5671
	goto	u5670
u5671:
	goto	l12321
u5670:
	line	339
	
l12311:	
;Main.c: 338: {
;Main.c: 339: RobotDrive(-200, 0x7FFF);
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
	line	340
	
l12313:	
;Main.c: 340: _delay((unsigned long)((200)*(20000000/4000.0)));
	opt asmopt_off
movlw  6
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_FindVictim+0)+0+2),f
movlw	19
movwf	((??_FindVictim+0)+0+1),f
	movlw	177
movwf	((??_FindVictim+0)+0),f
u5727:
	decfsz	((??_FindVictim+0)+0),f
	goto	u5727
	decfsz	((??_FindVictim+0)+0+1),f
	goto	u5727
	decfsz	((??_FindVictim+0)+0+2),f
	goto	u5727
	nop2
opt asmopt_on

	line	341
	
l12315:	
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
	
l12317:	
;Main.c: 342: ROBOTerror = 0;
	clrf	(_ROBOTerror)^080h
	line	343
	
l12319:	
;Main.c: 343: robotTurnSpeed((-(angleTurned - 75)),400);
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
	line	344
;Main.c: 344: }
	goto	l12387
	line	345
	
l2348:	
	line	346
	
l12321:	
;Main.c: 345: else
;Main.c: 346: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l12387
	
l2349:	
	line	347
;Main.c: 347: break;
	goto	l12387
	line	348
;Main.c: 348: case 2:
	
l2350:	
	line	349
	
l12323:	
;Main.c: 349: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	350
;Main.c: 350: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	351
	
l12325:	
;Main.c: 351: robotTurnSpeed((180),400);
	movlw	low(0B4h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(0B4h)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	352
	
l12327:	
;Main.c: 352: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	line	353
;Main.c: 353: break;
	goto	l12387
	line	354
;Main.c: 354: case 3:
	
l2351:	
	line	355
	
l12329:	
;Main.c: 355: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	356
	
l12331:	
;Main.c: 356: ROBOTerror = 0;
	clrf	(_ROBOTerror)^080h
	line	358
	
l12333:	
;Main.c: 358: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_FindVictim+0)+0+2),f
movlw	94
movwf	((??_FindVictim+0)+0+1),f
	movlw	134
movwf	((??_FindVictim+0)+0),f
u5737:
	decfsz	((??_FindVictim+0)+0),f
	goto	u5737
	decfsz	((??_FindVictim+0)+0+1),f
	goto	u5737
	decfsz	((??_FindVictim+0)+0+2),f
	goto	u5737
	clrwdt
opt asmopt_on

	line	359
	
l12335:	
;Main.c: 359: robotMoveSpeed(-200,-200);
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
	line	360
	
l12337:	
;Main.c: 360: robotTurnSpeed((-angleTurned-10),400);
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
	line	361
	
l12339:	
;Main.c: 361: robotMoveSpeed(250,200);
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
	line	362
	
l12341:	
;Main.c: 362: readAvgDistance();
	fcall	_readAvgDistance
	line	363
	
l12343:	
;Main.c: 363: robotFollow(200, adcVal - 10);
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
	line	364
;Main.c: 364: break;
	goto	l12387
	line	365
;Main.c: 365: case 4:
	
l2352:	
	line	366
	
l12345:	
;Main.c: 366: RobotDrive(200, 0x7FFF);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_RobotDrive)
	movlw	high(0C8h)
	movwf	((?_RobotDrive))+1
	movlw	low(07FFFh)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(07FFFh)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	367
	
l12347:	
;Main.c: 367: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_FindVictim+0)+0+2),f
movlw	94
movwf	((??_FindVictim+0)+0+1),f
	movlw	134
movwf	((??_FindVictim+0)+0),f
u5747:
	decfsz	((??_FindVictim+0)+0),f
	goto	u5747
	decfsz	((??_FindVictim+0)+0+1),f
	goto	u5747
	decfsz	((??_FindVictim+0)+0+2),f
	goto	u5747
	clrwdt
opt asmopt_on

	line	368
	
l12349:	
;Main.c: 368: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	369
	
l12351:	
;Main.c: 369: ser_putch(4);
	movlw	(04h)
	fcall	_ser_putch
	line	370
	
l12353:	
;Main.c: 370: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	371
	
l12355:	
;Main.c: 371: FoundVictim = 1;
	clrf	(_FoundVictim)^080h
	bsf	status,0
	rlf	(_FoundVictim)^080h,f
	line	372
	
l12357:	
;Main.c: 372: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	373
;Main.c: 373: break;
	goto	l12387
	line	374
;Main.c: 374: case 9:
	
l2353:	
	line	375
	
l12359:	
;Main.c: 375: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	376
;Main.c: 376: break;
	goto	l12387
	line	377
;Main.c: 377: case 10:
	
l2354:	
	line	378
	
l12361:	
;Main.c: 378: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	379
;Main.c: 379: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	380
	
l12363:	
;Main.c: 380: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	381
	
l12365:	
;Main.c: 381: robot_turnInPlace();
	fcall	_robot_turnInPlace
	line	382
	
l12367:	
;Main.c: 382: readAvgDistance();
	fcall	_readAvgDistance
	line	383
	
l12369:	
;Main.c: 383: robotFollow(200, adcVal - 10);
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
	line	384
;Main.c: 384: break;
	goto	l12387
	line	385
;Main.c: 385: case 11:
	
l2355:	
	line	386
	
l12371:	
;Main.c: 386: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	387
;Main.c: 387: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	388
	
l12373:	
;Main.c: 388: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_FindVictim+0)+0
	movf	(??_FindVictim+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	389
	
l12375:	
;Main.c: 389: robot_turnArc(200);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robot_turnArc)
	movlw	high(0C8h)
	movwf	((?_robot_turnArc))+1
	fcall	_robot_turnArc
	line	390
	
l12377:	
;Main.c: 390: readAvgDistance();
	fcall	_readAvgDistance
	line	391
	
l12379:	
;Main.c: 391: robotFollow(200, adcVal);
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
	line	393
;Main.c: 393: break;
	goto	l12387
	line	394
;Main.c: 394: default:
	
l2356:	
	line	395
	
l12381:	
;Main.c: 395: readAvgDistance();
	fcall	_readAvgDistance
	line	396
;Main.c: 396: robotFollow(200, adcVal);
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
	line	397
;Main.c: 397: break;
	goto	l12387
	line	399
	
l12383:	
;Main.c: 399: }
	goto	l12387
	line	329
	
l2344:	
	
l12385:	
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
	goto	l12307
	xorlw	1^0	; case 1
	skipnz
	goto	l12309
	xorlw	2^1	; case 2
	skipnz
	goto	l12323
	xorlw	3^2	; case 3
	skipnz
	goto	l12329
	xorlw	4^3	; case 4
	skipnz
	goto	l12345
	xorlw	9^4	; case 9
	skipnz
	goto	l12359
	xorlw	10^9	; case 10
	skipnz
	goto	l12361
	xorlw	11^10	; case 11
	skipnz
	goto	l12371
	goto	l12381
	opt asmopt_on

	line	399
	
l2346:	
	goto	l12387
	line	400
	
l2342:	
	line	326
	
l12387:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	xorlw	09h
	skipz
	goto	u5681
	goto	u5680
u5681:
	goto	l12385
u5680:
	goto	l2358
	
l2357:	
	line	401
	
l2358:	
	return
	opt stack 0
GLOBAL	__end_of_FindVictim
	__end_of_FindVictim:
;; =============== function _FindVictim ends ============

	signat	_FindVictim,88
	global	_GoHome
psect	text1094,local,class=CODE,delta=2
global __ptext1094
__ptext1094:

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
;;		_robot_turnArc
;;		_readAvgDistance
;;		_robotFollow
;;		_ser_putch
;;		_robot_turnInPlace
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1094
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	248
	global	__size_of_GoHome
	__size_of_GoHome	equ	__end_of_GoHome-_GoHome
	
_GoHome:	
	opt	stack 0
; Regs used in _GoHome: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	249
	
l12247:	
;Main.c: 249: switch (RobotPos)
	goto	l12255
	line	251
;Main.c: 250: {
;Main.c: 251: case 7:
	
l2316:	
	line	252
	
l12249:	
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
	goto	l12303
	line	254
;Main.c: 254: case 15:
	
l2318:	
	line	255
	
l12251:	
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
;Main.c: 256: robot_turnArc(200);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robot_turnArc)
	movlw	high(0C8h)
	movwf	((?_robot_turnArc))+1
	fcall	_robot_turnArc
	line	257
;Main.c: 257: break;
	goto	l12303
	line	258
	
l12253:	
;Main.c: 258: }
	goto	l12303
	line	249
	
l2315:	
	
l12255:	
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
	goto	l12249
	xorlw	15^7	; case 15
	skipnz
	goto	l12251
	goto	l12303
	opt asmopt_on

	line	258
	
l2317:	
	line	259
;Main.c: 259: while (ROBOTerror != 9)
	goto	l12303
	
l2320:	
	line	261
;Main.c: 260: {
;Main.c: 261: switch (ROBOTerror)
	goto	l12301
	line	263
;Main.c: 262: {
;Main.c: 263: case 0:
	
l2322:	
	line	264
	
l12257:	
;Main.c: 264: readAvgDistance();
	fcall	_readAvgDistance
	line	265
;Main.c: 265: robotFollow(200, adcVal);
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
	line	266
;Main.c: 266: break;
	goto	l12303
	line	267
;Main.c: 267: case 1:
	
l2324:	
	line	269
	
l12259:	
;Main.c: 269: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	270
;Main.c: 270: break;
	goto	l12303
	line	271
;Main.c: 271: case 2:
	
l2325:	
	line	272
	
l12261:	
;Main.c: 272: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	273
;Main.c: 273: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	274
	
l12263:	
;Main.c: 274: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	275
;Main.c: 275: break;
	goto	l12303
	line	276
;Main.c: 276: case 3:
	
l2326:	
	line	277
	
l12265:	
;Main.c: 277: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	278
;Main.c: 278: break;
	goto	l12303
	line	279
;Main.c: 279: case 4:
	
l2327:	
	line	280
;Main.c: 280: ROBOTerror = 0;
	clrf	(_ROBOTerror)^080h
	line	281
;Main.c: 281: break;
	goto	l12303
	line	282
;Main.c: 282: case 9:
	
l2328:	
	line	283
;Main.c: 283: break;
	goto	l12303
	line	284
;Main.c: 284: case 10:
	
l2329:	
	line	285
	
l12267:	
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
	
l12269:	
;Main.c: 286: if (followDir == 1)
	movf	(_followDir)^080h,w
	xorlw	01h
	skipz
	goto	u5601
	goto	u5600
u5601:
	goto	l12273
u5600:
	line	287
	
l12271:	
;Main.c: 287: robot_turnArc(200);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robot_turnArc)
	movlw	high(0C8h)
	movwf	((?_robot_turnArc))+1
	fcall	_robot_turnArc
	goto	l12273
	
l2330:	
	line	288
	
l12273:	
;Main.c: 288: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5611
	goto	u5610
u5611:
	goto	l12277
u5610:
	line	289
	
l12275:	
;Main.c: 289: robot_turnInPlace();
	fcall	_robot_turnInPlace
	goto	l12277
	
l2331:	
	line	290
	
l12277:	
;Main.c: 290: if (RobotPos == 17)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
	xorlw	011h
	skipz
	goto	u5621
	goto	u5620
u5621:
	goto	l12281
u5620:
	line	292
	
l12279:	
;Main.c: 291: {
;Main.c: 292: trackingDist = TotalDistTravelled;
	movf	(_TotalDistTravelled+1)^080h,w
	clrf	(_trackingDist+1)^080h
	addwf	(_trackingDist+1)^080h
	movf	(_TotalDistTravelled)^080h,w
	clrf	(_trackingDist)^080h
	addwf	(_trackingDist)^080h

	goto	l12281
	line	293
	
l2332:	
	line	294
	
l12281:	
;Main.c: 293: }
;Main.c: 294: if (RobotPos == 21)
	movf	(_RobotPos)^080h,w
	xorlw	015h
	skipz
	goto	u5631
	goto	u5630
u5631:
	goto	l12285
u5630:
	goto	l12303
	line	296
	
l12283:	
;Main.c: 295: {
;Main.c: 296: break;
	goto	l12303
	line	297
	
l2333:	
	line	298
	
l12285:	
;Main.c: 297: }
;Main.c: 298: readAvgDistance();
	fcall	_readAvgDistance
	line	299
;Main.c: 299: robotFollow(200, adcVal - 10);
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
	line	300
;Main.c: 300: break;
	goto	l12303
	line	301
;Main.c: 301: case 11:
	
l2334:	
	line	302
	
l12287:	
;Main.c: 302: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_GoHome+0)+0
	movf	(??_GoHome+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	309
	
l12289:	
;Main.c: 309: if (followDir == 1)
	movf	(_followDir)^080h,w
	xorlw	01h
	skipz
	goto	u5641
	goto	u5640
u5641:
	goto	l12293
u5640:
	line	310
	
l12291:	
;Main.c: 310: robot_turnInPlace();
	fcall	_robot_turnInPlace
	goto	l12293
	
l2335:	
	line	311
	
l12293:	
;Main.c: 311: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5651
	goto	u5650
u5651:
	goto	l2336
u5650:
	line	312
	
l12295:	
;Main.c: 312: robot_turnArc(200);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robot_turnArc)
	movlw	high(0C8h)
	movwf	((?_robot_turnArc))+1
	fcall	_robot_turnArc
	
l2336:	
	line	313
;Main.c: 313: readAvgDistance();
	fcall	_readAvgDistance
	line	314
;Main.c: 314: robotFollow(200, adcVal);
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
	line	315
;Main.c: 315: break;
	goto	l12303
	line	316
;Main.c: 316: default:
	
l2337:	
	line	317
	
l12297:	
;Main.c: 317: readAvgDistance();
	fcall	_readAvgDistance
	line	318
;Main.c: 318: robotFollow(200, adcVal);
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
	line	319
;Main.c: 319: break;
	goto	l12303
	line	320
	
l12299:	
;Main.c: 320: }
	goto	l12303
	line	261
	
l2321:	
	
l12301:	
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
	goto	l12257
	xorlw	1^0	; case 1
	skipnz
	goto	l12259
	xorlw	2^1	; case 2
	skipnz
	goto	l12261
	xorlw	3^2	; case 3
	skipnz
	goto	l12265
	xorlw	4^3	; case 4
	skipnz
	goto	l2327
	xorlw	9^4	; case 9
	skipnz
	goto	l12303
	xorlw	10^9	; case 10
	skipnz
	goto	l12267
	xorlw	11^10	; case 11
	skipnz
	goto	l12287
	goto	l12297
	opt asmopt_on

	line	320
	
l2323:	
	goto	l12303
	line	321
	
l2319:	
	line	259
	
l12303:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	xorlw	09h
	skipz
	goto	u5661
	goto	u5660
u5661:
	goto	l12301
u5660:
	goto	l2339
	
l2338:	
	line	322
	
l2339:	
	return
	opt stack 0
GLOBAL	__end_of_GoHome
	__end_of_GoHome:
;; =============== function _GoHome ends ============

	signat	_GoHome,88
	global	_robot_turnInPlace
psect	text1095,local,class=CODE,delta=2
global __ptext1095
__ptext1095:

;; *************** function _robot_turnInPlace *****************
;; Defined at:
;;		line 310 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;;		_ser_putch
;;		_RobotDrive
;; This function is called by:
;;		_GoHome
;;		_FindVictim
;; This function uses a non-reentrant model
;;
psect	text1095
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	310
	global	__size_of_robot_turnInPlace
	__size_of_robot_turnInPlace	equ	__end_of_robot_turnInPlace-_robot_turnInPlace
	
_robot_turnInPlace:	
	opt	stack 0
; Regs used in _robot_turnInPlace: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	311
	
l12209:	
;robot.c: 311: switch (RobotPos)
	goto	l12245
	line	313
;robot.c: 312: {
;robot.c: 313: case 8:
	
l6263:	
	line	314
	
l12211:	
;robot.c: 314: robotTurnSpeed(160,400);
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
	line	315
	
l12213:	
;robot.c: 315: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnInPlace+0)+0
	movf	(??_robot_turnInPlace+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	316
;robot.c: 316: break;
	goto	l6274
	line	317
;robot.c: 317: case 12:
	
l6265:	
	line	318
	
l12215:	
;robot.c: 318: robotTurnSpeed(80,400);
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
	line	319
;robot.c: 319: break;
	goto	l6274
	line	320
;robot.c: 320: case 14:
	
l6266:	
	line	321
	
l12217:	
;robot.c: 321: robotTurnSpeed(80,400);
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
	line	322
	
l12219:	
;robot.c: 322: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	323
	
l12221:	
;robot.c: 323: ser_putch(3);
	movlw	(03h)
	fcall	_ser_putch
	line	324
;robot.c: 324: break;
	goto	l6274
	line	326
;robot.c: 326: case 15:
	
l6267:	
	line	327
	
l12223:	
;robot.c: 327: robotTurnSpeed(160,400);
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
	line	328
	
l12225:	
;robot.c: 328: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnInPlace+0)+0
	movf	(??_robot_turnInPlace+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	329
;robot.c: 329: break;
	goto	l6274
	line	330
;robot.c: 330: case 16:
	
l6268:	
	line	331
	
l12227:	
;robot.c: 331: robotTurnSpeed(70,400);
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
	line	332
;robot.c: 332: break;
	goto	l6274
	line	333
;robot.c: 333: case 17:
	
l6269:	
	line	334
	
l12229:	
;robot.c: 334: robotTurnSpeed(80,400);
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
	line	335
;robot.c: 335: break;
	goto	l6274
	line	336
;robot.c: 336: case 21:
	
l6270:	
	line	338
	
l12231:	
;robot.c: 338: RobotDrive(0, 0x7FFF);
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
	line	339
;robot.c: 339: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	340
;robot.c: 340: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	341
	
l12233:	
;robot.c: 341: ROBOTerror = 9;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnInPlace+0)+0
	movf	(??_robot_turnInPlace+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	343
;robot.c: 343: break;
	goto	l6274
	line	344
;robot.c: 344: default:
	
l6271:	
	line	345
	
l12235:	
;robot.c: 345: if (followDir == 1)
	movf	(_followDir)^080h,w
	xorlw	01h
	skipz
	goto	u5581
	goto	u5580
u5581:
	goto	l12239
u5580:
	line	346
	
l12237:	
;robot.c: 346: robotTurnSpeed(-80,400);
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
	goto	l12239
	
l6272:	
	line	347
	
l12239:	
;robot.c: 347: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5591
	goto	u5590
u5591:
	goto	l6274
u5590:
	line	348
	
l12241:	
;robot.c: 348: robotTurnSpeed(80,400);
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
	goto	l6274
	
l6273:	
	line	350
;robot.c: 350: break;
	goto	l6274
	line	351
	
l12243:	
;robot.c: 351: }
	goto	l6274
	line	311
	
l6262:	
	
l12245:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 8 to 21
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           22    12 (average)
; direct_byte           53    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	8^0	; case 8
	skipnz
	goto	l12211
	xorlw	12^8	; case 12
	skipnz
	goto	l12215
	xorlw	14^12	; case 14
	skipnz
	goto	l12217
	xorlw	15^14	; case 15
	skipnz
	goto	l12223
	xorlw	16^15	; case 16
	skipnz
	goto	l12227
	xorlw	17^16	; case 17
	skipnz
	goto	l12229
	xorlw	21^17	; case 21
	skipnz
	goto	l12231
	goto	l12235
	opt asmopt_on

	line	351
	
l6264:	
	line	352
	
l6274:	
	return
	opt stack 0
GLOBAL	__end_of_robot_turnInPlace
	__end_of_robot_turnInPlace:
;; =============== function _robot_turnInPlace ends ============

	signat	_robot_turnInPlace,88
	global	_robotFollow
psect	text1096,local,class=CODE,delta=2
global __ptext1096
__ptext1096:

;; *************** function _robotFollow *****************
;; Defined at:
;;		line 186 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  speed           2   64[BANK0 ] int 
;;  AdcTarget       2   66[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   72[BANK0 ] int 
;;  hysterysis      1   74[BANK0 ] unsigned char 
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
;;		_robotTurnSpeed
;;		_robotMoveSpeed
;;		_readAvgDistance
;;		_rotate
;;		_robot_read
;;		_UpdateDisplay
;; This function is called by:
;;		_GoHome
;;		_FindVictim
;; This function uses a non-reentrant model
;;
psect	text1096
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	186
	global	__size_of_robotFollow
	__size_of_robotFollow	equ	__end_of_robotFollow-_robotFollow
	
_robotFollow:	
	opt	stack 0
; Regs used in _robotFollow: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	187
	
l12075:	
;robot.c: 187: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	189
	
l12077:	
;robot.c: 188: int temp1;
;robot.c: 189: unsigned char hysterysis = 20;
	movlw	(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	movwf	(robotFollow@hysterysis)
	line	190
	
l12079:	
;robot.c: 190: RobotDrive(speed, 0x7FFF);
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
	line	191
	
l12081:	
;robot.c: 191: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	goto	l12083
	line	194
;robot.c: 194: while (1)
	
l6232:	
	line	196
	
l12083:	
;robot.c: 195: {
;robot.c: 196: if (AdcTarget > 185)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0BAh))^80h
	subwf	btemp+1,w
	skipz
	goto	u5375
	movlw	low(0BAh)
	subwf	(robotFollow@AdcTarget),w
u5375:

	skipc
	goto	u5371
	goto	u5370
u5371:
	goto	l12097
u5370:
	line	198
	
l12085:	
;robot.c: 197: {
;robot.c: 198: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	199
;robot.c: 199: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	200
	
l12087:	
;robot.c: 200: robotTurnSpeed(70,400);
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
	line	201
	
l12089:	
;robot.c: 201: robotMoveSpeed(100,200);
	movlw	low(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(064h)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(0C8h)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(0C8h)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	202
	
l12091:	
;robot.c: 202: robotTurnSpeed(-70,400);
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
	line	203
	
l12093:	
;robot.c: 203: readAvgDistance();
	fcall	_readAvgDistance
	line	204
	
l12095:	
;robot.c: 204: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	line	205
;robot.c: 205: break;
	goto	l12205
	line	206
	
l6233:	
	line	217
	
l12097:	
;robot.c: 206: }
;robot.c: 217: if (AdcTarget > 100)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(065h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5385
	movlw	low(065h)
	subwf	(robotFollow@AdcTarget),w
u5385:

	skipc
	goto	u5381
	goto	u5380
u5381:
	goto	l12101
u5380:
	line	218
	
l12099:	
;robot.c: 218: AdcTarget--;
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(robotFollow@AdcTarget),f
	skipnc
	incf	(robotFollow@AdcTarget+1),f
	movlw	high(-1)
	addwf	(robotFollow@AdcTarget+1),f
	goto	l12101
	
l6235:	
	line	219
	
l12101:	
;robot.c: 219: if (AdcTarget < 100)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(064h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5395
	movlw	low(064h)
	subwf	(robotFollow@AdcTarget),w
u5395:

	skipnc
	goto	u5391
	goto	u5390
u5391:
	goto	l12105
u5390:
	line	220
	
l12103:	
;robot.c: 220: AdcTarget++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(robotFollow@AdcTarget),f
	skipnc
	incf	(robotFollow@AdcTarget+1),f
	movlw	high(01h)
	addwf	(robotFollow@AdcTarget+1),f
	goto	l12105
	
l6236:	
	line	221
	
l12105:	
;robot.c: 221: readAvgDistance();
	fcall	_readAvgDistance
	line	222
	
l12107:	
;robot.c: 222: if (adcVal > (AdcTarget) && adcVal < (AdcTarget + hysterysis))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robotFollow@AdcTarget+1),w
	skipz
	goto	u5405
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robotFollow@AdcTarget),w
u5405:
	skipnc
	goto	u5401
	goto	u5400
u5401:
	goto	l12119
u5400:
	
l12109:	
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
	goto	u5415
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5415:
	skipnc
	goto	u5411
	goto	u5410
u5411:
	goto	l12119
u5410:
	line	224
	
l12111:	
;robot.c: 223: {
;robot.c: 224: if (followDir == 1)
	movf	(_followDir)^080h,w
	xorlw	01h
	skipz
	goto	u5421
	goto	u5420
u5421:
	goto	l12115
u5420:
	line	225
	
l12113:	
;robot.c: 225: RobotDrive(speed, -1700);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	l12115
	
l6238:	
	line	226
	
l12115:	
;robot.c: 226: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5431
	goto	u5430
u5431:
	goto	l6240
u5430:
	line	227
	
l12117:	
;robot.c: 227: RobotDrive(speed, 1700);
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
	goto	l6240
	
l6239:	
	line	229
;robot.c: 229: }
	goto	l6240
	line	230
	
l6237:	
	
l12119:	
;robot.c: 230: else if (adcVal < (AdcTarget) && adcVal > (AdcTarget - hysterysis))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	skipz
	goto	u5445
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5445:
	skipnc
	goto	u5441
	goto	u5440
u5441:
	goto	l12131
u5440:
	
l12121:	
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
	goto	u5455
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robotFollow+2)+0,w
u5455:
	skipnc
	goto	u5451
	goto	u5450
u5451:
	goto	l12131
u5450:
	line	232
	
l12123:	
;robot.c: 231: {
;robot.c: 232: if (followDir == 1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,w
	xorlw	01h
	skipz
	goto	u5461
	goto	u5460
u5461:
	goto	l12127
u5460:
	line	233
	
l12125:	
;robot.c: 233: RobotDrive(speed, 1700);
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
	goto	l12127
	
l6242:	
	line	234
	
l12127:	
;robot.c: 234: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5471
	goto	u5470
u5471:
	goto	l6240
u5470:
	line	235
	
l12129:	
;robot.c: 235: RobotDrive(speed, -1700);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	l6240
	
l6243:	
	line	236
;robot.c: 236: }
	goto	l6240
	line	237
	
l6241:	
	
l12131:	
;robot.c: 237: else if (adcVal <= (AdcTarget - hysterysis) || adcVal >= (AdcTarget + hysterysis))
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
	goto	u5485
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robotFollow+2)+0,w
u5485:
	skipnc
	goto	u5481
	goto	u5480
u5481:
	goto	l12135
u5480:
	
l12133:	
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
	goto	u5495
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5495:
	skipc
	goto	u5491
	goto	u5490
u5491:
	goto	l12157
u5490:
	goto	l12135
	
l6247:	
	line	239
	
l12135:	
;robot.c: 238: {
;robot.c: 239: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5501
	goto	u5500
u5501:
	goto	l12143
u5500:
	line	241
	
l12137:	
;robot.c: 240: {
;robot.c: 241: rotate(10,1);
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
	line	242
	
l12139:	
;robot.c: 242: readAvgDistance();
	fcall	_readAvgDistance
	line	243
	
l12141:	
;robot.c: 243: rotate(10,0);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	244
;robot.c: 244: }
	goto	l12149
	line	245
	
l6248:	
	line	247
	
l12143:	
;robot.c: 245: else
;robot.c: 246: {
;robot.c: 247: rotate(10,0);
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(0Ah)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	248
	
l12145:	
;robot.c: 248: readAvgDistance();
	fcall	_readAvgDistance
	line	249
	
l12147:	
;robot.c: 249: rotate(10,1);
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
	goto	l12149
	line	250
	
l6249:	
	line	251
	
l12149:	
;robot.c: 250: }
;robot.c: 251: if (adcVal < 50)
	movlw	high(032h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(032h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u5511
	goto	u5510
u5511:
	goto	l12153
u5510:
	line	252
	
l12151:	
;robot.c: 252: ROBOTerror = 11;
	movlw	(0Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l12205
	line	253
	
l6250:	
	line	254
	
l12153:	
;robot.c: 253: else
;robot.c: 254: ROBOTerror = 10;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	goto	l12205
	
l6251:	
	line	256
;robot.c: 256: break;
	goto	l12205
	line	257
	
l12155:	
;robot.c: 257: }
	goto	l6240
	line	258
	
l6245:	
	line	260
	
l12157:	
;robot.c: 258: else
;robot.c: 259: {
;robot.c: 260: RobotDrive(speed, 0x7FFF);
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
	goto	l6240
	line	261
	
l6252:	
	goto	l6240
	
l6244:	
	
l6240:	
	line	262
;robot.c: 261: }
;robot.c: 262: robot_read(0);
	movlw	(0)
	fcall	_robot_read
	line	263
	
l12159:	
;robot.c: 263: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5520
	goto	l12165
u5520:
	line	265
	
l12161:	
;robot.c: 264: {
;robot.c: 265: RobotDrive(0, 0x7FFF);
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
	line	266
	
l12163:	
;robot.c: 266: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	267
;robot.c: 267: break;
	goto	l12205
	line	268
	
l6253:	
	line	269
	
l12165:	
;robot.c: 268: }
;robot.c: 269: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5530
	goto	l12171
u5530:
	line	271
	
l12167:	
;robot.c: 270: {
;robot.c: 271: RobotDrive(0, 0x7FFF);
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
	line	272
	
l12169:	
;robot.c: 272: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	273
;robot.c: 273: break;
	goto	l12205
	line	274
	
l6254:	
	line	275
	
l12171:	
;robot.c: 274: }
;robot.c: 275: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5540
	goto	l12177
u5540:
	line	277
	
l12173:	
;robot.c: 276: {
;robot.c: 277: RobotDrive(-200, 0x7FFF);
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
	line	278
	
l12175:	
;robot.c: 278: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	279
;robot.c: 279: break;
	goto	l12205
	line	280
	
l6255:	
	line	281
	
l12177:	
;robot.c: 280: }
;robot.c: 281: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5551
	goto	u5550
u5551:
	goto	l12183
u5550:
	line	283
	
l12179:	
;robot.c: 282: {
;robot.c: 283: RobotDrive(0, 0x7FFF);
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
	line	284
	
l12181:	
;robot.c: 284: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	285
;robot.c: 285: break;
	goto	l12205
	line	286
	
l6256:	
	line	287
	
l12183:	
;robot.c: 286: }
;robot.c: 287: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	clrf	(??_robotFollow+0)+0+1
	movf	0+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1)
	movf	1+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1+1)
	line	288
	
l12185:	
;robot.c: 288: temp1 = temp1 << 8;
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
	line	289
	
l12187:	
;robot.c: 289: temp1 += DistLowByte;
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
	line	290
	
l12189:	
;robot.c: 290: distTravelled += temp1;
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
	line	291
	
l12191:	
;robot.c: 291: TotalDistTravelled += temp1;
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
	line	292
;robot.c: 292: if (trackingDist > 0 && trackingDist <= TotalDistTravelled - 2050 )
	movf	(_trackingDist+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5565
	movlw	low(01h)
	subwf	(_trackingDist)^080h,w
u5565:

	skipc
	goto	u5561
	goto	u5560
u5561:
	goto	l12201
u5560:
	
l12193:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_TotalDistTravelled)^080h,w
	addlw	low(-2050)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_TotalDistTravelled+1)^080h,w
	skipnc
	addlw	1
	addlw	high(-2050)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(??_robotFollow+0)+0
	movf	1+(??_robotFollow+0)+0,w
	xorlw	80h
	movwf	(??_robotFollow+2)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_trackingDist+1)^080h,w
	xorlw	80h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(??_robotFollow+2)+0,w
	skipz
	goto	u5575
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_trackingDist)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robotFollow+0)+0,w
u5575:

	skipc
	goto	u5571
	goto	u5570
u5571:
	goto	l12201
u5570:
	line	295
	
l12195:	
;robot.c: 293: {
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
;robot.c: 296: robotMoveSpeed(400, 200);
	movlw	low(0190h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(0190h)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(0C8h)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(0C8h)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	297
	
l12197:	
;robot.c: 297: trackingDist = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_trackingDist)^080h
	clrf	(_trackingDist+1)^080h
	line	298
	
l12199:	
;robot.c: 298: RobotPos++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RobotPos)^080h,f
	line	299
;robot.c: 299: break;
	goto	l12205
	line	300
	
l6257:	
	line	301
	
l12201:	
;robot.c: 300: }
;robot.c: 301: Disp2 = RobotPos;
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
	line	302
	
l12203:	
;robot.c: 302: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12083
	line	303
	
l6258:	
	line	194
	goto	l12083
	
l6234:	
	line	305
	
l12205:	
;robot.c: 303: }
;robot.c: 305: Disp2 = RobotPos;
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
	line	306
	
l12207:	
;robot.c: 306: UpdateDisplay();
	fcall	_UpdateDisplay
	line	307
	
l6259:	
	return
	opt stack 0
GLOBAL	__end_of_robotFollow
	__end_of_robotFollow:
;; =============== function _robotFollow ends ============

	signat	_robotFollow,8312
	global	_robot_turnArc
psect	text1097,local,class=CODE,delta=2
global __ptext1097
__ptext1097:

;; *************** function _robot_turnArc *****************
;; Defined at:
;;		line 355 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  speed           2   64[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   73[BANK0 ] int 
;;  AdcTarget       2   71[BANK0 ] int 
;;  turnTarget      2   69[BANK0 ] int 
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
;;		_robotMoveSpeed
;;		_abs
;; This function is called by:
;;		_GoHome
;;		_FindVictim
;; This function uses a non-reentrant model
;;
psect	text1097
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	355
	global	__size_of_robot_turnArc
	__size_of_robot_turnArc	equ	__end_of_robot_turnArc-_robot_turnArc
	
_robot_turnArc:	
	opt	stack 0
; Regs used in _robot_turnArc: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	357
	
l11893:	
;robot.c: 357: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	359
;robot.c: 358: int temp1;
;robot.c: 359: int turnTarget = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robot_turnArc@turnTarget)
	clrf	(robot_turnArc@turnTarget+1)
	line	360
	
l11895:	
;robot.c: 360: RobotDrive(speed, 0x7FFF);
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
	line	361
	
l11897:	
;robot.c: 361: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	line	362
	
l11899:	
;robot.c: 362: if (followDir == 0)
	movf	(_followDir)^080h,f
	skipz
	goto	u5181
	goto	u5180
u5181:
	goto	l11903
u5180:
	line	364
	
l11901:	
;robot.c: 363: {
;robot.c: 364: rotate(25,0);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	365
;robot.c: 365: }
	goto	l11905
	line	366
	
l6277:	
	line	368
	
l11903:	
;robot.c: 366: else
;robot.c: 367: {
;robot.c: 368: rotate(25,1);
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
	goto	l11905
	line	369
	
l6278:	
	line	370
	
l11905:	
;robot.c: 369: }
;robot.c: 370: readAvgDistance();
	fcall	_readAvgDistance
	line	371
	
l11907:	
;robot.c: 371: int AdcTarget = adcVal;
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

	goto	l11909
	line	373
;robot.c: 373: while (1)
	
l6279:	
	line	375
	
l11909:	
;robot.c: 374: {
;robot.c: 375: readAvgDistance();
	fcall	_readAvgDistance
	line	376
	
l11911:	
;robot.c: 376: if (adcVal > (AdcTarget) && adcVal < (AdcTarget + 15))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robot_turnArc@AdcTarget+1),w
	skipz
	goto	u5195
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robot_turnArc@AdcTarget),w
u5195:
	skipnc
	goto	u5191
	goto	u5190
u5191:
	goto	l11917
u5190:
	
l11913:	
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
	goto	u5205
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5205:
	skipnc
	goto	u5201
	goto	u5200
u5201:
	goto	l11917
u5200:
	line	378
	
l11915:	
;robot.c: 377: {
;robot.c: 378: RobotDrive(speed, 1700);
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
	line	379
;robot.c: 379: }
	goto	l6281
	line	380
	
l6280:	
	
l11917:	
;robot.c: 380: else if (adcVal < (AdcTarget) && adcVal > (AdcTarget - 15))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@AdcTarget+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	skipz
	goto	u5215
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_turnArc@AdcTarget),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5215:
	skipnc
	goto	u5211
	goto	u5210
u5211:
	goto	l11923
u5210:
	
l11919:	
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
	goto	u5225
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robot_turnArc+0)+0,w
u5225:
	skipnc
	goto	u5221
	goto	u5220
u5221:
	goto	l11923
u5220:
	line	382
	
l11921:	
;robot.c: 381: {
;robot.c: 382: RobotDrive(speed, -1700);
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
	line	383
;robot.c: 383: }
	goto	l6281
	line	384
	
l6282:	
	
l11923:	
;robot.c: 384: else if (adcVal <= (AdcTarget - 50) || adcVal >= (AdcTarget + 15))
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
	goto	u5235
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(??_robot_turnArc+0)+0,w
u5235:
	skipnc
	goto	u5231
	goto	u5230
u5231:
	goto	l11971
u5230:
	
l11925:	
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
	goto	u5245
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal)^080h,w	;volatile
u5245:
	skipc
	goto	u5241
	goto	u5240
u5241:
	goto	l11929
u5240:
	goto	l11971
	
l6286:	
	line	386
;robot.c: 385: {
;robot.c: 386: break;
	goto	l11971
	line	387
	
l11927:	
;robot.c: 387: }
	goto	l6281
	line	389
	
l6284:	
	line	391
	
l11929:	
;robot.c: 389: else
;robot.c: 390: {
;robot.c: 391: RobotDrive(speed, 0x7FFF);
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
	goto	l6281
	line	392
	
l6288:	
	goto	l6281
	
l6283:	
	
l6281:	
	line	393
;robot.c: 392: }
;robot.c: 393: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	394
	
l11931:	
;robot.c: 394: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5250
	goto	l11937
u5250:
	line	396
	
l11933:	
;robot.c: 395: {
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
	line	397
	
l11935:	
;robot.c: 397: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	398
;robot.c: 398: break;
	goto	l11971
	line	399
	
l6289:	
	line	400
	
l11937:	
;robot.c: 399: }
;robot.c: 400: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5260
	goto	l11943
u5260:
	line	402
	
l11939:	
;robot.c: 401: {
;robot.c: 402: RobotDrive(0, 0x7FFF);
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
	line	403
	
l11941:	
;robot.c: 403: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	404
;robot.c: 404: break;
	goto	l11971
	line	405
	
l6290:	
	line	406
	
l11943:	
;robot.c: 405: }
;robot.c: 406: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5270
	goto	l11949
u5270:
	line	408
	
l11945:	
;robot.c: 407: {
;robot.c: 408: RobotDrive(-200, 0x7FFF);
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
	line	409
	
l11947:	
;robot.c: 409: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	410
;robot.c: 410: break;
	goto	l11971
	line	411
	
l6291:	
	line	412
	
l11949:	
;robot.c: 411: }
;robot.c: 412: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5281
	goto	u5280
u5281:
	goto	l11955
u5280:
	line	414
	
l11951:	
;robot.c: 413: {
;robot.c: 414: RobotDrive(0, 0x7FFF);
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
	line	415
	
l11953:	
;robot.c: 415: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	416
;robot.c: 416: break;
	goto	l11971
	line	417
	
l6292:	
	line	418
	
l11955:	
;robot.c: 417: }
;robot.c: 418: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1)
	movf	1+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1+1)
	line	419
	
l11957:	
;robot.c: 419: temp1 = temp1 << 8;
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
	line	420
	
l11959:	
;robot.c: 420: temp1 += DistLowByte;
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
	line	421
	
l11961:	
;robot.c: 421: distTravelled += temp1;
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
	line	422
	
l11963:	
;robot.c: 422: TotalDistTravelled += temp1;
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
	line	423
	
l11965:	
;robot.c: 423: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1)
	movf	1+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1+1)
	line	424
	
l11967:	
;robot.c: 424: temp1 = temp1 << 8;
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
	line	425
;robot.c: 425: temp1 += AngleLowByte;
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
	line	426
;robot.c: 426: angleTurned += temp1;
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
	line	427
;robot.c: 427: Disp2 = RobotPos;
	movf	(_RobotPos)^080h,w
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
	line	428
	
l11969:	
;robot.c: 428: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11909
	line	429
	
l6293:	
	line	373
	goto	l11909
	
l6287:	
	line	431
	
l11971:	
;robot.c: 429: }
;robot.c: 431: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	432
;robot.c: 432: switch (RobotPos)
	goto	l12019
	line	434
;robot.c: 433: {
;robot.c: 434: case 3:
	
l6295:	
	line	435
	
l11973:	
;robot.c: 435: RobotDrive((speed /3), -400);
	movlw	low(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awdiv)
	movlw	high(03h)
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
	line	436
	
l11975:	
;robot.c: 436: turnTarget = -100;
	movlw	low(-100)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-100)
	movwf	((robot_turnArc@turnTarget))+1
	line	437
;robot.c: 437: break;
	goto	l12021
	line	439
;robot.c: 439: case 7:
	
l6297:	
	line	440
	
l11977:	
;robot.c: 440: RobotDrive((speed), -400-100);
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
	line	441
	
l11979:	
;robot.c: 441: turnTarget = -185;
	movlw	low(-185)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-185)
	movwf	((robot_turnArc@turnTarget))+1
	line	442
;robot.c: 442: break;
	goto	l12021
	line	443
;robot.c: 443: case 10:
	
l6298:	
	line	444
	
l11981:	
;robot.c: 444: RobotDrive((speed), -400 );
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
	line	445
	
l11983:	
;robot.c: 445: turnTarget = -90;
	movlw	low(-90)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-90)
	movwf	((robot_turnArc@turnTarget))+1
	line	446
;robot.c: 446: break;
	goto	l12021
	line	447
;robot.c: 447: case 11:
	
l6299:	
	line	448
	
l11985:	
;robot.c: 448: RobotDrive((speed), -400 - 100);
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
	line	449
	
l11987:	
;robot.c: 449: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnArc@turnTarget))+1
	line	450
;robot.c: 450: break;
	goto	l12021
	line	451
;robot.c: 451: case 12:
	
l6300:	
	line	452
	
l11989:	
;robot.c: 452: RobotDrive((speed), -400 - 50);
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
	line	453
	
l11991:	
;robot.c: 453: turnTarget = -185;
	movlw	low(-185)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-185)
	movwf	((robot_turnArc@turnTarget))+1
	line	455
;robot.c: 455: break;
	goto	l12021
	line	456
;robot.c: 456: case 15:
	
l6301:	
	line	457
	
l11993:	
;robot.c: 457: RobotDrive((speed), -400 - 100);
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
	line	458
	
l11995:	
;robot.c: 458: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnArc@turnTarget))+1
	line	459
;robot.c: 459: break;
	goto	l12021
	line	460
;robot.c: 460: case 19:
	
l6302:	
	line	461
	
l11997:	
;robot.c: 461: robotMoveSpeed(600, 200);
	movlw	low(0258h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(0258h)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(0C8h)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(0C8h)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	462
	
l11999:	
;robot.c: 462: turnTarget = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robot_turnArc@turnTarget)
	clrf	(robot_turnArc@turnTarget+1)
	line	463
;robot.c: 463: break;
	goto	l12021
	line	464
;robot.c: 464: case 20:
	
l6303:	
	line	465
	
l12001:	
;robot.c: 465: RobotDrive((speed), -400 - 100);
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
	line	466
	
l12003:	
;robot.c: 466: turnTarget = -190;
	movlw	low(-190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-190)
	movwf	((robot_turnArc@turnTarget))+1
	line	467
;robot.c: 467: break;
	goto	l12021
	line	468
;robot.c: 468: default:
	
l6304:	
	line	469
	
l12005:	
;robot.c: 469: if (followDir == 1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,w
	xorlw	01h
	skipz
	goto	u5291
	goto	u5290
u5291:
	goto	l12011
u5290:
	line	471
	
l12007:	
;robot.c: 470: {
;robot.c: 471: RobotDrive((speed), 400);
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
	line	472
	
l12009:	
;robot.c: 472: turnTarget = 75;
	movlw	low(04Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(04Bh)
	movwf	((robot_turnArc@turnTarget))+1
	goto	l12011
	line	473
	
l6305:	
	line	474
	
l12011:	
;robot.c: 473: }
;robot.c: 474: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5301
	goto	u5300
u5301:
	goto	l12021
u5300:
	line	476
	
l12013:	
;robot.c: 475: {
;robot.c: 476: RobotDrive((speed), -400);
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
	line	477
	
l12015:	
;robot.c: 477: turnTarget = -75;
	movlw	low(-75)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_turnArc@turnTarget)
	movlw	high(-75)
	movwf	((robot_turnArc@turnTarget))+1
	goto	l12021
	line	478
	
l6306:	
	line	480
;robot.c: 478: }
;robot.c: 480: break;
	goto	l12021
	line	481
	
l12017:	
;robot.c: 481: }
	goto	l12021
	line	432
	
l6294:	
	
l12019:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RobotPos)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 3 to 20
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
; direct_byte           65    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	3^0	; case 3
	skipnz
	goto	l11973
	xorlw	7^3	; case 7
	skipnz
	goto	l11977
	xorlw	10^7	; case 10
	skipnz
	goto	l11981
	xorlw	11^10	; case 11
	skipnz
	goto	l11985
	xorlw	12^11	; case 12
	skipnz
	goto	l11989
	xorlw	15^12	; case 15
	skipnz
	goto	l11993
	xorlw	19^15	; case 19
	skipnz
	goto	l11997
	xorlw	20^19	; case 20
	skipnz
	goto	l12001
	goto	l12005
	opt asmopt_on

	line	481
	
l6296:	
	line	482
	
l12021:	
;robot.c: 482: if (followDir == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_followDir)^080h,f
	skipz
	goto	u5311
	goto	u5310
u5311:
	goto	l12025
u5310:
	line	484
	
l12023:	
;robot.c: 483: {
;robot.c: 484: rotate(25,1);
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
	line	485
;robot.c: 485: }
	goto	l12069
	line	486
	
l6307:	
	line	488
	
l12025:	
;robot.c: 486: else
;robot.c: 487: {
;robot.c: 488: rotate(25,0);
	movlw	low(019h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(019h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	goto	l12069
	line	489
	
l6308:	
	line	491
;robot.c: 489: }
;robot.c: 491: while (abs(angleTurned) < abs(turnTarget))
	goto	l12069
	
l6310:	
	line	493
	
l12027:	
;robot.c: 492: {
;robot.c: 493: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	494
	
l12029:	
;robot.c: 494: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5320
	goto	l12035
u5320:
	line	496
	
l12031:	
;robot.c: 495: {
;robot.c: 496: RobotDrive(0, 0x7FFF);
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
	line	497
	
l12033:	
;robot.c: 497: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	498
;robot.c: 498: break;
	goto	l12071
	line	499
	
l6311:	
	line	500
	
l12035:	
;robot.c: 499: }
;robot.c: 500: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5330
	goto	l12041
u5330:
	line	502
	
l12037:	
;robot.c: 501: {
;robot.c: 502: RobotDrive(0, 0x7FFF);
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
	line	503
	
l12039:	
;robot.c: 503: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	504
;robot.c: 504: break;
	goto	l12071
	line	505
	
l6313:	
	line	506
	
l12041:	
;robot.c: 505: }
;robot.c: 506: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5340
	goto	l12045
u5340:
	line	509
	
l12043:	
;robot.c: 507: {
;robot.c: 509: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	510
;robot.c: 510: break;
	goto	l12071
	line	511
	
l6314:	
	line	512
	
l12045:	
;robot.c: 511: }
;robot.c: 512: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5351
	goto	u5350
u5351:
	goto	l12051
u5350:
	line	514
	
l12047:	
;robot.c: 513: {
;robot.c: 514: RobotDrive(0, 0x7FFF);
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
	line	515
	
l12049:	
;robot.c: 515: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	movf	(??_robot_turnArc+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	516
;robot.c: 516: break;
	goto	l12071
	line	517
	
l6315:	
	line	518
	
l12051:	
;robot.c: 517: }
;robot.c: 518: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1)
	movf	1+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1+1)
	line	519
	
l12053:	
;robot.c: 519: temp1 = temp1 << 8;
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
	line	520
	
l12055:	
;robot.c: 520: temp1 += AngleLowByte;
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
	line	521
	
l12057:	
;robot.c: 521: angleTurned += temp1;
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
	line	522
	
l12059:	
;robot.c: 522: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_turnArc+0)+0
	clrf	(??_robot_turnArc+0)+0+1
	movf	0+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1)
	movf	1+(??_robot_turnArc+0)+0,w
	movwf	(robot_turnArc@temp1+1)
	line	523
;robot.c: 523: temp1 = temp1 << 8;
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
	line	524
	
l12061:	
;robot.c: 524: temp1 += DistLowByte;
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
	line	525
	
l12063:	
;robot.c: 525: distTravelled += temp1;
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
	line	526
	
l12065:	
;robot.c: 526: TotalDistTravelled += temp1;
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
	line	528
	
l12067:	
;robot.c: 528: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l12069
	line	529
	
l6309:	
	line	491
	
l12069:	
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
	goto	u5365
	movf	(0+(?_abs)),w
	subwf	0+(??_robot_turnArc+0)+0,w
u5365:

	skipc
	goto	u5361
	goto	u5360
u5361:
	goto	l12027
u5360:
	goto	l12071
	
l6312:	
	line	530
	
l12071:	
;robot.c: 529: }
;robot.c: 530: Disp2 = ROBOTerror;
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
	line	531
	
l12073:	
;robot.c: 531: UpdateDisplay();
	fcall	_UpdateDisplay
	line	534
	
l6316:	
	return
	opt stack 0
GLOBAL	__end_of_robot_turnArc
	__end_of_robot_turnArc:
;; =============== function _robot_turnArc ends ============

	signat	_robot_turnArc,4216
	global	_Init_Follow_IR
psect	text1098,local,class=CODE,delta=2
global __ptext1098
__ptext1098:

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
psect	text1098
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	241
	global	__size_of_Init_Follow_IR
	__size_of_Init_Follow_IR	equ	__end_of_Init_Follow_IR-_Init_Follow_IR
	
_Init_Follow_IR:	
	opt	stack 1
; Regs used in _Init_Follow_IR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	242
	
l11887:	
;Main.c: 242: calibrateIR();
	fcall	_calibrateIR
	line	243
	
l11889:	
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
u5757:
	decfsz	((??_Init_Follow_IR+0)+0),f
	goto	u5757
	decfsz	((??_Init_Follow_IR+0)+0+1),f
	goto	u5757
	decfsz	((??_Init_Follow_IR+0)+0+2),f
	goto	u5757
	clrwdt
opt asmopt_on

	line	244
	
l11891:	
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
	
l2312:	
	return
	opt stack 0
GLOBAL	__end_of_Init_Follow_IR
	__end_of_Init_Follow_IR:
;; =============== function _Init_Follow_IR ends ============

	signat	_Init_Follow_IR,88
	global	_robotMoveSpeed
psect	text1099,local,class=CODE,delta=2
global __ptext1099
__ptext1099:

;; *************** function _robotMoveSpeed *****************
;; Defined at:
;;		line 539 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  distance        2   55[BANK0 ] int 
;;  speed           2   57[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   62[BANK0 ] int 
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
;;		_robot_read
;;		_RobotDrive
;;		_UpdateDisplay
;;		_abs
;; This function is called by:
;;		_FindVictim
;;		_robotFollow
;;		_robot_turnArc
;; This function uses a non-reentrant model
;;
psect	text1099
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	539
	global	__size_of_robotMoveSpeed
	__size_of_robotMoveSpeed	equ	__end_of_robotMoveSpeed-_robotMoveSpeed
	
_robotMoveSpeed:	
	opt	stack 0
; Regs used in _robotMoveSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	540
	
l11841:	
;robot.c: 540: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	541
	
l11843:	
;robot.c: 541: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	543
	
l11845:	
;robot.c: 542: int temp1;
;robot.c: 543: RobotDrive(speed, 0x7FFF);
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
	line	546
;robot.c: 546: while (abs(distTravelled) < abs(distance))
	goto	l11879
	
l6320:	
	line	548
	
l11847:	
;robot.c: 547: {
;robot.c: 548: robot_read(0);
	movlw	(0)
	fcall	_robot_read
	line	549
	
l11849:	
;robot.c: 549: if (BumpSensors)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,w	;volatile
	skipz
	goto	u5130
	goto	l11853
u5130:
	line	551
	
l11851:	
;robot.c: 550: {
;robot.c: 551: ROBOTerror = 1;
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	552
;robot.c: 552: break;
	goto	l11881
	line	553
	
l6321:	
	line	554
	
l11853:	
;robot.c: 553: }
;robot.c: 554: if (VwallSensor)
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5140
	goto	l11857
u5140:
	line	556
	
l11855:	
;robot.c: 555: {
;robot.c: 556: ROBOTerror = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	557
;robot.c: 557: break;
	goto	l11881
	line	558
	
l6323:	
	line	559
	
l11857:	
;robot.c: 558: }
;robot.c: 559: if (CliffSensors)
	movf	(_CliffSensors)^080h,w	;volatile
	skipz
	goto	u5150
	goto	l11861
u5150:
	line	561
	
l11859:	
;robot.c: 560: {
;robot.c: 561: ROBOTerror = 3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	562
;robot.c: 562: break;
	goto	l11881
	line	563
	
l6324:	
	line	564
	
l11861:	
;robot.c: 563: }
;robot.c: 564: if (VictimSensor != 255)
	movf	(_VictimSensor)^080h,w	;volatile
	xorlw	0FFh
	skipnz
	goto	u5161
	goto	u5160
u5161:
	goto	l11865
u5160:
	line	566
	
l11863:	
;robot.c: 565: {
;robot.c: 566: ROBOTerror = 4;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	567
;robot.c: 567: break;
	goto	l11881
	line	568
	
l6325:	
	line	569
	
l11865:	
;robot.c: 568: }
;robot.c: 569: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	clrf	(??_robotMoveSpeed+0)+0+1
	movf	0+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1)
	movf	1+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1+1)
	line	570
	
l11867:	
;robot.c: 570: temp1 = temp1 << 8;
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
	line	571
	
l11869:	
;robot.c: 571: temp1 += DistLowByte;
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
	line	572
	
l11871:	
;robot.c: 572: distTravelled += temp1;
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
	line	573
	
l11873:	
;robot.c: 573: TotalDistTravelled += temp1;
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
	line	574
	
l11875:	
;robot.c: 574: Disp2 = distTravelled;
	movf	(_distTravelled+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_distTravelled)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	575
	
l11877:	
;robot.c: 575: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11879
	line	576
	
l6319:	
	line	546
	
l11879:	
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
	goto	u5175
	movf	(0+(?_abs)),w
	subwf	0+(??_robotMoveSpeed+0)+0,w
u5175:

	skipc
	goto	u5171
	goto	u5170
u5171:
	goto	l11847
u5170:
	goto	l11881
	
l6322:	
	line	577
	
l11881:	
;robot.c: 576: }
;robot.c: 577: Disp2 = ROBOTerror;
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
	line	578
	
l11883:	
;robot.c: 578: UpdateDisplay();
	fcall	_UpdateDisplay
	line	579
	
l11885:	
;robot.c: 579: RobotDrive(0, 0x7FFF);
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
	line	581
	
l6326:	
	return
	opt stack 0
GLOBAL	__end_of_robotMoveSpeed
	__end_of_robotMoveSpeed:
;; =============== function _robotMoveSpeed ends ============

	signat	_robotMoveSpeed,8312
	global	_robotTurnSpeed
psect	text1100,local,class=CODE,delta=2
global __ptext1100
__ptext1100:

;; *************** function _robotTurnSpeed *****************
;; Defined at:
;;		line 588 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  angle           2   55[BANK0 ] int 
;;  speed           2   57[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   62[BANK0 ] int 
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
;;		_robot_read
;;		_robotTurn
;;		_UpdateDisplay
;;		_abs
;; This function is called by:
;;		_GoHome
;;		_FindVictim
;;		_robotFollow
;;		_robot_turnInPlace
;; This function uses a non-reentrant model
;;
psect	text1100
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	588
	global	__size_of_robotTurnSpeed
	__size_of_robotTurnSpeed	equ	__end_of_robotTurnSpeed-_robotTurnSpeed
	
_robotTurnSpeed:	
	opt	stack 0
; Regs used in _robotTurnSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	589
	
l11809:	
;robot.c: 589: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	590
	
l11811:	
;robot.c: 590: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	591
	
l11813:	
;robot.c: 591: int temp1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robotTurnSpeed@temp1)
	clrf	(robotTurnSpeed@temp1+1)
	line	593
	
l11815:	
;robot.c: 593: robotTurn(angle);
	movf	(robotTurnSpeed@angle+1),w
	clrf	(?_robotTurn+1)
	addwf	(?_robotTurn+1)
	movf	(robotTurnSpeed@angle),w
	clrf	(?_robotTurn)
	addwf	(?_robotTurn)

	fcall	_robotTurn
	line	596
;robot.c: 596: while (abs(angleTurned) < abs(angle))
	goto	l11837
	
l6330:	
	line	598
	
l11817:	
;robot.c: 597: {
;robot.c: 598: robot_read(1);
	movlw	(01h)
	fcall	_robot_read
	line	599
	
l11819:	
;robot.c: 599: if (BumpSensors || VwallSensor)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_BumpSensors)^080h,f
	skipz	;volatile
	goto	u5101
	goto	u5100
u5101:
	goto	l11823
u5100:
	
l11821:	
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u5110
	goto	l11825
u5110:
	goto	l11823
	
l6333:	
	line	601
	
l11823:	
;robot.c: 600: {
;robot.c: 601: ROBOTerror = 1;
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	602
;robot.c: 602: break;
	goto	l11839
	line	603
	
l6331:	
	line	604
	
l11825:	
;robot.c: 603: }
;robot.c: 604: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotTurnSpeed+0)+0
	clrf	(??_robotTurnSpeed+0)+0+1
	movf	0+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1)
	movf	1+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1+1)
	line	605
	
l11827:	
;robot.c: 605: temp1 = temp1 << 8;
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
	line	606
	
l11829:	
;robot.c: 606: temp1 += AngleLowByte;
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
	line	607
	
l11831:	
;robot.c: 607: angleTurned += temp1;
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
	line	608
	
l11833:	
;robot.c: 608: Disp2 = angleTurned;
	movf	(_angleTurned+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_angleTurned)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	609
	
l11835:	
;robot.c: 609: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11837
	line	610
	
l6329:	
	line	596
	
l11837:	
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
	goto	u5125
	movf	(0+(?_abs)),w
	subwf	0+(??_robotTurnSpeed+0)+0,w
u5125:

	skipc
	goto	u5121
	goto	u5120
u5121:
	goto	l11817
u5120:
	goto	l11839
	
l6334:	
	line	612
	
l11839:	
;robot.c: 610: }
;robot.c: 612: robotTurn(0);
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurn)
	movlw	high(0)
	movwf	((?_robotTurn))+1
	fcall	_robotTurn
	line	613
	
l6335:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurnSpeed
	__end_of_robotTurnSpeed:
;; =============== function _robotTurnSpeed ends ============

	signat	_robotTurnSpeed,8312
	global	_ChargeMode
psect	text1101,local,class=CODE,delta=2
global __ptext1101
__ptext1101:

;; *************** function _ChargeMode *****************
;; Defined at:
;;		line 449 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text1101
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	449
	global	__size_of_ChargeMode
	__size_of_ChargeMode	equ	__end_of_ChargeMode-_ChargeMode
	
_ChargeMode:	
	opt	stack 2
; Regs used in _ChargeMode: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	451
	
l11787:	
;Main.c: 451: currentMenu = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ChargeMode+0)+0
	movf	(??_ChargeMode+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_currentMenu)^080h	;volatile
	line	452
	
l11789:	
;Main.c: 452: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	goto	l11791
	line	454
;Main.c: 454: while (1)
	
l2376:	
	line	456
	
l11791:	
;Main.c: 455: {
;Main.c: 456: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5091
	goto	u5090
u5091:
	goto	l11807
u5090:
	line	458
	
l11793:	
;Main.c: 457: {
;Main.c: 458: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	459
	
l11795:	
;Main.c: 459: RobotBattRead();
	fcall	_RobotBattRead
	line	460
;Main.c: 460: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11807
	line	461
	
l2377:	
	line	462
;Main.c: 461: }
;Main.c: 462: switch (buttonPressed)
	goto	l11807
	line	464
;Main.c: 463: {
;Main.c: 464: case 1:
	
l2379:	
	line	465
;Main.c: 465: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	466
;Main.c: 466: break;
	goto	l11791
	line	467
;Main.c: 467: case 2:
	
l2381:	
	line	468
;Main.c: 468: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	469
;Main.c: 469: break;
	goto	l11791
	line	470
;Main.c: 470: case 3:
	
l2382:	
	line	471
;Main.c: 471: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	472
;Main.c: 472: break;
	goto	l11791
	line	473
;Main.c: 473: case 4:
	
l2383:	
	line	474
;Main.c: 474: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	475
;Main.c: 475: break;
	goto	l11791
	line	476
;Main.c: 476: case 5:
	
l2384:	
	line	477
	
l11797:	
;Main.c: 477: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	478
	
l11799:	
;Main.c: 478: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	479
	
l11801:	
;Main.c: 479: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	goto	l2385
	line	480
	
l11803:	
;Main.c: 480: return;
	goto	l2385
	line	481
;Main.c: 481: default:
	
l2386:	
	line	482
;Main.c: 482: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	483
;Main.c: 483: break;
	goto	l11791
	line	484
	
l11805:	
;Main.c: 484: }
	goto	l11791
	line	462
	
l2378:	
	
l11807:	
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
	goto	l2379
	xorlw	2^1	; case 2
	skipnz
	goto	l2381
	xorlw	3^2	; case 3
	skipnz
	goto	l2382
	xorlw	4^3	; case 4
	skipnz
	goto	l2383
	xorlw	5^4	; case 5
	skipnz
	goto	l11797
	goto	l2386
	opt asmopt_on

	line	484
	
l2380:	
	goto	l11791
	line	485
	
l2387:	
	line	454
	goto	l11791
	
l2388:	
	line	486
	
l2385:	
	return
	opt stack 0
GLOBAL	__end_of_ChargeMode
	__end_of_ChargeMode:
;; =============== function _ChargeMode ends ============

	signat	_ChargeMode,88
	global	_calibrateIR
psect	text1102,local,class=CODE,delta=2
global __ptext1102
__ptext1102:

;; *************** function _calibrateIR *****************
;; Defined at:
;;		line 407 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text1102
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	407
	global	__size_of_calibrateIR
	__size_of_calibrateIR	equ	__end_of_calibrateIR-_calibrateIR
	
_calibrateIR:	
	opt	stack 1
; Regs used in _calibrateIR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	408
	
l11755:	
;Main.c: 408: currentMenu = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h	;volatile
	bsf	status,0
	rlf	(_currentMenu)^080h,f	;volatile
	line	409
	
l11757:	
;Main.c: 409: rotate(8, 0);
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(08h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	410
	
l11759:	
;Main.c: 410: rotate(8, 1);
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
	goto	l11761
	line	411
;Main.c: 411: while (1)
	
l2361:	
	line	413
	
l11761:	
;Main.c: 412: {
;Main.c: 413: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5081
	goto	u5080
u5081:
	goto	l11785
u5080:
	line	415
	
l11763:	
;Main.c: 414: {
;Main.c: 415: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	416
	
l11765:	
;Main.c: 416: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11785
	line	417
	
l2362:	
	line	418
;Main.c: 417: }
;Main.c: 418: switch (buttonPressed)
	goto	l11785
	line	420
;Main.c: 419: {
;Main.c: 420: case 1:
	
l2364:	
	line	421
;Main.c: 421: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	422
;Main.c: 422: break;
	goto	l11761
	line	423
;Main.c: 423: case 2:
	
l2366:	
	line	424
;Main.c: 424: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	425
;Main.c: 425: break;
	goto	l11761
	line	426
;Main.c: 426: case 3:
	
l2367:	
	line	427
	
l11767:	
;Main.c: 427: rotate(1, 1);
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
	line	428
	
l11769:	
;Main.c: 428: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	429
;Main.c: 429: break;
	goto	l11761
	line	430
;Main.c: 430: case 4:
	
l2368:	
	line	431
	
l11771:	
;Main.c: 431: rotate(1, 0);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(01h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	432
	
l11773:	
;Main.c: 432: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	433
;Main.c: 433: break;
	goto	l11761
	line	434
;Main.c: 434: case 5:
	
l2369:	
	line	436
	
l11775:	
;Main.c: 436: totalSteps = 0;
	clrf	(_totalSteps)^080h
	clrf	(_totalSteps+1)^080h
	line	437
	
l11777:	
;Main.c: 437: buttonPressed = 0;
	clrf	(_buttonPressed)^080h	;volatile
	line	438
	
l11779:	
;Main.c: 438: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	goto	l2370
	line	439
	
l11781:	
;Main.c: 439: return;
	goto	l2370
	line	440
;Main.c: 440: default:
	
l2371:	
	line	441
;Main.c: 441: break;
	goto	l11761
	line	442
	
l11783:	
;Main.c: 442: }
	goto	l11761
	line	418
	
l2363:	
	
l11785:	
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
	goto	l2364
	xorlw	2^1	; case 2
	skipnz
	goto	l2366
	xorlw	3^2	; case 3
	skipnz
	goto	l11767
	xorlw	4^3	; case 4
	skipnz
	goto	l11771
	xorlw	5^4	; case 5
	skipnz
	goto	l11775
	goto	l11761
	opt asmopt_on

	line	442
	
l2365:	
	goto	l11761
	line	443
	
l2372:	
	line	411
	goto	l11761
	
l2373:	
	line	444
	
l2370:	
	return
	opt stack 0
GLOBAL	__end_of_calibrateIR
	__end_of_calibrateIR:
;; =============== function _calibrateIR ends ============

	signat	_calibrateIR,88
	global	_UpdateDisplay
psect	text1103,local,class=CODE,delta=2
global __ptext1103
__ptext1103:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 135 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tempDist        2   53[BANK0 ] int 
;;  LCDOutput      16   37[BANK0 ] unsigned char [16]
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
psect	text1103
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	135
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
	opt	stack 2
; Regs used in _UpdateDisplay: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	136
	
l11673:	
;HMI.c: 136: char LCDOutput[16] = "";
	movlw	(UpdateDisplay@LCDOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1260)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	fsr0,w
	movwf	((??_UpdateDisplay+0)+0+1)
	movlw	16
	movwf	((??_UpdateDisplay+0)+0+2)
u5060:
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
	goto	u5060
	line	137
;HMI.c: 137: switch (currentMenu)
	goto	l11749
	line	139
;HMI.c: 138: {
;HMI.c: 139: case 0:
	
l4663:	
	line	140
	
l11675:	
;HMI.c: 140: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	141
	
l11677:	
;HMI.c: 141: sprintf(LCDOutput,"IR:%3dcm D:%3d",Disp1, Disp2);
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
	line	142
	
l11679:	
;HMI.c: 142: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	143
;HMI.c: 143: lcd_write_string(LCDOutput);
	movlw	(UpdateDisplay@LCDOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	144
	
l11681:	
;HMI.c: 144: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	145
	
l11683:	
;HMI.c: 145: if (pos > 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5075
	movlw	low(01h)
	subwf	(_pos)^080h,w
u5075:

	skipc
	goto	u5071
	goto	u5070
u5071:
	goto	l11687
u5070:
	line	146
	
l11685:	
;HMI.c: 146: lcd_write_string(shortMenuStrings[pos - 1]);
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
	goto	l11689
	line	147
	
l4664:	
	line	148
	
l11687:	
;HMI.c: 147: else
;HMI.c: 148: lcd_write_string(shortMenuStrings[pos + 6 - 1]);
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
	goto	l11689
	
l4665:	
	line	149
	
l11689:	
;HMI.c: 149: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	150
	
l11691:	
;HMI.c: 150: lcd_write_string(menuStrings[pos]);
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
	line	151
;HMI.c: 151: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	152
	
l11693:	
;HMI.c: 152: lcd_write_string(shortMenuStrings[(pos + 1) % 6]);
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
	line	153
;HMI.c: 153: break;
	goto	l4679
	line	154
;HMI.c: 154: case 1:
	
l4667:	
	line	155
	
l11695:	
;HMI.c: 155: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	156
;HMI.c: 156: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	157
	
l11697:	
;HMI.c: 157: lcd_write_string("Zero Step_Motor");
	movlw	low((STR_14-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	158
	
l11699:	
;HMI.c: 158: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	159
;HMI.c: 159: lcd_write_string("<<<");
	movlw	low((STR_15-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	160
	
l11701:	
;HMI.c: 160: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	161
	
l11703:	
;HMI.c: 161: lcd_write_string("CONFIRM");
	movlw	low((STR_16-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	162
;HMI.c: 162: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	163
	
l11705:	
;HMI.c: 163: lcd_write_string(">>>");
	movlw	low((STR_17-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	164
;HMI.c: 164: break;
	goto	l4679
	line	165
;HMI.c: 165: case 2:
	
l4668:	
	line	166
	
l11707:	
;HMI.c: 166: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	167
;HMI.c: 167: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	168
	
l11709:	
;HMI.c: 168: lcd_write_string(" Charging Mode ");
	movlw	low((STR_18-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	169
	
l11711:	
;HMI.c: 169: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	170
;HMI.c: 170: sprintf(LCDOutput,"%dmA", BattCharge);
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
	line	171
;HMI.c: 171: lcd_write_string(LCDOutput);
	movlw	(UpdateDisplay@LCDOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	172
	
l11713:	
;HMI.c: 172: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	173
;HMI.c: 173: switch(BattState)
	goto	l11729
	line	175
;HMI.c: 174: {
;HMI.c: 175: case 0:
	
l4670:	
	line	176
	
l11715:	
;HMI.c: 176: lcd_write_string("NC");
	movlw	low((STR_20-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	177
;HMI.c: 177: break;
	goto	l11731
	line	178
;HMI.c: 178: case 1:
	
l4672:	
	line	179
	
l11717:	
;HMI.c: 179: lcd_write_string("RC");
	movlw	low((STR_21-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	180
;HMI.c: 180: break;
	goto	l11731
	line	181
;HMI.c: 181: case 2:
	
l4673:	
	line	182
	
l11719:	
;HMI.c: 182: lcd_write_string("FC");
	movlw	low((STR_22-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	183
;HMI.c: 183: break;
	goto	l11731
	line	184
;HMI.c: 184: case 3:
	
l4674:	
	line	185
	
l11721:	
;HMI.c: 185: lcd_write_string("TC");
	movlw	low((STR_23-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	186
;HMI.c: 186: break;
	goto	l11731
	line	187
;HMI.c: 187: case 4:
	
l4675:	
	line	188
	
l11723:	
;HMI.c: 188: lcd_write_string("Wa");
	movlw	low((STR_24-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	189
;HMI.c: 189: break;
	goto	l11731
	line	190
;HMI.c: 190: case 5:
	
l4676:	
	line	191
	
l11725:	
;HMI.c: 191: lcd_write_string("FC");
	movlw	low((STR_25-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	192
;HMI.c: 192: break;
	goto	l11731
	line	193
	
l11727:	
;HMI.c: 193: }
	goto	l11731
	line	173
	
l4669:	
	
l11729:	
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
	goto	l12473
	goto	l11731
	opt asmopt_on
	
l12473:	
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
	goto	l11715
	xorlw	1^0	; case 1
	skipnz
	goto	l11717
	xorlw	2^1	; case 2
	skipnz
	goto	l11719
	xorlw	3^2	; case 3
	skipnz
	goto	l11721
	xorlw	4^3	; case 4
	skipnz
	goto	l11723
	xorlw	5^4	; case 5
	skipnz
	goto	l11725
	goto	l11731
	opt asmopt_on

	line	193
	
l4671:	
	line	195
	
l11731:	
;HMI.c: 195: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	196
	
l11733:	
;HMI.c: 196: lcd_write_string("  EXIT  ");
	movlw	low((STR_26-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	197
;HMI.c: 197: break;
	goto	l4679
	line	198
;HMI.c: 198: case 3:
	
l4677:	
	line	199
	
l11735:	
;HMI.c: 199: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	200
	
l11737:	
;HMI.c: 200: sprintf(LCDOutput,"IR:%3dcm CP:%3d",adcVal, RobotPos);
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
	line	201
	
l11739:	
;HMI.c: 201: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	202
;HMI.c: 202: lcd_write_string(LCDOutput);
	movlw	(UpdateDisplay@LCDOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	203
	
l11741:	
;HMI.c: 203: int tempDist = (TotalDistTravelled/ 10);
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

	line	205
	
l11743:	
;HMI.c: 205: sprintf(LCDOutput,"D:%4dcm AT:%3d",tempDist, angleTurned);
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
	line	206
;HMI.c: 206: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	207
	
l11745:	
;HMI.c: 207: lcd_write_string(LCDOutput);
	movlw	(UpdateDisplay@LCDOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	208
;HMI.c: 208: break;
	goto	l4679
	line	209
;HMI.c: 209: default:
	
l4678:	
	line	210
;HMI.c: 210: break;
	goto	l4679
	line	211
	
l11747:	
;HMI.c: 211: }
	goto	l4679
	line	137
	
l4662:	
	
l11749:	
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
	goto	l11675
	xorlw	1^0	; case 1
	skipnz
	goto	l11695
	xorlw	2^1	; case 2
	skipnz
	goto	l11707
	xorlw	3^2	; case 3
	skipnz
	goto	l11735
	goto	l4679
	opt asmopt_on

	line	211
	
l4666:	
	line	212
	
l4679:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,88
	global	_readAvgDistance
psect	text1104,local,class=CODE,delta=2
global __ptext1104
__ptext1104:

;; *************** function _readAvgDistance *****************
;; Defined at:
;;		line 28 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   20[BANK0 ] int 
;;  tempIR          2   18[BANK0 ] unsigned int 
;;  j               2   16[BANK0 ] int 
;;  fullval         2   14[BANK0 ] unsigned int 
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
;; This function is called by:
;;		_main
;;		_GoHome
;;		_FindVictim
;;		_robotFollow
;;		_robot_turnArc
;; This function uses a non-reentrant model
;;
psect	text1104
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	28
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	29
	
l11655:	
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
	
l11657:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5035
	movlw	low(08h)
	subwf	(readAvgDistance@i),w
u5035:

	skipc
	goto	u5031
	goto	u5030
u5031:
	goto	l11661
u5030:
	goto	l11669
	
l11659:	
	goto	l11669
	line	33
	
l3123:	
	line	34
	
l11661:	
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
	
l11663:	
;infrared.c: 35: if (tempIR <= 1000)
	movlw	high(03E9h)
	subwf	(readAvgDistance@tempIR+1),w
	movlw	low(03E9h)
	skipnz
	subwf	(readAvgDistance@tempIR),w
	skipnc
	goto	u5041
	goto	u5040
u5041:
	goto	l3125
u5040:
	line	37
	
l11665:	
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
	
l3125:	
	line	32
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
l11667:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5055
	movlw	low(08h)
	subwf	(readAvgDistance@i),w
u5055:

	skipc
	goto	u5051
	goto	u5050
u5051:
	goto	l11661
u5050:
	goto	l11669
	
l3124:	
	line	41
	
l11669:	
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

	line	43
	
l11671:	
;infrared.c: 43: Disp1 = adcVal;
	movf	(_adcVal+1)^080h,w	;volatile
	clrf	(_Disp1+1)^080h	;volatile
	addwf	(_Disp1+1)^080h	;volatile
	movf	(_adcVal)^080h,w	;volatile
	clrf	(_Disp1)^080h	;volatile
	addwf	(_Disp1)^080h	;volatile

	line	44
	
l3126:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,88
	global	_init
psect	text1105,local,class=CODE,delta=2
global __ptext1105
__ptext1105:

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
psect	text1105
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	139
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 3
; Regs used in _init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	140
	
l11629:	
;Main.c: 140: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	142
	
l11631:	
;Main.c: 142: TRISB = 0b11111100;
	movlw	(0FCh)
	movwf	(134)^080h	;volatile
	line	143
	
l11633:	
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
	
l11635:	
;Main.c: 146: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	147
	
l11637:	
;Main.c: 147: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	150
	
l11639:	
;Main.c: 150: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	153
	
l11641:	
;Main.c: 153: ser_init();
	fcall	_ser_init
	line	154
	
l11643:	
;Main.c: 154: init_adc();
	fcall	_init_adc
	line	155
	
l11645:	
;Main.c: 155: lcd_init();
	fcall	_lcd_init
	line	156
	
l11647:	
;Main.c: 156: robo_init();
	fcall	_robo_init
	line	160
	
l11649:	
;Main.c: 160: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	162
	
l11651:	
;Main.c: 162: PEIE=1;
	bsf	(94/8),(94)&7
	line	164
	
l11653:	
;Main.c: 164: (GIE = 1);
	bsf	(95/8),(95)&7
	line	165
	
l2291:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_readDistance
psect	text1106,local,class=CODE,delta=2
global __ptext1106
__ptext1106:

;; *************** function _readDistance *****************
;; Defined at:
;;		line 51 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
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
psect	text1106
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	51
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	54
	
l11623:	
;infrared.c: 52: unsigned int readVal;
;infrared.c: 54: readVal = adc_read_channel(0);
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
	line	56
	
l11625:	
;infrared.c: 56: return readVal;
	movf	(readDistance@readVal+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@readVal),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	l3129
	
l11627:	
	line	57
	
l3129:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_RobotBattRead
psect	text1107,local,class=CODE,delta=2
global __ptext1107
__ptext1107:

;; *************** function _RobotBattRead *****************
;; Defined at:
;;		line 616 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1107
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	616
	global	__size_of_RobotBattRead
	__size_of_RobotBattRead	equ	__end_of_RobotBattRead-_RobotBattRead
	
_RobotBattRead:	
	opt	stack 2
; Regs used in _RobotBattRead: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	617
	
l11595:	
;robot.c: 617: int temp1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(RobotBattRead@temp1)
	clrf	(RobotBattRead@temp1+1)
	line	618
	
l11597:	
;robot.c: 618: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	619
	
l11599:	
;robot.c: 619: ser_putch(25);
	movlw	(019h)
	fcall	_ser_putch
	line	620
	
l11601:	
;robot.c: 620: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_RobotBattRead+0)+0+1),f
	movlw	118
movwf	((??_RobotBattRead+0)+0),f
u5767:
	decfsz	((??_RobotBattRead+0)+0),f
	goto	u5767
	decfsz	((??_RobotBattRead+0)+0+1),f
	goto	u5767
	clrwdt
opt asmopt_on

	line	621
	
l11603:	
;robot.c: 621: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	movf	(??_RobotBattRead+0)+0,w
	movwf	(_DistHighByte)	;volatile
	line	622
	
l11605:	
;robot.c: 622: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	movf	(??_RobotBattRead+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	623
	
l11607:	
;robot.c: 623: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	624
	
l11609:	
;robot.c: 624: ser_putch(21);
	movlw	(015h)
	fcall	_ser_putch
	line	625
	
l11611:	
;robot.c: 625: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_RobotBattRead+0)+0+1),f
	movlw	118
movwf	((??_RobotBattRead+0)+0),f
u5777:
	decfsz	((??_RobotBattRead+0)+0),f
	goto	u5777
	decfsz	((??_RobotBattRead+0)+0+1),f
	goto	u5777
	clrwdt
opt asmopt_on

	line	626
	
l11613:	
;robot.c: 626: BattState = ser_getch();
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
	line	629
	
l11615:	
;robot.c: 629: temp1 = DistHighByte;
	movf	(_DistHighByte),w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_RobotBattRead+0)+0
	clrf	(??_RobotBattRead+0)+0+1
	movf	0+(??_RobotBattRead+0)+0,w
	movwf	(RobotBattRead@temp1)
	movf	1+(??_RobotBattRead+0)+0,w
	movwf	(RobotBattRead@temp1+1)
	line	630
	
l11617:	
;robot.c: 630: temp1 = temp1 << 8;
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
	line	631
	
l11619:	
;robot.c: 631: temp1 += DistLowByte;
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
	line	632
	
l11621:	
;robot.c: 632: BattCharge = temp1;
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

	line	633
	
l6338:	
	return
	opt stack 0
GLOBAL	__end_of_RobotBattRead
	__end_of_RobotBattRead:
;; =============== function _RobotBattRead ends ============

	signat	_RobotBattRead,88
	global	_robot_read
psect	text1108,local,class=CODE,delta=2
global __ptext1108
__ptext1108:

;; *************** function _robot_read *****************
;; Defined at:
;;		line 55 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1108
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	55
	global	__size_of_robot_read
	__size_of_robot_read	equ	__end_of_robot_read-_robot_read
	
_robot_read:	
	opt	stack 0
; Regs used in _robot_read: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;robot_read@readType stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_read@readType)
	line	56
	
l11581:	
;robot.c: 56: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	57
;robot.c: 57: ser_putch(10);
	movlw	(0Ah)
	fcall	_ser_putch
	line	59
;robot.c: 59: CliffSensors = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_CliffSensors)^080h	;volatile
	line	61
;robot.c: 61: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	62
;robot.c: 62: ser_putch(11);
	movlw	(0Bh)
	fcall	_ser_putch
	line	64
;robot.c: 64: CliffSensors += ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_CliffSensors)^080h,f	;volatile
	line	68
;robot.c: 68: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	69
;robot.c: 69: ser_putch(7);
	movlw	(07h)
	fcall	_ser_putch
	line	71
;robot.c: 71: BumpSensors = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_BumpSensors)^080h	;volatile
	line	73
;robot.c: 73: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	74
;robot.c: 74: ser_putch(13);
	movlw	(0Dh)
	fcall	_ser_putch
	line	76
;robot.c: 76: VwallSensor = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_VwallSensor)^080h	;volatile
	line	78
;robot.c: 78: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	79
;robot.c: 79: ser_putch(17);
	movlw	(011h)
	fcall	_ser_putch
	line	81
;robot.c: 81: VictimSensor = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_VictimSensor)^080h	;volatile
	line	85
	
l11583:	
;robot.c: 85: if (readType == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_read@readType),f
	skipz
	goto	u5001
	goto	u5000
u5001:
	goto	l11587
u5000:
	line	87
	
l11585:	
;robot.c: 86: {
;robot.c: 87: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	88
;robot.c: 88: ser_putch(19);
	movlw	(013h)
	fcall	_ser_putch
	line	90
;robot.c: 90: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	movwf	(_DistHighByte)	;volatile
	line	91
;robot.c: 91: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	92
;robot.c: 92: }
	goto	l6219
	line	93
	
l6214:	
	
l11587:	
;robot.c: 93: else if (readType == 1)
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_read@readType),w
	xorlw	01h
	skipz
	goto	u5011
	goto	u5010
u5011:
	goto	l11591
u5010:
	line	95
	
l11589:	
;robot.c: 94: {
;robot.c: 95: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	96
;robot.c: 96: ser_putch(20);
	movlw	(014h)
	fcall	_ser_putch
	line	98
;robot.c: 98: AngleHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleHighByte)^080h	;volatile
	line	99
;robot.c: 99: AngleLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleLowByte)^080h	;volatile
	line	100
;robot.c: 100: }
	goto	l6219
	line	101
	
l6216:	
	
l11591:	
;robot.c: 101: else if (readType == 2)
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_read@readType),w
	xorlw	02h
	skipz
	goto	u5021
	goto	u5020
u5021:
	goto	l6219
u5020:
	line	104
	
l11593:	
;robot.c: 102: {
;robot.c: 104: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	105
;robot.c: 105: ser_putch(19);
	movlw	(013h)
	fcall	_ser_putch
	line	107
;robot.c: 107: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	movwf	(_DistHighByte)	;volatile
	line	108
;robot.c: 108: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	109
;robot.c: 109: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	110
;robot.c: 110: ser_putch(20);
	movlw	(014h)
	fcall	_ser_putch
	line	112
;robot.c: 112: AngleHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleHighByte)^080h	;volatile
	line	113
;robot.c: 113: AngleLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleLowByte)^080h	;volatile
	goto	l6219
	line	114
	
l6218:	
	goto	l6219
	line	116
	
l6217:	
	goto	l6219
	
l6215:	
	
l6219:	
	return
	opt stack 0
GLOBAL	__end_of_robot_read
	__end_of_robot_read:
;; =============== function _robot_read ends ============

	signat	_robot_read,4216
	global	_lcd_init
psect	text1109,local,class=CODE,delta=2
global __ptext1109
__ptext1109:

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
psect	text1109
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 3
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l11561:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l11563:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l11565:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l11567:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l11569:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l11571:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l11573:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l11575:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l11577:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l11579:	
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
psect	text1110,local,class=CODE,delta=2
global __ptext1110
__ptext1110:

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
psect	text1110
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 2
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
l11553:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	l11559
	
l1409:	
	
l11555:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
l11557:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
	goto	l11559
	
l1408:	
	
l11559:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u4991
	goto	u4990
u4991:
	goto	l11555
u4990:
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
psect	text1111,local,class=CODE,delta=2
global __ptext1111
__ptext1111:

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
psect	text1111
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
	
l11549:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
l11551:	
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
psect	text1112,local,class=CODE,delta=2
global __ptext1112
__ptext1112:

;; *************** function _abs *****************
;; Defined at:
;;		line 638 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1112
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	638
	global	__size_of_abs
	__size_of_abs	equ	__end_of_abs-_abs
	
_abs:	
	opt	stack 2
; Regs used in _abs: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	639
	
l11545:	
;robot.c: 639: return (v * ((v > 0) - (v < 0)));
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
	goto	u4985
	movlw	low(01h)
	subwf	(abs@v),w
u4985:

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

	goto	l6341
	
l11547:	
	line	640
	
l6341:	
	return
	opt stack 0
GLOBAL	__end_of_abs
	__end_of_abs:
;; =============== function _abs ends ============

	signat	_abs,4218
	global	_robotTurn
psect	text1113,local,class=CODE,delta=2
global __ptext1113
__ptext1113:

;; *************** function _robotTurn *****************
;; Defined at:
;;		line 142 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1113
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	142
	global	__size_of_robotTurn
	__size_of_robotTurn	equ	__end_of_robotTurn-_robotTurn
	
_robotTurn:	
	opt	stack 1
; Regs used in _robotTurn: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	144
	
l11537:	
;robot.c: 144: if (angle > 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotTurn@angle+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4965
	movlw	low(01h)
	subwf	(robotTurn@angle),w
u4965:

	skipc
	goto	u4961
	goto	u4960
u4961:
	goto	l6225
u4960:
	line	146
	
l11539:	
;robot.c: 145: {
;robot.c: 146: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	148
;robot.c: 148: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	150
;robot.c: 150: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	152
;robot.c: 152: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	154
;robot.c: 154: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	155
;robot.c: 155: }
	goto	l6229
	line	156
	
l6225:	
;robot.c: 156: else if (angle < 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(robotTurn@angle+1),7
	goto	u4971
	goto	u4970
u4971:
	goto	l11543
u4970:
	line	158
	
l11541:	
;robot.c: 157: {
;robot.c: 158: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	160
;robot.c: 160: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	162
;robot.c: 162: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	164
;robot.c: 164: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	166
;robot.c: 166: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	167
;robot.c: 167: }
	goto	l6229
	line	168
	
l6227:	
	line	170
	
l11543:	
;robot.c: 168: else
;robot.c: 169: {
;robot.c: 170: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	172
;robot.c: 172: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	174
;robot.c: 174: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	176
;robot.c: 176: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	178
;robot.c: 178: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	goto	l6229
	line	179
	
l6228:	
	goto	l6229
	
l6226:	
	line	180
	
l6229:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurn
	__end_of_robotTurn:
;; =============== function _robotTurn ends ============

	signat	_robotTurn,4216
	global	_ser_getch
psect	text1114,local,class=CODE,delta=2
global __ptext1114
__ptext1114:

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
psect	text1114
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	55
	global	__size_of_ser_getch
	__size_of_ser_getch	equ	__end_of_ser_getch-_ser_getch
	
_ser_getch:	
	opt	stack 2
; Regs used in _ser_getch: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	58
	
l11521:	
;ser.c: 56: unsigned char c;
;ser.c: 58: while (ser_isrx()==0)
	goto	l11523
	
l7048:	
	line	59
;ser.c: 59: continue;
	goto	l11523
	
l7047:	
	line	58
	
l11523:	
	fcall	_ser_isrx
	btfss	status,0
	goto	u4951
	goto	u4950
u4951:
	goto	l11523
u4950:
	
l7049:	
	line	61
;ser.c: 61: GIE=0;
	bcf	(95/8),(95)&7
	line	62
	
l11525:	
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
	
l11527:	
;ser.c: 63: ++rxoptr;
	movlw	(01h)
	movwf	(??_ser_getch+0)+0
	movf	(??_ser_getch+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_rxoptr)^080h,f	;volatile
	line	64
	
l11529:	
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
	
l11531:	
;ser.c: 65: GIE=1;
	bsf	(95/8),(95)&7
	line	66
	
l11533:	
;ser.c: 66: return c;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(ser_getch@c),w
	goto	l7050
	
l11535:	
	line	67
	
l7050:	
	return
	opt stack 0
GLOBAL	__end_of_ser_getch
	__end_of_ser_getch:
;; =============== function _ser_getch ends ============

	signat	_ser_getch,89
	global	_sprintf
psect	text1115,local,class=CODE,delta=2
global __ptext1115
__ptext1115:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> UpdateDisplay@LCDOutput(16), 
;;  f               1   14[BANK0 ] PTR const unsigned char 
;;		 -> STR_28(15), STR_27(16), STR_19(5), STR_13(15), 
;; Auto vars:     Size  Location     Type
;;  sp              1   29[BANK0 ] PTR unsigned char 
;;		 -> UpdateDisplay@LCDOutput(16), 
;;  _val            4   25[BANK0 ] struct .
;;  width           2   30[BANK0 ] int 
;;  c               1   32[BANK0 ] char 
;;  flag            1   24[BANK0 ] unsigned char 
;;  prec            1   23[BANK0 ] char 
;;  ap              1   22[BANK0 ] PTR void [1]
;;		 -> ?_sprintf(2), 
;; Return value:  Size  Location     Type
;;                  2   14[BANK0 ] int 
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
psect	text1115
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
	
l11431:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	l11515
	
l7090:	
	line	542
	
l11433:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u4801
	goto	u4800
u4801:
	goto	l11439
u4800:
	line	545
	
l11435:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11437:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	l11515
	line	547
	
l7091:	
	line	550
	
l11439:	
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	line	552
	
l11441:	
	clrf	(sprintf@flag)
	line	601
	
l11443:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfss	status,0
	goto	u4811
	goto	u4810
u4811:
	goto	l11455
u4810:
	line	602
	
l11445:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l11447
	line	603
	
l7093:	
	line	604
	
l11447:	
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
	
l11449:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@f),f
	line	605
	
l11451:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfsc	status,0
	goto	u4821
	goto	u4820
u4821:
	goto	l11447
u4820:
	goto	l11455
	
l7094:	
	goto	l11455
	line	611
	
l7092:	
	line	638
	goto	l11455
	line	640
	
l7096:	
	line	641
	goto	l11517
	line	700
	
l7098:	
	goto	l11457
	line	701
	
l7099:	
	line	702
	goto	l11457
	line	805
	
l7101:	
	line	816
	goto	l11515
	line	825
	
l11453:	
	goto	l11457
	line	638
	
l7095:	
	
l11455:	
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
	goto	l11517
	xorlw	100^0	; case 100
	skipnz
	goto	l11457
	xorlw	105^100	; case 105
	skipnz
	goto	l11457
	goto	l11515
	opt asmopt_on

	line	825
	
l7100:	
	line	1254
	
l11457:	
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
	
l11459:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
l11461:	
	btfss	(sprintf@_val+1),7
	goto	u4831
	goto	u4830
u4831:
	goto	l11467
u4830:
	line	1257
	
l11463:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
l11465:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	l11467
	line	1259
	
l7102:	
	line	1300
	
l11467:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
l11469:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u4841
	goto	u4840
u4841:
	goto	l11473
u4840:
	goto	l11481
	
l11471:	
	goto	l11481
	line	1301
	
l7103:	
	
l11473:	
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
	goto	u4855
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u4855:
	skipnc
	goto	u4851
	goto	u4850
u4851:
	goto	l11477
u4850:
	goto	l11481
	line	1302
	
l11475:	
	goto	l11481
	
l7105:	
	line	1300
	
l11477:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
l11479:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u4861
	goto	u4860
u4861:
	goto	l11473
u4860:
	goto	l11481
	
l7104:	
	line	1340
	
l11481:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u4871
	goto	u4870
u4871:
	goto	l7106
u4870:
	
l11483:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u4881
	goto	u4880
u4881:
	goto	l7106
u4880:
	line	1341
	
l11485:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	
l7106:	
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
	goto	u4895
	movf	(sprintf@width),w
	subwf	0+(??_sprintf+0)+0,w
u4895:

	skipnc
	goto	u4891
	goto	u4890
u4891:
	goto	l11489
u4890:
	line	1377
	
l11487:	
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
	goto	l11491
	line	1378
	
l7107:	
	line	1379
	
l11489:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l11491
	
l7108:	
	line	1423
	
l11491:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u4901
	goto	u4900
u4901:
	goto	l11499
u4900:
	goto	l11493
	line	1424
	
l7110:	
	line	1425
	
l11493:	
	movlw	(020h)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11495:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	1426
	
l11497:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	movf	(((sprintf@width+1))),w
	iorwf	(((sprintf@width))),w
	skipz
	goto	u4911
	goto	u4910
u4911:
	goto	l11493
u4910:
	goto	l11499
	
l7111:	
	goto	l11499
	
l7109:	
	line	1433
	
l11499:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u4921
	goto	u4920
u4921:
	goto	l11505
u4920:
	line	1434
	
l11501:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11503:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l11505
	
l7112:	
	line	1467
	
l11505:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	l11513
	
l7114:	
	line	1484
	
l11507:	
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
	
l11509:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11511:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l11513
	line	1517
	
l7113:	
	line	1469
	
l11513:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u4931
	goto	u4930
u4931:
	goto	l11507
u4930:
	goto	l11515
	
l7115:	
	goto	l11515
	line	1525
	
l7089:	
	line	540
	
l11515:	
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
	goto	u4941
	goto	u4940
u4941:
	goto	l11433
u4940:
	goto	l11517
	
l7116:	
	goto	l11517
	line	1527
	
l7097:	
	line	1530
	
l11517:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l7117
	line	1532
	
l11519:	
	line	1533
;	Return value of _sprintf is never used
	
l7117:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_RobotDrive
psect	text1116,local,class=CODE,delta=2
global __ptext1116
__ptext1116:

;; *************** function _RobotDrive *****************
;; Defined at:
;;		line 121 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;;		_robot_turnInPlace
;;		_robot_turnArc
;;		_robotMoveSpeed
;; This function uses a non-reentrant model
;;
psect	text1116
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	121
	global	__size_of_RobotDrive
	__size_of_RobotDrive	equ	__end_of_RobotDrive-_RobotDrive
	
_RobotDrive:	
	opt	stack 1
; Regs used in _RobotDrive: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	123
	
l11415:	
;robot.c: 123: unsigned char speedlowByte = (unsigned char)(speed);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speed),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@speedlowByte)
	line	124
	
l11417:	
;robot.c: 124: unsigned char speedhighByte = (unsigned char)(speed >> 8);
	movf	(RobotDrive@speed+1),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@speedhighByte)
	line	125
	
l11419:	
;robot.c: 125: unsigned char radiuslowByte = (unsigned char)(radius);
	movf	(RobotDrive@radius),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@radiuslowByte)
	line	126
;robot.c: 126: unsigned char radiushighByte = (unsigned char)(radius >> 8);
	movf	(RobotDrive@radius+1),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@radiushighByte)
	line	128
	
l11421:	
;robot.c: 128: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	130
	
l11423:	
;robot.c: 130: ser_putch(speedhighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speedhighByte),w
	fcall	_ser_putch
	line	132
	
l11425:	
;robot.c: 132: ser_putch(speedlowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speedlowByte),w
	fcall	_ser_putch
	line	134
	
l11427:	
;robot.c: 134: ser_putch(radiushighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@radiushighByte),w
	fcall	_ser_putch
	line	136
	
l11429:	
;robot.c: 136: ser_putch(radiuslowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@radiuslowByte),w
	fcall	_ser_putch
	line	137
	
l6222:	
	return
	opt stack 0
GLOBAL	__end_of_RobotDrive
	__end_of_RobotDrive:
;; =============== function _RobotDrive ends ============

	signat	_RobotDrive,8312
	global	_rotate
psect	text1117,local,class=CODE,delta=2
global __ptext1117
__ptext1117:

;; *************** function _rotate *****************
;; Defined at:
;;		line 57 in file "E:\Aldnoah.Zero\Assignment3\steppermotor.c"
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
;;		_calibrateIR
;;		_robotFollow
;;		_robot_turnArc
;; This function uses a non-reentrant model
;;
psect	text1117
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	57
	global	__size_of_rotate
	__size_of_rotate	equ	__end_of_rotate-_rotate
	
_rotate:	
	opt	stack 2
; Regs used in _rotate: [wreg+status,2+status,0+pclath+cstack]
	line	59
	
l11383:	
;steppermotor.c: 59: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	60
	
l11385:	
;steppermotor.c: 60: if (direction == 0)
	movf	(rotate@direction),f
	skipz
	goto	u4771
	goto	u4770
u4771:
	goto	l11389
u4770:
	line	61
	
l11387:	
;steppermotor.c: 61: spi_transfer(0b00001011);
	movlw	(0Bh)
	fcall	_spi_transfer
	goto	l11391
	line	62
	
l3830:	
	line	63
	
l11389:	
;steppermotor.c: 62: else
;steppermotor.c: 63: spi_transfer(0b00001001);
	movlw	(09h)
	fcall	_spi_transfer
	goto	l11391
	
l3831:	
	line	64
	
l11391:	
;steppermotor.c: 64: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11393:	
	bcf	(57/8),(57)&7
	line	65
	
l11395:	
;steppermotor.c: 65: for (unsigned int i = 0; i < numsteps; i++)
	clrf	(rotate@i)
	clrf	(rotate@i+1)
	goto	l3832
	line	66
	
l3833:	
	line	67
;steppermotor.c: 66: {
;steppermotor.c: 67: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	nop
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	68
	
l11397:	
;steppermotor.c: 68: if (direction)
	movf	(rotate@direction),w
	skipz
	goto	u4780
	goto	l11401
u4780:
	line	69
	
l11399:	
;steppermotor.c: 69: totalSteps++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_totalSteps)^080h,f
	skipnc
	incf	(_totalSteps+1)^080h,f
	movlw	high(01h)
	addwf	(_totalSteps+1)^080h,f
	goto	l3835
	line	70
	
l3834:	
	line	71
	
l11401:	
;steppermotor.c: 70: else
;steppermotor.c: 71: totalSteps--;
	movlw	low(-1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_totalSteps)^080h,f
	skipnc
	incf	(_totalSteps+1)^080h,f
	movlw	high(-1)
	addwf	(_totalSteps+1)^080h,f
	
l3835:	
	line	72
;steppermotor.c: 72: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_rotate+0)+0+1),f
	movlw	101
movwf	((??_rotate+0)+0),f
u5787:
	decfsz	((??_rotate+0)+0),f
	goto	u5787
	decfsz	((??_rotate+0)+0+1),f
	goto	u5787
	nop2
opt asmopt_on

	line	65
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(rotate@i),f
	skipnc
	incf	(rotate@i+1),f
	movlw	high(01h)
	addwf	(rotate@i+1),f
	
l3832:	
	movf	(rotate@numsteps+1),w
	subwf	(rotate@i+1),w
	skipz
	goto	u4795
	movf	(rotate@numsteps),w
	subwf	(rotate@i),w
u4795:
	skipc
	goto	u4791
	goto	u4790
u4791:
	goto	l3833
u4790:
	
l3836:	
	line	74
;steppermotor.c: 73: }
;steppermotor.c: 74: RC0 = 1; RC1 = 1;;
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	75
	
l11403:	
;steppermotor.c: 75: spi_transfer(0b00000000);
	movlw	(0)
	fcall	_spi_transfer
	line	76
	
l11405:	
;steppermotor.c: 76: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11407:	
	bcf	(57/8),(57)&7
	line	77
	
l11409:	
;steppermotor.c: 77: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l11411:	
	nop
	
l11413:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	78
	
l3837:	
	return
	opt stack 0
GLOBAL	__end_of_rotate
	__end_of_rotate:
;; =============== function _rotate ends ============

	signat	_rotate,8312
	global	_robotLoadSong
psect	text1118,local,class=CODE,delta=2
global __ptext1118
__ptext1118:

;; *************** function _robotLoadSong *****************
;; Defined at:
;;		line 644 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1118
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	644
	global	__size_of_robotLoadSong
	__size_of_robotLoadSong	equ	__end_of_robotLoadSong-_robotLoadSong
	
_robotLoadSong:	
	opt	stack 4
; Regs used in _robotLoadSong: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	645
	
l11381:	
;robot.c: 645: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	646
;robot.c: 646: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	647
;robot.c: 647: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	649
;robot.c: 649: ser_putch(72);
	movlw	(048h)
	fcall	_ser_putch
	line	650
;robot.c: 650: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	651
;robot.c: 651: ser_putch(84);
	movlw	(054h)
	fcall	_ser_putch
	line	652
;robot.c: 652: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	654
;robot.c: 654: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	655
;robot.c: 655: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	656
;robot.c: 656: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	658
;robot.c: 658: ser_putch(84);
	movlw	(054h)
	fcall	_ser_putch
	line	659
;robot.c: 659: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	660
;robot.c: 660: ser_putch(72);
	movlw	(048h)
	fcall	_ser_putch
	line	661
;robot.c: 661: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	663
;robot.c: 663: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	664
;robot.c: 664: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	665
;robot.c: 665: ser_putch(2);
	movlw	(02h)
	fcall	_ser_putch
	line	667
;robot.c: 667: ser_putch(48);
	movlw	(030h)
	fcall	_ser_putch
	line	668
;robot.c: 668: ser_putch(48);
	movlw	(030h)
	fcall	_ser_putch
	line	669
;robot.c: 669: ser_putch(49);
	movlw	(031h)
	fcall	_ser_putch
	line	670
;robot.c: 670: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	672
;robot.c: 672: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	673
;robot.c: 673: ser_putch(3);
	movlw	(03h)
	fcall	_ser_putch
	line	674
;robot.c: 674: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	676
;robot.c: 676: ser_putch(48);
	movlw	(030h)
	fcall	_ser_putch
	line	677
;robot.c: 677: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	678
;robot.c: 678: ser_putch(49);
	movlw	(031h)
	fcall	_ser_putch
	line	679
;robot.c: 679: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	680
;robot.c: 680: ser_putch(48);
	movlw	(030h)
	fcall	_ser_putch
	line	681
;robot.c: 681: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	682
;robot.c: 682: ser_putch(49);
	movlw	(031h)
	fcall	_ser_putch
	line	683
;robot.c: 683: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	684
;robot.c: 684: ser_putch(48);
	movlw	(030h)
	fcall	_ser_putch
	line	685
;robot.c: 685: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	686
;robot.c: 686: ser_putch(49);
	movlw	(031h)
	fcall	_ser_putch
	line	687
;robot.c: 687: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	688
;robot.c: 688: ser_putch(48);
	movlw	(030h)
	fcall	_ser_putch
	line	689
;robot.c: 689: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	690
;robot.c: 690: ser_putch(49);
	movlw	(031h)
	fcall	_ser_putch
	line	691
;robot.c: 691: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	692
;robot.c: 692: ser_putch(48);
	movlw	(030h)
	fcall	_ser_putch
	line	693
;robot.c: 693: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	694
;robot.c: 694: ser_putch(49);
	movlw	(031h)
	fcall	_ser_putch
	line	695
;robot.c: 695: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	696
;robot.c: 696: ser_putch(48);
	movlw	(030h)
	fcall	_ser_putch
	line	697
;robot.c: 697: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	698
;robot.c: 698: ser_putch(49);
	movlw	(031h)
	fcall	_ser_putch
	line	699
;robot.c: 699: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	700
;robot.c: 700: ser_putch(48);
	movlw	(030h)
	fcall	_ser_putch
	line	701
;robot.c: 701: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	702
;robot.c: 702: ser_putch(49);
	movlw	(031h)
	fcall	_ser_putch
	line	703
;robot.c: 703: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	704
;robot.c: 704: ser_putch(48);
	movlw	(030h)
	fcall	_ser_putch
	line	705
;robot.c: 705: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	706
;robot.c: 706: ser_putch(49);
	movlw	(031h)
	fcall	_ser_putch
	line	707
;robot.c: 707: ser_putch(16);
	movlw	(010h)
	fcall	_ser_putch
	line	709
;robot.c: 709: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	710
;robot.c: 710: ser_putch(4);
	movlw	(04h)
	fcall	_ser_putch
	line	711
;robot.c: 711: ser_putch(6);
	movlw	(06h)
	fcall	_ser_putch
	line	713
;robot.c: 713: ser_putch(63);
	movlw	(03Fh)
	fcall	_ser_putch
	line	714
;robot.c: 714: ser_putch(8);
	movlw	(08h)
	fcall	_ser_putch
	line	715
;robot.c: 715: ser_putch(67);
	movlw	(043h)
	fcall	_ser_putch
	line	716
;robot.c: 716: ser_putch(8);
	movlw	(08h)
	fcall	_ser_putch
	line	717
;robot.c: 717: ser_putch(73);
	movlw	(049h)
	fcall	_ser_putch
	line	718
;robot.c: 718: ser_putch(48);
	movlw	(030h)
	fcall	_ser_putch
	line	720
;robot.c: 720: ser_putch(63);
	movlw	(03Fh)
	fcall	_ser_putch
	line	721
;robot.c: 721: ser_putch(8);
	movlw	(08h)
	fcall	_ser_putch
	line	722
;robot.c: 722: ser_putch(67);
	movlw	(043h)
	fcall	_ser_putch
	line	723
;robot.c: 723: ser_putch(8);
	movlw	(08h)
	fcall	_ser_putch
	line	724
;robot.c: 724: ser_putch(75);
	movlw	(04Bh)
	fcall	_ser_putch
	line	725
;robot.c: 725: ser_putch(64);
	movlw	(040h)
	fcall	_ser_putch
	line	730
	
l6344:	
	return
	opt stack 0
GLOBAL	__end_of_robotLoadSong
	__end_of_robotLoadSong:
;; =============== function _robotLoadSong ends ============

	signat	_robotLoadSong,88
	global	_robo_init
psect	text1119,local,class=CODE,delta=2
global __ptext1119
__ptext1119:

;; *************** function _robo_init *****************
;; Defined at:
;;		line 45 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1119
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	45
	global	__size_of_robo_init
	__size_of_robo_init	equ	__end_of_robo_init-_robo_init
	
_robo_init:	
	opt	stack 3
; Regs used in _robo_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	46
	
l11379:	
;robot.c: 46: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	47
;robot.c: 47: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	48
;robot.c: 48: ser_putch(150);
	movlw	(096h)
	fcall	_ser_putch
	line	49
;robot.c: 49: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	50
	
l6211:	
	return
	opt stack 0
GLOBAL	__end_of_robo_init
	__end_of_robo_init:
;; =============== function _robo_init ends ============

	signat	_robo_init,88
	global	_lcd_write_data
psect	text1120,local,class=CODE,delta=2
global __ptext1120
__ptext1120:

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
psect	text1120
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
	
l11371:	
;lcd.c: 31: RE2 = 0;
	bcf	(74/8),(74)&7
	line	32
;lcd.c: 32: RE1 = 0;
	bcf	(73/8),(73)&7
	line	33
;lcd.c: 33: RE0 = 1;
	bsf	(72/8),(72)&7
	line	34
	
l11373:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
l11375:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
l11377:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u5797:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u5797
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u5797
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
psect	text1121,local,class=CODE,delta=2
global __ptext1121
__ptext1121:

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
psect	text1121
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
	
l11363:	
;lcd.c: 19: RE2 = 0;
	bcf	(74/8),(74)&7
	line	20
;lcd.c: 20: RE1 = 0;
	bcf	(73/8),(73)&7
	line	21
;lcd.c: 21: RE0 = 0;
	bcf	(72/8),(72)&7
	line	22
	
l11365:	
;lcd.c: 22: PORTD = databyte;
	movf	(lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
l11367:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l11369:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??_lcd_write_control+0)+0),f
u5807:
	decfsz	((??_lcd_write_control+0)+0),f
	goto	u5807
	decfsz	((??_lcd_write_control+0)+0+1),f
	goto	u5807
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
psect	text1122,local,class=CODE,delta=2
global __ptext1122
__ptext1122:

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
psect	text1122
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 4
; Regs used in _init_adc: [wreg+status,2]
	line	63
	
l11353:	
;adc.c: 63: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	64
	
l11355:	
;adc.c: 64: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	67
	
l11357:	
;adc.c: 67: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	68
	
l11359:	
;adc.c: 68: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	70
	
l11361:	
;adc.c: 70: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_init_adc+0)+0,f
u5817:
decfsz	(??_init_adc+0)+0,f
	goto	u5817
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
psect	text1123,local,class=CODE,delta=2
global __ptext1123
__ptext1123:

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
psect	text1123
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
	
l11337:	
;adc.c: 21: switch(channel)
	goto	l11345
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
	goto	l11347
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
	goto	l11347
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
	goto	l11347
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
	goto	l11347
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
	goto	l11347
	line	50
;adc.c: 50: default:
	
l696:	
	line	51
	
l11339:	
;adc.c: 51: return 0;
	movlw	(0)
	goto	l697
	
l11341:	
	goto	l697
	line	52
	
l11343:	
;adc.c: 52: }
	goto	l11347
	line	21
	
l689:	
	
l11345:	
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
	goto	l11339
	opt asmopt_on

	line	52
	
l691:	
	line	54
	
l11347:	
;adc.c: 54: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u5827:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u5827
opt asmopt_on

	line	56
	
l11349:	
;adc.c: 56: return adc_read();
	fcall	_adc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_adc_read)),w
	goto	l697
	
l11351:	
	line	58
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
psect	text1124,local,class=CODE,delta=2
global __ptext1124
__ptext1124:

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
psect	text1124
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 3
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l11281:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u4621
	goto	u4620
u4621:
	goto	l11285
u4620:
	line	10
	
l11283:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l11285
	line	12
	
l8013:	
	line	13
	
l11285:	
	btfss	(___awmod@divisor+1),7
	goto	u4631
	goto	u4630
u4631:
	goto	l11289
u4630:
	line	14
	
l11287:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l11289
	
l8014:	
	line	15
	
l11289:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u4641
	goto	u4640
u4641:
	goto	l11307
u4640:
	line	16
	
l11291:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l11297
	
l8017:	
	line	18
	
l11293:	
	movlw	01h
	
u4655:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4655
	line	19
	
l11295:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l11297
	line	20
	
l8016:	
	line	17
	
l11297:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u4661
	goto	u4660
u4661:
	goto	l11293
u4660:
	goto	l11299
	
l8018:	
	goto	l11299
	line	21
	
l8019:	
	line	22
	
l11299:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u4675
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u4675:
	skipc
	goto	u4671
	goto	u4670
u4671:
	goto	l11303
u4670:
	line	23
	
l11301:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l11303
	
l8020:	
	line	24
	
l11303:	
	movlw	01h
	
u4685:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u4685
	line	25
	
l11305:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u4691
	goto	u4690
u4691:
	goto	l11299
u4690:
	goto	l11307
	
l8021:	
	goto	l11307
	line	26
	
l8015:	
	line	27
	
l11307:	
	movf	(___awmod@sign),w
	skipz
	goto	u4700
	goto	l11311
u4700:
	line	28
	
l11309:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l11311
	
l8022:	
	line	29
	
l11311:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l8023
	
l11313:	
	line	30
	
l8023:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text1125,local,class=CODE,delta=2
global __ptext1125
__ptext1125:

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
psect	text1125
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 3
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l11241:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u4521
	goto	u4520
u4521:
	goto	l11245
u4520:
	line	11
	
l11243:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l11245
	line	13
	
l7945:	
	line	14
	
l11245:	
	btfss	(___awdiv@dividend+1),7
	goto	u4531
	goto	u4530
u4531:
	goto	l11251
u4530:
	line	15
	
l11247:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l11249:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l11251
	line	17
	
l7946:	
	line	18
	
l11251:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l11253:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u4541
	goto	u4540
u4541:
	goto	l11273
u4540:
	line	20
	
l11255:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l11261
	
l7949:	
	line	22
	
l11257:	
	movlw	01h
	
u4555:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u4555
	line	23
	
l11259:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l11261
	line	24
	
l7948:	
	line	21
	
l11261:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u4561
	goto	u4560
u4561:
	goto	l11257
u4560:
	goto	l11263
	
l7950:	
	goto	l11263
	line	25
	
l7951:	
	line	26
	
l11263:	
	movlw	01h
	
u4575:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u4575
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u4585
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u4585:
	skipc
	goto	u4581
	goto	u4580
u4581:
	goto	l11269
u4580:
	line	28
	
l11265:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l11267:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l11269
	line	30
	
l7952:	
	line	31
	
l11269:	
	movlw	01h
	
u4595:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u4595
	line	32
	
l11271:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u4601
	goto	u4600
u4601:
	goto	l11263
u4600:
	goto	l11273
	
l7953:	
	goto	l11273
	line	33
	
l7947:	
	line	34
	
l11273:	
	movf	(___awdiv@sign),w
	skipz
	goto	u4610
	goto	l11277
u4610:
	line	35
	
l11275:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l11277
	
l7954:	
	line	36
	
l11277:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l7955
	
l11279:	
	line	37
	
l7955:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___lwmod
psect	text1126,local,class=CODE,delta=2
global __ptext1126
__ptext1126:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    8[BANK0 ] unsigned int 
;;  dividend        2   10[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    8[BANK0 ] unsigned int 
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
psect	text1126
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 2
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l11219:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u4461
	goto	u4460
u4461:
	goto	l11237
u4460:
	line	9
	
l11221:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l11227
	
l7823:	
	line	11
	
l11223:	
	movlw	01h
	
u4475:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4475
	line	12
	
l11225:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l11227
	line	13
	
l7822:	
	line	10
	
l11227:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u4481
	goto	u4480
u4481:
	goto	l11223
u4480:
	goto	l11229
	
l7824:	
	goto	l11229
	line	14
	
l7825:	
	line	15
	
l11229:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u4495
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u4495:
	skipc
	goto	u4491
	goto	u4490
u4491:
	goto	l11233
u4490:
	line	16
	
l11231:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l11233
	
l7826:	
	line	17
	
l11233:	
	movlw	01h
	
u4505:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u4505
	line	18
	
l11235:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u4511
	goto	u4510
u4511:
	goto	l11229
u4510:
	goto	l11237
	
l7827:	
	goto	l11237
	line	19
	
l7821:	
	line	20
	
l11237:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l7828
	
l11239:	
	line	21
	
l7828:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text1127,local,class=CODE,delta=2
global __ptext1127
__ptext1127:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] unsigned int 
;;  dividend        2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[BANK0 ] unsigned int 
;;  counter         1    7[BANK0 ] unsigned char 
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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text1127
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 2
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l11193:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l11195:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u4391
	goto	u4390
u4391:
	goto	l11215
u4390:
	line	11
	
l11197:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l11203
	
l7813:	
	line	13
	
l11199:	
	movlw	01h
	
u4405:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u4405
	line	14
	
l11201:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l11203
	line	15
	
l7812:	
	line	12
	
l11203:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u4411
	goto	u4410
u4411:
	goto	l11199
u4410:
	goto	l11205
	
l7814:	
	goto	l11205
	line	16
	
l7815:	
	line	17
	
l11205:	
	movlw	01h
	
u4425:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u4425
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u4435
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u4435:
	skipc
	goto	u4431
	goto	u4430
u4431:
	goto	l11211
u4430:
	line	19
	
l11207:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l11209:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l11211
	line	21
	
l7816:	
	line	22
	
l11211:	
	movlw	01h
	
u4445:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u4445
	line	23
	
l11213:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u4451
	goto	u4450
u4451:
	goto	l11205
u4450:
	goto	l11215
	
l7817:	
	goto	l11215
	line	24
	
l7811:	
	line	25
	
l11215:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l7818
	
l11217:	
	line	26
	
l7818:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text1128,local,class=CODE,delta=2
global __ptext1128
__ptext1128:

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
;;		_abs
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text1128
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 2
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l11181:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l11183
	line	6
	
l7805:	
	line	7
	
l11183:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u4351
	goto	u4350
u4351:
	goto	l7806
u4350:
	line	8
	
l11185:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l7806:	
	line	9
	movlw	01h
	
u4365:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u4365
	line	10
	
l11187:	
	movlw	01h
	
u4375:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u4375
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u4381
	goto	u4380
u4381:
	goto	l11183
u4380:
	goto	l11189
	
l7807:	
	line	12
	
l11189:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l7808
	
l11191:	
	line	13
	
l7808:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_isdigit
psect	text1129,local,class=CODE,delta=2
global __ptext1129
__ptext1129:

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
psect	text1129
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
	
l11169:	
	clrf	(_isdigit$8696)
	
l11171:	
	movlw	(03Ah)
	subwf	(isdigit@c),w
	skipnc
	goto	u4331
	goto	u4330
u4331:
	goto	l11177
u4330:
	
l11173:	
	movlw	(030h)
	subwf	(isdigit@c),w
	skipc
	goto	u4341
	goto	u4340
u4341:
	goto	l11177
u4340:
	
l11175:	
	clrf	(_isdigit$8696)
	bsf	status,0
	rlf	(_isdigit$8696),f
	goto	l11177
	
l7795:	
	
l11177:	
	rrf	(_isdigit$8696),w
	
	goto	l7796
	
l11179:	
	line	15
	
l7796:	
	return
	opt stack 0
GLOBAL	__end_of_isdigit
	__end_of_isdigit:
;; =============== function _isdigit ends ============

	signat	_isdigit,4216
	global	_ser_isrx
psect	text1130,local,class=CODE,delta=2
global __ptext1130
__ptext1130:

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
psect	text1130
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	45
	global	__size_of_ser_isrx
	__size_of_ser_isrx	equ	__end_of_ser_isrx-_ser_isrx
	
_ser_isrx:	
	opt	stack 2
; Regs used in _ser_isrx: [wreg+status,2+status,0]
	line	46
	
l11121:	
;ser.c: 46: if(OERR) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(193/8),(193)&7
	goto	u4261
	goto	u4260
u4261:
	goto	l11129
u4260:
	line	47
	
l11123:	
;ser.c: 47: CREN = 0;
	bcf	(196/8),(196)&7
	line	48
;ser.c: 48: CREN = 1;
	bsf	(196/8),(196)&7
	line	49
	
l11125:	
;ser.c: 49: return 0;
	clrc
	
	goto	l7044
	
l11127:	
	goto	l7044
	line	50
	
l7043:	
	line	51
	
l11129:	
;ser.c: 50: }
;ser.c: 51: return (rxiptr!=rxoptr);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_rxiptr)^080h,w	;volatile
	xorwf	(_rxoptr)^080h,w	;volatile
	skipz
	goto	u4271
	goto	u4270
u4271:
	goto	l11133
u4270:
	
l11131:	
	clrc
	
	goto	l7044
	
l10883:	
	
l11133:	
	setc
	
	goto	l7044
	
l10885:	
	goto	l7044
	
l11135:	
	line	52
	
l7044:	
	return
	opt stack 0
GLOBAL	__end_of_ser_isrx
	__end_of_ser_isrx:
;; =============== function _ser_isrx ends ============

	signat	_ser_isrx,88
	global	_spi_transfer
psect	text1131,local,class=CODE,delta=2
global __ptext1131
__ptext1131:

;; *************** function _spi_transfer *****************
;; Defined at:
;;		line 40 in file "E:\Aldnoah.Zero\Assignment3\steppermotor.c"
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
psect	text1131
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	40
	global	__size_of_spi_transfer
	__size_of_spi_transfer	equ	__end_of_spi_transfer-_spi_transfer
	
_spi_transfer:	
	opt	stack 2
; Regs used in _spi_transfer: [wreg]
;spi_transfer@data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(spi_transfer@data)
	line	41
	
l11111:	
;steppermotor.c: 41: unsigned char temp = 0;
	clrf	(spi_transfer@temp)
	line	43
;steppermotor.c: 43: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	44
	
l11113:	
;steppermotor.c: 44: SSPBUF = data;
	movf	(spi_transfer@data),w
	movwf	(19)	;volatile
	line	46
;steppermotor.c: 46: while (SSPIF == 0);
	goto	l3824
	
l3825:	
	
l3824:	
	btfss	(99/8),(99)&7
	goto	u4251
	goto	u4250
u4251:
	goto	l3824
u4250:
	goto	l11115
	
l3826:	
	line	47
	
l11115:	
;steppermotor.c: 47: temp = SSPBUF;
	movf	(19),w	;volatile
	movwf	(??_spi_transfer+0)+0
	movf	(??_spi_transfer+0)+0,w
	movwf	(spi_transfer@temp)
	line	48
	
l11117:	
;steppermotor.c: 48: SSPIF = 0;
	bcf	(99/8),(99)&7
	goto	l3827
	line	50
	
l11119:	
	line	51
;steppermotor.c: 50: return temp;
;	Return value of _spi_transfer is never used
	
l3827:	
	return
	opt stack 0
GLOBAL	__end_of_spi_transfer
	__end_of_spi_transfer:
;; =============== function _spi_transfer ends ============

	signat	_spi_transfer,4217
	global	_ser_putch
psect	text1132,local,class=CODE,delta=2
global __ptext1132
__ptext1132:

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
;;		_main
;;		_GoHome
;;		_FindVictim
;;		_ChargeMode
;;		_robo_init
;;		_robot_read
;;		_RobotDrive
;;		_robotTurn
;;		_robotFollow
;;		_robot_turnInPlace
;;		_RobotBattRead
;;		_robotLoadSong
;;		_ser_puts
;;		_ser_puts2
;;		_ser_puthex
;; This function uses a non-reentrant model
;;
psect	text1132
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
	
l11099:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l11101
	
l7054:	
	line	72
;ser.c: 72: continue;
	goto	l11101
	
l7053:	
	line	71
	
l11101:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_txiptr)^080h,w	;volatile
	addlw	01h
	andlw	0Fh
	xorwf	(_txoptr)^080h,w	;volatile
	skipnz
	goto	u4241
	goto	u4240
u4241:
	goto	l11101
u4240:
	
l7055:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l11103:	
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
	
l11105:	
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
	
l11107:	
;ser.c: 76: TXIE=1;
	bsf	(1124/8)^080h,(1124)&7
	line	77
	
l11109:	
;ser.c: 77: GIE=1;
	bsf	(95/8),(95)&7
	line	78
	
l7056:	
	return
	opt stack 0
GLOBAL	__end_of_ser_putch
	__end_of_ser_putch:
;; =============== function _ser_putch ends ============

	signat	_ser_putch,4216
	global	_Menu
psect	text1133,local,class=CODE,delta=2
global __ptext1133
__ptext1133:

;; *************** function _Menu *****************
;; Defined at:
;;		line 100 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
psect	text1133
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	100
	global	__size_of_Menu
	__size_of_Menu	equ	__end_of_Menu-_Menu
	
_Menu:	
	opt	stack 5
; Regs used in _Menu: [wreg-fsr0h+status,2+status,0]
;Menu@BTN_input stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Menu@BTN_input)
	line	101
	
l11075:	
;HMI.c: 101: switch (BTN_input)
	goto	l11093
	line	103
;HMI.c: 102: {
;HMI.c: 103: case 1:
	
l4648:	
	line	105
;HMI.c: 105: break;
	goto	l11095
	line	106
;HMI.c: 106: case 2:
	
l4650:	
	line	108
;HMI.c: 108: break;
	goto	l11095
	line	109
;HMI.c: 109: case 3:
	
l4651:	
	line	110
	
l11077:	
;HMI.c: 110: pos--;
	movlw	low(-1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(-1)
	addwf	(_pos+1)^080h,f
	line	111
	
l11079:	
;HMI.c: 111: if (pos < 0)
	btfss	(_pos+1)^080h,7
	goto	u4221
	goto	u4220
u4221:
	goto	l11095
u4220:
	line	112
	
l11081:	
;HMI.c: 112: pos = 6 - 1;
	movlw	low(05h)
	movwf	(_pos)^080h
	movlw	high(05h)
	movwf	((_pos)^080h)+1
	goto	l11095
	
l4652:	
	line	114
;HMI.c: 114: break;
	goto	l11095
	line	115
;HMI.c: 115: case 4:
	
l4653:	
	line	116
	
l11083:	
;HMI.c: 116: pos++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(01h)
	addwf	(_pos+1)^080h,f
	line	117
;HMI.c: 117: if (pos == 6)
	movlw	06h
	xorwf	(_pos)^080h,w
	iorwf	(_pos+1)^080h,w
	skipz
	goto	u4231
	goto	u4230
u4231:
	goto	l11095
u4230:
	line	118
	
l11085:	
;HMI.c: 118: pos = 0;
	clrf	(_pos)^080h
	clrf	(_pos+1)^080h
	goto	l11095
	
l4654:	
	line	120
;HMI.c: 120: break;
	goto	l11095
	line	121
;HMI.c: 121: case 5:
	
l4655:	
	line	122
	
l11087:	
;HMI.c: 122: return pos;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	goto	l4656
	
l11089:	
	goto	l4656
	line	125
;HMI.c: 125: default:
	
l4657:	
	line	127
;HMI.c: 127: break;
	goto	l11095
	line	128
	
l11091:	
;HMI.c: 128: }
	goto	l11095
	line	101
	
l4647:	
	
l11093:	
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
	goto	l11095
	xorlw	2^1	; case 2
	skipnz
	goto	l11095
	xorlw	3^2	; case 3
	skipnz
	goto	l11077
	xorlw	4^3	; case 4
	skipnz
	goto	l11083
	xorlw	5^4	; case 5
	skipnz
	goto	l11087
	goto	l11095
	opt asmopt_on

	line	128
	
l4649:	
	line	129
	
l11095:	
;HMI.c: 129: return 255;
	movlw	(0FFh)
	goto	l4656
	
l11097:	
	line	130
	
l4656:	
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4217
	global	_ser_init
psect	text1134,local,class=CODE,delta=2
global __ptext1134
__ptext1134:

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
psect	text1134
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 4
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l11049:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l11051:	
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
	
l11053:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l11055:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l11057:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l11059:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l11061:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l11063:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l11065:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l11067:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l11069:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l11071:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l11073:	
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
	
l7078:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_adc_read
psect	text1135,local,class=CODE,delta=2
global __ptext1135
__ptext1135:

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
psect	text1135
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	76
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	79
	
l10891:	
;adc.c: 77: volatile unsigned int adc_value;
;adc.c: 79: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	81
	
l10893:	
;adc.c: 81: GO = 1;
	bsf	(250/8),(250)&7
	line	82
;adc.c: 82: while(GO) continue;
	goto	l703
	
l704:	
	
l703:	
	btfsc	(250/8),(250)&7
	goto	u3881
	goto	u3880
u3881:
	goto	l703
u3880:
	
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
psect	text1135
	line	88
	
l10895:	
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
	
u3895:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u3895
	line	90
;adc.c: 90: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	93
	
l10897:	
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
	
l10899:	
	line	94
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
	global	_isr1
psect	text1136,local,class=CODE,delta=2
global __ptext1136
__ptext1136:

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
psect	text1136
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
psect	text1136
	line	110
	
i1l10927:	
;Main.c: 110: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u393_21
	goto	u393_20
u393_21:
	goto	i1l10949
u393_20:
	line	112
	
i1l10929:	
;Main.c: 111: {
;Main.c: 112: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	113
	
i1l10931:	
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
	
i1l10933:	
;Main.c: 118: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	119
	
i1l10935:	
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
	goto	u394_21
	goto	u394_20
u394_21:
	goto	i1l10939
u394_20:
	line	121
	
i1l10937:	
;Main.c: 120: {
;Main.c: 121: RTC_FLAG_250MS = 1;
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l10939
	line	122
	
i1l2281:	
	line	123
	
i1l10939:	
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
	goto	u395_21
	goto	u395_20
u395_21:
	goto	i1l10945
u395_20:
	line	125
	
i1l10941:	
;Main.c: 124: {
;Main.c: 125: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	126
	
i1l10943:	
;Main.c: 126: RB0 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l10945
	line	127
	
i1l2282:	
	line	128
	
i1l10945:	
;Main.c: 127: }
;Main.c: 128: if (buttonPressed == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_buttonPressed)^080h,f
	skipz	;volatile
	goto	u396_21
	goto	u396_20
u396_21:
	goto	i1l10949
u396_20:
	line	130
	
i1l10947:	
;Main.c: 129: {
;Main.c: 130: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_buttonPressed)^080h	;volatile
	goto	i1l10949
	line	131
	
i1l2283:	
	goto	i1l10949
	line	132
	
i1l2280:	
	line	133
	
i1l10949:	
;Main.c: 131: }
;Main.c: 132: }
;Main.c: 133: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	bcf	status, 5	;RP0=0, select bank0
	btfss	(101/8),(101)&7
	goto	u397_21
	goto	u397_20
u397_21:
	goto	i1l10959
u397_20:
	
i1l10951:	
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
	
i1l10953:	
	movf	(_rxiptr)^080h,w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_ser_tmp)^080h
	
i1l10955:	
	movf	(_ser_tmp)^080h,w
	xorwf	(_rxoptr)^080h,w	;volatile
	skipnz
	goto	u398_21
	goto	u398_20
u398_21:
	goto	i1l10959
u398_20:
	
i1l10957:	
	movf	(_ser_tmp)^080h,w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)^080h	;volatile
	goto	i1l10959
	
i1l2285:	
	goto	i1l10959
	
i1l2284:	
	
i1l10959:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(100/8),(100)&7
	goto	u399_21
	goto	u399_20
u399_21:
	goto	i1l2288
u399_20:
	
i1l10961:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u400_21
	goto	u400_20
u400_21:
	goto	i1l2288
u400_20:
	
i1l10963:	
	movf	(_txoptr)^080h,w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	
i1l10965:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_txoptr)^080h,f	;volatile
	
i1l10967:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr)^080h,f	;volatile
	
i1l10969:	
	movf	(_txoptr)^080h,w	;volatile
	xorwf	(_txiptr)^080h,w	;volatile
	skipz
	goto	u401_21
	goto	u401_20
u401_21:
	goto	i1l2288
u401_20:
	
i1l10971:	
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2288
	
i1l2287:	
	goto	i1l2288
	
i1l2286:	
	line	134
	
i1l2288:	
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
psect	text1137,local,class=CODE,delta=2
global __ptext1137
__ptext1137:

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
psect	text1137
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_ofi1___lwmod
	__size_ofi1___lwmod	equ	__end_ofi1___lwmod-i1___lwmod
	
i1___lwmod:	
	opt	stack 0
; Regs used in i1___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l11315:	
	movf	(i1___lwmod@divisor+1),w
	iorwf	(i1___lwmod@divisor),w
	skipnz
	goto	u471_21
	goto	u471_20
u471_21:
	goto	i1l11333
u471_20:
	line	9
	
i1l11317:	
	clrf	(i1___lwmod@counter)
	bsf	status,0
	rlf	(i1___lwmod@counter),f
	line	10
	goto	i1l11323
	
i1l7823:	
	line	11
	
i1l11319:	
	movlw	01h
	
u472_25:
	clrc
	rlf	(i1___lwmod@divisor),f
	rlf	(i1___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u472_25
	line	12
	
i1l11321:	
	movlw	(01h)
	movwf	(??i1___lwmod+0)+0
	movf	(??i1___lwmod+0)+0,w
	addwf	(i1___lwmod@counter),f
	goto	i1l11323
	line	13
	
i1l7822:	
	line	10
	
i1l11323:	
	btfss	(i1___lwmod@divisor+1),(15)&7
	goto	u473_21
	goto	u473_20
u473_21:
	goto	i1l11319
u473_20:
	goto	i1l11325
	
i1l7824:	
	goto	i1l11325
	line	14
	
i1l7825:	
	line	15
	
i1l11325:	
	movf	(i1___lwmod@divisor+1),w
	subwf	(i1___lwmod@dividend+1),w
	skipz
	goto	u474_25
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),w
u474_25:
	skipc
	goto	u474_21
	goto	u474_20
u474_21:
	goto	i1l11329
u474_20:
	line	16
	
i1l11327:	
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),f
	movf	(i1___lwmod@divisor+1),w
	skipc
	decf	(i1___lwmod@dividend+1),f
	subwf	(i1___lwmod@dividend+1),f
	goto	i1l11329
	
i1l7826:	
	line	17
	
i1l11329:	
	movlw	01h
	
u475_25:
	clrc
	rrf	(i1___lwmod@divisor+1),f
	rrf	(i1___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u475_25
	line	18
	
i1l11331:	
	movlw	low(01h)
	subwf	(i1___lwmod@counter),f
	btfss	status,2
	goto	u476_21
	goto	u476_20
u476_21:
	goto	i1l11325
u476_20:
	goto	i1l11333
	
i1l7827:	
	goto	i1l11333
	line	19
	
i1l7821:	
	line	20
	
i1l11333:	
	movf	(i1___lwmod@dividend+1),w
	clrf	(?i1___lwmod+1)
	addwf	(?i1___lwmod+1)
	movf	(i1___lwmod@dividend),w
	clrf	(?i1___lwmod)
	addwf	(?i1___lwmod)

	goto	i1l7828
	
i1l11335:	
	line	21
	
i1l7828:	
	return
	opt stack 0
GLOBAL	__end_ofi1___lwmod
	__end_ofi1___lwmod:
;; =============== function i1___lwmod ends ============

	signat	i1___lwmod,90
	global	_ReadButtons
psect	text1138,local,class=CODE,delta=2
global __ptext1138
__ptext1138:

;; *************** function _ReadButtons *****************
;; Defined at:
;;		line 58 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
psect	text1138
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	58
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 0
; Regs used in _ReadButtons: [wreg+status,2+status,0]
	line	60
	
i1l10973:	
;HMI.c: 60: if(!RB2) { UpDebounceCount++; if(UpDebounceCount >= 10 & UpReleased) { UpPressed = 1; UpReleased = 0; } } else { UpDebounceCount = 0; UpReleased = 1; } if(!RB3) { DownDebounceCount++; if(DownDebounceCount >= 10 & DownReleased) { DownPressed = 1; Down
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u402_21
	goto	u402_20
u402_21:
	goto	i1l4624
u402_20:
	
i1l10975:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_UpDebounceCount)^080h,f	;volatile
	
i1l10977:	
	movlw	(0Ah)
	subwf	(_UpDebounceCount)^080h,w	;volatile
	skipc
	goto	u403_21
	goto	u403_20
u403_21:
	goto	i1l4626
u403_20:
	
i1l10979:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u404_21
	goto	u404_20
u404_21:
	goto	i1l4626
u404_20:
	
i1l10981:	
	bsf	(_UpPressed/8),(_UpPressed)&7
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l4626
	
i1l4625:	
	goto	i1l4626
	
i1l4624:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_UpDebounceCount)^080h	;volatile
	bsf	(_UpReleased/8),(_UpReleased)&7
	
i1l4626:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(51/8),(51)&7
	goto	u405_21
	goto	u405_20
u405_21:
	goto	i1l4627
u405_20:
	
i1l10983:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_DownDebounceCount)^080h,f	;volatile
	
i1l10985:	
	movlw	(0Ah)
	subwf	(_DownDebounceCount)^080h,w	;volatile
	skipc
	goto	u406_21
	goto	u406_20
u406_21:
	goto	i1l4629
u406_20:
	
i1l10987:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u407_21
	goto	u407_20
u407_21:
	goto	i1l4629
u407_20:
	
i1l10989:	
	bsf	(_DownPressed/8),(_DownPressed)&7
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l4629
	
i1l4628:	
	goto	i1l4629
	
i1l4627:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_DownDebounceCount)^080h	;volatile
	bsf	(_DownReleased/8),(_DownReleased)&7
	
i1l4629:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(52/8),(52)&7
	goto	u408_21
	goto	u408_20
u408_21:
	goto	i1l4630
u408_20:
	
i1l10991:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_LeftDebounceCount)^080h,f	;volatile
	
i1l10993:	
	movlw	(0Ah)
	subwf	(_LeftDebounceCount)^080h,w	;volatile
	skipc
	goto	u409_21
	goto	u409_20
u409_21:
	goto	i1l4632
u409_20:
	
i1l10995:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u410_21
	goto	u410_20
u410_21:
	goto	i1l4632
u410_20:
	
i1l10997:	
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l4632
	
i1l4631:	
	goto	i1l4632
	
i1l4630:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_LeftDebounceCount)^080h	;volatile
	bsf	(_LeftReleased/8),(_LeftReleased)&7
	
i1l4632:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l4633
u411_20:
	
i1l10999:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RightDebounceCount)^080h,f	;volatile
	
i1l11001:	
	movlw	(0Ah)
	subwf	(_RightDebounceCount)^080h,w	;volatile
	skipc
	goto	u412_21
	goto	u412_20
u412_21:
	goto	i1l4635
u412_20:
	
i1l11003:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u413_21
	goto	u413_20
u413_21:
	goto	i1l4635
u413_20:
	
i1l11005:	
	bsf	(_RightPressed/8),(_RightPressed)&7
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l4635
	
i1l4634:	
	goto	i1l4635
	
i1l4633:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_RightDebounceCount)^080h	;volatile
	bsf	(_RightReleased/8),(_RightReleased)&7
	
i1l4635:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u414_21
	goto	u414_20
u414_21:
	goto	i1l4636
u414_20:
	
i1l11007:	
	movlw	(01h)
	movwf	(??_ReadButtons+0)+0
	movf	(??_ReadButtons+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_CenterDebounceCount)^080h,f	;volatile
	
i1l11009:	
	movlw	(0Ah)
	subwf	(_CenterDebounceCount)^080h,w	;volatile
	skipc
	goto	u415_21
	goto	u415_20
u415_21:
	goto	i1l4638
u415_20:
	
i1l11011:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u416_21
	goto	u416_20
u416_21:
	goto	i1l4638
u416_20:
	
i1l11013:	
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l4638
	
i1l4637:	
	goto	i1l4638
	
i1l4636:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_CenterDebounceCount)^080h	;volatile
	bsf	(_CenterReleased/8),(_CenterReleased)&7
	
i1l4638:	
	line	62
;HMI.c: 62: if(UpPressed)
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u417_21
	goto	u417_20
u417_21:
	goto	i1l4639
u417_20:
	line	64
	
i1l11015:	
;HMI.c: 63: {
;HMI.c: 64: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	65
	
i1l11017:	
;HMI.c: 65: return 1;
	movlw	(01h)
	goto	i1l4640
	
i1l11019:	
	goto	i1l4640
	line	67
	
i1l4639:	
	line	69
;HMI.c: 67: }
;HMI.c: 69: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u418_21
	goto	u418_20
u418_21:
	goto	i1l4641
u418_20:
	line	71
	
i1l11021:	
;HMI.c: 70: {
;HMI.c: 71: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	72
	
i1l11023:	
;HMI.c: 72: return 2;
	movlw	(02h)
	goto	i1l4640
	
i1l11025:	
	goto	i1l4640
	line	74
	
i1l4641:	
	line	75
;HMI.c: 74: }
;HMI.c: 75: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u419_21
	goto	u419_20
u419_21:
	goto	i1l4642
u419_20:
	line	77
	
i1l11027:	
;HMI.c: 76: {
;HMI.c: 77: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	78
	
i1l11029:	
;HMI.c: 78: return 3;
	movlw	(03h)
	goto	i1l4640
	
i1l11031:	
	goto	i1l4640
	line	80
	
i1l4642:	
	line	81
;HMI.c: 80: }
;HMI.c: 81: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u420_21
	goto	u420_20
u420_21:
	goto	i1l4643
u420_20:
	line	83
	
i1l11033:	
;HMI.c: 82: {
;HMI.c: 83: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	84
	
i1l11035:	
;HMI.c: 84: return 4;
	movlw	(04h)
	goto	i1l4640
	
i1l11037:	
	goto	i1l4640
	line	86
	
i1l4643:	
	line	88
;HMI.c: 86: }
;HMI.c: 88: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u421_21
	goto	u421_20
u421_21:
	goto	i1l11045
u421_20:
	line	90
	
i1l11039:	
;HMI.c: 89: {
;HMI.c: 90: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	91
	
i1l11041:	
;HMI.c: 91: return 5;
	movlw	(05h)
	goto	i1l4640
	
i1l11043:	
	goto	i1l4640
	line	93
	
i1l4644:	
	line	94
	
i1l11045:	
;HMI.c: 93: }
;HMI.c: 94: return 0;
	movlw	(0)
	goto	i1l4640
	
i1l11047:	
	line	95
	
i1l4640:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
psect	text1139,local,class=CODE,delta=2
global __ptext1139
__ptext1139:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
