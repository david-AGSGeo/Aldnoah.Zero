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
# 34 "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 34 "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	dw 0xFFFE & 0xFFFB & 0xFFFF & 0xFFBF & 0xFFF7 & 0xFFFF & 0xFF7F & 0xFFFF ;#
	FNCALL	_main,_init
	FNCALL	_main,_Menu
	FNCALL	_main,_spi_transfer
	FNCALL	_main,_ser_putch
	FNCALL	_init,_init_adc
	FNCALL	_init,_lcd_init
	FNCALL	_init,_ser_init
	FNCALL	_lcd_init,_lcd_write_control
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
	global	_shortMenuStrings
	global	_current_step
	global	_menuStrings
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	35

;initializer for _shortMenuStrings
	retlw	(STR_6-__stringbase)&0ffh
	retlw	(STR_7-__stringbase)&0ffh
	retlw	(STR_8-__stringbase)&0ffh
	retlw	(STR_9-__stringbase)&0ffh
	retlw	(STR_10-__stringbase)&0ffh
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	21

;initializer for _current_step
	retlw	03Ch
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	34

;initializer for _menuStrings
	retlw	(STR_1-__stringbase)&0ffh
	retlw	(STR_2-__stringbase)&0ffh
	retlw	(STR_3-__stringbase)&0ffh
	retlw	(STR_4-__stringbase)&0ffh
	retlw	(STR_5-__stringbase)&0ffh
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
	global	_distance
	global	_pos
	global	_CenterDebounceCount
	global	_DownDebounceCount
	global	_LeftDebounceCount
	global	_RightDebounceCount
	global	_UpDebounceCount
	global	_buttonPressed
	global	_current_direction
	global	_rxiptr
	global	_rxoptr
	global	_ser_tmp
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
	global	UpdateDisplay@F1206
	global	_rxfifo
	global	_txfifo
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
	global	_CS0
_CS0	set	56
	global	_CS1
_CS1	set	57
	global	_GIE
_GIE	set	95
	global	_GO
_GO	set	250
	global	_OERR
_OERR	set	193
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
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
	
STR_1:	
	retlw	84	;'T'
	retlw	104	;'h'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	49	;'1'
	retlw	0
psect	strings
	
STR_2:	
	retlw	84	;'T'
	retlw	104	;'h'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	50	;'2'
	retlw	0
psect	strings
	
STR_3:	
	retlw	84	;'T'
	retlw	104	;'h'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	51	;'3'
	retlw	0
psect	strings
	
STR_4:	
	retlw	84	;'T'
	retlw	104	;'h'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	52	;'4'
	retlw	0
psect	strings
	
STR_5:	
	retlw	84	;'T'
	retlw	104	;'h'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	53	;'5'
	retlw	0
psect	strings
	
STR_6:	
	retlw	84	;'T'
	retlw	104	;'h'
	retlw	49	;'1'
	retlw	0
psect	strings
	
STR_7:	
	retlw	84	;'T'
	retlw	104	;'h'
	retlw	50	;'2'
	retlw	0
psect	strings
	
STR_8:	
	retlw	84	;'T'
	retlw	104	;'h'
	retlw	51	;'3'
	retlw	0
psect	strings
	
STR_9:	
	retlw	84	;'T'
	retlw	104	;'h'
	retlw	52	;'4'
	retlw	0
psect	strings
	
STR_10:	
	retlw	84	;'T'
	retlw	104	;'h'
	retlw	53	;'5'
	retlw	0
psect	strings
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

_distance:
       ds      2

_pos:
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

_current_direction:
       ds      1

_rxiptr:
       ds      1

_rxoptr:
       ds      1

_ser_tmp:
       ds      1

_txiptr:
       ds      1

_txoptr:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	35
_shortMenuStrings:
       ds      5

psect	dataBANK0
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	21
_current_step:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
UpdateDisplay@F1206:
       ds      16

_rxfifo:
       ds      16

_txfifo:
       ds      16

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	34
_menuStrings:
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
	movlw	low((__pbssBANK0)+014h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+030h)
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
	movlw low(__pdataBANK1+5)
	movwf btemp-1,f
	movlw high(__pidataBANK1)
	movwf btemp,f
	movlw low(__pidataBANK1)
	movwf btemp+1,f
	movlw low(__pdataBANK1)
	movwf fsr,f
	fcall init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	movlw low(__pdataBANK0+6)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
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
	global	??_ser_init
??_ser_init:	; 0 bytes @ 0x0
	global	??_Menu
??_Menu:	; 0 bytes @ 0x0
	global	??_ser_putch
??_ser_putch:	; 0 bytes @ 0x0
	global	??_init_adc
??_init_adc:	; 0 bytes @ 0x0
	global	??_lcd_write_control
??_lcd_write_control:	; 0 bytes @ 0x0
	global	??_spi_transfer
??_spi_transfer:	; 0 bytes @ 0x0
	global	Menu@input
Menu@input:	; 1 bytes @ 0x0
	ds	1
	global	spi_transfer@temp
spi_transfer@temp:	; 1 bytes @ 0x1
	global	ser_putch@c
ser_putch@c:	; 1 bytes @ 0x1
	ds	1
	global	lcd_write_control@databyte
lcd_write_control@databyte:	; 1 bytes @ 0x2
	global	spi_transfer@data
spi_transfer@data:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	??_init
??_init:	; 0 bytes @ 0x3
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	3
	global	main@choice
main@choice:	; 1 bytes @ 0x7
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
	global	?_main
?_main:	; 0 bytes @ 0x0
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
	ds	4
	global	UpdateDisplay@adcOutput
UpdateDisplay@adcOutput:	; 16 bytes @ 0x1B
	ds	16
	global	??_isr1
??_isr1:	; 0 bytes @ 0x2B
	ds	5
