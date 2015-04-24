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
# 35 "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 35 "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	dw 0xFFFE & 0xFFFB & 0xFFFF & 0xFFBF & 0xFFF7 & 0xFFFF & 0xFF7F & 0xFFFF ;#
	FNCALL	_main,_init
	FNCALL	_main,_Menu
	FNCALL	_main,_calibrateIR
	FNCALL	_main,_rotate
	FNCALL	_main,_robotMove
	FNCALL	_main,_robotTurn
	FNCALL	_init,_init_adc
	FNCALL	_init,_lcd_init
	FNCALL	_init,_ser_init
	FNCALL	_init,_robo_init
	FNCALL	_calibrateIR,_rotate
	FNCALL	_lcd_init,_lcd_write_control
	FNCALL	_robotTurn,_ser_putch
	FNCALL	_robotMove,_ser_putch
	FNCALL	_rotate,_spi_transfer
	FNCALL	_robo_init,_ser_putch
	FNROOT	_main
	FNCALL	_isr1,___lwmod
	FNCALL	_isr1,_readAvgDistance
	FNCALL	_isr1,_UpdateDisplay
	FNCALL	_isr1,_ReadButtons
	FNCALL	_UpdateDisplay,i1_lcd_write_control
	FNCALL	_UpdateDisplay,_sprintf
	FNCALL	_UpdateDisplay,_lcd_set_cursor
	FNCALL	_UpdateDisplay,_lcd_write_string
	FNCALL	_UpdateDisplay,___awmod
	FNCALL	_readAvgDistance,_readDistance
	FNCALL	_readAvgDistance,___lwdiv
	FNCALL	_readAvgDistance,_ADCconvert
	FNCALL	_readDistance,_adc_read_channel
	FNCALL	_lcd_write_string,_lcd_write_data
	FNCALL	_lcd_set_cursor,i1_lcd_write_control
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_ADCconvert,___wmul
	FNCALL	_ADCconvert,___lwdiv
	FNCALL	_ReadButtons,_Debounce
	FNCALL	_adc_read_channel,_adc_read
	FNCALL	intlevel1,_isr1
	global	intlevel1
	FNROOT	intlevel1
	global	_current_step
	global	_menuStrings
	global	_shortMenuStrings
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"H:\Aldnoah.Zero\trunk\Assignment3\steppermotor.c"
	line	30

;initializer for _current_step
	retlw	03Ch
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	32

;initializer for _menuStrings
	retlw	(STR_1-__stringbase)&0ffh
	retlw	(STR_2-__stringbase)&0ffh
	retlw	(STR_3-__stringbase)&0ffh
	retlw	(STR_4-__stringbase)&0ffh
	retlw	(STR_5-__stringbase)&0ffh
	line	33

;initializer for _shortMenuStrings
	retlw	(STR_6-__stringbase)&0ffh
	retlw	(STR_7-__stringbase)&0ffh
	retlw	(STR_8-__stringbase)&0ffh
	retlw	(STR_9-__stringbase)&0ffh
	retlw	(STR_10-__stringbase)&0ffh
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
	global	_RTC_Counter
	global	_adcVal
	global	_dist_high
	global	_dist_low
	global	_pos
	global	_total
	global	_CenterDebounceCount
	global	_DownDebounceCount
	global	_LeftDebounceCount
	global	_RightDebounceCount
	global	_UpDebounceCount
	global	_buttonPressed
	global	_currentMenu
	global	_current_direction
	global	_highByte
	global	_lowByte
	global	_rxiptr
	global	_rxoptr
	global	_ser_tmp
	global	_serialInput
	global	_txiptr
	global	_txoptr
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
	global	UpdateDisplay@F1222
	global	_rxfifo
	global	_txfifo
	global	_distance
	global	_totalSteps
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
	
STR_11:	
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
	
STR_14:	
	retlw	67	;'C'
	retlw	79	;'O'
	retlw	78	;'N'
	retlw	70	;'F'
	retlw	73	;'I'
	retlw	82	;'R'
	retlw	77	;'M'
	retlw	0
psect	strings
	
STR_8:	
	retlw	68	;'D'
	retlw	114	;'r'
	retlw	50	;'2'
	retlw	0
psect	strings
	
STR_13:	
	retlw	60	;'<'
	retlw	60	;'<'
	retlw	60	;'<'
	retlw	0
psect	strings
	
STR_15:	
	retlw	62	;'>'
	retlw	62	;'>'
	retlw	62	;'>'
	retlw	0
psect	strings
	
STR_9:	
	retlw	68	;'D'
	retlw	114	;'r'
	retlw	76	;'L'
	retlw	0
psect	strings
	
STR_6:	
	retlw	67	;'C'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	0
psect	strings
	
STR_7:	
	retlw	83	;'S'
	retlw	99	;'c'
	retlw	110	;'n'
	retlw	0
psect	strings
	
STR_10:	
	retlw	70	;'F'
	retlw	108	;'l'
	retlw	119	;'w'
	retlw	0
psect	strings
STR_12	equ	STR_11+0
	file	"Assignment3_AldnoahZero.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssBANK0,class=BANK0,bit,space=1
global __pbitbssBANK0
__pbitbssBANK0:
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

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_RTC_Counter:
       ds      2

_adcVal:
       ds      2

_dist_high:
       ds      2

_dist_low:
       ds      2

_pos:
       ds      2

_total:
       ds      2

_CenterDebounceCount:
       ds      1

_DownDebounceCount:
       ds      1

_LeftDebounceCount:
       ds      1

_RightDebounceCount:
       ds      1

_UpDebounceCount:
       ds      1

_buttonPressed:
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

_txiptr:
       ds      1

_txoptr:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"H:\Aldnoah.Zero\trunk\Assignment3\steppermotor.c"
	line	30
_current_step:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
UpdateDisplay@F1222:
       ds      16

_rxfifo:
       ds      16

_txfifo:
       ds      16

_distance:
       ds      2

_totalSteps:
       ds      2

_turnhighByte:
       ds      1

_turnlowByte:
       ds      1

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	32
_menuStrings:
       ds      5

psect	dataBANK1
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	33
_shortMenuStrings:
       ds      5

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

; Clear objects allocated to BITBANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssBANK0/8)+0)&07Fh
	clrf	((__pbitbssBANK0/8)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+01Ch)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+036h)
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
	movlw low(__pdataBANK1+10)
	movwf btemp-1,f
	movlw high(__pidataBANK1)
	movwf btemp,f
	movlw low(__pidataBANK1)
	movwf btemp+1,f
	movlw low(__pdataBANK1)
	movwf fsr,f
	fcall init_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	??_ser_init
??_ser_init:	; 0 bytes @ 0x0
	global	??_Menu
??_Menu:	; 0 bytes @ 0x0
	global	??_init_adc
??_init_adc:	; 0 bytes @ 0x0
	global	??_lcd_write_control
??_lcd_write_control:	; 0 bytes @ 0x0
	global	??_spi_transfer
??_spi_transfer:	; 0 bytes @ 0x0
	global	??_ser_putch
??_ser_putch:	; 0 bytes @ 0x0
	global	Menu@input
Menu@input:	; 1 bytes @ 0x0
	ds	1
	global	spi_transfer@temp
spi_transfer@temp:	; 1 bytes @ 0x1
	global	ser_putch@c
ser_putch@c:	; 1 bytes @ 0x1
	ds	1
	global	??_robo_init
??_robo_init:	; 0 bytes @ 0x2
	global	?_robotMove
?_robotMove:	; 0 bytes @ 0x2
	global	?_robotTurn
?_robotTurn:	; 0 bytes @ 0x2
	global	lcd_write_control@databyte
lcd_write_control@databyte:	; 1 bytes @ 0x2
	global	spi_transfer@data
spi_transfer@data:	; 1 bytes @ 0x2
	global	robotMove@distance
robotMove@distance:	; 2 bytes @ 0x2
	global	robotTurn@distance
robotTurn@distance:	; 2 bytes @ 0x2
	ds	1
	global	?_rotate
?_rotate:	; 0 bytes @ 0x3
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	??_init
??_init:	; 0 bytes @ 0x3
	global	rotate@direction
rotate@direction:	; 1 bytes @ 0x3
	ds	1
	global	??_rotate
??_rotate:	; 0 bytes @ 0x4
	global	??_robotMove
??_robotMove:	; 0 bytes @ 0x4
	global	??_robotTurn
??_robotTurn:	; 0 bytes @ 0x4
	ds	2
	global	rotate@steps
rotate@steps:	; 1 bytes @ 0x6
	ds	1
	global	rotate@i
rotate@i:	; 1 bytes @ 0x7
	ds	1
	global	??_calibrateIR
??_calibrateIR:	; 0 bytes @ 0x8
	global	??_main
??_main:	; 0 bytes @ 0x8
	ds	3
	global	main@choice
main@choice:	; 1 bytes @ 0xB
	ds	1
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_readAvgDistance
?_readAvgDistance:	; 0 bytes @ 0x0
	global	?_UpdateDisplay
?_UpdateDisplay:	; 0 bytes @ 0x0
	global	?_ser_init
?_ser_init:	; 0 bytes @ 0x0
	global	?_robo_init
?_robo_init:	; 0 bytes @ 0x0
	global	?_ADCconvert
?_ADCconvert:	; 0 bytes @ 0x0
	global	?_init_adc
?_init_adc:	; 0 bytes @ 0x0
	global	?_lcd_write_control
?_lcd_write_control:	; 0 bytes @ 0x0
	global	?_lcd_write_data
?_lcd_write_data:	; 0 bytes @ 0x0
	global	??_lcd_write_data
??_lcd_write_data:	; 0 bytes @ 0x0
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
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_ser_putch
?_ser_putch:	; 0 bytes @ 0x0
	global	?_Debounce
?_Debounce:	; 0 bytes @ 0x0
	global	??_Debounce
??_Debounce:	; 0 bytes @ 0x0
	global	?i1_lcd_write_control
?i1_lcd_write_control:	; 0 bytes @ 0x0
	global	??i1_lcd_write_control
??i1_lcd_write_control:	; 0 bytes @ 0x0
	global	?_ReadButtons
?_ReadButtons:	; 1 bytes @ 0x0
	global	?_Menu
?_Menu:	; 1 bytes @ 0x0
	global	?_adc_read_channel
?_adc_read_channel:	; 1 bytes @ 0x0
	global	?_spi_transfer
?_spi_transfer:	; 1 bytes @ 0x0
	global	?_adc_read
?_adc_read:	; 2 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	UpdateDisplay@serialInput
UpdateDisplay@serialInput:	; 1 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_ReadButtons
??_ReadButtons:	; 0 bytes @ 0x1
	ds	1
	global	??_adc_read
??_adc_read:	; 0 bytes @ 0x2
	global	lcd_write_data@databyte
lcd_write_data@databyte:	; 1 bytes @ 0x2
	global	i1lcd_write_control@databyte
i1lcd_write_control@databyte:	; 1 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_lcd_set_cursor
??_lcd_set_cursor:	; 0 bytes @ 0x3
	global	lcd_set_cursor@address
lcd_set_cursor@address:	; 1 bytes @ 0x3
	ds	1
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	adc_read@adc_value
adc_read@adc_value:	; 2 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	1
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
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
	global	??_readAvgDistance
??_readAvgDistance:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_ADCconvert
??_ADCconvert:	; 0 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	readAvgDistance@fullval
readAvgDistance@fullval:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	readAvgDistance@i
readAvgDistance@i:	; 2 bytes @ 0x4
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x6
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0x6
	ds	5
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0xB
	ds	3
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0xE
	ds	1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0xF
	ds	1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x10
	ds	1
	global	sprintf@_val
sprintf@_val:	; 4 bytes @ 0x11
	ds	4
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0x15
	ds	1
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x16
	ds	1
	global	??_UpdateDisplay
??_UpdateDisplay:	; 0 bytes @ 0x17
	ds	5
	global	UpdateDisplay@adcOutput
UpdateDisplay@adcOutput:	; 16 bytes @ 0x1C
	ds	16
	global	??_isr1
??_isr1:	; 0 bytes @ 0x2C
	ds	5
