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
	FNCALL	_main,_robot_read
	FNCALL	_main,_readAvgDistance
	FNCALL	_main,_UpdateDisplay
	FNCALL	_main,_Menu
	FNCALL	_main,_calibrateIR
	FNCALL	_main,_robotTurnSpeed
	FNCALL	_main,_robotMoveSpeed
	FNCALL	_main,_robotFollow
	FNCALL	_main,_ChargeMode
	FNCALL	_ChargeMode,_ser_putch
	FNCALL	_ChargeMode,_UpdateDisplay
	FNCALL	_robotFollow,_RobotDrive
	FNCALL	_robotFollow,_readAvgDistance
	FNCALL	_robotFollow,_robot_read
	FNCALL	_robotFollow,_UpdateDisplay
	FNCALL	_robotFollow,_abs
	FNCALL	_robotMoveSpeed,_RobotDrive
	FNCALL	_robotMoveSpeed,_robot_read
	FNCALL	_robotMoveSpeed,_UpdateDisplay
	FNCALL	_robotMoveSpeed,_abs
	FNCALL	_robotTurnSpeed,_robotTurn
	FNCALL	_robotTurnSpeed,_robot_read
	FNCALL	_robotTurnSpeed,_UpdateDisplay
	FNCALL	_robotTurnSpeed,_abs
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
	FNCALL	_robot_read,_ser_putch
	FNCALL	_robot_read,_ser_getch
	FNCALL	_lcd_init,_lcd_write_control
	FNCALL	_lcd_write_string,_lcd_write_data
	FNCALL	_lcd_set_cursor,_lcd_write_control
	FNCALL	_abs,___wmul
	FNCALL	_robotTurn,_ser_putch
	FNCALL	_RobotDrive,_ser_putch
	FNCALL	_ser_getch,_ser_isrx
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_ADCconvert,___wmul
	FNCALL	_ADCconvert,___lwdiv
	FNCALL	_rotate,_spi_transfer
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
	global	_txiptr
	global	UpdateDisplay@F1249
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
	global	_DistHighByte
	global	_DistLowByte
	global	_DownDebounceCount
	global	_LeftDebounceCount
	global	_ROBOTerror
	global	_RightDebounceCount
	global	_UpDebounceCount
	global	_VwallSensor
	global	_currentMenu
	global	_highByte
	global	_lowByte
	global	_rxiptr
	global	_rxoptr
	global	_ser_tmp
	global	_turnhighByte
	global	_turnlowByte
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
	
STR_19:	
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

_txiptr:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_rxfifo:
       ds      16

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

_DistHighByte:
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

_UpDebounceCount:
       ds      1

_VwallSensor:
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
UpdateDisplay@F1249:
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
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+03Ch)
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
	global	?_robot_read
?_robot_read:	; 0 bytes @ 0x0
	global	?_readAvgDistance
?_readAvgDistance:	; 0 bytes @ 0x0
	global	?_UpdateDisplay
?_UpdateDisplay:	; 0 bytes @ 0x0
	global	?_calibrateIR
?_calibrateIR:	; 0 bytes @ 0x0
	global	?_ChargeMode
?_ChargeMode:	; 0 bytes @ 0x0
	global	?_ser_putch
?_ser_putch:	; 0 bytes @ 0x0
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
	global	??_robot_read
??_robot_read:	; 0 bytes @ 0x2
	global	?_RobotDrive
?_RobotDrive:	; 0 bytes @ 0x2
	global	?_robotTurn
?_robotTurn:	; 0 bytes @ 0x2
	global	lcd_write_control@databyte
lcd_write_control@databyte:	; 1 bytes @ 0x2
	global	lcd_write_data@databyte
lcd_write_data@databyte:	; 1 bytes @ 0x2
	global	spi_transfer@data
spi_transfer@data:	; 1 bytes @ 0x2
	global	RobotDrive@speed
RobotDrive@speed:	; 2 bytes @ 0x2
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
	global	rotate@numsteps
rotate@numsteps:	; 2 bytes @ 0x3
	ds	1
	global	??_robotTurn
??_robotTurn:	; 0 bytes @ 0x4
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	robot_read@readType
robot_read@readType:	; 1 bytes @ 0x4
	global	adc_read@adc_value
adc_read@adc_value:	; 2 bytes @ 0x4
	global	RobotDrive@radius
RobotDrive@radius:	; 2 bytes @ 0x4
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
	global	??_RobotDrive
??_RobotDrive:	; 0 bytes @ 0x6
	global	?_abs
?_abs:	; 2 bytes @ 0x6
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x6
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
	global	RobotDrive@speedlowByte
RobotDrive@speedlowByte:	; 1 bytes @ 0x7
	global	lcd_write_string@s
lcd_write_string@s:	; 2 bytes @ 0x7
	ds	1
	global	??_abs
??_abs:	; 0 bytes @ 0x8
	global	?_readDistance
?_readDistance:	; 2 bytes @ 0x8
	global	RobotDrive@speedhighByte
RobotDrive@speedhighByte:	; 1 bytes @ 0x8
	global	rotate@i
rotate@i:	; 2 bytes @ 0x8
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x8
	ds	1
	global	??_lcd_write_string
??_lcd_write_string:	; 0 bytes @ 0x9
	global	RobotDrive@radiuslowByte
RobotDrive@radiuslowByte:	; 1 bytes @ 0x9
	ds	1
	global	??_readDistance
??_readDistance:	; 0 bytes @ 0xA
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0xA
	global	RobotDrive@radiushighByte
RobotDrive@radiushighByte:	; 1 bytes @ 0xA
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xB
	ds	1
	global	readDistance@readVal
readDistance@readVal:	; 2 bytes @ 0xC
	ds	1
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0xD
	ds	1
	global	??_ADCconvert
??_ADCconvert:	; 0 bytes @ 0xE
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0xE
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0xE
	ds	2
	global	??_readAvgDistance
??_readAvgDistance:	; 0 bytes @ 0x10
	global	readAvgDistance@fullval
readAvgDistance@fullval:	; 2 bytes @ 0x10
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x10
	ds	2
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
	global	?_robotTurnSpeed
?_robotTurnSpeed:	; 0 bytes @ 0x39
	global	?_robotMoveSpeed
?_robotMoveSpeed:	; 0 bytes @ 0x39
	global	?_robotFollow
?_robotFollow:	; 0 bytes @ 0x39
	global	??_ChargeMode
??_ChargeMode:	; 0 bytes @ 0x39
	global	robotFollow@distance
robotFollow@distance:	; 2 bytes @ 0x39
	global	robotMoveSpeed@distance
robotMoveSpeed@distance:	; 2 bytes @ 0x39
	global	robotTurnSpeed@angle
robotTurnSpeed@angle:	; 2 bytes @ 0x39
	ds	2
	global	robotFollow@speed
robotFollow@speed:	; 2 bytes @ 0x3B
	global	robotMoveSpeed@speed
robotMoveSpeed@speed:	; 2 bytes @ 0x3B
	global	robotTurnSpeed@speed
robotTurnSpeed@speed:	; 2 bytes @ 0x3B
	ds	2
	global	??_robotTurnSpeed
??_robotTurnSpeed:	; 0 bytes @ 0x3D
	global	??_robotMoveSpeed
??_robotMoveSpeed:	; 0 bytes @ 0x3D
	global	robotFollow@AdcTarget
robotFollow@AdcTarget:	; 2 bytes @ 0x3D
	ds	2
	global	??_robotFollow
??_robotFollow:	; 0 bytes @ 0x3F
	ds	1
	global	robotMoveSpeed@temp1
robotMoveSpeed@temp1:	; 2 bytes @ 0x40
	global	robotTurnSpeed@temp1
robotTurnSpeed@temp1:	; 2 bytes @ 0x40
	ds	2
	global	robotFollow@temp1
robotFollow@temp1:	; 2 bytes @ 0x42
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x44
	ds	3
	global	main@shortwall
main@shortwall:	; 2 bytes @ 0x47
	ds	2
	global	main@a
main@a:	; 2 bytes @ 0x49
	ds	2
	global	main@choice
main@choice:	; 1 bytes @ 0x4B
	ds	1