;;Data sizes: Strings 70, constant 10, data 11, bss 68, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     48      76
;; BANK1           80      8      61
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
;;		 -> STR_11(CODE[15]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;;		 -> UpdateDisplay@adcOutput(BANK0[16]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK0[2]), 
;;
;; S7214$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; shortMenuStrings	PTR const unsigned char [5] size(1) Largest target is 4
;;		 -> STR_10(CODE[4]), STR_9(CODE[4]), STR_8(CODE[4]), STR_7(CODE[4]), 
;;		 -> STR_6(CODE[4]), 
;;
;; menuStrings	PTR const unsigned char [5] size(1) Largest target is 7
;;		 -> STR_5(CODE[7]), STR_4(CODE[7]), STR_3(CODE[7]), STR_2(CODE[7]), 
;;		 -> STR_1(CODE[7]), 
;;
;; lcd_write_string@s	PTR unsigned char  size(2) Largest target is 16
;;		 -> UpdateDisplay@adcOutput(BANK0[16]), STR_10(CODE[4]), STR_9(CODE[4]), STR_8(CODE[4]), 
;;		 -> STR_7(CODE[4]), STR_6(CODE[4]), STR_5(CODE[7]), STR_4(CODE[7]), 
;;		 -> STR_3(CODE[7]), STR_2(CODE[7]), STR_1(CODE[7]), 
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
;;   _main->_init
;;   _lcd_init->_lcd_write_control
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
;; (0) _main                                                 4     4      0     121
;;                                              4 BANK1      4     4      0
;;                               _init
;;                               _Menu
;;                       _spi_transfer
;;                          _ser_putch
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 1     1      0      22
;;                                              3 BANK1      1     1      0
;;                           _init_adc
;;                           _lcd_init
;;                           _ser_init
;; ---------------------------------------------------------------------------------
;; (2) _lcd_init                                             0     0      0      22
;;                  _lcd_write_control
;; ---------------------------------------------------------------------------------
;; (3) _lcd_write_control                                    3     3      0      22
;;                                              0 BANK1      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _init_adc                                             1     1      0       0
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _ser_putch                                            2     2      0      22
;;                                              0 BANK1      2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _Menu                                                 1     1      0      22
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _spi_transfer                                         3     3      0      30
;;                                              0 BANK1      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _ser_init                                             1     1      0       0
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _isr1                                                 5     5      0    2099
;;                                             43 BANK0      5     5      0
;;                            ___lwmod
;;                    _readAvgDistance
;;                      _UpdateDisplay
;;                        _ReadButtons
;; ---------------------------------------------------------------------------------
;; (5) _UpdateDisplay                                       20    20      0    1385
;;                                             23 BANK0     20    20      0
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
;;   _Menu
;;   _spi_transfer
;;   _ser_putch
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
;;BANK1               50      8      3D       7       76.3%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      A4      12        0.0%
;;ABS                  0      0      97       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       D       2        0.0%
;;BANK0               50     30      4C       5       95.0%
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
;;		line 164 in file "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  choice          1    7[BANK1 ] unsigned char 
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
;;		_spi_transfer
;;		_ser_putch
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	line	164
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	169
	
l9920:	
;Main.c: 169: init();
	fcall	_init
	goto	l9922
	line	175
;Main.c: 175: while(1)
	
l2184:	
	line	177
	
l9922:	
;Main.c: 176: {
;Main.c: 177: unsigned char choice = 255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	line	179
;Main.c: 179: switch (buttonPressed)
	goto	l9946
	line	181
;Main.c: 180: {
;Main.c: 181: case 1:
	
l2186:	
	line	182
	
l9924:	
;Main.c: 182: Menu(1);
	movlw	(01h)
	fcall	_Menu
	line	184
	
l9926:	
;Main.c: 184: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	186
;Main.c: 186: break;
	goto	l10100
	line	187
;Main.c: 187: case 2:
	
l2188:	
	line	188
	
l9928:	
;Main.c: 188: Menu(2);
	movlw	(02h)
	fcall	_Menu
	line	190
	
l9930:	
;Main.c: 190: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	192
;Main.c: 192: break;
	goto	l10100
	line	193
;Main.c: 193: case 3:
	
l2189:	
	line	194
	
l9932:	
;Main.c: 194: Menu(3);
	movlw	(03h)
	fcall	_Menu
	line	196
	
l9934:	
;Main.c: 196: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	198
;Main.c: 198: break;
	goto	l10100
	line	199
;Main.c: 199: case 4:
	
l2190:	
	line	200
	
l9936:	
;Main.c: 200: Menu(4);
	movlw	(04h)
	fcall	_Menu
	line	202
	
l9938:	
;Main.c: 202: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	204
;Main.c: 204: break;
	goto	l10100
	line	205
;Main.c: 205: case 5:
	
l2191:	
	line	206
	
l9940:	
;Main.c: 206: choice = Menu(5);
	movlw	(05h)
	fcall	_Menu
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	line	208
	
l9942:	
;Main.c: 208: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	210
;Main.c: 210: break;
	goto	l10100
	line	211
;Main.c: 211: default:
	
l2192:	
	line	213
;Main.c: 213: break;
	goto	l10100
	line	214
	
l9944:	
;Main.c: 214: }
	goto	l10100
	line	179
	
l2185:	
	
l9946:	
	bcf	status, 5	;RP0=0, select bank0
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
	goto	l9924
	xorlw	2^1	; case 2
	skipnz
	goto	l9928
	xorlw	3^2	; case 3
	skipnz
	goto	l9932
	xorlw	4^3	; case 4
	skipnz
	goto	l9936
	xorlw	5^4	; case 5
	skipnz
	goto	l9940
	goto	l10100
	opt asmopt_on

	line	214
	
l2187:	
	line	217
;Main.c: 217: switch (choice)
	goto	l10100
	line	219
;Main.c: 218: {
;Main.c: 219: case 0:
	
l2194:	
	line	220
;Main.c: 220: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	221
	
l9948:	
;Main.c: 221: spi_transfer(0b00001011);
	movlw	(0Bh)
	fcall	_spi_transfer
	line	222
	
l9950:	
;Main.c: 222: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l9952:	
	bcf	(57/8),(57)&7
	line	223
	
l9954:	
;Main.c: 223: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l9956:	
	nop
	
l9958:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	224
;Main.c: 224: break;
	goto	l10102
	line	225
;Main.c: 225: case 1:
	
l2196:	
	line	227
	
l9960:	
;Main.c: 227: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	228
	
l9962:	
;Main.c: 228: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4187:
	decfsz	((??_main+0)^080h+0),f
	goto	u4187
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4187
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4187
	nop2
opt asmopt_on

	line	229
	
l9964:	
;Main.c: 229: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	230
;Main.c: 230: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4197:
	decfsz	((??_main+0)^080h+0),f
	goto	u4197
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4197
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4197
	nop2
opt asmopt_on

	line	231
	
l9966:	
;Main.c: 231: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	233
	
l9968:	
;Main.c: 233: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	235
	
l9970:	
;Main.c: 235: ser_putch(44);
	movlw	(02Ch)
	fcall	_ser_putch
	line	237
	
l9972:	
;Main.c: 237: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	239
	
l9974:	
;Main.c: 239: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	241
	
l9976:	
;Main.c: 241: ser_putch(156);
	movlw	(09Ch)
	fcall	_ser_putch
	line	243
	
l9978:	
;Main.c: 243: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	245
	
l9980:	
;Main.c: 245: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	247
	
l9982:	
;Main.c: 247: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	249
	
l9984:	
;Main.c: 249: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	251
	
l9986:	
;Main.c: 251: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	253
	
l9988:	
;Main.c: 253: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	255
	
l9990:	
;Main.c: 255: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	257
;Main.c: 257: break;
	goto	l10102
	line	258
;Main.c: 258: case 2:
	
l2197:	
	line	259
	
l9992:	
;Main.c: 259: RB1 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	260
	
l9994:	
;Main.c: 260: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	261
	
l9996:	
;Main.c: 261: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4207:
	decfsz	((??_main+0)^080h+0),f
	goto	u4207
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4207
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4207
	nop2
opt asmopt_on

	line	262
;Main.c: 262: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	263
	
l9998:	
;Main.c: 263: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4217:
	decfsz	((??_main+0)^080h+0),f
	goto	u4217
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4217
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4217
	nop2
opt asmopt_on

	line	264
	
l10000:	
;Main.c: 264: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	265
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
u4227:
	decfsz	((??_main+0)^080h+0),f
	goto	u4227
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4227
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4227
	nop2
opt asmopt_on

	line	266
	
l10002:	
;Main.c: 266: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	267
	
l10004:	
;Main.c: 267: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4237:
	decfsz	((??_main+0)^080h+0),f
	goto	u4237
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4237
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4237
	nop2
opt asmopt_on

	line	268
;Main.c: 268: ser_putch(44);
	movlw	(02Ch)
	fcall	_ser_putch
	line	269
	
l10006:	
;Main.c: 269: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4247:
	decfsz	((??_main+0)^080h+0),f
	goto	u4247
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4247
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4247
	nop2
opt asmopt_on

	line	270
	
l10008:	
;Main.c: 270: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	271
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
u4257:
	decfsz	((??_main+0)^080h+0),f
	goto	u4257
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4257
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4257
	nop2
opt asmopt_on

	line	272
	
l10010:	
;Main.c: 272: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	273
	
l10012:	
;Main.c: 273: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4267:
	decfsz	((??_main+0)^080h+0),f
	goto	u4267
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4267
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4267
	nop2
opt asmopt_on

	line	274
;Main.c: 274: ser_putch(156);
	movlw	(09Ch)
	fcall	_ser_putch
	line	275
	
l10014:	
;Main.c: 275: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4277:
	decfsz	((??_main+0)^080h+0),f
	goto	u4277
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4277
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4277
	nop2
opt asmopt_on

	line	276
	
l10016:	
;Main.c: 276: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	277
;Main.c: 277: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4287:
	decfsz	((??_main+0)^080h+0),f
	goto	u4287
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4287
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4287
	nop2
opt asmopt_on

	line	278
	
l10018:	
;Main.c: 278: ser_putch(144);
	movlw	(090h)
	fcall	_ser_putch
	line	279
	
l10020:	
;Main.c: 279: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4297:
	decfsz	((??_main+0)^080h+0),f
	goto	u4297
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4297
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4297
	nop2
opt asmopt_on

	line	280
;Main.c: 280: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	281
	
l10022:	
;Main.c: 281: _delay((unsigned long)((100)*(20000000/4000.0)));
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

	line	282
	
l10024:	
;Main.c: 282: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	283
;Main.c: 283: _delay((unsigned long)((100)*(20000000/4000.0)));
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

	line	284
	
l10026:	
;Main.c: 284: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	285
	
l10028:	
;Main.c: 285: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4327:
	decfsz	((??_main+0)^080h+0),f
	goto	u4327
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4327
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4327
	nop2
opt asmopt_on

	line	286
;Main.c: 286: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	287
	
l10030:	
;Main.c: 287: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4337:
	decfsz	((??_main+0)^080h+0),f
	goto	u4337
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4337
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4337
	nop2
opt asmopt_on

	line	288
	
l10032:	
;Main.c: 288: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	289
;Main.c: 289: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4347:
	decfsz	((??_main+0)^080h+0),f
	goto	u4347
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4347
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4347
	nop2
opt asmopt_on

	line	291
;Main.c: 291: break;
	goto	l10102
	line	292
;Main.c: 292: case 3:
	
l2198:	
	line	293
	
l10034:	
;Main.c: 293: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	294
	
l10036:	
;Main.c: 294: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4357:
	decfsz	((??_main+0)^080h+0),f
	goto	u4357
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4357
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4357
	nop2
opt asmopt_on

	line	295
	
l10038:	
;Main.c: 295: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	296
;Main.c: 296: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4367:
	decfsz	((??_main+0)^080h+0),f
	goto	u4367
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4367
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4367
	nop2
opt asmopt_on

	line	298
;Main.c: 298: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4377:
	decfsz	((??_main+0)^080h+0),f
	goto	u4377
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4377
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4377
	nop2
opt asmopt_on

	line	300
;Main.c: 300: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4387:
	decfsz	((??_main+0)^080h+0),f
	goto	u4387
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4387
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4387
	nop2
opt asmopt_on

	line	301
	
l10040:	
;Main.c: 301: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	302
	
l10042:	
;Main.c: 302: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4397:
	decfsz	((??_main+0)^080h+0),f
	goto	u4397
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4397
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4397
	nop2
opt asmopt_on

	line	303
;Main.c: 303: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	304
	
l10044:	
;Main.c: 304: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4407:
	decfsz	((??_main+0)^080h+0),f
	goto	u4407
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4407
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4407
	nop2
opt asmopt_on

	line	305
	
l10046:	
;Main.c: 305: ser_putch(44);
	movlw	(02Ch)
	fcall	_ser_putch
	line	306
;Main.c: 306: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4417:
	decfsz	((??_main+0)^080h+0),f
	goto	u4417
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4417
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4417
	nop2
opt asmopt_on

	line	307
	
l10048:	
;Main.c: 307: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	308
	
l10050:	
;Main.c: 308: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4427:
	decfsz	((??_main+0)^080h+0),f
	goto	u4427
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4427
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4427
	nop2
opt asmopt_on

	line	309
;Main.c: 309: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	310
	
l10052:	
;Main.c: 310: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4437:
	decfsz	((??_main+0)^080h+0),f
	goto	u4437
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4437
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4437
	nop2
opt asmopt_on

	line	311
	
l10054:	
;Main.c: 311: ser_putch(156);
	movlw	(09Ch)
	fcall	_ser_putch
	line	312
;Main.c: 312: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4447:
	decfsz	((??_main+0)^080h+0),f
	goto	u4447
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4447
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4447
	nop2
opt asmopt_on

	line	313
	
l10056:	
;Main.c: 313: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	314
	
l10058:	
;Main.c: 314: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4457:
	decfsz	((??_main+0)^080h+0),f
	goto	u4457
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4457
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4457
	nop2
opt asmopt_on

	line	315
;Main.c: 315: ser_putch(144);
	movlw	(090h)
	fcall	_ser_putch
	line	316
	
l10060:	
;Main.c: 316: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4467:
	decfsz	((??_main+0)^080h+0),f
	goto	u4467
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4467
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4467
	nop2
opt asmopt_on

	line	317
	
l10062:	
;Main.c: 317: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	318
;Main.c: 318: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4477:
	decfsz	((??_main+0)^080h+0),f
	goto	u4477
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4477
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4477
	nop2
opt asmopt_on

	line	319
	
l10064:	
;Main.c: 319: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	320
	
l10066:	
;Main.c: 320: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4487:
	decfsz	((??_main+0)^080h+0),f
	goto	u4487
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4487
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4487
	nop2
opt asmopt_on

	line	321
;Main.c: 321: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	322
	
l10068:	
;Main.c: 322: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4497:
	decfsz	((??_main+0)^080h+0),f
	goto	u4497
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4497
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4497
	nop2
opt asmopt_on

	line	323
	
l10070:	
;Main.c: 323: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	324
;Main.c: 324: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4507:
	decfsz	((??_main+0)^080h+0),f
	goto	u4507
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4507
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4507
	nop2
opt asmopt_on

	line	325
	
l10072:	
;Main.c: 325: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	326
	
l10074:	
;Main.c: 326: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4517:
	decfsz	((??_main+0)^080h+0),f
	goto	u4517
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4517
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4517
	nop2
opt asmopt_on

	line	328
	
l10076:	
;Main.c: 328: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4527:
	decfsz	((??_main+0)^080h+0),f
	goto	u4527
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4527
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4527
	nop2
opt asmopt_on

	line	330
;Main.c: 330: break;
	goto	l10102
	line	331
;Main.c: 331: case 4:
	
l2199:	
	line	333
	
l10078:	
;Main.c: 333: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	334
	
l10080:	
;Main.c: 334: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4537:
	decfsz	((??_main+0)^080h+0),f
	goto	u4537
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4537
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4537
	nop2
opt asmopt_on

	line	335
	
l10082:	
;Main.c: 335: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	336
;Main.c: 336: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4547:
	decfsz	((??_main+0)^080h+0),f
	goto	u4547
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4547
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4547
	nop2
opt asmopt_on

	line	337
	
l10084:	
;Main.c: 337: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	338
	
l10086:	
;Main.c: 338: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4557:
	decfsz	((??_main+0)^080h+0),f
	goto	u4557
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4557
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4557
	nop2
opt asmopt_on

	line	339
;Main.c: 339: ser_putch(256);
	movlw	(0)
	fcall	_ser_putch
	line	340
	
l10088:	
;Main.c: 340: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4567:
	decfsz	((??_main+0)^080h+0),f
	goto	u4567
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4567
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4567
	nop2
opt asmopt_on

	line	341
	
l10090:	
;Main.c: 341: ser_putch(38);
	movlw	(026h)
	fcall	_ser_putch
	line	342
;Main.c: 342: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4577:
	decfsz	((??_main+0)^080h+0),f
	goto	u4577
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4577
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4577
	nop2
opt asmopt_on

	line	343
	
l10092:	
;Main.c: 343: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	344
	
l10094:	
;Main.c: 344: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4587:
	decfsz	((??_main+0)^080h+0),f
	goto	u4587
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4587
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4587
	nop2
opt asmopt_on

	line	345
;Main.c: 345: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	346
	
l10096:	
;Main.c: 346: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4597:
	decfsz	((??_main+0)^080h+0),f
	goto	u4597
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4597
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4597
	nop2
opt asmopt_on

	line	347
;Main.c: 347: break;
	goto	l10102
	line	350
;Main.c: 350: default:
	
l2200:	
	line	352
;Main.c: 352: break;
	goto	l10102
	line	353
	
l10098:	
;Main.c: 353: }
	goto	l10102
	line	217
	
l2193:	
	
l10100:	
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
	goto	l2194
	xorlw	1^0	; case 1
	skipnz
	goto	l9960
	xorlw	2^1	; case 2
	skipnz
	goto	l9992
	xorlw	3^2	; case 3
	skipnz
	goto	l10034
	xorlw	4^3	; case 4
	skipnz
	goto	l10078
	goto	l10102
	opt asmopt_on

	line	353
	
l2195:	
	line	354
	
l10102:	
;Main.c: 354: choice = 255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	goto	l9922
	line	504
	
l2201:	
	line	175
	goto	l9922
	
l2202:	
	line	505
	
l2203:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_init
psect	text650,local,class=CODE,delta=2
global __ptext650
__ptext650:

;; *************** function _init *****************
;; Defined at:
;;		line 121 in file "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
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
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_init_adc
;;		_lcd_init
;;		_ser_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text650
	file	"H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	line	121
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 0
; Regs used in _init: [wreg+status,2+status,0+pclath+cstack]
	line	122
	
l9900:	
;Main.c: 122: init_adc();
	fcall	_init_adc
	line	123
;Main.c: 123: lcd_init();
	fcall	_lcd_init
	line	124
;Main.c: 124: ser_init();
	fcall	_ser_init
	line	126
	
l9902:	
;Main.c: 126: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	128
	
l9904:	
;Main.c: 128: TRISC &= 0b10010000;
	movlw	(090h)
	movwf	(??_init+0)^080h+0
	movf	(??_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	130
	
l9906:	
;Main.c: 130: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	131
	
l9908:	
;Main.c: 131: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	132
	
l9910:	
;Main.c: 132: RC0 = 0; RC1 = 0;
	bcf	(56/8),(56)&7
	
l9912:	
	bcf	(57/8),(57)&7
	line	134
	
l9914:	
;Main.c: 134: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	137
	
l9916:	
;Main.c: 137: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	140
	
l9918:	
;Main.c: 140: (GIE = 1);
	bsf	(95/8),(95)&7
	line	141
	
l2175:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_lcd_init
psect	text651,local,class=CODE,delta=2
global __ptext651
__ptext651:

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
psect	text651
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 0
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l9880:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l9882:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l9884:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l9886:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l9888:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l9890:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l9892:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l9894:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l9896:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l9898:	
;lcd.c: 119: lcd_write_control(0b00000010);
	movlw	(02h)
	fcall	_lcd_write_control
	line	121
	
l1423:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_write_control
psect	text652,local,class=CODE,delta=2
global __ptext652
__ptext652:

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
psect	text652
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
	
l9872:	
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
	
l9874:	
;lcd.c: 22: PORTD = databyte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_control@databyte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	23
	
l9876:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l9878:	
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
u4607:
	decfsz	((??_lcd_write_control+0)^080h+0),f
	goto	u4607
	decfsz	((??_lcd_write_control+0)^080h+0+1),f
	goto	u4607
	nop2
opt asmopt_on

	line	26
	
l1393:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_control
	__end_of_lcd_write_control:
;; =============== function _lcd_write_control ends ============

	signat	_lcd_write_control,4216
	global	_init_adc
psect	text653,local,class=CODE,delta=2
global __ptext653
__ptext653:

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
psect	text653
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	46
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 1
; Regs used in _init_adc: [wreg+status,2]
	line	48
	
l9862:	
;adc.c: 48: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	49
	
l9864:	
;adc.c: 49: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	52
	
l9866:	
;adc.c: 52: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	53
	
l9868:	
;adc.c: 53: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	55
	
l9870:	
;adc.c: 55: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_init_adc+0)^080h+0,f
u4617:
decfsz	(??_init_adc+0)^080h+0,f
	goto	u4617
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
psect	text654,local,class=CODE,delta=2
global __ptext654
__ptext654:

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
;;		_main
;;		_ser_puts
;;		_ser_puts2
;;		_ser_puthex
;; This function uses a non-reentrant model
;;
psect	text654
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	70
	global	__size_of_ser_putch
	__size_of_ser_putch	equ	__end_of_ser_putch-_ser_putch
	
_ser_putch:	
	opt	stack 2
; Regs used in _ser_putch: [wreg-fsr0h+status,2+status,0]
;ser_putch@c stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ser_putch@c)^080h
	line	71
	
l9476:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l9478
	
l4346:	
	line	72
;ser.c: 72: continue;
	goto	l9478
	
l4345:	
	line	71
	
l9478:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	xorwf	(_txoptr),w	;volatile
	skipnz
	goto	u3421
	goto	u3420
u3421:
	goto	l9478
u3420:
	
l4347:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l9480:	
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
	
l9482:	
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
	
l9484:	
;ser.c: 76: TXIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1124/8)^080h,(1124)&7
	line	77
	
