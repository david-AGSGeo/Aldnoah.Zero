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
# 35 "E:\Aldnoah.Zero\Assignment3\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 35 "E:\Aldnoah.Zero\Assignment3\Main.c"
	dw 0xFFFE & 0xFFFB & 0xFFFF & 0xFFBF & 0xFFF7 & 0xFFFF & 0xFF7F & 0xFFFF ;#
	FNCALL	_main,_init
	FNCALL	_main,_readAvgDistance
	FNCALL	_main,_UpdateDisplay
	FNCALL	_main,_Menu
	FNCALL	_main,_calibrateIR
	FNCALL	_main,_scan360
	FNCALL	_main,_rotate
	FNCALL	_main,_robotMove
	FNCALL	_main,_robotTurn
	FNCALL	_main,_ChargeMode
	FNCALL	_scan360,_readAvgDistance
	FNCALL	_scan360,_rotate
	FNCALL	_scan360,_UpdateDisplay
	FNCALL	_ChargeMode,_ser_putch
	FNCALL	_ChargeMode,_UpdateDisplay
	FNCALL	_calibrateIR,_rotate
	FNCALL	_calibrateIR,_UpdateDisplay
	FNCALL	_readAvgDistance,_readDistance
	FNCALL	_readAvgDistance,___lwdiv
	FNCALL	_readAvgDistance,_ADCconvert
	FNCALL	_UpdateDisplay,_lcd_write_control
	FNCALL	_UpdateDisplay,_sprintf
	FNCALL	_UpdateDisplay,_lcd_set_cursor
	FNCALL	_UpdateDisplay,_lcd_write_string
	FNCALL	_UpdateDisplay,___awmod
	FNCALL	_init,_init_adc
	FNCALL	_init,_lcd_init
	FNCALL	_init,_ser_init
	FNCALL	_init,_robo_init
	FNCALL	_readDistance,_adc_read_channel
	FNCALL	_lcd_init,_lcd_write_control
	FNCALL	_lcd_write_string,_lcd_write_data
	FNCALL	_lcd_set_cursor,_lcd_write_control
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_ADCconvert,___wmul
	FNCALL	_ADCconvert,___lwdiv
	FNCALL	_robotTurn,_ser_putch
	FNCALL	_robotMove,_ser_putch
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
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
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
	global	_RTC_Counter
	global	_adcVal
	global	_buttonPressed
	global	_txiptr
	global	_txoptr
	global	_RTC_FLAG_1MS
	global	UpdateDisplay@F1230
	global	_CenterPressed
	global	_CenterReleased
	global	_DownPressed
	global	_DownReleased
	global	_LeftPressed
	global	_LeftReleased
	global	_RTC_FLAG_10MS
	global	_RTC_FLAG_250MS
	global	_RTC_FLAG_500MS
	global	_RTC_FLAG_50MS
	global	_RightPressed
	global	_RightReleased
	global	_UpPressed
	global	_UpReleased
	global	_rxfifo
	global	_txfifo
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
	global	_SCAN_FLAG
	global	_UpDebounceCount
	global	_currentMenu
	global	_current_direction
	global	_highByte
	global	_lowByte
	global	_rxiptr
	global	_rxoptr
	global	_ser_tmp
	global	_serialInput
	global	_turnhighByte
	global	_turnlowByte
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
STR_14	equ	STR_13+0
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

psect	bitbssBANK0,class=BANK0,bit,space=1
global __pbitbssBANK0
__pbitbssBANK0:
_RTC_FLAG_1MS:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_RTC_Counter:
       ds      2

_adcVal:
       ds      2

_buttonPressed:
       ds      1

_txiptr:
       ds      1

_txoptr:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_rxfifo:
       ds      16

_txfifo:
       ds      16

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

_SCAN_FLAG:
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

_rxiptr:
       ds      1

_rxoptr:
       ds      1

_ser_tmp:
       ds      1

_serialInput:
       ds      1

_turnhighByte:
       ds      1

_turnlowByte:
       ds      1

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	32
_menuStrings:
       ds      6

psect	dataBANK1
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	33
_shortMenuStrings:
       ds      6

psect	dataBANK1
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	30
_current_step:
       ds      1

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
UpdateDisplay@F1230:
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
; Clear objects allocated to BITBANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssBANK0/8)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+042h)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+010h)
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
	global	?_UpdateDisplay
?_UpdateDisplay:	; 0 bytes @ 0x0
	global	?_ser_putch
?_ser_putch:	; 0 bytes @ 0x0
	global	?_readAvgDistance
?_readAvgDistance:	; 0 bytes @ 0x0
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
	global	?_calibrateIR
?_calibrateIR:	; 0 bytes @ 0x0
	global	?_ChargeMode
?_ChargeMode:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_Debounce
?_Debounce:	; 0 bytes @ 0x0
	global	??_Debounce
??_Debounce:	; 0 bytes @ 0x0
	global	?_ReadButtons
?_ReadButtons:	; 1 bytes @ 0x0
	global	?_Menu
?_Menu:	; 1 bytes @ 0x0
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
	ds	6
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_ser_init
??_ser_init:	; 0 bytes @ 0x0
	global	??_ser_putch
??_ser_putch:	; 0 bytes @ 0x0
	global	??_Menu
??_Menu:	; 0 bytes @ 0x0
	global	??_init_adc
??_init_adc:	; 0 bytes @ 0x0
	global	??_lcd_write_control
??_lcd_write_control:	; 0 bytes @ 0x0
	global	??_lcd_write_data
??_lcd_write_data:	; 0 bytes @ 0x0
	global	??_spi_transfer
??_spi_transfer:	; 0 bytes @ 0x0
	global	?_adc_read
?_adc_read:	; 2 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	Menu@input
Menu@input:	; 1 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	spi_transfer@temp
spi_transfer@temp:	; 1 bytes @ 0x1
	global	ser_putch@c
ser_putch@c:	; 1 bytes @ 0x1
	ds	1
	global	??_adc_read
??_adc_read:	; 0 bytes @ 0x2
	global	??_robo_init
??_robo_init:	; 0 bytes @ 0x2
	global	?_robotMove
?_robotMove:	; 0 bytes @ 0x2
	global	?_robotTurn
?_robotTurn:	; 0 bytes @ 0x2
	global	lcd_write_control@databyte
lcd_write_control@databyte:	; 1 bytes @ 0x2
	global	lcd_write_data@databyte
lcd_write_data@databyte:	; 1 bytes @ 0x2
	global	spi_transfer@data
spi_transfer@data:	; 1 bytes @ 0x2
	global	robotMove@distance
robotMove@distance:	; 2 bytes @ 0x2
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
	global	rotate@numsteps
rotate@numsteps:	; 2 bytes @ 0x3
	ds	1
	global	??_robotMove
??_robotMove:	; 0 bytes @ 0x4
	global	??_robotTurn
??_robotTurn:	; 0 bytes @ 0x4
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	adc_read@adc_value
adc_read@adc_value:	; 2 bytes @ 0x4
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
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
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
	global	?_readDistance
?_readDistance:	; 2 bytes @ 0x8
	global	rotate@i
rotate@i:	; 2 bytes @ 0x8
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x8
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
	global	readAvgDistance@fullval
readAvgDistance@fullval:	; 2 bytes @ 0x10
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x10
	ds	2
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
	ds	5
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
	ds	5
	global	UpdateDisplay@adcOutput
UpdateDisplay@adcOutput:	; 16 bytes @ 0x2A
	ds	16
	global	??_calibrateIR
??_calibrateIR:	; 0 bytes @ 0x3A
	global	??_ChargeMode
??_ChargeMode:	; 0 bytes @ 0x3A
	global	?_scan360
?_scan360:	; 2 bytes @ 0x3A
	ds	2
	global	??_scan360
??_scan360:	; 0 bytes @ 0x3C
	global	scan360@lowestVal
scan360@lowestVal:	; 2 bytes @ 0x3C
	ds	2
	global	scan360@lowestSteps
scan360@lowestSteps:	; 2 bytes @ 0x3E
	ds	2
	global	scan360@steps
scan360@steps:	; 2 bytes @ 0x40
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x42
	ds	3
	global	main@shortwall
main@shortwall:	; 2 bytes @ 0x45
	ds	2
	global	main@choice
main@choice:	; 1 bytes @ 0x47
	ds	1