;;Data sizes: Strings 95, constant 10, data 11, bss 82, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     49      80
;; BANK1           80     12      76
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

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
;; sprintf@f	PTR const unsigned char  size(1) Largest target is 15
;;		 -> STR_12(CODE[15]), STR_11(CODE[15]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;;		 -> UpdateDisplay@adcOutput(BANK0[16]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK0[2]), 
;;
;; S8107$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; shortMenuStrings	PTR const unsigned char [5] size(1) Largest target is 4
;;		 -> STR_10(CODE[4]), STR_9(CODE[4]), STR_8(CODE[4]), STR_7(CODE[4]), 
;;		 -> STR_6(CODE[4]), 
;;
;; menuStrings	PTR const unsigned char [5] size(1) Largest target is 9
;;		 -> STR_5(CODE[9]), STR_4(CODE[8]), STR_3(CODE[9]), STR_2(CODE[9]), 
;;		 -> STR_1(CODE[9]), 
;;
;; lcd_write_string@s	PTR unsigned char  size(2) Largest target is 16
;;		 -> STR_15(CODE[4]), STR_14(CODE[8]), STR_13(CODE[4]), UpdateDisplay@adcOutput(BANK0[16]), 
;;		 -> STR_10(CODE[4]), STR_9(CODE[4]), STR_8(CODE[4]), STR_7(CODE[4]), 
;;		 -> STR_6(CODE[4]), STR_5(CODE[9]), STR_4(CODE[8]), STR_3(CODE[9]), 
;;		 -> STR_2(CODE[9]), STR_1(CODE[9]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr1 in COMMON
;;
;;   _readAvgDistance->_readDistance
;;   _readAvgDistance->___lwdiv
;;   _readDistance->_adc_read_channel
;;   _lcd_write_string->___awmod
;;   _lcd_set_cursor->i1_lcd_write_control
;;   _sprintf->___lwdiv
;;   _ADCconvert->___lwdiv
;;   _ReadButtons->_Debounce
;;   _adc_read_channel->_adc_read
;;   ___lwmod->___lwdiv
;;   ___lwdiv->___wmul
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _isr1 in BANK0
;;
;;   _isr1->_UpdateDisplay
;;   _UpdateDisplay->_sprintf
;;   _readAvgDistance->_ADCconvert
;;   _sprintf->___lwmod
;;
;; Critical Paths under _main in BANK1
;;
;;   _main->_rotate
;;   _calibrateIR->_rotate
;;   _lcd_init->_lcd_write_control
;;   _robotTurn->_ser_putch
;;   _robotMove->_ser_putch
;;   _rotate->_spi_transfer
;;   _robo_init->_ser_putch
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
;; (0) _main                                                 4     4      0     463
;;                                              8 BANK1      4     4      0
;;                               _init
;;                               _Menu
;;                        _calibrateIR
;;                             _rotate
;;                          _robotMove
;;                          _robotTurn
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 1     1      0      44
;;                                              3 BANK1      1     1      0
;;                           _init_adc
;;                           _lcd_init
;;                           _ser_init
;;                          _robo_init
;; ---------------------------------------------------------------------------------
;; (1) _calibrateIR                                          0     0      0      98
;;                             _rotate
;; ---------------------------------------------------------------------------------
;; (2) _lcd_init                                             0     0      0      22
;;                  _lcd_write_control
;; ---------------------------------------------------------------------------------
;; (1) _robotTurn                                            3     1      2      88
;;                                              2 BANK1      3     1      2
;;                          _ser_putch
;; ---------------------------------------------------------------------------------
;; (1) _robotMove                                            3     1      2      88
;;                                              2 BANK1      3     1      2
;;                          _ser_putch
;; ---------------------------------------------------------------------------------
;; (1) _rotate                                               5     4      1      98
;;                                              3 BANK1      5     4      1
;;                       _spi_transfer
;; ---------------------------------------------------------------------------------
;; (2) _robo_init                                            0     0      0      22
;;                          _ser_putch
;; ---------------------------------------------------------------------------------
;; (3) _lcd_write_control                                    3     3      0      22
;;                                              0 BANK1      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _init_adc                                             1     1      0       0
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _ser_putch                                            2     2      0      22
;;                                              0 BANK1      2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _spi_transfer                                         3     3      0      30
;;                                              0 BANK1      3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _Menu                                                 1     1      0      22
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _ser_init                                             1     1      0       0
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _isr1                                                 5     5      0    2143
;;                                             44 BANK0      5     5      0
;;                            ___lwmod
;;                    _readAvgDistance
;;                      _UpdateDisplay
;;                        _ReadButtons
;; ---------------------------------------------------------------------------------
;; (5) _UpdateDisplay                                       22    22      0    1429
;;                                             23 BANK0     21    21      0
;;                i1_lcd_write_control
;;                            _sprintf
;;                     _lcd_set_cursor
;;                   _lcd_write_string
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (5) _readAvgDistance                                      4     4      0     555
;;                                              2 BANK0      4     4      0
;;                       _readDistance
;;                            ___lwdiv
;;                         _ADCconvert
;; ---------------------------------------------------------------------------------
;; (6) _readDistance                                         6     4      2      69
;;                                              8 COMMON     6     4      2
;;                   _adc_read_channel
;; ---------------------------------------------------------------------------------
;; (6) _lcd_write_string                                     2     0      2      67
;;                                              7 COMMON     2     0      2
;;                     _lcd_write_data
;;                            ___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (6) _lcd_set_cursor                                       1     1      0      96
;;                                              3 COMMON     1     1      0
;;                i1_lcd_write_control
;; ---------------------------------------------------------------------------------
;; (7) i1_lcd_write_control                                  3     3      0      73
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (6) _sprintf                                             17    12      5     798
;;                                              6 BANK0     17    12      5
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (6) _ADCconvert                                           2     2      0     254
;;                                              0 BANK0      2     2      0
;;                             ___wmul
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (5) _ReadButtons                                          0     0      0       0
;;                           _Debounce
;; ---------------------------------------------------------------------------------
;; (7) _lcd_write_data                                       3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (7) _adc_read_channel                                     2     2      0      46
;;                                              6 COMMON     2     2      0
;;                           _adc_read
;; ---------------------------------------------------------------------------------
;; (6) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (7) ___lwmod                                              6     2      4     159
;;                                              0 BANK0      6     2      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (7) ___lwdiv                                              8     4      4     162
;;                                              6 COMMON     8     4      4
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (7) ___wmul                                               6     2      4      92
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (6) _Debounce                                             1     1      0       0
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (8) _adc_read                                             6     4      2      24
;;                                              0 COMMON     6     4      2
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
;;   _Menu
;;   _calibrateIR
;;     _rotate
;;       _spi_transfer
;;   _rotate
;;     _spi_transfer
;;   _robotMove
;;     _ser_putch
;;   _robotTurn
;;     _ser_putch
;;
;; _isr1 (ROOT)
;;   ___lwmod
;;     ___lwdiv (ARG)
;;       ___wmul (ARG)
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
;;     i1_lcd_write_control
;;     _sprintf
;;       ___lwdiv
;;         ___wmul (ARG)
;;       ___lwmod
;;         ___lwdiv (ARG)
;;           ___wmul (ARG)
;;     _lcd_set_cursor
;;       i1_lcd_write_control
;;     _lcd_write_string
;;       _lcd_write_data
;;       ___awmod (ARG)
;;     ___awmod
;;   _ReadButtons
;;     _Debounce
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      C      4C       7       95.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      B7      12        0.0%
;;ABS                  0      0      AA       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       D       2        0.0%
;;BANK0               50     31      50       5      100.0%
;;BITBANK0            50      0       2       4        2.5%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 202 in file "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  choice          1   11[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       3       0       0
;;      Totals:         0       0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_init
;;		_Menu
;;		_calibrateIR
;;		_rotate
;;		_robotMove
;;		_robotTurn
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	line	202
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	207
	
l10803:	
;Main.c: 207: init();
	fcall	_init
	goto	l10805
	line	213
;Main.c: 213: while(1)
	
l2222:	
	line	215
	
l10805:	
;Main.c: 214: {
;Main.c: 215: unsigned char choice = 255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	line	216
	
l10807:	
;Main.c: 216: currentMenu = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_currentMenu)
	line	217
;Main.c: 217: switch (buttonPressed)
	goto	l10831
	line	219
;Main.c: 218: {
;Main.c: 219: case 1:
	
l2224:	
	line	220
	
l10809:	
;Main.c: 220: Menu(1);
	movlw	(01h)
	fcall	_Menu
	line	222
	
l10811:	
;Main.c: 222: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	224
;Main.c: 224: break;
	goto	l10851
	line	225
;Main.c: 225: case 2:
	
l2226:	
	line	226
	
l10813:	
;Main.c: 226: Menu(2);
	movlw	(02h)
	fcall	_Menu
	line	228
	
l10815:	
;Main.c: 228: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	230
;Main.c: 230: break;
	goto	l10851
	line	231
;Main.c: 231: case 3:
	
l2227:	
	line	232
	
l10817:	
;Main.c: 232: Menu(3);
	movlw	(03h)
	fcall	_Menu
	line	234
	
l10819:	
;Main.c: 234: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	236
;Main.c: 236: break;
	goto	l10851
	line	237
;Main.c: 237: case 4:
	
l2228:	
	line	238
	
l10821:	
;Main.c: 238: Menu(4);
	movlw	(04h)
	fcall	_Menu
	line	240
	
l10823:	
;Main.c: 240: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	242
;Main.c: 242: break;
	goto	l10851
	line	243
;Main.c: 243: case 5:
	
l2229:	
	line	244
	
l10825:	
;Main.c: 244: choice = Menu(5);
	movlw	(05h)
	fcall	_Menu
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	line	246
	
l10827:	
;Main.c: 246: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	248
;Main.c: 248: break;
	goto	l10851
	line	249
;Main.c: 249: default:
	
l2230:	
	line	251
;Main.c: 251: break;
	goto	l10851
	line	252
	
l10829:	
;Main.c: 252: }
	goto	l10851
	line	217
	
l2223:	
	
l10831:	
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
	goto	l10809
	xorlw	2^1	; case 2
	skipnz
	goto	l10813
	xorlw	3^2	; case 3
	skipnz
	goto	l10817
	xorlw	4^3	; case 4
	skipnz
	goto	l10821
	xorlw	5^4	; case 5
	skipnz
	goto	l10825
	goto	l10851
	opt asmopt_on

	line	252
	
l2225:	
	line	255
;Main.c: 255: switch (choice)
	goto	l10851
	line	257
;Main.c: 256: {
;Main.c: 257: case 0:
	
l2232:	
	line	258
	
l10833:	
;Main.c: 258: calibrateIR();
	fcall	_calibrateIR
	line	259
;Main.c: 259: break;
	goto	l10853
	line	260
;Main.c: 260: case 1:
	
l2234:	
	line	261
	
l10835:	
;Main.c: 261: rotate(100, 1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotate)^080h
	bsf	status,0
	rlf	(?_rotate)^080h,f
	movlw	(064h)
	fcall	_rotate
	line	263
;Main.c: 263: break;
	goto	l10853
	line	264
;Main.c: 264: case 2:
	
l2235:	
	line	265
	
l10837:	
;Main.c: 265: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4307:
	decfsz	((??_main+0)^080h+0),f
	goto	u4307
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4307
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4307
	nop2
opt asmopt_on

	line	266
	
l10839:	
;Main.c: 266: robotMove(2000);
	movlw	low(07D0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(07D0h)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	269
;Main.c: 269: break;
	goto	l10853
	line	270
;Main.c: 270: case 3:
	
l2236:	
	line	271
	
l10841:	
;Main.c: 271: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4317:
	decfsz	((??_main+0)^080h+0),f
	goto	u4317
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4317
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4317
	nop2
opt asmopt_on

	line	272
	
l10843:	
;Main.c: 272: robotMove(1000);
	movlw	low(03E8h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(03E8h)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	273
	
l10845:	
;Main.c: 273: robotTurn(-90);
	movlw	low(-90)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotTurn)^080h
	movlw	high(-90)
	movwf	((?_robotTurn)^080h)+1
	fcall	_robotTurn
	line	274
	
l10847:	
;Main.c: 274: robotMove(1000);
	movlw	low(03E8h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(03E8h)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	275
;Main.c: 275: break;
	goto	l10853
	line	276
;Main.c: 276: case 4:
	
l2237:	
	line	278
;Main.c: 278: break;
	goto	l10853
	line	281
;Main.c: 281: default:
	
l2238:	
	line	283
;Main.c: 283: break;
	goto	l10853
	line	284
	
l10849:	
;Main.c: 284: }
	goto	l10853
	line	255
	
l2231:	
	
l10851:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@choice)^080h,w
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
	goto	l10833
	xorlw	1^0	; case 1
	skipnz
	goto	l10835
	xorlw	2^1	; case 2
	skipnz
	goto	l10837
	xorlw	3^2	; case 3
	skipnz
	goto	l10841
	xorlw	4^3	; case 4
	skipnz
	goto	l10853
	goto	l10853
	opt asmopt_on

	line	284
	
l2233:	
	line	285
	
l10853:	
;Main.c: 285: choice = 255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	goto	l10805
	line	435
	
l2239:	
	line	213
	goto	l10805
	
l2240:	
	line	436
	
l2241:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_init
psect	text755,local,class=CODE,delta=2
global __ptext755
__ptext755:

;; *************** function _init *****************
;; Defined at:
;;		line 127 in file "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
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
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_init_adc
;;		_lcd_init
;;		_ser_init
;;		_robo_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text755
	file	"H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	line	127
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 0
; Regs used in _init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	128
	
l10785:	
;Main.c: 128: init_adc();
	fcall	_init_adc
	line	129
;Main.c: 129: lcd_init();
	fcall	_lcd_init
	line	130
;Main.c: 130: ser_init();
	fcall	_ser_init
	line	131
	
l10787:	
;Main.c: 131: robo_init();
	fcall	_robo_init
	line	133
	
l10789:	
;Main.c: 133: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	135
	
l10791:	
;Main.c: 135: TRISC &= 0b10010000;
	movlw	(090h)
	movwf	(??_init+0)^080h+0
	movf	(??_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	137
	
l10793:	
;Main.c: 137: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	138
	
l10795:	
;Main.c: 138: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	140
	
l10797:	
;Main.c: 140: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	143
	
l10799:	
;Main.c: 143: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	146
	
l10801:	
;Main.c: 146: (GIE = 1);
	bsf	(95/8),(95)&7
	line	147
	
l2205:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_calibrateIR
psect	text756,local,class=CODE,delta=2
global __ptext756
__ptext756:

;; *************** function _calibrateIR *****************
;; Defined at:
;;		line 152 in file "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
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
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_rotate
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text756
	file	"H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	line	152
	global	__size_of_calibrateIR
	__size_of_calibrateIR	equ	__end_of_calibrateIR-_calibrateIR
	
_calibrateIR:	
	opt	stack 0
; Regs used in _calibrateIR: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	154
	
l10761:	
;Main.c: 154: currentMenu = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_currentMenu)
	bsf	status,0
	rlf	(_currentMenu),f
	line	155
	
l10763:	
;Main.c: 155: rotate(8, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotate)^080h
	movlw	(08h)
	fcall	_rotate
	goto	l10783
	line	156
;Main.c: 156: while (1)
	
l2208:	
	line	158
;Main.c: 157: {
;Main.c: 158: switch (buttonPressed)
	goto	l10783
	line	160
;Main.c: 159: {
;Main.c: 160: case 1:
	
l2210:	
	line	163
;Main.c: 163: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	165
;Main.c: 165: break;
	goto	l10783
	line	166
;Main.c: 166: case 2:
	
l2212:	
	line	169
;Main.c: 169: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	171
;Main.c: 171: break;
	goto	l10783
	line	172
;Main.c: 172: case 3:
	
l2213:	
	line	173
	
l10765:	
;Main.c: 173: rotate(1, 1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotate)^080h
	bsf	status,0
	rlf	(?_rotate)^080h,f
	movlw	(01h)
	fcall	_rotate
	line	175
	
l10767:	
;Main.c: 175: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	177
;Main.c: 177: break;
	goto	l10783
	line	178
;Main.c: 178: case 4:
	
l2214:	
	line	179
	
l10769:	
;Main.c: 179: rotate(1, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotate)^080h
	movlw	(01h)
	fcall	_rotate
	line	181
	
l10771:	
;Main.c: 181: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	183
;Main.c: 183: break;
	goto	l10783
	line	184
;Main.c: 184: case 5:
	
l2215:	
	line	185
	
l10773:	
;Main.c: 185: totalSteps = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_totalSteps)^080h
	clrf	(_totalSteps+1)^080h
	line	187
	
l10775:	
;Main.c: 187: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	goto	l2216
	line	188
	
l10777:	
;Main.c: 188: return;
	goto	l2216
	line	189
	
l10779:	
;Main.c: 189: break;
	goto	l10783
	line	190
;Main.c: 190: default:
	
l2217:	
	line	192
;Main.c: 192: break;
	goto	l10783
	line	193
	
l10781:	
;Main.c: 193: }
	goto	l10783
	line	158
	
l2209:	
	
l10783:	
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
	goto	l2210
	xorlw	2^1	; case 2
	skipnz
	goto	l2212
	xorlw	3^2	; case 3
	skipnz
	goto	l10765
	xorlw	4^3	; case 4
	skipnz
	goto	l10769
	xorlw	5^4	; case 5
	skipnz
	goto	l10773
	goto	l10783
	opt asmopt_on

	line	193
	
l2211:	
	goto	l10783
	line	194
	
l2218:	
	line	156
	goto	l10783
	
l2219:	
	line	195
	
l2216:	
	return
	opt stack 0
GLOBAL	__end_of_calibrateIR
	__end_of_calibrateIR:
;; =============== function _calibrateIR ends ============

	signat	_calibrateIR,88
	global	_lcd_init
psect	text757,local,class=CODE,delta=2
global __ptext757
__ptext757:

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
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_lcd_write_control
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text757
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 0
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l10741:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l10743:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l10745:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l10747:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l10749:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l10751:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l10753:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l10755:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l10757:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l10759:	
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
	global	_robotTurn
psect	text758,local,class=CODE,delta=2
global __ptext758
__ptext758:

;; *************** function _robotTurn *****************
;; Defined at:
;;		line 75 in file "H:\Aldnoah.Zero\trunk\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  distance        2    2[BANK1 ] int 
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
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text758
	file	"H:\Aldnoah.Zero\trunk\Assignment3\robot.c"
	line	75
	global	__size_of_robotTurn
	__size_of_robotTurn	equ	__end_of_robotTurn-_robotTurn
	
_robotTurn:	
	opt	stack 1
; Regs used in _robotTurn: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	78
	
l10731:	
;robot.c: 78: turnlowByte = (unsigned char) (distance) ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(robotTurn@distance)^080h,w
	movwf	(??_robotTurn+0)^080h+0
	movf	(??_robotTurn+0)^080h+0,w
	movwf	(_turnlowByte)^080h
	line	79
	
l10733:	
;robot.c: 79: turnhighByte = (unsigned char) (distance >> 8);
	movf	(robotTurn@distance+1)^080h,w
	movwf	(??_robotTurn+0)^080h+0
	movf	(??_robotTurn+0)^080h+0,w
	movwf	(_turnhighByte)^080h
	line	80
	
l10735:	
;robot.c: 80: if (distance >= 0)
	btfsc	(robotTurn@distance+1)^080h,7
	goto	u4291
	goto	u4290
u4291:
	goto	l10739
u4290:
	line	82
	
l10737:	
;robot.c: 81: {
;robot.c: 82: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	84
;robot.c: 84: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	86
;robot.c: 86: ser_putch(100);
	movlw	(064h)
	fcall	_ser_putch
	line	88
;robot.c: 88: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	90
;robot.c: 90: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	91
;robot.c: 91: }
	goto	l6687
	line	92
	
l6686:	
	line	94
	
l10739:	
;robot.c: 92: else
;robot.c: 93: {
;robot.c: 94: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	96
;robot.c: 96: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	98
;robot.c: 98: ser_putch(100);
	movlw	(064h)
	fcall	_ser_putch
	line	100
;robot.c: 100: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	102
;robot.c: 102: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	103
	
l6687:	
	line	104
;robot.c: 103: }
;robot.c: 104: ser_putch(157);
	movlw	(09Dh)
	fcall	_ser_putch
	line	106
;robot.c: 106: ser_putch(turnhighByte);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_turnhighByte)^080h,w
	fcall	_ser_putch
	line	108
;robot.c: 108: ser_putch(turnlowByte);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_turnlowByte)^080h,w
	fcall	_ser_putch
	line	110
;robot.c: 110: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	112
;robot.c: 112: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	114
;robot.c: 114: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	116
;robot.c: 116: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	118
;robot.c: 118: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	120
	
l6688:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurn
	__end_of_robotTurn:
;; =============== function _robotTurn ends ============

	signat	_robotTurn,4216
	global	_robotMove
psect	text759,local,class=CODE,delta=2
global __ptext759
__ptext759:

;; *************** function _robotMove *****************
;; Defined at:
;;		line 28 in file "H:\Aldnoah.Zero\trunk\Assignment3\robot.c"
;; Parameters:    Size  Location     Type
;;  distance        2    2[BANK1 ] int 
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
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text759
	file	"H:\Aldnoah.Zero\trunk\Assignment3\robot.c"
	line	28
	global	__size_of_robotMove
	__size_of_robotMove	equ	__end_of_robotMove-_robotMove
	
_robotMove:	
	opt	stack 1
; Regs used in _robotMove: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	30
	
l10721:	
;robot.c: 30: lowByte = (unsigned char) (distance) ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(robotMove@distance)^080h,w
	movwf	(??_robotMove+0)^080h+0
	movf	(??_robotMove+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_lowByte)
	line	31
	
l10723:	
;robot.c: 31: highByte = (unsigned char) (distance >> 8);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(robotMove@distance+1)^080h,w
	movwf	(??_robotMove+0)^080h+0
	movf	(??_robotMove+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_highByte)
	line	32
	
l10725:	
;robot.c: 32: if (distance >= 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(robotMove@distance+1)^080h,7
	goto	u4281
	goto	u4280
u4281:
	goto	l10729
u4280:
	line	34
	
l10727:	
;robot.c: 33: {
;robot.c: 34: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	36
;robot.c: 36: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	38
;robot.c: 38: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	40
;robot.c: 40: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	42
;robot.c: 42: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	43
;robot.c: 43: }
	goto	l6682
	line	44
	
l6681:	
	line	46
	
l10729:	
;robot.c: 44: else
;robot.c: 45: {
;robot.c: 46: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	48
;robot.c: 48: ser_putch(0xff);
	movlw	(0FFh)
	fcall	_ser_putch
	line	50
;robot.c: 50: ser_putch(0x38);
	movlw	(038h)
	fcall	_ser_putch
	line	52
;robot.c: 52: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	54
;robot.c: 54: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	55
	
l6682:	
	line	56
;robot.c: 55: }
;robot.c: 56: ser_putch(156);
	movlw	(09Ch)
	fcall	_ser_putch
	line	58
;robot.c: 58: ser_putch(highByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_highByte),w
	fcall	_ser_putch
	line	60
;robot.c: 60: ser_putch(lowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_lowByte),w
	fcall	_ser_putch
	line	62
;robot.c: 62: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	64
;robot.c: 64: ser_putch(0);
	movlw	(0)
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
	
l6683:	
	return
	opt stack 0
GLOBAL	__end_of_robotMove
	__end_of_robotMove:
;; =============== function _robotMove ends ============

	signat	_robotMove,4216
	global	_rotate
psect	text760,local,class=CODE,delta=2
global __ptext760
__ptext760:

;; *************** function _rotate *****************
;; Defined at:
;;		line 48 in file "H:\Aldnoah.Zero\trunk\Assignment3\steppermotor.c"
;; Parameters:    Size  Location     Type
;;  steps           1    wreg     unsigned char 
;;  direction       1    3[BANK1 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  steps           1    6[BANK1 ] unsigned char 
;;  i               1    7[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       1       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       2       0       0
;;      Totals:         0       0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_spi_transfer
;; This function is called by:
;;		_calibrateIR
;;		_main
;; This function uses a non-reentrant model
;;
psect	text760
	file	"H:\Aldnoah.Zero\trunk\Assignment3\steppermotor.c"
	line	48
	global	__size_of_rotate
	__size_of_rotate	equ	__end_of_rotate-_rotate
	
_rotate:	
	opt	stack 1
; Regs used in _rotate: [wreg+status,2+status,0+pclath+cstack]
;rotate@steps stored from wreg
	line	50
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(rotate@steps)^080h
	
l10701:	
;steppermotor.c: 50: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	51
	
l10703:	
;steppermotor.c: 51: if (direction == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(rotate@direction)^080h,f
	skipz
	goto	u4261
	goto	u4260
u4261:
	goto	l10707
u4260:
	line	52
	
l10705:	
;steppermotor.c: 52: spi_transfer(0b00001111);
	movlw	(0Fh)
	fcall	_spi_transfer
	goto	l10709
	line	53
	
l3664:	
	line	54
	
l10707:	
;steppermotor.c: 53: else
;steppermotor.c: 54: spi_transfer(0b00001101);
	movlw	(0Dh)
	fcall	_spi_transfer
	goto	l10709
	
l3665:	
	line	55
	
l10709:	
;steppermotor.c: 55: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l10711:	
	bcf	(57/8),(57)&7
	line	56
	
l10713:	
;steppermotor.c: 56: for (unsigned char i = 0; i <= steps; i++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(rotate@i)^080h
	goto	l10719
	line	57
	
l3667:	
	line	58
;steppermotor.c: 57: {
;steppermotor.c: 58: RC2 = 1; _nop(); RC2 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	nop
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	59
	
l10715:	
;steppermotor.c: 59: _delay((unsigned long)((10)*(20000000/4000.0)));
	opt asmopt_off
movlw	65
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_rotate+0)^080h+0+1),f
	movlw	238
movwf	((??_rotate+0)^080h+0),f
u4327:
	decfsz	((??_rotate+0)^080h+0),f
	goto	u4327
	decfsz	((??_rotate+0)^080h+0+1),f
	goto	u4327
	clrwdt
opt asmopt_on

	line	56
	
l10717:	
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	addwf	(rotate@i)^080h,f
	goto	l10719
	
l3666:	
	
l10719:	
	movf	(rotate@i)^080h,w
	subwf	(rotate@steps)^080h,w
	skipnc
	goto	u4271
	goto	u4270
u4271:
	goto	l3667
u4270:
	goto	l3669
	
l3668:	
	line	61
	
l3669:	
	return
	opt stack 0
GLOBAL	__end_of_rotate
	__end_of_rotate:
;; =============== function _rotate ends ============

	signat	_rotate,8312
	global	_robo_init
psect	text761,local,class=CODE,delta=2
global __ptext761
__ptext761:

;; *************** function _robo_init *****************
;; Defined at:
;;		line 9 in file "H:\Aldnoah.Zero\trunk\Assignment3\robot.c"
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
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text761
	file	"H:\Aldnoah.Zero\trunk\Assignment3\robot.c"
	line	9
	global	__size_of_robo_init
	__size_of_robo_init	equ	__end_of_robo_init-_robo_init
	
_robo_init:	
	opt	stack 0
; Regs used in _robo_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	10
	
l10699:	
;robot.c: 10: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	11
;robot.c: 11: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	14
;robot.c: 14: ser_putch (142);
	movlw	(08Eh)
	fcall	_ser_putch
	line	15
;robot.c: 15: ser_putch (19);
	movlw	(013h)
	fcall	_ser_putch
	line	16
	
l6673:	
	return
	opt stack 0
GLOBAL	__end_of_robo_init
	__end_of_robo_init:
;; =============== function _robo_init ends ============

	signat	_robo_init,88
	global	_lcd_write_control
psect	text762,local,class=CODE,delta=2
global __ptext762
__ptext762:

;; *************** function _lcd_write_control *****************
;; Defined at:
;;		line 18 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  databyte        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  databyte        1    2[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       2       0       0
;;      Totals:         0       0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text762
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	18
	global	__size_of_lcd_write_control
	__size_of_lcd_write_control	equ	__end_of_lcd_write_control-_lcd_write_control
	
_lcd_write_control:	
	opt	stack 0
; Regs used in _lcd_write_control: [wreg]
;lcd_write_control@databyte stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_write_control@databyte)^080h
	line	19
	
l10691:	
;lcd.c: 19: RE2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	20
;lcd.c: 20: RE1 = 0;
	bcf	(73/8),(73)&7
	line	21
;lcd.c: 21: RE0 = 0;
	bcf	(72/8),(72)&7
	line	22
	
l10693:	
;lcd.c: 22: PORTD = databyte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_control@databyte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	23
	
l10695:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l10697:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_lcd_write_control+0)^080h+0+1),f
	movlw	251
movwf	((??_lcd_write_control+0)^080h+0),f
u4337:
	decfsz	((??_lcd_write_control+0)^080h+0),f
	goto	u4337
	decfsz	((??_lcd_write_control+0)^080h+0+1),f
	goto	u4337
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
psect	text763,local,class=CODE,delta=2
global __ptext763
__ptext763:

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
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text763
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	46
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 1
; Regs used in _init_adc: [wreg+status,2]
	line	48
	
l10681:	
;adc.c: 48: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	49
	
l10683:	
;adc.c: 49: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	52
	
l10685:	
;adc.c: 52: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	53
	
l10687:	
;adc.c: 53: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	55
	
l10689:	
;adc.c: 55: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_init_adc+0)^080h+0,f
u4347:
decfsz	(??_init_adc+0)^080h+0,f
	goto	u4347
opt asmopt_on

	line	57
	
l700:	
	return
	opt stack 0
GLOBAL	__end_of_init_adc
	__end_of_init_adc:
;; =============== function _init_adc ends ============

	signat	_init_adc,88
	global	_ser_putch
psect	text764,local,class=CODE,delta=2
global __ptext764
__ptext764:

;; *************** function _ser_putch *****************
;; Defined at:
;;		line 70 in file "E:\Aldnoah.Zero\Assignment3\ser.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    1[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_robo_init
;;		_robotMove
;;		_robotTurn
;;		_ser_puts
;;		_ser_puts2
;;		_ser_puthex
;; This function uses a non-reentrant model
;;
psect	text764
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	70
	global	__size_of_ser_putch
	__size_of_ser_putch	equ	__end_of_ser_putch-_ser_putch
	
_ser_putch:	
	opt	stack 1
; Regs used in _ser_putch: [wreg-fsr0h+status,2+status,0]
;ser_putch@c stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ser_putch@c)^080h
	line	71
	
l10419:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l10421
	
l4410:	
	line	72
;ser.c: 72: continue;
	goto	l10421
	
l4409:	
	line	71
	
l10421:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	xorwf	(_txoptr),w	;volatile
	skipnz
	goto	u3691
	goto	u3690
u3691:
	goto	l10421
u3690:
	
l4411:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l10423:	
;ser.c: 74: txfifo[txiptr] = c;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(ser_putch@c)^080h,w
	movwf	(??_ser_putch+0)^080h+0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_txiptr),w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(??_ser_putch+0)^080h+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	75
	