;;Data sizes: Strings 147, constant 10, data 13, bss 97, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80     76      80
;; BANK1           80      0      73
;; BANK3           96      0      32
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?i1___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?_abs	int  size(1) Largest target is 0
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
;;		 -> STR_13(CODE[13]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;;		 -> UpdateDisplay@LCDOutput(BANK0[16]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK0[2]), 
;;
;; S8211$_cp	PTR const unsigned char  size(1) Largest target is 0
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
;;		 -> STR_19(CODE[9]), STR_18(CODE[16]), STR_17(CODE[4]), STR_16(CODE[8]), 
;;		 -> STR_15(CODE[4]), STR_14(CODE[16]), UpdateDisplay@LCDOutput(BANK0[16]), STR_12(CODE[4]), 
;;		 -> STR_11(CODE[4]), STR_10(CODE[4]), STR_9(CODE[4]), STR_8(CODE[4]), 
;;		 -> STR_7(CODE[4]), STR_6(CODE[9]), STR_5(CODE[9]), STR_4(CODE[8]), 
;;		 -> STR_3(CODE[9]), STR_2(CODE[9]), STR_1(CODE[9]), 
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
;;   _robotFollow->_UpdateDisplay
;;   _robotMoveSpeed->_UpdateDisplay
;;   _robotTurnSpeed->_UpdateDisplay
;;   _calibrateIR->_UpdateDisplay
;;   _UpdateDisplay->_sprintf
;;   _readAvgDistance->_ADCconvert
;;   _readDistance->_adc_read_channel
;;   _robot_read->_ser_putch
;;   _robot_read->_ser_getch
;;   _lcd_init->_lcd_write_control
;;   _lcd_write_string->___awmod
;;   _lcd_set_cursor->_lcd_write_control
;;   _abs->___wmul
;;   _robotTurn->_ser_putch
;;   _RobotDrive->_ser_putch
;;   _sprintf->___lwmod
;;   _ADCconvert->___lwdiv
;;   _rotate->_spi_transfer
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
;; (0) _main                                                 8     8      0   11087
;;                                             68 BANK0      8     8      0
;;                               _init
;;                         _robot_read
;;                    _readAvgDistance
;;                      _UpdateDisplay
;;                               _Menu
;;                        _calibrateIR
;;                     _robotTurnSpeed
;;                     _robotMoveSpeed
;;                        _robotFollow
;;                         _ChargeMode
;; ---------------------------------------------------------------------------------
;; (1) _ChargeMode                                           1     1      0    1305
;;                                             57 BANK0      1     1      0
;;                          _ser_putch
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (1) _robotFollow                                         11     5      6    2690
;;                                             57 BANK0     11     5      6
;;                         _RobotDrive
;;                    _readAvgDistance
;;                         _robot_read
;;                      _UpdateDisplay
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (1) _robotMoveSpeed                                       9     5      4    1867
;;                                             57 BANK0      9     5      4
;;                         _RobotDrive
;;                         _robot_read
;;                      _UpdateDisplay
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (1) _robotTurnSpeed                                       9     5      4    1710
;;                                             57 BANK0      9     5      4
;;                          _robotTurn
;;                         _robot_read
;;                      _UpdateDisplay
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (1) _calibrateIR                                          0     0      0    1381
;;                             _rotate
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (2) _UpdateDisplay                                       20    20      0    1283
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
;; (2) _robot_read                                           3     3      0     111
;;                                              2 BANK0      3     3      0
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
;; (2) _RobotDrive                                           9     5      4     202
;;                                              2 BANK0      9     5      4
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
;; (2) _rotate                                               7     4      3      98
;;                                              3 BANK0      7     4      3
;;                       _spi_transfer
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
;; (3) _spi_transfer                                         3     3      0      30
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _ser_putch                                            2     2      0      22
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
;;   _robotMoveSpeed
;;     _RobotDrive
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
;;   _robotFollow
;;     _RobotDrive
;;       _ser_putch
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
;;   _ChargeMode
;;     _ser_putch
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
;;BANK1               50      0      49       7       91.3%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      D2      12        0.0%
;;ABS                  0      0      C7       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       B       2        0.0%
;;BANK0               50     4C      50       5      100.0%
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
;;  a               2   73[BANK0 ] int 
;;  shortwall       2   71[BANK0 ] int 
;;  choice          1   75[BANK0 ] unsigned char 
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
;;      Locals:         0       5       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_init
;;		_robot_read
;;		_readAvgDistance
;;		_UpdateDisplay
;;		_Menu
;;		_calibrateIR
;;		_robotTurnSpeed
;;		_robotMoveSpeed
;;		_robotFollow
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
	
l11290:	
;Main.c: 173: unsigned char choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	line	174
	
l11292:	
;Main.c: 174: int shortwall = 0;
	clrf	(main@shortwall)
	clrf	(main@shortwall+1)
	line	177
	
l11294:	
;Main.c: 177: init();
	fcall	_init
	goto	l11296
	line	180
;Main.c: 180: while(1)
	
l2232:	
	line	182
	
l11296:	
;Main.c: 181: {
;Main.c: 182: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u4871
	goto	u4870
u4871:
	goto	l11306
u4870:
	line	184
	
l11298:	
;Main.c: 183: {
;Main.c: 184: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	185
	
l11300:	
;Main.c: 185: robot_read(2);
	movlw	(02h)
	fcall	_robot_read
	line	186
	
l11302:	
;Main.c: 186: readAvgDistance();
	fcall	_readAvgDistance
	line	187
	
l11304:	
;Main.c: 187: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11306
	line	188
	
l2233:	
	line	189
	
l11306:	
;Main.c: 188: }
;Main.c: 189: if (buttonPressed)
	movf	(_buttonPressed),w	;volatile
	skipz
	goto	u4880
	goto	l11364
u4880:
	line	192
	
l11308:	
;Main.c: 191: {
;Main.c: 192: choice = Menu(buttonPressed);
	movf	(_buttonPressed),w	;volatile
	fcall	_Menu
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	line	193
	
l11310:	
;Main.c: 193: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	goto	l11364
	line	194
	
l2234:	
	line	198
;Main.c: 194: }
;Main.c: 198: switch (choice)
	goto	l11364
	line	200
;Main.c: 199: {
;Main.c: 200: case 0:
	
l2236:	
	line	201
	
l11312:	
;Main.c: 201: calibrateIR();
	fcall	_calibrateIR
	line	202
;Main.c: 202: break;
	goto	l11366
	line	203
;Main.c: 203: case 1:
	
l2238:	
	line	209
;Main.c: 209: break;
	goto	l11366
	line	210
;Main.c: 210: case 2:
	
l2239:	
	line	215
	
l11314:	
;Main.c: 215: robotTurnSpeed(-90,400);
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
	line	216
;Main.c: 216: readAvgDistance();
	fcall	_readAvgDistance
	line	217
	
l11316:	
;Main.c: 217: int a = adcVal;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(main@a+1)	;volatile
	addwf	(main@a+1)	;volatile
	movf	(_adcVal),w	;volatile
	clrf	(main@a)	;volatile
	addwf	(main@a)	;volatile

	line	218
	
l11318:	
;Main.c: 218: robotMoveSpeed(1500 - a,400);
	comf	(main@a),w
	movwf	(??_main+0)+0
	comf	(main@a+1),w
	movwf	((??_main+0)+0+1)
	incf	(??_main+0)+0,f
	skipnz
	incf	((??_main+0)+0+1),f
	movf	0+(??_main+0)+0,w
	addlw	low(05DCh)
	movwf	(?_robotMoveSpeed)
	movf	1+(??_main+0)+0,w
	skipnc
	addlw	1
	addlw	high(05DCh)
	movwf	1+(?_robotMoveSpeed)
	movlw	low(0190h)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	220
	
l11320:	
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
	
l11322:	
;Main.c: 221: robotMoveSpeed(4000,400);
	movlw	low(0FA0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(0FA0h)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	223
	
l11324:	
;Main.c: 223: robotTurnSpeed(90,400);
	movlw	low(05Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(05Ah)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	224
	
l11326:	
;Main.c: 224: robotMoveSpeed(1000,400);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(03E8h)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	225
	
l11328:	
;Main.c: 225: robotTurnSpeed(90,400);
	movlw	low(05Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(05Ah)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	226
	
l11330:	
;Main.c: 226: robotMoveSpeed(1000,400);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(03E8h)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	229
;Main.c: 229: break;
	goto	l11366
	line	230
;Main.c: 230: case 3:
	
l2240:	
	line	237
	
l11332:	
;Main.c: 237: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u4907:
	decfsz	((??_main+0)+0),f
	goto	u4907
	decfsz	((??_main+0)+0+1),f
	goto	u4907
	decfsz	((??_main+0)+0+2),f
	goto	u4907
	nop2
opt asmopt_on

	line	238
	
l11334:	
;Main.c: 238: robotMoveSpeed(1000,400);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(03E8h)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	239
	
l11336:	
;Main.c: 239: robotTurnSpeed(80,200);
	movlw	low(050h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(050h)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0C8h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0C8h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	240
	
l11338:	
;Main.c: 240: robotMoveSpeed(1000,400);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(03E8h)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	241
	
l11340:	
;Main.c: 241: robotTurnSpeed(80,200);
	movlw	low(050h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(050h)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0C8h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0C8h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	242
	
l11342:	
;Main.c: 242: robotMoveSpeed(2000,400);
	movlw	low(07D0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(07D0h)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	243
	
l11344:	
;Main.c: 243: robotTurnSpeed(-80,200);
	movlw	low(-80)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(-80)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0C8h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0C8h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	244
;Main.c: 244: break;
	goto	l11366
	line	245
;Main.c: 245: case 4:
	
l2241:	
	line	246
;Main.c: 246: while (ROBOTerror != 1)
	goto	l11358
	
l2243:	
	line	248
;Main.c: 247: {
;Main.c: 248: switch (ROBOTerror)
	goto	l11356
	line	250
;Main.c: 249: {
;Main.c: 250: case 0:
	
l2245:	
	line	251
	
l11346:	
;Main.c: 251: robotFollow(1000, 300, adcVal);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(03E8h)
	movwf	((?_robotFollow))+1
	movlw	low(012Ch)
	movwf	0+(?_robotFollow)+02h
	movlw	high(012Ch)
	movwf	(0+(?_robotFollow)+02h)+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?_robotFollow)+04h
	addwf	1+(?_robotFollow)+04h
	movf	(_adcVal),w	;volatile
	clrf	0+(?_robotFollow)+04h
	addwf	0+(?_robotFollow)+04h

	fcall	_robotFollow
	line	252
;Main.c: 252: break;
	goto	l11358
	line	253
;Main.c: 253: case 1:
	
l2247:	
	line	255
;Main.c: 255: break;
	goto	l11358
	line	256
;Main.c: 256: case 10:
	
l2248:	
	line	257
	
l11348:	
;Main.c: 257: robotTurnSpeed(90,400);
	movlw	low(05Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurnSpeed)
	movlw	high(05Ah)
	movwf	((?_robotTurnSpeed))+1
	movlw	low(0190h)
	movwf	0+(?_robotTurnSpeed)+02h
	movlw	high(0190h)
	movwf	(0+(?_robotTurnSpeed)+02h)+1
	fcall	_robotTurnSpeed
	line	259
;Main.c: 259: readAvgDistance();
	fcall	_readAvgDistance
	line	260
;Main.c: 260: robotFollow(1000, 300, adcVal - 10);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(03E8h)
	movwf	((?_robotFollow))+1
	movlw	low(012Ch)
	movwf	0+(?_robotFollow)+02h
	movlw	high(012Ch)
	movwf	(0+(?_robotFollow)+02h)+1
	movf	(_adcVal),w	;volatile
	addlw	low(-10)
	movwf	0+(?_robotFollow)+04h
	movf	(_adcVal+1),w	;volatile
	skipnc
	addlw	1
	addlw	high(-10)
	movwf	1+0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	261
;Main.c: 261: break;
	goto	l11358
	line	262
;Main.c: 262: case 11:
	
l2249:	
	line	264
	
l11350:	
;Main.c: 264: robotMoveSpeed(700,300);
	movlw	low(02BCh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMoveSpeed)
	movlw	high(02BCh)
	movwf	((?_robotMoveSpeed))+1
	movlw	low(012Ch)
	movwf	0+(?_robotMoveSpeed)+02h
	movlw	high(012Ch)
	movwf	(0+(?_robotMoveSpeed)+02h)+1
	fcall	_robotMoveSpeed
	line	265
;Main.c: 265: robotTurnSpeed(-90,400);
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
	line	266
;Main.c: 266: readAvgDistance();
	fcall	_readAvgDistance
	line	267
;Main.c: 267: robotFollow(1000, 300, adcVal - 10);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(03E8h)
	movwf	((?_robotFollow))+1
	movlw	low(012Ch)
	movwf	0+(?_robotFollow)+02h
	movlw	high(012Ch)
	movwf	(0+(?_robotFollow)+02h)+1
	movf	(_adcVal),w	;volatile
	addlw	low(-10)
	movwf	0+(?_robotFollow)+04h
	movf	(_adcVal+1),w	;volatile
	skipnc
	addlw	1
	addlw	high(-10)
	movwf	1+0+(?_robotFollow)+04h
	fcall	_robotFollow
	line	268
;Main.c: 268: break;
	goto	l11358
	line	269
;Main.c: 269: default:
	
l2250:	
	line	270
	
l11352:	
;Main.c: 270: robotFollow(1000, 300, adcVal);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotFollow)
	movlw	high(03E8h)
	movwf	((?_robotFollow))+1
	movlw	low(012Ch)
	movwf	0+(?_robotFollow)+02h
	movlw	high(012Ch)
	movwf	(0+(?_robotFollow)+02h)+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?_robotFollow)+04h
	addwf	1+(?_robotFollow)+04h
	movf	(_adcVal),w	;volatile
	clrf	0+(?_robotFollow)+04h
	addwf	0+(?_robotFollow)+04h

	fcall	_robotFollow
	line	271
;Main.c: 271: break;
	goto	l11358
	line	273
	
l11354:	
;Main.c: 273: }
	goto	l11358
	line	248
	
l2244:	
	
l11356:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 11
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           44     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            16     6 (fixed)
; spacedrange           30     9 (fixed)
; locatedrange          12     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l11346
	xorlw	1^0	; case 1
	skipnz
	goto	l11358
	xorlw	10^1	; case 10
	skipnz
	goto	l11348
	xorlw	11^10	; case 11
	skipnz
	goto	l11350
	goto	l11352
	opt asmopt_on

	line	273
	
l2246:	
	goto	l11358
	line	274
	
l2242:	
	line	246
	
l11358:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ROBOTerror)^080h,w
	xorlw	01h
	skipz
	goto	u4891
	goto	u4890
u4891:
	goto	l11356
u4890:
	goto	l11366
	
l2251:	
	line	275
;Main.c: 274: }
;Main.c: 275: break;
	goto	l11366
	line	277
;Main.c: 277: case 5:
	
l2252:	
	line	278
	
l11360:	
;Main.c: 278: ChargeMode();
	fcall	_ChargeMode
	line	279
;Main.c: 279: break;
	goto	l11366
	line	280
;Main.c: 280: default:
	
l2253:	
	line	282
;Main.c: 282: break;
	goto	l11366
	line	283
	
l11362:	
;Main.c: 283: }
	goto	l11366
	line	198
	
l2235:	
	
l11364:	
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
	goto	l11312
	xorlw	1^0	; case 1
	skipnz
	goto	l11366
	xorlw	2^1	; case 2
	skipnz
	goto	l11314
	xorlw	3^2	; case 3
	skipnz
	goto	l11332
	xorlw	4^3	; case 4
	skipnz
	goto	l11358
	xorlw	5^4	; case 5
	skipnz
	goto	l11360
	goto	l11366
	opt asmopt_on

	line	283
	
l2237:	
	line	284
	
l11366:	
;Main.c: 284: choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	goto	l11296
	line	285
	
l2254:	
	line	180
	goto	l11296
	
l2255:	
	line	286
	
l2256:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_ChargeMode
psect	text972,local,class=CODE,delta=2
global __ptext972
__ptext972:

;; *************** function _ChargeMode *****************
;; Defined at:
;;		line 433 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;		_UpdateDisplay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text972
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	433
	global	__size_of_ChargeMode
	__size_of_ChargeMode	equ	__end_of_ChargeMode-_ChargeMode
	
_ChargeMode:	
	opt	stack 1
; Regs used in _ChargeMode: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	435
	
l11268:	
;Main.c: 435: currentMenu = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ChargeMode+0)+0
	movf	(??_ChargeMode+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_currentMenu)^080h	;volatile
	line	436
	
l11270:	
;Main.c: 436: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	goto	l11272
	line	438
;Main.c: 438: while (1)
	
l2277:	
	line	440
	
l11272:	
;Main.c: 439: {
;Main.c: 440: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u4861
	goto	u4860
u4861:
	goto	l11288
u4860:
	line	442
	
l11274:	
;Main.c: 441: {
;Main.c: 442: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	443
	
l11276:	
;Main.c: 443: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11288
	line	444
	
l2278:	
	line	445
;Main.c: 444: }
;Main.c: 445: switch (buttonPressed)
	goto	l11288
	line	447
;Main.c: 446: {
;Main.c: 447: case 1:
	
l2280:	
	line	448
;Main.c: 448: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	449
;Main.c: 449: break;
	goto	l11272
	line	450
;Main.c: 450: case 2:
	
l2282:	
	line	451
;Main.c: 451: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	452
;Main.c: 452: break;
	goto	l11272
	line	453
;Main.c: 453: case 3:
	
l2283:	
	line	454
;Main.c: 454: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	455
;Main.c: 455: break;
	goto	l11272
	line	456
;Main.c: 456: case 4:
	
l2284:	
	line	457
;Main.c: 457: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	458
;Main.c: 458: break;
	goto	l11272
	line	459
;Main.c: 459: case 5:
	
l2285:	
	line	460
	
l11278:	
;Main.c: 460: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	461
	
l11280:	
;Main.c: 461: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	462
	
l11282:	
;Main.c: 462: currentMenu = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h	;volatile
	goto	l2286
	line	463
	
l11284:	
;Main.c: 463: return;
	goto	l2286
	line	464
;Main.c: 464: default:
	
l2287:	
	line	465
;Main.c: 465: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	466
;Main.c: 466: break;
	goto	l11272
	line	467
	
l11286:	
;Main.c: 467: }
	goto	l11272
	line	445
	
l2279:	
	
l11288:	
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
	goto	l2280
	xorlw	2^1	; case 2
	skipnz
	goto	l2282
	xorlw	3^2	; case 3
	skipnz
	goto	l2283
	xorlw	4^3	; case 4
	skipnz
	goto	l2284
	xorlw	5^4	; case 5
	skipnz
	goto	l11278
	goto	l2287
	opt asmopt_on

	line	467
	
l2281:	
	goto	l11272
	line	468
	
l2288:	
	line	438
	goto	l11272
	
l2289:	
	line	469
	
l2286:	
	return
	opt stack 0
GLOBAL	__end_of_ChargeMode
	__end_of_ChargeMode:
;; =============== function _ChargeMode ends ============

	signat	_ChargeMode,88
	global	_robotFollow
psect	text973,local,class=CODE,delta=2
global __ptext973
__ptext973:

;; *************** function _robotFollow *****************
;; Defined at:
;;		line 156 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  distance        2   57[BANK0 ] int 
;;  speed           2   59[BANK0 ] int 
;;  AdcTarget       2   61[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   66[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      11       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_RobotDrive
;;		_readAvgDistance
;;		_robot_read
;;		_UpdateDisplay
;;		_abs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text973
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	156
	global	__size_of_robotFollow
	__size_of_robotFollow	equ	__end_of_robotFollow-_robotFollow
	
_robotFollow:	
	opt	stack 0
; Regs used in _robotFollow: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	157
	
l11210:	
;robot.c: 157: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	159
	
l11212:	
;robot.c: 158: int temp1;
;robot.c: 159: RobotDrive(speed, 0x7FFF);
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
	line	160
	
l11214:	
;robot.c: 160: ROBOTerror = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	line	163
;robot.c: 163: while (abs(distTravelled) < abs(distance))
	goto	l11264
	
l6055:	
	line	166
	
l11216:	
;robot.c: 164: {
;robot.c: 166: readAvgDistance();
	fcall	_readAvgDistance
	line	167
	
l11218:	
;robot.c: 167: if (adcVal > (AdcTarget + 5) && adcVal < (AdcTarget + 30))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget),w
	addlw	low(05h)
	movwf	(??_robotFollow+0)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(05h)
	movwf	1+(??_robotFollow+0)+0
	movf	(_adcVal+1),w	;volatile
	subwf	1+(??_robotFollow+0)+0,w
	skipz
	goto	u4775
	movf	(_adcVal),w	;volatile
	subwf	0+(??_robotFollow+0)+0,w
u4775:
	skipnc
	goto	u4771
	goto	u4770
u4771:
	goto	l11224
u4770:
	
l11220:	
	movf	(robotFollow@AdcTarget),w
	addlw	low(01Eh)
	movwf	(??_robotFollow+0)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(01Eh)
	movwf	1+(??_robotFollow+0)+0
	movf	1+(??_robotFollow+0)+0,w
	subwf	(_adcVal+1),w	;volatile
	skipz
	goto	u4785
	movf	0+(??_robotFollow+0)+0,w
	subwf	(_adcVal),w	;volatile
u4785:
	skipnc
	goto	u4781
	goto	u4780
u4781:
	goto	l11224
u4780:
	line	169
	
l11222:	
;robot.c: 168: {
;robot.c: 169: RobotDrive(speed, 1800);
	movf	(robotFollow@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robotFollow@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(0708h)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(0708h)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	170
;robot.c: 170: }
	goto	l6057
	line	171
	
l6056:	
	
l11224:	
;robot.c: 171: else if (adcVal < (AdcTarget - 5) && adcVal > (AdcTarget - 30))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget),w
	addlw	low(0FFFBh)
	movwf	(??_robotFollow+0)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0FFFBh)
	movwf	1+(??_robotFollow+0)+0
	movf	1+(??_robotFollow+0)+0,w
	subwf	(_adcVal+1),w	;volatile
	skipz
	goto	u4795
	movf	0+(??_robotFollow+0)+0,w
	subwf	(_adcVal),w	;volatile
u4795:
	skipnc
	goto	u4791
	goto	u4790
u4791:
	goto	l11230
u4790:
	
l11226:	
	movf	(robotFollow@AdcTarget),w
	addlw	low(0FFE2h)
	movwf	(??_robotFollow+0)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0FFE2h)
	movwf	1+(??_robotFollow+0)+0
	movf	(_adcVal+1),w	;volatile
	subwf	1+(??_robotFollow+0)+0,w
	skipz
	goto	u4805
	movf	(_adcVal),w	;volatile
	subwf	0+(??_robotFollow+0)+0,w
u4805:
	skipnc
	goto	u4801
	goto	u4800
u4801:
	goto	l11230
u4800:
	line	173
	
l11228:	
;robot.c: 172: {
;robot.c: 173: RobotDrive(speed, -1800);
	movf	(robotFollow@speed+1),w
	clrf	(?_RobotDrive+1)
	addwf	(?_RobotDrive+1)
	movf	(robotFollow@speed),w
	clrf	(?_RobotDrive)
	addwf	(?_RobotDrive)

	movlw	low(-1800)
	movwf	0+(?_RobotDrive)+02h
	movlw	high(-1800)
	movwf	(0+(?_RobotDrive)+02h)+1
	fcall	_RobotDrive
	line	174
;robot.c: 174: }
	goto	l6057
	line	175
	
l6058:	
	
l11230:	
;robot.c: 175: else if (adcVal <= (AdcTarget - 30))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotFollow@AdcTarget),w
	addlw	low(0FFE2h)
	movwf	(??_robotFollow+0)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(0FFE2h)
	movwf	1+(??_robotFollow+0)+0
	movf	(_adcVal+1),w	;volatile
	subwf	1+(??_robotFollow+0)+0,w
	skipz
	goto	u4815
	movf	(_adcVal),w	;volatile
	subwf	0+(??_robotFollow+0)+0,w
u4815:
	skipc
	goto	u4811
	goto	u4810
u4811:
	goto	l11236
u4810:
	line	177
	
l11232:	
;robot.c: 176: {
;robot.c: 177: ROBOTerror = 10;
	movlw	(0Ah)
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	178
;robot.c: 178: break;
	goto	l11266
	line	179
	
l11234:	
;robot.c: 179: }
	goto	l6057
	line	180
	
l6060:	
	
l11236:	
;robot.c: 180: else if (adcVal >= (AdcTarget + 30))
	bcf	status, 5	;RP0=0, select bank0
	movf	(robotFollow@AdcTarget),w
	addlw	low(01Eh)
	movwf	(??_robotFollow+0)+0
	movf	(robotFollow@AdcTarget+1),w
	skipnc
	addlw	1
	addlw	high(01Eh)
	movwf	1+(??_robotFollow+0)+0
	movf	1+(??_robotFollow+0)+0,w
	subwf	(_adcVal+1),w	;volatile
	skipz
	goto	u4825
	movf	0+(??_robotFollow+0)+0,w
	subwf	(_adcVal),w	;volatile
u4825:
	skipc
	goto	u4821
	goto	u4820
u4821:
	goto	l11242
u4820:
	line	182
	
l11238:	
;robot.c: 181: {
;robot.c: 182: ROBOTerror = 11;
	movlw	(0Bh)
	movwf	(??_robotFollow+0)+0
	movf	(??_robotFollow+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ROBOTerror)^080h
	line	183
;robot.c: 183: break;
	goto	l11266
	line	184
	
l11240:	
;robot.c: 184: }
	goto	l6057
	line	185
	
l6063:	
	line	187
	
l11242:	
;robot.c: 185: else
;robot.c: 186: {
;robot.c: 187: RobotDrive(speed, 0x7FFF);
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
	goto	l6057
	line	188
	
l6064:	
	goto	l6057
	
l6062:	
	goto	l6057
	
l6059:	
	
l6057:	
	line	189
;robot.c: 188: }
;robot.c: 189: robot_read(0);
	movlw	(0)
	fcall	_robot_read
	line	190
	
l11244:	
;robot.c: 190: if (BumpSensors || VwallSensor)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_BumpSensors),f
	skipz	;volatile
	goto	u4831
	goto	u4830
u4831:
	goto	l11248
u4830:
	
l11246:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u4840
	goto	l11250
u4840:
	goto	l11248
	
l6067:	
	line	192
	
l11248:	
;robot.c: 191: {
;robot.c: 192: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	193
;robot.c: 193: break;
	goto	l11266
	line	194
	
l6065:	
	line	195
	
l11250:	
;robot.c: 194: }
;robot.c: 195: temp1 = DistHighByte;
	movf	(_DistHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotFollow+0)+0
	clrf	(??_robotFollow+0)+0+1
	movf	0+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1)
	movf	1+(??_robotFollow+0)+0,w
	movwf	(robotFollow@temp1+1)
	line	196
	
l11252:	
;robot.c: 196: temp1 = temp1 << 8;
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
	line	197
	
l11254:	
;robot.c: 197: temp1 += DistLowByte;
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
	line	198
	
l11256:	
;robot.c: 198: distTravelled += temp1;
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
	line	199
	
l11258:	
;robot.c: 199: TotalDistTravelled += temp1;
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
	line	200
	
l11260:	
;robot.c: 200: Disp2 = distTravelled;
	movf	(_distTravelled+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_distTravelled)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	201
	
l11262:	
;robot.c: 201: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11264
	line	207
	
l6054:	
	line	163
	
l11264:	
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
	movwf	(??_robotFollow+0)+0
	movf	(1+?_abs),w
	movwf	((??_robotFollow+0)+0+1)
	movf	(robotFollow@distance+1),w
	clrf	(?_abs+1)
	addwf	(?_abs+1)
	movf	(robotFollow@distance),w
	clrf	(?_abs)
	addwf	(?_abs)

	fcall	_abs
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_robotFollow+0)+0,w
	xorlw	80h
	movwf	(??_robotFollow+2)+0
	movf	(1+(?_abs)),w
	xorlw	80h
	subwf	(??_robotFollow+2)+0,w
	skipz
	goto	u4855
	movf	(0+(?_abs)),w
	subwf	0+(??_robotFollow+0)+0,w
