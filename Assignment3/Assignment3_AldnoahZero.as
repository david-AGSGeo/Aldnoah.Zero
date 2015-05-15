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
# 35 "H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 35 "H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
	dw 0xFFFE & 0xFFFB & 0xFFFF & 0xFFBF & 0xFFF7 & 0xFFFF & 0xFF7F & 0xFFFF ;#
	FNCALL	_main,_init
	FNCALL	_main,_robot_read
	FNCALL	_main,_readAvgDistance
	FNCALL	_main,_UpdateDisplay
	FNCALL	_main,_Menu
	FNCALL	_main,_straightLineTest
	FNCALL	_main,_robotMove
	FNCALL	_main,_robotTurn
	FNCALL	_main,_scan360
	FNCALL	_main,_rotate
	FNCALL	_main,___awtoft
	FNCALL	_main,___ftmul
	FNCALL	_main,___fttol
	FNCALL	_main,_ChargeMode
	FNCALL	_straightLineTest,_UpdateDisplay
	FNCALL	_straightLineTest,_robotTurn
	FNCALL	_straightLineTest,_robotMoveSpeed
	FNCALL	_robotMove,_ser_putch
	FNCALL	_robotMove,_robot_read
	FNCALL	_robotMove,_UpdateDisplay
	FNCALL	_scan360,_readAvgDistance
	FNCALL	_scan360,_rotate
	FNCALL	_scan360,_UpdateDisplay
	FNCALL	_ChargeMode,_ser_putch
	FNCALL	_ChargeMode,_UpdateDisplay
	FNCALL	_robotMoveSpeed,_ser_putch
	FNCALL	_robotMoveSpeed,_robot_read
	FNCALL	_robotMoveSpeed,_UpdateDisplay
	FNCALL	_robotMoveSpeed,_abs
	FNCALL	_readAvgDistance,_readDistance
	FNCALL	_readAvgDistance,___lwdiv
	FNCALL	_readAvgDistance,_ADCconvert
	FNCALL	_UpdateDisplay,_lcd_write_control
	FNCALL	_UpdateDisplay,_sprintf
	FNCALL	_UpdateDisplay,_lcd_set_cursor
	FNCALL	_UpdateDisplay,_lcd_write_string
	FNCALL	_UpdateDisplay,___awmod
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
	FNCALL	___awtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	_abs,___wmul
	FNCALL	_ser_getch,_ser_isrx
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_ADCconvert,___wmul
	FNCALL	_ADCconvert,___lwdiv
	FNCALL	_rotate,_spi_transfer
	FNCALL	_robotTurn,_ser_putch
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
	global	_assignedSpeed
	global	_current_step
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.c"
	line	32

;initializer for _menuStrings
	retlw	(STR_1-__stringbase)&0ffh
	retlw	(STR_2-__stringbase)&0ffh
	retlw	(STR_3-__stringbase)&0ffh
	retlw	(STR_4-__stringbase)&0ffh
	retlw	(STR_5-__stringbase)&0ffh
	retlw	(STR_6-__stringbase)&0ffh
	line	33

;initializer for _shortMenuStrings
	retlw	(STR_7-__stringbase)&0ffh
	retlw	(STR_8-__stringbase)&0ffh
	retlw	(STR_9-__stringbase)&0ffh
	retlw	(STR_10-__stringbase)&0ffh
	retlw	(STR_11-__stringbase)&0ffh
	retlw	(STR_12-__stringbase)&0ffh
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.h"
	line	7

;initializer for _assignedSpeed
	retlw	064h
	retlw	0

	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\steppermotor.c"
	line	30

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
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\lib\doprnt.c"
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
	global	_rxiptr
	global	_rxoptr
	global	_txiptr
	global	UpdateDisplay@F1236
	global	_txfifo
	global	_buttonPressed
	global	_CenterPressed
	global	_CenterReleased
	global	_DownPressed
	global	_DownReleased
	global	_LeftPressed
	global	_LeftReleased
	global	_RTC_FLAG_10MS
	global	_RTC_FLAG_1MS
	global	_RTC_FLAG_250MS
	global	_RTC_FLAG_500MS
	global	_RTC_FLAG_50MS
	global	_RightPressed
	global	_RightReleased
	global	_UpPressed
	global	_UpReleased
	global	_rxfifo
	global	_RTC_Counter
	global	_d2travel
	global	_distTravelled
	global	_dist_high
	global	_dist_low
	global	_distance
	global	_pos
	global	_test
	global	_total
	global	_totalSteps
	global	_CenterDebounceCount
	global	_DistHighByte
	global	_DistLowByte
	global	_DownDebounceCount
	global	_LeftDebounceCount
	global	_RightDebounceCount
	global	_UpDebounceCount
	global	_currentMenu
	global	_current_direction
	global	_highByte
	global	_lowByte
	global	_ser_tmp
	global	_serialInput
	global	_turnhighByte
	global	_turnlowByte
	global	_txoptr
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
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
	
STR_19:	
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
	
STR_15:	
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
	retlw	65	;'A'
	retlw	68	;'D'
	retlw	67	;'C'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	68	;'D'
	retlw	105	;'i'
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_21:	
	retlw	65	;'A'
	retlw	83	;'S'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	68	;'D'
	retlw	84	;'T'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_23:	
	retlw	68	;'D'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	68	;'D'
	retlw	58	;':'
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	0
psect	strings
	
STR_20:	
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
	
STR_17:	
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
	
STR_16:	
	retlw	60	;'<'
	retlw	60	;'<'
	retlw	60	;'<'
	retlw	0
psect	strings
	
STR_18:	
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
STR_14	equ	STR_13+0
STR_22	equ	STR_20+0
STR_24	equ	STR_20+0
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

_RTC_FLAG_10MS:
       ds      1

_RTC_FLAG_1MS:
       ds      1

_RTC_FLAG_250MS:
       ds      1

_RTC_FLAG_500MS:
       ds      1

_RTC_FLAG_50MS:
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

_rxiptr:
       ds      1

_rxoptr:
       ds      1

_txiptr:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_rxfifo:
       ds      16

_RTC_Counter:
       ds      2

_d2travel:
       ds      2

_distTravelled:
       ds      2

_dist_high:
       ds      2

_dist_low:
       ds      2

_distance:
       ds      2

_pos:
       ds      2

_test:
       ds      2

_total:
       ds      2

_totalSteps:
       ds      2

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

_RightDebounceCount:
       ds      1

_UpDebounceCount:
       ds      1

_currentMenu:
       ds      1

_current_direction:
       ds      1

_highByte:
       ds      1

_lowByte:
       ds      1

_ser_tmp:
       ds      1

_serialInput:
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
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.c"
	line	32
_menuStrings:
       ds      6

psect	dataBANK1
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.c"
	line	33
_shortMenuStrings:
       ds      6

psect	dataBANK1
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.h"
	line	7
_assignedSpeed:
       ds      2

psect	dataBANK1
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\steppermotor.c"
	line	30
_current_step:
       ds      1

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
UpdateDisplay@F1236:
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
	movlw	low((__pbssBANK1)+034h)
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
	movlw low(__pdataBANK1+15)
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
	global	main@direction1
main@direction1:	; 2 bytes @ 0x0
	ds	2
	global	main@RT2A
main@RT2A:	; 2 bytes @ 0x2
	ds	2
	global	main@choice
main@choice:	; 1 bytes @ 0x4
	ds	1
	global	main@shortwall
main@shortwall:	; 2 bytes @ 0x5
	ds	2
	global	main@RT2P
main@RT2P:	; 2 bytes @ 0x7
	ds	2
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_ser_init
?_ser_init:	; 0 bytes @ 0x0
	global	?_robo_init
?_robo_init:	; 0 bytes @ 0x0
	global	?_UpdateDisplay
?_UpdateDisplay:	; 0 bytes @ 0x0
	global	?_ser_putch
?_ser_putch:	; 0 bytes @ 0x0
	global	?_readAvgDistance
?_readAvgDistance:	; 0 bytes @ 0x0
	global	?_robot_read
?_robot_read:	; 0 bytes @ 0x0
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
	global	?_ChargeMode
?_ChargeMode:	; 0 bytes @ 0x0
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
	global	??_ser_putch
??_ser_putch:	; 0 bytes @ 0x0
	global	??_Menu
??_Menu:	; 0 bytes @ 0x0
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
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	Menu@BTN_input
Menu@BTN_input:	; 1 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
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
	global	?_robotTurn
?_robotTurn:	; 0 bytes @ 0x2
	global	??_robot_read
??_robot_read:	; 0 bytes @ 0x2
	global	lcd_write_control@databyte
lcd_write_control@databyte:	; 1 bytes @ 0x2
	global	lcd_write_data@databyte
lcd_write_data@databyte:	; 1 bytes @ 0x2
	global	spi_transfer@data
spi_transfer@data:	; 1 bytes @ 0x2
	global	robotTurn@distance
robotTurn@distance:	; 2 bytes @ 0x2
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
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	global	rotate@numsteps
rotate@numsteps:	; 2 bytes @ 0x3
	ds	1
	global	??_robotTurn
??_robotTurn:	; 0 bytes @ 0x4
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	global	adc_read@adc_value
adc_read@adc_value:	; 2 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
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
	ds	1
	global	??_abs
??_abs:	; 0 bytes @ 0x8
	global	?_readDistance
?_readDistance:	; 2 bytes @ 0x8
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	rotate@i
rotate@i:	; 2 bytes @ 0x8
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	ds	1
	global	??_lcd_write_string
??_lcd_write_string:	; 0 bytes @ 0x9
	ds	1
	global	??_readDistance
??_readDistance:	; 0 bytes @ 0xA
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0xA
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xB
	ds	1
	global	??___fttol
??___fttol:	; 0 bytes @ 0xC
	global	readDistance@fullval
readDistance@fullval:	; 2 bytes @ 0xC
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
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x10
	global	readAvgDistance@fullval
readAvgDistance@fullval:	; 2 bytes @ 0x10
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x10
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x11
	ds	1
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x12
	global	readAvgDistance@i
readAvgDistance@i:	; 2 bytes @ 0x12
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x13
	ds	1
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x14
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0x14
	ds	1
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x15
	ds	1
	global	?___awtoft
?___awtoft:	; 3 bytes @ 0x16
	global	___awtoft@c
___awtoft@c:	; 2 bytes @ 0x16
	ds	3
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0x19
	global	??___awtoft
??___awtoft:	; 0 bytes @ 0x19
	ds	2
	global	___awtoft@sign
___awtoft@sign:	; 1 bytes @ 0x1B
	ds	1
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x1C
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x1C
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x1C
	ds	1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x1D
	ds	1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x1E
	ds	1
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x1F
	global	sprintf@_val
sprintf@_val:	; 4 bytes @ 0x1F
	ds	3
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x22
	ds	1
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0x23
	ds	1
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x24
	ds	1
	global	??_UpdateDisplay
??_UpdateDisplay:	; 0 bytes @ 0x25
	ds	1
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x26
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x27
	ds	2
	global	UpdateDisplay@adcOutput
UpdateDisplay@adcOutput:	; 16 bytes @ 0x29
	ds	1
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x2A
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x2B
	ds	14
	global	?_robotMoveSpeed
?_robotMoveSpeed:	; 0 bytes @ 0x39
	global	?_robotMove
?_robotMove:	; 0 bytes @ 0x39
	global	??_ChargeMode
??_ChargeMode:	; 0 bytes @ 0x39
	global	?_scan360
?_scan360:	; 2 bytes @ 0x39
	global	robotMoveSpeed@distance
robotMoveSpeed@distance:	; 2 bytes @ 0x39
	global	robotMove@distance
robotMove@distance:	; 2 bytes @ 0x39
	ds	2
	global	??_robotMove
??_robotMove:	; 0 bytes @ 0x3B
	global	??_scan360
??_scan360:	; 0 bytes @ 0x3B
	global	scan360@lowestVal
scan360@lowestVal:	; 2 bytes @ 0x3B
	global	robotMoveSpeed@speed
robotMoveSpeed@speed:	; 2 bytes @ 0x3B
	ds	2
	global	??_robotMoveSpeed
??_robotMoveSpeed:	; 0 bytes @ 0x3D
	global	scan360@lowestSteps
scan360@lowestSteps:	; 2 bytes @ 0x3D
	ds	2
	global	scan360@steps
scan360@steps:	; 2 bytes @ 0x3F
	ds	1
	global	robotMoveSpeed@speedlowByte
robotMoveSpeed@speedlowByte:	; 1 bytes @ 0x40
	ds	1
	global	robotMoveSpeed@speedhighByte
robotMoveSpeed@speedhighByte:	; 1 bytes @ 0x41
	ds	1
	global	robotMoveSpeed@temp1
robotMoveSpeed@temp1:	; 2 bytes @ 0x42
	ds	2
	global	?_straightLineTest
?_straightLineTest:	; 0 bytes @ 0x44
	global	straightLineTest@menuflag
straightLineTest@menuflag:	; 2 bytes @ 0x44
	ds	2
	global	??_straightLineTest
??_straightLineTest:	; 0 bytes @ 0x46
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x47
	ds	3
;;Data sizes: Strings 170, constant 10, data 15, bss 91, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80     74      80
;; BANK1           80      9      76
;; BANK3           96      0      32
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?i1___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___ftpack	float  size(1) Largest target is 2
;;		 -> main@RT2P(BANK1[2]), 
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
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___awtoft	float  size(1) Largest target is 0
;;
;; ?_scan360	int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?_adc_read	unsigned int  size(1) Largest target is 0
;;
;; sprintf@f	PTR const unsigned char  size(1) Largest target is 15
;;		 -> STR_23(CODE[10]), STR_21(CODE[11]), STR_14(CODE[15]), STR_13(CODE[15]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;;		 -> UpdateDisplay@adcOutput(BANK0[16]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK0[2]), 
;;
;; S8178$_cp	PTR const unsigned char  size(1) Largest target is 0
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
;;		 -> STR_24(CODE[9]), STR_22(CODE[9]), STR_20(CODE[9]), STR_19(CODE[16]), 
;;		 -> STR_18(CODE[4]), STR_17(CODE[8]), STR_16(CODE[4]), STR_15(CODE[16]), 
;;		 -> UpdateDisplay@adcOutput(BANK0[16]), STR_12(CODE[4]), STR_11(CODE[4]), STR_10(CODE[4]), 
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
;;   _main->_straightLineTest
;;   _straightLineTest->_robotMoveSpeed
;;   _robotMove->_UpdateDisplay
;;   _scan360->_UpdateDisplay
;;   _ChargeMode->_UpdateDisplay
;;   _robotMoveSpeed->_UpdateDisplay
;;   _readAvgDistance->_ADCconvert
;;   _UpdateDisplay->_sprintf
;;   _readDistance->_adc_read_channel
;;   _robot_read->_ser_putch
;;   _robot_read->_ser_getch
;;   _lcd_init->_lcd_write_control
;;   _lcd_write_string->___awmod
;;   _lcd_set_cursor->_lcd_write_control
;;   ___awtoft->___fttol
;;   ___ftmul->___awtoft
;;   _abs->___wmul
;;   _sprintf->___lwmod
;;   _ADCconvert->___lwdiv
;;   _rotate->_spi_transfer
;;   _robotTurn->_ser_putch
;;   _robo_init->_ser_putch
;;   _adc_read_channel->_adc_read
;;   ___fttol->___ftpack
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
;; (0) _main                                                12    12      0   12260
;;                                             71 BANK0      3     3      0
;;                                              0 BANK1      9     9      0
;;                               _init
;;                         _robot_read
;;                    _readAvgDistance
;;                      _UpdateDisplay
;;                               _Menu
;;                   _straightLineTest
;;                          _robotMove
;;                          _robotTurn
;;                            _scan360
;;                             _rotate
;;                           ___awtoft
;;                            ___ftmul
;;                            ___fttol
;;                         _ChargeMode
;; ---------------------------------------------------------------------------------
;; (1) _straightLineTest                                     3     1      2    3324
;;                                             68 BANK0      3     1      2
;;                      _UpdateDisplay
;;                          _robotTurn
;;                     _robotMoveSpeed
;; ---------------------------------------------------------------------------------
;; (1) _robotMove                                            4     2      2    1504
;;                                             57 BANK0      4     2      2
;;                          _ser_putch
;;                         _robot_read
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (1) _scan360                                              8     6      2    2184
;;                                             57 BANK0      8     6      2
;;                    _readAvgDistance
;;                             _rotate
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (1) _ChargeMode                                           1     1      0    1415
;;                                             57 BANK0      1     1      0
;;                          _ser_putch
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (2) _robotMoveSpeed                                      11     7      4    1777
;;                                             57 BANK0     11     7      4
;;                          _ser_putch
;;                         _robot_read
;;                      _UpdateDisplay
;;                                _abs
;; ---------------------------------------------------------------------------------
;; (2) _readAvgDistance                                      4     4      0     555
;;                                             16 BANK0      4     4      0
;;                       _readDistance
;;                            ___lwdiv
;;                         _ADCconvert
;; ---------------------------------------------------------------------------------
;; (2) _UpdateDisplay                                       20    20      0    1393
;;                                             37 BANK0     20    20      0
;;                  _lcd_write_control
;;                            _sprintf
;;                     _lcd_set_cursor
;;                   _lcd_write_string
;;                            ___awmod
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
;; (2) _robot_read                                           2     2      0      45
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
;; (1) ___awtoft                                             6     3      3     300
;;                                             22 BANK0      6     3      3
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftmul                                             16    10      6     535
;;                                             28 BANK0     16    10      6
;;                           ___ftpack
;;                           ___awtoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (3) _abs                                                  4     2      2     158
;;                                              6 BANK0      4     2      2
;;                             ___wmul
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
;; (1) _rotate                                               7     4      3      98
;;                                              3 BANK0      7     4      3
;;                       _spi_transfer
;; ---------------------------------------------------------------------------------
;; (1) _robotTurn                                            3     1      2      88
;;                                              2 BANK0      3     1      2
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
;; (1) ___fttol                                             14    10      4     252
;;                                              8 BANK0     14    10      4
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftpack                                             8     3      5     209
;;                                              0 BANK0      8     3      5
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
;; (4) _ser_isrx                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _spi_transfer                                         3     3      0      30
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _Menu                                                 1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _ser_putch                                            2     2      0      22
;;                                              0 BANK0      2     2      0
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
;;   _straightLineTest
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
;;     _robotTurn
;;       _ser_putch
;;     _robotMoveSpeed
;;       _ser_putch
;;       _robot_read
;;         _ser_putch
;;         _ser_getch
;;           _ser_isrx
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
;;       _abs
;;         ___wmul
;;   _robotMove
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
;;   _robotTurn
;;     _ser_putch
;;   _scan360
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
;;   _rotate
;;     _spi_transfer
;;   ___awtoft
;;     ___ftpack
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;   ___ftmul
;;     ___ftpack
;;     ___awtoft (ARG)
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;   ___fttol
;;     ___ftpack (ARG)
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
;;BANK1               50      9      4C       7       95.0%
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
;;		line 369 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  RT2P            2    7[BANK1 ] int 
;;  RT2A            2    2[BANK1 ] int 
;;  direction1      2    0[BANK1 ] int 
;;  shortwall       2    5[BANK1 ] int 
;;  choice          1    4[BANK1 ] unsigned char 
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
;;      Locals:         0       0       9       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       3       9       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_init
;;		_robot_read
;;		_readAvgDistance
;;		_UpdateDisplay
;;		_Menu
;;		_straightLineTest
;;		_robotMove
;;		_robotTurn
;;		_scan360
;;		_rotate
;;		___awtoft
;;		___ftmul
;;		___fttol
;;		_ChargeMode
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
	line	369
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	370
	
l11781:	
;Main.c: 370: unsigned char choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@choice)^080h
	line	371
	