l9486:	
;ser.c: 77: GIE=1;
	bsf	(95/8),(95)&7
	line	78
	
l4348:	
	return
	opt stack 0
GLOBAL	__end_of_ser_putch
	__end_of_ser_putch:
;; =============== function _ser_putch ends ============

	signat	_ser_putch,4216
	global	_Menu
psect	text655,local,class=CODE,delta=2
global __ptext655
__ptext655:

;; *************** function _Menu *****************
;; Defined at:
;;		line 182 in file "H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
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
psect	text655
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	182
	global	__size_of_Menu
	__size_of_Menu	equ	__end_of_Menu-_Menu
	
_Menu:	
	opt	stack 2
; Regs used in _Menu: [wreg-fsr0h+status,2+status,0]
;Menu@input stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(Menu@input)^080h
	line	183
	
l9450:	
;HMI.c: 183: switch (input)
	goto	l9470
	line	185
;HMI.c: 184: {
;HMI.c: 185: case 1:
	
l5130:	
	line	187
;HMI.c: 187: break;
	goto	l9472
	line	188
;HMI.c: 188: case 2:
	
l5132:	
	line	190
;HMI.c: 190: break;
	goto	l9472
	line	191
;HMI.c: 191: case 3:
	
l5133:	
	line	192
	
l9452:	
;HMI.c: 192: pos--;
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_pos),f
	skipnc
	incf	(_pos+1),f
	movlw	high(-1)
	addwf	(_pos+1),f
	line	193
	