u4855:

	skipc
	goto	u4851
	goto	u4850
u4851:
	goto	l11216
u4850:
	goto	l11266
	
l6061:	
	line	209
	
l11266:	
;robot.c: 207: }
;robot.c: 209: RobotDrive(0, 0x7FFF);
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
	line	211
	
l6068:	
	return
	opt stack 0
GLOBAL	__end_of_robotFollow
	__end_of_robotFollow:
;; =============== function _robotFollow ends ============

	signat	_robotFollow,12408
	global	_robotMoveSpeed
psect	text974,local,class=CODE,delta=2
global __ptext974
__ptext974:

;; *************** function _robotMoveSpeed *****************
;; Defined at:
;;		line 218 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text974
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	218
	global	__size_of_robotMoveSpeed
	__size_of_robotMoveSpeed	equ	__end_of_robotMoveSpeed-_robotMoveSpeed
	
_robotMoveSpeed:	
	opt	stack 1
; Regs used in _robotMoveSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	219
	
l11180:	
;robot.c: 219: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	221
	
l11182:	
;robot.c: 220: int temp1;
;robot.c: 221: RobotDrive(speed, 0x7FFF);
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
	line	224
;robot.c: 224: while (abs(distTravelled) < abs(distance))
	goto	l11206
	
l6072:	
	line	226
	
l11184:	
;robot.c: 225: {
;robot.c: 226: robot_read(0);
	movlw	(0)
	fcall	_robot_read
	line	227
	
l11186:	
;robot.c: 227: if (BumpSensors || VwallSensor)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_BumpSensors),f
	skipz	;volatile
	goto	u4741
	goto	u4740
u4741:
	goto	l11190
u4740:
	
l11188:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u4750
	goto	l11192
u4750:
	goto	l11190
	
l6075:	
	line	229
	
l11190:	
;robot.c: 228: {
;robot.c: 229: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	230
;robot.c: 230: break;
	goto	l11208
	line	231
	
l6073:	
	line	232
	
l11192:	
;robot.c: 231: }
;robot.c: 232: temp1 = DistHighByte;
	movf	(_DistHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	clrf	(??_robotMoveSpeed+0)+0+1
	movf	0+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1)
	movf	1+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1+1)
	line	233
	
l11194:	
;robot.c: 233: temp1 = temp1 << 8;
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
	line	234
	
l11196:	
;robot.c: 234: temp1 += DistLowByte;
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
	line	235
	
l11198:	
;robot.c: 235: distTravelled += temp1;
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
	line	236
	
l11200:	
;robot.c: 236: TotalDistTravelled += temp1;
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
	line	237
	
l11202:	
;robot.c: 237: Disp2 = distTravelled;
	movf	(_distTravelled+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_distTravelled)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	238
	
l11204:	
;robot.c: 238: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11206
	line	244
	
l6071:	
	line	224
	
l11206:	
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
	goto	u4765
	movf	(0+(?_abs)),w
	subwf	0+(??_robotMoveSpeed+0)+0,w
u4765:

	skipc
	goto	u4761
	goto	u4760
u4761:
	goto	l11184
u4760:
	goto	l11208
	
l6076:	
	line	246
	
l11208:	
;robot.c: 244: }
;robot.c: 246: RobotDrive(0, 0x7FFF);
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
	
l6077:	
	return
	opt stack 0
GLOBAL	__end_of_robotMoveSpeed
	__end_of_robotMoveSpeed:
;; =============== function _robotMoveSpeed ends ============

	signat	_robotMoveSpeed,8312
	global	_robotTurnSpeed
psect	text975,local,class=CODE,delta=2
global __ptext975
__ptext975:

;; *************** function _robotTurnSpeed *****************
;; Defined at:
;;		line 255 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text975
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	255
	global	__size_of_robotTurnSpeed
	__size_of_robotTurnSpeed	equ	__end_of_robotTurnSpeed-_robotTurnSpeed
	
_robotTurnSpeed:	
	opt	stack 1
; Regs used in _robotTurnSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	256
	
l11152:	
;robot.c: 256: angleTurned = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_angleTurned)^080h
	clrf	(_angleTurned+1)^080h
	line	257
;robot.c: 257: int temp1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(robotTurnSpeed@temp1)
	clrf	(robotTurnSpeed@temp1+1)
	line	259
	
l11154:	
;robot.c: 259: robotTurn(angle);
	movf	(robotTurnSpeed@angle+1),w
	clrf	(?_robotTurn+1)
	addwf	(?_robotTurn+1)
	movf	(robotTurnSpeed@angle),w
	clrf	(?_robotTurn)
	addwf	(?_robotTurn)

	fcall	_robotTurn
	line	262
;robot.c: 262: while (abs(angleTurned) < abs(angle))
	goto	l11176
	
l6081:	
	line	264
	
l11156:	
;robot.c: 263: {
;robot.c: 264: robot_read(1);
	movlw	(01h)
	fcall	_robot_read
	line	265
	
l11158:	
;robot.c: 265: if (BumpSensors || VwallSensor)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_BumpSensors),f
	skipz	;volatile
	goto	u4711
	goto	u4710