l11783:	
;Main.c: 371: int shortwall = 0;
	clrf	(main@shortwall)^080h
	clrf	(main@shortwall+1)^080h
	line	375
	
l11785:	
;Main.c: 375: init();
	fcall	_init
	goto	l11787
	line	380
;Main.c: 380: while(1)
	
l2285:	
	line	384
	
l11787:	
;Main.c: 381: {
;Main.c: 384: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5621
	goto	u5620
u5621:
	goto	l11819
u5620:
	line	386
	
l11789:	
;Main.c: 385: {
;Main.c: 386: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	387
	
l11791:	
;Main.c: 387: robot_read();
	fcall	_robot_read
	line	388
	
l11793:	
;Main.c: 388: readAvgDistance();
	fcall	_readAvgDistance
	line	389
	
l11795:	
;Main.c: 389: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11819
	line	390
	
l2286:	
	line	392
;Main.c: 390: }
;Main.c: 392: switch (buttonPressed)
	goto	l11819
	line	394
;Main.c: 393: {
;Main.c: 394: case 1:
	
l2288:	
	line	395
	
l11797:	
;Main.c: 395: Menu(1);
	movlw	(01h)
	fcall	_Menu
	line	397
	
l11799:	
;Main.c: 397: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	399
;Main.c: 399: break;
	goto	l11907
	line	400
;Main.c: 400: case 2:
	
l2290:	
	line	401
	
l11801:	
;Main.c: 401: Menu(2);
	movlw	(02h)
	fcall	_Menu
	line	403
	
l11803:	
;Main.c: 403: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	405
;Main.c: 405: break;
	goto	l11907
	line	406
;Main.c: 406: case 3:
	
l2291:	
	line	407
	
l11805:	
;Main.c: 407: Menu(3);
	movlw	(03h)
	fcall	_Menu
	line	409
	
l11807:	
;Main.c: 409: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	411
;Main.c: 411: break;
	goto	l11907
	line	412
;Main.c: 412: case 4:
	
l2292:	
	line	413
	
l11809:	
;Main.c: 413: Menu(4);
	movlw	(04h)
	fcall	_Menu
	line	415
	
l11811:	
;Main.c: 415: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	417
;Main.c: 417: break;
	goto	l11907
	line	418
;Main.c: 418: case 5:
	
l2293:	
	line	419
	
l11813:	
;Main.c: 419: choice = Menu(5);
	movlw	(05h)
	fcall	_Menu
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@choice)^080h
	line	421
	
l11815:	
;Main.c: 421: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	423
;Main.c: 423: break;
	goto	l11907
	line	424
;Main.c: 424: default:
	
l2294:	
	line	425
;Main.c: 425: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	426
;Main.c: 426: break;
	goto	l11907
	line	427
	
l11817:	
;Main.c: 427: }
	goto	l11907
	line	392
	
l2287:	
	
l11819:	
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
	goto	l11797
	xorlw	2^1	; case 2
	skipnz
	goto	l11801
	xorlw	3^2	; case 3
	skipnz
	goto	l11805
	xorlw	4^3	; case 4
	skipnz
	goto	l11809
	xorlw	5^4	; case 5
	skipnz
	goto	l11813
	goto	l2294
	opt asmopt_on

	line	427
	
l2289:	
	line	430
;Main.c: 430: switch (choice)
	goto	l11907
	line	432
;Main.c: 431: {
;Main.c: 432: case 0:
	
l2296:	
	line	435
	
l11821:	
;Main.c: 435: straightLineTest(0);
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_straightLineTest)
	movlw	high(0)
	movwf	((?_straightLineTest))+1
	fcall	_straightLineTest
	line	437
;Main.c: 437: break;
	goto	l11909
	line	438
;Main.c: 438: case 1:
	
l2298:	
	line	440
	
l11823:	
;Main.c: 440: straightLineTest(1);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_straightLineTest)
	movlw	high(01h)
	movwf	((?_straightLineTest))+1
	fcall	_straightLineTest
	line	441
;Main.c: 441: break;
	goto	l11909
	line	442
;Main.c: 442: case 2:
	
l2299:	
	line	443
	
l11825:	
;Main.c: 443: straightLineTest(1);
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_straightLineTest)
	movlw	high(01h)
	movwf	((?_straightLineTest))+1
	fcall	_straightLineTest
	line	448
;Main.c: 448: break;
	goto	l11909
	line	449
;Main.c: 449: case 3:
	
l2300:	
	line	450
	
l11827:	
;Main.c: 450: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u5737:
	decfsz	((??_main+0)+0),f
	goto	u5737
	decfsz	((??_main+0)+0+1),f
	goto	u5737
	decfsz	((??_main+0)+0+2),f
	goto	u5737
	nop2
opt asmopt_on

	line	451
	
l11829:	
;Main.c: 451: robotMove(1000);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMove)
	movlw	high(03E8h)
	movwf	((?_robotMove))+1
	fcall	_robotMove
	line	452
	
l11831:	
;Main.c: 452: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u5747:
	decfsz	((??_main+0)+0),f
	goto	u5747
	decfsz	((??_main+0)+0+1),f
	goto	u5747
	decfsz	((??_main+0)+0+2),f
	goto	u5747
	nop2
opt asmopt_on

	line	453
	
l11833:	
;Main.c: 453: robotTurn(-90);
	movlw	low(-90)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurn)
	movlw	high(-90)
	movwf	((?_robotTurn))+1
	fcall	_robotTurn
	line	454
	
l11835:	
;Main.c: 454: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u5757:
	decfsz	((??_main+0)+0),f
	goto	u5757
	decfsz	((??_main+0)+0+1),f
	goto	u5757
	decfsz	((??_main+0)+0+2),f
	goto	u5757
	nop2
opt asmopt_on

	line	455
	
l11837:	
;Main.c: 455: robotMove(1000);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMove)
	movlw	high(03E8h)
	movwf	((?_robotMove))+1
	fcall	_robotMove
	line	456
;Main.c: 456: break;
	goto	l11909
	line	457
;Main.c: 457: case 4:
	
l2301:	
	goto	l11839
	line	459
;Main.c: 459: while(1)
	
l2302:	
	line	461
	
l11839:	
;Main.c: 460: {
;Main.c: 461: shortwall = scan360() - 13;
	fcall	_scan360
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_scan360)),w
	addlw	low(-13)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@shortwall)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_scan360)),w
	skipnc
	addlw	1
	addlw	high(-13)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(main@shortwall)^080h
	line	462
	
l11841:	
;Main.c: 462: int RT2P = 0;
	clrf	(main@RT2P)^080h
	clrf	(main@RT2P+1)^080h
	line	463
	
l11843:	
;Main.c: 463: int direction1 = 0;
	clrf	(main@direction1)^080h
	clrf	(main@direction1+1)^080h
	line	464
	
l11845:	
;Main.c: 464: if (shortwall > 200)
	movf	(main@shortwall+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0C9h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5635
	movlw	low(0C9h)
	subwf	(main@shortwall)^080h,w
u5635:

	skipc
	goto	u5631
	goto	u5630
u5631:
	goto	l11849
u5630:
	line	465
	
l11847:	
;Main.c: 465: RT2P = shortwall + 100;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@shortwall)^080h,w
	addlw	low(064h)
	movwf	(main@RT2P)^080h
	movf	(main@shortwall+1)^080h,w
	skipnc
	addlw	1
	addlw	high(064h)
	movwf	1+(main@RT2P)^080h
	goto	l11849
	
l2303:	
	line	466
	
l11849:	
;Main.c: 466: if (shortwall < 200)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@shortwall+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0C8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5645
	movlw	low(0C8h)
	subwf	(main@shortwall)^080h,w
u5645:

	skipnc
	goto	u5641
	goto	u5640
u5641:
	goto	l11853
u5640:
	line	467
	
l11851:	
;Main.c: 467: RT2P = shortwall - 100;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@shortwall)^080h,w
	addlw	low(-100)
	movwf	(main@RT2P)^080h
	movf	(main@shortwall+1)^080h,w
	skipnc
	addlw	1
	addlw	high(-100)
	movwf	1+(main@RT2P)^080h
	goto	l11853
	
l2304:	
	line	470
	
l11853:	
;Main.c: 470: if (RT2P >= 400 && RT2P < 500 )
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@RT2P+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0190h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5655
	movlw	low(0190h)
	subwf	(main@RT2P)^080h,w
u5655:

	skipc
	goto	u5651
	goto	u5650
u5651:
	goto	l11861
u5650:
	
l11855:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@RT2P+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01F4h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5665
	movlw	low(01F4h)
	subwf	(main@RT2P)^080h,w
u5665:

	skipnc
	goto	u5661
	goto	u5660
u5661:
	goto	l11861
u5660:
	line	472
	
l11857:	
;Main.c: 471: {
;Main.c: 472: RT2P = RT2P - 400;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@RT2P)^080h,w
	addlw	low(-400)
	movwf	(main@RT2P)^080h
	movf	(main@RT2P+1)^080h,w
	skipnc
	addlw	1
	addlw	high(-400)
	movwf	1+(main@RT2P)^080h
	line	473
	
l11859:	
;Main.c: 473: direction1 = 1;
	movlw	low(01h)
	movwf	(main@direction1)^080h
	movlw	high(01h)
	movwf	((main@direction1)^080h)+1
	goto	l11861
	line	474
	
l2305:	
	line	475
	
l11861:	
;Main.c: 474: }
;Main.c: 475: if (RT2P >= 200 && RT2P < 400)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@RT2P+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0C8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5675
	movlw	low(0C8h)
	subwf	(main@RT2P)^080h,w
u5675:

	skipc
	goto	u5671
	goto	u5670
u5671:
	goto	l11871
u5670:
	
l11863:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@RT2P+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0190h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5685
	movlw	low(0190h)
	subwf	(main@RT2P)^080h,w
u5685:

	skipnc
	goto	u5681
	goto	u5680
u5681:
	goto	l11871
u5680:
	line	477
	
l11865:	
;Main.c: 476: {
;Main.c: 477: RT2P = 400 - RT2P;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(main@RT2P)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(main@RT2P+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??_main+0)+0+1)
	incf	(??_main+0)+0,f
	skipnz
	incf	((??_main+0)+0+1),f
	movf	0+(??_main+0)+0,w
	addlw	low(0190h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@RT2P)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_main+0)+0,w
	skipnc
	addlw	1
	addlw	high(0190h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(main@RT2P)^080h
	line	478
	
l11867:	
;Main.c: 478: RT2P = RT2P * -1;
	comf	(main@RT2P)^080h,f
	comf	(main@RT2P+1)^080h,f
	incf	(main@RT2P)^080h,f
	skipnz
	incf	(main@RT2P+1)^080h,f
	line	479
	
l11869:	
;Main.c: 479: direction1 = 0;
	clrf	(main@direction1)^080h
	clrf	(main@direction1+1)^080h
	goto	l11871
	line	480
	
l2306:	
	line	481
	
l11871:	
;Main.c: 480: }
;Main.c: 481: if (RT2P < 200 && RT2P >= 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@RT2P+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0C8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5695
	movlw	low(0C8h)
	subwf	(main@RT2P)^080h,w
u5695:

	skipnc
	goto	u5691
	goto	u5690
u5691:
	goto	l11877
u5690:
	
l11873:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(main@RT2P+1)^080h,7
	goto	u5701
	goto	u5700
u5701:
	goto	l11877
u5700:
	line	483
	
l11875:	
;Main.c: 482: {
;Main.c: 483: direction1 = 1;
	movlw	low(01h)
	movwf	(main@direction1)^080h
	movlw	high(01h)
	movwf	((main@direction1)^080h)+1
	goto	l11877
	line	484
	
l2307:	
	line	485
	
l11877:	
;Main.c: 484: }
;Main.c: 485: if (RT2P < 0 && RT2P >= -200)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(main@RT2P+1)^080h,7
	goto	u5711
	goto	u5710
u5711:
	goto	l11887
u5710:
	
l11879:	
	movf	(main@RT2P+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(-200))^80h
	subwf	btemp+1,w
	skipz
	goto	u5725
	movlw	low(-200)
	subwf	(main@RT2P)^080h,w
u5725:

	skipc
	goto	u5721
	goto	u5720
u5721:
	goto	l11887
u5720:
	line	488
	
l11881:	
;Main.c: 486: {
;Main.c: 488: direction1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(main@direction1)^080h
	clrf	(main@direction1+1)^080h
	goto	l11887
	line	489
	
l2308:	
	goto	l11887
	line	490
	
l11883:	
	goto	l11887
	
l11885:	
	goto	l11887
	
l2311:	
	goto	l11887
	line	493
;Main.c: 491: {
	
l2309:	
	line	495
	
l11887:	
;Main.c: 493: }
;Main.c: 495: rotate((400 - shortwall ), 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(main@shortwall)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(main@shortwall+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??_main+0)+0+1)
	incf	(??_main+0)+0,f
	skipnz
	incf	((??_main+0)+0+1),f
	movf	0+(??_main+0)+0,w
	addlw	low(0190h)
	movwf	(?_rotate)
	movf	1+(??_main+0)+0,w
	skipnc
	addlw	1
	addlw	high(0190h)
	movwf	1+(?_rotate)
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	496
	
l11889:	
;Main.c: 496: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u5767:
	decfsz	((??_main+0)+0),f
	goto	u5767
	decfsz	((??_main+0)+0+1),f
	goto	u5767
	decfsz	((??_main+0)+0+2),f
	goto	u5767
	nop2
opt asmopt_on

	line	499
	
l11891:	
;Main.c: 499: int RT2A= RT2P * (36.0/40.0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@RT2P+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___awtoft+1)
	addwf	(?___awtoft+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@RT2P)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?___awtoft)
	addwf	(?___awtoft)

	fcall	___awtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awtoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___awtoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___awtoft)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x66
	movwf	(?___ftmul)
	movlw	0x66
	movwf	(?___ftmul+1)
	movlw	0x3f
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(main@RT2A+1)^080h
	addwf	(main@RT2A+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(main@RT2A)^080h
	addwf	(main@RT2A)^080h

	line	500
	
l11893:	
;Main.c: 500: robotTurn(RT2A);
	movf	(main@RT2A+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_robotTurn+1)
	addwf	(?_robotTurn+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@RT2A)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_robotTurn)
	addwf	(?_robotTurn)

	fcall	_robotTurn
	line	501
	
l11895:	
;Main.c: 501: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u5777:
	decfsz	((??_main+0)+0),f
	goto	u5777
	decfsz	((??_main+0)+0+1),f
	goto	u5777
	decfsz	((??_main+0)+0+2),f
	goto	u5777
	nop2
opt asmopt_on

	line	502
	
l11897:	
;Main.c: 502: rotate(shortwall,0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@shortwall+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_rotate+1)
	addwf	(?_rotate+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@shortwall)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_rotate)
	addwf	(?_rotate)

	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	503
	
l11899:	
;Main.c: 503: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u5787:
	decfsz	((??_main+0)+0),f
	goto	u5787
	decfsz	((??_main+0)+0+1),f
	goto	u5787
	decfsz	((??_main+0)+0+2),f
	goto	u5787
	nop2
opt asmopt_on

	line	504
	
l11901:	
;Main.c: 504: robotMove(500);
	movlw	low(01F4h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMove)
	movlw	high(01F4h)
	movwf	((?_robotMove))+1
	fcall	_robotMove
	goto	l11839
	line	505
	
l2312:	
	line	459
	goto	l11839
	
l2313:	
	line	507
;Main.c: 505: }
;Main.c: 507: break;
	goto	l11909
	line	509
;Main.c: 509: case 5:
	
l2314:	
	line	510
	
l11903:	
;Main.c: 510: ChargeMode();
	fcall	_ChargeMode
	line	511
;Main.c: 511: break;
	goto	l11909
	line	512
;Main.c: 512: default:
	
l2315:	
	line	514
;Main.c: 514: break;
	goto	l11909
	line	515
	