l9454:	
;HMI.c: 193: if (pos < 0)
	btfss	(_pos+1),7
	goto	u3401
	goto	u3400
u3401:
	goto	l9472
u3400:
	line	194
	
l9456:	
;HMI.c: 194: pos = 5 - 1;
	movlw	low(04h)
	movwf	(_pos)
	movlw	high(04h)
	movwf	((_pos))+1
	goto	l9472
	
l5134:	
	line	196
;HMI.c: 196: break;
	goto	l9472
	line	197
;HMI.c: 197: case 4:
	
l5135:	
	line	198
	
l9458:	
;HMI.c: 198: pos++;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	addwf	(_pos),f
	skipnc
	incf	(_pos+1),f
	movlw	high(01h)
	addwf	(_pos+1),f
	line	199
;HMI.c: 199: if (pos == 5)
	movlw	05h
	xorwf	(_pos),w
	iorwf	(_pos+1),w
	skipz
	goto	u3411
	goto	u3410
u3411:
	goto	l9472
u3410:
	line	200
	
l9460:	
;HMI.c: 200: pos = 0;
	clrf	(_pos)
	clrf	(_pos+1)
	goto	l9472
	
l5136:	
	line	202
;HMI.c: 202: break;
	goto	l9472
	line	203
;HMI.c: 203: case 5:
	
l5137:	
	line	204
	
l9462:	
;HMI.c: 204: return pos;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_pos),w
	goto	l5138
	
l9464:	
	goto	l5138
	line	205
	
l9466:	
;HMI.c: 205: break;
	goto	l9472
	line	207
;HMI.c: 207: default:
	
l5139:	
	line	209
;HMI.c: 209: break;
	goto	l9472
	line	210
	
l9468:	
;HMI.c: 210: }
	goto	l9472
	line	183
	
l5129:	
	
l9470:	
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
	goto	l9472
	xorlw	2^1	; case 2
	skipnz
	goto	l9472
	xorlw	3^2	; case 3
	skipnz
	goto	l9452
	xorlw	4^3	; case 4
	skipnz
	goto	l9458
	xorlw	5^4	; case 5
	skipnz
	goto	l9462
	goto	l9472
	opt asmopt_on

	line	210
	
l5131:	
	line	211
	
l9472:	
;HMI.c: 211: return 255;
	movlw	(0FFh)
	goto	l5138
	
l9474:	
	line	212
	
l5138:	
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4217
	global	_spi_transfer
psect	text656,local,class=CODE,delta=2
global __ptext656
__ptext656:

;; *************** function _spi_transfer *****************
;; Defined at:
;;		line 146 in file "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text656
	file	"H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	line	146
	global	__size_of_spi_transfer
	__size_of_spi_transfer	equ	__end_of_spi_transfer-_spi_transfer
	
_spi_transfer:	
	opt	stack 2
; Regs used in _spi_transfer: [wreg]
;spi_transfer@data stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(spi_transfer@data)^080h
	line	147
	
l9440:	
;Main.c: 147: unsigned char temp = 0;
	clrf	(spi_transfer@temp)^080h
	line	149
;Main.c: 149: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	150
	
l9442:	
;Main.c: 150: SSPBUF = data;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(spi_transfer@data)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	152
;Main.c: 152: while (SSPIF == 0);
	goto	l2178
	
l2179:	
	
l2178:	
	btfss	(99/8),(99)&7
	goto	u3391
	goto	u3390
u3391:
	goto	l2178
u3390:
	goto	l9444
	
l2180:	
	line	153
	
l9444:	
;Main.c: 153: temp = SSPBUF;
	movf	(19),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_spi_transfer+0)^080h+0
	movf	(??_spi_transfer+0)^080h+0,w
	movwf	(spi_transfer@temp)^080h
	line	154
	
l9446:	
;Main.c: 154: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	goto	l2181
	line	156
	
l9448:	
	line	157
;Main.c: 156: return temp;
;	Return value of _spi_transfer is never used
	
l2181:	
	return
	opt stack 0
GLOBAL	__end_of_spi_transfer
	__end_of_spi_transfer:
;; =============== function _spi_transfer ends ============

	signat	_spi_transfer,4217
	global	_ser_init
psect	text657,local,class=CODE,delta=2
global __ptext657
__ptext657:

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
psect	text657
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 1
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l9414:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l9416:	
;ser.c: 115: TRISC &= 0b10111111;
	movlw	(0BFh)
	movwf	(??_ser_init+0)^080h+0
	movf	(??_ser_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	116
	
l9418:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l9420:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l9422:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l9424:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l9426:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l9428:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l9430:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l9432:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l9434:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l9436:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l9438:	
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
	
l4370:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_isr1
psect	text658,local,class=CODE,delta=2
global __ptext658
__ptext658:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 81 in file "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
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
psect	text658
	file	"H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	line	81
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
psect	text658
	line	83
	
i1l9280:	
;Main.c: 83: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	btfss	(101/8),(101)&7
	goto	u319_21
	goto	u319_20
u319_21:
	goto	i1l9290
u319_20:
	
i1l9282:	
	movf	(26),w	;volatile
	movwf	(??_isr1+0)+0
	movf	(_rxiptr),w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	movf	(??_isr1+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
i1l9284:	
	movf	(_rxiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_ser_tmp)
	
i1l9286:	
	movf	(_ser_tmp),w
	xorwf	(_rxoptr),w	;volatile
	skipnz
	goto	u320_21
	goto	u320_20
u320_21:
	goto	i1l9290
u320_20:
	
i1l9288:	
	movf	(_ser_tmp),w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)	;volatile
	goto	i1l9290
	
i1l2163:	
	goto	i1l9290
	
i1l2162:	
	
i1l9290:	
	btfss	(100/8),(100)&7
	goto	u321_21
	goto	u321_20
u321_21:
	goto	i1l2164
u321_20:
	
i1l9292:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u322_21
	goto	u322_20
u322_21:
	goto	i1l2164
u322_20:
	
i1l9294:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_txoptr),w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(25)	;volatile
	
i1l9296:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	addwf	(_txoptr),f	;volatile
	
i1l9298:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr),f	;volatile
	
i1l9300:	
	movf	(_txoptr),w	;volatile
	xorwf	(_txiptr),w	;volatile
	skipz
	goto	u323_21
	goto	u323_20
u323_21:
	goto	i1l2164
u323_20:
	
i1l9302:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2164
	
i1l2165:	
	
i1l2164:	
	line	85
;Main.c: 85: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u324_21
	goto	u324_20
u324_21:
	goto	i1l2172
u324_20:
	line	87
	