u4711:
	goto	l11162
u4710:
	
l11160:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_VwallSensor)^080h,w	;volatile
	skipz
	goto	u4720
	goto	l11164
u4720:
	goto	l11162
	
l6084:	
	line	267
	
l11162:	
;robot.c: 266: {
;robot.c: 267: ROBOTerror = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_ROBOTerror)^080h
	bsf	status,0
	rlf	(_ROBOTerror)^080h,f
	line	268
;robot.c: 268: break;
	goto	l11178
	line	269
	
l6082:	
	line	270
	
l11164:	
;robot.c: 269: }
;robot.c: 270: temp1 = AngleHighByte;
	movf	(_AngleHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotTurnSpeed+0)+0
	clrf	(??_robotTurnSpeed+0)+0+1
	movf	0+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1)
	movf	1+(??_robotTurnSpeed+0)+0,w
	movwf	(robotTurnSpeed@temp1+1)
	line	271
	
l11166:	
;robot.c: 271: temp1 = temp1 << 8;
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
	line	272
	
l11168:	
;robot.c: 272: temp1 += AngleLowByte;
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
	line	273
	
l11170:	
;robot.c: 273: angleTurned += temp1;
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
	line	274
	
l11172:	
;robot.c: 274: Disp2 = angleTurned;
	movf	(_angleTurned+1)^080h,w
	clrf	(_Disp2+1)^080h
	addwf	(_Disp2+1)^080h
	movf	(_angleTurned)^080h,w
	clrf	(_Disp2)^080h
	addwf	(_Disp2)^080h

	line	275
	
l11174:	
;robot.c: 275: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11176
	line	276
	
l6080:	
	line	262
	
l11176:	
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
	goto	u4735
	movf	(0+(?_abs)),w
	subwf	0+(??_robotTurnSpeed+0)+0,w
u4735:

	skipc
	goto	u4731
	goto	u4730
u4731:
	goto	l11156
u4730:
	goto	l11178
	
l6085:	
	line	278
	
l11178:	
;robot.c: 276: }
;robot.c: 278: robotTurn(0);
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurn)
	movlw	high(0)
	movwf	((?_robotTurn))+1
	fcall	_robotTurn
	line	279
	
l6086:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurnSpeed
	__end_of_robotTurnSpeed:
;; =============== function _robotTurnSpeed ends ============

	signat	_robotTurnSpeed,8312
	global	_calibrateIR
psect	text976,local,class=CODE,delta=2
global __ptext976
__ptext976:

;; *************** function _calibrateIR *****************
;; Defined at:
;;		line 393 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;; This function uses a non-reentrant model
;;
psect	text976
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	393
	global	__size_of_calibrateIR
	__size_of_calibrateIR	equ	__end_of_calibrateIR-_calibrateIR
	
_calibrateIR:	
	opt	stack 1
; Regs used in _calibrateIR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	394
	
l11122:	
;Main.c: 394: currentMenu = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h	;volatile
	bsf	status,0
	rlf	(_currentMenu)^080h,f	;volatile
	line	395
	
l11124:	
;Main.c: 395: rotate(8, 0);
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(08h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	goto	l11126
	line	396
;Main.c: 396: while (1)
	
l2262:	
	line	398
	
l11126:	
;Main.c: 397: {
;Main.c: 398: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u4701
	goto	u4700
u4701:
	goto	l11150
u4700:
	line	400
	
l11128:	
;Main.c: 399: {
;Main.c: 400: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	401
	
l11130:	
;Main.c: 401: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11150
	line	402
	
l2263:	
	line	403
;Main.c: 402: }
;Main.c: 403: switch (buttonPressed)
	goto	l11150
	line	405
;Main.c: 404: {
;Main.c: 405: case 1:
	
l2265:	
	line	406
;Main.c: 406: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	407
;Main.c: 407: break;
	goto	l11126
	line	408
;Main.c: 408: case 2:
	
l2267:	
	line	409
;Main.c: 409: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	410
;Main.c: 410: break;
	goto	l11126
	line	411
;Main.c: 411: case 3:
	
l2268:	
	line	412
	
l11132:	
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
	
l11134:	
;Main.c: 413: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	414
;Main.c: 414: break;
	goto	l11126
	line	415
;Main.c: 415: case 4:
	
l2269:	
	line	416
	
l11136:	
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
	
l11138:	
;Main.c: 417: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	418
;Main.c: 418: break;
	goto	l11126
	line	419
;Main.c: 419: case 5:
	
l2270:	
	line	420
	
l11140:	
;Main.c: 420: totalSteps = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_totalSteps)^080h
	clrf	(_totalSteps+1)^080h
	line	421
	
l11142:	
;Main.c: 421: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	422
	
l11144:	
;Main.c: 422: currentMenu = 0;
	clrf	(_currentMenu)^080h	;volatile
	goto	l2271
	line	423
	
l11146:	
;Main.c: 423: return;
	goto	l2271
	line	424
;Main.c: 424: default:
	
l2272:	
	line	425
;Main.c: 425: break;
	goto	l11126
	line	426
	
l11148:	
;Main.c: 426: }
	goto	l11126
	line	403
	
l2264:	
	
l11150:	
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
	goto	l2265
	xorlw	2^1	; case 2
	skipnz
	goto	l2267
	xorlw	3^2	; case 3
	skipnz
	goto	l11132
	xorlw	4^3	; case 4
	skipnz
	goto	l11136
	xorlw	5^4	; case 5
	skipnz
	goto	l11140
	goto	l11126
	opt asmopt_on

	line	426
	
l2266:	
	goto	l11126
	line	427
	
l2273:	
	line	396
	goto	l11126
	
l2274:	
	line	428
	
l2271:	
	return
	opt stack 0
GLOBAL	__end_of_calibrateIR
	__end_of_calibrateIR:
;; =============== function _calibrateIR ends ============

	signat	_calibrateIR,88
	global	_UpdateDisplay
psect	text977,local,class=CODE,delta=2
global __ptext977
__ptext977:

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
;;		_robotMoveSpeed
;;		_robotTurnSpeed
;;		_scan360
;; This function uses a non-reentrant model
;;
psect	text977
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	236
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
	opt	stack 1
; Regs used in _UpdateDisplay: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	237
	
l11078:	
;HMI.c: 237: char LCDOutput[16] = "";
	movlw	(UpdateDisplay@LCDOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1249)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	fsr0,w
	movwf	((??_UpdateDisplay+0)+0+1)
	movlw	16
	movwf	((??_UpdateDisplay+0)+0+2)
u4680:
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
	goto	u4680
	line	238
;HMI.c: 238: switch (currentMenu)
	goto	l11120
	line	240
;HMI.c: 239: {
;HMI.c: 240: case 0:
	
l4546:	
	line	241
	
l11080:	
;HMI.c: 241: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	242
	
l11082:	
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
	
l11084:	
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
	
l11086:	
;HMI.c: 245: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	246
	
l11088:	
;HMI.c: 246: if (pos > 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4695
	movlw	low(01h)
	subwf	(_pos)^080h,w
u4695:

	skipc
	goto	u4691
	goto	u4690
u4691:
	goto	l11092
u4690:
	line	247
	
l11090:	
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
	goto	l11094
	line	248
	
l4547:	
	line	249
	
l11092:	
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
	goto	l11094
	
l4548:	
	line	250
	
l11094:	
;HMI.c: 250: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	251
	
l11096:	
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
	
l11098:	
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
	goto	l4553
	line	255
;HMI.c: 255: case 1:
	
l4550:	
	line	256
	
l11100:	
;HMI.c: 256: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	257
;HMI.c: 257: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	258
	
l11102:	
;HMI.c: 258: lcd_write_string("Zero Step_Motor");
	movlw	low((STR_14-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	259
	
l11104:	
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
	
l11106:	
;HMI.c: 261: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	262
	
l11108:	
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
	
l11110:	
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
	goto	l4553
	line	266
;HMI.c: 266: case 2:
	
l4551:	
	line	267
	
l11112:	
;HMI.c: 267: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	268
;HMI.c: 268: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	269
	
l11114:	
;HMI.c: 269: lcd_write_string(" Charging Mode ");
	movlw	low((STR_18-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	270
	
l11116:	
;HMI.c: 270: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	271
;HMI.c: 271: lcd_write_string("  EXIT  ");
	movlw	low((STR_19-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	272
;HMI.c: 272: break;
	goto	l4553
	line	273
;HMI.c: 273: default:
	
l4552:	
	line	274
;HMI.c: 274: break;
	goto	l4553
	line	275
	
l11118:	
;HMI.c: 275: }
	goto	l4553
	line	238
	
l4545:	
	
l11120:	
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
	goto	l11080
	xorlw	1^0	; case 1
	skipnz
	goto	l11100
	xorlw	2^1	; case 2
	skipnz
	goto	l11112
	goto	l4553
	opt asmopt_on

	line	275
	
l4549:	
	line	276
	
l4553:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,88
	global	_readAvgDistance
psect	text978,local,class=CODE,delta=2
global __ptext978
__ptext978:

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
;;		_scan360
;; This function uses a non-reentrant model
;;
psect	text978
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	28
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	29
	
l11060:	
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
	
l11062:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4655
	movlw	low(08h)
	subwf	(readAvgDistance@i),w
u4655:

	skipc
	goto	u4651
	goto	u4650
u4651:
	goto	l11066
u4650:
	goto	l11074
	
l11064:	
	goto	l11074
	line	33
	
l3003:	
	line	34
	
l11066:	
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
	
l11068:	
;infrared.c: 35: if (tempIR <= 1000)
	movlw	high(03E9h)
	subwf	(readAvgDistance@tempIR+1),w
	movlw	low(03E9h)
	skipnz
	subwf	(readAvgDistance@tempIR),w
	skipnc
	goto	u4661
	goto	u4660
u4661:
	goto	l3005
u4660:
	line	37
	
l11070:	
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
	
l3005:	
	line	32
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
l11072:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4675
	movlw	low(08h)
	subwf	(readAvgDistance@i),w
u4675:

	skipc
	goto	u4671
	goto	u4670
u4671:
	goto	l11066
u4670:
	goto	l11074
	
l3004:	
	line	41
	
l11074:	
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
	
l11076:	
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
	
l3006:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,88
	global	_init
psect	text979,local,class=CODE,delta=2
global __ptext979
__ptext979:

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
psect	text979
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	139
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 2
; Regs used in _init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	140
	
l11034:	
;Main.c: 140: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	142
	
l11036:	
;Main.c: 142: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	143
	
l11038:	
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
	
l11040:	
;Main.c: 146: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	147
	
l11042:	
;Main.c: 147: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	150
	
l11044:	
;Main.c: 150: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	153
	
l11046:	
;Main.c: 153: ser_init();
	fcall	_ser_init
	line	154
	
l11048:	
;Main.c: 154: init_adc();
	fcall	_init_adc
	line	155
	
l11050:	
;Main.c: 155: lcd_init();
	fcall	_lcd_init
	line	156
	
l11052:	
;Main.c: 156: robo_init();
	fcall	_robo_init
	line	160
	
l11054:	
;Main.c: 160: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	162
	
l11056:	
;Main.c: 162: PEIE=1;
	bsf	(94/8),(94)&7
	line	164
	
l11058:	
;Main.c: 164: (GIE = 1);
	bsf	(95/8),(95)&7
	line	165
	
l2229:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_readDistance
psect	text980,local,class=CODE,delta=2
global __ptext980
__ptext980:

;; *************** function _readDistance *****************
;; Defined at:
;;		line 49 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
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
psect	text980
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	49
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	52
	
l11028:	
;infrared.c: 50: unsigned int readVal;
;infrared.c: 52: readVal = adc_read_channel(0);
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
	line	54
	
l11030:	
;infrared.c: 54: return readVal;
	movf	(readDistance@readVal+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@readVal),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	l3009
	
l11032:	
	line	55
	
l3009:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_robot_read
psect	text981,local,class=CODE,delta=2
global __ptext981
__ptext981:

;; *************** function _robot_read *****************
;; Defined at:
;;		line 46 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  readType        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  readType        1    4[BANK0 ] unsigned char 
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
;;      Temps:          0       2       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ser_putch
;;		_ser_getch
;; This function is called by:
;;		_main
;;		_robotFollow
;;		_robotMoveSpeed
;;		_robotTurnSpeed
;; This function uses a non-reentrant model
;;
psect	text981
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	46
	global	__size_of_robot_read
	__size_of_robot_read	equ	__end_of_robot_read-_robot_read
	
_robot_read:	
	opt	stack 1
; Regs used in _robot_read: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;robot_read@readType stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(robot_read@readType)
	line	47
	
l10980:	
;robot.c: 47: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	48
;robot.c: 48: ser_putch(7);
	movlw	(07h)
	fcall	_ser_putch
	line	49
	
l10982:	
;robot.c: 49: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_robot_read+0)+0+1),f
	movlw	118
movwf	((??_robot_read+0)+0),f
u4917:
	decfsz	((??_robot_read+0)+0),f
	goto	u4917
	decfsz	((??_robot_read+0)+0+1),f
	goto	u4917
	clrwdt
opt asmopt_on

	line	50
	
l10984:	
;robot.c: 50: BumpSensors = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	movwf	(_BumpSensors)	;volatile
	line	51
	
l10986:	
;robot.c: 51: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	52
	
l10988:	
;robot.c: 52: ser_putch(13);
	movlw	(0Dh)
	fcall	_ser_putch
	line	53
;robot.c: 53: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_robot_read+0)+0+1),f
	movlw	118
movwf	((??_robot_read+0)+0),f
u4927:
	decfsz	((??_robot_read+0)+0),f
	goto	u4927
	decfsz	((??_robot_read+0)+0+1),f
	goto	u4927
	clrwdt
opt asmopt_on

	line	54
	
l10990:	
;robot.c: 54: VwallSensor = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_VwallSensor)^080h	;volatile
	line	56
	
l10992:	
;robot.c: 56: if (readType == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robot_read@readType),f
	skipz
	goto	u4621
	goto	u4620
u4621:
	goto	l11002
u4620:
	line	58
	
l10994:	
;robot.c: 57: {
;robot.c: 58: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	59
;robot.c: 59: ser_putch(19);
	movlw	(013h)
	fcall	_ser_putch
	line	60
	
l10996:	
;robot.c: 60: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_robot_read+0)+0+1),f
	movlw	118
movwf	((??_robot_read+0)+0),f
u4937:
	decfsz	((??_robot_read+0)+0),f
	goto	u4937
	decfsz	((??_robot_read+0)+0+1),f
	goto	u4937
	clrwdt
opt asmopt_on

	line	61
	
l10998:	
;robot.c: 61: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistHighByte)^080h	;volatile
	line	62
	
l11000:	
;robot.c: 62: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	63
;robot.c: 63: }
	goto	l6041
	line	64
	