;;Data sizes: Strings 133, constant 10, data 13, bss 89, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      14
;; BANK0           80     72      80
;; BANK1           80      0      79
;; BANK3           96      0      16
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?i1___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?_readDistance	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?_scan360	int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?_adc_read	unsigned int  size(1) Largest target is 0
;;
;; sprintf@f	PTR const unsigned char  size(1) Largest target is 15
;;		 -> STR_14(CODE[15]), STR_13(CODE[15]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;;		 -> UpdateDisplay@adcOutput(BANK0[16]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK0[2]), 
;;
;; S8128$_cp	PTR const unsigned char  size(1) Largest target is 0
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
;;		 -> STR_15(CODE[4]), UpdateDisplay@adcOutput(BANK0[16]), STR_12(CODE[4]), STR_11(CODE[4]), 
;;		 -> STR_10(CODE[4]), STR_9(CODE[4]), STR_8(CODE[4]), STR_7(CODE[4]), 
;;		 -> STR_6(CODE[9]), STR_5(CODE[9]), STR_4(CODE[8]), STR_3(CODE[9]), 
;;		 -> STR_2(CODE[9]), STR_1(CODE[9]), 
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
;;   _main->_scan360
;;   _scan360->_UpdateDisplay
;;   _ChargeMode->_UpdateDisplay
;;   _calibrateIR->_UpdateDisplay
;;   _readAvgDistance->_ADCconvert
;;   _UpdateDisplay->_sprintf
;;   _readDistance->_adc_read_channel
;;   _lcd_init->_lcd_write_control
;;   _lcd_write_string->___awmod
;;   _lcd_set_cursor->_lcd_write_control
;;   _sprintf->___lwmod
;;   _ADCconvert->___lwdiv
;;   _robotTurn->_ser_putch
;;   _robotMove->_ser_putch
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
;; (0) _main                                                 6     6      0    7191
;;                                             66 BANK0      6     6      0
;;                               _init
;;                    _readAvgDistance
;;                      _UpdateDisplay
;;                               _Menu
;;                        _calibrateIR
;;                            _scan360
;;                             _rotate
;;                          _robotMove
;;                          _robotTurn
;;                         _ChargeMode
;; ---------------------------------------------------------------------------------
;; (1) _scan360                                              8     6      2    2118
;;                                             58 BANK0      8     6      2
;;                    _readAvgDistance
;;                             _rotate
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (1) _ChargeMode                                           1     1      0    1349
;;                                             58 BANK0      1     1      0
;;                          _ser_putch
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (1) _calibrateIR                                          0     0      0    1425
;;                             _rotate
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (2) _readAvgDistance                                      4     4      0     555
;;                                             16 BANK0      4     4      0
;;                       _readDistance
;;                            ___lwdiv
;;                         _ADCconvert
;; ---------------------------------------------------------------------------------
;; (2) _UpdateDisplay                                       21    21      0    1327
;;                                             37 BANK0     21    21      0
;;                  _lcd_write_control
;;                            _sprintf
;;                     _lcd_set_cursor
;;                   _lcd_write_string
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 1     1      0      44
;;                                              3 BANK0      1     1      0
;;                           _init_adc
;;                           _lcd_init
;;                           _ser_init
;;                          _robo_init
;; ---------------------------------------------------------------------------------
;; (3) _readDistance                                         6     4      2      69
;;                                              8 BANK0      6     4      2
;;                   _adc_read_channel
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
;; (1) _robotTurn                                            3     1      2      88
;;                                              2 BANK0      3     1      2
;;                          _ser_putch
;; ---------------------------------------------------------------------------------
;; (1) _robotMove                                            3     1      2      88
;;                                              2 BANK0      3     1      2
;;                          _ser_putch
;; ---------------------------------------------------------------------------------
;; (1) _rotate                                               7     4      3      98
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
;; (4) ___wmul                                               6     2      4      92
;;                                              0 BANK0      6     2      4
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
;; (6) _isr1                                                 6     6      0     641
;;                                              6 COMMON     6     6      0
;;                          i1___lwmod
;;                        _ReadButtons
;; ---------------------------------------------------------------------------------
;; (7) _ReadButtons                                          0     0      0       0
;;                           _Debounce
;; ---------------------------------------------------------------------------------
;; (7) i1___lwmod                                            6     2      4     641
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
;;     _init_adc
;;     _lcd_init
;;       _lcd_write_control
;;     _ser_init
;;     _robo_init
;;       _ser_putch
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
;;   _robotMove
;;     _ser_putch
;;   _robotTurn
;;     _ser_putch
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
;;BANK3               60      0      10       9       16.7%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      4F       7       98.8%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      C8      12        0.0%
;;ABS                  0      0      BD       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       B       2        0.0%
;;BANK0               50     48      50       5      100.0%
;;BITBANK0            50      0       1       4        1.3%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      C       E       1      100.0%
;;BITCOMMON            E      0       2       0       14.3%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 318 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  shortwall       2   69[BANK0 ] int 
;;  choice          1   71[BANK0 ] unsigned char 
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
;;		_readAvgDistance
;;		_UpdateDisplay
;;		_Menu
;;		_calibrateIR
;;		_scan360
;;		_rotate
;;		_robotMove
;;		_robotTurn
;;		_ChargeMode
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	318
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	319
	
l11313:	
;Main.c: 319: unsigned char choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	line	320
	
l11315:	
;Main.c: 320: int shortwall = 0;
	clrf	(main@shortwall)
	clrf	(main@shortwall+1)
	line	324
	
l11317:	
;Main.c: 324: init();
	fcall	_init
	goto	l11319
	line	329
;Main.c: 329: while(1)
	
l2248:	
	line	333
	
l11319:	
;Main.c: 330: {
;Main.c: 333: if ((SCAN_FLAG == 0) & (RTC_FLAG_250MS == 1))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_SCAN_FLAG)^080h,f
	skipz
	goto	u4971
	goto	u4970
u4971:
	goto	l11349
u4970:
	
l11321:	
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u4981
	goto	u4980
u4981:
	goto	l11349
u4980:
	line	335
	
l11323:	
;Main.c: 334: {
;Main.c: 335: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	337
	
l11325:	
;Main.c: 337: readAvgDistance();
	fcall	_readAvgDistance
	line	338
;Main.c: 338: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l11349
	line	339
	
l2249:	
	line	347
;Main.c: 339: }
;Main.c: 347: switch (buttonPressed)
	goto	l11349
	line	349
;Main.c: 348: {
;Main.c: 349: case 1:
	
l2251:	
	line	350
	
l11327:	
;Main.c: 350: Menu(1);
	movlw	(01h)
	fcall	_Menu
	line	352
	
l11329:	
;Main.c: 352: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	354
;Main.c: 354: break;
	goto	l11373
	line	355
;Main.c: 355: case 2:
	
l2253:	
	line	356
	
l11331:	
;Main.c: 356: Menu(2);
	movlw	(02h)
	fcall	_Menu
	line	358
	
l11333:	
;Main.c: 358: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	360
;Main.c: 360: break;
	goto	l11373
	line	361
;Main.c: 361: case 3:
	
l2254:	
	line	362
	
l11335:	
;Main.c: 362: Menu(3);
	movlw	(03h)
	fcall	_Menu
	line	364
	
l11337:	
;Main.c: 364: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	366
;Main.c: 366: break;
	goto	l11373
	line	367
;Main.c: 367: case 4:
	
l2255:	
	line	368
	
l11339:	
;Main.c: 368: Menu(4);
	movlw	(04h)
	fcall	_Menu
	line	370
	
l11341:	
;Main.c: 370: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	372
;Main.c: 372: break;
	goto	l11373
	line	373
;Main.c: 373: case 5:
	
l2256:	
	line	374
	
l11343:	
;Main.c: 374: choice = Menu(5);
	movlw	(05h)
	fcall	_Menu
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	line	376
	
l11345:	
;Main.c: 376: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	378
;Main.c: 378: break;
	goto	l11373
	line	379
;Main.c: 379: default:
	
l2257:	
	line	381
;Main.c: 381: break;
	goto	l11373
	line	382
	
l11347:	
;Main.c: 382: }
	goto	l11373
	line	347
	
l2250:	
	
l11349:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	l11327
	xorlw	2^1	; case 2
	skipnz
	goto	l11331
	xorlw	3^2	; case 3
	skipnz
	goto	l11335
	xorlw	4^3	; case 4
	skipnz
	goto	l11339
	xorlw	5^4	; case 5
	skipnz
	goto	l11343
	goto	l11373
	opt asmopt_on

	line	382
	
l2252:	
	line	385
;Main.c: 385: switch (choice)
	goto	l11373
	line	387
;Main.c: 386: {
;Main.c: 387: case 0:
	
l2259:	
	line	388
	
l11351:	
;Main.c: 388: calibrateIR();
	fcall	_calibrateIR
	line	389
;Main.c: 389: break;
	goto	l11375
	line	390
;Main.c: 390: case 1:
	
l2261:	
	line	391
	
l11353:	
;Main.c: 391: shortwall = scan360();
	fcall	_scan360
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_scan360)),w
	clrf	(main@shortwall+1)
	addwf	(main@shortwall+1)
	movf	(0+(?_scan360)),w
	clrf	(main@shortwall)
	addwf	(main@shortwall)

	line	392
	
l11355:	
;Main.c: 392: rotate((400 - shortwall), 0);
	comf	(main@shortwall),w
	movwf	(??_main+0)+0
	comf	(main@shortwall+1),w
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
	line	393
;Main.c: 393: break;
	goto	l11375
	line	394
;Main.c: 394: case 2:
	
l2262:	
	line	395
	
l11357:	
;Main.c: 395: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u4997:
	decfsz	((??_main+0)+0),f
	goto	u4997
	decfsz	((??_main+0)+0+1),f
	goto	u4997
	decfsz	((??_main+0)+0+2),f
	goto	u4997
	nop2
opt asmopt_on

	line	396
	
l11359:	
;Main.c: 396: robotMove(200);
	movlw	low(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMove)
	movlw	high(0C8h)
	movwf	((?_robotMove))+1
	fcall	_robotMove
	line	399
;Main.c: 399: break;
	goto	l11375
	line	400
;Main.c: 400: case 3:
	
l2263:	
	line	401
	
l11361:	
;Main.c: 401: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u5007:
	decfsz	((??_main+0)+0),f
	goto	u5007
	decfsz	((??_main+0)+0+1),f
	goto	u5007
	decfsz	((??_main+0)+0+2),f
	goto	u5007
	nop2
opt asmopt_on

	line	402
	
l11363:	
;Main.c: 402: robotMove(1000);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMove)
	movlw	high(03E8h)
	movwf	((?_robotMove))+1
	fcall	_robotMove
	line	403
	
l11365:	
;Main.c: 403: robotTurn(-90);
	movlw	low(-90)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotTurn)
	movlw	high(-90)
	movwf	((?_robotTurn))+1
	fcall	_robotTurn
	line	404
	
l11367:	
;Main.c: 404: robotMove(1000);
	movlw	low(03E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_robotMove)
	movlw	high(03E8h)
	movwf	((?_robotMove))+1
	fcall	_robotMove
	line	405
;Main.c: 405: break;
	goto	l11375
	line	406
;Main.c: 406: case 4:
	
l2264:	
	line	408
;Main.c: 408: break;
	goto	l11375
	line	410
;Main.c: 410: case 5:
	
l2265:	
	line	411
	
l11369:	
;Main.c: 411: ChargeMode();
	fcall	_ChargeMode
	line	412
;Main.c: 412: break;
	goto	l11375
	line	413
;Main.c: 413: default:
	
l2266:	
	line	415
;Main.c: 415: break;
	goto	l11375
	line	416
	
l11371:	
;Main.c: 416: }
	goto	l11375
	line	385
	
l2258:	
	
l11373:	
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
	goto	l11351
	xorlw	1^0	; case 1
	skipnz
	goto	l11353
	xorlw	2^1	; case 2
	skipnz
	goto	l11357
	xorlw	3^2	; case 3
	skipnz
	goto	l11361
	xorlw	4^3	; case 4
	skipnz
	goto	l11375
	xorlw	5^4	; case 5
	skipnz
	goto	l11369
	goto	l11375
	opt asmopt_on

	line	416
	
l2260:	
	line	417
	
l11375:	
;Main.c: 417: choice = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@choice)
	goto	l11319
	line	418
	
l2267:	
	line	329
	goto	l11319
	
l2268:	
	line	419
	
l2269:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_scan360
psect	text1170,local,class=CODE,delta=2
global __ptext1170
__ptext1170:

;; *************** function _scan360 *****************
;; Defined at:
;;		line 289 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  steps           2   64[BANK0 ] int 
;;  lowestSteps     2   62[BANK0 ] int 
;;  lowestVal       2   60[BANK0 ] int 
;; Return value:  Size  Location     Type
;;                  2   58[BANK0 ] int 
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
psect	text1170
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	289
	global	__size_of_scan360
	__size_of_scan360	equ	__end_of_scan360-_scan360
	
_scan360:	
	opt	stack 0
; Regs used in _scan360: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	290
	
l10971:	
;Main.c: 290: int lowestVal = 0, lowestSteps = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(scan360@lowestVal)
	clrf	(scan360@lowestVal+1)
	clrf	(scan360@lowestSteps)
	clrf	(scan360@lowestSteps+1)
	line	291
	
l10973:	
;Main.c: 291: SCAN_FLAG = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_SCAN_FLAG)^080h
	bsf	status,0
	rlf	(_SCAN_FLAG)^080h,f
	line	292
	