i1l9304:	
;Main.c: 86: {
;Main.c: 87: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	88
	
i1l9306:	
;Main.c: 88: TMR0 = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	90
;Main.c: 90: RTC_Counter++;
	movlw	low(01h)
	addwf	(_RTC_Counter),f	;volatile
	skipnc
	incf	(_RTC_Counter+1),f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1),f	;volatile
	line	92
	
i1l9308:	
;Main.c: 92: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	93
	
i1l9310:	
;Main.c: 93: if(RTC_Counter % 10 == 0)
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
	goto	u325_21
	goto	u325_20
u325_21:
	goto	i1l9314
u325_20:
	line	95
	
i1l9312:	
;Main.c: 94: {
;Main.c: 95: RTC_FLAG_10MS = 1;
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l9314
	line	97
	
i1l2167:	
	line	98
	
i1l9314:	
;Main.c: 97: }
;Main.c: 98: if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
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
	goto	u326_21
	goto	u326_20
u326_21:
	goto	i1l9318
u326_20:
	
i1l9316:	
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l9318
	
i1l2168:	
	line	99
	
i1l9318:	
;Main.c: 99: if(RTC_Counter % 250 == 0)
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
	goto	u327_21
	goto	u327_20
u327_21:
	goto	i1l9324
u327_20:
	line	101
	
i1l9320:	
;Main.c: 100: {
;Main.c: 101: readAvgDistance();
	fcall	_readAvgDistance
	line	102
;Main.c: 102: UpdateDisplay();
	fcall	_UpdateDisplay
	line	103
	
i1l9322:	
;Main.c: 103: RTC_FLAG_250MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l9324
	line	105
	
i1l2169:	
	line	106
	
i1l9324:	
;Main.c: 105: }
;Main.c: 106: if(RTC_Counter % 500 == 0)
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
	goto	u328_21
	goto	u328_20
u328_21:
	goto	i1l9332
u328_20:
	line	108
	
i1l9326:	
;Main.c: 107: {
;Main.c: 108: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	109
	
i1l9328:	
;Main.c: 109: RTC_Counter = 0;
	clrf	(_RTC_Counter)	;volatile
	clrf	(_RTC_Counter+1)	;volatile
	line	110
	
i1l9330:	
;Main.c: 110: RB0 ^= 0x01;
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l9332
	line	111
	
i1l2170:	
	line	113
	
i1l9332:	
;Main.c: 111: }
;Main.c: 113: if (buttonPressed == 0)
	movf	(_buttonPressed),f
	skipz	;volatile
	goto	u329_21
	goto	u329_20
u329_21:
	goto	i1l2172
u329_20:
	line	115
	
i1l9334:	
;Main.c: 114: {
;Main.c: 115: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_buttonPressed)	;volatile
	goto	i1l2172
	line	116
	
i1l2171:	
	goto	i1l2172
	line	117
	
i1l2166:	
	line	118
	
i1l2172:	
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
psect	text659,local,class=CODE,delta=2
global __ptext659
__ptext659:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 215 in file "H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adcOutput      16   27[BANK0 ] unsigned char [16]
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
;;      Temps:          0       4       0       0       0
;;      Totals:         0      20       0       0       0
;;Total ram usage:       20 bytes
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
psect	text659
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	215
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
	opt	stack 1
; Regs used in _UpdateDisplay: [allreg]
	line	216
	
i1l9352:	
;HMI.c: 216: char adcOutput[16] = "";
	movlw	(UpdateDisplay@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1206)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	fsr0,w
	movwf	((??_UpdateDisplay+0)+0+1)
	movlw	16
	movwf	((??_UpdateDisplay+0)+0+2)
u332_20:
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
	goto	u332_20
	line	217
	
i1l9354:	
;HMI.c: 217: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	i1_lcd_write_control
	line	218
	
i1l9356:	
;HMI.c: 218: sprintf(adcOutput,"ADC:%d Dist:%d",adcVal, distance);
	movlw	((STR_11-__stringbase))&0ffh
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

	movf	(_distance+1),w	;volatile
	clrf	1+(?_sprintf)+03h
	addwf	1+(?_sprintf)+03h
	movf	(_distance),w	;volatile
	clrf	0+(?_sprintf)+03h
	addwf	0+(?_sprintf)+03h

	movlw	(UpdateDisplay@adcOutput)&0ffh
	fcall	_sprintf
	line	219
	
i1l9358:	
;HMI.c: 219: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	220
	
i1l9360:	
;HMI.c: 220: lcd_write_string(adcOutput);
	movlw	(UpdateDisplay@adcOutput&0ffh)
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	225
	
i1l9362:	
;HMI.c: 225: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	226
	