l6036:	
	
l11002:	
;robot.c: 64: else if (readType == 1)
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_read@readType),w
	xorlw	01h
	skipz
	goto	u4631
	goto	u4630
u4631:
	goto	l11012
u4630:
	line	66
	
l11004:	
;robot.c: 65: {
;robot.c: 66: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	67
;robot.c: 67: ser_putch(20);
	movlw	(014h)
	fcall	_ser_putch
	line	68
	
l11006:	
;robot.c: 68: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_robot_read+0)+0+1),f
	movlw	118
movwf	((??_robot_read+0)+0),f
u4947:
	decfsz	((??_robot_read+0)+0),f
	goto	u4947
	decfsz	((??_robot_read+0)+0+1),f
	goto	u4947
	clrwdt
opt asmopt_on

	line	69
	
l11008:	
;robot.c: 69: AngleHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleHighByte)^080h	;volatile
	line	70
	
l11010:	
;robot.c: 70: AngleLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleLowByte)^080h	;volatile
	line	71
;robot.c: 71: }
	goto	l6041
	line	72
	
l6038:	
	
l11012:	
;robot.c: 72: else if (readType == 2)
	bcf	status, 5	;RP0=0, select bank0
	movf	(robot_read@readType),w
	xorlw	02h
	skipz
	goto	u4641
	goto	u4640
u4641:
	goto	l6041
u4640:
	line	75
	
l11014:	
;robot.c: 73: {
;robot.c: 75: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	76
;robot.c: 76: ser_putch(19);
	movlw	(013h)
	fcall	_ser_putch
	line	77
	
l11016:	
;robot.c: 77: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_robot_read+0)+0+1),f
	movlw	118
movwf	((??_robot_read+0)+0),f
u4957:
	decfsz	((??_robot_read+0)+0),f
	goto	u4957
	decfsz	((??_robot_read+0)+0+1),f
	goto	u4957
	clrwdt
opt asmopt_on

	line	78
	
l11018:	
;robot.c: 78: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistHighByte)^080h	;volatile
	line	79
	
l11020:	
;robot.c: 79: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	80
	
l11022:	
;robot.c: 80: ser_putch(142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	81
	
l11024:	
;robot.c: 81: ser_putch(20);
	movlw	(014h)
	fcall	_ser_putch
	line	82
	
l11026:	
;robot.c: 82: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_robot_read+0)+0+1),f
	movlw	118
movwf	((??_robot_read+0)+0),f
u4967:
	decfsz	((??_robot_read+0)+0),f
	goto	u4967
	decfsz	((??_robot_read+0)+0+1),f
	goto	u4967
	clrwdt
opt asmopt_on

	line	83
;robot.c: 83: AngleHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleHighByte)^080h	;volatile
	line	84
;robot.c: 84: AngleLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_AngleLowByte)^080h	;volatile
	goto	l6041
	line	85
	
l6040:	
	goto	l6041
	line	86
	
l6039:	
	goto	l6041
	
l6037:	
	
l6041:	
	return
	opt stack 0
GLOBAL	__end_of_robot_read
	__end_of_robot_read:
;; =============== function _robot_read ends ============

	signat	_robot_read,4216
	global	_lcd_init
psect	text982,local,class=CODE,delta=2
global __ptext982
__ptext982:

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
psect	text982
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 2
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l10960:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l10962:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l10964:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l10966:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l10968:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l10970:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l10972:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l10974:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l10976:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l10978:	
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
psect	text983,local,class=CODE,delta=2
global __ptext983
__ptext983:

;; *************** function _lcd_write_string *****************
;; Defined at:
;;		line 48 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               2    7[BANK0 ] PTR unsigned char 
;;		 -> STR_19(9), STR_18(16), STR_17(4), STR_16(8), 
;;		 -> STR_15(4), STR_14(16), UpdateDisplay@LCDOutput(16), STR_12(4), 
;;		 -> STR_11(4), STR_10(4), STR_9(4), STR_8(4), 
;;		 -> STR_7(4), STR_6(9), STR_5(9), STR_4(8), 
;;		 -> STR_3(9), STR_2(9), STR_1(9), 
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
psect	text983
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 1
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
l10952:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	l10958
	
l1409:	
	
l10954:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
l10956:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
	goto	l10958
	
l1408:	
	
l10958:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u4611
	goto	u4610
u4611:
	goto	l10954
u4610:
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
psect	text984,local,class=CODE,delta=2
global __ptext984
__ptext984:

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
psect	text984
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
	
l10948:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
l10950:	
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
psect	text985,local,class=CODE,delta=2
global __ptext985
__ptext985:

;; *************** function _abs *****************
;; Defined at:
;;		line 284 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;;		_robotFollow
;;		_robotMoveSpeed
;;		_robotTurnSpeed
;; This function uses a non-reentrant model
;;
psect	text985
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	284
	global	__size_of_abs
	__size_of_abs	equ	__end_of_abs-_abs
	
_abs:	
	opt	stack 2
; Regs used in _abs: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	285
	
l10944:	
;robot.c: 285: return (v * ((v > 0) - (v < 0)));
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
	goto	u4605
	movlw	low(01h)
	subwf	(abs@v),w
u4605:

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

	goto	l6089
	
l10946:	
	line	286
	
l6089:	
	return
	opt stack 0
GLOBAL	__end_of_abs
	__end_of_abs:
;; =============== function _abs ends ============

	signat	_abs,4218
	global	_robotTurn
psect	text986,local,class=CODE,delta=2
global __ptext986
__ptext986:

;; *************** function _robotTurn *****************
;; Defined at:
;;		line 112 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text986
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	112
	global	__size_of_robotTurn
	__size_of_robotTurn	equ	__end_of_robotTurn-_robotTurn
	
_robotTurn:	
	opt	stack 2
; Regs used in _robotTurn: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	114
	
l10936:	
;robot.c: 114: if (angle > 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotTurn@angle+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4585
	movlw	low(01h)
	subwf	(robotTurn@angle),w
u4585:

	skipc
	goto	u4581
	goto	u4580
u4581:
	goto	l6047
u4580:
	line	116
	
l10938:	
;robot.c: 115: {
;robot.c: 116: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	118
;robot.c: 118: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	120
;robot.c: 120: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	122
;robot.c: 122: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	124
;robot.c: 124: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	125
;robot.c: 125: }
	goto	l6051
	line	126
	
l6047:	
;robot.c: 126: else if (angle < 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(robotTurn@angle+1),7
	goto	u4591
	goto	u4590
u4591:
	goto	l10942
u4590:
	line	128
	
l10940:	
;robot.c: 127: {
;robot.c: 128: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	130
;robot.c: 130: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	132
;robot.c: 132: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	134
;robot.c: 134: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	136
;robot.c: 136: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	137
;robot.c: 137: }
	goto	l6051
	line	138
	
l6049:	
	line	140
	
l10942:	
;robot.c: 138: else
;robot.c: 139: {
;robot.c: 140: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	142
;robot.c: 142: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	144
;robot.c: 144: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	146
;robot.c: 146: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	148
;robot.c: 148: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	goto	l6051
	line	149
	
l6050:	
	goto	l6051
	
l6048:	
	line	150
	
l6051:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurn
	__end_of_robotTurn:
;; =============== function _robotTurn ends ============

	signat	_robotTurn,4216
	global	_RobotDrive
psect	text987,local,class=CODE,delta=2
global __ptext987
__ptext987:

;; *************** function _RobotDrive *****************
;; Defined at:
;;		line 91 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  speed           2    2[BANK0 ] int 
;;  radius          2    4[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  radiushighBy    1   10[BANK0 ] unsigned char 
;;  radiuslowByt    1    9[BANK0 ] unsigned char 
;;  speedhighByt    1    8[BANK0 ] unsigned char 
;;  speedlowByte    1    7[BANK0 ] unsigned char 
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
;;		_robotFollow
;;		_robotMoveSpeed
;; This function uses a non-reentrant model
;;
psect	text987
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	91
	global	__size_of_RobotDrive
	__size_of_RobotDrive	equ	__end_of_RobotDrive-_RobotDrive
	
_RobotDrive:	
	opt	stack 2
; Regs used in _RobotDrive: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	93
	
l10920:	
;robot.c: 93: unsigned char speedlowByte = (unsigned char)(speed);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speed),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@speedlowByte)
	line	94
	
l10922:	
;robot.c: 94: unsigned char speedhighByte = (unsigned char)(speed >> 8);
	movf	(RobotDrive@speed+1),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@speedhighByte)
	line	95
	
l10924:	
;robot.c: 95: unsigned char radiuslowByte = (unsigned char)(radius);
	movf	(RobotDrive@radius),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@radiuslowByte)
	line	96
;robot.c: 96: unsigned char radiushighByte = (unsigned char)(radius >> 8);
	movf	(RobotDrive@radius+1),w
	movwf	(??_RobotDrive+0)+0
	movf	(??_RobotDrive+0)+0,w
	movwf	(RobotDrive@radiushighByte)
	line	98
	
l10926:	
;robot.c: 98: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	100
	
l10928:	
;robot.c: 100: ser_putch(speedhighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speedhighByte),w
	fcall	_ser_putch
	line	102
	
l10930:	
;robot.c: 102: ser_putch(speedlowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@speedlowByte),w
	fcall	_ser_putch
	line	104
	
l10932:	
;robot.c: 104: ser_putch(radiushighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@radiushighByte),w
	fcall	_ser_putch
	line	106
	