l10425:	
;ser.c: 75: txiptr=(txiptr+1) & (16-1);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_ser_putch+0)^080h+0
	movf	(??_ser_putch+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_txiptr)	;volatile
	line	76
	
l10427:	
;ser.c: 76: TXIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1124/8)^080h,(1124)&7
	line	77
	
l10429:	
;ser.c: 77: GIE=1;
	bsf	(95/8),(95)&7
	line	78
	
l4412:	
	return
	opt stack 0
GLOBAL	__end_of_ser_putch
	__end_of_ser_putch:
;; =============== function _ser_putch ends ============

	signat	_ser_putch,4216
	global	_spi_transfer
psect	text765,local,class=CODE,delta=2
global __ptext765
__ptext765:

;; *************** function _spi_transfer *****************
;; Defined at:
;;		line 34 in file "H:\Aldnoah.Zero\trunk\Assignment3\steppermotor.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    2[BANK1 ] unsigned char 
;;  temp            1    1[BANK1 ] unsigned char 
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
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_rotate
;; This function uses a non-reentrant model
;;
psect	text765
	file	"H:\Aldnoah.Zero\trunk\Assignment3\steppermotor.c"
	line	34
	global	__size_of_spi_transfer
	__size_of_spi_transfer	equ	__end_of_spi_transfer-_spi_transfer
	