i1l9364:	
;HMI.c: 226: if (pos > 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_pos+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u333_25
	movlw	low(01h)
	subwf	(_pos),w
u333_25:

	skipc
	goto	u333_21
	goto	u333_20
u333_21:
	goto	i1l9368
u333_20:
	line	227
	
i1l9366:	
;HMI.c: 227: lcd_write_string(shortMenuStrings[pos - 1]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_pos),w
	addlw	0FFh
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	goto	i1l9370
	line	228
	
i1l5144:	
	line	229
	
i1l9368:	
;HMI.c: 228: else
;HMI.c: 229: lcd_write_string(shortMenuStrings[pos + 5 - 1]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_pos),w
	addlw	04h
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	goto	i1l9370
	
i1l5145:	
	line	230
	
i1l9370:	
;HMI.c: 230: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	231
	
i1l9372:	
;HMI.c: 231: lcd_write_string(menuStrings[pos]);
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
	line	232
;HMI.c: 232: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	233
	
i1l9374:	
;HMI.c: 233: lcd_write_string(shortMenuStrings[(pos + 1) % 5]);
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
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	234
	
i1l5146:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,88
	global	_readAvgDistance
psect	text660,local,class=CODE,delta=2
global __ptext660
__ptext660:

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
psect	text660
	file	"H:\Aldnoah.Zero\trunk\Assignment3\infrared.c"
	line	10
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [allreg]
	line	11
	
i1l9336:	
;infrared.c: 11: unsigned int fullval = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(readAvgDistance@fullval)
	clrf	(readAvgDistance@fullval+1)
	line	14
;infrared.c: 14: for (int i = 0; i < 10; i++)
	clrf	(readAvgDistance@i)
	clrf	(readAvgDistance@i+1)
	
i1l9338:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u330_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u330_25:

	skipc
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l9342
u330_20:
	goto	i1l9348
	
i1l9340:	
	goto	i1l9348
	line	15
	
i1l2898:	
	line	16
	
i1l9342:	
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
	
i1l9344:	
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
i1l9346:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u331_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u331_25:

	skipc
	goto	u331_21
	goto	u331_20
u331_21:
	goto	i1l9342
u331_20:
	goto	i1l9348
	
i1l2899:	
	line	19
	
i1l9348:	
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
	
i1l9350:	
;infrared.c: 20: ADCconvert();
	fcall	_ADCconvert
	line	21
	
i1l2900:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,88
	global	_readDistance
psect	text661,local,class=CODE,delta=2
global __ptext661
__ptext661:

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
psect	text661
	file	"H:\Aldnoah.Zero\trunk\Assignment3\infrared.c"
	line	24
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	27
	
i1l9488:	
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
	
i1l9490:	
;infrared.c: 29: return fullval;
	movf	(readDistance@fullval+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@fullval),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	i1l2903
	
i1l9492:	
	line	30
	
i1l2903:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_lcd_write_string
psect	text662,local,class=CODE,delta=2
global __ptext662
__ptext662:

;; *************** function _lcd_write_string *****************
;; Defined at:
;;		line 48 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               2    7[COMMON] PTR unsigned char 
;;		 -> UpdateDisplay@adcOutput(16), STR_10(4), STR_9(4), STR_8(4), 
;;		 -> STR_7(4), STR_6(4), STR_5(7), STR_4(7), 
;;		 -> STR_3(7), STR_2(7), STR_1(7), 
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
psect	text662
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 1
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
i1l9246:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	i1l9252
	
i1l1403:	
	
i1l9248:	
	movf	(lcd_write_string@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
i1l9250:	
	movlw	low(01h)
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
	goto	i1l9252
	
i1l1402:	
	
i1l9252:	
	movf	(lcd_write_string@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u315_21
	goto	u315_20
u315_21:
	goto	i1l9248
u315_20:
	goto	i1l1405
	
i1l1404:	
	line	51
	
i1l1405:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_string
	__end_of_lcd_write_string:
;; =============== function _lcd_write_string ends ============

	signat	_lcd_write_string,4216
	global	_lcd_set_cursor
psect	text663,local,class=CODE,delta=2
global __ptext663
__ptext663:

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
psect	text663
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
	
i1l9242:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
i1l9244:	
;lcd.c: 44: lcd_write_control(address);
	movf	(lcd_set_cursor@address),w
	fcall	i1_lcd_write_control
	line	45
	
i1l1399:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
;; =============== function _lcd_set_cursor ends ============

	signat	_lcd_set_cursor,4216
	global	i1_lcd_write_control
psect	text664,local,class=CODE,delta=2
global __ptext664
__ptext664:

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
psect	text664
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
	
i1l9854:	
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
	
i1l9856:	
;lcd.c: 22: PORTD = databyte;
	movf	(i1lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
i1l9858:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
i1l9860:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??i1_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??i1_lcd_write_control+0)+0),f
u462_27:
	decfsz	((??i1_lcd_write_control+0)+0),f
	goto	u462_27
	decfsz	((??i1_lcd_write_control+0)+0+1),f
	goto	u462_27
	nop2
opt asmopt_on

	line	26
	
i1l1393:	
	return
	opt stack 0
GLOBAL	__end_ofi1_lcd_write_control
	__end_ofi1_lcd_write_control:
;; =============== function i1_lcd_write_control ends ============

	signat	i1_lcd_write_control,88
	global	_sprintf
psect	text665,local,class=CODE,delta=2
global __ptext665
__ptext665:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> UpdateDisplay@adcOutput(16), 
;;  f               1    6[BANK0 ] PTR const unsigned char 
;;		 -> STR_11(15), 
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
psect	text665
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
	
i1l9702:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	i1l9754
	
i1l5895:	
	line	542
	
i1l9704:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u384_21
	goto	u384_20
u384_21:
	goto	i1l5896
u384_20:
	line	545
	
i1l9706:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l9708:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	i1l9754
	line	547
	
i1l5896:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	i1l9712
	line	640
	
i1l5898:	
	line	641
	goto	i1l9756
	line	700
	
i1l5900:	
	goto	i1l9714
	line	701
	
i1l5901:	
	line	702
	goto	i1l9714
	line	805
	
i1l5903:	
	line	816
	goto	i1l9754
	line	825
	
i1l9710:	
	goto	i1l9714
	line	638
	
i1l5897:	
	
i1l9712:	
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
	goto	i1l9756
	xorlw	100^0	; case 100
	skipnz
	goto	i1l9714
	xorlw	105^100	; case 105
	skipnz
	goto	i1l9714
	goto	i1l9754
	opt asmopt_on

	line	825
	
i1l5902:	
	line	1254
	
i1l9714:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
i1l9716:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
i1l9718:	
	btfss	(sprintf@_val+1),7
	goto	u385_21
	goto	u385_20
u385_21:
	goto	i1l9724
u385_20:
	line	1257
	
i1l9720:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
i1l9722:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	i1l9724
	line	1259
	
i1l5904:	
	line	1300
	
i1l9724:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
i1l9726:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u386_21
	goto	u386_20
u386_21:
	goto	i1l9730
u386_20:
	goto	i1l9738
	
i1l9728:	
	goto	i1l9738
	line	1301
	
i1l5905:	
	
i1l9730:	
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
	goto	u387_25
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u387_25:
	skipnc
	goto	u387_21
	goto	u387_20
u387_21:
	goto	i1l9734
u387_20:
	goto	i1l9738
	line	1302
	
i1l9732:	
	goto	i1l9738
	
i1l5907:	
	line	1300
	
i1l9734:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
i1l9736:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u388_21
	goto	u388_20
u388_21:
	goto	i1l9730
u388_20:
	goto	i1l9738
	
i1l5906:	
	line	1433
	
i1l9738:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u389_21
	goto	u389_20
u389_21:
	goto	i1l9744
u389_20:
	line	1434
	
i1l9740:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l9742:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l9744
	
i1l5908:	
	line	1467
	
i1l9744:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	i1l9752
	
i1l5910:	
	line	1484
	
i1l9746:	
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
	
i1l9748:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l9750:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l9752
	line	1517
	
i1l5909:	
	line	1469
	
i1l9752:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u390_21
	goto	u390_20
u390_21:
	goto	i1l9746
u390_20:
	goto	i1l9754
	
i1l5911:	
	goto	i1l9754
	line	1525
	
i1l5894:	
	line	540
	
i1l9754:	
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
	goto	u391_21
	goto	u391_20
u391_21:
	goto	i1l9704
u391_20:
	goto	i1l9756
	
i1l5912:	
	goto	i1l9756
	line	1527
	
i1l5899:	
	line	1530
	
i1l9756:	
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	i1l5913
	line	1532
	
i1l9758:	
	line	1533
;	Return value of _sprintf is never used
	
i1l5913:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ADCconvert
psect	text666,local,class=CODE,delta=2
global __ptext666
__ptext666:

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
psect	text666
	file	"H:\Aldnoah.Zero\trunk\Assignment3\infrared.c"
	line	33
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [wreg+status,2+status,0+pclath+cstack]
	line	39
	
i1l9494:	
;infrared.c: 39: if (adcVal >= 213 && adcVal < 234)
	movlw	high(0D5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u343_21
	goto	u343_20
u343_21:
	goto	i1l9500
u343_20:
	
i1l9496:	
	movlw	high(0EAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0EAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l9500
u344_20:
	line	41
	
i1l9498:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(0Fh)
	movwf	1+(_distance)	;volatile
	line	42
;infrared.c: 42: }
	goto	i1l2919
	line	43
	
i1l2906:	
	
i1l9500:	
;infrared.c: 43: else if (adcVal >= 170 && adcVal < 213)
	movlw	high(0AAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u345_21
	goto	u345_20
u345_21:
	goto	i1l9506
u345_20:
	
i1l9502:	
	movlw	high(0D5h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u346_21
	goto	u346_20
u346_21:
	goto	i1l9506
u346_20:
	line	45
	
i1l9504:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(014h)
	movwf	1+(_distance)	;volatile
	line	46
;infrared.c: 46: }
	goto	i1l2919
	line	47
	
i1l2908:	
	
i1l9506:	
;infrared.c: 47: else if (adcVal >= 128 && adcVal < 170)
	movlw	high(080h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u347_21
	goto	u347_20
u347_21:
	goto	i1l9512
u347_20:
	
i1l9508:	
	movlw	high(0AAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l9512
u348_20:
	line	49
	
i1l9510:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(01Eh)
	movwf	1+(_distance)	;volatile
	line	50
;infrared.c: 50: }
	goto	i1l2919
	line	51
	
i1l2910:	
	
i1l9512:	
;infrared.c: 51: else if (adcVal >= 107 && adcVal < 128)
	movlw	high(06Bh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u349_21
	goto	u349_20
u349_21:
	goto	i1l9518
u349_20:
	
i1l9514:	
	movlw	high(080h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l9518
u350_20:
	line	53
	
i1l9516:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(028h)
	movwf	1+(_distance)	;volatile
	line	54
;infrared.c: 54: }
	goto	i1l2919
	line	55
	
i1l2912:	
	
i1l9518:	
;infrared.c: 55: else if (adcVal >= 77 && adcVal < 107)
	movlw	high(04Dh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u351_21
	goto	u351_20
u351_21:
	goto	i1l9524
u351_20:
	
i1l9520:	
	movlw	high(06Bh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l9524
u352_20:
	line	57
	
i1l9522:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(032h)
	movwf	1+(_distance)	;volatile
	line	58
;infrared.c: 58: }
	goto	i1l2919
	line	59
	
i1l2914:	
	
i1l9524:	
;infrared.c: 59: else if (adcVal >= 56 && adcVal < 77)
	movlw	high(038h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u353_21
	goto	u353_20
u353_21:
	goto	i1l9530
u353_20:
	
i1l9526:	
	movlw	high(04Dh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l9530
u354_20:
	line	61
	
i1l9528:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(03Ch)
	movwf	1+(_distance)	;volatile
	line	62
;infrared.c: 62: }
	goto	i1l2919
	line	63
	
i1l2916:	
	
i1l9530:	
;infrared.c: 63: else if (adcVal >= 43 && adcVal < 56)
	movlw	high(02Bh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(02Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l2919
u355_20:
	
i1l9532:	
	movlw	high(038h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u356_21
	goto	u356_20
u356_21:
	goto	i1l2919
u356_20:
	line	65
	
i1l9534:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(046h)
	movwf	1+(_distance)	;volatile
	goto	i1l2919
	line	66
	
i1l2918:	
	goto	i1l2919
	line	67
	
i1l2917:	
	goto	i1l2919
	
i1l2915:	
	goto	i1l2919
	
i1l2913:	
	goto	i1l2919
	
i1l2911:	
	goto	i1l2919
	
i1l2909:	
	goto	i1l2919
	
i1l2907:	
	
i1l2919:	
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,88
	global	_ReadButtons
psect	text667,local,class=CODE,delta=2
global __ptext667
__ptext667:

;; *************** function _ReadButtons *****************
;; Defined at:
;;		line 143 in file "H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
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
psect	text667
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	143
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 2
; Regs used in _ReadButtons: [wreg+status,2+status,0+pclath+cstack]
	line	144
	
i1l9376:	
;HMI.c: 144: Debounce();
	fcall	_Debounce
	line	146
	
i1l9378:	
;HMI.c: 146: if(UpPressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u334_21
	goto	u334_20
u334_21:
	goto	i1l5121
u334_20:
	line	148
	
i1l9380:	
;HMI.c: 147: {
;HMI.c: 148: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	149
	
i1l9382:	
;HMI.c: 149: return 1;
	movlw	(01h)
	goto	i1l5122
	
i1l9384:	
	goto	i1l5122
	line	151
	
i1l5121:	
	line	153
;HMI.c: 151: }
;HMI.c: 153: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u335_21
	goto	u335_20
u335_21:
	goto	i1l5123
u335_20:
	line	155
	
i1l9386:	
;HMI.c: 154: {
;HMI.c: 155: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	156
	
i1l9388:	
;HMI.c: 156: return 2;
	movlw	(02h)
	goto	i1l5122
	
i1l9390:	
	goto	i1l5122
	line	158
	
i1l5123:	
	line	159
;HMI.c: 158: }
;HMI.c: 159: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u336_21
	goto	u336_20
u336_21:
	goto	i1l5124
u336_20:
	line	161
	
i1l9392:	
;HMI.c: 160: {
;HMI.c: 161: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	162
	
i1l9394:	
;HMI.c: 162: return 3;
	movlw	(03h)
	goto	i1l5122
	
i1l9396:	
	goto	i1l5122
	line	164
	
i1l5124:	
	line	165
;HMI.c: 164: }
;HMI.c: 165: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u337_21
	goto	u337_20
u337_21:
	goto	i1l5125
u337_20:
	line	167
	
i1l9398:	
;HMI.c: 166: {
;HMI.c: 167: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	168
	
i1l9400:	
;HMI.c: 168: return 4;
	movlw	(04h)
	goto	i1l5122
	
i1l9402:	
	goto	i1l5122
	line	170
	
i1l5125:	
	line	172
;HMI.c: 170: }
;HMI.c: 172: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u338_21
	goto	u338_20
u338_21:
	goto	i1l9410
u338_20:
	line	174
	
i1l9404:	
;HMI.c: 173: {
;HMI.c: 174: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	175
	
i1l9406:	
;HMI.c: 175: return 5;
	movlw	(05h)
	goto	i1l5122
	
i1l9408:	
	goto	i1l5122
	line	177
	
i1l5126:	
	line	178
	
i1l9410:	
;HMI.c: 177: }
;HMI.c: 178: return 0;
	movlw	(0)
	goto	i1l5122
	
i1l9412:	
	line	179
	
i1l5122:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
	global	_lcd_write_data
psect	text668,local,class=CODE,delta=2
global __ptext668
__ptext668:

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
psect	text668
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
	
i1l9234:	
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
	
i1l9236:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
i1l9238:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
i1l9240:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u463_27:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u463_27
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u463_27
opt asmopt_on

	line	38
	
i1l1396:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_data
	__end_of_lcd_write_data:
;; =============== function _lcd_write_data ends ============

	signat	_lcd_write_data,4216
	global	_adc_read_channel
psect	text669,local,class=CODE,delta=2
global __ptext669
__ptext669:

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
psect	text669
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
	
i1l9208:	
;adc.c: 6: switch(channel)
	goto	i1l9216
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
	goto	i1l9218
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
	goto	i1l9218
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
	goto	i1l9218
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
	goto	i1l9218
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
	goto	i1l9218
	line	35
;adc.c: 35: default:
	
i1l696:	
	line	36
	
i1l9210:	
;adc.c: 36: return 0;
	movlw	(0)
	goto	i1l697
	
i1l9212:	
	goto	i1l697
	line	37
	
i1l9214:	
;adc.c: 37: }
	goto	i1l9218
	line	6
	
i1l689:	
	
i1l9216:	
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
	goto	i1l9210
	opt asmopt_on

	line	37
	
i1l691:	
	line	39
	
i1l9218:	
;adc.c: 39: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u464_27:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u464_27
opt asmopt_on

	line	41
	
i1l9220:	
;adc.c: 41: return adc_read();
	fcall	_adc_read
	movf	(0+(?_adc_read)),w
	goto	i1l697
	
i1l9222:	
	line	43
	
i1l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
psect	text670,local,class=CODE,delta=2
global __ptext670
__ptext670:

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
psect	text670
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
i1l9820:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u409_21
	goto	u409_20
u409_21:
	goto	i1l9824
u409_20:
	line	10
	
i1l9822:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	i1l9824
	line	12
	
i1l6804:	
	line	13
	
i1l9824:	
	btfss	(___awmod@divisor+1),7
	goto	u410_21
	goto	u410_20
u410_21:
	goto	i1l9828
u410_20:
	line	14
	
i1l9826:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	i1l9828
	
i1l6805:	
	line	15
	
i1l9828:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l9846
u411_20:
	line	16
	
i1l9830:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	i1l9836
	
i1l6808:	
	line	18
	
i1l9832:	
	movlw	01h
	
u412_25:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u412_25
	line	19
	
i1l9834:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	i1l9836
	line	20
	
i1l6807:	
	line	17
	
i1l9836:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u413_21
	goto	u413_20
u413_21:
	goto	i1l9832
u413_20:
	goto	i1l9838
	
i1l6809:	
	goto	i1l9838
	line	21
	
i1l6810:	
	line	22
	
i1l9838:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u414_25
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u414_25:
	skipc
	goto	u414_21
	goto	u414_20
u414_21:
	goto	i1l9842
u414_20:
	line	23
	
i1l9840:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	i1l9842
	
i1l6811:	
	line	24
	
i1l9842:	
	movlw	01h
	
u415_25:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u415_25
	line	25
	
i1l9844:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u416_21
	goto	u416_20
u416_21:
	goto	i1l9838
u416_20:
	goto	i1l9846
	
i1l6812:	
	goto	i1l9846
	line	26
	
i1l6806:	
	line	27
	
i1l9846:	
	movf	(___awmod@sign),w
	skipz
	goto	u417_20
	goto	i1l9850
u417_20:
	line	28
	
i1l9848:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	i1l9850
	
i1l6813:	
	line	29
	
i1l9850:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	i1l6814
	
i1l9852:	
	line	30
	
i1l6814:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___lwmod
psect	text671,local,class=CODE,delta=2
global __ptext671
__ptext671:

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
psect	text671
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l9798:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u403_21
	goto	u403_20
u403_21:
	goto	i1l9816
u403_20:
	line	9
	
i1l9800:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	i1l9806
	
i1l6614:	
	line	11
	
i1l9802:	
	movlw	01h
	
u404_25:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u404_25
	line	12
	
i1l9804:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	i1l9806
	line	13
	
i1l6613:	
	line	10
	
i1l9806:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u405_21
	goto	u405_20
u405_21:
	goto	i1l9802
u405_20:
	goto	i1l9808
	
i1l6615:	
	goto	i1l9808
	line	14
	
i1l6616:	
	line	15
	
i1l9808:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u406_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u406_25:
	skipc
	goto	u406_21
	goto	u406_20
u406_21:
	goto	i1l9812
u406_20:
	line	16
	
i1l9810:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	i1l9812
	
i1l6617:	
	line	17
	
i1l9812:	
	movlw	01h
	
u407_25:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u407_25
	line	18
	
i1l9814:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u408_21
	goto	u408_20
u408_21:
	goto	i1l9808
u408_20:
	goto	i1l9816
	
i1l6618:	
	goto	i1l9816
	line	19
	
i1l6612:	
	line	20
	
i1l9816:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	i1l6619
	
i1l9818:	
	line	21
	
i1l6619:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text672,local,class=CODE,delta=2
global __ptext672
__ptext672:

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
psect	text672
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
i1l9772:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
i1l9774:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u396_21
	goto	u396_20
u396_21:
	goto	i1l9794
u396_20:
	line	11
	
i1l9776:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	i1l9782
	
i1l6604:	
	line	13
	
i1l9778:	
	movlw	01h
	
u397_25:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u397_25
	line	14
	
i1l9780:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	i1l9782
	line	15
	
i1l6603:	
	line	12
	
i1l9782:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u398_21
	goto	u398_20
u398_21:
	goto	i1l9778
u398_20:
	goto	i1l9784
	
i1l6605:	
	goto	i1l9784
	line	16
	
i1l6606:	
	line	17
	
i1l9784:	
	movlw	01h
	
u399_25:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u399_25
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u400_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u400_25:
	skipc
	goto	u400_21
	goto	u400_20
u400_21:
	goto	i1l9790
u400_20:
	line	19
	
i1l9786:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
i1l9788:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l9790
	line	21
	
i1l6607:	
	line	22
	
i1l9790:	
	movlw	01h
	
u401_25:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u401_25
	line	23
	
i1l9792:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u402_21
	goto	u402_20
u402_21:
	goto	i1l9784
u402_20:
	goto	i1l9794
	
i1l6608:	
	goto	i1l9794
	line	24
	
i1l6602:	
	line	25
	
i1l9794:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	i1l6609
	
i1l9796:	
	line	26
	
i1l6609:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text673,local,class=CODE,delta=2
global __ptext673
__ptext673:

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
psect	text673
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 1
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
i1l9760:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	i1l9762
	line	6
	
i1l6596:	
	line	7
	
i1l9762:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l6597
u392_20:
	line	8
	
i1l9764:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
i1l6597:	
	line	9
	movlw	01h
	
u393_25:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u393_25
	line	10
	
i1l9766:	
	movlw	01h
	
u394_25:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u394_25
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u395_21
	goto	u395_20
u395_21:
	goto	i1l9762
u395_20:
	goto	i1l9768
	
i1l6598:	
	line	12
	
i1l9768:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	i1l6599
	
i1l9770:	
	line	13
	
i1l6599:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_Debounce
psect	text674,local,class=CODE,delta=2
global __ptext674
__ptext674:

;; *************** function _Debounce *****************
;; Defined at:
;;		line 63 in file "H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
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
psect	text674
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	63
	global	__size_of_Debounce
	__size_of_Debounce	equ	__end_of_Debounce-_Debounce
	
_Debounce:	
	opt	stack 2
; Regs used in _Debounce: [wreg+status,2+status,0]
	line	65
	
i1l9660:	
;HMI.c: 65: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u369_21
	goto	u369_20
u369_21:
	goto	i1l5103
u369_20:
	line	67
	
i1l9662:	
;HMI.c: 66: {
;HMI.c: 67: UpDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_UpDebounceCount),f	;volatile
	line	68
	
i1l9664:	
;HMI.c: 68: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount),w	;volatile
	skipc
	goto	u370_21
	goto	u370_20
u370_21:
	goto	i1l5105
u370_20:
	
i1l9666:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u371_21
	goto	u371_20
u371_21:
	goto	i1l5105
u371_20:
	line	70
	
i1l9668:	
;HMI.c: 69: {
;HMI.c: 70: UpPressed = 1;
	bsf	(_UpPressed/8),(_UpPressed)&7
	line	71
;HMI.c: 71: UpReleased = 0;
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l5105
	line	72
	
i1l5104:	
	line	73
;HMI.c: 72: }
;HMI.c: 73: }
	goto	i1l5105
	line	74
	
i1l5103:	
	line	76
;HMI.c: 74: else
;HMI.c: 75: {
;HMI.c: 76: UpDebounceCount = 0;
	clrf	(_UpDebounceCount)	;volatile
	line	77
;HMI.c: 77: UpReleased = 1;
	bsf	(_UpReleased/8),(_UpReleased)&7
	line	78
	
i1l5105:	
	line	81
;HMI.c: 78: }
;HMI.c: 81: if(!RB3)
	btfsc	(51/8),(51)&7
	goto	u372_21
	goto	u372_20
u372_21:
	goto	i1l5106
u372_20:
	line	83
	
i1l9670:	
;HMI.c: 82: {
;HMI.c: 83: DownDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_DownDebounceCount),f	;volatile
	line	84
	
i1l9672:	
;HMI.c: 84: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount),w	;volatile
	skipc
	goto	u373_21
	goto	u373_20
u373_21:
	goto	i1l5108
u373_20:
	
i1l9674:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u374_21
	goto	u374_20
u374_21:
	goto	i1l5108
u374_20:
	line	86
	
i1l9676:	
;HMI.c: 85: {
;HMI.c: 86: DownPressed = 1;
	bsf	(_DownPressed/8),(_DownPressed)&7
	line	87
;HMI.c: 87: DownReleased = 0;
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l5108
	line	88
	
i1l5107:	
	line	89
;HMI.c: 88: }
;HMI.c: 89: }
	goto	i1l5108
	line	90
	
i1l5106:	
	line	92
;HMI.c: 90: else
;HMI.c: 91: {
;HMI.c: 92: DownDebounceCount = 0;
	clrf	(_DownDebounceCount)	;volatile
	line	93
;HMI.c: 93: DownReleased = 1;
	bsf	(_DownReleased/8),(_DownReleased)&7
	line	94
	
i1l5108:	
	line	96
;HMI.c: 94: }
;HMI.c: 96: if(!RB4)
	btfsc	(52/8),(52)&7
	goto	u375_21
	goto	u375_20
u375_21:
	goto	i1l5109
u375_20:
	line	98
	
i1l9678:	
;HMI.c: 97: {
;HMI.c: 98: LeftDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_LeftDebounceCount),f	;volatile
	line	99
	
i1l9680:	
;HMI.c: 99: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount),w	;volatile
	skipc
	goto	u376_21
	goto	u376_20
u376_21:
	goto	i1l5111
u376_20:
	
i1l9682:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u377_21
	goto	u377_20
u377_21:
	goto	i1l5111
u377_20:
	line	101
	
i1l9684:	
;HMI.c: 100: {
;HMI.c: 101: LeftPressed = 1;
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	line	102
;HMI.c: 102: LeftReleased = 0;
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l5111
	line	103
	
i1l5110:	
	line	104
;HMI.c: 103: }
;HMI.c: 104: }
	goto	i1l5111
	line	105
	
i1l5109:	
	line	107
;HMI.c: 105: else
;HMI.c: 106: {
;HMI.c: 107: LeftDebounceCount = 0;
	clrf	(_LeftDebounceCount)	;volatile
	line	108
;HMI.c: 108: LeftReleased = 1;
	bsf	(_LeftReleased/8),(_LeftReleased)&7
	line	109
	
i1l5111:	
	line	111
;HMI.c: 109: }
;HMI.c: 111: if(!RB5)
	btfsc	(53/8),(53)&7
	goto	u378_21
	goto	u378_20
u378_21:
	goto	i1l5112
u378_20:
	line	113
	
i1l9686:	
;HMI.c: 112: {
;HMI.c: 113: RightDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_RightDebounceCount),f	;volatile
	line	114
	
i1l9688:	
;HMI.c: 114: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount),w	;volatile
	skipc
	goto	u379_21
	goto	u379_20
u379_21:
	goto	i1l5114
u379_20:
	
i1l9690:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u380_21
	goto	u380_20
u380_21:
	goto	i1l5114
u380_20:
	line	116
	
i1l9692:	
;HMI.c: 115: {
;HMI.c: 116: RightPressed = 1;
	bsf	(_RightPressed/8),(_RightPressed)&7
	line	117
;HMI.c: 117: RightReleased = 0;
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l5114
	line	118
	
i1l5113:	
	line	119
;HMI.c: 118: }
;HMI.c: 119: }
	goto	i1l5114
	line	120
	
i1l5112:	
	line	122
;HMI.c: 120: else
;HMI.c: 121: {
;HMI.c: 122: RightDebounceCount = 0;
	clrf	(_RightDebounceCount)	;volatile
	line	123
;HMI.c: 123: RightReleased = 1;
	bsf	(_RightReleased/8),(_RightReleased)&7
	line	124
	
i1l5114:	
	line	126
;HMI.c: 124: }
;HMI.c: 126: if(!RB6)
	btfsc	(54/8),(54)&7
	goto	u381_21
	goto	u381_20
u381_21:
	goto	i1l5115
u381_20:
	line	128
	
i1l9694:	
;HMI.c: 127: {
;HMI.c: 128: CenterDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_CenterDebounceCount),f	;volatile
	line	129
	
i1l9696:	
;HMI.c: 129: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount),w	;volatile
	skipc
	goto	u382_21
	goto	u382_20
u382_21:
	goto	i1l5118
u382_20:
	
i1l9698:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u383_21
	goto	u383_20
u383_21:
	goto	i1l5118
u383_20:
	line	131
	
i1l9700:	
;HMI.c: 130: {
;HMI.c: 131: CenterPressed = 1;
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	line	132
;HMI.c: 132: CenterReleased = 0;
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l5118
	line	133
	
i1l5116:	
	line	134
;HMI.c: 133: }
;HMI.c: 134: }
	goto	i1l5118
	line	135
	
i1l5115:	
	line	137
;HMI.c: 135: else
;HMI.c: 136: {
;HMI.c: 137: CenterDebounceCount = 0;
	clrf	(_CenterDebounceCount)	;volatile
	line	138
;HMI.c: 138: CenterReleased = 1;
	bsf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l5118
	line	139
	
i1l5117:	
	line	140
	
i1l5118:	
	return
	opt stack 0
GLOBAL	__end_of_Debounce
	__end_of_Debounce:
;; =============== function _Debounce ends ============

	signat	_Debounce,88
	global	_adc_read
psect	text675,local,class=CODE,delta=2
global __ptext675
__ptext675:

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
psect	text675
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	64
	
i1l9224:	
;adc.c: 62: volatile unsigned int adc_value;
;adc.c: 64: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	66
	
i1l9226:	
;adc.c: 66: GO = 1;
	bsf	(250/8),(250)&7
	line	67
;adc.c: 67: while(GO) continue;
	goto	i1l703
	
i1l704:	
	
i1l703:	
	btfsc	(250/8),(250)&7
	goto	u313_21
	goto	u313_20
u313_21:
	goto	i1l703
u313_20:
	
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
psect	text675
	line	73
	
i1l9228:	
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
	
u314_25:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u314_25
	line	75
;adc.c: 75: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	78
	
i1l9230:	
;adc.c: 78: return (adc_value);
	movf	(adc_read@adc_value+1),w	;volatile
	clrf	(?_adc_read+1)
	addwf	(?_adc_read+1)
	movf	(adc_read@adc_value),w	;volatile
	clrf	(?_adc_read)
	addwf	(?_adc_read)

	goto	i1l706
	
i1l9232:	
	line	79
	
i1l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
psect	text676,local,class=CODE,delta=2
global __ptext676
__ptext676:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