l10934:	
;robot.c: 106: ser_putch(radiuslowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(RobotDrive@radiuslowByte),w
	fcall	_ser_putch
	line	107
	
l6044:	
	return
	opt stack 0
GLOBAL	__end_of_RobotDrive
	__end_of_RobotDrive:
;; =============== function _RobotDrive ends ============

	signat	_RobotDrive,8312
	global	_ser_getch
psect	text988,local,class=CODE,delta=2
global __ptext988
__ptext988:

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
;; This function uses a non-reentrant model
;;
psect	text988
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	55
	global	__size_of_ser_getch
	__size_of_ser_getch	equ	__end_of_ser_getch-_ser_getch
	
_ser_getch:	
	opt	stack 1
; Regs used in _ser_getch: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	58
	
l10904:	
;ser.c: 56: unsigned char c;
;ser.c: 58: while (ser_isrx()==0)
	goto	l10906
	
l6793:	
	line	59
;ser.c: 59: continue;
	goto	l10906
	
l6792:	
	line	58
	
l10906:	
	fcall	_ser_isrx
	btfss	status,0
	goto	u4571
	goto	u4570
u4571:
	goto	l10906
u4570:
	
l6794:	
	line	61
;ser.c: 61: GIE=0;
	bcf	(95/8),(95)&7
	line	62
	
l10908:	
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
	
l10910:	
;ser.c: 63: ++rxoptr;
	movlw	(01h)
	movwf	(??_ser_getch+0)+0
	movf	(??_ser_getch+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_rxoptr)^080h,f	;volatile
	line	64
	
l10912:	
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
	
l10914:	
;ser.c: 65: GIE=1;
	bsf	(95/8),(95)&7
	line	66
	
l10916:	
;ser.c: 66: return c;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(ser_getch@c),w
	goto	l6795
	
l10918:	
	line	67
	
l6795:	
	return
	opt stack 0
GLOBAL	__end_of_ser_getch
	__end_of_ser_getch:
;; =============== function _ser_getch ends ============

	signat	_ser_getch,89
	global	_sprintf
psect	text989,local,class=CODE,delta=2
global __ptext989
__ptext989:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> UpdateDisplay@LCDOutput(16), 
;;  f               1   20[BANK0 ] PTR const unsigned char 
;;		 -> STR_13(13), 
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
psect	text989
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
	
l10846:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	l10898
	
l6833:	
	line	542
	
l10848:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u4491
	goto	u4490
u4491:
	goto	l6834
u4490:
	line	545
	
l10850:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l10852:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	l10898
	line	547
	
l6834:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	l10856
	line	640
	
l6836:	
	line	641
	goto	l10900
	line	700
	
l6838:	
	goto	l10858
	line	701
	
l6839:	
	line	702
	goto	l10858
	line	805
	
l6841:	
	line	816
	goto	l10898
	line	825
	
l10854:	
	goto	l10858
	line	638
	
l6835:	
	
l10856:	
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
	goto	l10900
	xorlw	100^0	; case 100
	skipnz
	goto	l10858
	xorlw	105^100	; case 105
	skipnz
	goto	l10858
	goto	l10898
	opt asmopt_on

	line	825
	
l6840:	
	line	1254
	
l10858:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
l10860:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
l10862:	
	btfss	(sprintf@_val+1),7
	goto	u4501
	goto	u4500
u4501:
	goto	l10868
u4500:
	line	1257
	
l10864:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
l10866:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	l10868
	line	1259
	
l6842:	
	line	1300
	
l10868:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
l10870:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u4511
	goto	u4510
u4511:
	goto	l10874
u4510:
	goto	l10882
	
l10872:	
	goto	l10882
	line	1301
	
l6843:	
	
l10874:	
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
	goto	u4525
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u4525:
	skipnc
	goto	u4521
	goto	u4520
u4521:
	goto	l10878
u4520:
	goto	l10882
	line	1302
	
l10876:	
	goto	l10882
	
l6845:	
	line	1300
	
l10878:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
l10880:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u4531
	goto	u4530
u4531:
	goto	l10874
u4530:
	goto	l10882
	
l6844:	
	line	1433
	
l10882:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u4541
	goto	u4540
u4541:
	goto	l10888
u4540:
	line	1434
	
l10884:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l10886:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l10888
	
l6846:	
	line	1467
	
l10888:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	l10896
	
l6848:	
	line	1484
	
l10890:	
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
	
l10892:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l10894:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l10896
	line	1517
	
l6847:	
	line	1469
	
l10896:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u4551
	goto	u4550
u4551:
	goto	l10890
u4550:
	goto	l10898
	
l6849:	
	goto	l10898
	line	1525
	
l6832:	
	line	540
	
l10898:	
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
	goto	u4561
	goto	u4560
u4561:
	goto	l10848
u4560:
	goto	l10900
	
l6850:	
	goto	l10900
	line	1527
	
l6837:	
	line	1530
	
l10900:	
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l6851
	line	1532
	
l10902:	
	line	1533
;	Return value of _sprintf is never used
	
l6851:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ADCconvert
psect	text990,local,class=CODE,delta=2
global __ptext990
__ptext990:

;; *************** function _ADCconvert *****************
;; Defined at:
;;		line 60 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
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
psect	text990
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	60
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [wreg+status,2+status,0+pclath+cstack]
	line	66
	
l10804:	
;infrared.c: 66: if (adcVal >= 213 && adcVal < 234)
	movlw	high(0D5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4351
	goto	u4350
u4351:
	goto	l10810
u4350:
	
l10806:	
	movlw	high(0EAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0EAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4361
	goto	u4360
u4361:
	goto	l10810
u4360:
	line	68
	
l10808:	
;infrared.c: 67: {
;infrared.c: 68: IRdistance = 15 + ((20 - 15)*(234 - adcVal)) / (234 - 213);
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
	line	69
;infrared.c: 69: }
	goto	l3025
	line	70
	
l3012:	
	
l10810:	
;infrared.c: 70: else if (adcVal >= 170 && adcVal < 213)
	movlw	high(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4371
	goto	u4370
u4371:
	goto	l10816
u4370:
	
l10812:	
	movlw	high(0D5h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4381
	goto	u4380
u4381:
	goto	l10816
u4380:
	line	72
	
l10814:	
;infrared.c: 71: {
;infrared.c: 72: IRdistance = 20 + ((30 - 20)*(213 - adcVal)) / (213 - 170);
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
	line	73
;infrared.c: 73: }
	goto	l3025
	line	74
	
l3014:	
	
l10816:	
;infrared.c: 74: else if (adcVal >= 128 && adcVal < 170)
	movlw	high(080h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4391
	goto	u4390
u4391:
	goto	l10822
u4390:
	
l10818:	
	movlw	high(0AAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4401
	goto	u4400
u4401:
	goto	l10822
u4400:
	line	76
	
l10820:	
;infrared.c: 75: {
;infrared.c: 76: IRdistance = 30 + ((40 - 30)*(170 - adcVal)) / (170 - 128);
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
	line	77
;infrared.c: 77: }
	goto	l3025
	line	78
	
l3016:	
	
l10822:	
;infrared.c: 78: else if (adcVal >= 107 && adcVal < 128)
	movlw	high(06Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4411
	goto	u4410
u4411:
	goto	l10828
u4410:
	
l10824:	
	movlw	high(080h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4421
	goto	u4420
u4421:
	goto	l10828
u4420:
	line	80
	
l10826:	
;infrared.c: 79: {
;infrared.c: 80: IRdistance = 40 + ((50 - 40)*(128 - adcVal)) / (128 - 107);
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
	line	81
;infrared.c: 81: }
	goto	l3025
	line	82
	
l3018:	
	
l10828:	
;infrared.c: 82: else if (adcVal >= 77 && adcVal < 107)
	movlw	high(04Dh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4431
	goto	u4430
u4431:
	goto	l10834
u4430:
	
l10830:	
	movlw	high(06Bh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4441
	goto	u4440
u4441:
	goto	l10834
u4440:
	line	84
	
l10832:	
;infrared.c: 83: {
;infrared.c: 84: IRdistance = 50 + ((60 - 50)*(107 - adcVal)) / (107 - 77);
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
	line	85
;infrared.c: 85: }
	goto	l3025
	line	86
	
l3020:	
	
l10834:	
;infrared.c: 86: else if (adcVal >= 56 && adcVal < 77)
	movlw	high(038h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4451
	goto	u4450
u4451:
	goto	l10840
u4450:
	
l10836:	
	movlw	high(04Dh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4461
	goto	u4460
u4461:
	goto	l10840
u4460:
	line	88
	
l10838:	
;infrared.c: 87: {
;infrared.c: 88: IRdistance = 60 + ((70 - 60)*(77 - adcVal)) / (77 - 56);
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
	line	89
;infrared.c: 89: }
	goto	l3025
	line	90
	
l3022:	
	
l10840:	
;infrared.c: 90: else if (adcVal >= 43 && adcVal < 56)
	movlw	high(02Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(02Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4471
	goto	u4470
u4471:
	goto	l3025
u4470:
	
l10842:	
	movlw	high(038h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4481
	goto	u4480
u4481:
	goto	l3025
u4480:
	line	92
	
l10844:	
;infrared.c: 91: {
;infrared.c: 92: IRdistance = 70 + ((80 - 70)*(56 - adcVal)) / (56 - 43);
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
	goto	l3025
	line	93
	
l3024:	
	goto	l3025
	line	94
	
l3023:	
	goto	l3025
	
l3021:	
	goto	l3025
	
l3019:	
	goto	l3025
	
l3017:	
	goto	l3025
	
l3015:	
	goto	l3025
	
l3013:	
	
l3025:	
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,88
	global	_rotate
psect	text991,local,class=CODE,delta=2
global __ptext991
__ptext991:

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
;;		_calibrateIR
;;		_scan360
;; This function uses a non-reentrant model
;;
psect	text991
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	66
	global	__size_of_rotate
	__size_of_rotate	equ	__end_of_rotate-_rotate
	
_rotate:	
	opt	stack 2
; Regs used in _rotate: [wreg+status,2+status,0+pclath+cstack]
	line	68
	
l10776:	
;steppermotor.c: 68: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	69
	
l10778:	
;steppermotor.c: 69: if (direction == 0)
	movf	(rotate@direction),f
	skipz
	goto	u4331
	goto	u4330
u4331:
	goto	l10782
u4330:
	line	70
	
l10780:	
;steppermotor.c: 70: spi_transfer(0b00001011);
	movlw	(0Bh)
	fcall	_spi_transfer
	goto	l10784
	line	71
	
l3726:	
	line	72
	
l10782:	
;steppermotor.c: 71: else
;steppermotor.c: 72: spi_transfer(0b00001001);
	movlw	(09h)
	fcall	_spi_transfer
	goto	l10784
	
l3727:	
	line	73
	
l10784:	
;steppermotor.c: 73: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l10786:	
	bcf	(57/8),(57)&7
	line	74
	
l10788:	
;steppermotor.c: 74: for (unsigned int i = 0; i < numsteps; i++)
	clrf	(rotate@i)
	clrf	(rotate@i+1)
	goto	l3728
	line	75
	
l3729:	
	line	76
;steppermotor.c: 75: {
;steppermotor.c: 76: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	nop
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	77
	
l10790:	
;steppermotor.c: 77: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
movwf	((??_rotate+0)+0+1),f
	movlw	101
movwf	((??_rotate+0)+0),f
u4977:
	decfsz	((??_rotate+0)+0),f
	goto	u4977
	decfsz	((??_rotate+0)+0+1),f
	goto	u4977
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
	
l3728:	
	movf	(rotate@numsteps+1),w
	subwf	(rotate@i+1),w
	skipz
	goto	u4345
	movf	(rotate@numsteps),w
	subwf	(rotate@i),w
u4345:
	skipc
	goto	u4341
	goto	u4340
u4341:
	goto	l3729
u4340:
	
l3730:	
	line	79
;steppermotor.c: 78: }
;steppermotor.c: 79: RC0 = 1; RC1 = 1;;
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	80
	
l10792:	
;steppermotor.c: 80: spi_transfer(0b00000000);
	movlw	(0)
	fcall	_spi_transfer
	line	81
	
l10794:	
;steppermotor.c: 81: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l10796:	
	bcf	(57/8),(57)&7
	line	82
	
l10798:	
;steppermotor.c: 82: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l10800:	
	nop
	
l10802:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	83
	
l3731:	
	return
	opt stack 0
GLOBAL	__end_of_rotate
	__end_of_rotate:
;; =============== function _rotate ends ============

	signat	_rotate,8312
	global	_robo_init
psect	text992,local,class=CODE,delta=2
global __ptext992
__ptext992:

;; *************** function _robo_init *****************
;; Defined at:
;;		line 36 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text992
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	36
	global	__size_of_robo_init
	__size_of_robo_init	equ	__end_of_robo_init-_robo_init
	
_robo_init:	
	opt	stack 2
; Regs used in _robo_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	37
	
l10774:	
;robot.c: 37: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	38
;robot.c: 38: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	39
;robot.c: 39: ser_putch(150);
	movlw	(096h)
	fcall	_ser_putch
	line	40
;robot.c: 40: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	41
	
l6033:	
	return
	opt stack 0
GLOBAL	__end_of_robo_init
	__end_of_robo_init:
;; =============== function _robo_init ends ============

	signat	_robo_init,88
	global	_lcd_write_data
psect	text993,local,class=CODE,delta=2
global __ptext993
__ptext993:

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
psect	text993
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
	
l10766:	
;lcd.c: 31: RE2 = 0;
	bcf	(74/8),(74)&7
	line	32
;lcd.c: 32: RE1 = 0;
	bcf	(73/8),(73)&7
	line	33
;lcd.c: 33: RE0 = 1;
	bsf	(72/8),(72)&7
	line	34
	
l10768:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
l10770:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
l10772:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u4987:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u4987
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u4987
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
psect	text994,local,class=CODE,delta=2
global __ptext994
__ptext994:

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
psect	text994
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
	
l10758:	
;lcd.c: 19: RE2 = 0;
	bcf	(74/8),(74)&7
	line	20
;lcd.c: 20: RE1 = 0;
	bcf	(73/8),(73)&7
	line	21
;lcd.c: 21: RE0 = 0;
	bcf	(72/8),(72)&7
	line	22
	
l10760:	
;lcd.c: 22: PORTD = databyte;
	movf	(lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
l10762:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l10764:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??_lcd_write_control+0)+0),f
u4997:
	decfsz	((??_lcd_write_control+0)+0),f
	goto	u4997
	decfsz	((??_lcd_write_control+0)+0+1),f
	goto	u4997
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
psect	text995,local,class=CODE,delta=2
global __ptext995
__ptext995:

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
psect	text995
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 3
; Regs used in _init_adc: [wreg+status,2]
	line	63
	
l10748:	
;adc.c: 63: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	64
	
l10750:	
;adc.c: 64: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	67
	
l10752:	
;adc.c: 67: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	68
	
l10754:	
;adc.c: 68: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	70
	
l10756:	
;adc.c: 70: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_init_adc+0)+0,f
u5007:
decfsz	(??_init_adc+0)+0,f
	goto	u5007
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
psect	text996,local,class=CODE,delta=2
global __ptext996
__ptext996:

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
psect	text996
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
	
l10732:	
;adc.c: 21: switch(channel)
	goto	l10740
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
	goto	l10742
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
	goto	l10742
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
	goto	l10742
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
	goto	l10742
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
	goto	l10742
	line	50
;adc.c: 50: default:
	
l696:	
	line	51
	
l10734:	
;adc.c: 51: return 0;
	movlw	(0)
	goto	l697
	
l10736:	
	goto	l697
	line	52
	
l10738:	
;adc.c: 52: }
	goto	l10742
	line	21
	
l689:	
	
l10740:	
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
	goto	l10734
	opt asmopt_on

	line	52
	
l691:	
	line	54
	
l10742:	
;adc.c: 54: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u5017:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u5017
opt asmopt_on

	line	56
	
l10744:	
;adc.c: 56: return adc_read();
	fcall	_adc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_adc_read)),w
	goto	l697
	
l10746:	
	line	58
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
psect	text997,local,class=CODE,delta=2
global __ptext997
__ptext997:

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
psect	text997
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l10676:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u4181
	goto	u4180
u4181:
	goto	l10680
u4180:
	line	10
	
l10678:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l10680
	line	12
	
l7742:	
	line	13
	
l10680:	
	btfss	(___awmod@divisor+1),7
	goto	u4191
	goto	u4190
u4191:
	goto	l10684
u4190:
	line	14
	
l10682:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l10684
	
l7743:	
	line	15
	
l10684:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u4201
	goto	u4200
u4201:
	goto	l10702
u4200:
	line	16
	
l10686:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l10692
	
l7746:	
	line	18
	
l10688:	
	movlw	01h
	
u4215:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4215
	line	19
	
l10690:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l10692
	line	20
	
l7745:	
	line	17
	
l10692:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u4221
	goto	u4220
u4221:
	goto	l10688
u4220:
	goto	l10694
	
l7747:	
	goto	l10694
	line	21
	
l7748:	
	line	22
	
l10694:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u4235
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u4235:
	skipc
	goto	u4231
	goto	u4230
u4231:
	goto	l10698
u4230:
	line	23
	
l10696:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l10698
	
l7749:	
	line	24
	
l10698:	
	movlw	01h
	
u4245:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u4245
	line	25
	
l10700:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u4251
	goto	u4250
u4251:
	goto	l10694
u4250:
	goto	l10702
	
l7750:	
	goto	l10702
	line	26
	
l7744:	
	line	27
	
l10702:	
	movf	(___awmod@sign),w
	skipz
	goto	u4260
	goto	l10706
u4260:
	line	28
	
l10704:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l10706
	
l7751:	
	line	29
	
l10706:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l7752
	
l10708:	
	line	30
	
l7752:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___lwmod
psect	text998,local,class=CODE,delta=2
global __ptext998
__ptext998:

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
psect	text998
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l10654:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u4121
	goto	u4120
u4121:
	goto	l10672
u4120:
	line	9
	
l10656:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l10662
	
l7552:	
	line	11
	
l10658:	
	movlw	01h
	
u4135:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4135
	line	12
	
l10660:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l10662
	line	13
	
l7551:	
	line	10
	
l10662:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u4141
	goto	u4140
u4141:
	goto	l10658
u4140:
	goto	l10664
	
l7553:	
	goto	l10664
	line	14
	
l7554:	
	line	15
	
l10664:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u4155
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u4155:
	skipc
	goto	u4151
	goto	u4150
u4151:
	goto	l10668
u4150:
	line	16
	
l10666:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l10668
	
l7555:	
	line	17
	
l10668:	
	movlw	01h
	
u4165:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u4165
	line	18
	
l10670:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u4171
	goto	u4170
u4171:
	goto	l10664
u4170:
	goto	l10672
	
l7556:	
	goto	l10672
	line	19
	
l7550:	
	line	20
	
l10672:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l7557
	
l10674:	
	line	21
	
l7557:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text999,local,class=CODE,delta=2
global __ptext999
__ptext999:

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
psect	text999
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l10628:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l10630:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u4051
	goto	u4050
u4051:
	goto	l10650
u4050:
	line	11
	
l10632:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l10638
	
l7542:	
	line	13
	
l10634:	
	movlw	01h
	
u4065:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u4065
	line	14
	
l10636:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l10638
	line	15
	
l7541:	
	line	12
	
l10638:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u4071
	goto	u4070
u4071:
	goto	l10634
u4070:
	goto	l10640
	
l7543:	
	goto	l10640
	line	16
	
l7544:	
	line	17
	
l10640:	
	movlw	01h
	
u4085:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u4085
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u4095
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u4095:
	skipc
	goto	u4091
	goto	u4090
u4091:
	goto	l10646
u4090:
	line	19
	
l10642:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l10644:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l10646
	line	21
	
l7545:	
	line	22
	
l10646:	
	movlw	01h
	
u4105:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u4105
	line	23
	
l10648:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u4111
	goto	u4110
u4111:
	goto	l10640
u4110:
	goto	l10650
	
l7546:	
	goto	l10650
	line	24
	
l7540:	
	line	25
	
l10650:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l7547
	
l10652:	
	line	26
	
l7547:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text1000,local,class=CODE,delta=2
global __ptext1000
__ptext1000:

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
;; This function uses a non-reentrant model
;;
psect	text1000
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 2
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l10616:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l10618
	line	6
	
l7534:	
	line	7
	
l10618:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u4011
	goto	u4010
u4011:
	goto	l7535
u4010:
	line	8
	
l10620:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l7535:	
	line	9
	movlw	01h
	
u4025:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u4025
	line	10
	
l10622:	
	movlw	01h
	
u4035:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u4035
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u4041
	goto	u4040
u4041:
	goto	l10618
u4040:
	goto	l10624
	
l7536:	
	line	12
	
l10624:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l7537
	
l10626:	
	line	13
	
l7537:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_ser_isrx
psect	text1001,local,class=CODE,delta=2
global __ptext1001
__ptext1001:

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
psect	text1001
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	45
	global	__size_of_ser_isrx
	__size_of_ser_isrx	equ	__end_of_ser_isrx-_ser_isrx
	
_ser_isrx:	
	opt	stack 1
; Regs used in _ser_isrx: [wreg+status,2+status,0]
	line	46
	
l10568:	
;ser.c: 46: if(OERR) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(193/8),(193)&7
	goto	u3941
	goto	u3940
u3941:
	goto	l10576
u3940:
	line	47
	
l10570:	
;ser.c: 47: CREN = 0;
	bcf	(196/8),(196)&7
	line	48
;ser.c: 48: CREN = 1;
	bsf	(196/8),(196)&7
	line	49
	
l10572:	
;ser.c: 49: return 0;
	clrc
	
	goto	l6789
	
l10574:	
	goto	l6789
	line	50
	
l6788:	
	line	51
	
l10576:	
;ser.c: 50: }
;ser.c: 51: return (rxiptr!=rxoptr);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_rxiptr)^080h,w	;volatile
	xorwf	(_rxoptr)^080h,w	;volatile
	skipz
	goto	u3951
	goto	u3950
u3951:
	goto	l10580
u3950:
	
l10578:	
	clrc
	
	goto	l6789
	
l10302:	
	
l10580:	
	setc
	
	goto	l6789
	
l10304:	
	goto	l6789
	
l10582:	
	line	52
	
l6789:	
	return
	opt stack 0
GLOBAL	__end_of_ser_isrx
	__end_of_ser_isrx:
;; =============== function _ser_isrx ends ============

	signat	_ser_isrx,88
	global	_spi_transfer
psect	text1002,local,class=CODE,delta=2
global __ptext1002
__ptext1002:

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
psect	text1002
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
	
l10516:	
;steppermotor.c: 51: unsigned char temp = 0;
	clrf	(spi_transfer@temp)
	line	53
;steppermotor.c: 53: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	54
	
l10518:	
;steppermotor.c: 54: SSPBUF = data;
	movf	(spi_transfer@data),w
	movwf	(19)	;volatile
	line	56
;steppermotor.c: 56: while (SSPIF == 0);
	goto	l3720
	
l3721:	
	
l3720:	
	btfss	(99/8),(99)&7
	goto	u3781
	goto	u3780
u3781:
	goto	l3720
u3780:
	goto	l10520
	
l3722:	
	line	57
	
l10520:	
;steppermotor.c: 57: temp = SSPBUF;
	movf	(19),w	;volatile
	movwf	(??_spi_transfer+0)+0
	movf	(??_spi_transfer+0)+0,w
	movwf	(spi_transfer@temp)
	line	58
	
l10522:	
;steppermotor.c: 58: SSPIF = 0;
	bcf	(99/8),(99)&7
	goto	l3723
	line	60
	
l10524:	
	line	61
;steppermotor.c: 60: return temp;
;	Return value of _spi_transfer is never used
	
l3723:	
	return
	opt stack 0
GLOBAL	__end_of_spi_transfer
	__end_of_spi_transfer:
;; =============== function _spi_transfer ends ============

	signat	_spi_transfer,4217
	global	_ser_putch
psect	text1003,local,class=CODE,delta=2
global __ptext1003
__ptext1003:

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
;;		_ChargeMode
;;		_robo_init
;;		_robot_read
;;		_RobotDrive
;;		_robotTurn
;;		_ser_puts
;;		_ser_puts2
;;		_ser_puthex
;; This function uses a non-reentrant model
;;
psect	text1003
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
	
l10480:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l10482
	
l6799:	
	line	72
;ser.c: 72: continue;
	goto	l10482
	
l6798:	
	line	71
	
l10482:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	(_txoptr)^080h,w	;volatile
	skipnz
	goto	u3731
	goto	u3730
u3731:
	goto	l10482
u3730:
	
l6800:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l10484:	
;ser.c: 74: txfifo[txiptr] = c;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(ser_putch@c),w
	movwf	(??_ser_putch+0)+0
	movf	(_txiptr),w
	addlw	_txfifo&0ffh
	movwf	fsr0
	movf	(??_ser_putch+0)+0,w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	line	75
	
l10486:	
;ser.c: 75: txiptr=(txiptr+1) & (16-1);
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_ser_putch+0)+0
	movf	(??_ser_putch+0)+0,w
	movwf	(_txiptr)	;volatile
	line	76
	
l10488:	
;ser.c: 76: TXIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1124/8)^080h,(1124)&7
	line	77
	
l10490:	
;ser.c: 77: GIE=1;
	bsf	(95/8),(95)&7
	line	78
	
l6801:	
	return
	opt stack 0
GLOBAL	__end_of_ser_putch
	__end_of_ser_putch:
;; =============== function _ser_putch ends ============

	signat	_ser_putch,4216
	global	_Menu
psect	text1004,local,class=CODE,delta=2
global __ptext1004
__ptext1004:

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
psect	text1004
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
	
l10456:	
;HMI.c: 202: switch (BTN_input)
	goto	l10474
	line	204
;HMI.c: 203: {
;HMI.c: 204: case 1:
	
l4531:	
	line	206
;HMI.c: 206: break;
	goto	l10476
	line	207
;HMI.c: 207: case 2:
	
l4533:	
	line	209
;HMI.c: 209: break;
	goto	l10476
	line	210
;HMI.c: 210: case 3:
	
l4534:	
	line	211
	
l10458:	
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
	
l10460:	
;HMI.c: 212: if (pos < 0)
	btfss	(_pos+1)^080h,7
	goto	u3711
	goto	u3710
u3711:
	goto	l10476
u3710:
	line	213
	
l10462:	
;HMI.c: 213: pos = 6 - 1;
	movlw	low(05h)
	movwf	(_pos)^080h
	movlw	high(05h)
	movwf	((_pos)^080h)+1
	goto	l10476
	
l4535:	
	line	215
;HMI.c: 215: break;
	goto	l10476
	line	216
;HMI.c: 216: case 4:
	
l4536:	
	line	217
	
l10464:	
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
	goto	u3721
	goto	u3720
u3721:
	goto	l10476
u3720:
	line	219
	
l10466:	
;HMI.c: 219: pos = 0;
	clrf	(_pos)^080h
	clrf	(_pos+1)^080h
	goto	l10476
	
l4537:	
	line	221
;HMI.c: 221: break;
	goto	l10476
	line	222
;HMI.c: 222: case 5:
	
l4538:	
	line	223
	
l10468:	
;HMI.c: 223: return pos;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	goto	l4539
	
l10470:	
	goto	l4539
	line	226
;HMI.c: 226: default:
	
l4540:	
	line	228
;HMI.c: 228: break;
	goto	l10476
	line	229
	
l10472:	
;HMI.c: 229: }
	goto	l10476
	line	202
	
l4530:	
	
l10474:	
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
	goto	l10476
	xorlw	2^1	; case 2
	skipnz
	goto	l10476
	xorlw	3^2	; case 3
	skipnz
	goto	l10458
	xorlw	4^3	; case 4
	skipnz
	goto	l10464
	xorlw	5^4	; case 5
	skipnz
	goto	l10468
	goto	l10476
	opt asmopt_on

	line	229
	
l4532:	
	line	230
	
l10476:	
;HMI.c: 230: return 255;
	movlw	(0FFh)
	goto	l4539
	
l10478:	
	line	231
	
l4539:	
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4217
	global	_ser_init
psect	text1005,local,class=CODE,delta=2
global __ptext1005
__ptext1005:

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
psect	text1005
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 3
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l10430:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l10432:	
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
	
l10434:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l10436:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l10438:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l10440:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l10442:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l10444:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l10446:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l10448:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l10450:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l10452:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l10454:	
;ser.c: 132: rxiptr=rxoptr=txiptr=txoptr=0;
	movlw	(0)
	movwf	(_txoptr)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_txiptr)	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_rxoptr)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ser_init+0)+0
	movf	(??_ser_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_rxiptr)^080h	;volatile
	line	133
	
l6823:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_adc_read
psect	text1006,local,class=CODE,delta=2
global __ptext1006
__ptext1006:

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
psect	text1006
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	76
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	79
	
l10310:	
;adc.c: 77: volatile unsigned int adc_value;
;adc.c: 79: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	81
	
l10312:	
;adc.c: 81: GO = 1;
	bsf	(250/8),(250)&7
	line	82
;adc.c: 82: while(GO) continue;
	goto	l703
	
l704:	
	
l703:	
	btfsc	(250/8),(250)&7
	goto	u3521
	goto	u3520
u3521:
	goto	l703
u3520:
	
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
psect	text1006
	line	88
	
l10314:	
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
	
u3535:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u3535
	line	90
;adc.c: 90: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	93
	
l10316:	
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
	
l10318:	
	line	94
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
	global	_isr1
psect	text1007,local,class=CODE,delta=2
global __ptext1007
__ptext1007:

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
psect	text1007
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	109
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
psect	text1007
	line	110
	
i1l10346:	
;Main.c: 110: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u357_21
	goto	u357_20
u357_21:
	goto	i1l10368
u357_20:
	line	112
	
i1l10348:	
;Main.c: 111: {
;Main.c: 112: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	113
	
i1l10350:	
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
	
i1l10352:	
;Main.c: 118: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	119
	
i1l10354:	
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
	goto	u358_21
	goto	u358_20
u358_21:
	goto	i1l10358
u358_20:
	line	121
	
i1l10356:	
;Main.c: 120: {
;Main.c: 121: RTC_FLAG_250MS = 1;
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l10358
	line	122
	
i1l2219:	
	line	123
	
i1l10358:	
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
	goto	u359_21
	goto	u359_20
u359_21:
	goto	i1l10364
u359_20:
	line	125
	
i1l10360:	
;Main.c: 124: {
;Main.c: 125: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	126
	
i1l10362:	
;Main.c: 126: RB0 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l10364
	line	127
	
i1l2220:	
	line	128
	
i1l10364:	
;Main.c: 127: }
;Main.c: 128: if (buttonPressed == 0)
	movf	(_buttonPressed),f
	skipz	;volatile
	goto	u360_21
	goto	u360_20
u360_21:
	goto	i1l10368
u360_20:
	line	130
	
i1l10366:	
;Main.c: 129: {
;Main.c: 130: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_buttonPressed)	;volatile
	goto	i1l10368
	line	131
	
i1l2221:	
	goto	i1l10368
	line	132
	
i1l2218:	
	line	133
	
i1l10368:	
;Main.c: 131: }
;Main.c: 132: }
;Main.c: 133: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u361_21
	goto	u361_20
u361_21:
	goto	i1l10378
u361_20:
	
i1l10370:	
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
	
i1l10372:	
	movf	(_rxiptr)^080h,w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_ser_tmp)^080h
	
i1l10374:	
	movf	(_ser_tmp)^080h,w
	xorwf	(_rxoptr)^080h,w	;volatile
	skipnz
	goto	u362_21
	goto	u362_20
u362_21:
	goto	i1l10378
u362_20:
	
i1l10376:	
	movf	(_ser_tmp)^080h,w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)^080h	;volatile
	goto	i1l10378
	
i1l2223:	
	goto	i1l10378
	
i1l2222:	
	
i1l10378:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(100/8),(100)&7
	goto	u363_21
	goto	u363_20
u363_21:
	goto	i1l2226
u363_20:
	
i1l10380:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u364_21
	goto	u364_20
u364_21:
	goto	i1l2226
u364_20:
	
i1l10382:	
	movf	(_txoptr)^080h,w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	
i1l10384:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_txoptr)^080h,f	;volatile
	
i1l10386:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr)^080h,f	;volatile
	
i1l10388:	
	movf	(_txoptr)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_txiptr),w	;volatile
	skipz
	goto	u365_21
	goto	u365_20