_spi_transfer:	
	opt	stack 1
; Regs used in _spi_transfer: [wreg]
;spi_transfer@data stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(spi_transfer@data)^080h
	line	35
	
l10315:	
;steppermotor.c: 35: unsigned char temp = 0;
	clrf	(spi_transfer@temp)^080h
	line	37
;steppermotor.c: 37: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	38
	
l10317:	
;steppermotor.c: 38: SSPBUF = data;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(spi_transfer@data)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	40
;steppermotor.c: 40: while (SSPIF == 0);
	goto	l3658
	
l3659:	
	
l3658:	
	btfss	(99/8),(99)&7
	goto	u3611
	goto	u3610
u3611:
	goto	l3658
u3610:
	goto	l10319
	
l3660:	
	line	41
	
l10319:	
;steppermotor.c: 41: temp = SSPBUF;
	movf	(19),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_spi_transfer+0)^080h+0
	movf	(??_spi_transfer+0)^080h+0,w
	movwf	(spi_transfer@temp)^080h
	line	42
	
l10321:	
;steppermotor.c: 42: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	goto	l3661
	line	44
	
l10323:	
	line	45
;steppermotor.c: 44: return temp;
;	Return value of _spi_transfer is never used
	
l3661:	
	return
	opt stack 0
GLOBAL	__end_of_spi_transfer
	__end_of_spi_transfer:
;; =============== function _spi_transfer ends ============

	signat	_spi_transfer,4217
	global	_Menu
psect	text766,local,class=CODE,delta=2
global __ptext766
__ptext766:

;; *************** function _Menu *****************
;; Defined at:
;;		line 180 in file "H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;  input           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  input           1    0[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text766
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	180
	global	__size_of_Menu
	__size_of_Menu	equ	__end_of_Menu-_Menu
	
_Menu:	
	opt	stack 2
; Regs used in _Menu: [wreg-fsr0h+status,2+status,0]
;Menu@input stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(Menu@input)^080h
	line	181
	
l10241:	
;HMI.c: 181: switch (input)
	goto	l10261
	line	183
;HMI.c: 182: {
;HMI.c: 183: case 1:
	
l5210:	
	line	185
;HMI.c: 185: break;
	goto	l10263
	line	186
;HMI.c: 186: case 2:
	
l5212:	
	line	188
;HMI.c: 188: break;
	goto	l10263
	line	189
;HMI.c: 189: case 3:
	
l5213:	
	line	190
	
l10243:	
;HMI.c: 190: pos--;
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_pos),f
	skipnc
	incf	(_pos+1),f
	movlw	high(-1)
	addwf	(_pos+1),f
	line	191
	
l10245:	
;HMI.c: 191: if (pos < 0)
	btfss	(_pos+1),7
	goto	u3451
	goto	u3450
u3451:
	goto	l10263
u3450:
	line	192
	
l10247:	
;HMI.c: 192: pos = 5 - 1;
	movlw	low(04h)
	movwf	(_pos)
	movlw	high(04h)
	movwf	((_pos))+1
	goto	l10263
	
l5214:	
	line	194
;HMI.c: 194: break;
	goto	l10263
	line	195
;HMI.c: 195: case 4:
	
l5215:	
	line	196
	
l10249:	
;HMI.c: 196: pos++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	addwf	(_pos),f
	skipnc
	incf	(_pos+1),f
	movlw	high(01h)
	addwf	(_pos+1),f
	line	197
;HMI.c: 197: if (pos == 5)
	movlw	05h
	xorwf	(_pos),w
	iorwf	(_pos+1),w
	skipz
	goto	u3461
	goto	u3460
u3461:
	goto	l10263
u3460:
	line	198
	
l10251:	
;HMI.c: 198: pos = 0;
	clrf	(_pos)
	clrf	(_pos+1)
	goto	l10263
	
l5216:	
	line	200
;HMI.c: 200: break;
	goto	l10263
	line	201
;HMI.c: 201: case 5:
	
l5217:	
	line	202
	
l10253:	
;HMI.c: 202: return pos;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_pos),w
	goto	l5218
	
l10255:	
	goto	l5218
	line	203
	
l10257:	
;HMI.c: 203: break;
	goto	l10263
	line	205
;HMI.c: 205: default:
	
l5219:	
	line	207
;HMI.c: 207: break;
	goto	l10263
	line	208
	
l10259:	
;HMI.c: 208: }
	goto	l10263
	line	181
	
l5209:	
	
l10261:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(Menu@input)^080h,w
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
	goto	l10263
	xorlw	2^1	; case 2
	skipnz
	goto	l10263
	xorlw	3^2	; case 3
	skipnz
	goto	l10243
	xorlw	4^3	; case 4
	skipnz
	goto	l10249
	xorlw	5^4	; case 5
	skipnz
	goto	l10253
	goto	l10263
	opt asmopt_on

	line	208
	
l5211:	
	line	209
	
l10263:	
;HMI.c: 209: return 255;
	movlw	(0FFh)
	goto	l5218
	
l10265:	
	line	210
	
l5218:	
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4217
	global	_ser_init
psect	text767,local,class=CODE,delta=2
global __ptext767
__ptext767:

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
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text767
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 1
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l10215:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l10217:	
;ser.c: 115: TRISC &= 0b10111111;
	movlw	(0BFh)
	movwf	(??_ser_init+0)^080h+0
	movf	(??_ser_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	116
	
l10219:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l10221:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l10223:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l10225:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l10227:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l10229:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l10231:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l10233:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l10235:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l10237:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l10239:	
;ser.c: 132: rxiptr=rxoptr=txiptr=txoptr=0;
	movlw	(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_txoptr)	;volatile
	movwf	(_txiptr)	;volatile
	movwf	(_rxoptr)	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_ser_init+0)^080h+0
	movf	(??_ser_init+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_rxiptr)	;volatile
	line	133
	
l4434:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_isr1
psect	text768,local,class=CODE,delta=2
global __ptext768
__ptext768:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 85 in file "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
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
;;      Temps:          0       5       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___lwmod
;;		_readAvgDistance
;;		_UpdateDisplay
;;		_ReadButtons
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text768
	file	"H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	line	85
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr1+1)
	movf	fsr0,w
	movwf	(??_isr1+2)
	movf	pclath,w
	movwf	(??_isr1+3)
	movf	btemp+1,w
	movwf	(??_isr1+4)
	ljmp	_isr1
psect	text768
	line	87
	
i1l10057:	
;Main.c: 87: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	btfss	(101/8),(101)&7
	goto	u325_21
	goto	u325_20
u325_21:
	goto	i1l10067
u325_20:
	