l11905:	
;Main.c: 515: }
	goto	l11909
	line	430
	
l2295:	
	
l11907:	
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
	goto	l11821
	xorlw	1^0	; case 1
	skipnz
	goto	l11823
	xorlw	2^1	; case 2
	skipnz
	goto	l11825
	xorlw	3^2	; case 3
	skipnz
	goto	l11827
	xorlw	4^3	; case 4
	skipnz
	goto	l11839
	xorlw	5^4	; case 5
	skipnz
	goto	l11903
	goto	l11909
	opt asmopt_on

	line	515
	
l2297:	
	line	516
	
l11909:	
;Main.c: 516: choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@choice)^080h
	goto	l11787
	line	517
	
l2316:	
	line	380
	goto	l11787
	
l2317:	
	line	518
	
l2318:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_straightLineTest
psect	text1068,local,class=CODE,delta=2
global __ptext1068
__ptext1068:

;; *************** function _straightLineTest *****************
;; Defined at:
;;		line 163 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;  menuflag        2   68[BANK0 ] int 
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
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_UpdateDisplay
;;		_robotTurn
;;		_robotMoveSpeed
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1068
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
	line	163
	global	__size_of_straightLineTest
	__size_of_straightLineTest	equ	__end_of_straightLineTest-_straightLineTest
	
_straightLineTest:	
	opt	stack 0
; Regs used in _straightLineTest: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	165
	
l11743:	
;Main.c: 165: currentMenu = menuflag + 3;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(straightLineTest@menuflag),w
	addlw	03h
	movwf	(??_straightLineTest+0)+0
	movf	(??_straightLineTest+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_currentMenu)^080h	;volatile
	goto	l11745
	line	167
;Main.c: 167: while (1)
	
l2228:	
	line	169
	
l11745:	
;Main.c: 168: {
;Main.c: 169: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5571
	goto	u5570
u5571:
	goto	l11779
u5570:
	line	171
	
l11747:	
;Main.c: 170: {
;Main.c: 171: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	172
	
l11749:	
;Main.c: 172: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11779
	line	173
	
l2229:	
	line	174
;Main.c: 173: }
;Main.c: 174: switch (buttonPressed)
	goto	l11779
	line	176
;Main.c: 175: {
;Main.c: 176: case 1:
	
l2231:	
	line	179
;Main.c: 179: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	180
	
l11751:	
;Main.c: 180: robotTurn(180);
	movlw	low(0B4h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurn)
	movlw	high(0B4h)
	movwf	((?_robotTurn))+1
	fcall	_robotTurn
	line	182
;Main.c: 182: break;
	goto	l11745
	line	183
;Main.c: 183: case 2:
	
l2233:	
	line	186
;Main.c: 186: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	187
;Main.c: 187: currentMenu = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h	;volatile
	line	188
;Main.c: 188: return;
	goto	l2234
	line	190
;Main.c: 190: case 3:
	
l2235:	
	line	191
	
l11753:	
;Main.c: 191: if(menuflag)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(straightLineTest@menuflag+1),w
	iorwf	(straightLineTest@menuflag),w
	skipnz
	goto	u5581
	goto	u5580
u5581:
	goto	l11757
u5580:
	line	193
	
l11755:	
;Main.c: 192: {
;Main.c: 193: d2travel -= 500;
	movlw	low(-500)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_d2travel)^080h,f
	skipnc
	incf	(_d2travel+1)^080h,f
	movlw	high(-500)
	addwf	(_d2travel+1)^080h,f
	line	194
;Main.c: 194: assignedSpeed = 200;
	movlw	low(0C8h)
	movwf	(_assignedSpeed)^080h
	movlw	high(0C8h)
	movwf	((_assignedSpeed)^080h)+1
	line	195
;Main.c: 195: }
	goto	l11759
	line	196
	
l2236:	
	line	198
	
l11757:	
;Main.c: 196: else
;Main.c: 197: {
;Main.c: 198: assignedSpeed -= 100;
	movlw	low(-100)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_assignedSpeed)^080h,f
	skipnc
	incf	(_assignedSpeed+1)^080h,f
	movlw	high(-100)
	addwf	(_assignedSpeed+1)^080h,f
	line	199
;Main.c: 199: d2travel = 2000;
	movlw	low(07D0h)
	movwf	(_d2travel)^080h
	movlw	high(07D0h)
	movwf	((_d2travel)^080h)+1
	goto	l11759
	line	200
	
l2237:	
	line	201
	
l11759:	
;Main.c: 200: }
;Main.c: 201: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	203
;Main.c: 203: break;
	goto	l11745
	line	204
;Main.c: 204: case 4:
	
l2238:	
	line	205
	
l11761:	
;Main.c: 205: if(menuflag)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(straightLineTest@menuflag+1),w
	iorwf	(straightLineTest@menuflag),w
	skipnz
	goto	u5591
	goto	u5590
u5591:
	goto	l11765
u5590:
	line	207
	
l11763:	
;Main.c: 206: {
;Main.c: 207: d2travel += 500;
	movlw	low(01F4h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_d2travel)^080h,f
	skipnc
	incf	(_d2travel+1)^080h,f
	movlw	high(01F4h)
	addwf	(_d2travel+1)^080h,f
	line	208
;Main.c: 208: assignedSpeed = 200;
	movlw	low(0C8h)
	movwf	(_assignedSpeed)^080h
	movlw	high(0C8h)
	movwf	((_assignedSpeed)^080h)+1
	line	209
;Main.c: 209: }
	goto	l11767
	line	210
	
l2239:	
	line	212
	
l11765:	
;Main.c: 210: else
;Main.c: 211: {
;Main.c: 212: assignedSpeed += 100;
	movlw	low(064h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_assignedSpeed)^080h,f
	skipnc
	incf	(_assignedSpeed+1)^080h,f
	movlw	high(064h)
	addwf	(_assignedSpeed+1)^080h,f
	line	213
;Main.c: 213: d2travel = 2000;
	movlw	low(07D0h)
	movwf	(_d2travel)^080h
	movlw	high(07D0h)
	movwf	((_d2travel)^080h)+1
	goto	l11767
	line	214
	
l2240:	
	line	215
	
l11767:	
;Main.c: 214: }
;Main.c: 215: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	217
;Main.c: 217: break;
	goto	l11745
	line	218
;Main.c: 218: case 5:
	
l2241:	
	line	220
	
l11769:	
;Main.c: 220: if (assignedSpeed && d2travel)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_assignedSpeed+1)^080h,w
	iorwf	(_assignedSpeed)^080h,w
	skipnz
	goto	u5601
	goto	u5600
u5601:
	goto	l11775
u5600:
	
l11771:	
	movf	(_d2travel+1)^080h,w
	iorwf	(_d2travel)^080h,w
	skipnz
	goto	u5611
	goto	u5610
u5611:
	goto	l11775
u5610:
	line	222
	
l11773:	
;Main.c: 221: {
;Main.c: 222: robotMoveSpeed(d2travel,assignedSpeed);
	movf	(_d2travel+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_robotMoveSpeed+1)
	addwf	(?_robotMoveSpeed+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_d2travel)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_robotMoveSpeed)
	addwf	(?_robotMoveSpeed)

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_assignedSpeed+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_robotMoveSpeed)+02h
	addwf	1+(?_robotMoveSpeed)+02h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_assignedSpeed)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_robotMoveSpeed)+02h
	addwf	0+(?_robotMoveSpeed)+02h

	fcall	_robotMoveSpeed
	goto	l11775
	line	223
	
l2242:	
	line	225
	
l11775:	
;Main.c: 223: }
;Main.c: 225: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	goto	l11745
	line	226
;Main.c: 226: default:
	
l2243:	
	line	228
;Main.c: 228: break;
	goto	l11745
	line	229
	
l11777:	
;Main.c: 229: }
	goto	l11745
	line	174
	
l2230:	
	
l11779:	
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
	goto	l2231
	xorlw	2^1	; case 2
	skipnz
	goto	l2233
	xorlw	3^2	; case 3
	skipnz
	goto	l11753
	xorlw	4^3	; case 4
	skipnz
	goto	l11761
	xorlw	5^4	; case 5
	skipnz
	goto	l11769
	goto	l11745
	opt asmopt_on

	line	229
	
l2232:	
	goto	l11745
	line	231
	
l2244:	
	line	167
	goto	l11745
	
l2245:	
	line	232
	
l2234:	
	return
	opt stack 0
GLOBAL	__end_of_straightLineTest
	__end_of_straightLineTest:
;; =============== function _straightLineTest ends ============

	signat	_straightLineTest,4216
	global	_robotMove
psect	text1069,local,class=CODE,delta=2
global __ptext1069
__ptext1069:

;; *************** function _robotMove *****************
;; Defined at:
;;		line 76 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  distance        2   57[BANK0 ] int 
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
;;      Temps:          0       2       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_ser_putch
;;		_robot_read
;;		_UpdateDisplay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1069
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\robot.c"
	line	76
	global	__size_of_robotMove
	__size_of_robotMove	equ	__end_of_robotMove-_robotMove
	
_robotMove:	
	opt	stack 1
; Regs used in _robotMove: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	77
	
l11721:	
;robot.c: 77: distTravelled =0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	80
	
l11723:	
;robot.c: 80: if (distance >= 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(robotMove@distance+1),7
	goto	u5541
	goto	u5540
u5541:
	goto	l11727
u5540:
	line	82
	
l11725:	
;robot.c: 81: {
;robot.c: 82: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	84
;robot.c: 84: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	86
;robot.c: 86: ser_putch(50);
	movlw	(032h)
	fcall	_ser_putch
	line	88
;robot.c: 88: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	90
;robot.c: 90: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	91
;robot.c: 91: }
	goto	l11739
	line	92
	
l6068:	
	line	94
	
l11727:	
;robot.c: 92: else
;robot.c: 93: {
;robot.c: 94: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	96
;robot.c: 96: ser_putch(0xff);
	movlw	(0FFh)
	fcall	_ser_putch
	line	98
;robot.c: 98: ser_putch(0x38);
	movlw	(038h)
	fcall	_ser_putch
	line	100
;robot.c: 100: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	102
;robot.c: 102: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	goto	l11739
	line	103
	
l6069:	
	line	106
;robot.c: 103: }
;robot.c: 106: while (distTravelled <= distance)
	goto	l11739
	
l6071:	
	line	108
	
l11729:	
;robot.c: 107: {
;robot.c: 108: robot_read();
	fcall	_robot_read
	line	109
	
l11731:	
;robot.c: 109: if (BumpSensors)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_BumpSensors),w	;volatile
	skipz
	goto	u5550
	goto	l11735
u5550:
	goto	l11741
	line	110
	
l11733:	
;robot.c: 110: break;
	goto	l11741
	
l6072:	
	line	111
	
l11735:	
;robot.c: 111: distTravelled += DistLowByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_DistLowByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMove+0)+0
	clrf	(??_robotMove+0)+0+1
	movf	0+(??_robotMove+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_distTravelled)^080h,f
	skipnc
	incf	(_distTravelled+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_robotMove+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_distTravelled+1)^080h,f
	line	112
	
l11737:	
;robot.c: 112: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11739
	line	113
	
l6070:	
	line	106
	
l11739:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotMove@distance+1),w
	xorlw	80h
	movwf	(??_robotMove+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled+1)^080h,w
	xorlw	80h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(??_robotMove+0)+0,w
	skipz
	goto	u5565
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(robotMove@distance),w
u5565:

	skipnc
	goto	u5561
	goto	u5560
u5561:
	goto	l11729
u5560:
	goto	l11741
	
l6073:	
	line	115
	
l11741:	
;robot.c: 113: }
;robot.c: 115: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	117
;robot.c: 117: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	119
;robot.c: 119: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	121
;robot.c: 121: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	123
;robot.c: 123: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	125
	
l6074:	
	return
	opt stack 0
GLOBAL	__end_of_robotMove
	__end_of_robotMove:
;; =============== function _robotMove ends ============

	signat	_robotMove,4216
	global	_scan360
psect	text1070,local,class=CODE,delta=2
global __ptext1070
__ptext1070:

;; *************** function _scan360 *****************
;; Defined at:
;;		line 340 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  steps           2   63[BANK0 ] int 
;;  lowestSteps     2   61[BANK0 ] int 
;;  lowestVal       2   59[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2   57[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_readAvgDistance
;;		_rotate
;;		_UpdateDisplay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1070
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
	line	340
	global	__size_of_scan360
	__size_of_scan360	equ	__end_of_scan360-_scan360
	
_scan360:	
	opt	stack 0
; Regs used in _scan360: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	341
	
l11691:	
;Main.c: 341: int lowestVal = 0, lowestSteps = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(scan360@lowestVal)
	clrf	(scan360@lowestVal+1)
	clrf	(scan360@lowestSteps)
	clrf	(scan360@lowestSteps+1)
	line	343
;Main.c: 343: for (int steps = 0; steps < 400; steps++)
	clrf	(scan360@steps)
	clrf	(scan360@steps+1)
	
l11693:	
	movf	(scan360@steps+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0190h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5505
	movlw	low(0190h)
	subwf	(scan360@steps),w
u5505:

	skipc
	goto	u5501
	goto	u5500
u5501:
	goto	l11697
u5500:
	goto	l11717
	
l11695:	
	goto	l11717
	line	344
	
l2278:	
	line	345
	
l11697:	
;Main.c: 344: {
;Main.c: 345: readAvgDistance();
	fcall	_readAvgDistance
	line	346
	
l11699:	
;Main.c: 346: if (adcVal > lowestVal)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	subwf	(scan360@lowestVal+1),w
	skipz
	goto	u5515
	movf	(_adcVal),w	;volatile
	subwf	(scan360@lowestVal),w
u5515:
	skipnc
	goto	u5511
	goto	u5510
u5511:
	goto	l11703
u5510:
	line	348
	
l11701:	
;Main.c: 347: {
;Main.c: 348: lowestVal = adcVal;
	movf	(_adcVal+1),w	;volatile
	clrf	(scan360@lowestVal+1)	;volatile
	addwf	(scan360@lowestVal+1)	;volatile
	movf	(_adcVal),w	;volatile
	clrf	(scan360@lowestVal)	;volatile
	addwf	(scan360@lowestVal)	;volatile

	line	349
;Main.c: 349: lowestSteps = steps;
	movf	(scan360@steps+1),w
	clrf	(scan360@lowestSteps+1)
	addwf	(scan360@lowestSteps+1)
	movf	(scan360@steps),w
	clrf	(scan360@lowestSteps)
	addwf	(scan360@lowestSteps)

	goto	l11703
	line	351
	
l2280:	
	line	352
	
l11703:	
;Main.c: 351: }
;Main.c: 352: rotate(1, 1);
	movlw	low(01h)
	movwf	(?_rotate)
	movlw	high(01h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	line	354
	
l11705:	
;Main.c: 354: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5521
	goto	u5520
u5521:
	goto	l11711
u5520:
	line	356
	
l11707:	
;Main.c: 355: {
;Main.c: 356: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	357
	
l11709:	
;Main.c: 357: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11711
	line	358
	
l2281:	
	line	359
	
l11711:	
;Main.c: 358: }
;Main.c: 359: test = lowestSteps;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(scan360@lowestSteps+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_test+1)^080h
	addwf	(_test+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(scan360@lowestSteps),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_test)^080h
	addwf	(_test)^080h

	line	343
	
l11713:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(scan360@steps),f
	skipnc
	incf	(scan360@steps+1),f
	movlw	high(01h)
	addwf	(scan360@steps+1),f
	
l11715:	
	movf	(scan360@steps+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0190h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5535
	movlw	low(0190h)
	subwf	(scan360@steps),w
u5535:

	skipc
	goto	u5531
	goto	u5530
u5531:
	goto	l11697
u5530:
	goto	l11717
	
l2279:	
	line	362
	
l11717:	
;Main.c: 360: }
;Main.c: 362: return lowestSteps;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(scan360@lowestSteps+1),w
	clrf	(?_scan360+1)
	addwf	(?_scan360+1)
	movf	(scan360@lowestSteps),w
	clrf	(?_scan360)
	addwf	(?_scan360)

	goto	l2282
	
l11719:	
	line	363
	
l2282:	
	return
	opt stack 0
GLOBAL	__end_of_scan360
	__end_of_scan360:
;; =============== function _scan360 ends ============

	signat	_scan360,90
	global	_ChargeMode
psect	text1071,local,class=CODE,delta=2
global __ptext1071
__ptext1071:

;; *************** function _ChargeMode *****************
;; Defined at:
;;		line 286 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
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
psect	text1071
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
	line	286
	global	__size_of_ChargeMode
	__size_of_ChargeMode	equ	__end_of_ChargeMode-_ChargeMode
	
_ChargeMode:	
	opt	stack 1
; Regs used in _ChargeMode: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	288
	
l11669:	
;Main.c: 288: currentMenu = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ChargeMode+0)+0
	movf	(??_ChargeMode+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_currentMenu)^080h	;volatile
	line	289
	
l11671:	
;Main.c: 289: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	goto	l11673
	line	291
;Main.c: 291: while (1)
	
l2263:	
	line	293
	
l11673:	
;Main.c: 292: {
;Main.c: 293: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u5491
	goto	u5490
u5491:
	goto	l11689
u5490:
	line	295
	
l11675:	
;Main.c: 294: {
;Main.c: 295: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	296
	
l11677:	
;Main.c: 296: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11689
	line	297
	
l2264:	
	line	298
;Main.c: 297: }
;Main.c: 298: switch (buttonPressed)
	goto	l11689
	line	300
;Main.c: 299: {
;Main.c: 300: case 1:
	
l2266:	
	line	303
;Main.c: 303: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	305
;Main.c: 305: break;
	goto	l11673
	line	306
;Main.c: 306: case 2:
	
l2268:	
	line	309
;Main.c: 309: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	311
;Main.c: 311: break;
	goto	l11673
	line	312
;Main.c: 312: case 3:
	
l2269:	
	line	315
;Main.c: 315: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	317
;Main.c: 317: break;
	goto	l11673
	line	318
;Main.c: 318: case 4:
	
l2270:	
	line	321
;Main.c: 321: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	323
;Main.c: 323: break;
	goto	l11673
	line	324
;Main.c: 324: case 5:
	
l2271:	
	line	325
	
l11679:	
;Main.c: 325: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	327
	
l11681:	
;Main.c: 327: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	328
	
l11683:	
;Main.c: 328: currentMenu = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h	;volatile
	goto	l2272
	line	329
	
l11685:	
;Main.c: 329: return;
	goto	l2272
	line	331
;Main.c: 331: default:
	
l2273:	
	line	332
;Main.c: 332: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	333
;Main.c: 333: break;
	goto	l11673
	line	334
	
l11687:	
;Main.c: 334: }
	goto	l11673
	line	298
	
l2265:	
	
l11689:	
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
	goto	l2266
	xorlw	2^1	; case 2
	skipnz
	goto	l2268
	xorlw	3^2	; case 3
	skipnz
	goto	l2269
	xorlw	4^3	; case 4
	skipnz
	goto	l2270
	xorlw	5^4	; case 5
	skipnz
	goto	l11679
	goto	l2273
	opt asmopt_on

	line	334
	
l2267:	
	goto	l11673
	line	335
	
l2274:	
	line	291
	goto	l11673
	
l2275:	
	line	336
	
l2272:	
	return
	opt stack 0
GLOBAL	__end_of_ChargeMode
	__end_of_ChargeMode:
;; =============== function _ChargeMode ends ============

	signat	_ChargeMode,88
	global	_robotMoveSpeed
psect	text1072,local,class=CODE,delta=2
global __ptext1072
__ptext1072:

;; *************** function _robotMoveSpeed *****************
;; Defined at:
;;		line 34 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  distance        2   57[BANK0 ] int 
;;  speed           2   59[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  temp1           2   66[BANK0 ] int 
;;  speedhighByt    1   65[BANK0 ] unsigned char 
;;  speedlowByte    1   64[BANK0 ] unsigned char 
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
;;      Locals:         0       4       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      11       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_ser_putch
;;		_robot_read
;;		_UpdateDisplay
;;		_abs
;; This function is called by:
;;		_straightLineTest
;; This function uses a non-reentrant model
;;
psect	text1072
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\robot.c"
	line	34
	global	__size_of_robotMoveSpeed
	__size_of_robotMoveSpeed	equ	__end_of_robotMoveSpeed-_robotMoveSpeed
	
_robotMoveSpeed:	
	opt	stack 0
; Regs used in _robotMoveSpeed: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	35
	
l11635:	
;robot.c: 35: distTravelled = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h
	clrf	(_distTravelled+1)^080h
	line	37
	
l11637:	
;robot.c: 36: int temp1;
;robot.c: 37: unsigned char speedlowByte = (unsigned char) (speed) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotMoveSpeed@speed),w
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@speedlowByte)
	line	38
;robot.c: 38: unsigned char speedhighByte = (unsigned char) (speed >> 8);
	movf	(robotMoveSpeed@speed+1),w
	movwf	(??_robotMoveSpeed+0)+0
	movf	(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@speedhighByte)
	line	40
	
l11639:	
;robot.c: 40: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	42
	
l11641:	
;robot.c: 42: ser_putch(speedhighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotMoveSpeed@speedhighByte),w
	fcall	_ser_putch
	line	44
	
l11643:	
;robot.c: 44: ser_putch(speedlowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotMoveSpeed@speedlowByte),w
	fcall	_ser_putch
	line	46
	
l11645:	
;robot.c: 46: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	48
	
l11647:	
;robot.c: 48: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	50
;robot.c: 50: while (abs(distTravelled) <= abs(distance))
	goto	l11665
	
l6062:	
	line	52
	
l11649:	
;robot.c: 51: {
;robot.c: 52: robot_read();
	fcall	_robot_read
	line	53
	
l11651:	
;robot.c: 53: if (BumpSensors)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_BumpSensors),w	;volatile
	skipz
	goto	u5470
	goto	l11655
u5470:
	goto	l11667
	line	55
	
l11653:	
;robot.c: 54: {
;robot.c: 55: break;
	goto	l11667
	line	56
	
l6063:	
	line	57
	
l11655:	
;robot.c: 56: }
;robot.c: 57: temp1 = DistHighByte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_DistHighByte)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robotMoveSpeed+0)+0
	clrf	(??_robotMoveSpeed+0)+0+1
	movf	0+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1)
	movf	1+(??_robotMoveSpeed+0)+0,w
	movwf	(robotMoveSpeed@temp1+1)
	line	58
	
l11657:	
;robot.c: 58: temp1 = temp1 << 8;
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
	line	59
	
l11659:	
;robot.c: 59: temp1 += DistLowByte;
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
	line	60
	
l11661:	
;robot.c: 60: distTravelled += temp1;
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
	line	61
	
l11663:	
;robot.c: 61: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11665
	line	62
	
l6061:	
	line	50
	
l11665:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotMoveSpeed@distance+1),w
	clrf	(?_abs+1)
	addwf	(?_abs+1)
	movf	(robotMoveSpeed@distance),w
	clrf	(?_abs)
	addwf	(?_abs)

	fcall	_abs
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+?_abs),w
	movwf	(??_robotMoveSpeed+0)+0
	movf	(1+?_abs),w
	movwf	((??_robotMoveSpeed+0)+0+1)
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
	movf	1+(??_robotMoveSpeed+0)+0,w
	xorlw	80h
	movwf	(??_robotMoveSpeed+2)+0
	movf	(1+(?_abs)),w
	xorlw	80h
	subwf	(??_robotMoveSpeed+2)+0,w
	skipz
	goto	u5485
	movf	(0+(?_abs)),w
	subwf	0+(??_robotMoveSpeed+0)+0,w
u5485:

	skipnc
	goto	u5481
	goto	u5480
u5481:
	goto	l11649
u5480:
	goto	l11667
	
l6064:	
	line	64
	
l11667:	
;robot.c: 62: }
;robot.c: 64: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	66
;robot.c: 66: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	68
;robot.c: 68: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	70
;robot.c: 70: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	72
;robot.c: 72: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	73
	
l6065:	
	return
	opt stack 0
GLOBAL	__end_of_robotMoveSpeed
	__end_of_robotMoveSpeed:
;; =============== function _robotMoveSpeed ends ============

	signat	_robotMoveSpeed,8312
	global	_readAvgDistance
psect	text1073,local,class=CODE,delta=2
global __ptext1073
__ptext1073:

;; *************** function _readAvgDistance *****************
;; Defined at:
;;		line 10 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   18[BANK0 ] int 
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
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_readDistance
;;		___lwdiv
;;		_ADCconvert
;; This function is called by:
;;		_scan360
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1073
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\infrared.c"
	line	10
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	11
	
l11621:	
;infrared.c: 11: unsigned int fullval = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(readAvgDistance@fullval)
	clrf	(readAvgDistance@fullval+1)
	line	14
;infrared.c: 14: for (int i = 0; i < 10; i++)
	clrf	(readAvgDistance@i)
	clrf	(readAvgDistance@i+1)
	
l11623:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u5455
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u5455:

	skipc
	goto	u5451
	goto	u5450
u5451:
	goto	l11627
u5450:
	goto	l11633
	
l11625:	
	goto	l11633
	line	15
	
l3021:	
	line	16
	
l11627:	
;infrared.c: 15: {
;infrared.c: 16: fullval += readDistance();
	fcall	_readDistance
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_readDistance)),w
	addwf	(readAvgDistance@fullval),f
	skipnc
	incf	(readAvgDistance@fullval+1),f
	movf	(1+(?_readDistance)),w
	addwf	(readAvgDistance@fullval+1),f
	line	14
	
l11629:	
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
l11631:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u5465
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u5465:

	skipc
	goto	u5461
	goto	u5460
u5461:
	goto	l11627
u5460:
	goto	l11633
	
l3022:	
	line	19
	
l11633:	
;infrared.c: 18: }
;infrared.c: 19: adcVal = fullval / 10;
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
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

	line	20
;infrared.c: 20: ADCconvert();
	fcall	_ADCconvert
	line	21
	
l3023:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,88
	global	_UpdateDisplay
psect	text1074,local,class=CODE,delta=2
global __ptext1074
__ptext1074:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 216 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adcOutput      16   41[BANK0 ] unsigned char [16]
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
;;		_straightLineTest
;;		_ChargeMode
;;		_scan360
;;		_main
;;		_robotMoveSpeed
;;		_robotMove
;;		_calibrateIR
;; This function uses a non-reentrant model
;;
psect	text1074
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.c"
	line	216
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
	opt	stack 1
; Regs used in _UpdateDisplay: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	217
	
l11555:	
;HMI.c: 217: char adcOutput[16] = "";
	movlw	(UpdateDisplay@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1236)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	fsr0,w
	movwf	((??_UpdateDisplay+0)+0+1)
	movlw	16
	movwf	((??_UpdateDisplay+0)+0+2)
u5430:
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
	goto	u5430
	line	218
;HMI.c: 218: switch (currentMenu)
	goto	l11619
	line	221