l10975:	
;Main.c: 292: for (int steps = 0; steps < 400; steps++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(scan360@steps)
	clrf	(scan360@steps+1)
	
l10977:	
	movf	(scan360@steps+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0190h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4525
	movlw	low(0190h)
	subwf	(scan360@steps),w
u4525:

	skipc
	goto	u4521
	goto	u4520
u4521:
	goto	l10981
u4520:
	goto	l2242
	
l10979:	
	goto	l2242
	line	293
	
l2241:	
	line	294
	
l10981:	
;Main.c: 293: {
;Main.c: 294: readAvgDistance();
	fcall	_readAvgDistance
	line	295
	
l10983:	
;Main.c: 295: if (adcVal > lowestVal)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	subwf	(scan360@lowestVal+1),w
	skipz
	goto	u4535
	movf	(_adcVal),w	;volatile
	subwf	(scan360@lowestVal),w
u4535:
	skipnc
	goto	u4531
	goto	u4530
u4531:
	goto	l10987
u4530:
	line	297
	
l10985:	
;Main.c: 296: {
;Main.c: 297: lowestVal = adcVal;
	movf	(_adcVal+1),w	;volatile
	clrf	(scan360@lowestVal+1)	;volatile
	addwf	(scan360@lowestVal+1)	;volatile
	movf	(_adcVal),w	;volatile
	clrf	(scan360@lowestVal)	;volatile
	addwf	(scan360@lowestVal)	;volatile

	line	298
;Main.c: 298: lowestSteps = steps;
	movf	(scan360@steps+1),w
	clrf	(scan360@lowestSteps+1)
	addwf	(scan360@lowestSteps+1)
	movf	(scan360@steps),w
	clrf	(scan360@lowestSteps)
	addwf	(scan360@lowestSteps)

	goto	l10987
	line	300
	
l2243:	
	line	301
	
l10987:	
;Main.c: 300: }
;Main.c: 301: rotate(1, 1);
	movlw	low(01h)
	movwf	(?_rotate)
	movlw	high(01h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	line	303
	
l10989:	
;Main.c: 303: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u4541
	goto	u4540
u4541:
	goto	l10995
u4540:
	line	305
	
l10991:	
;Main.c: 304: {
;Main.c: 305: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	306
	
l10993:	
;Main.c: 306: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l10995
	line	307
	
l2244:	
	line	308
	
l10995:	
;Main.c: 307: }
;Main.c: 308: test = lowestSteps;
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

	line	292
	
l10997:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(scan360@steps),f
	skipnc
	incf	(scan360@steps+1),f
	movlw	high(01h)
	addwf	(scan360@steps+1),f
	
l10999:	
	movf	(scan360@steps+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0190h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4555
	movlw	low(0190h)
	subwf	(scan360@steps),w
u4555:

	skipc
	goto	u4551
	goto	u4550
u4551:
	goto	l10981
u4550:
	
l2242:	
	line	310
;Main.c: 309: }
;Main.c: 310: SCAN_FLAG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_SCAN_FLAG)^080h
	line	311
	
l11001:	
;Main.c: 311: return lowestSteps;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(scan360@lowestSteps+1),w
	clrf	(?_scan360+1)
	addwf	(?_scan360+1)
	movf	(scan360@lowestSteps),w
	clrf	(?_scan360)
	addwf	(?_scan360)

	goto	l2245
	
l11003:	
	line	312
	
l2245:	
	return
	opt stack 0
GLOBAL	__end_of_scan360
	__end_of_scan360:
;; =============== function _scan360 ends ============

	signat	_scan360,90
	global	_ChargeMode
psect	text1171,local,class=CODE,delta=2
global __ptext1171
__ptext1171:

;; *************** function _ChargeMode *****************
;; Defined at:
;;		line 235 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text1171
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	235
	global	__size_of_ChargeMode
	__size_of_ChargeMode	equ	__end_of_ChargeMode-_ChargeMode
	
_ChargeMode:	
	opt	stack 1
; Regs used in _ChargeMode: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	237
	
l10949:	
;Main.c: 237: currentMenu = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ChargeMode+0)+0
	movf	(??_ChargeMode+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_currentMenu)^080h
	line	238
	
l10951:	
;Main.c: 238: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	goto	l10953
	line	240
;Main.c: 240: while (1)
	
l2226:	
	line	242
	
l10953:	
;Main.c: 241: {
;Main.c: 242: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u4511
	goto	u4510
u4511:
	goto	l10969
u4510:
	line	244
	
l10955:	
;Main.c: 243: {
;Main.c: 244: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	245
	
l10957:	
;Main.c: 245: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l10969
	line	246
	
l2227:	
	line	247
;Main.c: 246: }
;Main.c: 247: switch (buttonPressed)
	goto	l10969
	line	249
;Main.c: 248: {
;Main.c: 249: case 1:
	
l2229:	
	line	252
;Main.c: 252: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	254
;Main.c: 254: break;
	goto	l10953
	line	255
;Main.c: 255: case 2:
	
l2231:	
	line	258
;Main.c: 258: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	260
;Main.c: 260: break;
	goto	l10953
	line	261
;Main.c: 261: case 3:
	
l2232:	
	line	264
;Main.c: 264: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	266
;Main.c: 266: break;
	goto	l10953
	line	267
;Main.c: 267: case 4:
	
l2233:	
	line	270
;Main.c: 270: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	272
;Main.c: 272: break;
	goto	l10953
	line	273
;Main.c: 273: case 5:
	
l2234:	
	line	274
	
l10959:	
;Main.c: 274: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	276
	
l10961:	
;Main.c: 276: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	277
	
l10963:	
;Main.c: 277: currentMenu = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h
	goto	l2235
	line	278
	
l10965:	
;Main.c: 278: return;
	goto	l2235
	line	280
;Main.c: 280: default:
	
l2236:	
	line	282
;Main.c: 282: break;
	goto	l10953
	line	283
	
l10967:	
;Main.c: 283: }
	goto	l10953
	line	247
	
l2228:	
	
l10969:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	l2229
	xorlw	2^1	; case 2
	skipnz
	goto	l2231
	xorlw	3^2	; case 3
	skipnz
	goto	l2232
	xorlw	4^3	; case 4
	skipnz
	goto	l2233
	xorlw	5^4	; case 5
	skipnz
	goto	l10959
	goto	l10953
	opt asmopt_on

	line	283
	
l2230:	
	goto	l10953
	line	284
	
l2237:	
	line	240
	goto	l10953
	
l2238:	
	line	285
	
l2235:	
	return
	opt stack 0
GLOBAL	__end_of_ChargeMode
	__end_of_ChargeMode:
;; =============== function _ChargeMode ends ============

	signat	_ChargeMode,88
	global	_calibrateIR
psect	text1172,local,class=CODE,delta=2
global __ptext1172
__ptext1172:

;; *************** function _calibrateIR *****************
;; Defined at:
;;		line 184 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text1172
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	184
	global	__size_of_calibrateIR
	__size_of_calibrateIR	equ	__end_of_calibrateIR-_calibrateIR
	
_calibrateIR:	
	opt	stack 1
; Regs used in _calibrateIR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	186
	
l10919:	
;Main.c: 186: currentMenu = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h
	bsf	status,0
	rlf	(_currentMenu)^080h,f
	line	187
	
l10921:	
;Main.c: 187: rotate(8, 0);
	movlw	low(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_rotate)
	movlw	high(08h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	goto	l10923
	line	188
;Main.c: 188: while (1)
	
l2211:	
	line	190
	
l10923:	
;Main.c: 189: {
;Main.c: 190: if (RTC_FLAG_250MS == 1)
	btfss	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	u4501
	goto	u4500
u4501:
	goto	l10947
u4500:
	line	192
	
l10925:	
;Main.c: 191: {
;Main.c: 192: RTC_FLAG_250MS = 0;
	bcf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	line	193
	
l10927:	
;Main.c: 193: UpdateDisplay();
	fcall	_UpdateDisplay
	goto	l10947
	line	194
	
l2212:	
	line	195
;Main.c: 194: }
;Main.c: 195: switch (buttonPressed)
	goto	l10947
	line	197
;Main.c: 196: {
;Main.c: 197: case 1:
	
l2214:	
	line	200
;Main.c: 200: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	202
;Main.c: 202: break;
	goto	l10923
	line	203
;Main.c: 203: case 2:
	
l2216:	
	line	206
;Main.c: 206: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	208
;Main.c: 208: break;
	goto	l10923
	line	209
;Main.c: 209: case 3:
	
l2217:	
	line	210
	
l10929:	
;Main.c: 210: rotate(1, 1);
	movlw	low(01h)
	movwf	(?_rotate)
	movlw	high(01h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	bsf	status,0
	rlf	0+(?_rotate)+02h,f
	fcall	_rotate
	line	212
	
l10931:	
;Main.c: 212: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	214
;Main.c: 214: break;
	goto	l10923
	line	215
;Main.c: 215: case 4:
	
l2218:	
	line	216
	
l10933:	
;Main.c: 216: rotate(1, 0);
	movlw	low(01h)
	movwf	(?_rotate)
	movlw	high(01h)
	movwf	((?_rotate))+1
	clrf	0+(?_rotate)+02h
	fcall	_rotate
	line	218
	
l10935:	
;Main.c: 218: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	220
;Main.c: 220: break;
	goto	l10923
	line	221
;Main.c: 221: case 5:
	
l2219:	
	line	222
	
l10937:	
;Main.c: 222: totalSteps = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_totalSteps)^080h
	clrf	(_totalSteps+1)^080h
	line	224
	
l10939:	
;Main.c: 224: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	225
	
l10941:	
;Main.c: 225: currentMenu = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_currentMenu)^080h
	goto	l2220
	line	226
	
l10943:	
;Main.c: 226: return;
	goto	l2220
	line	228
;Main.c: 228: default:
	
l2221:	
	line	230
;Main.c: 230: break;
	goto	l10923
	line	231
	
l10945:	
;Main.c: 231: }
	goto	l10923
	line	195
	
l2213:	
	
l10947:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	l2214
	xorlw	2^1	; case 2
	skipnz
	goto	l2216
	xorlw	3^2	; case 3
	skipnz
	goto	l10929
	xorlw	4^3	; case 4
	skipnz
	goto	l10933
	xorlw	5^4	; case 5
	skipnz
	goto	l10937
	goto	l10923
	opt asmopt_on

	line	231
	
l2215:	
	goto	l10923
	line	232
	
l2222:	
	line	188
	goto	l10923
	
l2223:	
	line	233
	
l2220:	
	return
	opt stack 0
GLOBAL	__end_of_calibrateIR
	__end_of_calibrateIR:
;; =============== function _calibrateIR ends ============

	signat	_calibrateIR,88
	global	_readAvgDistance
psect	text1173,local,class=CODE,delta=2
global __ptext1173
__ptext1173:

;; *************** function _readAvgDistance *****************
;; Defined at:
;;		line 10 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
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
psect	text1173
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	10
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	11
	
l10905:	
;infrared.c: 11: unsigned int fullval = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(readAvgDistance@fullval)
	clrf	(readAvgDistance@fullval+1)
	line	14
;infrared.c: 14: for (int i = 0; i < 10; i++)
	clrf	(readAvgDistance@i)
	clrf	(readAvgDistance@i+1)
	
l10907:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u4485
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u4485:

	skipc
	goto	u4481
	goto	u4480
u4481:
	goto	l10911
u4480:
	goto	l10917
	
l10909:	
	goto	l10917
	line	15
	
l2972:	
	line	16
	
l10911:	
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
	
l10913:	
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
l10915:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u4495
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u4495:

	skipc
	goto	u4491
	goto	u4490
u4491:
	goto	l10911
u4490:
	goto	l10917
	
l2973:	
	line	19
	
l10917:	
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
	
l2974:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,88
	global	_UpdateDisplay
psect	text1174,local,class=CODE,delta=2
global __ptext1174
__ptext1174:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 215 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adcOutput      16   42[BANK0 ] unsigned char [16]
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
;;      Temps:          0       5       0       0       0
;;      Totals:         0      21       0       0       0
;;Total ram usage:       21 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_lcd_write_control
;;		_sprintf
;;		_lcd_set_cursor
;;		_lcd_write_string
;;		___awmod
;; This function is called by:
;;		_calibrateIR
;;		_ChargeMode
;;		_scan360
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1174
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	215
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
	opt	stack 1
; Regs used in _UpdateDisplay: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	216
	
l10859:	
;HMI.c: 216: char adcOutput[16] = "";
	movlw	(UpdateDisplay@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1230)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	fsr0,w
	movwf	((??_UpdateDisplay+0)+0+1)
	movlw	16
	movwf	((??_UpdateDisplay+0)+0+2)
u4460:
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
	goto	u4460
	line	217
;HMI.c: 217: switch (currentMenu)
	goto	l10903
	line	220
;HMI.c: 218: {
;HMI.c: 220: case 0:
	
l5263:	
	line	223
	
l10861:	
;HMI.c: 223: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	225
	
l10863:	
;HMI.c: 225: sprintf(adcOutput,"ADC:%d Dist:%d",adcVal, distTravelled);
	movlw	((STR_13-__stringbase))&0ffh
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
	movf	(_distTravelled+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+03h
	addwf	1+(?_sprintf)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distTravelled)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+03h
	addwf	0+(?_sprintf)+03h

	movlw	(UpdateDisplay@adcOutput)&0ffh
	fcall	_sprintf
	line	228
	
l10865:	
;HMI.c: 228: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	229
;HMI.c: 229: lcd_write_string(adcOutput);
	movlw	(UpdateDisplay@adcOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	231
	
l10867:	
;HMI.c: 231: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	232
	
l10869:	
;HMI.c: 232: if (pos > 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u4475
	movlw	low(01h)
	subwf	(_pos)^080h,w
u4475:

	skipc
	goto	u4471
	goto	u4470
u4471:
	goto	l10873
u4470:
	line	233
	
l10871:	
;HMI.c: 233: lcd_write_string(shortMenuStrings[pos - 1]);
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
	goto	l10875
	line	234
	
l5264:	
	line	235
	
l10873:	
;HMI.c: 234: else
;HMI.c: 235: lcd_write_string(shortMenuStrings[pos + 6 - 1]);
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
	goto	l10875
	
l5265:	
	line	236
	
l10875:	
;HMI.c: 236: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	237
	
l10877:	
;HMI.c: 237: lcd_write_string(menuStrings[pos]);
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
	line	238
;HMI.c: 238: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	239
	
l10879:	
;HMI.c: 239: lcd_write_string(shortMenuStrings[(pos + 1) % 6]);
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
	line	240
;HMI.c: 240: break;
	goto	l5270
	line	241
;HMI.c: 241: case 1:
	
l5267:	
	line	242
	
l10881:	
;HMI.c: 242: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	244
	
l10883:	
;HMI.c: 244: sprintf(adcOutput,"ADC:%d Dist:%d",highByte, lowByte);
	movlw	((STR_14-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	(??_UpdateDisplay+0)+0,w
	movwf	(?_sprintf)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_highByte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+1)+0
	clrf	(??_UpdateDisplay+1)+0+1
	movf	0+(??_UpdateDisplay+1)+0,w
	movwf	0+(?_sprintf)+01h
	movf	1+(??_UpdateDisplay+1)+0,w
	movwf	1+(?_sprintf)+01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_lowByte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+3)+0
	clrf	(??_UpdateDisplay+3)+0+1
	movf	0+(??_UpdateDisplay+3)+0,w
	movwf	0+(?_sprintf)+03h
	movf	1+(??_UpdateDisplay+3)+0,w
	movwf	1+(?_sprintf)+03h
	movlw	(UpdateDisplay@adcOutput)&0ffh
	fcall	_sprintf
	line	246
	
l10885:	
;HMI.c: 246: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	247
;HMI.c: 247: lcd_write_string(adcOutput);
	movlw	(UpdateDisplay@adcOutput&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	252
	
l10887:	
;HMI.c: 252: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	254
	
l10889:	
;HMI.c: 254: lcd_write_string("<<<");
	movlw	low((STR_15-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	257
;HMI.c: 257: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	258
	
l10891:	
;HMI.c: 258: lcd_write_string("CONFIRM");
	movlw	low((STR_16-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	259
	
l10893:	
;HMI.c: 259: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	260
;HMI.c: 260: lcd_write_string(">>>");
	movlw	low((STR_17-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	261
;HMI.c: 261: break;
	goto	l5270
	line	262
;HMI.c: 262: case 2:
	
l5268:	
	line	263
	
l10895:	
;HMI.c: 263: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	265
;HMI.c: 265: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	266
	
l10897:	
;HMI.c: 266: lcd_write_string(" Charging Mode ");
	movlw	low((STR_18-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	270
	
l10899:	
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
	line	273
;HMI.c: 273: break;
	goto	l5270
	line	275
;HMI.c: 275: default:
	
l5269:	
	line	277
;HMI.c: 277: break;
	goto	l5270
	line	280
	
l10901:	
;HMI.c: 280: }
	goto	l5270
	line	217
	
l5262:	
	
l10903:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_currentMenu)^080h,w
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
	goto	l10861
	xorlw	1^0	; case 1
	skipnz
	goto	l10881
	xorlw	2^1	; case 2
	skipnz
	goto	l10895
	goto	l5270
	opt asmopt_on

	line	280
	
l5266:	
	line	281
	
l5270:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,88
	global	_init
psect	text1175,local,class=CODE,delta=2
global __ptext1175
__ptext1175:

;; *************** function _init *****************
;; Defined at:
;;		line 158 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;		_init_adc
;;		_lcd_init
;;		_ser_init
;;		_robo_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1175
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	158
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 2
; Regs used in _init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	159
	
l11289:	
;Main.c: 159: GIE=0;
	bcf	(95/8),(95)&7
	line	160
	
l11291:	
;Main.c: 160: init_adc();
	fcall	_init_adc
	line	161
;Main.c: 161: lcd_init();
	fcall	_lcd_init
	line	162
;Main.c: 162: ser_init();
	fcall	_ser_init
	line	163
	
l11293:	
;Main.c: 163: robo_init();
	fcall	_robo_init
	line	165
	
l11295:	
;Main.c: 165: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	166
	
l11297:	
;Main.c: 166: TRISC &= 0b10010000;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_init+0)+0
	movf	(??_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	(135)^080h,f	;volatile
	line	168
	
l11299:	
;Main.c: 168: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	169
	
l11301:	
;Main.c: 169: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	171
	
l11303:	
;Main.c: 171: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	174
	
l11305:	
;Main.c: 174: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	175
	
l11307:	
;Main.c: 175: PEIE=1;
	bsf	(94/8),(94)&7
	line	177
	
l11309:	
;Main.c: 177: GIE=1;
	bsf	(95/8),(95)&7
	line	178
	
l11311:	
;Main.c: 178: (GIE = 1);
	bsf	(95/8),(95)&7
	line	179
	
l2208:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_readDistance
psect	text1176,local,class=CODE,delta=2
global __ptext1176
__ptext1176:

;; *************** function _readDistance *****************
;; Defined at:
;;		line 24 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
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
psect	text1176
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	24
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	27
	
l10829:	
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
	
l10831:	
;infrared.c: 29: return fullval;
	movf	(readDistance@fullval+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@fullval),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	l2977
	
l10833:	
	line	30
	
l2977:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_lcd_init
psect	text1177,local,class=CODE,delta=2
global __ptext1177
__ptext1177:

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
psect	text1177
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 2
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l10809:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l10811:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l10813:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l10815:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l10817:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l10819:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l10821:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l10823:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l10825:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l10827:	
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
psect	text1178,local,class=CODE,delta=2
global __ptext1178
__ptext1178:

;; *************** function _lcd_write_string *****************
;; Defined at:
;;		line 48 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               2    7[BANK0 ] PTR unsigned char 
;;		 -> STR_19(9), STR_18(16), STR_17(4), STR_16(8), 
;;		 -> STR_15(4), UpdateDisplay@adcOutput(16), STR_12(4), STR_11(4), 
;;		 -> STR_10(4), STR_9(4), STR_8(4), STR_7(4), 
;;		 -> STR_6(9), STR_5(9), STR_4(8), STR_3(9), 
;;		 -> STR_2(9), STR_1(9), 
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
psect	text1178
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 1
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
l10801:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	l10807
	
l1409:	
	
l10803:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
l10805:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
	goto	l10807
	
l1408:	
	
l10807:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_string@s+1),w
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u4451
	goto	u4450
u4451:
	goto	l10803
u4450:
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
psect	text1179,local,class=CODE,delta=2
global __ptext1179
__ptext1179:

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
psect	text1179
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
	
l10797:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
l10799:	
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
	global	_sprintf
psect	text1180,local,class=CODE,delta=2
global __ptext1180
__ptext1180:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> UpdateDisplay@adcOutput(16), 
;;  f               1   20[BANK0 ] PTR const unsigned char 
;;		 -> STR_14(15), STR_13(15), 
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
psect	text1180
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
	
l10739:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	l10791
	
l6742:	
	line	542
	
l10741:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u4371
	goto	u4370
u4371:
	goto	l6743
u4370:
	line	545
	
l10743:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l10745:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	l10791
	line	547
	
l6743:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	l10749
	line	640
	
l6745:	
	line	641
	goto	l10793
	line	700
	
l6747:	
	goto	l10751
	line	701
	
l6748:	
	line	702
	goto	l10751
	line	805
	
l6750:	
	line	816
	goto	l10791
	line	825
	
l10747:	
	goto	l10751
	line	638
	
l6744:	
	
l10749:	
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
	goto	l10793
	xorlw	100^0	; case 100
	skipnz
	goto	l10751
	xorlw	105^100	; case 105
	skipnz
	goto	l10751
	goto	l10791
	opt asmopt_on

	line	825
	
l6749:	
	line	1254
	
l10751:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
l10753:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
l10755:	
	btfss	(sprintf@_val+1),7
	goto	u4381
	goto	u4380
u4381:
	goto	l10761
u4380:
	line	1257
	
l10757:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
l10759:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	l10761
	line	1259
	
l6751:	
	line	1300
	
l10761:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
l10763:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u4391
	goto	u4390
u4391:
	goto	l10767
u4390:
	goto	l10775
	
l10765:	
	goto	l10775
	line	1301
	
l6752:	
	
l10767:	
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
	goto	u4405
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u4405:
	skipnc
	goto	u4401
	goto	u4400
u4401:
	goto	l10771
u4400:
	goto	l10775
	line	1302
	
l10769:	
	goto	l10775
	
l6754:	
	line	1300
	
l10771:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
l10773:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u4411
	goto	u4410
u4411:
	goto	l10767
u4410:
	goto	l10775
	
l6753:	
	line	1433
	
l10775:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u4421
	goto	u4420
u4421:
	goto	l10781
u4420:
	line	1434
	
l10777:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l10779:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l10781
	
l6755:	
	line	1467
	
l10781:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	l10789
	
l6757:	
	line	1484
	
l10783:	
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
	
l10785:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l10787:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l10789
	line	1517
	
l6756:	
	line	1469
	
l10789:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u4431
	goto	u4430
u4431:
	goto	l10783
u4430:
	goto	l10791
	
l6758:	
	goto	l10791
	line	1525
	
l6741:	
	line	540
	
l10791:	
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
	goto	u4441
	goto	u4440
u4441:
	goto	l10741
u4440:
	goto	l10793
	
l6759:	
	goto	l10793
	line	1527
	
l6746:	
	line	1530
	
l10793:	
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l6760
	line	1532
	
l10795:	
	line	1533
;	Return value of _sprintf is never used
	
l6760:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ADCconvert
psect	text1181,local,class=CODE,delta=2
global __ptext1181
__ptext1181:

;; *************** function _ADCconvert *****************
;; Defined at:
;;		line 33 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
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
psect	text1181
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	33
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [wreg+status,2+status,0+pclath+cstack]
	line	39
	
l10697:	
;infrared.c: 39: if (adcVal >= 213 && adcVal < 234)
	movlw	high(0D5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4231
	goto	u4230
u4231:
	goto	l10703
u4230:
	
l10699:	
	movlw	high(0EAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0EAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4241
	goto	u4240
u4241:
	goto	l10703
u4240:
	line	41
	
l10701:	
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
	goto	l2993
	line	43
	
l2980:	
	
l10703:	
;infrared.c: 43: else if (adcVal >= 170 && adcVal < 213)
	movlw	high(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4251
	goto	u4250
u4251:
	goto	l10709
u4250:
	
l10705:	
	movlw	high(0D5h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4261
	goto	u4260
u4261:
	goto	l10709
u4260:
	line	45
	
l10707:	
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
	goto	l2993
	line	47
	
l2982:	
	
l10709:	
;infrared.c: 47: else if (adcVal >= 128 && adcVal < 170)
	movlw	high(080h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4271
	goto	u4270
u4271:
	goto	l10715
u4270:
	
l10711:	
	movlw	high(0AAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4281
	goto	u4280
u4281:
	goto	l10715
u4280:
	line	49
	
l10713:	
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
	goto	l2993
	line	51
	
l2984:	
	
l10715:	
;infrared.c: 51: else if (adcVal >= 107 && adcVal < 128)
	movlw	high(06Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4291
	goto	u4290
u4291:
	goto	l10721
u4290:
	
l10717:	
	movlw	high(080h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4301
	goto	u4300
u4301:
	goto	l10721
u4300:
	line	53
	
l10719:	
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
	goto	l2993
	line	55
	
l2986:	
	
l10721:	
;infrared.c: 55: else if (adcVal >= 77 && adcVal < 107)
	movlw	high(04Dh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4311
	goto	u4310
u4311:
	goto	l10727
u4310:
	
l10723:	
	movlw	high(06Bh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4321
	goto	u4320
u4321:
	goto	l10727
u4320:
	line	57
	
l10725:	
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
	goto	l2993
	line	59
	
l2988:	
	
l10727:	
;infrared.c: 59: else if (adcVal >= 56 && adcVal < 77)
	movlw	high(038h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4331
	goto	u4330
u4331:
	goto	l10733
u4330:
	
l10729:	
	movlw	high(04Dh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4341
	goto	u4340
u4341:
	goto	l10733
u4340:
	line	61
	
l10731:	
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
	goto	l2993
	line	63
	
l2990:	
	
l10733:	
;infrared.c: 63: else if (adcVal >= 43 && adcVal < 56)
	movlw	high(02Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(02Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u4351
	goto	u4350
u4351:
	goto	l2993
u4350:
	
l10735:	
	movlw	high(038h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u4361
	goto	u4360
u4361:
	goto	l2993
u4360:
	line	65
	
l10737:	
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
	goto	l2993
	line	66
	
l2992:	
	goto	l2993
	line	67
	
l2991:	
	goto	l2993
	
l2989:	
	goto	l2993
	
l2987:	
	goto	l2993
	
l2985:	
	goto	l2993
	
l2983:	
	goto	l2993
	
l2981:	
	
l2993:	
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,88
	global	_robotTurn
psect	text1182,local,class=CODE,delta=2
global __ptext1182
__ptext1182:

;; *************** function _robotTurn *****************
;; Defined at:
;;		line 83 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1182
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	83
	global	__size_of_robotTurn
	__size_of_robotTurn	equ	__end_of_robotTurn-_robotTurn
	
_robotTurn:	
	opt	stack 3
; Regs used in _robotTurn: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	86
	
l10687:	
;robot.c: 86: turnlowByte = (unsigned char) (distance) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotTurn@distance),w
	movwf	(??_robotTurn+0)+0
	movf	(??_robotTurn+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_turnlowByte)^080h
	line	87
	
l10689:	
;robot.c: 87: turnhighByte = (unsigned char) (distance >> 8);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotTurn@distance+1),w
	movwf	(??_robotTurn+0)+0
	movf	(??_robotTurn+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_turnhighByte)^080h
	line	88
	
l10691:	
;robot.c: 88: if (distance >= 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(robotTurn@distance+1),7
	goto	u4221
	goto	u4220
u4221:
	goto	l10695
u4220:
	line	90
	
l10693:	
;robot.c: 89: {
;robot.c: 90: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	92
;robot.c: 92: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	94
;robot.c: 94: ser_putch(100);
	movlw	(064h)
	fcall	_ser_putch
	line	96
;robot.c: 96: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	98
;robot.c: 98: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	99
;robot.c: 99: }
	goto	l6731
	line	100
	
l6730:	
	line	102
	
l10695:	
;robot.c: 100: else
;robot.c: 101: {
;robot.c: 102: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	104
;robot.c: 104: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	106
;robot.c: 106: ser_putch(100);
	movlw	(064h)
	fcall	_ser_putch
	line	108
;robot.c: 108: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	110
;robot.c: 110: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	111
	
l6731:	
	line	112
;robot.c: 111: }
;robot.c: 112: ser_putch(157);
	movlw	(09Dh)
	fcall	_ser_putch
	line	114
;robot.c: 114: ser_putch(turnhighByte);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_turnhighByte)^080h,w
	fcall	_ser_putch
	line	116
;robot.c: 116: ser_putch(turnlowByte);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_turnlowByte)^080h,w
	fcall	_ser_putch
	line	118
;robot.c: 118: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	120
;robot.c: 120: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	122
;robot.c: 122: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	124
;robot.c: 124: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	126
;robot.c: 126: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	127
	
l6732:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurn
	__end_of_robotTurn:
;; =============== function _robotTurn ends ============

	signat	_robotTurn,4216
	global	_robotMove
psect	text1183,local,class=CODE,delta=2
global __ptext1183
__ptext1183:

;; *************** function _robotMove *****************
;; Defined at:
;;		line 33 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1183
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	33
	global	__size_of_robotMove
	__size_of_robotMove	equ	__end_of_robotMove-_robotMove
	
_robotMove:	
	opt	stack 3
; Regs used in _robotMove: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	34
	
l10677:	
;robot.c: 34: distTravelled =0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distTravelled)^080h	;volatile
	clrf	(_distTravelled+1)^080h	;volatile
	line	35
	
l10679:	
;robot.c: 35: lowByte = (unsigned char) (distance) ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotMove@distance),w
	movwf	(??_robotMove+0)+0
	movf	(??_robotMove+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_lowByte)^080h
	line	36
;robot.c: 36: highByte = (unsigned char) (distance >> 8);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(robotMove@distance+1),w
	movwf	(??_robotMove+0)+0
	movf	(??_robotMove+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_highByte)^080h
	line	37
	
l10681:	
;robot.c: 37: if (distance >= 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(robotMove@distance+1),7
	goto	u4211
	goto	u4210
u4211:
	goto	l10685
u4210:
	line	39
	
l10683:	
;robot.c: 38: {
;robot.c: 39: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	41
;robot.c: 41: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	43
;robot.c: 43: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	45
;robot.c: 45: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	47
;robot.c: 47: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	48
;robot.c: 48: }
	goto	l6726
	line	49
	
l6725:	
	line	51
	
l10685:	
;robot.c: 49: else
;robot.c: 50: {
;robot.c: 51: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	53
;robot.c: 53: ser_putch(0xff);
	movlw	(0FFh)
	fcall	_ser_putch
	line	55
;robot.c: 55: ser_putch(0x38);
	movlw	(038h)
	fcall	_ser_putch
	line	57
;robot.c: 57: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	59
;robot.c: 59: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	60
	
l6726:	
	line	64
;robot.c: 60: }
;robot.c: 64: ser_putch(156);
	movlw	(09Ch)
	fcall	_ser_putch
	line	66
;robot.c: 66: ser_putch(highByte);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_highByte)^080h,w
	fcall	_ser_putch
	line	68
;robot.c: 68: ser_putch(lowByte);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_lowByte)^080h,w
	fcall	_ser_putch
	line	70
;robot.c: 70: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	72
;robot.c: 72: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	74
;robot.c: 74: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	76
;robot.c: 76: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	78
;robot.c: 78: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	80
	
l6727:	
	return
	opt stack 0
GLOBAL	__end_of_robotMove
	__end_of_robotMove:
;; =============== function _robotMove ends ============

	signat	_robotMove,4216
	global	_rotate
psect	text1184,local,class=CODE,delta=2
global __ptext1184
__ptext1184:

;; *************** function _rotate *****************
;; Defined at:
;;		line 48 in file "E:\Aldnoah.Zero\Assignment3\steppermotor.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1184
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	48
	global	__size_of_rotate
	__size_of_rotate	equ	__end_of_rotate-_rotate
	
_rotate:	
	opt	stack 3
; Regs used in _rotate: [wreg+status,2+status,0+pclath+cstack]
	line	50
	
l10649:	
;steppermotor.c: 50: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	51
	
l10651:	
;steppermotor.c: 51: if (direction == 0)
	movf	(rotate@direction),f
	skipz
	goto	u4191
	goto	u4190
u4191:
	goto	l10655
u4190:
	line	52
	
l10653:	
;steppermotor.c: 52: spi_transfer(0b00001111);
	movlw	(0Fh)
	fcall	_spi_transfer
	goto	l10657
	line	53
	
l3694:	
	line	54
	
l10655:	
;steppermotor.c: 53: else
;steppermotor.c: 54: spi_transfer(0b00001101);
	movlw	(0Dh)
	fcall	_spi_transfer
	goto	l10657
	
l3695:	
	line	55
	
l10657:	
;steppermotor.c: 55: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l10659:	
	bcf	(57/8),(57)&7
	line	56
	
l10661:	
;steppermotor.c: 56: for (unsigned int i = 0; i < numsteps; i++)
	clrf	(rotate@i)
	clrf	(rotate@i+1)
	goto	l3696
	line	57
	
l3697:	
	line	58
;steppermotor.c: 57: {
;steppermotor.c: 58: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	nop
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	59
	
l10663:	
;steppermotor.c: 59: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
movwf	((??_rotate+0)+0+1),f
	movlw	101
movwf	((??_rotate+0)+0),f
u5017:
	decfsz	((??_rotate+0)+0),f
	goto	u5017
	decfsz	((??_rotate+0)+0+1),f
	goto	u5017
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
	
l3696:	
	movf	(rotate@numsteps+1),w
	subwf	(rotate@i+1),w
	skipz
	goto	u4205
	movf	(rotate@numsteps),w
	subwf	(rotate@i),w
u4205:
	skipc
	goto	u4201
	goto	u4200
u4201:
	goto	l3697
u4200:
	
l3698:	
	line	61
;steppermotor.c: 60: }
;steppermotor.c: 61: RC0 = 1; RC1 = 1;;
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	62
	
l10665:	
;steppermotor.c: 62: spi_transfer(0b00000000);
	movlw	(0)
	fcall	_spi_transfer
	line	63
	
l10667:	
;steppermotor.c: 63: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l10669:	
	bcf	(57/8),(57)&7
	line	64
	
l10671:	
;steppermotor.c: 64: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l10673:	
	nop
	
l10675:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	65
	
l3699:	
	return
	opt stack 0
GLOBAL	__end_of_rotate
	__end_of_rotate:
;; =============== function _rotate ends ============

	signat	_rotate,8312
	global	_robo_init
psect	text1185,local,class=CODE,delta=2
global __ptext1185
__ptext1185:

;; *************** function _robo_init *****************
;; Defined at:
;;		line 9 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1185
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	9
	global	__size_of_robo_init
	__size_of_robo_init	equ	__end_of_robo_init-_robo_init
	
_robo_init:	
	opt	stack 2
; Regs used in _robo_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	10
	
l10647:	
;robot.c: 10: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	11
;robot.c: 11: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	12
	
l6716:	
	return
	opt stack 0
GLOBAL	__end_of_robo_init
	__end_of_robo_init:
;; =============== function _robo_init ends ============

	signat	_robo_init,88
	global	_lcd_write_data
psect	text1186,local,class=CODE,delta=2
global __ptext1186
__ptext1186:

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
psect	text1186
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
	
l10639:	
;lcd.c: 31: RE2 = 0;
	bcf	(74/8),(74)&7
	line	32
;lcd.c: 32: RE1 = 0;
	bcf	(73/8),(73)&7
	line	33
;lcd.c: 33: RE0 = 1;
	bsf	(72/8),(72)&7
	line	34
	
l10641:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
l10643:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
l10645:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u5027:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u5027
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u5027
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
psect	text1187,local,class=CODE,delta=2
global __ptext1187
__ptext1187:

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
psect	text1187
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
	
l10631:	
;lcd.c: 19: RE2 = 0;
	bcf	(74/8),(74)&7
	line	20
;lcd.c: 20: RE1 = 0;
	bcf	(73/8),(73)&7
	line	21
;lcd.c: 21: RE0 = 0;
	bcf	(72/8),(72)&7
	line	22
	
l10633:	
;lcd.c: 22: PORTD = databyte;
	movf	(lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
l10635:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l10637:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??_lcd_write_control+0)+0),f
u5037:
	decfsz	((??_lcd_write_control+0)+0),f
	goto	u5037
	decfsz	((??_lcd_write_control+0)+0+1),f
	goto	u5037
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
psect	text1188,local,class=CODE,delta=2
global __ptext1188
__ptext1188:

;; *************** function _init_adc *****************
;; Defined at:
;;		line 46 in file "E:\Aldnoah.Zero\Assignment3\adc.c"
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
psect	text1188
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	46
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 3
; Regs used in _init_adc: [wreg+status,2]
	line	48
	
l10621:	
;adc.c: 48: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	49
	
l10623:	
;adc.c: 49: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	52
	
l10625:	
;adc.c: 52: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	53
	
l10627:	
;adc.c: 53: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	55
	
l10629:	
;adc.c: 55: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_init_adc+0)+0,f
u5047:
decfsz	(??_init_adc+0)+0,f
	goto	u5047
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
psect	text1189,local,class=CODE,delta=2
global __ptext1189
__ptext1189:

;; *************** function _adc_read_channel *****************
;; Defined at:
;;		line 5 in file "E:\Aldnoah.Zero\Assignment3\adc.c"
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
psect	text1189
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
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
	
l10605:	
;adc.c: 6: switch(channel)
	goto	l10613
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
	goto	l10615
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
	goto	l10615
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
	goto	l10615
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
	goto	l10615
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
	goto	l10615
	line	35
;adc.c: 35: default:
	
l696:	
	line	36
	
l10607:	
;adc.c: 36: return 0;
	movlw	(0)
	goto	l697
	
l10609:	
	goto	l697
	line	37
	
l10611:	
;adc.c: 37: }
	goto	l10615
	line	6
	
l689:	
	
l10613:	
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
	goto	l10607
	opt asmopt_on

	line	37
	
l691:	
	line	39
	
l10615:	
;adc.c: 39: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u5057:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u5057
opt asmopt_on

	line	41
	
l10617:	
;adc.c: 41: return adc_read();
	fcall	_adc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_adc_read)),w
	goto	l697
	
l10619:	
	line	43
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
psect	text1190,local,class=CODE,delta=2
global __ptext1190
__ptext1190:

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
psect	text1190
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l10549:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u4041
	goto	u4040
u4041:
	goto	l10553
u4040:
	line	10
	
l10551:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l10553
	line	12
	
l7651:	
	line	13
	
l10553:	
	btfss	(___awmod@divisor+1),7
	goto	u4051
	goto	u4050
u4051:
	goto	l10557
u4050:
	line	14
	
l10555:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l10557
	
l7652:	
	line	15
	
l10557:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u4061
	goto	u4060
u4061:
	goto	l10575
u4060:
	line	16
	
l10559:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l10565
	
l7655:	
	line	18
	
l10561:	
	movlw	01h
	
u4075:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u4075
	line	19
	
l10563:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l10565
	line	20
	
l7654:	
	line	17
	
l10565:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u4081
	goto	u4080
u4081:
	goto	l10561
u4080:
	goto	l10567
	
l7656:	
	goto	l10567
	line	21
	
l7657:	
	line	22
	
l10567:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u4095
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u4095:
	skipc
	goto	u4091
	goto	u4090
u4091:
	goto	l10571
u4090:
	line	23
	
l10569:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l10571
	
l7658:	
	line	24
	
l10571:	
	movlw	01h
	
u4105:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u4105
	line	25
	
l10573:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u4111
	goto	u4110
u4111:
	goto	l10567
u4110:
	goto	l10575
	
l7659:	
	goto	l10575
	line	26
	
l7653:	
	line	27
	
l10575:	
	movf	(___awmod@sign),w
	skipz
	goto	u4120
	goto	l10579
u4120:
	line	28
	
l10577:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l10579
	
l7660:	
	line	29
	
l10579:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l7661
	
l10581:	
	line	30
	
l7661:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___lwmod
psect	text1191,local,class=CODE,delta=2
global __ptext1191
__ptext1191:

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
psect	text1191
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l10527:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u3981
	goto	u3980
u3981:
	goto	l10545
u3980:
	line	9
	
l10529:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l10535
	
l7461:	
	line	11
	
l10531:	
	movlw	01h
	
u3995:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u3995
	line	12
	
l10533:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l10535
	line	13
	
l7460:	
	line	10
	
l10535:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u4001
	goto	u4000
u4001:
	goto	l10531
u4000:
	goto	l10537
	
l7462:	
	goto	l10537
	line	14
	
l7463:	
	line	15
	
l10537:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u4015
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u4015:
	skipc
	goto	u4011
	goto	u4010
u4011:
	goto	l10541
u4010:
	line	16
	
l10539:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l10541
	
l7464:	
	line	17
	
l10541:	
	movlw	01h
	
u4025:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u4025
	line	18
	
l10543:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u4031
	goto	u4030
u4031:
	goto	l10537
u4030:
	goto	l10545
	
l7465:	
	goto	l10545
	line	19
	
l7459:	
	line	20
	
l10545:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l7466
	
l10547:	
	line	21
	
l7466:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text1192,local,class=CODE,delta=2
global __ptext1192
__ptext1192:

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
psect	text1192
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l10501:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l10503:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u3911
	goto	u3910
u3911:
	goto	l10523
u3910:
	line	11
	
l10505:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l10511
	
l7451:	
	line	13
	
l10507:	
	movlw	01h
	
u3925:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u3925
	line	14
	
l10509:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l10511
	line	15
	
l7450:	
	line	12
	
l10511:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u3931
	goto	u3930
u3931:
	goto	l10507
u3930:
	goto	l10513
	
l7452:	
	goto	l10513
	line	16
	
l7453:	
	line	17
	
l10513:	
	movlw	01h
	
u3945:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u3945
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u3955
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u3955:
	skipc
	goto	u3951
	goto	u3950
u3951:
	goto	l10519
u3950:
	line	19
	
l10515:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l10517:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l10519
	line	21
	
l7454:	
	line	22
	
l10519:	
	movlw	01h
	
u3965:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u3965
	line	23
	
l10521:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u3971
	goto	u3970
u3971:
	goto	l10513
u3970:
	goto	l10523
	
l7455:	
	goto	l10523
	line	24
	
l7449:	
	line	25
	
l10523:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l7456
	
l10525:	
	line	26
	
l7456:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text1193,local,class=CODE,delta=2
global __ptext1193
__ptext1193:

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
;; This function uses a non-reentrant model
;;
psect	text1193
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 1
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l10489:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l10491
	line	6
	
l7443:	
	line	7
	
l10491:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u3871
	goto	u3870
u3871:
	goto	l7444
u3870:
	line	8
	
l10493:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l7444:	
	line	9
	movlw	01h
	
u3885:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u3885
	line	10
	
l10495:	
	movlw	01h
	
u3895:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u3895
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u3901
	goto	u3900
u3901:
	goto	l10491
u3900:
	goto	l10497
	
l7445:	
	line	12
	
l10497:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l7446
	
l10499:	
	line	13
	
l7446:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_spi_transfer
psect	text1194,local,class=CODE,delta=2
global __ptext1194
__ptext1194:

;; *************** function _spi_transfer *****************
;; Defined at:
;;		line 34 in file "E:\Aldnoah.Zero\Assignment3\steppermotor.c"
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
psect	text1194
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
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
	
l10309:	
;steppermotor.c: 35: unsigned char temp = 0;
	clrf	(spi_transfer@temp)
	line	37
;steppermotor.c: 37: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	38
	
l10311:	
;steppermotor.c: 38: SSPBUF = data;
	movf	(spi_transfer@data),w
	movwf	(19)	;volatile
	line	40
;steppermotor.c: 40: while (SSPIF == 0);
	goto	l3688
	
l3689:	
	
l3688:	
	btfss	(99/8),(99)&7
	goto	u3591
	goto	u3590
u3591:
	goto	l3688
u3590:
	goto	l10313
	
l3690:	
	line	41
	
l10313:	
;steppermotor.c: 41: temp = SSPBUF;
	movf	(19),w	;volatile
	movwf	(??_spi_transfer+0)+0
	movf	(??_spi_transfer+0)+0,w
	movwf	(spi_transfer@temp)
	line	42
	
l10315:	
;steppermotor.c: 42: SSPIF = 0;
	bcf	(99/8),(99)&7
	goto	l3691
	line	44
	
l10317:	
	line	45
;steppermotor.c: 44: return temp;
;	Return value of _spi_transfer is never used
	
l3691:	
	return
	opt stack 0
GLOBAL	__end_of_spi_transfer
	__end_of_spi_transfer:
;; =============== function _spi_transfer ends ============

	signat	_spi_transfer,4217
	global	_Menu
psect	text1195,local,class=CODE,delta=2
global __ptext1195
__ptext1195:

;; *************** function _Menu *****************
;; Defined at:
;;		line 180 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;  input           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  input           1    0[BANK0 ] unsigned char 
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
psect	text1195
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	180
	global	__size_of_Menu
	__size_of_Menu	equ	__end_of_Menu-_Menu
	
_Menu:	
	opt	stack 4
; Regs used in _Menu: [wreg-fsr0h+status,2+status,0]
;Menu@input stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(Menu@input)
	line	181
	
l10285:	
;HMI.c: 181: switch (input)
	goto	l10303
	line	183
;HMI.c: 182: {
;HMI.c: 183: case 1:
	
l5248:	
	line	185
;HMI.c: 185: break;
	goto	l10305
	line	186
;HMI.c: 186: case 2:
	
l5250:	
	line	188
;HMI.c: 188: break;
	goto	l10305
	line	189
;HMI.c: 189: case 3:
	
l5251:	
	line	190
	
l10287:	
;HMI.c: 190: pos--;
	movlw	low(-1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(-1)
	addwf	(_pos+1)^080h,f
	line	191
	
l10289:	
;HMI.c: 191: if (pos < 0)
	btfss	(_pos+1)^080h,7
	goto	u3571
	goto	u3570
u3571:
	goto	l10305
u3570:
	line	192
	
l10291:	
;HMI.c: 192: pos = 6 - 1;
	movlw	low(05h)
	movwf	(_pos)^080h
	movlw	high(05h)
	movwf	((_pos)^080h)+1
	goto	l10305
	
l5252:	
	line	194
;HMI.c: 194: break;
	goto	l10305
	line	195
;HMI.c: 195: case 4:
	
l5253:	
	line	196
	
l10293:	
;HMI.c: 196: pos++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(01h)
	addwf	(_pos+1)^080h,f
	line	197
;HMI.c: 197: if (pos == 6)
	movlw	06h
	xorwf	(_pos)^080h,w
	iorwf	(_pos+1)^080h,w
	skipz
	goto	u3581
	goto	u3580
u3581:
	goto	l10305
u3580:
	line	198
	
l10295:	
;HMI.c: 198: pos = 0;
	clrf	(_pos)^080h
	clrf	(_pos+1)^080h
	goto	l10305
	
l5254:	
	line	200
;HMI.c: 200: break;
	goto	l10305
	line	201
;HMI.c: 201: case 5:
	
l5255:	
	line	202
	
l10297:	
;HMI.c: 202: return pos;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	goto	l5256
	
l10299:	
	goto	l5256
	line	205
;HMI.c: 205: default:
	
l5257:	
	line	207
;HMI.c: 207: break;
	goto	l10305
	line	208
	
l10301:	
;HMI.c: 208: }
	goto	l10305
	line	181
	
l5247:	
	
l10303:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(Menu@input),w
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
	goto	l10305
	xorlw	2^1	; case 2
	skipnz
	goto	l10305
	xorlw	3^2	; case 3
	skipnz
	goto	l10287
	xorlw	4^3	; case 4
	skipnz
	goto	l10293
	xorlw	5^4	; case 5
	skipnz
	goto	l10297
	goto	l10305
	opt asmopt_on

	line	208
	
l5249:	
	line	209
	
l10305:	
;HMI.c: 209: return 255;
	movlw	(0FFh)
	goto	l5256
	
l10307:	
	line	210
	
l5256:	
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4217
	global	_ser_putch
psect	text1196,local,class=CODE,delta=2
global __ptext1196
__ptext1196:

;; *************** function _ser_putch *****************
;; Defined at:
;;		line 71 in file "E:\Aldnoah.Zero\Assignment3\ser.c"
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
;;		_robotMove
;;		_robotTurn
;;		_ser_puts
;;		_ser_puts2
;;		_ser_puthex
;;		_robot_read
;; This function uses a non-reentrant model
;;
psect	text1196
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	71
	global	__size_of_ser_putch
	__size_of_ser_putch	equ	__end_of_ser_putch-_ser_putch
	
_ser_putch:	
	opt	stack 3
; Regs used in _ser_putch: [wreg-fsr0h+status,2+status,0]
;ser_putch@c stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ser_putch@c)
	line	72
	
l10273:	
;ser.c: 72: while (((txiptr+1) & (16-1))==txoptr)
	goto	l10275
	
l4440:	
	line	73
;ser.c: 73: continue;
	goto	l10275
	
l4439:	
	line	72
	
l10275:	
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	xorwf	(_txoptr),w	;volatile
	skipnz
	goto	u3561
	goto	u3560
u3561:
	goto	l10275
u3560:
	
l4441:	
	line	74
;ser.c: 74: GIE=0;
	bcf	(95/8),(95)&7
	line	75
	
l10277:	
;ser.c: 75: txfifo[txiptr] = c;
	movf	(ser_putch@c),w
	movwf	(??_ser_putch+0)+0
	movf	(_txiptr),w
	addlw	_txfifo&0ffh
	movwf	fsr0
	movf	(??_ser_putch+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	76
	
l10279:	
;ser.c: 76: txiptr=(txiptr+1) & (16-1);
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_ser_putch+0)+0
	movf	(??_ser_putch+0)+0,w
	movwf	(_txiptr)	;volatile
	line	77
	
l10281:	
;ser.c: 77: TXIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1124/8)^080h,(1124)&7
	line	78
	
l10283:	
;ser.c: 78: GIE=1;
	bsf	(95/8),(95)&7
	line	79
	
l4442:	
	return
	opt stack 0
GLOBAL	__end_of_ser_putch
	__end_of_ser_putch:
;; =============== function _ser_putch ends ============

	signat	_ser_putch,4216
	global	_ser_init
psect	text1197,local,class=CODE,delta=2
global __ptext1197
__ptext1197:

;; *************** function _ser_init *****************
;; Defined at:
;;		line 114 in file "E:\Aldnoah.Zero\Assignment3\ser.c"
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
psect	text1197
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	114
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 3
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	115
	
l11169:	
;ser.c: 115: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	116
	
l11171:	
;ser.c: 116: TRISC &= 0b10111111;
	movlw	(0BFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ser_init+0)+0
	movf	(??_ser_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	(135)^080h,f	;volatile
	line	117
	
l11173:	
;ser.c: 117: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	119
	
l11175:	
;ser.c: 119: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	122
	
l11177:	
;ser.c: 122: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	123
	
l11179:	
;ser.c: 123: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	125
	
l11181:	
;ser.c: 125: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	126
	
l11183:	
;ser.c: 126: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	127
	
l11185:	
;ser.c: 127: CREN=1;
	bsf	(196/8),(196)&7
	line	128
	
l11187:	
;ser.c: 128: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	129
	
l11189:	
;ser.c: 129: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	130
	
l11191:	
;ser.c: 130: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	133
	
l11193:	
;ser.c: 133: rxiptr=rxoptr=txiptr=txoptr=0;
	movlw	(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_txoptr)	;volatile
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
	line	134
	
l4464:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_adc_read
psect	text1198,local,class=CODE,delta=2
global __ptext1198
__ptext1198:

;; *************** function _adc_read *****************
;; Defined at:
;;		line 61 in file "E:\Aldnoah.Zero\Assignment3\adc.c"
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
psect	text1198
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	64
	
l10123:	
;adc.c: 62: volatile unsigned int adc_value;
;adc.c: 64: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	66
	
l10125:	
;adc.c: 66: GO = 1;
	bsf	(250/8),(250)&7
	line	67
;adc.c: 67: while(GO) continue;
	goto	l703
	
l704:	
	
l703:	
	btfsc	(250/8),(250)&7
	goto	u3361
	goto	u3360
u3361:
	goto	l703
u3360:
	
l705:	
	line	68
# 68 "E:\Aldnoah.Zero\Assignment3\adc.c"
nop ;#
	line	69
# 69 "E:\Aldnoah.Zero\Assignment3\adc.c"
nop ;#
	line	70
# 70 "E:\Aldnoah.Zero\Assignment3\adc.c"
nop ;#
psect	text1198
	line	73
	
l10127:	
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
	
u3375:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u3375
	line	75
;adc.c: 75: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	78
	
l10129:	
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
	
l10131:	
	line	79
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
	global	_isr1
psect	text1199,local,class=CODE,delta=2
global __ptext1199
__ptext1199:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 93 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;      Temps:          6       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		i1___lwmod
;;		_ReadButtons
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1199
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	93
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
	movwf	(??_isr1+2)
	movf	fsr0,w
	movwf	(??_isr1+3)
	movf	pclath,w
	movwf	(??_isr1+4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_isr1+5)
	ljmp	_isr1
psect	text1199
	line	98
	
i1l11081:	
;Main.c: 98: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u458_21
	goto	u458_20
u458_21:
	goto	i1l11113
u458_20:
	line	100
	
i1l11083:	
;Main.c: 99: {
;Main.c: 100: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	101
	
i1l11085:	
;Main.c: 101: TMR0 = 100;
	movlw	(064h)
	movwf	(1)	;volatile
	line	103
;Main.c: 103: RTC_Counter++;
	movlw	low(01h)
	addwf	(_RTC_Counter),f	;volatile
	skipnc
	incf	(_RTC_Counter+1),f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1),f	;volatile
	line	105
	
i1l11087:	
;Main.c: 105: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	106
	
i1l11089:	
;Main.c: 106: if(RTC_Counter % 10 == 0)
	movlw	low(0Ah)
	movwf	(?i1___lwmod)
	movlw	high(0Ah)
	movwf	((?i1___lwmod))+1
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?i1___lwmod)+02h
	addwf	1+(?i1___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?i1___lwmod)+02h
	addwf	0+(?i1___lwmod)+02h

	fcall	i1___lwmod
	movf	((1+(?i1___lwmod))),w
	iorwf	((0+(?i1___lwmod))),w
	skipz
	goto	u459_21
	goto	u459_20
u459_21:
	goto	i1l11093
u459_20:
	line	108
	
i1l11091:	
;Main.c: 107: {
;Main.c: 108: RTC_FLAG_10MS = 1;
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l11093
	line	111
	
i1l2197:	
	line	112
	
i1l11093:	
;Main.c: 111: }
;Main.c: 112: if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
	movlw	low(032h)
	movwf	(?i1___lwmod)
	movlw	high(032h)
	movwf	((?i1___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?i1___lwmod)+02h
	addwf	1+(?i1___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?i1___lwmod)+02h
	addwf	0+(?i1___lwmod)+02h

	fcall	i1___lwmod
	movf	((1+(?i1___lwmod))),w
	iorwf	((0+(?i1___lwmod))),w
	skipz
	goto	u460_21
	goto	u460_20
u460_21:
	goto	i1l11097
u460_20:
	
i1l11095:	
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l11097
	
i1l2198:	
	line	113
	
i1l11097:	
;Main.c: 113: if(RTC_Counter % 250 == 0)
	movlw	low(0FAh)
	movwf	(?i1___lwmod)
	movlw	high(0FAh)
	movwf	((?i1___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?i1___lwmod)+02h
	addwf	1+(?i1___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?i1___lwmod)+02h
	addwf	0+(?i1___lwmod)+02h

	fcall	i1___lwmod
	movf	((1+(?i1___lwmod))),w
	iorwf	((0+(?i1___lwmod))),w
	skipz
	goto	u461_21
	goto	u461_20
u461_21:
	goto	i1l11101
u461_20:
	line	116
	
i1l11099:	
;Main.c: 114: {
;Main.c: 116: RTC_FLAG_250MS = 1;
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l11101
	line	118
	
i1l2199:	
	line	119
	
i1l11101:	
;Main.c: 118: }
;Main.c: 119: if(RTC_Counter % 500 == 0)
	movlw	low(01F4h)
	movwf	(?i1___lwmod)
	movlw	high(01F4h)
	movwf	((?i1___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?i1___lwmod)+02h
	addwf	1+(?i1___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?i1___lwmod)+02h
	addwf	0+(?i1___lwmod)+02h

	fcall	i1___lwmod
	movf	((1+(?i1___lwmod))),w
	iorwf	((0+(?i1___lwmod))),w
	skipz
	goto	u462_21
	goto	u462_20
u462_21:
	goto	i1l11109
u462_20:
	line	121
	
i1l11103:	
;Main.c: 120: {
;Main.c: 121: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	122
	
i1l11105:	
;Main.c: 122: RTC_Counter = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_RTC_Counter)	;volatile
	clrf	(_RTC_Counter+1)	;volatile
	line	123
	
i1l11107:	
;Main.c: 123: RB0 ^= 0x01;
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l11109
	line	125
	
i1l2200:	
	line	127
	
i1l11109:	
;Main.c: 125: }
;Main.c: 127: if (buttonPressed == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_buttonPressed),f
	skipz	;volatile
	goto	u463_21
	goto	u463_20
u463_21:
	goto	i1l11113
u463_20:
	line	129
	
i1l11111:	
;Main.c: 128: {
;Main.c: 129: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_buttonPressed)	;volatile
	goto	i1l11113
	line	130
	
i1l2201:	
	goto	i1l11113
	line	131
	
i1l2196:	
	line	134
	
i1l11113:	
;Main.c: 130: }
;Main.c: 131: }
;Main.c: 134: if (RCIF)
	btfss	(101/8),(101)&7
	goto	u464_21
	goto	u464_20
u464_21:
	goto	i1l11117
u464_20:
	line	138
	
i1l11115:	
;Main.c: 135: {
;Main.c: 138: DistHighByte = RCREG;
	movf	(26),w	;volatile
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_DistHighByte)^080h	;volatile
	line	140
;Main.c: 140: distTravelled = (int)DistHighByte ;
	movf	(_DistHighByte)^080h,w	;volatile
	movwf	(??_isr1+0)+0
	clrf	(??_isr1+0)+0+1
	movf	0+(??_isr1+0)+0,w
	movwf	(_distTravelled)^080h	;volatile
	movf	1+(??_isr1+0)+0,w
	movwf	(_distTravelled+1)^080h	;volatile
	goto	i1l11117
	line	146
	
i1l2202:	
	line	147
	
i1l11117:	
;Main.c: 146: }
;Main.c: 147: if (TXIF && TXIE)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(100/8),(100)&7
	goto	u465_21
	goto	u465_20
u465_21:
	goto	i1l2205
u465_20:
	
i1l11119:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u466_21
	goto	u466_20
u466_21:
	goto	i1l2205
u466_20:
	line	149
	
i1l11121:	
;Main.c: 148: {
;Main.c: 149: TXREG = txfifo[txoptr];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_txoptr),w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(25)	;volatile
	line	150
	
i1l11123:	
;Main.c: 150: ++txoptr;
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	addwf	(_txoptr),f	;volatile
	line	151
	
i1l11125:	
;Main.c: 151: txoptr &= (16-1);
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr),f	;volatile
	line	152
	
i1l11127:	
;Main.c: 152: if (txoptr==txiptr)
	movf	(_txoptr),w	;volatile
	xorwf	(_txiptr),w	;volatile
	skipz
	goto	u467_21
	goto	u467_20
u467_21:
	goto	i1l2205
u467_20:
	line	153
	
i1l11129:	
;Main.c: 153: TXIE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2205
	
i1l2204:	
	goto	i1l2205
	line	154
	
i1l2203:	
	line	155
	
i1l2205:	
	movf	(??_isr1+5),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	btemp+1
	movf	(??_isr1+4),w
	movwf	pclath
	movf	(??_isr1+3),w
	movwf	fsr0
	swapf	(??_isr1+2)^0FFFFFF80h,w
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
psect	text1200,local,class=CODE,delta=2
global __ptext1200
__ptext1200:

;; *************** function _ReadButtons *****************
;; Defined at:
;;		line 141 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
psect	text1200
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	141
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 0
; Regs used in _ReadButtons: [wreg+status,2+status,0+pclath+cstack]
	line	142
	
i1l11131:	
;HMI.c: 142: Debounce();
	fcall	_Debounce
	line	144
	
i1l11133:	
;HMI.c: 144: if(UpPressed)
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u468_21
	goto	u468_20
u468_21:
	goto	i1l5239
u468_20:
	line	146
	
i1l11135:	
;HMI.c: 145: {
;HMI.c: 146: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	147
	
i1l11137:	
;HMI.c: 147: return 1;
	movlw	(01h)
	goto	i1l5240
	
i1l11139:	
	goto	i1l5240
	line	149
	
i1l5239:	
	line	151
;HMI.c: 149: }
;HMI.c: 151: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u469_21
	goto	u469_20
u469_21:
	goto	i1l5241
u469_20:
	line	153
	
i1l11141:	
;HMI.c: 152: {
;HMI.c: 153: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	154
	
i1l11143:	
;HMI.c: 154: return 2;
	movlw	(02h)
	goto	i1l5240
	
i1l11145:	
	goto	i1l5240
	line	156
	
i1l5241:	
	line	157
;HMI.c: 156: }
;HMI.c: 157: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u470_21
	goto	u470_20
u470_21:
	goto	i1l5242
u470_20:
	line	159
	
i1l11147:	
;HMI.c: 158: {
;HMI.c: 159: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	160
	
i1l11149:	
;HMI.c: 160: return 3;
	movlw	(03h)
	goto	i1l5240
	
i1l11151:	
	goto	i1l5240
	line	162
	
i1l5242:	
	line	163
;HMI.c: 162: }
;HMI.c: 163: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u471_21
	goto	u471_20
u471_21:
	goto	i1l5243
u471_20:
	line	165
	
i1l11153:	
;HMI.c: 164: {
;HMI.c: 165: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	166
	
i1l11155:	
;HMI.c: 166: return 4;
	movlw	(04h)
	goto	i1l5240
	
i1l11157:	
	goto	i1l5240
	line	168
	
i1l5243:	
	line	170
;HMI.c: 168: }
;HMI.c: 170: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u472_21
	goto	u472_20
u472_21:
	goto	i1l11165
u472_20:
	line	172
	
i1l11159:	
;HMI.c: 171: {
;HMI.c: 172: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	173
	
i1l11161:	
;HMI.c: 173: return 5;
	movlw	(05h)
	goto	i1l5240
	
i1l11163:	
	goto	i1l5240
	line	175
	
i1l5244:	
	line	176
	
i1l11165:	
;HMI.c: 175: }
;HMI.c: 176: return 0;
	movlw	(0)
	goto	i1l5240
	
i1l11167:	
	line	177
	
i1l5240:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
	global	i1___lwmod
psect	text1201,local,class=CODE,delta=2
global __ptext1201
__ptext1201:

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
psect	text1201
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_ofi1___lwmod
	__size_ofi1___lwmod	equ	__end_ofi1___lwmod-i1___lwmod
	
i1___lwmod:	
	opt	stack 1
; Regs used in i1___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l11267:	
	movf	(i1___lwmod@divisor+1),w
	iorwf	(i1___lwmod@divisor),w
	skipnz
	goto	u491_21
	goto	u491_20
u491_21:
	goto	i1l11285
u491_20:
	line	9
	
i1l11269:	
	clrf	(i1___lwmod@counter)
	bsf	status,0
	rlf	(i1___lwmod@counter),f
	line	10
	goto	i1l11275
	
i1l7461:	
	line	11
	
i1l11271:	
	movlw	01h
	
u492_25:
	clrc
	rlf	(i1___lwmod@divisor),f
	rlf	(i1___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u492_25
	line	12
	
i1l11273:	
	movlw	(01h)
	movwf	(??i1___lwmod+0)+0
	movf	(??i1___lwmod+0)+0,w
	addwf	(i1___lwmod@counter),f
	goto	i1l11275
	line	13
	
i1l7460:	
	line	10
	
i1l11275:	
	btfss	(i1___lwmod@divisor+1),(15)&7
	goto	u493_21
	goto	u493_20
u493_21:
	goto	i1l11271
u493_20:
	goto	i1l11277
	
i1l7462:	
	goto	i1l11277
	line	14
	
i1l7463:	
	line	15
	
i1l11277:	
	movf	(i1___lwmod@divisor+1),w
	subwf	(i1___lwmod@dividend+1),w
	skipz
	goto	u494_25
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),w
u494_25:
	skipc
	goto	u494_21
	goto	u494_20
u494_21:
	goto	i1l11281
u494_20:
	line	16
	
i1l11279:	
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),f
	movf	(i1___lwmod@divisor+1),w
	skipc
	decf	(i1___lwmod@dividend+1),f
	subwf	(i1___lwmod@dividend+1),f
	goto	i1l11281
	
i1l7464:	
	line	17
	
i1l11281:	
	movlw	01h
	
u495_25:
	clrc
	rrf	(i1___lwmod@divisor+1),f
	rrf	(i1___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u495_25
	line	18
	
i1l11283:	
	movlw	low(01h)
	subwf	(i1___lwmod@counter),f
	btfss	status,2
	goto	u496_21
	goto	u496_20
u496_21:
	goto	i1l11277
u496_20:
	goto	i1l11285
	
i1l7465:	
	goto	i1l11285
	line	19
	
i1l7459:	
	line	20
	
i1l11285:	
	movf	(i1___lwmod@dividend+1),w
	clrf	(?i1___lwmod+1)
	addwf	(?i1___lwmod+1)
	movf	(i1___lwmod@dividend),w
	clrf	(?i1___lwmod)
	addwf	(?i1___lwmod)

	goto	i1l7466
	
i1l11287:	
	line	21
	
i1l7466:	
	return
	opt stack 0
GLOBAL	__end_ofi1___lwmod
	__end_ofi1___lwmod:
;; =============== function i1___lwmod ends ============

	signat	i1___lwmod,90
	global	_Debounce
psect	text1202,local,class=CODE,delta=2
global __ptext1202
__ptext1202:

;; *************** function _Debounce *****************
;; Defined at:
;;		line 61 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
psect	text1202
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	61
	global	__size_of_Debounce
	__size_of_Debounce	equ	__end_of_Debounce-_Debounce
	
_Debounce:	
	opt	stack 0
; Regs used in _Debounce: [wreg+status,2+status,0]
	line	63
	
i1l11225:	
;HMI.c: 63: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u476_21
	goto	u476_20
u476_21:
	goto	i1l5221
u476_20:
	line	65
	
i1l11227:	
;HMI.c: 64: {
;HMI.c: 65: UpDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_UpDebounceCount)^080h,f	;volatile
	line	66
	
i1l11229:	
;HMI.c: 66: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount)^080h,w	;volatile
	skipc
	goto	u477_21
	goto	u477_20
u477_21:
	goto	i1l5223
u477_20:
	
i1l11231:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u478_21
	goto	u478_20
u478_21:
	goto	i1l5223
u478_20:
	line	68
	
i1l11233:	
;HMI.c: 67: {
;HMI.c: 68: UpPressed = 1;
	bsf	(_UpPressed/8),(_UpPressed)&7
	line	69
;HMI.c: 69: UpReleased = 0;
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l5223
	line	70
	
i1l5222:	
	line	71
;HMI.c: 70: }
;HMI.c: 71: }
	goto	i1l5223
	line	72
	
i1l5221:	
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
	
i1l5223:	
	line	79
;HMI.c: 76: }
;HMI.c: 79: if(!RB3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(51/8),(51)&7
	goto	u479_21
	goto	u479_20
u479_21:
	goto	i1l5224
u479_20:
	line	81
	
i1l11235:	
;HMI.c: 80: {
;HMI.c: 81: DownDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_DownDebounceCount)^080h,f	;volatile
	line	82
	
i1l11237:	
;HMI.c: 82: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount)^080h,w	;volatile
	skipc
	goto	u480_21
	goto	u480_20
u480_21:
	goto	i1l5226
u480_20:
	
i1l11239:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u481_21
	goto	u481_20
u481_21:
	goto	i1l5226
u481_20:
	line	84
	
i1l11241:	
;HMI.c: 83: {
;HMI.c: 84: DownPressed = 1;
	bsf	(_DownPressed/8),(_DownPressed)&7
	line	85
;HMI.c: 85: DownReleased = 0;
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l5226
	line	86
	
i1l5225:	
	line	87
;HMI.c: 86: }
;HMI.c: 87: }
	goto	i1l5226
	line	88
	
i1l5224:	
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
	
i1l5226:	
	line	94
;HMI.c: 92: }
;HMI.c: 94: if(!RB4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(52/8),(52)&7
	goto	u482_21
	goto	u482_20
u482_21:
	goto	i1l5227
u482_20:
	line	96
	
i1l11243:	
;HMI.c: 95: {
;HMI.c: 96: LeftDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_LeftDebounceCount)^080h,f	;volatile
	line	97
	
i1l11245:	
;HMI.c: 97: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount)^080h,w	;volatile
	skipc
	goto	u483_21
	goto	u483_20
u483_21:
	goto	i1l5229
u483_20:
	
i1l11247:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u484_21
	goto	u484_20
u484_21:
	goto	i1l5229
u484_20:
	line	99
	
i1l11249:	
;HMI.c: 98: {
;HMI.c: 99: LeftPressed = 1;
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	line	100
;HMI.c: 100: LeftReleased = 0;
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l5229
	line	101
	
i1l5228:	
	line	102
;HMI.c: 101: }
;HMI.c: 102: }
	goto	i1l5229
	line	103
	
i1l5227:	
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
	
i1l5229:	
	line	109
;HMI.c: 107: }
;HMI.c: 109: if(!RB5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u485_21
	goto	u485_20
u485_21:
	goto	i1l5230
u485_20:
	line	111
	
i1l11251:	
;HMI.c: 110: {
;HMI.c: 111: RightDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RightDebounceCount)^080h,f	;volatile
	line	112
	
i1l11253:	
;HMI.c: 112: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount)^080h,w	;volatile
	skipc
	goto	u486_21
	goto	u486_20
u486_21:
	goto	i1l5232
u486_20:
	
i1l11255:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u487_21
	goto	u487_20
u487_21:
	goto	i1l5232
u487_20:
	line	114
	
i1l11257:	
;HMI.c: 113: {
;HMI.c: 114: RightPressed = 1;
	bsf	(_RightPressed/8),(_RightPressed)&7
	line	115
;HMI.c: 115: RightReleased = 0;
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l5232
	line	116
	
i1l5231:	
	line	117
;HMI.c: 116: }
;HMI.c: 117: }
	goto	i1l5232
	line	118
	
i1l5230:	
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
	
i1l5232:	
	line	124
;HMI.c: 122: }
;HMI.c: 124: if(!RB6)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u488_21
	goto	u488_20
u488_21:
	goto	i1l5233
u488_20:
	line	126
	
i1l11259:	
;HMI.c: 125: {
;HMI.c: 126: CenterDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_CenterDebounceCount)^080h,f	;volatile
	line	127
	
i1l11261:	
;HMI.c: 127: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount)^080h,w	;volatile
	skipc
	goto	u489_21
	goto	u489_20
u489_21:
	goto	i1l5236
u489_20:
	
i1l11263:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u490_21
	goto	u490_20
u490_21:
	goto	i1l5236
u490_20:
	line	129
	
i1l11265:	
;HMI.c: 128: {
;HMI.c: 129: CenterPressed = 1;
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	line	130
;HMI.c: 130: CenterReleased = 0;
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l5236
	line	131
	
i1l5234:	
	line	132
;HMI.c: 131: }
;HMI.c: 132: }
	goto	i1l5236
	line	133
	
i1l5233:	
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
	goto	i1l5236
	line	137
	
i1l5235:	
	line	138
	
i1l5236:	
	return
	opt stack 0
GLOBAL	__end_of_Debounce
	__end_of_Debounce:
;; =============== function _Debounce ends ============

	signat	_Debounce,88
psect	text1203,local,class=CODE,delta=2
global __ptext1203
__ptext1203:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