i1l10059:	
	movf	(26),w	;volatile
	movwf	(??_isr1+0)+0
	movf	(_rxiptr),w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	movf	(??_isr1+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
i1l10061:	
	movf	(_rxiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_ser_tmp)
	
i1l10063:	
	movf	(_ser_tmp),w
	xorwf	(_rxoptr),w	;volatile
	skipnz
	goto	u326_21
	goto	u326_20
u326_21:
	goto	i1l10067
u326_20:
	
i1l10065:	
	movf	(_ser_tmp),w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)	;volatile
	goto	i1l10067
	
i1l2193:	
	goto	i1l10067
	
i1l2192:	
	
i1l10067:	
	btfss	(100/8),(100)&7
	goto	u327_21
	goto	u327_20
u327_21:
	goto	i1l2194
u327_20:
	
i1l10069:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u328_21
	goto	u328_20
u328_21:
	goto	i1l2194
u328_20:
	
i1l10071:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_txoptr),w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(25)	;volatile
	
i1l10073:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	addwf	(_txoptr),f	;volatile
	
i1l10075:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr),f	;volatile
	
i1l10077:	
	movf	(_txoptr),w	;volatile
	xorwf	(_txiptr),w	;volatile
	skipz
	goto	u329_21
	goto	u329_20
u329_21:
	goto	i1l2194
u329_20:
	
i1l10079:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2194
	
i1l2195:	
	
i1l2194:	
	line	90
;Main.c: 90: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l2202
u330_20:
	line	92
	
i1l10081:	
;Main.c: 91: {
;Main.c: 92: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	93
	
i1l10083:	
;Main.c: 93: TMR0 = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	95
;Main.c: 95: RTC_Counter++;
	movlw	low(01h)
	addwf	(_RTC_Counter),f	;volatile
	skipnc
	incf	(_RTC_Counter+1),f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1),f	;volatile
	line	97
	
i1l10085:	
;Main.c: 97: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	98
	
i1l10087:	
;Main.c: 98: if(RTC_Counter % 10 == 0)
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u331_21
	goto	u331_20
u331_21:
	goto	i1l10091
u331_20:
	line	100
	
i1l10089:	
;Main.c: 99: {
;Main.c: 100: RTC_FLAG_10MS = 1;
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l10091
	line	103
	
i1l2197:	
	line	104
	
i1l10091:	
;Main.c: 103: }
;Main.c: 104: if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
	movlw	low(032h)
	movwf	(?___lwmod)
	movlw	high(032h)
	movwf	((?___lwmod))+1
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u332_21
	goto	u332_20
u332_21:
	goto	i1l10095
u332_20:
	
i1l10093:	
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l10095
	
i1l2198:	
	line	105
	
i1l10095:	
;Main.c: 105: if(RTC_Counter % 250 == 0)
	movlw	low(0FAh)
	movwf	(?___lwmod)
	movlw	high(0FAh)
	movwf	((?___lwmod))+1
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u333_21
	goto	u333_20
u333_21:
	goto	i1l10101
u333_20:
	line	107
	
i1l10097:	
;Main.c: 106: {
;Main.c: 107: readAvgDistance();
	fcall	_readAvgDistance
	line	108
;Main.c: 108: UpdateDisplay(serialInput);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_serialInput),w	;volatile
	fcall	_UpdateDisplay
	line	109
	
i1l10099:	
;Main.c: 109: RTC_FLAG_250MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l10101
	line	111
	
i1l2199:	
	line	112
	
i1l10101:	
;Main.c: 111: }
;Main.c: 112: if(RTC_Counter % 500 == 0)
	movlw	low(01F4h)
	movwf	(?___lwmod)
	movlw	high(01F4h)
	movwf	((?___lwmod))+1
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u334_21
	goto	u334_20
u334_21:
	goto	i1l10109
u334_20:
	line	114
	
i1l10103:	
;Main.c: 113: {
;Main.c: 114: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	115
	
i1l10105:	
;Main.c: 115: RTC_Counter = 0;
	clrf	(_RTC_Counter)	;volatile
	clrf	(_RTC_Counter+1)	;volatile
	line	116
	
i1l10107:	
;Main.c: 116: RB0 ^= 0x01;
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l10109
	line	117
	
i1l2200:	
	line	119
	
i1l10109:	
;Main.c: 117: }
;Main.c: 119: if (buttonPressed == 0)
	movf	(_buttonPressed),f
	skipz	;volatile
	goto	u335_21
	goto	u335_20
u335_21:
	goto	i1l2202
u335_20:
	line	121
	
i1l10111:	
;Main.c: 120: {
;Main.c: 121: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_buttonPressed)	;volatile
	goto	i1l2202
	line	122
	
i1l2201:	
	goto	i1l2202
	line	123
	
i1l2196:	
	line	124
	
i1l2202:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(??_isr1+4),w
	movwf	btemp+1
	movf	(??_isr1+3),w
	movwf	pclath
	movf	(??_isr1+2),w
	movwf	fsr0
	swapf	(??_isr1+1)^00h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr1
	__end_of_isr1:
;; =============== function _isr1 ends ============

	signat	_isr1,88
	global	_UpdateDisplay
psect	text769,local,class=CODE,delta=2
global __ptext769
__ptext769:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 215 in file "H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;  serialInput     1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  serialInput     1    0[COMMON] unsigned char 
;;  adcOutput      16   28[BANK0 ] unsigned char [16]
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
;;      Locals:         0      16       0       0       0
;;      Temps:          0       5       0       0       0
;;      Totals:         0      21       0       0       0
;;Total ram usage:       21 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		i1_lcd_write_control
;;		_sprintf
;;		_lcd_set_cursor
;;		_lcd_write_string
;;		___awmod
;; This function is called by:
;;		_isr1
;; This function uses a non-reentrant model
;;
psect	text769
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	215
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
	opt	stack 1
; Regs used in _UpdateDisplay: [allreg]
	line	216
	
i1l10129:	
;HMI.c: 216: char adcOutput[16] = "";
	movlw	(UpdateDisplay@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1222)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	fsr0,w
	movwf	((??_UpdateDisplay+0)+0+1)
	movlw	16
	movwf	((??_UpdateDisplay+0)+0+2)