;HMI.c: 219: {
;HMI.c: 221: case 0:
	
l4584:	
	line	224
	
l11557:	
;HMI.c: 224: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	226
	
l11559:	
;HMI.c: 226: sprintf(adcOutput,"ADC:%d Dist:%d",BumpSensors, distTravelled);
	movlw	((STR_13-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	(??_UpdateDisplay+0)+0,w
	movwf	(?_sprintf)
	movf	(_BumpSensors),w	;volatile
	movwf	(??_UpdateDisplay+1)+0
	clrf	(??_UpdateDisplay+1)+0+1
	movf	0+(??_UpdateDisplay+1)+0,w
	movwf	0+(?_sprintf)+01h
	movf	1+(??_UpdateDisplay+1)+0,w
	movwf	1+(?_sprintf)+01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+03h
	addwf	1+(?_sprintf)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+03h
	addwf	0+(?_sprintf)+03h

	movlw	(UpdateDisplay@adcOutput)&0ffh
	fcall	_sprintf
	line	229
	
l11561:	
;HMI.c: 229: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	230
;HMI.c: 230: lcd_write_string(adcOutput);
	movlw	(UpdateDisplay@adcOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	232
	
l11563:	
;HMI.c: 232: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	233
	
l11565:	
;HMI.c: 233: if (pos > 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5445
	movlw	low(01h)
	subwf	(_pos)^080h,w
u5445:

	skipc
	goto	u5441
	goto	u5440
u5441:
	goto	l11569
u5440:
	line	234
	
l11567:	
;HMI.c: 234: lcd_write_string(shortMenuStrings[pos - 1]);
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
	goto	l11571
	line	235
	
l4585:	
	line	236
	
l11569:	
;HMI.c: 235: else
;HMI.c: 236: lcd_write_string(shortMenuStrings[pos + 6 - 1]);
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
	goto	l11571
	
l4586:	
	line	237
	
l11571:	
;HMI.c: 237: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	238
	
l11573:	
;HMI.c: 238: lcd_write_string(menuStrings[pos]);
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
	line	239
;HMI.c: 239: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	240
	
l11575:	
;HMI.c: 240: lcd_write_string(shortMenuStrings[(pos + 1) % 6]);
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
	line	241
;HMI.c: 241: break;
	goto	l4593
	line	242
;HMI.c: 242: case 1:
	
l4588:	
	line	243
	
l11577:	
;HMI.c: 243: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	244
	
l11579:	
;HMI.c: 244: sprintf(adcOutput,"ADC:%d Dist:%d",BumpSensors, distTravelled);
	movlw	((STR_14-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	(??_UpdateDisplay+0)+0,w
	movwf	(?_sprintf)
	movf	(_BumpSensors),w	;volatile
	movwf	(??_UpdateDisplay+1)+0
	clrf	(??_UpdateDisplay+1)+0+1
	movf	0+(??_UpdateDisplay+1)+0,w
	movwf	0+(?_sprintf)+01h
	movf	1+(??_UpdateDisplay+1)+0,w
	movwf	1+(?_sprintf)+01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+03h
	addwf	1+(?_sprintf)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+03h
	addwf	0+(?_sprintf)+03h

	movlw	(UpdateDisplay@adcOutput)&0ffh
	fcall	_sprintf
	line	245
	
l11581:	
;HMI.c: 245: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	246
;HMI.c: 246: lcd_write_string("Zero Step_Motor");
	movlw	low((STR_15-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	251
	
l11583:	
;HMI.c: 251: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	253
	
l11585:	
;HMI.c: 253: lcd_write_string("<<<");
	movlw	low((STR_16-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	256
;HMI.c: 256: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	257
	
l11587:	
;HMI.c: 257: lcd_write_string("CONFIRM");
	movlw	low((STR_17-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	258
	
l11589:	
;HMI.c: 258: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	259
;HMI.c: 259: lcd_write_string(">>>");
	movlw	low((STR_18-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	260
;HMI.c: 260: break;
	goto	l4593
	line	261
;HMI.c: 261: case 2:
	
l4589:	
	line	262
	
l11591:	
;HMI.c: 262: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	264
;HMI.c: 264: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	265
	
l11593:	
;HMI.c: 265: lcd_write_string(" Charging Mode ");
	movlw	low((STR_19-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	269
	
l11595:	
;HMI.c: 269: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	270
;HMI.c: 270: lcd_write_string("  EXIT  ");
	movlw	low((STR_20-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	272
;HMI.c: 272: break;
	goto	l4593
	line	273
;HMI.c: 273: case 3:
	
l4590:	
	line	274
	
l11597:	
;HMI.c: 274: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	275
	
l11599:	
;HMI.c: 275: sprintf(adcOutput,"AS:%dDT:%d",assignedSpeed, distTravelled);
	movlw	((STR_21-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	(??_UpdateDisplay+0)+0,w
	movwf	(?_sprintf)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_assignedSpeed+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_assignedSpeed)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+01h
	addwf	0+(?_sprintf)+01h

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+03h
	addwf	1+(?_sprintf)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+03h
	addwf	0+(?_sprintf)+03h

	movlw	(UpdateDisplay@adcOutput)&0ffh
	fcall	_sprintf
	line	277
	
l11601:	
;HMI.c: 277: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	278
;HMI.c: 278: lcd_write_string(adcOutput);
	movlw	(UpdateDisplay@adcOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	282
	
l11603:	
;HMI.c: 282: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	283
	
l11605:	
;HMI.c: 283: lcd_write_string("  EXIT  ");
	movlw	low((STR_22-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	285
;HMI.c: 285: break;
	goto	l4593
	line	287
;HMI.c: 287: case 4:
	
l4591:	
	line	288
	
l11607:	
;HMI.c: 288: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	289
	
l11609:	
;HMI.c: 289: sprintf(adcOutput,"D:%d D:%d",d2travel, distTravelled);
	movlw	((STR_23-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	(??_UpdateDisplay+0)+0,w
	movwf	(?_sprintf)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_d2travel+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_d2travel)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+01h
	addwf	0+(?_sprintf)+01h

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+03h
	addwf	1+(?_sprintf)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+03h
	addwf	0+(?_sprintf)+03h

	movlw	(UpdateDisplay@adcOutput)&0ffh
	fcall	_sprintf
	line	291
	
l11611:	
;HMI.c: 291: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	292
;HMI.c: 292: lcd_write_string(adcOutput);
	movlw	(UpdateDisplay@adcOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	296
	
l11613:	
;HMI.c: 296: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	297
	
l11615:	
;HMI.c: 297: lcd_write_string("  EXIT  ");
	movlw	low((STR_24-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	299
;HMI.c: 299: break;
	goto	l4593
	line	300
;HMI.c: 300: default:
	
l4592:	
	line	301
;HMI.c: 301: break;
	goto	l4593
	line	304
	
l11617:	
;HMI.c: 304: }
	goto	l4593
	line	218
	
l4583:	
	
l11619:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentMenu)^080h,w	;volatile
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
	goto	l11557
	xorlw	1^0	; case 1
	skipnz
	goto	l11577
	xorlw	2^1	; case 2
	skipnz
	goto	l11591
	xorlw	3^2	; case 3
	skipnz
	goto	l11597
	xorlw	4^3	; case 4
	skipnz
	goto	l11607
	goto	l4593
	opt asmopt_on

	line	304
	
l4587:	
	line	305
	
l4593:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,88
	global	_init
psect	text1075,local,class=CODE,delta=2
global __ptext1075
__ptext1075:

;; *************** function _init *****************
;; Defined at:
;;		line 136 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
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
psect	text1075
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
	line	136
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 2
; Regs used in _init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	139
	
l11529:	
;Main.c: 139: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	143
	
l11531:	
;Main.c: 143: TRISC &= 0b10010000;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_init+0)+0
	movf	(??_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	(135)^080h,f	;volatile
	line	145
	
l11533:	
;Main.c: 145: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	146
	
l11535:	
;Main.c: 146: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	148
	
l11537:	
;Main.c: 148: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	149
	
l11539:	
;Main.c: 149: ser_init();
	fcall	_ser_init
	line	150
	
l11541:	
;Main.c: 150: init_adc();
	fcall	_init_adc
	line	151
	
l11543:	
;Main.c: 151: lcd_init();
	fcall	_lcd_init
	line	152
	
l11545:	
;Main.c: 152: robo_init();
	fcall	_robo_init
	line	153
	
l11547:	
;Main.c: 153: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	155
	
l11549:	
;Main.c: 155: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	156
	
l11551:	
;Main.c: 156: PEIE=1;
	bsf	(94/8),(94)&7
	line	158
	
l11553:	
;Main.c: 158: (GIE = 1);
	bsf	(95/8),(95)&7
	line	159
	
l2225:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_readDistance
psect	text1076,local,class=CODE,delta=2
global __ptext1076
__ptext1076:

;; *************** function _readDistance *****************
;; Defined at:
;;		line 24 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  fullval         2   12[BANK0 ] unsigned int 
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
psect	text1076
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\infrared.c"
	line	24
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	27
	
l11523:	
;infrared.c: 25: unsigned int fullval ;
;infrared.c: 27: fullval = adc_read_channel(0);
	movlw	(0)
	fcall	_adc_read_channel
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_readDistance+0)+0
	clrf	(??_readDistance+0)+0+1
	movf	0+(??_readDistance+0)+0,w
	movwf	(readDistance@fullval)
	movf	1+(??_readDistance+0)+0,w
	movwf	(readDistance@fullval+1)
	line	29
	
l11525:	
;infrared.c: 29: return fullval;
	movf	(readDistance@fullval+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@fullval),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	l3026
	
l11527:	
	line	30
	
l3026:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_robot_read
psect	text1077,local,class=CODE,delta=2
global __ptext1077
__ptext1077:

;; *************** function _robot_read *****************
;; Defined at:
;;		line 18 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\robot.c"
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
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ser_putch
;;		_ser_getch
;; This function is called by:
;;		_main
;;		_robotMoveSpeed
;;		_robotMove
;; This function uses a non-reentrant model
;;
psect	text1077
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\robot.c"
	line	18
	global	__size_of_robot_read
	__size_of_robot_read	equ	__end_of_robot_read-_robot_read
	
_robot_read:	
	opt	stack 1
; Regs used in _robot_read: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	19
	
l11509:	
;robot.c: 19: ser_putch (142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	20
;robot.c: 20: ser_putch (7);
	movlw	(07h)
	fcall	_ser_putch
	line	21
	
l11511:	
;robot.c: 21: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_robot_read+0)+0+1),f
	movlw	118
movwf	((??_robot_read+0)+0),f
u5797:
	decfsz	((??_robot_read+0)+0),f
	goto	u5797
	decfsz	((??_robot_read+0)+0+1),f
	goto	u5797
	clrwdt
opt asmopt_on

	line	22
	
l11513:	
;robot.c: 22: BumpSensors = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	movwf	(_BumpSensors)	;volatile
	line	23
	
l11515:	
;robot.c: 23: ser_putch (142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	24
	
l11517:	
;robot.c: 24: ser_putch (19);
	movlw	(013h)
	fcall	_ser_putch
	line	25
;robot.c: 25: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_robot_read+0)+0+1),f
	movlw	118
movwf	((??_robot_read+0)+0),f
u5807:
	decfsz	((??_robot_read+0)+0),f
	goto	u5807
	decfsz	((??_robot_read+0)+0+1),f
	goto	u5807
	clrwdt
opt asmopt_on

	line	26
	
l11519:	
;robot.c: 26: DistHighByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistHighByte)^080h	;volatile
	line	27
	
l11521:	
;robot.c: 27: DistLowByte = ser_getch();
	fcall	_ser_getch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_robot_read+0)+0
	movf	(??_robot_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistLowByte)^080h	;volatile
	line	29
	
l6058:	
	return
	opt stack 0
GLOBAL	__end_of_robot_read
	__end_of_robot_read:
;; =============== function _robot_read ends ============

	signat	_robot_read,88
	global	_lcd_init
psect	text1078,local,class=CODE,delta=2
global __ptext1078
__ptext1078:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 101 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\lcd.c"
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
psect	text1078
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 2
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l11489:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l11491:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l11493:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l11495:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l11497:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l11499:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l11501:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l11503:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l11505:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l11507:	
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
psect	text1079,local,class=CODE,delta=2
global __ptext1079
__ptext1079:

;; *************** function _lcd_write_string *****************
;; Defined at:
;;		line 48 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               2    7[BANK0 ] PTR unsigned char 
;;		 -> STR_24(9), STR_22(9), STR_20(9), STR_19(16), 
;;		 -> STR_18(4), STR_17(8), STR_16(4), STR_15(16), 
;;		 -> UpdateDisplay@adcOutput(16), STR_12(4), STR_11(4), STR_10(4), 
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
psect	text1079
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 1
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
l11481:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	l11487
	
l1409:	
	
l11483:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
l11485:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
	goto	l11487
	
l1408:	
	
l11487:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u5421
	goto	u5420
u5421:
	goto	l11483
u5420:
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
psect	text1080,local,class=CODE,delta=2
global __ptext1080
__ptext1080:

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 42 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\lcd.c"
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
psect	text1080
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\lcd.c"
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
	
l11477:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
l11479:	
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
	global	___awtoft
psect	text1081,local,class=CODE,delta=2
global __ptext1081
__ptext1081:

;; *************** function ___awtoft *****************
;; Defined at:
;;		line 33 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   22[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   27[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   22[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1081
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awtoft.c"
	line	33
	global	__size_of___awtoft
	__size_of___awtoft	equ	__end_of___awtoft-___awtoft
	
___awtoft:	
	opt	stack 3
; Regs used in ___awtoft: [wreg+status,2+status,0+pclath+cstack]
	line	36
	
l11469:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awtoft@sign)
	line	37
	btfss	(___awtoft@c+1),7
	goto	u5411
	goto	u5410
u5411:
	goto	l11473
u5410:
	line	38
	
l11471:	
	comf	(___awtoft@c),f
	comf	(___awtoft@c+1),f
	incf	(___awtoft@c),f
	skipnz
	incf	(___awtoft@c+1),f
	line	39
	clrf	(___awtoft@sign)
	bsf	status,0
	rlf	(___awtoft@sign),f
	goto	l11473
	line	40
	
l7663:	
	line	41
	
l11473:	
	movf	(___awtoft@c),w
	movwf	(?___ftpack)
	movf	(___awtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___awtoft+0)+0
	movf	(??___awtoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___awtoft@sign),w
	movwf	(??___awtoft+1)+0
	movf	(??___awtoft+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___awtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___awtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___awtoft+2)
	goto	l7664
	
l11475:	
	line	42
	
l7664:	
	return
	opt stack 0
GLOBAL	__end_of___awtoft
	__end_of___awtoft:
;; =============== function ___awtoft ends ============

	signat	___awtoft,4219
	global	___ftmul
psect	text1082,local,class=CODE,delta=2
global __ptext1082
__ptext1082:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   28[BANK0 ] float 
;;  f2              3   31[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   39[BANK0 ] unsigned um
;;  sign            1   43[BANK0 ] unsigned char 
;;  cntr            1   42[BANK0 ] unsigned char 
;;  exp             1   38[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   28[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1082
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 3
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l11419:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u5271
	goto	u5270
u5271:
	goto	l11425
u5270:
	line	57
	
l11421:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l7626
	
l11423:	
	goto	l7626
	
l7625:	
	line	58
	
l11425:	
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u5281
	goto	u5280
u5281:
	goto	l11431
u5280:
	line	59
	
l11427:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l7626
	
l11429:	
	goto	l7626
	
l7627:	
	line	60
	
l11431:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	addwf	(___ftmul@exp),f
	line	61
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u5295:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u5290:
	addlw	-1
	skipz
	goto	u5295
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	line	62
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u5305:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u5300:
	addlw	-1
	skipz
	goto	u5305
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	xorwf	(___ftmul@sign),f
	line	63
	movlw	(080h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	andwf	(___ftmul@sign),f
	line	64
	
l11433:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l11435:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l11437:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l11439:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l11441:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l11443
	line	70
	
l7628:	
	line	71
	
l11443:	
	btfss	(___ftmul@f1),(0)&7
	goto	u5311
	goto	u5310
u5311:
	goto	l11447
u5310:
	line	72
	
l11445:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u5321
	addwf	(___ftmul@f3_as_product+1),f
u5321:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u5322
	addwf	(___ftmul@f3_as_product+2),f
u5322:

	goto	l11447
	
l7629:	
	line	73
	
l11447:	
	movlw	01h
u5335:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u5335

	line	74
	
l11449:	
	movlw	01h
u5345:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u5345
	line	75
	
l11451:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u5351
	goto	u5350
u5351:
	goto	l11443
u5350:
	goto	l11453
	
l7630:	
	line	76
	
l11453:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l11455
	line	77
	
l7631:	
	line	78
	
l11455:	
	btfss	(___ftmul@f1),(0)&7
	goto	u5361
	goto	u5360
u5361:
	goto	l11459
u5360:
	line	79
	
l11457:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u5371
	addwf	(___ftmul@f3_as_product+1),f
u5371:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u5372
	addwf	(___ftmul@f3_as_product+2),f
u5372:

	goto	l11459
	
l7632:	
	line	80
	
l11459:	
	movlw	01h
u5385:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u5385

	line	81
	
l11461:	
	movlw	01h
u5395:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u5395

	line	82
	
l11463:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u5401
	goto	u5400
u5401:
	goto	l11455
u5400:
	goto	l11465
	
l7633:	
	line	83
	
l11465:	
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	(??___ftmul+1)+0
	movf	(??___ftmul+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	goto	l7626
	
l11467:	
	line	84
	
l7626:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	_abs
psect	text1083,local,class=CODE,delta=2
global __ptext1083
__ptext1083:

;; *************** function _abs *****************
;; Defined at:
;;		line 175 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\robot.c"
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
;;		_robotMoveSpeed
;; This function uses a non-reentrant model
;;
psect	text1083
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\robot.c"
	line	175
	global	__size_of_abs
	__size_of_abs	equ	__end_of_abs-_abs
	
_abs:	
	opt	stack 1
; Regs used in _abs: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	176
	
l11415:	
;robot.c: 176: return v * ( (v<0) * (-1) + (v>0));
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
	goto	u5265
	movlw	low(01h)
	subwf	(abs@v),w
u5265:

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

	goto	l6082
	
l11417:	
	line	178
	
l6082:	
	return
	opt stack 0
GLOBAL	__end_of_abs
	__end_of_abs:
;; =============== function _abs ends ============

	signat	_abs,4218
	global	_ser_getch
psect	text1084,local,class=CODE,delta=2
global __ptext1084
__ptext1084:

;; *************** function _ser_getch *****************
;; Defined at:
;;		line 55 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\ser.c"
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
psect	text1084
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\ser.c"
	line	55
	global	__size_of_ser_getch
	__size_of_ser_getch	equ	__end_of_ser_getch-_ser_getch
	
_ser_getch:	
	opt	stack 1
; Regs used in _ser_getch: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	58
	
l11399:	
;ser.c: 56: unsigned char c;
;ser.c: 58: while (ser_isrx()==0)
	goto	l11401
	
l6786:	
	line	59
;ser.c: 59: continue;
	goto	l11401
	
l6785:	
	line	58
	
l11401:	
	fcall	_ser_isrx
	btfss	status,0
	goto	u5251
	goto	u5250
u5251:
	goto	l11401
u5250:
	
l6787:	
	line	61
;ser.c: 61: GIE=0;
	bcf	(95/8),(95)&7
	line	62
	
l11403:	
;ser.c: 62: c=rxfifo[rxoptr];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_rxoptr),w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_ser_getch+0)+0
	movf	(??_ser_getch+0)+0,w
	movwf	(ser_getch@c)
	line	63
	
l11405:	
;ser.c: 63: ++rxoptr;
	movlw	(01h)
	movwf	(??_ser_getch+0)+0
	movf	(??_ser_getch+0)+0,w
	addwf	(_rxoptr),f	;volatile
	line	64
	
l11407:	
;ser.c: 64: rxoptr &= (16-1);
	movlw	(0Fh)
	movwf	(??_ser_getch+0)+0
	movf	(??_ser_getch+0)+0,w
	andwf	(_rxoptr),f	;volatile
	line	65
	
l11409:	
;ser.c: 65: GIE=1;
	bsf	(95/8),(95)&7
	line	66
	
l11411:	
;ser.c: 66: return c;
	movf	(ser_getch@c),w
	goto	l6788
	
l11413:	
	line	67
	
l6788:	
	return
	opt stack 0
GLOBAL	__end_of_ser_getch
	__end_of_ser_getch:
;; =============== function _ser_getch ends ============

	signat	_ser_getch,89
	global	_sprintf
psect	text1085,local,class=CODE,delta=2
global __ptext1085
__ptext1085:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> UpdateDisplay@adcOutput(16), 
;;  f               1   20[BANK0 ] PTR const unsigned char 
;;		 -> STR_23(10), STR_21(11), STR_14(15), STR_13(15), 
;; Auto vars:     Size  Location     Type
;;  sp              1   35[BANK0 ] PTR unsigned char 
;;		 -> UpdateDisplay@adcOutput(16), 
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
psect	text1085
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\doprnt.c"
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
	
l11341:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	l11393
	
l6826:	
	line	542
	
l11343:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u5171
	goto	u5170
u5171:
	goto	l6827
u5170:
	line	545
	
l11345:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11347:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	l11393
	line	547
	
l6827:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	l11351
	line	640
	
l6829:	
	line	641
	goto	l11395
	line	700
	
l6831:	
	goto	l11353
	line	701
	
l6832:	
	line	702
	goto	l11353
	line	805
	
l6834:	
	line	816
	goto	l11393
	line	825
	
l11349:	
	goto	l11353
	line	638
	
l6828:	
	
l11351:	
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
	goto	l11395
	xorlw	100^0	; case 100
	skipnz
	goto	l11353
	xorlw	105^100	; case 105
	skipnz
	goto	l11353
	goto	l11393
	opt asmopt_on

	line	825
	
l6833:	
	line	1254
	
l11353:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
l11355:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
l11357:	
	btfss	(sprintf@_val+1),7
	goto	u5181
	goto	u5180
u5181:
	goto	l11363
u5180:
	line	1257
	
l11359:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
l11361:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	l11363
	line	1259
	
l6835:	
	line	1300
	
l11363:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
l11365:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u5191
	goto	u5190
u5191:
	goto	l11369
u5190:
	goto	l11377
	
l11367:	
	goto	l11377
	line	1301
	
l6836:	
	
l11369:	
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
	goto	u5205
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u5205:
	skipnc
	goto	u5201
	goto	u5200
u5201:
	goto	l11373
u5200:
	goto	l11377
	line	1302
	
l11371:	
	goto	l11377
	
l6838:	
	line	1300
	
l11373:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
l11375:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u5211
	goto	u5210
u5211:
	goto	l11369
u5210:
	goto	l11377
	
l6837:	
	line	1433
	
l11377:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u5221
	goto	u5220
u5221:
	goto	l11383
u5220:
	line	1434
	
l11379:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11381:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l11383
	
l6839:	
	line	1467
	
l11383:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	l11391
	
l6841:	
	line	1484
	
l11385:	
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
	
l11387:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l11389:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l11391
	line	1517
	
l6840:	
	line	1469
	
l11391:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u5231
	goto	u5230
u5231:
	goto	l11385
u5230:
	goto	l11393
	
l6842:	
	goto	l11393
	line	1525
	
l6825:	
	line	540
	
l11393:	
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
	goto	u5241
	goto	u5240
u5241:
	goto	l11343
u5240:
	goto	l11395
	
l6843:	
	goto	l11395
	line	1527
	
l6830:	
	line	1530
	
l11395:	
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l6844
	line	1532
	
l11397:	
	line	1533
;	Return value of _sprintf is never used
	
l6844:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ADCconvert
psect	text1086,local,class=CODE,delta=2
global __ptext1086
__ptext1086:

;; *************** function _ADCconvert *****************
;; Defined at:
;;		line 33 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\infrared.c"
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
psect	text1086
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\infrared.c"
	line	33
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [wreg+status,2+status,0+pclath+cstack]
	line	39
	
l11299:	
;infrared.c: 39: if (adcVal >= 213 && adcVal < 234)
	movlw	high(0D5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u5031
	goto	u5030
u5031:
	goto	l11305
u5030:
	
l11301:	
	movlw	high(0EAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0EAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u5041
	goto	u5040
u5041:
	goto	l11305
u5040:
	line	41
	
l11303:	
;infrared.c: 40: {
;infrared.c: 41: distance = 15 + ((20-15)*(234-adcVal))/(234-213);
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
	movwf	(_distance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_distance)^080h	;volatile
	line	42
;infrared.c: 42: }
	goto	l3042
	line	43
	
l3029:	
	
l11305:	
;infrared.c: 43: else if (adcVal >= 170 && adcVal < 213)
	movlw	high(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u5051
	goto	u5050
u5051:
	goto	l11311
u5050:
	
l11307:	
	movlw	high(0D5h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u5061
	goto	u5060
u5061:
	goto	l11311
u5060:
	line	45
	
l11309:	
;infrared.c: 44: {
;infrared.c: 45: distance = 20 + ((30-20)*(213-adcVal))/(213-170);
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
	movwf	(_distance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(014h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_distance)^080h	;volatile
	line	46
;infrared.c: 46: }
	goto	l3042
	line	47
	
l3031:	
	
l11311:	
;infrared.c: 47: else if (adcVal >= 128 && adcVal < 170)
	movlw	high(080h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u5071
	goto	u5070
u5071:
	goto	l11317
u5070:
	
l11313:	
	movlw	high(0AAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u5081
	goto	u5080
u5081:
	goto	l11317
u5080:
	line	49
	
l11315:	
;infrared.c: 48: {
;infrared.c: 49: distance = 30 + ((40-30)*(170-adcVal))/(170-128);
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
	movwf	(_distance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(01Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_distance)^080h	;volatile
	line	50
;infrared.c: 50: }
	goto	l3042
	line	51
	
l3033:	
	
l11317:	
;infrared.c: 51: else if (adcVal >= 107 && adcVal < 128)
	movlw	high(06Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u5091
	goto	u5090
u5091:
	goto	l11323
u5090:
	
l11319:	
	movlw	high(080h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u5101
	goto	u5100
u5101:
	goto	l11323
u5100:
	line	53
	
l11321:	
;infrared.c: 52: {
;infrared.c: 53: distance = 40 + ((50-40)*(128-adcVal))/(128-107);
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
	movwf	(_distance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(028h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_distance)^080h	;volatile
	line	54
;infrared.c: 54: }
	goto	l3042
	line	55
	
l3035:	
	
l11323:	
;infrared.c: 55: else if (adcVal >= 77 && adcVal < 107)
	movlw	high(04Dh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u5111
	goto	u5110
u5111:
	goto	l11329
u5110:
	
l11325:	
	movlw	high(06Bh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u5121
	goto	u5120
u5121:
	goto	l11329
u5120:
	line	57
	
l11327:	
;infrared.c: 56: {
;infrared.c: 57: distance = 50 + ((60-50)*(107-adcVal))/(107-77);
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
	movwf	(_distance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(032h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_distance)^080h	;volatile
	line	58
;infrared.c: 58: }
	goto	l3042
	line	59
	
l3037:	
	
l11329:	
;infrared.c: 59: else if (adcVal >= 56 && adcVal < 77)
	movlw	high(038h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u5131
	goto	u5130
u5131:
	goto	l11335
u5130:
	
l11331:	
	movlw	high(04Dh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u5141
	goto	u5140
u5141:
	goto	l11335
u5140:
	line	61
	
l11333:	
;infrared.c: 60: {
;infrared.c: 61: distance = 60 + ((70-60)*(77-adcVal))/(77-56);
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
	movwf	(_distance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(03Ch)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_distance)^080h	;volatile
	line	62
;infrared.c: 62: }
	goto	l3042
	line	63
	
l3039:	
	
l11335:	
;infrared.c: 63: else if (adcVal >= 43 && adcVal < 56)
	movlw	high(02Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(02Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u5151
	goto	u5150
u5151:
	goto	l3042
u5150:
	
l11337:	
	movlw	high(038h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u5161
	goto	u5160
u5161:
	goto	l3042
u5160:
	line	65
	
l11339:	
;infrared.c: 64: {
;infrared.c: 65: distance = 70 + ((80-70)*(56-adcVal))/(56-43);
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
	movwf	(_distance)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(046h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	1+(_distance)^080h	;volatile
	goto	l3042
	line	66
	
l3041:	
	goto	l3042
	line	67
	
l3040:	
	goto	l3042
	
l3038:	
	goto	l3042
	
l3036:	
	goto	l3042
	
l3034:	
	goto	l3042
	
l3032:	
	goto	l3042
	
l3030:	
	
l3042:	
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,88
	global	_rotate
psect	text1087,local,class=CODE,delta=2
global __ptext1087
__ptext1087:

;; *************** function _rotate *****************
;; Defined at:
;;		line 48 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\steppermotor.c"
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
;;		_scan360
;;		_main
;;		_calibrateIR
;; This function uses a non-reentrant model
;;
psect	text1087
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\steppermotor.c"
	line	48
	global	__size_of_rotate
	__size_of_rotate	equ	__end_of_rotate-_rotate
	
_rotate:	
	opt	stack 3
; Regs used in _rotate: [wreg+status,2+status,0+pclath+cstack]
	line	50
	
l11271:	
;steppermotor.c: 50: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	51
	
l11273:	
;steppermotor.c: 51: if (direction == 0)
	movf	(rotate@direction),f
	skipz
	goto	u5011
	goto	u5010
u5011:
	goto	l11277
u5010:
	line	52
	
l11275:	
;steppermotor.c: 52: spi_transfer(0b00001111);
	movlw	(0Fh)
	fcall	_spi_transfer
	goto	l11279
	line	53
	
l3743:	
	line	54
	
l11277:	
;steppermotor.c: 53: else
;steppermotor.c: 54: spi_transfer(0b00001101);
	movlw	(0Dh)
	fcall	_spi_transfer
	goto	l11279
	
l3744:	
	line	55
	
l11279:	
;steppermotor.c: 55: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11281:	
	bcf	(57/8),(57)&7
	line	56
	
l11283:	
;steppermotor.c: 56: for (unsigned int i = 0; i < numsteps; i++)
	clrf	(rotate@i)
	clrf	(rotate@i+1)
	goto	l3745
	line	57
	
l3746:	
	line	58
;steppermotor.c: 57: {
;steppermotor.c: 58: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	nop
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	59
	
l11285:	
;steppermotor.c: 59: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
movwf	((??_rotate+0)+0+1),f
	movlw	101
movwf	((??_rotate+0)+0),f
u5817:
	decfsz	((??_rotate+0)+0),f
	goto	u5817
	decfsz	((??_rotate+0)+0+1),f
	goto	u5817
	nop2
opt asmopt_on

	line	56
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(rotate@i),f
	skipnc
	incf	(rotate@i+1),f
	movlw	high(01h)
	addwf	(rotate@i+1),f
	
l3745:	
	movf	(rotate@numsteps+1),w
	subwf	(rotate@i+1),w
	skipz
	goto	u5025
	movf	(rotate@numsteps),w
	subwf	(rotate@i),w
u5025:
	skipc
	goto	u5021
	goto	u5020
u5021:
	goto	l3746
u5020:
	
l3747:	
	line	61
;steppermotor.c: 60: }
;steppermotor.c: 61: RC0 = 1; RC1 = 1;;
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	62
	
l11287:	
;steppermotor.c: 62: spi_transfer(0b00000000);
	movlw	(0)
	fcall	_spi_transfer
	line	63
	
l11289:	
;steppermotor.c: 63: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11291:	
	bcf	(57/8),(57)&7
	line	64
	
l11293:	
;steppermotor.c: 64: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l11295:	
	nop
	
l11297:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	65
	
l3748:	
	return
	opt stack 0
GLOBAL	__end_of_rotate
	__end_of_rotate:
;; =============== function _rotate ends ============

	signat	_rotate,8312
	global	_robotTurn
psect	text1088,local,class=CODE,delta=2
global __ptext1088
__ptext1088:

;; *************** function _robotTurn *****************
;; Defined at:
;;		line 128 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  distance        2    2[BANK0 ] int 
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
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_straightLineTest
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1088
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\robot.c"
	line	128
	global	__size_of_robotTurn
	__size_of_robotTurn	equ	__end_of_robotTurn-_robotTurn
	
_robotTurn:	
	opt	stack 3
; Regs used in _robotTurn: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	131
	
l11261:	
;robot.c: 131: turnlowByte = (unsigned char) (distance) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotTurn@distance),w
	movwf	(??_robotTurn+0)+0
	movf	(??_robotTurn+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_turnlowByte)^080h
	line	132
	
l11263:	
;robot.c: 132: turnhighByte = (unsigned char) (distance >> 8);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotTurn@distance+1),w
	movwf	(??_robotTurn+0)+0
	movf	(??_robotTurn+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_turnhighByte)^080h
	line	133
	
l11265:	
;robot.c: 133: if (distance >= 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(robotTurn@distance+1),7
	goto	u5001
	goto	u5000
u5001:
	goto	l11269
u5000:
	line	135
	
l11267:	
;robot.c: 134: {
;robot.c: 135: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	137
;robot.c: 137: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	139
;robot.c: 139: ser_putch(50);
	movlw	(032h)
	fcall	_ser_putch
	line	141
;robot.c: 141: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	143
;robot.c: 143: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	144
;robot.c: 144: }
	goto	l6078
	line	145
	
l6077:	
	line	147
	
l11269:	
;robot.c: 145: else
;robot.c: 146: {
;robot.c: 147: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	149
;robot.c: 149: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	151
;robot.c: 151: ser_putch(50);
	movlw	(032h)
	fcall	_ser_putch
	line	153
;robot.c: 153: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	155
;robot.c: 155: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	156
	
l6078:	
	line	157
;robot.c: 156: }
;robot.c: 157: ser_putch(157);
	movlw	(09Dh)
	fcall	_ser_putch
	line	159
;robot.c: 159: ser_putch(turnhighByte);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_turnhighByte)^080h,w
	fcall	_ser_putch
	line	161
;robot.c: 161: ser_putch(turnlowByte);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_turnlowByte)^080h,w
	fcall	_ser_putch
	line	163
;robot.c: 163: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	165
;robot.c: 165: ser_putch(0);
	movlw	(0)
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
	line	172
	
l6079:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurn
	__end_of_robotTurn:
;; =============== function _robotTurn ends ============

	signat	_robotTurn,4216
	global	_robo_init
psect	text1089,local,class=CODE,delta=2
global __ptext1089
__ptext1089:

;; *************** function _robo_init *****************
;; Defined at:
;;		line 10 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\robot.c"
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
psect	text1089
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\robot.c"
	line	10
	global	__size_of_robo_init
	__size_of_robo_init	equ	__end_of_robo_init-_robo_init
	
_robo_init:	
	opt	stack 2
; Regs used in _robo_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	11
	
l11259:	
;robot.c: 11: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	12
;robot.c: 12: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	13
;robot.c: 13: ser_putch(150);
	movlw	(096h)
	fcall	_ser_putch
	line	14
;robot.c: 14: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	15
	
l6055:	
	return
	opt stack 0
GLOBAL	__end_of_robo_init
	__end_of_robo_init:
;; =============== function _robo_init ends ============

	signat	_robo_init,88
	global	_lcd_write_data
psect	text1090,local,class=CODE,delta=2
global __ptext1090
__ptext1090:

;; *************** function _lcd_write_data *****************
;; Defined at:
;;		line 30 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\lcd.c"
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
psect	text1090
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\lcd.c"
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
	
l11251:	
;lcd.c: 31: RE2 = 0;
	bcf	(74/8),(74)&7
	line	32
;lcd.c: 32: RE1 = 0;
	bcf	(73/8),(73)&7
	line	33
;lcd.c: 33: RE0 = 1;
	bsf	(72/8),(72)&7
	line	34
	
l11253:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
l11255:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
l11257:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u5827:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u5827
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u5827
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
psect	text1091,local,class=CODE,delta=2
global __ptext1091
__ptext1091:

;; *************** function _lcd_write_control *****************
;; Defined at:
;;		line 18 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\lcd.c"
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
psect	text1091
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\lcd.c"
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
	
l11243:	
;lcd.c: 19: RE2 = 0;
	bcf	(74/8),(74)&7
	line	20
;lcd.c: 20: RE1 = 0;
	bcf	(73/8),(73)&7
	line	21
;lcd.c: 21: RE0 = 0;
	bcf	(72/8),(72)&7
	line	22
	
l11245:	
;lcd.c: 22: PORTD = databyte;
	movf	(lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
l11247:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l11249:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??_lcd_write_control+0)+0),f
u5837:
	decfsz	((??_lcd_write_control+0)+0),f
	goto	u5837
	decfsz	((??_lcd_write_control+0)+0+1),f
	goto	u5837
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
psect	text1092,local,class=CODE,delta=2
global __ptext1092
__ptext1092:

;; *************** function _init_adc *****************
;; Defined at:
;;		line 46 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\adc.c"
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
psect	text1092
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\adc.c"
	line	46
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 3
; Regs used in _init_adc: [wreg+status,2]
	line	48
	
l11233:	
;adc.c: 48: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	49
	
l11235:	
;adc.c: 49: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	52
	
l11237:	
;adc.c: 52: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	53
	
l11239:	
;adc.c: 53: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	55
	
l11241:	
;adc.c: 55: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_init_adc+0)+0,f
u5847:
decfsz	(??_init_adc+0)+0,f
	goto	u5847
opt asmopt_on

	line	57
	
l700:	
	return
	opt stack 0
GLOBAL	__end_of_init_adc
	__end_of_init_adc:
;; =============== function _init_adc ends ============

	signat	_init_adc,88
	global	_adc_read_channel
psect	text1093,local,class=CODE,delta=2
global __ptext1093
__ptext1093:

;; *************** function _adc_read_channel *****************
;; Defined at:
;;		line 5 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\adc.c"
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
psect	text1093
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\adc.c"
	line	5
	global	__size_of_adc_read_channel
	__size_of_adc_read_channel	equ	__end_of_adc_read_channel-_adc_read_channel
	
_adc_read_channel:	
	opt	stack 0
; Regs used in _adc_read_channel: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;adc_read_channel@channel stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(adc_read_channel@channel)
	line	6
	
l11217:	
;adc.c: 6: switch(channel)
	goto	l11225
	line	8
;adc.c: 7: {
;adc.c: 8: case 0:
	
l690:	
	line	9
;adc.c: 9: CHS0 = 0;
	bcf	(251/8),(251)&7
	line	10
;adc.c: 10: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	11
;adc.c: 11: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	12
;adc.c: 12: break;
	goto	l11227
	line	13
;adc.c: 13: case 1:
	
l692:	
	line	14
;adc.c: 14: CHS0 = 1;
	bsf	(251/8),(251)&7
	line	15
;adc.c: 15: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	16
;adc.c: 16: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	17
;adc.c: 17: break;
	goto	l11227
	line	18
;adc.c: 18: case 2:
	
l693:	
	line	19
;adc.c: 19: CHS0 = 0;
	bcf	(251/8),(251)&7
	line	20
;adc.c: 20: CHS1 = 1;
	bsf	(252/8),(252)&7
	line	21
;adc.c: 21: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	22
;adc.c: 22: break;
	goto	l11227
	line	23
;adc.c: 23: case 3:
	
l694:	
	line	24
;adc.c: 24: CHS0 = 1;
	bsf	(251/8),(251)&7
	line	25
;adc.c: 25: CHS1 = 1;
	bsf	(252/8),(252)&7
	line	26
;adc.c: 26: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	27
;adc.c: 27: break;
	goto	l11227
	line	28
;adc.c: 28: case 4:
	
l695:	
	line	29
;adc.c: 29: CHS0 = 0;
	bcf	(251/8),(251)&7
	line	30
;adc.c: 30: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	31
;adc.c: 31: CHS2 = 1;
	bsf	(253/8),(253)&7
	line	32
;adc.c: 32: break;
	goto	l11227
	line	35
;adc.c: 35: default:
	
l696:	
	line	36
	
l11219:	
;adc.c: 36: return 0;
	movlw	(0)
	goto	l697
	
l11221:	
	goto	l697
	line	37
	
l11223:	
;adc.c: 37: }
	goto	l11227
	line	6
	
l689:	
	
l11225:	
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
	goto	l11219
	opt asmopt_on

	line	37
	
l691:	
	line	39
	
l11227:	
;adc.c: 39: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u5857:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u5857
opt asmopt_on

	line	41
	
l11229:	
;adc.c: 41: return adc_read();
	fcall	_adc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_adc_read)),w
	goto	l697
	
l11231:	
	line	43
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
psect	text1094,local,class=CODE,delta=2
global __ptext1094
__ptext1094:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awmod.c"
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
psect	text1094
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l11115:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u4791
	goto	u4790
u4791:
	goto	l11119
u4790:
	line	10
	
l11117:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l11119
	line	12
	
l7735:	
	line	13
	
l11119:	
	btfss	(___awmod@divisor+1),7
	goto	u4801
	goto	u4800
u4801:
	goto	l11123
u4800:
	line	14
	
l11121:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l11123
	
l7736:	
	line	15
	
l11123:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u4811
	goto	u4810
u4811:
	goto	l11141
u4810:
	line	16
	
l11125:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l11131
	
l7739:	
	line	18
	
l11127:	
	movlw	01h
	
u4825:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4825
	line	19
	
l11129:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l11131
	line	20
	
l7738:	
	line	17
	
l11131:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u4831
	goto	u4830
u4831:
	goto	l11127
u4830:
	goto	l11133
	
l7740:	
	goto	l11133
	line	21
	
l7741:	
	line	22
	
l11133:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u4845
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u4845:
	skipc
	goto	u4841
	goto	u4840
u4841:
	goto	l11137
u4840:
	line	23
	
l11135:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l11137
	
l7742:	
	line	24
	
l11137:	
	movlw	01h
	
u4855:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u4855
	line	25
	
l11139:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u4861
	goto	u4860
u4861:
	goto	l11133
u4860:
	goto	l11141
	
l7743:	
	goto	l11141
	line	26
	
l7737:	
	line	27
	
l11141:	
	movf	(___awmod@sign),w
	skipz
	goto	u4870
	goto	l11145
u4870:
	line	28
	
l11143:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l11145
	
l7744:	
	line	29
	
l11145:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l7745
	
l11147:	
	line	30
	
l7745:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___fttol
psect	text1095,local,class=CODE,delta=2
global __ptext1095
__ptext1095:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  lval            4   17[BANK0 ] unsigned long 
;;  exp1            1   21[BANK0 ] unsigned char 
;;  sign1           1   16[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      14       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1095
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 4
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l11059:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u4681
	goto	u4680
u4681:
	goto	l11065
u4680:
	line	50
	
l11061:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l7637
	
l11063:	
	goto	l7637
	
l7636:	
	line	51
	
l11065:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u4695:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u4690:
	addlw	-1
	skipz
	goto	u4695
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l11067:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l11069:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l11071:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l11073:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l11075:	
	btfss	(___fttol@exp1),7
	goto	u4701
	goto	u4700
u4701:
	goto	l11085
u4700:
	line	57
	
l11077:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u4711
	goto	u4710
u4711:
	goto	l11083
u4710:
	line	58
	
l11079:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l7637
	
l11081:	
	goto	l7637
	
l7639:	
	goto	l11083
	line	59
	
l7640:	
	line	60
	
l11083:	
	movlw	01h
u4725:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u4725

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u4731
	goto	u4730
u4731:
	goto	l11083
u4730:
	goto	l11095
	
l7641:	
	line	62
	goto	l11095
	
l7638:	
	line	63
	
l11085:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u4741
	goto	u4740
u4741:
	goto	l11093
u4740:
	line	64
	
l11087:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l7637
	
l11089:	
	goto	l7637
	
l7643:	
	line	65
	goto	l11093
	
l7645:	
	line	66
	
l11091:	
	movlw	01h
	movwf	(??___fttol+0)+0
u4755:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u4755
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	l11093
	line	68
	
l7644:	
	line	65
	
l11093:	
	movf	(___fttol@exp1),f
	skipz
	goto	u4761
	goto	u4760
u4761:
	goto	l11091
u4760:
	goto	l11095
	
l7646:	
	goto	l11095
	line	69
	
l7642:	
	line	70
	
l11095:	
	movf	(___fttol@sign1),w
	skipz
	goto	u4770
	goto	l11099
u4770:
	line	71
	
l11097:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	goto	l11099
	
l7647:	
	line	72
	
l11099:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	l7637
	
l11101:	
	line	73
	
l7637:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text1096,local,class=CODE,delta=2
global __ptext1096
__ptext1096:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[BANK0 ] unsigned um
;;  exp             1    3[BANK0 ] unsigned char 
;;  sign            1    4[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       5       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftmul
;;		___awtoft
;;		___ftadd
;;		___ftdiv
;;		___lbtoft
;;		___abtoft
;;		___lwtoft
;;		___altoft
;;		___lltoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text1096
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 3
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l10985:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftpack@exp),w
	skipz
	goto	u4490
	goto	l10989
u4490:
	
l10987:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u4501
	goto	u4500
u4501:
	goto	l10995
u4500:
	goto	l10989
	
l7861:	
	line	65
	
l10989:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l7862
	
l10991:	
	goto	l7862
	
l7859:	
	line	66
	goto	l10995
	
l7864:	
	line	67
	
l10993:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u4515:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u4515

	goto	l10995
	line	69
	
l7863:	
	line	66
	
l10995:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u4521
	goto	u4520
u4521:
	goto	l10993
u4520:
	goto	l7866
	
l7865:	
	line	70
	goto	l7866
	
l7867:	
	line	71
	
l10997:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l10999:	
	movlw	01h
	addwf	(___ftpack@arg),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+2),f
	line	73
	
l11001:	
	movlw	01h
u4535:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u4535

	line	74
	
l7866:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u4541
	goto	u4540
u4541:
	goto	l10997
u4540:
	goto	l11005
	
l7868:	
	line	75
	goto	l11005
	
l7870:	
	line	76
	
l11003:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u4555:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u4555
	goto	l11005
	line	78
	
l7869:	
	line	75
	
l11005:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u4561
	goto	u4560
u4561:
	goto	l11003
u4560:
	
l7871:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u4571
	goto	u4570
u4571:
	goto	l7872
u4570:
	line	80
	
l11007:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l7872:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l11009:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u4585:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u4580:
	addlw	-1
	skipz
	goto	u4585
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l11011:	
	movf	(___ftpack@sign),w
	skipz
	goto	u4590
	goto	l7873
u4590:
	line	84
	
l11013:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l7873:	
	line	85
	line	86
	
l7862:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___lwmod
psect	text1097,local,class=CODE,delta=2
global __ptext1097
__ptext1097:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
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
psect	text1097
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l10893:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u4191
	goto	u4190
u4191:
	goto	l10911
u4190:
	line	9
	
l10895:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l10901
	
l7545:	
	line	11
	
l10897:	
	movlw	01h
	
u4205:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4205
	line	12
	
l10899:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l10901
	line	13
	
l7544:	
	line	10
	
l10901:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u4211
	goto	u4210
u4211:
	goto	l10897
u4210:
	goto	l10903
	
l7546:	
	goto	l10903
	line	14
	
l7547:	
	line	15
	
l10903:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u4225
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u4225:
	skipc
	goto	u4221
	goto	u4220
u4221:
	goto	l10907
u4220:
	line	16
	
l10905:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l10907
	
l7548:	
	line	17
	
l10907:	
	movlw	01h
	
u4235:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u4235
	line	18
	
l10909:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u4241
	goto	u4240
u4241:
	goto	l10903
u4240:
	goto	l10911
	
l7549:	
	goto	l10911
	line	19
	
l7543:	
	line	20
	
l10911:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l7550
	
l10913:	
	line	21
	
l7550:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text1098,local,class=CODE,delta=2
global __ptext1098
__ptext1098:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
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
psect	text1098
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l10867:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l10869:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u4121
	goto	u4120
u4121:
	goto	l10889
u4120:
	line	11
	
l10871:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l10877
	
l7535:	
	line	13
	
l10873:	
	movlw	01h
	
u4135:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u4135
	line	14
	
l10875:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l10877
	line	15
	
l7534:	
	line	12
	
l10877:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u4141
	goto	u4140
u4141:
	goto	l10873
u4140:
	goto	l10879
	
l7536:	
	goto	l10879
	line	16
	
l7537:	
	line	17
	
l10879:	
	movlw	01h
	
u4155:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u4155
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u4165
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u4165:
	skipc
	goto	u4161
	goto	u4160
u4161:
	goto	l10885
u4160:
	line	19
	
l10881:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l10883:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l10885
	line	21
	
l7538:	
	line	22
	
l10885:	
	movlw	01h
	
u4175:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u4175
	line	23
	
l10887:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u4181
	goto	u4180
u4181:
	goto	l10879
u4180:
	goto	l10889
	
l7539:	
	goto	l10889
	line	24
	
l7533:	
	line	25
	
l10889:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l7540
	
l10891:	
	line	26
	
l7540:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text1099,local,class=CODE,delta=2
global __ptext1099
__ptext1099:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
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
psect	text1099
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 1
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l10855:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l10857
	line	6
	
l7527:	
	line	7
	
l10857:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u4081
	goto	u4080
u4081:
	goto	l7528
u4080:
	line	8
	
l10859:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l7528:	
	line	9
	movlw	01h
	
u4095:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u4095
	line	10
	
l10861:	
	movlw	01h
	
u4105:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u4105
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u4111
	goto	u4110
u4111:
	goto	l10857
u4110:
	goto	l10863
	
l7529:	
	line	12
	
l10863:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l7530
	
l10865:	
	line	13
	
l7530:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_ser_isrx
psect	text1100,local,class=CODE,delta=2
global __ptext1100
__ptext1100:

;; *************** function _ser_isrx *****************
;; Defined at:
;;		line 45 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\ser.c"
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
psect	text1100
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\ser.c"
	line	45
	global	__size_of_ser_isrx
	__size_of_ser_isrx	equ	__end_of_ser_isrx-_ser_isrx
	
_ser_isrx:	
	opt	stack 1
; Regs used in _ser_isrx: [wreg+status,2+status,0]
	line	46
	
l10807:	
;ser.c: 46: if(OERR) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(193/8),(193)&7
	goto	u4011
	goto	u4010
u4011:
	goto	l10815
u4010:
	line	47
	
l10809:	
;ser.c: 47: CREN = 0;
	bcf	(196/8),(196)&7
	line	48
;ser.c: 48: CREN = 1;
	bsf	(196/8),(196)&7
	line	49
	
l10811:	
;ser.c: 49: return 0;
	clrc
	
	goto	l6782
	
l10813:	
	goto	l6782
	line	50
	
l6781:	
	line	51
	
l10815:	
;ser.c: 50: }
;ser.c: 51: return (rxiptr!=rxoptr);
	movf	(_rxiptr),w	;volatile
	xorwf	(_rxoptr),w	;volatile
	skipz
	goto	u4021
	goto	u4020
u4021:
	goto	l10819
u4020:
	
l10817:	
	clrc
	
	goto	l6782
	
l10461:	
	
l10819:	
	setc
	
	goto	l6782
	
l10463:	
	goto	l6782
	
l10821:	
	line	52
	
l6782:	
	return
	opt stack 0
GLOBAL	__end_of_ser_isrx
	__end_of_ser_isrx:
;; =============== function _ser_isrx ends ============

	signat	_ser_isrx,88
	global	_spi_transfer
psect	text1101,local,class=CODE,delta=2
global __ptext1101
__ptext1101:

;; *************** function _spi_transfer *****************
;; Defined at:
;;		line 34 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\steppermotor.c"
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
psect	text1101
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\steppermotor.c"
	line	34
	global	__size_of_spi_transfer
	__size_of_spi_transfer	equ	__end_of_spi_transfer-_spi_transfer
	
_spi_transfer:	
	opt	stack 3
; Regs used in _spi_transfer: [wreg]
;spi_transfer@data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(spi_transfer@data)
	line	35
	
l10693:	
;steppermotor.c: 35: unsigned char temp = 0;
	clrf	(spi_transfer@temp)
	line	37
;steppermotor.c: 37: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	38
	
l10695:	
;steppermotor.c: 38: SSPBUF = data;
	movf	(spi_transfer@data),w
	movwf	(19)	;volatile
	line	40
;steppermotor.c: 40: while (SSPIF == 0);
	goto	l3737
	
l3738:	
	
l3737:	
	btfss	(99/8),(99)&7
	goto	u3811
	goto	u3810
u3811:
	goto	l3737
u3810:
	goto	l10697
	
l3739:	
	line	41
	
l10697:	
;steppermotor.c: 41: temp = SSPBUF;
	movf	(19),w	;volatile
	movwf	(??_spi_transfer+0)+0
	movf	(??_spi_transfer+0)+0,w
	movwf	(spi_transfer@temp)
	line	42
	
l10699:	
;steppermotor.c: 42: SSPIF = 0;
	bcf	(99/8),(99)&7
	goto	l3740
	line	44
	
l10701:	
	line	45
;steppermotor.c: 44: return temp;
;	Return value of _spi_transfer is never used
	
l3740:	
	return
	opt stack 0
GLOBAL	__end_of_spi_transfer
	__end_of_spi_transfer:
;; =============== function _spi_transfer ends ============

	signat	_spi_transfer,4217
	global	_Menu
psect	text1102,local,class=CODE,delta=2
global __ptext1102
__ptext1102:

;; *************** function _Menu *****************
;; Defined at:
;;		line 181 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.c"
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
psect	text1102
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.c"
	line	181
	global	__size_of_Menu
	__size_of_Menu	equ	__end_of_Menu-_Menu
	
_Menu:	
	opt	stack 4
; Regs used in _Menu: [wreg-fsr0h+status,2+status,0]
;Menu@BTN_input stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Menu@BTN_input)
	line	182
	
l10669:	
;HMI.c: 182: switch (BTN_input)
	goto	l10687
	line	184
;HMI.c: 183: {
;HMI.c: 184: case 1:
	
l4569:	
	line	186
;HMI.c: 186: break;
	goto	l10689
	line	187
;HMI.c: 187: case 2:
	
l4571:	
	line	189
;HMI.c: 189: break;
	goto	l10689
	line	190
;HMI.c: 190: case 3:
	
l4572:	
	line	191
	
l10671:	
;HMI.c: 191: pos--;
	movlw	low(-1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(-1)
	addwf	(_pos+1)^080h,f
	line	192
	
l10673:	
;HMI.c: 192: if (pos < 0)
	btfss	(_pos+1)^080h,7
	goto	u3791
	goto	u3790
u3791:
	goto	l10689
u3790:
	line	193
	
l10675:	
;HMI.c: 193: pos = 6 - 1;
	movlw	low(05h)
	movwf	(_pos)^080h
	movlw	high(05h)
	movwf	((_pos)^080h)+1
	goto	l10689
	
l4573:	
	line	195
;HMI.c: 195: break;
	goto	l10689
	line	196
;HMI.c: 196: case 4:
	
l4574:	
	line	197
	
l10677:	
;HMI.c: 197: pos++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(01h)
	addwf	(_pos+1)^080h,f
	line	198
;HMI.c: 198: if (pos == 6)
	movlw	06h
	xorwf	(_pos)^080h,w
	iorwf	(_pos+1)^080h,w
	skipz
	goto	u3801
	goto	u3800
u3801:
	goto	l10689
u3800:
	line	199
	
l10679:	
;HMI.c: 199: pos = 0;
	clrf	(_pos)^080h
	clrf	(_pos+1)^080h
	goto	l10689
	
l4575:	
	line	201
;HMI.c: 201: break;
	goto	l10689
	line	202
;HMI.c: 202: case 5:
	
l4576:	
	line	203
	
l10681:	
;HMI.c: 203: return pos;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	goto	l4577
	
l10683:	
	goto	l4577
	line	206
;HMI.c: 206: default:
	
l4578:	
	line	208
;HMI.c: 208: break;
	goto	l10689
	line	209
	
l10685:	
;HMI.c: 209: }
	goto	l10689
	line	182
	
l4568:	
	
l10687:	
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
	goto	l10689
	xorlw	2^1	; case 2
	skipnz
	goto	l10689
	xorlw	3^2	; case 3
	skipnz
	goto	l10671
	xorlw	4^3	; case 4
	skipnz
	goto	l10677
	xorlw	5^4	; case 5
	skipnz
	goto	l10681
	goto	l10689
	opt asmopt_on

	line	209
	
l4570:	
	line	210
	
l10689:	
;HMI.c: 210: return 255;
	movlw	(0FFh)
	goto	l4577
	
l10691:	
	line	211
	
l4577:	
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4217
	global	_ser_putch
psect	text1103,local,class=CODE,delta=2
global __ptext1103
__ptext1103:

;; *************** function _ser_putch *****************
;; Defined at:
;;		line 70 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\ser.c"
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
;;		_robotMoveSpeed
;;		_robotMove
;;		_robotTurn
;;		_ser_puts
;;		_ser_puts2
;;		_ser_puthex
;; This function uses a non-reentrant model
;;
psect	text1103
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\ser.c"
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
	
l10657:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l10659
	
l6792:	
	line	72
;ser.c: 72: continue;
	goto	l10659
	
l6791:	
	line	71
	
l10659:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	(_txoptr)^080h,w	;volatile
	skipnz
	goto	u3781
	goto	u3780
u3781:
	goto	l10659
u3780:
	
l6793:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l10661:	
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
	
l10663:	
;ser.c: 75: txiptr=(txiptr+1) & (16-1);
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_ser_putch+0)+0
	movf	(??_ser_putch+0)+0,w
	movwf	(_txiptr)	;volatile
	line	76
	
l10665:	
;ser.c: 76: TXIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1124/8)^080h,(1124)&7
	line	77
	
l10667:	
;ser.c: 77: GIE=1;
	bsf	(95/8),(95)&7
	line	78
	
l6794:	
	return
	opt stack 0
GLOBAL	__end_of_ser_putch
	__end_of_ser_putch:
;; =============== function _ser_putch ends ============

	signat	_ser_putch,4216
	global	_ser_init
psect	text1104,local,class=CODE,delta=2
global __ptext1104
__ptext1104:

;; *************** function _ser_init *****************
;; Defined at:
;;		line 113 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\ser.c"
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
psect	text1104
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 3
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l10601:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l10603:	
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
	
l10605:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l10607:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l10609:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l10611:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l10613:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l10615:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l10617:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l10619:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l10621:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l10623:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l10625:	
;ser.c: 132: rxiptr=rxoptr=txiptr=txoptr=0;
	movlw	(0)
	movwf	(_txoptr)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_txiptr)	;volatile
	movwf	(_rxoptr)	;volatile
	movwf	(??_ser_init+0)+0
	movf	(??_ser_init+0)+0,w
	movwf	(_rxiptr)	;volatile
	line	133
	
l6816:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_adc_read
psect	text1105,local,class=CODE,delta=2
global __ptext1105
__ptext1105:

;; *************** function _adc_read *****************
;; Defined at:
;;		line 61 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\adc.c"
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
psect	text1105
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\adc.c"
	line	61
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	64
	
l10473:	
;adc.c: 62: volatile unsigned int adc_value;
;adc.c: 64: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	66
	
l10475:	
;adc.c: 66: GO = 1;
	bsf	(250/8),(250)&7
	line	67
;adc.c: 67: while(GO) continue;
	goto	l703
	
l704:	
	
l703:	
	btfsc	(250/8),(250)&7
	goto	u3561
	goto	u3560
u3561:
	goto	l703
u3560:
	
l705:	
	line	68
# 68 "H:\Aldnoah.Zero\branches\Testing\Assignment3\adc.c"
nop ;#
	line	69
# 69 "H:\Aldnoah.Zero\branches\Testing\Assignment3\adc.c"
nop ;#
	line	70
# 70 "H:\Aldnoah.Zero\branches\Testing\Assignment3\adc.c"
nop ;#
psect	text1105
	line	73
	
l10477:	
;adc.c: 73: adc_value = ADRESH;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(30),w	;volatile
	movwf	(??_adc_read+0)+0
	clrf	(??_adc_read+0)+0+1
	movf	0+(??_adc_read+0)+0,w
	movwf	(adc_read@adc_value)	;volatile
	movf	1+(??_adc_read+0)+0,w
	movwf	(adc_read@adc_value+1)	;volatile
	line	74
;adc.c: 74: adc_value <<= 1;
	movlw	01h
	
u3575:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u3575
	line	75
;adc.c: 75: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	78
	
l10479:	
;adc.c: 78: return (adc_value);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(adc_read@adc_value+1),w	;volatile
	clrf	(?_adc_read+1)
	addwf	(?_adc_read+1)
	movf	(adc_read@adc_value),w	;volatile
	clrf	(?_adc_read)
	addwf	(?_adc_read)

	goto	l706
	
l10481:	
	line	79
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
	global	_isr1
psect	text1106,local,class=CODE,delta=2
global __ptext1106
__ptext1106:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 94 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
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
psect	text1106
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\Main.c"
	line	94
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
psect	text1106
	line	98
	
i1l10509:	
;Main.c: 98: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u361_21
	goto	u361_20
u361_21:
	goto	i1l10539
u361_20:
	line	100
	
i1l10511:	
;Main.c: 99: {
;Main.c: 100: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	101
	
i1l10513:	
;Main.c: 101: TMR0 = 100;
	movlw	(064h)
	movwf	(1)	;volatile
	line	103
;Main.c: 103: RTC_Counter++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RTC_Counter)^080h,f	;volatile
	skipnc
	incf	(_RTC_Counter+1)^080h,f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1)^080h,f	;volatile
	line	105
	
i1l10515:	
;Main.c: 105: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	106
	
i1l10517:	
;Main.c: 106: if(RTC_Counter % 10 == 0)
	movlw	low(0Ah)
	movwf	(?i1___lwmod)
	movlw	high(0Ah)
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
	goto	u362_21
	goto	u362_20
u362_21:
	goto	i1l10521
u362_20:
	line	108
	
i1l10519:	
;Main.c: 107: {
;Main.c: 108: RTC_FLAG_10MS = 1;
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l10521
	line	111
	
i1l2213:	
	line	112
	
i1l10521:	
;Main.c: 111: }
;Main.c: 112: if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
	movlw	low(032h)
	movwf	(?i1___lwmod)
	movlw	high(032h)
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
	goto	u363_21
	goto	u363_20
u363_21:
	goto	i1l10525
u363_20:
	
i1l10523:	
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l10525
	
i1l2214:	
	line	113
	
i1l10525:	
;Main.c: 113: if(RTC_Counter % 250 == 0)
	movlw	low(0FAh)
	movwf	(?i1___lwmod)
	movlw	high(0FAh)
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
	goto	u364_21
	goto	u364_20
u364_21:
	goto	i1l10529
u364_20:
	line	116
	
i1l10527:	
;Main.c: 114: {
;Main.c: 116: RTC_FLAG_250MS = 1;
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l10529
	line	118
	
i1l2215:	
	line	119
	
i1l10529:	
;Main.c: 118: }
;Main.c: 119: if(RTC_Counter % 500 == 0)
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
	goto	u365_21
	goto	u365_20
u365_21:
	goto	i1l10535
u365_20:
	line	121
	
i1l10531:	
;Main.c: 120: {
;Main.c: 121: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	122
	
i1l10533:	
;Main.c: 122: RB0 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l10535
	line	124
	
i1l2216:	
	line	125
	
i1l10535:	
;Main.c: 124: }
;Main.c: 125: if (buttonPressed == 0)
	movf	(_buttonPressed),f
	skipz	;volatile
	goto	u366_21
	goto	u366_20
u366_21:
	goto	i1l10539
u366_20:
	line	128
	
i1l10537:	
;Main.c: 126: {
;Main.c: 128: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_buttonPressed)	;volatile
	goto	i1l10539
	line	130
	
i1l2217:	
	goto	i1l10539
	line	131
	
i1l2212:	
	line	132
	
i1l10539:	
;Main.c: 130: }
;Main.c: 131: }
;Main.c: 132: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u367_21
	goto	u367_20
u367_21:
	goto	i1l10549
u367_20:
	
i1l10541:	
	movf	(26),w	;volatile
	movwf	(??_isr1+0)+0
	movf	(_rxiptr),w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	movf	(??_isr1+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
i1l10543:	
	movf	(_rxiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ser_tmp)^080h
	
i1l10545:	
	movf	(_ser_tmp)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_rxoptr),w	;volatile
	skipnz
	goto	u368_21
	goto	u368_20
u368_21:
	goto	i1l10549
u368_20:
	
i1l10547:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ser_tmp)^080h,w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_rxiptr)	;volatile
	goto	i1l10549
	
i1l2219:	
	goto	i1l10549
	
i1l2218:	
	
i1l10549:	
	btfss	(100/8),(100)&7
	goto	u369_21
	goto	u369_20
u369_21:
	goto	i1l2222
u369_20:
	
i1l10551:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u370_21
	goto	u370_20
u370_21:
	goto	i1l2222
u370_20:
	
i1l10553:	
	movf	(_txoptr)^080h,w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	
i1l10555:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_txoptr)^080h,f	;volatile
	
i1l10557:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr)^080h,f	;volatile
	
i1l10559:	
	movf	(_txoptr)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_txiptr),w	;volatile
	skipz
	goto	u371_21
	goto	u371_20
u371_21:
	goto	i1l2222
u371_20:
	
i1l10561:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2222
	
i1l2221:	
	goto	i1l2222
	
i1l2220:	
	line	133
	
i1l2222:	
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
psect	text1107,local,class=CODE,delta=2
global __ptext1107
__ptext1107:

;; *************** function _ReadButtons *****************
;; Defined at:
;;		line 141 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.c"
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
psect	text1107
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.c"
	line	141
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 0
; Regs used in _ReadButtons: [wreg+status,2+status,0+pclath+cstack]
	line	143
	
i1l10563:	
;HMI.c: 143: Debounce();
	fcall	_Debounce
	line	145
	
i1l10565:	
;HMI.c: 145: if(UpPressed)
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u372_21
	goto	u372_20
u372_21:
	goto	i1l4560
u372_20:
	line	147
	
i1l10567:	
;HMI.c: 146: {
;HMI.c: 147: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	148
	
i1l10569:	
;HMI.c: 148: return 1;
	movlw	(01h)
	goto	i1l4561
	
i1l10571:	
	goto	i1l4561
	line	150
	
i1l4560:	
	line	152
;HMI.c: 150: }
;HMI.c: 152: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u373_21
	goto	u373_20
u373_21:
	goto	i1l4562
u373_20:
	line	154
	
i1l10573:	
;HMI.c: 153: {
;HMI.c: 154: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	155
	
i1l10575:	
;HMI.c: 155: return 2;
	movlw	(02h)
	goto	i1l4561
	
i1l10577:	
	goto	i1l4561
	line	157
	
i1l4562:	
	line	158
;HMI.c: 157: }
;HMI.c: 158: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u374_21
	goto	u374_20
u374_21:
	goto	i1l4563
u374_20:
	line	160
	
i1l10579:	
;HMI.c: 159: {
;HMI.c: 160: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	161
	
i1l10581:	
;HMI.c: 161: return 3;
	movlw	(03h)
	goto	i1l4561
	
i1l10583:	
	goto	i1l4561
	line	163
	
i1l4563:	
	line	164
;HMI.c: 163: }
;HMI.c: 164: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u375_21
	goto	u375_20
u375_21:
	goto	i1l4564
u375_20:
	line	166
	
i1l10585:	
;HMI.c: 165: {
;HMI.c: 166: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	167
	
i1l10587:	
;HMI.c: 167: return 4;
	movlw	(04h)
	goto	i1l4561
	
i1l10589:	
	goto	i1l4561
	line	169
	
i1l4564:	
	line	171
;HMI.c: 169: }
;HMI.c: 171: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u376_21
	goto	u376_20
u376_21:
	goto	i1l10597
u376_20:
	line	173
	
i1l10591:	
;HMI.c: 172: {
;HMI.c: 173: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	174
	
i1l10593:	
;HMI.c: 174: return 5;
	movlw	(05h)
	goto	i1l4561
	
i1l10595:	
	goto	i1l4561
	line	176
	
i1l4565:	
	line	177
	
i1l10597:	
;HMI.c: 176: }
;HMI.c: 177: return 0;
	movlw	(0)
	goto	i1l4561
	
i1l10599:	
	line	178
	
i1l4561:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
	global	i1___lwmod
psect	text1108,local,class=CODE,delta=2
global __ptext1108
__ptext1108:

;; *************** function i1___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
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
psect	text1108
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_ofi1___lwmod
	__size_ofi1___lwmod	equ	__end_ofi1___lwmod-i1___lwmod
	
i1___lwmod:	
	opt	stack 1
; Regs used in i1___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l11195:	
	movf	(i1___lwmod@divisor+1),w
	iorwf	(i1___lwmod@divisor),w
	skipnz
	goto	u494_21
	goto	u494_20
u494_21:
	goto	i1l11213
u494_20:
	line	9
	
i1l11197:	
	clrf	(i1___lwmod@counter)
	bsf	status,0
	rlf	(i1___lwmod@counter),f
	line	10
	goto	i1l11203
	
i1l7545:	
	line	11
	
i1l11199:	
	movlw	01h
	
u495_25:
	clrc
	rlf	(i1___lwmod@divisor),f
	rlf	(i1___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u495_25
	line	12
	
i1l11201:	
	movlw	(01h)
	movwf	(??i1___lwmod+0)+0
	movf	(??i1___lwmod+0)+0,w
	addwf	(i1___lwmod@counter),f
	goto	i1l11203
	line	13
	
i1l7544:	
	line	10
	
i1l11203:	
	btfss	(i1___lwmod@divisor+1),(15)&7
	goto	u496_21
	goto	u496_20
u496_21:
	goto	i1l11199
u496_20:
	goto	i1l11205
	
i1l7546:	
	goto	i1l11205
	line	14
	
i1l7547:	
	line	15
	
i1l11205:	
	movf	(i1___lwmod@divisor+1),w
	subwf	(i1___lwmod@dividend+1),w
	skipz
	goto	u497_25
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),w
u497_25:
	skipc
	goto	u497_21
	goto	u497_20
u497_21:
	goto	i1l11209
u497_20:
	line	16
	
i1l11207:	
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),f
	movf	(i1___lwmod@divisor+1),w
	skipc
	decf	(i1___lwmod@dividend+1),f
	subwf	(i1___lwmod@dividend+1),f
	goto	i1l11209
	
i1l7548:	
	line	17
	
i1l11209:	
	movlw	01h
	
u498_25:
	clrc
	rrf	(i1___lwmod@divisor+1),f
	rrf	(i1___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u498_25
	line	18
	
i1l11211:	
	movlw	low(01h)
	subwf	(i1___lwmod@counter),f
	btfss	status,2
	goto	u499_21
	goto	u499_20
u499_21:
	goto	i1l11205
u499_20:
	goto	i1l11213
	
i1l7549:	
	goto	i1l11213
	line	19
	
i1l7543:	
	line	20
	
i1l11213:	
	movf	(i1___lwmod@dividend+1),w
	clrf	(?i1___lwmod+1)
	addwf	(?i1___lwmod+1)
	movf	(i1___lwmod@dividend),w
	clrf	(?i1___lwmod)
	addwf	(?i1___lwmod)

	goto	i1l7550
	
i1l11215:	
	line	21
	
i1l7550:	
	return
	opt stack 0
GLOBAL	__end_ofi1___lwmod
	__end_ofi1___lwmod:
;; =============== function i1___lwmod ends ============

	signat	i1___lwmod,90
	global	_Debounce
psect	text1109,local,class=CODE,delta=2
global __ptext1109
__ptext1109:

;; *************** function _Debounce *****************
;; Defined at:
;;		line 61 in file "H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.c"
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
psect	text1109
	file	"H:\Aldnoah.Zero\branches\Testing\Assignment3\HMI.c"
	line	61
	global	__size_of_Debounce
	__size_of_Debounce	equ	__end_of_Debounce-_Debounce
	
_Debounce:	
	opt	stack 0
; Regs used in _Debounce: [wreg+status,2+status,0]
	line	63
	
i1l10765:	
;HMI.c: 63: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u386_21
	goto	u386_20
u386_21:
	goto	i1l4542
u386_20:
	line	65
	
i1l10767:	
;HMI.c: 64: {
;HMI.c: 65: UpDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_UpDebounceCount)^080h,f	;volatile
	line	66
	
i1l10769:	
;HMI.c: 66: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount)^080h,w	;volatile
	skipc
	goto	u387_21
	goto	u387_20
u387_21:
	goto	i1l4544
u387_20:
	
i1l10771:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u388_21
	goto	u388_20
u388_21:
	goto	i1l4544
u388_20:
	line	68
	
i1l10773:	
;HMI.c: 67: {
;HMI.c: 68: UpPressed = 1;
	bsf	(_UpPressed/8),(_UpPressed)&7
	line	69
;HMI.c: 69: UpReleased = 0;
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l4544
	line	70
	
i1l4543:	
	line	71
;HMI.c: 70: }
;HMI.c: 71: }
	goto	i1l4544
	line	72
	
i1l4542:	
	line	74
;HMI.c: 72: else
;HMI.c: 73: {
;HMI.c: 74: UpDebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_UpDebounceCount)^080h	;volatile
	line	75
;HMI.c: 75: UpReleased = 1;
	bsf	(_UpReleased/8),(_UpReleased)&7
	line	76
	
i1l4544:	
	line	79
;HMI.c: 76: }
;HMI.c: 79: if(!RB3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(51/8),(51)&7
	goto	u389_21
	goto	u389_20
u389_21:
	goto	i1l4545
u389_20:
	line	81
	
i1l10775:	
;HMI.c: 80: {
;HMI.c: 81: DownDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_DownDebounceCount)^080h,f	;volatile
	line	82
	
i1l10777:	
;HMI.c: 82: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount)^080h,w	;volatile
	skipc
	goto	u390_21
	goto	u390_20
u390_21:
	goto	i1l4547
u390_20:
	
i1l10779:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u391_21
	goto	u391_20
u391_21:
	goto	i1l4547
u391_20:
	line	84
	
i1l10781:	
;HMI.c: 83: {
;HMI.c: 84: DownPressed = 1;
	bsf	(_DownPressed/8),(_DownPressed)&7
	line	85
;HMI.c: 85: DownReleased = 0;
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l4547
	line	86
	
i1l4546:	
	line	87
;HMI.c: 86: }
;HMI.c: 87: }
	goto	i1l4547
	line	88
	
i1l4545:	
	line	90
;HMI.c: 88: else
;HMI.c: 89: {
;HMI.c: 90: DownDebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_DownDebounceCount)^080h	;volatile
	line	91
;HMI.c: 91: DownReleased = 1;
	bsf	(_DownReleased/8),(_DownReleased)&7
	line	92
	
i1l4547:	
	line	94
;HMI.c: 92: }
;HMI.c: 94: if(!RB4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(52/8),(52)&7
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l4548
u392_20:
	line	96
	
i1l10783:	
;HMI.c: 95: {
;HMI.c: 96: LeftDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_LeftDebounceCount)^080h,f	;volatile
	line	97
	
i1l10785:	
;HMI.c: 97: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount)^080h,w	;volatile
	skipc
	goto	u393_21
	goto	u393_20
u393_21:
	goto	i1l4550
u393_20:
	
i1l10787:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u394_21
	goto	u394_20
u394_21:
	goto	i1l4550
u394_20:
	line	99
	
i1l10789:	
;HMI.c: 98: {
;HMI.c: 99: LeftPressed = 1;
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	line	100
;HMI.c: 100: LeftReleased = 0;
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l4550
	line	101
	
i1l4549:	
	line	102
;HMI.c: 101: }
;HMI.c: 102: }
	goto	i1l4550
	line	103
	
i1l4548:	
	line	105
;HMI.c: 103: else
;HMI.c: 104: {
;HMI.c: 105: LeftDebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_LeftDebounceCount)^080h	;volatile
	line	106
;HMI.c: 106: LeftReleased = 1;
	bsf	(_LeftReleased/8),(_LeftReleased)&7
	line	107
	
i1l4550:	
	line	109
;HMI.c: 107: }
;HMI.c: 109: if(!RB5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u395_21
	goto	u395_20
u395_21:
	goto	i1l4551
u395_20:
	line	111
	
i1l10791:	
;HMI.c: 110: {
;HMI.c: 111: RightDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RightDebounceCount)^080h,f	;volatile
	line	112
	
i1l10793:	
;HMI.c: 112: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount)^080h,w	;volatile
	skipc
	goto	u396_21
	goto	u396_20
u396_21:
	goto	i1l4553
u396_20:
	
i1l10795:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u397_21
	goto	u397_20
u397_21:
	goto	i1l4553
u397_20:
	line	114
	
i1l10797:	
;HMI.c: 113: {
;HMI.c: 114: RightPressed = 1;
	bsf	(_RightPressed/8),(_RightPressed)&7
	line	115
;HMI.c: 115: RightReleased = 0;
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l4553
	line	116
	
i1l4552:	
	line	117
;HMI.c: 116: }
;HMI.c: 117: }
	goto	i1l4553
	line	118
	
i1l4551:	
	line	120
;HMI.c: 118: else
;HMI.c: 119: {
;HMI.c: 120: RightDebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_RightDebounceCount)^080h	;volatile
	line	121
;HMI.c: 121: RightReleased = 1;
	bsf	(_RightReleased/8),(_RightReleased)&7
	line	122
	
i1l4553:	
	line	124
;HMI.c: 122: }
;HMI.c: 124: if(!RB6)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u398_21
	goto	u398_20
u398_21:
	goto	i1l4554
u398_20:
	line	126
	
i1l10799:	
;HMI.c: 125: {
;HMI.c: 126: CenterDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_CenterDebounceCount)^080h,f	;volatile
	line	127
	
i1l10801:	
;HMI.c: 127: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount)^080h,w	;volatile
	skipc
	goto	u399_21
	goto	u399_20
u399_21:
	goto	i1l4557
u399_20:
	
i1l10803:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u400_21
	goto	u400_20
u400_21:
	goto	i1l4557
u400_20:
	line	129
	
i1l10805:	
;HMI.c: 128: {
;HMI.c: 129: CenterPressed = 1;
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	line	130
;HMI.c: 130: CenterReleased = 0;
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l4557
	line	131
	
i1l4555:	
	line	132
;HMI.c: 131: }
;HMI.c: 132: }
	goto	i1l4557
	line	133
	
i1l4554:	
	line	135
;HMI.c: 133: else
;HMI.c: 134: {
;HMI.c: 135: CenterDebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_CenterDebounceCount)^080h	;volatile
	line	136
;HMI.c: 136: CenterReleased = 1;
	bsf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l4557
	line	137
	
i1l4556:	
	line	138
	
i1l4557:	
	return
	opt stack 0
GLOBAL	__end_of_Debounce
	__end_of_Debounce:
;; =============== function _Debounce ends ============

	signat	_Debounce,88
psect	text1110,local,class=CODE,delta=2
global __ptext1110
__ptext1110:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