u365_21:
	goto	i1l2226
u365_20:
	
i1l10390:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2226
	
i1l2225:	
	goto	i1l2226
	
i1l2224:	
	line	134
	
i1l2226:	
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
psect	text1008,local,class=CODE,delta=2
global __ptext1008
__ptext1008:

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
psect	text1008
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	159
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 0
; Regs used in _ReadButtons: [wreg+status,2+status,0+pclath+cstack]
	line	161
	
i1l10392:	
;HMI.c: 161: Debounce();
	fcall	_Debounce
	line	163
	
i1l10394:	
;HMI.c: 163: if(UpPressed)
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u366_21
	goto	u366_20
u366_21:
	goto	i1l4522
u366_20:
	line	165
	
i1l10396:	
;HMI.c: 164: {
;HMI.c: 165: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	166
	
i1l10398:	
;HMI.c: 166: return 1;
	movlw	(01h)
	goto	i1l4523
	
i1l10400:	
	goto	i1l4523
	line	168
	
i1l4522:	
	line	170
;HMI.c: 168: }
;HMI.c: 170: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u367_21
	goto	u367_20
u367_21:
	goto	i1l4524
u367_20:
	line	172
	
i1l10402:	
;HMI.c: 171: {
;HMI.c: 172: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	173
	
i1l10404:	
;HMI.c: 173: return 2;
	movlw	(02h)
	goto	i1l4523
	
i1l10406:	
	goto	i1l4523
	line	175
	
i1l4524:	
	line	176
;HMI.c: 175: }
;HMI.c: 176: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u368_21
	goto	u368_20