u338_20:
	movf	(??_UpdateDisplay+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	
	movf	indf,w
	movwf	((??_UpdateDisplay+0)+0+3)
	incf	(??_UpdateDisplay+0)+0,f
	movf	((??_UpdateDisplay+0)+0+1),w
	movwf	fsr0
	
	movf	((??_UpdateDisplay+0)+0+3),w
	movwf	indf
	incf	((??_UpdateDisplay+0)+0+1),f
	decfsz	((??_UpdateDisplay+0)+0+2),f
	goto	u338_20
	line	217
;HMI.c: 217: switch (currentMenu)
	goto	i1l10175
	line	220
;HMI.c: 218: {
;HMI.c: 220: case 0:
	
i1l5225:	
	line	221
	
i1l10131:	
;HMI.c: 221: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	i1_lcd_write_control
	line	223
	
i1l10133:	
;HMI.c: 223: sprintf(adcOutput,"ADC:%d Dist:%d",highByte, lowByte);
	movlw	((STR_11-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	(??_UpdateDisplay+0)+0,w
	movwf	(?_sprintf)
	movf	(_highByte),w
	movwf	(??_UpdateDisplay+1)+0
	clrf	(??_UpdateDisplay+1)+0+1
	movf	0+(??_UpdateDisplay+1)+0,w
	movwf	0+(?_sprintf)+01h
	movf	1+(??_UpdateDisplay+1)+0,w
	movwf	1+(?_sprintf)+01h
	movf	(_lowByte),w
	movwf	(??_UpdateDisplay+3)+0
	clrf	(??_UpdateDisplay+3)+0+1
	movf	0+(??_UpdateDisplay+3)+0,w
	movwf	0+(?_sprintf)+03h
	movf	1+(??_UpdateDisplay+3)+0,w
	movwf	1+(?_sprintf)+03h
	movlw	(UpdateDisplay@adcOutput)&0ffh
	fcall	_sprintf
	line	225
	
i1l10135:	
;HMI.c: 225: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	226
	
i1l10137:	
;HMI.c: 226: lcd_write_string(adcOutput);
	movlw	(UpdateDisplay@adcOutput&0ffh)
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	231
	
i1l10139:	
;HMI.c: 231: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	232
	
i1l10141:	
;HMI.c: 232: if (pos > 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_pos+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u339_25
	movlw	low(01h)
	subwf	(_pos),w
u339_25:

	skipc
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l10145
u339_20:
	line	233
	
i1l10143:	
;HMI.c: 233: lcd_write_string(shortMenuStrings[pos - 1]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_pos),w
	addlw	0FFh
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	goto	i1l10147
	line	234
	
i1l5226:	
	line	235
	
i1l10145:	
;HMI.c: 234: else
;HMI.c: 235: lcd_write_string(shortMenuStrings[pos + 5 - 1]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_pos),w
	addlw	04h
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	goto	i1l10147
	
i1l5227:	
	line	236
	
i1l10147:	
;HMI.c: 236: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	237
	
i1l10149:	
;HMI.c: 237: lcd_write_string(menuStrings[pos]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_pos),w
	addlw	_menuStrings&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	238
;HMI.c: 238: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	239
	
i1l10151:	
;HMI.c: 239: lcd_write_string(shortMenuStrings[(pos + 1) % 5]);
	movlw	low(05h)
	movwf	(?___awmod)
	movlw	high(05h)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_pos),w
	addlw	low(01h)
	movwf	0+(?___awmod)+02h
	movf	(_pos+1),w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+0+(?___awmod)+02h
	fcall	___awmod
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
	goto	i1l5231
	line	241
;HMI.c: 241: case 1:
	
i1l5229:	
	line	242
	
i1l10153:	
;HMI.c: 242: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	i1_lcd_write_control
	line	244
	
i1l10155:	
;HMI.c: 244: sprintf(adcOutput,"ADC:%d Dist:%d",highByte, lowByte);
	movlw	((STR_12-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	(??_UpdateDisplay+0)+0,w
	movwf	(?_sprintf)
	movf	(_highByte),w
	movwf	(??_UpdateDisplay+1)+0
	clrf	(??_UpdateDisplay+1)+0+1
	movf	0+(??_UpdateDisplay+1)+0,w
	movwf	0+(?_sprintf)+01h
	movf	1+(??_UpdateDisplay+1)+0,w
	movwf	1+(?_sprintf)+01h
	movf	(_lowByte),w
	movwf	(??_UpdateDisplay+3)+0
	clrf	(??_UpdateDisplay+3)+0+1
	movf	0+(??_UpdateDisplay+3)+0,w
	movwf	0+(?_sprintf)+03h
	movf	1+(??_UpdateDisplay+3)+0,w
	movwf	1+(?_sprintf)+03h
	movlw	(UpdateDisplay@adcOutput)&0ffh
	fcall	_sprintf
	line	246
	
i1l10157:	
;HMI.c: 246: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	247
	
i1l10159:	
;HMI.c: 247: lcd_write_string(adcOutput);
	movlw	(UpdateDisplay@adcOutput&0ffh)
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	252
	
i1l10161:	
;HMI.c: 252: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	254
	
i1l10163:	
;HMI.c: 254: lcd_write_string("<<<");
	movlw	low((STR_13-__stringbase))
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	257
	
i1l10165:	
;HMI.c: 257: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	258
	
i1l10167:	
;HMI.c: 258: lcd_write_string("CONFIRM");
	movlw	low((STR_14-__stringbase))
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	259
	
i1l10169:	
;HMI.c: 259: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	260
	
i1l10171:	
;HMI.c: 260: lcd_write_string(">>>");
	movlw	low((STR_15-__stringbase))
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	261
;HMI.c: 261: break;
	goto	i1l5231
	line	263
;HMI.c: 263: default:
	
i1l5230:	
	line	265
;HMI.c: 265: break;
	goto	i1l5231
	line	268
	
i1l10173:	
;HMI.c: 268: }
	goto	i1l5231
	line	217
	
i1l5224:	
	
i1l10175:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_currentMenu),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 0 to 1
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte           14     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             6     6 (fixed)
; spacedrange           10     9 (fixed)
; locatedrange           2     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	i1l10131
	xorlw	1^0	; case 1
	skipnz
	goto	i1l10153
	goto	i1l5231
	opt asmopt_on

	line	268
	
i1l5228:	
	line	269
	
i1l5231:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,4216
	global	_readAvgDistance
psect	text770,local,class=CODE,delta=2
global __ptext770
__ptext770:

;; *************** function _readAvgDistance *****************
;; Defined at:
;;		line 10 in file "H:\Aldnoah.Zero\trunk\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    4[BANK0 ] int 
;;  fullval         2    2[BANK0 ] unsigned int 
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
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_readDistance
;;		___lwdiv
;;		_ADCconvert
;; This function is called by:
;;		_isr1
;; This function uses a non-reentrant model
;;
psect	text770
	file	"H:\Aldnoah.Zero\trunk\Assignment3\infrared.c"
	line	10
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [allreg]
	line	11
	
i1l10113:	
;infrared.c: 11: unsigned int fullval = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(readAvgDistance@fullval)
	clrf	(readAvgDistance@fullval+1)
	line	14
;infrared.c: 14: for (int i = 0; i < 10; i++)
	clrf	(readAvgDistance@i)
	clrf	(readAvgDistance@i+1)
	
i1l10115:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u336_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u336_25:

	skipc
	goto	u336_21
	goto	u336_20
u336_21:
	goto	i1l10119
u336_20:
	goto	i1l10125
	
i1l10117:	
	goto	i1l10125
	line	15
	
i1l2942:	
	line	16
	
i1l10119:	
;infrared.c: 15: {
;infrared.c: 16: fullval += readDistance();
	fcall	_readDistance
	movf	(0+(?_readDistance)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(readAvgDistance@fullval),f
	skipnc
	incf	(readAvgDistance@fullval+1),f
	movf	(1+(?_readDistance)),w
	addwf	(readAvgDistance@fullval+1),f
	line	14
	
i1l10121:	
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
i1l10123:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u337_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u337_25:

	skipc
	goto	u337_21
	goto	u337_20
u337_21:
	goto	i1l10119
u337_20:
	goto	i1l10125
	
i1l2943:	
	line	19
	
i1l10125:	
;infrared.c: 18: }
;infrared.c: 19: adcVal = fullval / 10;
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(readAvgDistance@fullval+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(readAvgDistance@fullval),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_adcVal+1)	;volatile
	addwf	(_adcVal+1)	;volatile
	movf	(0+(?___lwdiv)),w
	clrf	(_adcVal)	;volatile
	addwf	(_adcVal)	;volatile

	line	20
	
i1l10127:	
;infrared.c: 20: ADCconvert();
	fcall	_ADCconvert
	line	21
	
i1l2944:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,88
	global	_readDistance
psect	text771,local,class=CODE,delta=2
global __ptext771
__ptext771:

;; *************** function _readDistance *****************
;; Defined at:
;;		line 24 in file "H:\Aldnoah.Zero\trunk\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  fullval         2   12[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    8[COMMON] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_adc_read_channel
;; This function is called by:
;;		_readAvgDistance
;; This function uses a non-reentrant model
;;
psect	text771
	file	"H:\Aldnoah.Zero\trunk\Assignment3\infrared.c"
	line	24
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	27
	
i1l10267:	
;infrared.c: 25: unsigned int fullval ;
;infrared.c: 27: fullval = adc_read_channel(0);
	movlw	(0)
	fcall	_adc_read_channel
	movwf	(??_readDistance+0)+0
	clrf	(??_readDistance+0)+0+1
	movf	0+(??_readDistance+0)+0,w
	movwf	(readDistance@fullval)
	movf	1+(??_readDistance+0)+0,w
	movwf	(readDistance@fullval+1)
	line	29
	
i1l10269:	
;infrared.c: 29: return fullval;
	movf	(readDistance@fullval+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@fullval),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	i1l2947
	
i1l10271:	
	line	30
	
i1l2947:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_lcd_write_string
psect	text772,local,class=CODE,delta=2
global __ptext772
__ptext772:

;; *************** function _lcd_write_string *****************
;; Defined at:
;;		line 48 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               2    7[COMMON] PTR unsigned char 
;;		 -> STR_15(4), STR_14(8), STR_13(4), UpdateDisplay@adcOutput(16), 
;;		 -> STR_10(4), STR_9(4), STR_8(4), STR_7(4), 
;;		 -> STR_6(4), STR_5(9), STR_4(8), STR_3(9), 
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
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_write_data
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text772
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 1
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
i1l10023:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	i1l10029
	
i1l1409:	
	
i1l10025:	
	movf	(lcd_write_string@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
i1l10027:	
	movlw	low(01h)
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
	goto	i1l10029
	
i1l1408:	
	
i1l10029:	
	movf	(lcd_write_string@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u321_21
	goto	u321_20
u321_21:
	goto	i1l10025
u321_20:
	goto	i1l1411
	
i1l1410:	
	line	51
	
i1l1411:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_string
	__end_of_lcd_write_string:
;; =============== function _lcd_write_string ends ============

	signat	_lcd_write_string,4216
	global	_lcd_set_cursor
psect	text773,local,class=CODE,delta=2
global __ptext773
__ptext773:

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 42 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    3[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_lcd_write_control
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text773
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	42
	global	__size_of_lcd_set_cursor
	__size_of_lcd_set_cursor	equ	__end_of_lcd_set_cursor-_lcd_set_cursor
	
_lcd_set_cursor:	
	opt	stack 1
; Regs used in _lcd_set_cursor: [wreg+status,2+status,0+pclath+cstack]
;lcd_set_cursor@address stored from wreg
	movwf	(lcd_set_cursor@address)
	line	43
	
i1l10019:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
i1l10021:	
;lcd.c: 44: lcd_write_control(address);
	movf	(lcd_set_cursor@address),w
	fcall	i1_lcd_write_control
	line	45
	
i1l1405:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
;; =============== function _lcd_set_cursor ends ============

	signat	_lcd_set_cursor,4216
	global	i1_lcd_write_control
psect	text774,local,class=CODE,delta=2
global __ptext774
__ptext774:

;; *************** function i1_lcd_write_control *****************
;; Defined at:
;;		line 18 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  lcd_write_co    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  lcd_write_co    1    2[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_set_cursor
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text774
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	18
	global	__size_ofi1_lcd_write_control
	__size_ofi1_lcd_write_control	equ	__end_ofi1_lcd_write_control-i1_lcd_write_control
	
i1_lcd_write_control:	
	opt	stack 1
; Regs used in i1_lcd_write_control: [wreg]
;i1lcd_write_control@databyte stored from wreg
	movwf	(i1lcd_write_control@databyte)
	line	19
	
i1l10673:	
;lcd.c: 19: RE2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	20
;lcd.c: 20: RE1 = 0;
	bcf	(73/8),(73)&7
	line	21
;lcd.c: 21: RE0 = 0;
	bcf	(72/8),(72)&7
	line	22
	
i1l10675:	
;lcd.c: 22: PORTD = databyte;
	movf	(i1lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
i1l10677:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
i1l10679:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??i1_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??i1_lcd_write_control+0)+0),f
u435_27:
	decfsz	((??i1_lcd_write_control+0)+0),f
	goto	u435_27
	decfsz	((??i1_lcd_write_control+0)+0+1),f
	goto	u435_27
	nop2
opt asmopt_on

	line	26
	
i1l1399:	
	return
	opt stack 0
GLOBAL	__end_ofi1_lcd_write_control
	__end_ofi1_lcd_write_control:
;; =============== function i1_lcd_write_control ends ============

	signat	i1_lcd_write_control,88
	global	_sprintf
psect	text775,local,class=CODE,delta=2
global __ptext775
__ptext775:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> UpdateDisplay@adcOutput(16), 
;;  f               1    6[BANK0 ] PTR const unsigned char 
;;		 -> STR_12(15), STR_11(15), 
;; Auto vars:     Size  Location     Type
;;  sp              1   21[BANK0 ] PTR unsigned char 
;;		 -> UpdateDisplay@adcOutput(16), 
;;  _val            4   17[BANK0 ] struct .
;;  c               1   22[BANK0 ] char 
;;  prec            1   16[BANK0 ] char 
;;  flag            1   15[BANK0 ] unsigned char 
;;  ap              1   14[BANK0 ] PTR void [1]
;;		 -> ?_sprintf(2), 
;; Return value:  Size  Location     Type
;;                  2    6[BANK0 ] int 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text775
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
	
i1l10505:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	i1l10557
	
i1l6698:	
	line	542
	
i1l10507:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u390_21
	goto	u390_20
u390_21:
	goto	i1l6699
u390_20:
	line	545
	
i1l10509:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l10511:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	i1l10557
	line	547
	
i1l6699:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	i1l10515
	line	640
	
i1l6701:	
	line	641
	goto	i1l10559
	line	700
	
i1l6703:	
	goto	i1l10517
	line	701
	
i1l6704:	
	line	702
	goto	i1l10517
	line	805
	
i1l6706:	
	line	816
	goto	i1l10557
	line	825
	
i1l10513:	
	goto	i1l10517
	line	638
	
i1l6700:	
	
i1l10515:	
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
	goto	i1l10559
	xorlw	100^0	; case 100
	skipnz
	goto	i1l10517
	xorlw	105^100	; case 105
	skipnz
	goto	i1l10517
	goto	i1l10557
	opt asmopt_on

	line	825
	
i1l6705:	
	line	1254
	
i1l10517:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
i1l10519:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
i1l10521:	
	btfss	(sprintf@_val+1),7
	goto	u391_21
	goto	u391_20
u391_21:
	goto	i1l10527
u391_20:
	line	1257
	
i1l10523:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
i1l10525:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	i1l10527
	line	1259
	
i1l6707:	
	line	1300
	
i1l10527:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
i1l10529:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l10533
u392_20:
	goto	i1l10541
	
i1l10531:	
	goto	i1l10541
	line	1301
	
i1l6708:	
	
i1l10533:	
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
	goto	u393_25
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u393_25:
	skipnc
	goto	u393_21
	goto	u393_20
u393_21:
	goto	i1l10537
u393_20:
	goto	i1l10541
	line	1302
	
i1l10535:	
	goto	i1l10541
	
i1l6710:	
	line	1300
	
i1l10537:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
i1l10539:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u394_21
	goto	u394_20
u394_21:
	goto	i1l10533
u394_20:
	goto	i1l10541
	
i1l6709:	
	line	1433
	
i1l10541:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u395_21
	goto	u395_20
u395_21:
	goto	i1l10547
u395_20:
	line	1434
	
i1l10543:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l10545:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l10547
	
i1l6711:	
	line	1467
	
i1l10547:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	i1l10555
	
i1l6713:	
	line	1484
	
i1l10549:	
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
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	
i1l10551:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l10553:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l10555
	line	1517
	
i1l6712:	
	line	1469
	
i1l10555:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u396_21
	goto	u396_20
u396_21:
	goto	i1l10549
u396_20:
	goto	i1l10557
	
i1l6714:	
	goto	i1l10557
	line	1525
	
i1l6697:	
	line	540
	
i1l10557:	
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
	goto	u397_21
	goto	u397_20
u397_21:
	goto	i1l10507
u397_20:
	goto	i1l10559
	
i1l6715:	
	goto	i1l10559
	line	1527
	
i1l6702:	
	line	1530
	
i1l10559:	
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	i1l6716
	line	1532
	
i1l10561:	
	line	1533
;	Return value of _sprintf is never used
	
i1l6716:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ADCconvert
psect	text776,local,class=CODE,delta=2
global __ptext776
__ptext776:

;; *************** function _ADCconvert *****************
;; Defined at:
;;		line 33 in file "H:\Aldnoah.Zero\trunk\Assignment3\infrared.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___wmul
;;		___lwdiv
;; This function is called by:
;;		_readAvgDistance
;; This function uses a non-reentrant model
;;
psect	text776
	file	"H:\Aldnoah.Zero\trunk\Assignment3\infrared.c"
	line	33
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [wreg+status,2+status,0+pclath+cstack]
	line	39
	
i1l10273:	
;infrared.c: 39: if (adcVal >= 213 && adcVal < 234)
	movlw	high(0D5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u347_21
	goto	u347_20
u347_21:
	goto	i1l10279
u347_20:
	
i1l10275:	
	movlw	high(0EAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0EAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l10279
u348_20:
	line	41
	
i1l10277:	
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
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	low(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_distance)^080h	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(0Fh)
	movwf	1+(_distance)^080h	;volatile
	line	42
;infrared.c: 42: }
	goto	i1l2963
	line	43
	
i1l2950:	
	
i1l10279:	
;infrared.c: 43: else if (adcVal >= 170 && adcVal < 213)
	movlw	high(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u349_21
	goto	u349_20
u349_21:
	goto	i1l10285
u349_20:
	
i1l10281:	
	movlw	high(0D5h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l10285
u350_20:
	line	45
	
i1l10283:	
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
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	low(014h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_distance)^080h	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(014h)
	movwf	1+(_distance)^080h	;volatile
	line	46
;infrared.c: 46: }
	goto	i1l2963
	line	47
	
i1l2952:	
	
i1l10285:	
;infrared.c: 47: else if (adcVal >= 128 && adcVal < 170)
	movlw	high(080h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u351_21
	goto	u351_20
u351_21:
	goto	i1l10291
u351_20:
	
i1l10287:	
	movlw	high(0AAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l10291
u352_20:
	line	49
	
i1l10289:	
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
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	low(01Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_distance)^080h	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(01Eh)
	movwf	1+(_distance)^080h	;volatile
	line	50
;infrared.c: 50: }
	goto	i1l2963
	line	51
	
i1l2954:	
	
i1l10291:	
;infrared.c: 51: else if (adcVal >= 107 && adcVal < 128)
	movlw	high(06Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u353_21
	goto	u353_20
u353_21:
	goto	i1l10297
u353_20:
	
i1l10293:	
	movlw	high(080h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l10297
u354_20:
	line	53
	
i1l10295:	
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
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	low(028h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_distance)^080h	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(028h)
	movwf	1+(_distance)^080h	;volatile
	line	54
;infrared.c: 54: }
	goto	i1l2963
	line	55
	
i1l2956:	
	
i1l10297:	
;infrared.c: 55: else if (adcVal >= 77 && adcVal < 107)
	movlw	high(04Dh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l10303
u355_20:
	
i1l10299:	
	movlw	high(06Bh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u356_21
	goto	u356_20
u356_21:
	goto	i1l10303
u356_20:
	line	57
	
i1l10301:	
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
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	low(032h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_distance)^080h	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(032h)
	movwf	1+(_distance)^080h	;volatile
	line	58
;infrared.c: 58: }
	goto	i1l2963
	line	59
	
i1l2958:	
	
i1l10303:	
;infrared.c: 59: else if (adcVal >= 56 && adcVal < 77)
	movlw	high(038h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u357_21
	goto	u357_20
u357_21:
	goto	i1l10309
u357_20:
	
i1l10305:	
	movlw	high(04Dh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u358_21
	goto	u358_20
u358_21:
	goto	i1l10309
u358_20:
	line	61
	
i1l10307:	
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
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	low(03Ch)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_distance)^080h	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(03Ch)
	movwf	1+(_distance)^080h	;volatile
	line	62
;infrared.c: 62: }
	goto	i1l2963
	line	63
	
i1l2960:	
	
i1l10309:	
;infrared.c: 63: else if (adcVal >= 43 && adcVal < 56)
	movlw	high(02Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(02Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u359_21
	goto	u359_20
u359_21:
	goto	i1l2963
u359_20:
	
i1l10311:	
	movlw	high(038h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u360_21
	goto	u360_20
u360_21:
	goto	i1l2963
u360_20:
	line	65
	
i1l10313:	
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
	movf	(1+(?___wmul)),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(0+(?___wmul)),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	addlw	low(046h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_distance)^080h	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(046h)
	movwf	1+(_distance)^080h	;volatile
	goto	i1l2963
	line	66
	
i1l2962:	
	goto	i1l2963
	line	67
	
i1l2961:	
	goto	i1l2963
	
i1l2959:	
	goto	i1l2963
	
i1l2957:	
	goto	i1l2963
	
i1l2955:	
	goto	i1l2963
	
i1l2953:	
	goto	i1l2963
	
i1l2951:	
	
i1l2963:	
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,88
	global	_ReadButtons
psect	text777,local,class=CODE,delta=2
global __ptext777
__ptext777:

;; *************** function _ReadButtons *****************
;; Defined at:
;;		line 141 in file "H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
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
psect	text777
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	141
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 2
; Regs used in _ReadButtons: [wreg+status,2+status,0+pclath+cstack]
	line	142
	
i1l10177:	
;HMI.c: 142: Debounce();
	fcall	_Debounce
	line	144
	
i1l10179:	
;HMI.c: 144: if(UpPressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u340_21
	goto	u340_20
u340_21:
	goto	i1l5201
u340_20:
	line	146
	
i1l10181:	
;HMI.c: 145: {
;HMI.c: 146: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	147
	
i1l10183:	
;HMI.c: 147: return 1;
	movlw	(01h)
	goto	i1l5202
	
i1l10185:	
	goto	i1l5202
	line	149
	
i1l5201:	
	line	151
;HMI.c: 149: }
;HMI.c: 151: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u341_21
	goto	u341_20
u341_21:
	goto	i1l5203
u341_20:
	line	153
	
i1l10187:	
;HMI.c: 152: {
;HMI.c: 153: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	154
	
i1l10189:	
;HMI.c: 154: return 2;
	movlw	(02h)
	goto	i1l5202
	
i1l10191:	
	goto	i1l5202
	line	156
	
i1l5203:	
	line	157
;HMI.c: 156: }
;HMI.c: 157: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u342_21
	goto	u342_20
u342_21:
	goto	i1l5204
u342_20:
	line	159
	
i1l10193:	
;HMI.c: 158: {
;HMI.c: 159: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	160
	
i1l10195:	
;HMI.c: 160: return 3;
	movlw	(03h)
	goto	i1l5202
	
i1l10197:	
	goto	i1l5202
	line	162
	
i1l5204:	
	line	163
;HMI.c: 162: }
;HMI.c: 163: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u343_21
	goto	u343_20
u343_21:
	goto	i1l5205
u343_20:
	line	165
	
i1l10199:	
;HMI.c: 164: {
;HMI.c: 165: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	166
	
i1l10201:	
;HMI.c: 166: return 4;
	movlw	(04h)
	goto	i1l5202
	
i1l10203:	
	goto	i1l5202
	line	168
	
i1l5205:	
	line	170
;HMI.c: 168: }
;HMI.c: 170: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l10211
u344_20:
	line	172
	
i1l10205:	
;HMI.c: 171: {
;HMI.c: 172: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	173
	
i1l10207:	
;HMI.c: 173: return 5;
	movlw	(05h)
	goto	i1l5202
	
i1l10209:	
	goto	i1l5202
	line	175
	
i1l5206:	
	line	176
	
i1l10211:	
;HMI.c: 175: }
;HMI.c: 176: return 0;
	movlw	(0)
	goto	i1l5202
	
i1l10213:	
	line	177
	
i1l5202:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
	global	_lcd_write_data
psect	text778,local,class=CODE,delta=2
global __ptext778
__ptext778:

;; *************** function _lcd_write_data *****************
;; Defined at:
;;		line 30 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  databyte        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  databyte        1    2[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_write_string
;;		_lcd_write_2_digit_bcd
;;		_lcd_write_3_digit_bcd
;; This function uses a non-reentrant model
;;
psect	text778
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	30
	global	__size_of_lcd_write_data
	__size_of_lcd_write_data	equ	__end_of_lcd_write_data-_lcd_write_data
	
_lcd_write_data:	
	opt	stack 1
; Regs used in _lcd_write_data: [wreg]
;lcd_write_data@databyte stored from wreg
	movwf	(lcd_write_data@databyte)
	line	31
	
i1l10011:	
;lcd.c: 31: RE2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(74/8),(74)&7
	line	32
;lcd.c: 32: RE1 = 0;
	bcf	(73/8),(73)&7
	line	33
;lcd.c: 33: RE0 = 1;
	bsf	(72/8),(72)&7
	line	34
	
i1l10013:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
i1l10015:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
i1l10017:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u436_27:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u436_27
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u436_27
opt asmopt_on

	line	38
	
i1l1402:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_data
	__end_of_lcd_write_data:
;; =============== function _lcd_write_data ends ============

	signat	_lcd_write_data,4216
	global	_adc_read_channel
psect	text779,local,class=CODE,delta=2
global __ptext779
__ptext779:

;; *************** function _adc_read_channel *****************
;; Defined at:
;;		line 5 in file "E:\Aldnoah.Zero\Assignment3\adc.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1    7[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_adc_read
;; This function is called by:
;;		_readDistance
;; This function uses a non-reentrant model
;;
psect	text779
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	5
	global	__size_of_adc_read_channel
	__size_of_adc_read_channel	equ	__end_of_adc_read_channel-_adc_read_channel
	
_adc_read_channel:	
	opt	stack 0
; Regs used in _adc_read_channel: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;adc_read_channel@channel stored from wreg
	movwf	(adc_read_channel@channel)
	line	6
	
i1l9985:	
;adc.c: 6: switch(channel)
	goto	i1l9993
	line	8
;adc.c: 7: {
;adc.c: 8: case 0:
	
i1l690:	
	line	9
;adc.c: 9: CHS0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(251/8),(251)&7
	line	10
;adc.c: 10: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	11
;adc.c: 11: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	12
;adc.c: 12: break;
	goto	i1l9995
	line	13
;adc.c: 13: case 1:
	
i1l692:	
	line	14
;adc.c: 14: CHS0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(251/8),(251)&7
	line	15
;adc.c: 15: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	16
;adc.c: 16: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	17
;adc.c: 17: break;
	goto	i1l9995
	line	18
;adc.c: 18: case 2:
	
i1l693:	
	line	19
;adc.c: 19: CHS0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(251/8),(251)&7
	line	20
;adc.c: 20: CHS1 = 1;
	bsf	(252/8),(252)&7
	line	21
;adc.c: 21: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	22
;adc.c: 22: break;
	goto	i1l9995
	line	23
;adc.c: 23: case 3:
	
i1l694:	
	line	24
;adc.c: 24: CHS0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(251/8),(251)&7
	line	25
;adc.c: 25: CHS1 = 1;
	bsf	(252/8),(252)&7
	line	26
;adc.c: 26: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	27
;adc.c: 27: break;
	goto	i1l9995
	line	28
;adc.c: 28: case 4:
	
i1l695:	
	line	29
;adc.c: 29: CHS0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(251/8),(251)&7
	line	30
;adc.c: 30: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	31
;adc.c: 31: CHS2 = 1;
	bsf	(253/8),(253)&7
	line	32
;adc.c: 32: break;
	goto	i1l9995
	line	35
;adc.c: 35: default:
	
i1l696:	
	line	36
	
i1l9987:	
;adc.c: 36: return 0;
	movlw	(0)
	goto	i1l697
	
i1l9989:	
	goto	i1l697
	line	37
	
i1l9991:	
;adc.c: 37: }
	goto	i1l9995
	line	6
	
i1l689:	
	
i1l9993:	
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
	goto	i1l690
	xorlw	1^0	; case 1
	skipnz
	goto	i1l692
	xorlw	2^1	; case 2
	skipnz
	goto	i1l693
	xorlw	3^2	; case 3
	skipnz
	goto	i1l694
	xorlw	4^3	; case 4
	skipnz
	goto	i1l695
	goto	i1l9987
	opt asmopt_on

	line	37
	
i1l691:	
	line	39
	
i1l9995:	
;adc.c: 39: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u437_27:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u437_27
opt asmopt_on

	line	41
	
i1l9997:	
;adc.c: 41: return adc_read();
	fcall	_adc_read
	movf	(0+(?_adc_read)),w
	goto	i1l697
	
i1l9999:	
	line	43
	
i1l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
psect	text780,local,class=CODE,delta=2
global __ptext780
__ptext780:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text780
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
i1l10639:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u417_21
	goto	u417_20
u417_21:
	goto	i1l10643
u417_20:
	line	10
	
i1l10641:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	i1l10643
	line	12
	
i1l7607:	
	line	13
	
i1l10643:	
	btfss	(___awmod@divisor+1),7
	goto	u418_21
	goto	u418_20
u418_21:
	goto	i1l10647
u418_20:
	line	14
	
i1l10645:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	i1l10647
	
i1l7608:	
	line	15
	
i1l10647:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u419_21
	goto	u419_20
u419_21:
	goto	i1l10665
u419_20:
	line	16
	
i1l10649:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	i1l10655
	
i1l7611:	
	line	18
	
i1l10651:	
	movlw	01h
	
u420_25:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u420_25
	line	19
	
i1l10653:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	i1l10655
	line	20
	
i1l7610:	
	line	17
	
i1l10655:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u421_21
	goto	u421_20
u421_21:
	goto	i1l10651
u421_20:
	goto	i1l10657
	
i1l7612:	
	goto	i1l10657
	line	21
	
i1l7613:	
	line	22
	
i1l10657:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u422_25
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u422_25:
	skipc
	goto	u422_21
	goto	u422_20
u422_21:
	goto	i1l10661
u422_20:
	line	23
	
i1l10659:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	i1l10661
	
i1l7614:	
	line	24
	
i1l10661:	
	movlw	01h
	
u423_25:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u423_25
	line	25
	
i1l10663:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u424_21
	goto	u424_20
u424_21:
	goto	i1l10657
u424_20:
	goto	i1l10665
	
i1l7615:	
	goto	i1l10665
	line	26
	
i1l7609:	
	line	27
	
i1l10665:	
	movf	(___awmod@sign),w
	skipz
	goto	u425_20
	goto	i1l10669
u425_20:
	line	28
	
i1l10667:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	i1l10669
	
i1l7616:	
	line	29
	
i1l10669:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	i1l7617
	
i1l10671:	
	line	30
	
i1l7617:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___lwmod
psect	text781,local,class=CODE,delta=2
global __ptext781
__ptext781:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] unsigned int 
;;  dividend        2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr1
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text781
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l10617:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l10635
u411_20:
	line	9
	
i1l10619:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	i1l10625
	
i1l7417:	
	line	11
	
i1l10621:	
	movlw	01h
	
u412_25:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u412_25
	line	12
	
i1l10623:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	i1l10625
	line	13
	
i1l7416:	
	line	10
	
i1l10625:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u413_21
	goto	u413_20
u413_21:
	goto	i1l10621
u413_20:
	goto	i1l10627
	
i1l7418:	
	goto	i1l10627
	line	14
	
i1l7419:	
	line	15
	
i1l10627:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u414_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u414_25:
	skipc
	goto	u414_21
	goto	u414_20
u414_21:
	goto	i1l10631
u414_20:
	line	16
	
i1l10629:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	i1l10631
	
i1l7420:	
	line	17
	
i1l10631:	
	movlw	01h
	
u415_25:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u415_25
	line	18
	
i1l10633:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u416_21
	goto	u416_20
u416_21:
	goto	i1l10627
u416_20:
	goto	i1l10635
	
i1l7421:	
	goto	i1l10635
	line	19
	
i1l7415:	
	line	20
	
i1l10635:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	i1l7422
	
i1l10637:	
	line	21
	
i1l7422:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text782,local,class=CODE,delta=2
global __ptext782
__ptext782:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[COMMON] unsigned int 
;;  dividend        2    8[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   11[COMMON] unsigned int 
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_readAvgDistance
;;		_ADCconvert
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text782
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
i1l10591:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
i1l10593:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u404_21
	goto	u404_20
u404_21:
	goto	i1l10613
u404_20:
	line	11
	
i1l10595:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	i1l10601
	
i1l7407:	
	line	13
	
i1l10597:	
	movlw	01h
	
u405_25:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u405_25
	line	14
	
i1l10599:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	i1l10601
	line	15
	
i1l7406:	
	line	12
	
i1l10601:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u406_21
	goto	u406_20
u406_21:
	goto	i1l10597
u406_20:
	goto	i1l10603
	
i1l7408:	
	goto	i1l10603
	line	16
	
i1l7409:	
	line	17
	
i1l10603:	
	movlw	01h
	
u407_25:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u407_25
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u408_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u408_25:
	skipc
	goto	u408_21
	goto	u408_20
u408_21:
	goto	i1l10609
u408_20:
	line	19
	
i1l10605:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
i1l10607:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l10609
	line	21
	
i1l7410:	
	line	22
	
i1l10609:	
	movlw	01h
	
u409_25:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u409_25
	line	23
	
i1l10611:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u410_21
	goto	u410_20
u410_21:
	goto	i1l10603
u410_20:
	goto	i1l10613
	
i1l7411:	
	goto	i1l10613
	line	24
	
i1l7405:	
	line	25
	
i1l10613:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	i1l7412
	
i1l10615:	
	line	26
	
i1l7412:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text783,local,class=CODE,delta=2
global __ptext783
__ptext783:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[COMMON] unsigned int 
;;  multiplicand    2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[COMMON] unsigned int 
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
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCconvert
;; This function uses a non-reentrant model
;;
psect	text783
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 1
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
i1l10579:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	i1l10581
	line	6
	
i1l7399:	
	line	7
	
i1l10581:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u400_21
	goto	u400_20
u400_21:
	goto	i1l7400
u400_20:
	line	8
	
i1l10583:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
i1l7400:	
	line	9
	movlw	01h
	
u401_25:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u401_25
	line	10
	
i1l10585:	
	movlw	01h
	
u402_25:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u402_25
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u403_21
	goto	u403_20
u403_21:
	goto	i1l10581
u403_20:
	goto	i1l10587
	
i1l7401:	
	line	12
	
i1l10587:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	i1l7402
	
i1l10589:	
	line	13
	
i1l7402:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_Debounce
psect	text784,local,class=CODE,delta=2
global __ptext784
__ptext784:

;; *************** function _Debounce *****************
;; Defined at:
;;		line 61 in file "H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
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
psect	text784
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	61
	global	__size_of_Debounce
	__size_of_Debounce	equ	__end_of_Debounce-_Debounce
	
_Debounce:	
	opt	stack 2
; Regs used in _Debounce: [wreg+status,2+status,0]
	line	63
	
i1l10463:	
;HMI.c: 63: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u375_21
	goto	u375_20
u375_21:
	goto	i1l5183
u375_20:
	line	65
	
i1l10465:	
;HMI.c: 64: {
;HMI.c: 65: UpDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_UpDebounceCount),f	;volatile
	line	66
	
i1l10467:	
;HMI.c: 66: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount),w	;volatile
	skipc
	goto	u376_21
	goto	u376_20
u376_21:
	goto	i1l5185
u376_20:
	
i1l10469:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u377_21
	goto	u377_20
u377_21:
	goto	i1l5185
u377_20:
	line	68
	
i1l10471:	
;HMI.c: 67: {
;HMI.c: 68: UpPressed = 1;
	bsf	(_UpPressed/8),(_UpPressed)&7
	line	69
;HMI.c: 69: UpReleased = 0;
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l5185
	line	70
	
i1l5184:	
	line	71
;HMI.c: 70: }
;HMI.c: 71: }
	goto	i1l5185
	line	72
	
i1l5183:	
	line	74
;HMI.c: 72: else
;HMI.c: 73: {
;HMI.c: 74: UpDebounceCount = 0;
	clrf	(_UpDebounceCount)	;volatile
	line	75
;HMI.c: 75: UpReleased = 1;
	bsf	(_UpReleased/8),(_UpReleased)&7
	line	76
	
i1l5185:	
	line	79
;HMI.c: 76: }
;HMI.c: 79: if(!RB3)
	btfsc	(51/8),(51)&7
	goto	u378_21
	goto	u378_20
u378_21:
	goto	i1l5186
u378_20:
	line	81
	
i1l10473:	
;HMI.c: 80: {
;HMI.c: 81: DownDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_DownDebounceCount),f	;volatile
	line	82
	
i1l10475:	
;HMI.c: 82: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount),w	;volatile
	skipc
	goto	u379_21
	goto	u379_20
u379_21:
	goto	i1l5188
u379_20:
	
i1l10477:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u380_21
	goto	u380_20
u380_21:
	goto	i1l5188
u380_20:
	line	84
	
i1l10479:	
;HMI.c: 83: {
;HMI.c: 84: DownPressed = 1;
	bsf	(_DownPressed/8),(_DownPressed)&7
	line	85
;HMI.c: 85: DownReleased = 0;
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l5188
	line	86
	
i1l5187:	
	line	87
;HMI.c: 86: }
;HMI.c: 87: }
	goto	i1l5188
	line	88
	
i1l5186:	
	line	90
;HMI.c: 88: else
;HMI.c: 89: {
;HMI.c: 90: DownDebounceCount = 0;
	clrf	(_DownDebounceCount)	;volatile
	line	91
;HMI.c: 91: DownReleased = 1;
	bsf	(_DownReleased/8),(_DownReleased)&7
	line	92
	
i1l5188:	
	line	94
;HMI.c: 92: }
;HMI.c: 94: if(!RB4)
	btfsc	(52/8),(52)&7
	goto	u381_21
	goto	u381_20
u381_21:
	goto	i1l5189
u381_20:
	line	96
	
i1l10481:	
;HMI.c: 95: {
;HMI.c: 96: LeftDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_LeftDebounceCount),f	;volatile
	line	97
	
i1l10483:	
;HMI.c: 97: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount),w	;volatile
	skipc
	goto	u382_21
	goto	u382_20
u382_21:
	goto	i1l5191
u382_20:
	
i1l10485:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u383_21
	goto	u383_20
u383_21:
	goto	i1l5191
u383_20:
	line	99
	
i1l10487:	
;HMI.c: 98: {
;HMI.c: 99: LeftPressed = 1;
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	line	100
;HMI.c: 100: LeftReleased = 0;
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l5191
	line	101
	
i1l5190:	
	line	102
;HMI.c: 101: }
;HMI.c: 102: }
	goto	i1l5191
	line	103
	
i1l5189:	
	line	105
;HMI.c: 103: else
;HMI.c: 104: {
;HMI.c: 105: LeftDebounceCount = 0;
	clrf	(_LeftDebounceCount)	;volatile
	line	106
;HMI.c: 106: LeftReleased = 1;
	bsf	(_LeftReleased/8),(_LeftReleased)&7
	line	107
	
i1l5191:	
	line	109
;HMI.c: 107: }
;HMI.c: 109: if(!RB5)
	btfsc	(53/8),(53)&7
	goto	u384_21
	goto	u384_20
u384_21:
	goto	i1l5192
u384_20:
	line	111
	
i1l10489:	
;HMI.c: 110: {
;HMI.c: 111: RightDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_RightDebounceCount),f	;volatile
	line	112
	
i1l10491:	
;HMI.c: 112: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount),w	;volatile
	skipc
	goto	u385_21
	goto	u385_20
u385_21:
	goto	i1l5194
u385_20:
	
i1l10493:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u386_21
	goto	u386_20
u386_21:
	goto	i1l5194
u386_20:
	line	114
	
i1l10495:	
;HMI.c: 113: {
;HMI.c: 114: RightPressed = 1;
	bsf	(_RightPressed/8),(_RightPressed)&7
	line	115
;HMI.c: 115: RightReleased = 0;
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l5194
	line	116
	
i1l5193:	
	line	117
;HMI.c: 116: }
;HMI.c: 117: }
	goto	i1l5194
	line	118
	
i1l5192:	
	line	120
;HMI.c: 118: else
;HMI.c: 119: {
;HMI.c: 120: RightDebounceCount = 0;
	clrf	(_RightDebounceCount)	;volatile
	line	121
;HMI.c: 121: RightReleased = 1;
	bsf	(_RightReleased/8),(_RightReleased)&7
	line	122
	
i1l5194:	
	line	124
;HMI.c: 122: }
;HMI.c: 124: if(!RB6)
	btfsc	(54/8),(54)&7
	goto	u387_21
	goto	u387_20
u387_21:
	goto	i1l5195
u387_20:
	line	126
	
i1l10497:	
;HMI.c: 125: {
;HMI.c: 126: CenterDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_CenterDebounceCount),f	;volatile
	line	127
	
i1l10499:	
;HMI.c: 127: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount),w	;volatile
	skipc
	goto	u388_21
	goto	u388_20
u388_21:
	goto	i1l5198
u388_20:
	
i1l10501:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u389_21
	goto	u389_20
u389_21:
	goto	i1l5198
u389_20:
	line	129
	
i1l10503:	
;HMI.c: 128: {
;HMI.c: 129: CenterPressed = 1;
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	line	130
;HMI.c: 130: CenterReleased = 0;
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l5198
	line	131
	
i1l5196:	
	line	132
;HMI.c: 131: }
;HMI.c: 132: }
	goto	i1l5198
	line	133
	
i1l5195:	
	line	135
;HMI.c: 133: else
;HMI.c: 134: {
;HMI.c: 135: CenterDebounceCount = 0;
	clrf	(_CenterDebounceCount)	;volatile
	line	136
;HMI.c: 136: CenterReleased = 1;
	bsf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l5198
	line	137
	
i1l5197:	
	line	138
	
i1l5198:	
	return
	opt stack 0
GLOBAL	__end_of_Debounce
	__end_of_Debounce:
;; =============== function _Debounce ends ============

	signat	_Debounce,88
	global	_adc_read
psect	text785,local,class=CODE,delta=2
global __ptext785
__ptext785:

;; *************** function _adc_read *****************
;; Defined at:
;;		line 61 in file "E:\Aldnoah.Zero\Assignment3\adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adc_value       2    4[COMMON] volatile unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_adc_read_channel
;; This function uses a non-reentrant model
;;
psect	text785
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	64
	
i1l10001:	
;adc.c: 62: volatile unsigned int adc_value;
;adc.c: 64: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	66
	
i1l10003:	
;adc.c: 66: GO = 1;
	bsf	(250/8),(250)&7
	line	67
;adc.c: 67: while(GO) continue;
	goto	i1l703
	
i1l704:	
	
i1l703:	
	btfsc	(250/8),(250)&7
	goto	u319_21
	goto	u319_20
u319_21:
	goto	i1l703
u319_20:
	
i1l705:	
	line	68
# 68 "E:\Aldnoah.Zero\Assignment3\adc.c"
nop ;#
	line	69
# 69 "E:\Aldnoah.Zero\Assignment3\adc.c"
nop ;#
	line	70
# 70 "E:\Aldnoah.Zero\Assignment3\adc.c"
nop ;#
psect	text785
	line	73
	
i1l10005:	
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
	
u320_25:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u320_25
	line	75
;adc.c: 75: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	78
	
i1l10007:	
;adc.c: 78: return (adc_value);
	movf	(adc_read@adc_value+1),w	;volatile
	clrf	(?_adc_read+1)
	addwf	(?_adc_read+1)
	movf	(adc_read@adc_value),w	;volatile
	clrf	(?_adc_read)
	addwf	(?_adc_read)

	goto	i1l706
	
i1l10009:	
	line	79
	
i1l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
psect	text786,local,class=CODE,delta=2
global __ptext786
__ptext786:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