u368_21:
	goto	i1l4525
u368_20:
	line	178
	
i1l10408:	
;HMI.c: 177: {
;HMI.c: 178: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	179
	
i1l10410:	
;HMI.c: 179: return 3;
	movlw	(03h)
	goto	i1l4523
	
i1l10412:	
	goto	i1l4523
	line	181
	
i1l4525:	
	line	182
;HMI.c: 181: }
;HMI.c: 182: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u369_21
	goto	u369_20
u369_21:
	goto	i1l4526
u369_20:
	line	184
	
i1l10414:	
;HMI.c: 183: {
;HMI.c: 184: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	185
	
i1l10416:	
;HMI.c: 185: return 4;
	movlw	(04h)
	goto	i1l4523
	
i1l10418:	
	goto	i1l4523
	line	187
	
i1l4526:	
	line	189
;HMI.c: 187: }
;HMI.c: 189: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u370_21
	goto	u370_20
u370_21:
	goto	i1l10426
u370_20:
	line	191
	
i1l10420:	
;HMI.c: 190: {
;HMI.c: 191: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	192
	
i1l10422:	
;HMI.c: 192: return 5;
	movlw	(05h)
	goto	i1l4523
	
i1l10424:	
	goto	i1l4523
	line	194
	
i1l4527:	
	line	195
	
i1l10426:	
;HMI.c: 194: }
;HMI.c: 195: return 0;
	movlw	(0)
	goto	i1l4523
	
i1l10428:	
	line	196
	
i1l4523:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
	global	i1___lwmod
psect	text1009,local,class=CODE,delta=2
global __ptext1009
__ptext1009:

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
psect	text1009
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_ofi1___lwmod
	__size_ofi1___lwmod	equ	__end_ofi1___lwmod-i1___lwmod
	
i1___lwmod:	
	opt	stack 1
; Regs used in i1___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l10710:	
	movf	(i1___lwmod@divisor+1),w
	iorwf	(i1___lwmod@divisor),w
	skipnz
	goto	u427_21
	goto	u427_20
u427_21:
	goto	i1l10728
u427_20:
	line	9
	
i1l10712:	
	clrf	(i1___lwmod@counter)
	bsf	status,0
	rlf	(i1___lwmod@counter),f
	line	10
	goto	i1l10718
	
i1l7552:	
	line	11
	
i1l10714:	
	movlw	01h
	
u428_25:
	clrc
	rlf	(i1___lwmod@divisor),f
	rlf	(i1___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u428_25
	line	12
	
i1l10716:	
	movlw	(01h)
	movwf	(??i1___lwmod+0)+0
	movf	(??i1___lwmod+0)+0,w
	addwf	(i1___lwmod@counter),f
	goto	i1l10718
	line	13
	
i1l7551:	
	line	10
	
i1l10718:	
	btfss	(i1___lwmod@divisor+1),(15)&7
	goto	u429_21
	goto	u429_20
u429_21:
	goto	i1l10714
u429_20:
	goto	i1l10720
	
i1l7553:	
	goto	i1l10720
	line	14
	
i1l7554:	
	line	15
	
i1l10720:	
	movf	(i1___lwmod@divisor+1),w
	subwf	(i1___lwmod@dividend+1),w
	skipz
	goto	u430_25
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),w
u430_25:
	skipc
	goto	u430_21
	goto	u430_20
u430_21:
	goto	i1l10724
u430_20:
	line	16
	
i1l10722:	
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),f
	movf	(i1___lwmod@divisor+1),w
	skipc
	decf	(i1___lwmod@dividend+1),f
	subwf	(i1___lwmod@dividend+1),f
	goto	i1l10724
	
i1l7555:	
	line	17
	
i1l10724:	
	movlw	01h
	
u431_25:
	clrc
	rrf	(i1___lwmod@divisor+1),f
	rrf	(i1___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u431_25
	line	18
	
i1l10726:	
	movlw	low(01h)
	subwf	(i1___lwmod@counter),f
	btfss	status,2
	goto	u432_21
	goto	u432_20
u432_21:
	goto	i1l10720
u432_20:
	goto	i1l10728
	
i1l7556:	
	goto	i1l10728
	line	19
	
i1l7550:	
	line	20
	
i1l10728:	
	movf	(i1___lwmod@dividend+1),w
	clrf	(?i1___lwmod+1)
	addwf	(?i1___lwmod+1)
	movf	(i1___lwmod@dividend),w
	clrf	(?i1___lwmod)
	addwf	(?i1___lwmod)

	goto	i1l7557
	
i1l10730:	
	line	21
	
i1l7557:	
	return
	opt stack 0
GLOBAL	__end_ofi1___lwmod
	__end_ofi1___lwmod:
;; =============== function i1___lwmod ends ============

	signat	i1___lwmod,90
	global	_Debounce
psect	text1010,local,class=CODE,delta=2
global __ptext1010
__ptext1010:

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
psect	text1010
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	77
	global	__size_of_Debounce
	__size_of_Debounce	equ	__end_of_Debounce-_Debounce
	
_Debounce:	
	opt	stack 0
; Regs used in _Debounce: [wreg+status,2+status,0]
	line	79
	
i1l10526:	
;HMI.c: 79: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u379_21
	goto	u379_20
u379_21:
	goto	i1l4504
u379_20:
	line	81
	
i1l10528:	
;HMI.c: 80: {
;HMI.c: 81: UpDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_UpDebounceCount)^080h,f	;volatile
	line	82
	
i1l10530:	
;HMI.c: 82: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount)^080h,w	;volatile
	skipc
	goto	u380_21
	goto	u380_20
u380_21:
	goto	i1l4506
u380_20:
	
i1l10532:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u381_21
	goto	u381_20
u381_21:
	goto	i1l4506
u381_20:
	line	84
	
i1l10534:	
;HMI.c: 83: {
;HMI.c: 84: UpPressed = 1;
	bsf	(_UpPressed/8),(_UpPressed)&7
	line	85
;HMI.c: 85: UpReleased = 0;
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l4506
	line	86
	
i1l4505:	
	line	87
;HMI.c: 86: }
;HMI.c: 87: }
	goto	i1l4506
	line	88
	
i1l4504:	
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
	
i1l4506:	
	line	95
;HMI.c: 92: }
;HMI.c: 95: if(!RB3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(51/8),(51)&7
	goto	u382_21
	goto	u382_20
u382_21:
	goto	i1l4507
u382_20:
	line	97
	
i1l10536:	
;HMI.c: 96: {
;HMI.c: 97: DownDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_DownDebounceCount)^080h,f	;volatile
	line	98
	
i1l10538:	
;HMI.c: 98: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount)^080h,w	;volatile
	skipc
	goto	u383_21
	goto	u383_20
u383_21:
	goto	i1l4509
u383_20:
	
i1l10540:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u384_21
	goto	u384_20
u384_21:
	goto	i1l4509
u384_20:
	line	100
	
i1l10542:	
;HMI.c: 99: {
;HMI.c: 100: DownPressed = 1;
	bsf	(_DownPressed/8),(_DownPressed)&7
	line	101
;HMI.c: 101: DownReleased = 0;
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l4509
	line	102
	
i1l4508:	
	line	103
;HMI.c: 102: }
;HMI.c: 103: }
	goto	i1l4509
	line	104
	
i1l4507:	
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
	
i1l4509:	
	line	110
;HMI.c: 108: }
;HMI.c: 110: if(!RB4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(52/8),(52)&7
	goto	u385_21
	goto	u385_20
u385_21:
	goto	i1l4510
u385_20:
	line	112
	
i1l10544:	
;HMI.c: 111: {
;HMI.c: 112: LeftDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_LeftDebounceCount)^080h,f	;volatile
	line	113
	
i1l10546:	
;HMI.c: 113: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount)^080h,w	;volatile
	skipc
	goto	u386_21
	goto	u386_20
u386_21:
	goto	i1l4512
u386_20:
	
i1l10548:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u387_21
	goto	u387_20
u387_21:
	goto	i1l4512
u387_20:
	line	115
	
i1l10550:	
;HMI.c: 114: {
;HMI.c: 115: LeftPressed = 1;
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	line	116
;HMI.c: 116: LeftReleased = 0;
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l4512
	line	117
	
i1l4511:	
	line	118
;HMI.c: 117: }
;HMI.c: 118: }
	goto	i1l4512
	line	119
	
i1l4510:	
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
	
i1l4512:	
	line	125
;HMI.c: 123: }
;HMI.c: 125: if(!RB5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u388_21
	goto	u388_20
u388_21:
	goto	i1l4513
u388_20:
	line	127
	
i1l10552:	
;HMI.c: 126: {
;HMI.c: 127: RightDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RightDebounceCount)^080h,f	;volatile
	line	128
	
i1l10554:	
;HMI.c: 128: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount)^080h,w	;volatile
	skipc
	goto	u389_21
	goto	u389_20
u389_21:
	goto	i1l4515
u389_20:
	
i1l10556:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u390_21
	goto	u390_20
u390_21:
	goto	i1l4515
u390_20:
	line	130
	
i1l10558:	
;HMI.c: 129: {
;HMI.c: 130: RightPressed = 1;
	bsf	(_RightPressed/8),(_RightPressed)&7
	line	131
;HMI.c: 131: RightReleased = 0;
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l4515
	line	132
	
i1l4514:	
	line	133
;HMI.c: 132: }
;HMI.c: 133: }
	goto	i1l4515
	line	134
	
i1l4513:	
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
	
i1l4515:	
	line	140
;HMI.c: 138: }
;HMI.c: 140: if(!RB6)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u391_21
	goto	u391_20
u391_21:
	goto	i1l4516
u391_20:
	line	142
	
i1l10560:	
;HMI.c: 141: {
;HMI.c: 142: CenterDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_CenterDebounceCount)^080h,f	;volatile
	line	143
	
i1l10562:	
;HMI.c: 143: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount)^080h,w	;volatile
	skipc
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l4519
u392_20:
	
i1l10564:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u393_21
	goto	u393_20
u393_21:
	goto	i1l4519
u393_20:
	line	145
	
i1l10566:	
;HMI.c: 144: {
;HMI.c: 145: CenterPressed = 1;
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	line	146
;HMI.c: 146: CenterReleased = 0;
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l4519
	line	147
	
i1l4517:	
	line	148
;HMI.c: 147: }
;HMI.c: 148: }
	goto	i1l4519
	line	149
	
i1l4516:	
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
	goto	i1l4519
	line	153
	
i1l4518:	
	line	154
	
i1l4519:	
	return
	opt stack 0
GLOBAL	__end_of_Debounce
	__end_of_Debounce:
;; =============== function _Debounce ends ============

	signat	_Debounce,88
psect	text1011,local,class=CODE,delta=2
global __ptext1011
__ptext1011:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
