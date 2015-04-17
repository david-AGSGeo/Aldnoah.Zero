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
# 34 "E:\Aldnoah.Zero\Assignment3\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 34 "E:\Aldnoah.Zero\Assignment3\Main.c"
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
	FNCALL	_ADCconvert,___lwtoft
	FNCALL	_ADCconvert,___ftge
	FNCALL	_ADCconvert,___ftneg
	FNCALL	_ADCconvert,___ftadd
	FNCALL	_ADCconvert,___ftmul
	FNCALL	_ADCconvert,___ftdiv
	FNCALL	_ADCconvert,___fttol
	FNCALL	_ADCconvert,___wmul
	FNCALL	_ADCconvert,___lwdiv
	FNCALL	_readDistance,_adc_read_channel
	FNCALL	_lcd_write_string,_lcd_write_data
	FNCALL	_lcd_set_cursor,i1_lcd_write_control
	FNCALL	___lwtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNCALL	___ftadd,___ftpack
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_ReadButtons,_Debounce
	FNCALL	_adc_read_channel,_adc_read
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
	line	34

;initializer for _menuStrings
	retlw	(STR_1-__stringbase)&0ffh
	retlw	(STR_2-__stringbase)&0ffh
	retlw	(STR_3-__stringbase)&0ffh
	retlw	(STR_4-__stringbase)&0ffh
	retlw	(STR_5-__stringbase)&0ffh
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
	global	_rxiptr
	global	_txiptr
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
	global	_RTC_Counter
	global	_distance
	global	_pos
	global	_CenterDebounceCount
	global	_DownDebounceCount
	global	_LeftDebounceCount
	global	_RightDebounceCount
	global	_UpDebounceCount
	global	_buttonPressed
	global	_current_direction
	global	_rxoptr
	global	_ser_tmp
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
_adcVal:
       ds      2

_rxiptr:
       ds      1

_txiptr:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_rxfifo:
       ds      16

_txfifo:
       ds      16

_RTC_Counter:
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

_rxoptr:
       ds      1

_ser_tmp:
       ds      1

_txoptr:
       ds      1

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	34
_menuStrings:
       ds      5

psect	dataBANK1
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	35
_shortMenuStrings:
       ds      5

psect	dataBANK1
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	21
_current_step:
       ds      1

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
UpdateDisplay@F1206:
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

; Clear objects allocated to BITBANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssBANK0/8)+0)&07Fh
	clrf	((__pbitbssBANK0/8)+1)&07Fh
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
	movlw	low((__pbssBANK1)+030h)
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
	movlw low(__pdataBANK1+11)
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
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
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
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
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
	global	?___ftge
?___ftge:	; 1 bit 
	global	?_readDistance
?_readDistance:	; 2 bytes @ 0x8
	global	?___ftneg
?___ftneg:	; 3 bytes @ 0x8
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x8
	global	___ftneg@f1
___ftneg@f1:	; 3 bytes @ 0x8
	global	___ftge@ff1
___ftge@ff1:	; 3 bytes @ 0x8
	ds	1
	global	??_lcd_write_string
??_lcd_write_string:	; 0 bytes @ 0x9
	ds	1
	global	??_readDistance
??_readDistance:	; 0 bytes @ 0xA
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0xA
	ds	1
	global	??___ftneg
??___ftneg:	; 0 bytes @ 0xB
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0xB
	global	___ftge@ff2
___ftge@ff2:	; 3 bytes @ 0xB
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
	global	??___ftge
??___ftge:	; 0 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___fttol
?___fttol:	; 4 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x0
	ds	2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	??___fttol
??___fttol:	; 0 bytes @ 0x4
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x6
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0x6
	ds	2
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x8
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x9
	ds	2
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0xB
	ds	2
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0xD
	ds	1
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0xE
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0xE
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0xE
	ds	1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0xF
	ds	1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x10
	ds	1
	global	??___lwtoft
??___lwtoft:	; 0 bytes @ 0x11
	global	sprintf@_val
sprintf@_val:	; 4 bytes @ 0x11
	ds	1
	global	?___ftadd
?___ftadd:	; 3 bytes @ 0x12
	global	___ftadd@f1
___ftadd@f1:	; 3 bytes @ 0x12
	ds	3
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0x15
	global	___ftadd@f2
___ftadd@f2:	; 3 bytes @ 0x15
	ds	1
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x16
	ds	1
	global	??_UpdateDisplay
??_UpdateDisplay:	; 0 bytes @ 0x17
	ds	1
	global	??___ftadd
??___ftadd:	; 0 bytes @ 0x18
	ds	3
	global	UpdateDisplay@adcOutput
UpdateDisplay@adcOutput:	; 16 bytes @ 0x1B
	ds	1
	global	___ftadd@sign
___ftadd@sign:	; 1 bytes @ 0x1C
	ds	1
	global	___ftadd@exp2
___ftadd@exp2:	; 1 bytes @ 0x1D
	ds	1
	global	___ftadd@exp1
___ftadd@exp1:	; 1 bytes @ 0x1E
	ds	1
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x1F
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x1F
	ds	3
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x22
	ds	3
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x25
	ds	4
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x29
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x2A
	ds	3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x2D
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x2E
	ds	1
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0x2F
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x2F
	ds	3
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x32
	ds	3
	global	??___ftdiv
??___ftdiv:	; 0 bytes @ 0x35
	ds	4
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x39
	ds	1
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x3A
	ds	3
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x3D
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x3E
	ds	1
	global	??_ADCconvert
??_ADCconvert:	; 0 bytes @ 0x3F
	ds	2
	global	readAvgDistance@fullval
readAvgDistance@fullval:	; 2 bytes @ 0x41
	ds	2
	global	readAvgDistance@i
readAvgDistance@i:	; 2 bytes @ 0x43
	ds	2
	global	??_isr1
??_isr1:	; 0 bytes @ 0x45
	ds	5
;;Data sizes: Strings 70, constant 10, data 11, bss 68, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     74      80
;; BANK1           80      8      67
;; BANK3           96      0      16
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?___ftneg	float  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___ftdiv	float  size(1) Largest target is 0
;;
;; ?___ftadd	float  size(1) Largest target is 0
;;
;; ?___lwtoft	float  size(1) Largest target is 0
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
;;   _ADCconvert->___ftge
;;   _ADCconvert->___lwdiv
;;   _readDistance->_adc_read_channel
;;   _lcd_write_string->___awmod
;;   _lcd_set_cursor->i1_lcd_write_control
;;   ___lwtoft->___ftge
;;   _sprintf->___lwdiv
;;   _ReadButtons->_Debounce
;;   _adc_read_channel->_adc_read
;;   ___ftge->___ftpack
;;   ___ftneg->___ftpack
;;   ___fttol->___ftneg
;;   ___lwmod->___lwdiv
;;   ___lwdiv->___wmul
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _isr1 in BANK0
;;
;;   _isr1->_readAvgDistance
;;   _UpdateDisplay->_sprintf
;;   _readAvgDistance->_ADCconvert
;;   _ADCconvert->___ftdiv
;;   ___lwtoft->___fttol
;;   ___ftmul->___ftadd
;;   ___ftdiv->___ftmul
;;   ___ftadd->___lwtoft
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
;; (4) _isr1                                                 5     5      0    4836
;;                                             69 BANK0      5     5      0
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
;; (5) _readAvgDistance                                      4     4      0    3292
;;                                             65 BANK0      4     4      0
;;                       _readDistance
;;                            ___lwdiv
;;                         _ADCconvert
;; ---------------------------------------------------------------------------------
;; (6) _ADCconvert                                           2     2      0    2991
;;                                             63 BANK0      2     2      0
;;                           ___lwtoft
;;                             ___ftge
;;                            ___ftneg
;;                            ___ftadd
;;                            ___ftmul
;;                            ___ftdiv
;;                            ___fttol
;;                             ___wmul
;;                            ___lwdiv
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
;; (7) ___lwtoft                                             4     1      3     231
;;                                             14 BANK0      4     1      3
;;                           ___ftpack
;;                             ___ftge (ARG)
;;                            ___ftneg (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (7) ___ftmul                                             16    10      6     535
;;                                             31 BANK0     16    10      6
;;                           ___ftpack
;;                            ___ftadd (ARG)
;;                            ___ftneg (ARG)
;;                           ___lwtoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (7) ___ftdiv                                             16    10      6     489
;;                                             47 BANK0     16    10      6
;;                           ___ftpack
;;                            ___ftmul (ARG)
;;                            ___ftadd (ARG)
;;                            ___ftneg (ARG)
;;                           ___lwtoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (7) ___ftadd                                             13     7      6    1049
;;                                             18 BANK0     13     7      6
;;                           ___ftpack
;;                            ___ftneg (ARG)
;;                           ___lwtoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (6) _sprintf                                             17    12      5     798
;;                                              6 BANK0     17    12      5
;;                            ___lwdiv
;;                            ___lwmod
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
;; (7) ___ftge                                              12     6      6     136
;;                                              8 COMMON     6     0      6
;;                                              0 BANK0      6     6      0
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (7) ___ftneg                                              3     0      3      45
;;                                              8 COMMON     3     0      3
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (7) ___fttol                                             14    10      4     252
;;                                              0 BANK0     14    10      4
;;                           ___ftpack (ARG)
;;                            ___ftneg (ARG)
;; ---------------------------------------------------------------------------------
;; (8) ___ftpack                                             8     3      5     209
;;                                              0 COMMON     8     3      5
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
;;       ___lwtoft
;;         ___ftpack
;;         ___ftge (ARG)
;;           ___ftpack (ARG)
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;       ___ftge
;;         ___ftpack (ARG)
;;       ___ftneg
;;         ___ftpack (ARG)
;;       ___ftadd
;;         ___ftpack
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;         ___lwtoft (ARG)
;;           ___ftpack
;;           ___ftge (ARG)
;;             ___ftpack (ARG)
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___ftneg (ARG)
;;               ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;       ___ftmul
;;         ___ftpack
;;         ___ftadd (ARG)
;;           ___ftpack
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;           ___lwtoft (ARG)
;;             ___ftpack
;;             ___ftge (ARG)
;;               ___ftpack (ARG)
;;             ___ftneg (ARG)
;;               ___ftpack (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               ___ftneg (ARG)
;;                 ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___ftneg (ARG)
;;               ___ftpack (ARG)
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;         ___lwtoft (ARG)
;;           ___ftpack
;;           ___ftge (ARG)
;;             ___ftpack (ARG)
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___ftneg (ARG)
;;               ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;       ___ftdiv
;;         ___ftpack
;;         ___ftmul (ARG)
;;           ___ftpack
;;           ___ftadd (ARG)
;;             ___ftpack
;;             ___ftneg (ARG)
;;               ___ftpack (ARG)
;;             ___lwtoft (ARG)
;;               ___ftpack
;;               ___ftge (ARG)
;;                 ___ftpack (ARG)
;;               ___ftneg (ARG)
;;                 ___ftpack (ARG)
;;               ___fttol (ARG)
;;                 ___ftpack (ARG)
;;                 ___ftneg (ARG)
;;                   ___ftpack (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               ___ftneg (ARG)
;;                 ___ftpack (ARG)
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;           ___lwtoft (ARG)
;;             ___ftpack
;;             ___ftge (ARG)
;;               ___ftpack (ARG)
;;             ___ftneg (ARG)
;;               ___ftpack (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               ___ftneg (ARG)
;;                 ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___ftneg (ARG)
;;               ___ftpack (ARG)
;;         ___ftadd (ARG)
;;           ___ftpack
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;           ___lwtoft (ARG)
;;             ___ftpack
;;             ___ftge (ARG)
;;               ___ftpack (ARG)
;;             ___ftneg (ARG)
;;               ___ftpack (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;               ___ftneg (ARG)
;;                 ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___ftneg (ARG)
;;               ___ftpack (ARG)
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;         ___lwtoft (ARG)
;;           ___ftpack
;;           ___ftge (ARG)
;;             ___ftpack (ARG)
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;             ___ftneg (ARG)
;;               ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;       ___fttol
;;         ___ftpack (ARG)
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
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
;;BANK1               50      8      43       7       83.8%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      BE      12        0.0%
;;ABS                  0      0      B1       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       D       2        0.0%
;;BANK0               50     4A      50       5      100.0%
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
;;		line 164 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	164
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	169
	
l11090:	
;Main.c: 169: init();
	fcall	_init
	goto	l11092
	line	175
;Main.c: 175: while(1)
	
l2184:	
	line	177
	
l11092:	
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
	goto	l11126
	line	181
;Main.c: 180: {
;Main.c: 181: case 1:
	
l2186:	
	line	182
	
l11094:	
;Main.c: 182: Menu(1);
	movlw	(01h)
	fcall	_Menu
	line	183
	
l11096:	
;Main.c: 183: RB1 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	184
	
l11098:	
;Main.c: 184: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	186
;Main.c: 186: break;
	goto	l11198
	line	187
;Main.c: 187: case 2:
	
l2188:	
	line	188
	
l11100:	
;Main.c: 188: Menu(2);
	movlw	(02h)
	fcall	_Menu
	line	189
	
l11102:	
;Main.c: 189: RB1 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	190
	
l11104:	
;Main.c: 190: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	192
;Main.c: 192: break;
	goto	l11198
	line	193
;Main.c: 193: case 3:
	
l2189:	
	line	194
	
l11106:	
;Main.c: 194: Menu(3);
	movlw	(03h)
	fcall	_Menu
	line	195
	
l11108:	
;Main.c: 195: RB1 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	196
	
l11110:	
;Main.c: 196: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	198
;Main.c: 198: break;
	goto	l11198
	line	199
;Main.c: 199: case 4:
	
l2190:	
	line	200
	
l11112:	
;Main.c: 200: Menu(4);
	movlw	(04h)
	fcall	_Menu
	line	201
	
l11114:	
;Main.c: 201: RB1 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	202
	
l11116:	
;Main.c: 202: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	204
;Main.c: 204: break;
	goto	l11198
	line	205
;Main.c: 205: case 5:
	
l2191:	
	line	206
	
l11118:	
;Main.c: 206: choice = Menu(5);
	movlw	(05h)
	fcall	_Menu
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	line	207
	
l11120:	
;Main.c: 207: RB1 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	208
	
l11122:	
;Main.c: 208: buttonPressed = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_buttonPressed)^080h	;volatile
	line	210
;Main.c: 210: break;
	goto	l11198
	line	211
;Main.c: 211: default:
	
l2192:	
	line	213
;Main.c: 213: break;
	goto	l11198
	line	214
	
l11124:	
;Main.c: 214: }
	goto	l11198
	line	179
	
l2185:	
	
l11126:	
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
	goto	l11094
	xorlw	2^1	; case 2
	skipnz
	goto	l11100
	xorlw	3^2	; case 3
	skipnz
	goto	l11106
	xorlw	4^3	; case 4
	skipnz
	goto	l11112
	xorlw	5^4	; case 5
	skipnz
	goto	l11118
	goto	l11198
	opt asmopt_on

	line	214
	
l2187:	
	line	217
;Main.c: 217: switch (choice)
	goto	l11198
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
	
l11128:	
;Main.c: 221: spi_transfer(0b00001011);
	movlw	(0Bh)
	fcall	_spi_transfer
	line	222
	
l11130:	
;Main.c: 222: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11132:	
	bcf	(57/8),(57)&7
	line	223
	
l11134:	
;Main.c: 223: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l11136:	
	nop
	
l11138:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	224
;Main.c: 224: break;
	goto	l11200
	line	225
;Main.c: 225: case 1:
	
l2196:	
	line	227
;Main.c: 227: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	228
	
l11140:	
;Main.c: 228: spi_transfer(0b00001001);
	movlw	(09h)
	fcall	_spi_transfer
	line	229
	
l11142:	
;Main.c: 229: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11144:	
	bcf	(57/8),(57)&7
	line	230
	
l11146:	
;Main.c: 230: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l11148:	
	nop
	
l11150:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	231
;Main.c: 231: break;
	goto	l11200
	line	232
;Main.c: 232: case 2:
	
l2197:	
	line	233
;Main.c: 233: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	234
	
l11152:	
;Main.c: 234: spi_transfer(0b00001111);
	movlw	(0Fh)
	fcall	_spi_transfer
	line	235
	
l11154:	
;Main.c: 235: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11156:	
	bcf	(57/8),(57)&7
	line	236
	
l11158:	
;Main.c: 236: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l11160:	
	nop
	
l11162:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	238
;Main.c: 238: break;
	goto	l11200
	line	239
;Main.c: 239: case 3:
	
l2198:	
	line	240
;Main.c: 240: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	241
	
l11164:	
;Main.c: 241: spi_transfer(0b00001101);
	movlw	(0Dh)
	fcall	_spi_transfer
	line	242
	
l11166:	
;Main.c: 242: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11168:	
	bcf	(57/8),(57)&7
	line	243
	
l11170:	
;Main.c: 243: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l11172:	
	nop
	
l11174:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	245
;Main.c: 245: break;
	goto	l11200
	line	246
;Main.c: 246: case 4:
	
l2199:	
	line	247
	
l11176:	
;Main.c: 247: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	248
	
l11178:	
;Main.c: 248: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u5007:
	decfsz	((??_main+0)^080h+0),f
	goto	u5007
	decfsz	((??_main+0)^080h+0+1),f
	goto	u5007
	decfsz	((??_main+0)^080h+0+2),f
	goto	u5007
	nop2
opt asmopt_on

	line	249
	
l11180:	
;Main.c: 249: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	250
;Main.c: 250: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u5017:
	decfsz	((??_main+0)^080h+0),f
	goto	u5017
	decfsz	((??_main+0)^080h+0+1),f
	goto	u5017
	decfsz	((??_main+0)^080h+0+2),f
	goto	u5017
	nop2
opt asmopt_on

	line	251
	
l11182:	
;Main.c: 251: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	252
	
l11184:	
;Main.c: 252: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u5027:
	decfsz	((??_main+0)^080h+0),f
	goto	u5027
	decfsz	((??_main+0)^080h+0+1),f
	goto	u5027
	decfsz	((??_main+0)^080h+0+2),f
	goto	u5027
	nop2
opt asmopt_on

	line	254
;Main.c: 254: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	255
	
l11186:	
;Main.c: 255: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u5037:
	decfsz	((??_main+0)^080h+0),f
	goto	u5037
	decfsz	((??_main+0)^080h+0+1),f
	goto	u5037
	decfsz	((??_main+0)^080h+0+2),f
	goto	u5037
	nop2
opt asmopt_on

	line	256
	
l11188:	
;Main.c: 256: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	257
;Main.c: 257: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u5047:
	decfsz	((??_main+0)^080h+0),f
	goto	u5047
	decfsz	((??_main+0)^080h+0+1),f
	goto	u5047
	decfsz	((??_main+0)^080h+0+2),f
	goto	u5047
	nop2
opt asmopt_on

	line	258
	
l11190:	
;Main.c: 258: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	259
	
l11192:	
;Main.c: 259: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u5057:
	decfsz	((??_main+0)^080h+0),f
	goto	u5057
	decfsz	((??_main+0)^080h+0+1),f
	goto	u5057
	decfsz	((??_main+0)^080h+0+2),f
	goto	u5057
	nop2
opt asmopt_on

	line	260
;Main.c: 260: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	261
	
l11194:	
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
u5067:
	decfsz	((??_main+0)^080h+0),f
	goto	u5067
	decfsz	((??_main+0)^080h+0+1),f
	goto	u5067
	decfsz	((??_main+0)^080h+0+2),f
	goto	u5067
	nop2
opt asmopt_on

	line	262
;Main.c: 262: break;
	goto	l11200
	line	263
;Main.c: 263: default:
	
l2200:	
	line	265
;Main.c: 265: break;
	goto	l11200
	line	266
	
l11196:	
;Main.c: 266: }
	goto	l11200
	line	217
	
l2193:	
	
l11198:	
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
	goto	l2196
	xorlw	2^1	; case 2
	skipnz
	goto	l2197
	xorlw	3^2	; case 3
	skipnz
	goto	l2198
	xorlw	4^3	; case 4
	skipnz
	goto	l11176
	goto	l11200
	opt asmopt_on

	line	266
	
l2195:	
	line	267
	
l11200:	
;Main.c: 267: choice = 255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	goto	l11092
	line	330
	
l2201:	
	line	175
	goto	l11092
	
l2202:	
	line	331
	
l2203:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_init
psect	text806,local,class=CODE,delta=2
global __ptext806
__ptext806:

;; *************** function _init *****************
;; Defined at:
;;		line 121 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text806
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	121
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 0
; Regs used in _init: [wreg+status,2+status,0+pclath+cstack]
	line	122
	
l11070:	
;Main.c: 122: init_adc();
	fcall	_init_adc
	line	123
;Main.c: 123: lcd_init();
	fcall	_lcd_init
	line	124
;Main.c: 124: ser_init();
	fcall	_ser_init
	line	126
	
l11072:	
;Main.c: 126: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	128
	
l11074:	
;Main.c: 128: TRISC &= 0b10010000;
	movlw	(090h)
	movwf	(??_init+0)^080h+0
	movf	(??_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	130
	
l11076:	
;Main.c: 130: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	131
	
l11078:	
;Main.c: 131: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	132
	
l11080:	
;Main.c: 132: RC0 = 0; RC1 = 0;
	bcf	(56/8),(56)&7
	
l11082:	
	bcf	(57/8),(57)&7
	line	134
	
l11084:	
;Main.c: 134: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	137
	
l11086:	
;Main.c: 137: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	140
	
l11088:	
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
psect	text807,local,class=CODE,delta=2
global __ptext807
__ptext807:

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
psect	text807
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 0
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l11050:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l11052:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l11054:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l11056:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l11058:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l11060:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l11062:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l11064:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l11066:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l11068:	
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
psect	text808,local,class=CODE,delta=2
global __ptext808
__ptext808:

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
psect	text808
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
	
l11042:	
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
	
l11044:	
;lcd.c: 22: PORTD = databyte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_control@databyte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	23
	
l11046:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l11048:	
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
u5077:
	decfsz	((??_lcd_write_control+0)^080h+0),f
	goto	u5077
	decfsz	((??_lcd_write_control+0)^080h+0+1),f
	goto	u5077
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
psect	text809,local,class=CODE,delta=2
global __ptext809
__ptext809:

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
psect	text809
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	46
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 1
; Regs used in _init_adc: [wreg+status,2]
	line	48
	
l11032:	
;adc.c: 48: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	49
	
l11034:	
;adc.c: 49: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	52
	
l11036:	
;adc.c: 52: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	53
	
l11038:	
;adc.c: 53: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	55
	
l11040:	
;adc.c: 55: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_init_adc+0)^080h+0,f
u5087:
decfsz	(??_init_adc+0)^080h+0,f
	goto	u5087
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
psect	text810,local,class=CODE,delta=2
global __ptext810
__ptext810:

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
psect	text810
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
	
l10310:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l10312
	
l4346:	
	line	72
;ser.c: 72: continue;
	goto	l10312
	
l4345:	
	line	71
	
l10312:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	(_txoptr)^080h,w	;volatile
	skipnz
	goto	u3431
	goto	u3430
u3431:
	goto	l10312
u3430:
	
l4347:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l10314:	
;ser.c: 74: txfifo[txiptr] = c;
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
	
l10316:	
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
	
l10318:	
;ser.c: 76: TXIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1124/8)^080h,(1124)&7
	line	77
	
l10320:	
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
psect	text811,local,class=CODE,delta=2
global __ptext811
__ptext811:

;; *************** function _Menu *****************
;; Defined at:
;;		line 182 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
psect	text811
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
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
	
l10284:	
;HMI.c: 183: switch (input)
	goto	l10304
	line	185
;HMI.c: 184: {
;HMI.c: 185: case 1:
	
l5130:	
	line	187
;HMI.c: 187: break;
	goto	l10306
	line	188
;HMI.c: 188: case 2:
	
l5132:	
	line	190
;HMI.c: 190: break;
	goto	l10306
	line	191
;HMI.c: 191: case 3:
	
l5133:	
	line	192
	
l10286:	
;HMI.c: 192: pos--;
	movlw	low(-1)
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(-1)
	addwf	(_pos+1)^080h,f
	line	193
	
l10288:	
;HMI.c: 193: if (pos < 0)
	btfss	(_pos+1)^080h,7
	goto	u3411
	goto	u3410
u3411:
	goto	l10306
u3410:
	line	194
	
l10290:	
;HMI.c: 194: pos = 5 - 1;
	movlw	low(04h)
	movwf	(_pos)^080h
	movlw	high(04h)
	movwf	((_pos)^080h)+1
	goto	l10306
	
l5134:	
	line	196
;HMI.c: 196: break;
	goto	l10306
	line	197
;HMI.c: 197: case 4:
	
l5135:	
	line	198
	
l10292:	
;HMI.c: 198: pos++;
	movlw	low(01h)
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(01h)
	addwf	(_pos+1)^080h,f
	line	199
;HMI.c: 199: if (pos == 5)
	movlw	05h
	xorwf	(_pos)^080h,w
	iorwf	(_pos+1)^080h,w
	skipz
	goto	u3421
	goto	u3420
u3421:
	goto	l10306
u3420:
	line	200
	
l10294:	
;HMI.c: 200: pos = 0;
	clrf	(_pos)^080h
	clrf	(_pos+1)^080h
	goto	l10306
	
l5136:	
	line	202
;HMI.c: 202: break;
	goto	l10306
	line	203
;HMI.c: 203: case 5:
	
l5137:	
	line	204
	
l10296:	
;HMI.c: 204: return pos;
	movf	(_pos)^080h,w
	goto	l5138
	
l10298:	
	goto	l5138
	line	205
	
l10300:	
;HMI.c: 205: break;
	goto	l10306
	line	207
;HMI.c: 207: default:
	
l5139:	
	line	209
;HMI.c: 209: break;
	goto	l10306
	line	210
	
l10302:	
;HMI.c: 210: }
	goto	l10306
	line	183
	
l5129:	
	
l10304:	
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
	goto	l10306
	xorlw	2^1	; case 2
	skipnz
	goto	l10306
	xorlw	3^2	; case 3
	skipnz
	goto	l10286
	xorlw	4^3	; case 4
	skipnz
	goto	l10292
	xorlw	5^4	; case 5
	skipnz
	goto	l10296
	goto	l10306
	opt asmopt_on

	line	210
	
l5131:	
	line	211
	
l10306:	
;HMI.c: 211: return 255;
	movlw	(0FFh)
	goto	l5138
	
l10308:	
	line	212
	
l5138:	
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4217
	global	_spi_transfer
psect	text812,local,class=CODE,delta=2
global __ptext812
__ptext812:

;; *************** function _spi_transfer *****************
;; Defined at:
;;		line 146 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text812
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
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
	
l10274:	
;Main.c: 147: unsigned char temp = 0;
	clrf	(spi_transfer@temp)^080h
	line	149
;Main.c: 149: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	150
	
l10276:	
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
	goto	u3401
	goto	u3400
u3401:
	goto	l2178
u3400:
	goto	l10278
	
l2180:	
	line	153
	
l10278:	
;Main.c: 153: temp = SSPBUF;
	movf	(19),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_spi_transfer+0)^080h+0
	movf	(??_spi_transfer+0)^080h+0,w
	movwf	(spi_transfer@temp)^080h
	line	154
	
l10280:	
;Main.c: 154: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	goto	l2181
	line	156
	
l10282:	
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
psect	text813,local,class=CODE,delta=2
global __ptext813
__ptext813:

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
psect	text813
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 1
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l10248:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l10250:	
;ser.c: 115: TRISC &= 0b10111111;
	movlw	(0BFh)
	movwf	(??_ser_init+0)^080h+0
	movf	(??_ser_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	116
	
l10252:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l10254:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l10256:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l10258:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l10260:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l10262:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l10264:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l10266:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l10268:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l10270:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l10272:	
;ser.c: 132: rxiptr=rxoptr=txiptr=txoptr=0;
	movlw	(0)
	movwf	(_txoptr)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_txiptr)	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_rxoptr)^080h	;volatile
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
psect	text814,local,class=CODE,delta=2
global __ptext814
__ptext814:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 81 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text814
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text814
	line	83
	
i1l10114:	
;Main.c: 83: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	btfss	(101/8),(101)&7
	goto	u320_21
	goto	u320_20
u320_21:
	goto	i1l10124
u320_20:
	
i1l10116:	
	movf	(26),w	;volatile
	movwf	(??_isr1+0)+0
	movf	(_rxiptr),w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	movf	(??_isr1+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
i1l10118:	
	movf	(_rxiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ser_tmp)^080h
	
i1l10120:	
	movf	(_ser_tmp)^080h,w
	xorwf	(_rxoptr)^080h,w	;volatile
	skipnz
	goto	u321_21
	goto	u321_20
u321_21:
	goto	i1l10124
u321_20:
	
i1l10122:	
	movf	(_ser_tmp)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)	;volatile
	goto	i1l10124
	
i1l2163:	
	goto	i1l10124
	
i1l2162:	
	
i1l10124:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(100/8),(100)&7
	goto	u322_21
	goto	u322_20
u322_21:
	goto	i1l2164
u322_20:
	
i1l10126:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u323_21
	goto	u323_20
u323_21:
	goto	i1l2164
u323_20:
	
i1l10128:	
	movf	(_txoptr)^080h,w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	
i1l10130:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_txoptr)^080h,f	;volatile
	
i1l10132:	
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	(_txoptr)^080h,f	;volatile
	
i1l10134:	
	movf	(_txoptr)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_txiptr),w	;volatile
	skipz
	goto	u324_21
	goto	u324_20
u324_21:
	goto	i1l2164
u324_20:
	
i1l10136:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2164
	
i1l2165:	
	
i1l2164:	
	line	85
;Main.c: 85: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u325_21
	goto	u325_20
u325_21:
	goto	i1l2172
u325_20:
	line	87
	
i1l10138:	
;Main.c: 86: {
;Main.c: 87: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	88
	
i1l10140:	
;Main.c: 88: TMR0 = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	90
;Main.c: 90: RTC_Counter++;
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RTC_Counter)^080h,f	;volatile
	skipnc
	incf	(_RTC_Counter+1)^080h,f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1)^080h,f	;volatile
	line	92
	
i1l10142:	
;Main.c: 92: RTC_FLAG_1MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	93
	
i1l10144:	
;Main.c: 93: if(RTC_Counter % 10 == 0)
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RTC_Counter+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RTC_Counter)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	i1l10148
u326_20:
	line	95
	
i1l10146:	
;Main.c: 94: {
;Main.c: 95: RTC_FLAG_10MS = 1;
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l10148
	line	97
	
i1l2167:	
	line	98
	
i1l10148:	
;Main.c: 97: }
;Main.c: 98: if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
	movlw	low(032h)
	movwf	(?___lwmod)
	movlw	high(032h)
	movwf	((?___lwmod))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RTC_Counter+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RTC_Counter)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	i1l10152
u327_20:
	
i1l10150:	
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l10152
	
i1l2168:	
	line	99
	
i1l10152:	
;Main.c: 99: if(RTC_Counter % 250 == 0)
	movlw	low(0FAh)
	movwf	(?___lwmod)
	movlw	high(0FAh)
	movwf	((?___lwmod))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RTC_Counter+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RTC_Counter)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	goto	i1l10158
u328_20:
	line	101
	
i1l10154:	
;Main.c: 100: {
;Main.c: 101: readAvgDistance();
	fcall	_readAvgDistance
	line	102
;Main.c: 102: UpdateDisplay();
	fcall	_UpdateDisplay
	line	103
	
i1l10156:	
;Main.c: 103: RTC_FLAG_250MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l10158
	line	105
	
i1l2169:	
	line	106
	
i1l10158:	
;Main.c: 105: }
;Main.c: 106: if(RTC_Counter % 500 == 0)
	movlw	low(01F4h)
	movwf	(?___lwmod)
	movlw	high(01F4h)
	movwf	((?___lwmod))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RTC_Counter+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_RTC_Counter)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u329_21
	goto	u329_20
u329_21:
	goto	i1l10166
u329_20:
	line	108
	
i1l10160:	
;Main.c: 107: {
;Main.c: 108: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	109
	
i1l10162:	
;Main.c: 109: RTC_Counter = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_RTC_Counter)^080h	;volatile
	clrf	(_RTC_Counter+1)^080h	;volatile
	line	110
	
i1l10164:	
;Main.c: 110: RB0 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l10166
	line	111
	
i1l2170:	
	line	113
	
i1l10166:	
;Main.c: 111: }
;Main.c: 113: if (buttonPressed == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_buttonPressed)^080h,f
	skipz	;volatile
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l2172
u330_20:
	line	115
	
i1l10168:	
;Main.c: 114: {
;Main.c: 115: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_buttonPressed)^080h	;volatile
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
psect	text815,local,class=CODE,delta=2
global __ptext815
__ptext815:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 215 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
psect	text815
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	215
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
	opt	stack 1
; Regs used in _UpdateDisplay: [allreg]
	line	216
	
i1l10186:	
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
u333_20:
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
	goto	u333_20
	line	217
	
i1l10188:	
;HMI.c: 217: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	i1_lcd_write_control
	line	218
	
i1l10190:	
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

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distance+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?_sprintf)+03h
	addwf	1+(?_sprintf)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_distance)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?_sprintf)+03h
	addwf	0+(?_sprintf)+03h

	movlw	(UpdateDisplay@adcOutput)&0ffh
	fcall	_sprintf
	line	219
	
i1l10192:	
;HMI.c: 219: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	220
	
i1l10194:	
;HMI.c: 220: lcd_write_string(adcOutput);
	movlw	(UpdateDisplay@adcOutput&0ffh)
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	225
	
i1l10196:	
;HMI.c: 225: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	226
	
i1l10198:	
;HMI.c: 226: if (pos > 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u334_25
	movlw	low(01h)
	subwf	(_pos)^080h,w
u334_25:

	skipc
	goto	u334_21
	goto	u334_20
u334_21:
	goto	i1l10202
u334_20:
	line	227
	
i1l10200:	
;HMI.c: 227: lcd_write_string(shortMenuStrings[pos - 1]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	0FFh
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	goto	i1l10204
	line	228
	
i1l5144:	
	line	229
	
i1l10202:	
;HMI.c: 228: else
;HMI.c: 229: lcd_write_string(shortMenuStrings[pos + 5 - 1]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	04h
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	goto	i1l10204
	
i1l5145:	
	line	230
	
i1l10204:	
;HMI.c: 230: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	231
	
i1l10206:	
;HMI.c: 231: lcd_write_string(menuStrings[pos]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
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
	
i1l10208:	
;HMI.c: 233: lcd_write_string(shortMenuStrings[(pos + 1) % 5]);
	movlw	low(05h)
	movwf	(?___awmod)
	movlw	high(05h)
	movwf	((?___awmod))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	low(01h)
	movwf	0+(?___awmod)+02h
	movf	(_pos+1)^080h,w
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
	line	234
	
i1l5146:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,88
	global	_readAvgDistance
psect	text816,local,class=CODE,delta=2
global __ptext816
__ptext816:

;; *************** function _readAvgDistance *****************
;; Defined at:
;;		line 10 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   67[BANK0 ] int 
;;  fullval         2   65[BANK0 ] unsigned int 
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
psect	text816
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	10
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [allreg]
	line	11
	
i1l10170:	
;infrared.c: 11: unsigned int fullval = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(readAvgDistance@fullval)
	clrf	(readAvgDistance@fullval+1)
	line	14
;infrared.c: 14: for (int i = 0; i < 10; i++)
	clrf	(readAvgDistance@i)
	clrf	(readAvgDistance@i+1)
	
i1l10172:	
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
	goto	i1l10176
u331_20:
	goto	i1l10182
	
i1l10174:	
	goto	i1l10182
	line	15
	
i1l2898:	
	line	16
	
i1l10176:	
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
	
i1l10178:	
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
i1l10180:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u332_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u332_25:

	skipc
	goto	u332_21
	goto	u332_20
u332_21:
	goto	i1l10176
u332_20:
	goto	i1l10182
	
i1l2899:	
	line	19
	
i1l10182:	
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
	
i1l10184:	
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
	global	_ADCconvert
psect	text817,local,class=CODE,delta=2
global __ptext817
__ptext817:

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
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lwtoft
;;		___ftge
;;		___ftneg
;;		___ftadd
;;		___ftmul
;;		___ftdiv
;;		___fttol
;;		___wmul
;;		___lwdiv
;; This function is called by:
;;		_readAvgDistance
;; This function uses a non-reentrant model
;;
psect	text817
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	33
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 0
; Regs used in _ADCconvert: [allreg]
	line	39
	
i1l10328:	
;infrared.c: 39: if (adcVal >= 2.5 && adcVal < 2.75)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftge)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftge+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x20
	movwf	1+(?___ftge)+03h
	movlw	0x40
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l10334
u344_20:
	
i1l10330:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftge)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftge+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x30
	movwf	1+(?___ftge)+03h
	movlw	0x40
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u345_21
	goto	u345_20
u345_21:
	goto	i1l10334
u345_20:
	line	41
	
i1l10332:	
;infrared.c: 40: {
;infrared.c: 41: distance = 15 + ((20-15)*(2.75-adcVal))/(20-15);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftneg)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	movf	(0+(?___ftneg)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftneg)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftneg)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x30
	movwf	(?___ftadd+1)
	movlw	0x40
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___ftadd)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___ftadd)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0xa0
	movwf	(?___ftmul+1)
	movlw	0x40
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___ftmul)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___ftmul)),w
	movwf	2+(?___ftdiv)+03h
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0xa0
	movwf	(?___ftdiv+1)
	movlw	0x40
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftdiv)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftdiv)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x70
	movwf	(?___ftadd+1)
	movlw	0x41
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(?___fttol)
	movf	(1+(?___ftadd)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftadd)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distance+1)^080h	;volatile
	addwf	(_distance+1)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distance)^080h	;volatile
	addwf	(_distance)^080h	;volatile

	line	42
;infrared.c: 42: }
	goto	i1l2919
	line	43
	
i1l2906:	
	
i1l10334:	
;infrared.c: 43: else if (adcVal >= 2 && adcVal < 2.5)
	movlw	high(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(02h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u346_21
	goto	u346_20
u346_21:
	goto	i1l10340
u346_20:
	
i1l10336:	
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftge)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftge+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x20
	movwf	1+(?___ftge)+03h
	movlw	0x40
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u347_21
	goto	u347_20
u347_21:
	goto	i1l10340
u347_20:
	line	45
	
i1l10338:	
;infrared.c: 44: {
;infrared.c: 45: distance = 20 + ((30-20)*(2.5-adcVal))/(30-20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftneg)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	movf	(0+(?___ftneg)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftneg)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftneg)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x20
	movwf	(?___ftadd+1)
	movlw	0x40
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___ftadd)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___ftadd)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x20
	movwf	(?___ftmul+1)
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___ftmul)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___ftmul)),w
	movwf	2+(?___ftdiv)+03h
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x20
	movwf	(?___ftdiv+1)
	movlw	0x41
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftdiv)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftdiv)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0xa0
	movwf	(?___ftadd+1)
	movlw	0x41
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(?___fttol)
	movf	(1+(?___ftadd)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftadd)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distance+1)^080h	;volatile
	addwf	(_distance+1)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distance)^080h	;volatile
	addwf	(_distance)^080h	;volatile

	line	46
;infrared.c: 46: }
	goto	i1l2919
	line	47
	
i1l2908:	
	
i1l10340:	
;infrared.c: 47: else if (adcVal >= 1.5 && adcVal < 2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftge)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftge+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0xc0
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l10346
u348_20:
	
i1l10342:	
	movlw	high(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(02h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u349_21
	goto	u349_20
u349_21:
	goto	i1l10346
u349_20:
	line	49
	
i1l10344:	
;infrared.c: 48: {
;infrared.c: 49: distance = 30 + ((40-30)*(2-adcVal))/(40-30);
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	comf	(_adcVal),w	;volatile
	movwf	(??_ADCconvert+0)+0
	comf	(_adcVal+1),w	;volatile
	movwf	((??_ADCconvert+0)+0+1)
	incf	(??_ADCconvert+0)+0,f
	skipnz
	incf	((??_ADCconvert+0)+0+1),f
	movf	0+(??_ADCconvert+0)+0,w
	addlw	low(02h)
	movwf	(?___wmul)
	movf	1+(??_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(02h)
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
	goto	i1l2919
	line	51
	
i1l2910:	
	
i1l10346:	
;infrared.c: 51: else if (adcVal >= 1.25 && adcVal < 1.5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftge)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftge+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0xa0
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l10352
u350_20:
	
i1l10348:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftge)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftge+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0xc0
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u351_21
	goto	u351_20
u351_21:
	goto	i1l10352
u351_20:
	line	53
	
i1l10350:	
;infrared.c: 52: {
;infrared.c: 53: distance = 40 + ((50-40)*(1.5-adcVal))/(50-40);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftneg)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	movf	(0+(?___ftneg)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftneg)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftneg)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0xc0
	movwf	(?___ftadd+1)
	movlw	0x3f
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___ftadd)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___ftadd)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x20
	movwf	(?___ftmul+1)
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___ftmul)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___ftmul)),w
	movwf	2+(?___ftdiv)+03h
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x20
	movwf	(?___ftdiv+1)
	movlw	0x41
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftdiv)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftdiv)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x20
	movwf	(?___ftadd+1)
	movlw	0x42
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(?___fttol)
	movf	(1+(?___ftadd)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftadd)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distance+1)^080h	;volatile
	addwf	(_distance+1)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distance)^080h	;volatile
	addwf	(_distance)^080h	;volatile

	line	54
;infrared.c: 54: }
	goto	i1l2919
	line	55
	
i1l2912:	
	
i1l10352:	
;infrared.c: 55: else if (adcVal >= 0.9 && adcVal < 1.25)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftge)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftge+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftge+2)
	movlw	0x66
	movwf	0+(?___ftge)+03h
	movlw	0x66
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l10358
u352_20:
	
i1l10354:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftge)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftge+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0xa0
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u353_21
	goto	u353_20
u353_21:
	goto	i1l10358
u353_20:
	line	57
	
i1l10356:	
;infrared.c: 56: {
;infrared.c: 57: distance = 50 + ((60-50)*(1.25-adcVal))/(30-20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftneg)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	movf	(0+(?___ftneg)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftneg)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftneg)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0xa0
	movwf	(?___ftadd+1)
	movlw	0x3f
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___ftadd)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___ftadd)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x20
	movwf	(?___ftmul+1)
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___ftmul)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___ftmul)),w
	movwf	2+(?___ftdiv)+03h
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x20
	movwf	(?___ftdiv+1)
	movlw	0x41
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftdiv)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftdiv)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x48
	movwf	(?___ftadd+1)
	movlw	0x42
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(?___fttol)
	movf	(1+(?___ftadd)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftadd)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distance+1)^080h	;volatile
	addwf	(_distance+1)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distance)^080h	;volatile
	addwf	(_distance)^080h	;volatile

	line	58
;infrared.c: 58: }
	goto	i1l2919
	line	59
	
i1l2914:	
	
i1l10358:	
;infrared.c: 59: else if (adcVal >= 0.65 && adcVal < 0.9)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftge)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftge+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftge+2)
	movlw	0x66
	movwf	0+(?___ftge)+03h
	movlw	0x26
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l10364
u354_20:
	
i1l10360:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftge)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftge+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftge+2)
	movlw	0x66
	movwf	0+(?___ftge)+03h
	movlw	0x66
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l10364
u355_20:
	line	61
	
i1l10362:	
;infrared.c: 60: {
;infrared.c: 61: distance = 60 + ((70-60)*(0.9-adcVal))/(30-20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftneg)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	movf	(0+(?___ftneg)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftneg)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftneg)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x66
	movwf	(?___ftadd)
	movlw	0x66
	movwf	(?___ftadd+1)
	movlw	0x3f
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___ftadd)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___ftadd)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x20
	movwf	(?___ftmul+1)
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___ftmul)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___ftmul)),w
	movwf	2+(?___ftdiv)+03h
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x20
	movwf	(?___ftdiv+1)
	movlw	0x41
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftdiv)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftdiv)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x70
	movwf	(?___ftadd+1)
	movlw	0x42
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(?___fttol)
	movf	(1+(?___ftadd)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftadd)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distance+1)^080h	;volatile
	addwf	(_distance+1)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distance)^080h	;volatile
	addwf	(_distance)^080h	;volatile

	line	62
;infrared.c: 62: }
	goto	i1l2919
	line	63
	
i1l2916:	
	
i1l10364:	
;infrared.c: 63: else if (adcVal >= 0.5 && adcVal < 0.65)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftge)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftge+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x0
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u356_21
	goto	u356_20
u356_21:
	goto	i1l2919
u356_20:
	
i1l10366:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftge)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftge+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftge+2)
	movlw	0x66
	movwf	0+(?___ftge)+03h
	movlw	0x26
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u357_21
	goto	u357_20
u357_21:
	goto	i1l2919
u357_20:
	line	65
	
i1l10368:	
;infrared.c: 64: {
;infrared.c: 65: distance = 70 + ((80-70)*(0.65-adcVal))/(30-20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adcVal+1),w	;volatile
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_adcVal),w	;volatile
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	(?___ftneg)
	movf	(1+(?___lwtoft)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___lwtoft)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	movf	(0+(?___ftneg)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftneg)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftneg)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x66
	movwf	(?___ftadd)
	movlw	0x26
	movwf	(?___ftadd+1)
	movlw	0x3f
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___ftadd)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___ftadd)),w
	movwf	2+(?___ftmul)+03h
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x20
	movwf	(?___ftmul+1)
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___ftmul)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___ftmul)),w
	movwf	2+(?___ftdiv)+03h
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x20
	movwf	(?___ftdiv+1)
	movlw	0x41
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftdiv)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftdiv)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x8c
	movwf	(?___ftadd+1)
	movlw	0x42
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(?___fttol)
	movf	(1+(?___ftadd)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftadd)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distance+1)^080h	;volatile
	addwf	(_distance+1)^080h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___fttol)))),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_distance)^080h	;volatile
	addwf	(_distance)^080h	;volatile

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
	global	_readDistance
psect	text818,local,class=CODE,delta=2
global __ptext818
__ptext818:

;; *************** function _readDistance *****************
;; Defined at:
;;		line 24 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
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
psect	text818
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	24
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	27
	
i1l10322:	
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
	
i1l10324:	
;infrared.c: 29: return fullval;
	movf	(readDistance@fullval+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@fullval),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	i1l2903
	
i1l10326:	
	line	30
	
i1l2903:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_lcd_write_string
psect	text819,local,class=CODE,delta=2
global __ptext819
__ptext819:

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
psect	text819
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 1
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
i1l10080:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	i1l10086
	
i1l1403:	
	
i1l10082:	
	movf	(lcd_write_string@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
i1l10084:	
	movlw	low(01h)
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
	goto	i1l10086
	
i1l1402:	
	
i1l10086:	
	movf	(lcd_write_string@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u316_21
	goto	u316_20
u316_21:
	goto	i1l10082
u316_20:
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
psect	text820,local,class=CODE,delta=2
global __ptext820
__ptext820:

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
psect	text820
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
	
i1l10076:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
i1l10078:	
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
psect	text821,local,class=CODE,delta=2
global __ptext821
__ptext821:

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
psect	text821
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
	
i1l11024:	
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
	
i1l11026:	
;lcd.c: 22: PORTD = databyte;
	movf	(i1lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
i1l11028:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
i1l11030:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??i1_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??i1_lcd_write_control+0)+0),f
u509_27:
	decfsz	((??i1_lcd_write_control+0)+0),f
	goto	u509_27
	decfsz	((??i1_lcd_write_control+0)+0+1),f
	goto	u509_27
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
	global	___lwtoft
psect	text822,local,class=CODE,delta=2
global __ptext822
__ptext822:

;; *************** function ___lwtoft *****************
;; Defined at:
;;		line 29 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   14[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3   14[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_ADCconvert
;; This function uses a non-reentrant model
;;
psect	text822
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwtoft.c"
	line	29
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
	opt	stack 0
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
i1l10978:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwtoft@c),w
	movwf	(?___ftpack)
	movf	(___lwtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___lwtoft+0)+0
	movf	(??___lwtoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	clrf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lwtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lwtoft+2)
	goto	i1l6819
	
i1l10980:	
	line	31
	
i1l6819:	
	return
	opt stack 0
GLOBAL	__end_of___lwtoft
	__end_of___lwtoft:
;; =============== function ___lwtoft ends ============

	signat	___lwtoft,4219
	global	___ftmul
psect	text823,local,class=CODE,delta=2
global __ptext823
__ptext823:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   31[BANK0 ] float 
;;  f2              3   34[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   42[BANK0 ] unsigned um
;;  sign            1   46[BANK0 ] unsigned char 
;;  cntr            1   45[BANK0 ] unsigned char 
;;  exp             1   41[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   31[BANK0 ] float 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_ADCconvert
;; This function uses a non-reentrant model
;;
psect	text823
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 0
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
i1l10802:	
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
	goto	u453_21
	goto	u453_20
u453_21:
	goto	i1l10808
u453_20:
	line	57
	
i1l10804:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	i1l6695
	
i1l10806:	
	goto	i1l6695
	
i1l6694:	
	line	58
	
i1l10808:	
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
	goto	u454_21
	goto	u454_20
u454_21:
	goto	i1l10814
u454_20:
	line	59
	
i1l10810:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	i1l6695
	
i1l10812:	
	goto	i1l6695
	
i1l6696:	
	line	60
	
i1l10814:	
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
u455_25:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u455_20:
	addlw	-1
	skipz
	goto	u455_25
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
u456_25:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u456_20:
	addlw	-1
	skipz
	goto	u456_25
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
	
i1l10816:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
i1l10818:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
i1l10820:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
i1l10822:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
i1l10824:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	i1l10826
	line	70
	
i1l6697:	
	line	71
	
i1l10826:	
	btfss	(___ftmul@f1),(0)&7
	goto	u457_21
	goto	u457_20
u457_21:
	goto	i1l10830
u457_20:
	line	72
	
i1l10828:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u458_21
	addwf	(___ftmul@f3_as_product+1),f
u458_21:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u458_22
	addwf	(___ftmul@f3_as_product+2),f
u458_22:

	goto	i1l10830
	
i1l6698:	
	line	73
	
i1l10830:	
	movlw	01h
u459_25:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u459_25

	line	74
	
i1l10832:	
	movlw	01h
u460_25:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u460_25
	line	75
	
i1l10834:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u461_21
	goto	u461_20
u461_21:
	goto	i1l10826
u461_20:
	goto	i1l10836
	
i1l6699:	
	line	76
	
i1l10836:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	i1l10838
	line	77
	
i1l6700:	
	line	78
	
i1l10838:	
	btfss	(___ftmul@f1),(0)&7
	goto	u462_21
	goto	u462_20
u462_21:
	goto	i1l10842
u462_20:
	line	79
	
i1l10840:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u463_21
	addwf	(___ftmul@f3_as_product+1),f
u463_21:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u463_22
	addwf	(___ftmul@f3_as_product+2),f
u463_22:

	goto	i1l10842
	
i1l6701:	
	line	80
	
i1l10842:	
	movlw	01h
u464_25:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u464_25

	line	81
	
i1l10844:	
	movlw	01h
u465_25:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u465_25

	line	82
	
i1l10846:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u466_21
	goto	u466_20
u466_21:
	goto	i1l10838
u466_20:
	goto	i1l10848
	
i1l6702:	
	line	83
	
i1l10848:	
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
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	goto	i1l6695
	
i1l10850:	
	line	84
	
i1l6695:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___ftdiv
psect	text824,local,class=CODE,delta=2
global __ptext824
__ptext824:

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 50 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3   47[BANK0 ] float 
;;  f1              3   50[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   58[BANK0 ] float 
;;  sign            1   62[BANK0 ] unsigned char 
;;  exp             1   61[BANK0 ] unsigned char 
;;  cntr            1   57[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   47[BANK0 ] float 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_ADCconvert
;; This function uses a non-reentrant model
;;
psect	text824
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftdiv.c"
	line	50
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
	opt	stack 0
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
i1l10760:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@exp)
	movf	((___ftdiv@exp)),f
	skipz
	goto	u445_21
	goto	u445_20
u445_21:
	goto	i1l10766
u445_20:
	line	56
	
i1l10762:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	i1l6685
	
i1l10764:	
	goto	i1l6685
	
i1l6684:	
	line	57
	
i1l10766:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	movf	((___ftdiv@sign)),f
	skipz
	goto	u446_21
	goto	u446_20
u446_21:
	goto	i1l10772
u446_20:
	line	58
	
i1l10768:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	i1l6685
	
i1l10770:	
	goto	i1l6685
	
i1l6686:	
	line	59
	
i1l10772:	
	movlw	0
	movwf	(___ftdiv@f3)
	movlw	0
	movwf	(___ftdiv@f3+1)
	movlw	0
	movwf	(___ftdiv@f3+2)
	line	60
	
i1l10774:	
	movlw	(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	61
	
i1l10776:	
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u447_25:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u447_20:
	addlw	-1
	skipz
	goto	u447_25
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	line	62
	
i1l10778:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u448_25:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u448_20:
	addlw	-1
	skipz
	goto	u448_25
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	xorwf	(___ftdiv@sign),f
	line	63
	
i1l10780:	
	movlw	(080h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	andwf	(___ftdiv@sign),f
	line	64
	
i1l10782:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	65
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	66
	
i1l10784:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	67
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	68
	movlw	(018h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	(___ftdiv@cntr)
	goto	i1l10786
	line	69
	
i1l6687:	
	line	70
	
i1l10786:	
	movlw	01h
u449_25:
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	addlw	-1
	skipz
	goto	u449_25
	line	71
	
i1l10788:	
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u450_25
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u450_25
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u450_25:
	skipc
	goto	u450_21
	goto	u450_20
u450_21:
	goto	i1l10794
u450_20:
	line	72
	
i1l10790:	
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),f
	movf	(___ftdiv@f2+1),w
	skipc
	incfsz	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),f
	movf	(___ftdiv@f2+2),w
	skipc
	incf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),f
	line	73
	
i1l10792:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	goto	i1l10794
	line	74
	
i1l6688:	
	line	75
	
i1l10794:	
	movlw	01h
u451_25:
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	addlw	-1
	skipz
	goto	u451_25
	line	76
	
i1l10796:	
	movlw	low(01h)
	subwf	(___ftdiv@cntr),f
	btfss	status,2
	goto	u452_21
	goto	u452_20
u452_21:
	goto	i1l10786
u452_20:
	goto	i1l10798
	
i1l6689:	
	line	77
	
i1l10798:	
	movf	(___ftdiv@f3),w
	movwf	(?___ftpack)
	movf	(___ftdiv@f3+1),w
	movwf	(?___ftpack+1)
	movf	(___ftdiv@f3+2),w
	movwf	(?___ftpack+2)
	movf	(___ftdiv@exp),w
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftdiv@sign),w
	movwf	(??___ftdiv+1)+0
	movf	(??___ftdiv+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftdiv)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftdiv+2)
	goto	i1l6685
	
i1l10800:	
	line	78
	
i1l6685:	
	return
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
;; =============== function ___ftdiv ends ============

	signat	___ftdiv,8315
	global	___ftadd
psect	text825,local,class=CODE,delta=2
global __ptext825
__ptext825:

;; *************** function ___ftadd *****************
;; Defined at:
;;		line 87 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftadd.c"
;; Parameters:    Size  Location     Type
;;  f1              3   18[BANK0 ] float 
;;  f2              3   21[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  exp1            1   30[BANK0 ] unsigned char 
;;  exp2            1   29[BANK0 ] unsigned char 
;;  sign            1   28[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   18[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_ADCconvert
;;		___ftsub
;; This function uses a non-reentrant model
;;
psect	text825
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftadd.c"
	line	87
	global	__size_of___ftadd
	__size_of___ftadd	equ	__end_of___ftadd-___ftadd
	
___ftadd:	
	opt	stack 0
; Regs used in ___ftadd: [wreg+status,2+status,0+pclath+cstack]
	line	90
	
i1l10654:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftadd@f1),w
	movwf	((??___ftadd+0)+0)
	movf	(___ftadd@f1+1),w
	movwf	((??___ftadd+0)+0+1)
	movf	(___ftadd@f1+2),w
	movwf	((??___ftadd+0)+0+2)
	clrc
	rlf	(??___ftadd+0)+1,w
	rlf	(??___ftadd+0)+2,w
	movwf	(??___ftadd+3)+0
	movf	(??___ftadd+3)+0,w
	movwf	(___ftadd@exp1)
	line	91
	movf	(___ftadd@f2),w
	movwf	((??___ftadd+0)+0)
	movf	(___ftadd@f2+1),w
	movwf	((??___ftadd+0)+0+1)
	movf	(___ftadd@f2+2),w
	movwf	((??___ftadd+0)+0+2)
	clrc
	rlf	(??___ftadd+0)+1,w
	rlf	(??___ftadd+0)+2,w
	movwf	(??___ftadd+3)+0
	movf	(??___ftadd+3)+0,w
	movwf	(___ftadd@exp2)
	line	92
	
i1l10656:	
	movf	(___ftadd@exp1),w
	skipz
	goto	u410_20
	goto	i1l10662
u410_20:
	
i1l10658:	
	movf	(___ftadd@exp2),w
	subwf	(___ftadd@exp1),w
	skipnc
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l10666
u411_20:
	
i1l10660:	
	decf	(___ftadd@exp1),w
	xorlw	0ffh
	addwf	(___ftadd@exp2),w
	movwf	(??___ftadd+0)+0
	movlw	(019h)
	subwf	0+(??___ftadd+0)+0,w
	skipc
	goto	u412_21
	goto	u412_20
u412_21:
	goto	i1l10666
u412_20:
	goto	i1l10662
	
i1l6642:	
	line	93
	
i1l10662:	
	movf	(___ftadd@f2),w
	movwf	(?___ftadd)
	movf	(___ftadd@f2+1),w
	movwf	(?___ftadd+1)
	movf	(___ftadd@f2+2),w
	movwf	(?___ftadd+2)
	goto	i1l6643
	
i1l10664:	
	goto	i1l6643
	
i1l6640:	
	line	94
	
i1l10666:	
	movf	(___ftadd@exp2),w
	skipz
	goto	u413_20
	goto	i1l6646
u413_20:
	
i1l10668:	
	movf	(___ftadd@exp1),w
	subwf	(___ftadd@exp2),w
	skipnc
	goto	u414_21
	goto	u414_20
u414_21:
	goto	i1l10672
u414_20:
	
i1l10670:	
	decf	(___ftadd@exp2),w
	xorlw	0ffh
	addwf	(___ftadd@exp1),w
	movwf	(??___ftadd+0)+0
	movlw	(019h)
	subwf	0+(??___ftadd+0)+0,w
	skipc
	goto	u415_21
	goto	u415_20
u415_21:
	goto	i1l10672
u415_20:
	
i1l6646:	
	line	95
	goto	i1l6643
	
i1l6644:	
	line	96
	
i1l10672:	
	movlw	(06h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	movwf	(___ftadd@sign)
	line	97
	
i1l10674:	
	btfss	(___ftadd@f1+2),(23)&7
	goto	u416_21
	goto	u416_20
u416_21:
	goto	i1l6647
u416_20:
	line	98
	
i1l10676:	
	bsf	(___ftadd@sign)+(7/8),(7)&7
	
i1l6647:	
	line	99
	btfss	(___ftadd@f2+2),(23)&7
	goto	u417_21
	goto	u417_20
u417_21:
	goto	i1l6648
u417_20:
	line	100
	
i1l10678:	
	bsf	(___ftadd@sign)+(6/8),(6)&7
	
i1l6648:	
	line	101
	bsf	(___ftadd@f1)+(15/8),(15)&7
	line	102
	
i1l10680:	
	movlw	0FFh
	andwf	(___ftadd@f1),f
	movlw	0FFh
	andwf	(___ftadd@f1+1),f
	movlw	0
	andwf	(___ftadd@f1+2),f
	line	103
	
i1l10682:	
	bsf	(___ftadd@f2)+(15/8),(15)&7
	line	104
	movlw	0FFh
	andwf	(___ftadd@f2),f
	movlw	0FFh
	andwf	(___ftadd@f2+1),f
	movlw	0
	andwf	(___ftadd@f2+2),f
	line	106
	movf	(___ftadd@exp2),w
	subwf	(___ftadd@exp1),w
	skipnc
	goto	u418_21
	goto	u418_20
u418_21:
	goto	i1l10694
u418_20:
	goto	i1l10684
	line	109
	
i1l6650:	
	line	110
	
i1l10684:	
	movlw	01h
u419_25:
	clrc
	rlf	(___ftadd@f2),f
	rlf	(___ftadd@f2+1),f
	rlf	(___ftadd@f2+2),f
	addlw	-1
	skipz
	goto	u419_25
	line	111
	movlw	low(01h)
	subwf	(___ftadd@exp2),f
	line	112
	
i1l10686:	
	movf	(___ftadd@exp2),w
	xorwf	(___ftadd@exp1),w
	skipnz
	goto	u420_21
	goto	u420_20
u420_21:
	goto	i1l10692
u420_20:
	
i1l10688:	
	movlw	low(01h)
	subwf	(___ftadd@sign),f
	movf	((___ftadd@sign)),w
	andlw	07h
	btfss	status,2
	goto	u421_21
	goto	u421_20
u421_21:
	goto	i1l10684
u421_20:
	goto	i1l10692
	
i1l6652:	
	goto	i1l10692
	
i1l6653:	
	line	113
	goto	i1l10692
	
i1l6655:	
	line	114
	
i1l10690:	
	movlw	01h
u422_25:
	clrc
	rrf	(___ftadd@f1+2),f
	rrf	(___ftadd@f1+1),f
	rrf	(___ftadd@f1),f
	addlw	-1
	skipz
	goto	u422_25

	line	115
	movlw	(01h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	addwf	(___ftadd@exp1),f
	goto	i1l10692
	line	116
	
i1l6654:	
	line	113
	
i1l10692:	
	movf	(___ftadd@exp1),w
	xorwf	(___ftadd@exp2),w
	skipz
	goto	u423_21
	goto	u423_20
u423_21:
	goto	i1l10690
u423_20:
	goto	i1l6657
	
i1l6656:	
	line	117
	goto	i1l6657
	
i1l6649:	
	
i1l10694:	
	movf	(___ftadd@exp1),w
	subwf	(___ftadd@exp2),w
	skipnc
	goto	u424_21
	goto	u424_20
u424_21:
	goto	i1l6657
u424_20:
	goto	i1l10696
	line	120
	
i1l6659:	
	line	121
	
i1l10696:	
	movlw	01h
u425_25:
	clrc
	rlf	(___ftadd@f1),f
	rlf	(___ftadd@f1+1),f
	rlf	(___ftadd@f1+2),f
	addlw	-1
	skipz
	goto	u425_25
	line	122
	movlw	low(01h)
	subwf	(___ftadd@exp1),f
	line	123
	
i1l10698:	
	movf	(___ftadd@exp2),w
	xorwf	(___ftadd@exp1),w
	skipnz
	goto	u426_21
	goto	u426_20
u426_21:
	goto	i1l10704
u426_20:
	
i1l10700:	
	movlw	low(01h)
	subwf	(___ftadd@sign),f
	movf	((___ftadd@sign)),w
	andlw	07h
	btfss	status,2
	goto	u427_21
	goto	u427_20
u427_21:
	goto	i1l10696
u427_20:
	goto	i1l10704
	
i1l6661:	
	goto	i1l10704
	
i1l6662:	
	line	124
	goto	i1l10704
	
i1l6664:	
	line	125
	
i1l10702:	
	movlw	01h
u428_25:
	clrc
	rrf	(___ftadd@f2+2),f
	rrf	(___ftadd@f2+1),f
	rrf	(___ftadd@f2),f
	addlw	-1
	skipz
	goto	u428_25

	line	126
	movlw	(01h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	addwf	(___ftadd@exp2),f
	goto	i1l10704
	line	127
	
i1l6663:	
	line	124
	
i1l10704:	
	movf	(___ftadd@exp1),w
	xorwf	(___ftadd@exp2),w
	skipz
	goto	u429_21
	goto	u429_20
u429_21:
	goto	i1l10702
u429_20:
	goto	i1l6657
	
i1l6665:	
	goto	i1l6657
	line	128
	
i1l6658:	
	line	129
	
i1l6657:	
	btfss	(___ftadd@sign),(7)&7
	goto	u430_21
	goto	u430_20
u430_21:
	goto	i1l10708
u430_20:
	line	131
	
i1l10706:	
	movlw	0FFh
	xorwf	(___ftadd@f1),f
	movlw	0FFh
	xorwf	(___ftadd@f1+1),f
	movlw	0FFh
	xorwf	(___ftadd@f1+2),f
	line	132
	movlw	01h
	addwf	(___ftadd@f1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f1+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f1+2),f
	goto	i1l10708
	line	133
	
i1l6666:	
	line	134
	
i1l10708:	
	btfss	(___ftadd@sign),(6)&7
	goto	u431_21
	goto	u431_20
u431_21:
	goto	i1l10712
u431_20:
	line	136
	
i1l10710:	
	movlw	0FFh
	xorwf	(___ftadd@f2),f
	movlw	0FFh
	xorwf	(___ftadd@f2+1),f
	movlw	0FFh
	xorwf	(___ftadd@f2+2),f
	line	137
	movlw	01h
	addwf	(___ftadd@f2),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+2),f
	goto	i1l10712
	line	138
	
i1l6667:	
	line	139
	
i1l10712:	
	clrf	(___ftadd@sign)
	line	140
	movf	(___ftadd@f1),w
	addwf	(___ftadd@f2),f
	movf	(___ftadd@f1+1),w
	clrz
	skipnc
	incf	(___ftadd@f1+1),w
	skipnz
	goto	u432_21
	addwf	(___ftadd@f2+1),f
u432_21:
	movf	(___ftadd@f1+2),w
	clrz
	skipnc
	incf	(___ftadd@f1+2),w
	skipnz
	goto	u432_22
	addwf	(___ftadd@f2+2),f
u432_22:

	line	141
	
i1l10714:	
	btfss	(___ftadd@f2+2),(23)&7
	goto	u433_21
	goto	u433_20
u433_21:
	goto	i1l10720
u433_20:
	line	142
	
i1l10716:	
	movlw	0FFh
	xorwf	(___ftadd@f2),f
	movlw	0FFh
	xorwf	(___ftadd@f2+1),f
	movlw	0FFh
	xorwf	(___ftadd@f2+2),f
	line	143
	movlw	01h
	addwf	(___ftadd@f2),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+2),f
	line	144
	
i1l10718:	
	clrf	(___ftadd@sign)
	bsf	status,0
	rlf	(___ftadd@sign),f
	goto	i1l10720
	line	145
	
i1l6668:	
	line	146
	
i1l10720:	
	movf	(___ftadd@f2),w
	movwf	(?___ftpack)
	movf	(___ftadd@f2+1),w
	movwf	(?___ftpack+1)
	movf	(___ftadd@f2+2),w
	movwf	(?___ftpack+2)
	movf	(___ftadd@exp1),w
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftadd@sign),w
	movwf	(??___ftadd+1)+0
	movf	(??___ftadd+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftadd)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftadd+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftadd+2)
	goto	i1l6643
	
i1l10722:	
	line	148
	
i1l6643:	
	return
	opt stack 0
GLOBAL	__end_of___ftadd
	__end_of___ftadd:
;; =============== function ___ftadd ends ============

	signat	___ftadd,8315
	global	_sprintf
psect	text826,local,class=CODE,delta=2
global __ptext826
__ptext826:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
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
psect	text826
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
	
i1l10536:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	i1l10588
	
i1l5895:	
	line	542
	
i1l10538:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u385_21
	goto	u385_20
u385_21:
	goto	i1l5896
u385_20:
	line	545
	
i1l10540:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l10542:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	i1l10588
	line	547
	
i1l5896:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	i1l10546
	line	640
	
i1l5898:	
	line	641
	goto	i1l10590
	line	700
	
i1l5900:	
	goto	i1l10548
	line	701
	
i1l5901:	
	line	702
	goto	i1l10548
	line	805
	
i1l5903:	
	line	816
	goto	i1l10588
	line	825
	
i1l10544:	
	goto	i1l10548
	line	638
	
i1l5897:	
	
i1l10546:	
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
	goto	i1l10590
	xorlw	100^0	; case 100
	skipnz
	goto	i1l10548
	xorlw	105^100	; case 105
	skipnz
	goto	i1l10548
	goto	i1l10588
	opt asmopt_on

	line	825
	
i1l5902:	
	line	1254
	
i1l10548:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
i1l10550:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
i1l10552:	
	btfss	(sprintf@_val+1),7
	goto	u386_21
	goto	u386_20
u386_21:
	goto	i1l10558
u386_20:
	line	1257
	
i1l10554:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
i1l10556:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	i1l10558
	line	1259
	
i1l5904:	
	line	1300
	
i1l10558:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
i1l10560:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u387_21
	goto	u387_20
u387_21:
	goto	i1l10564
u387_20:
	goto	i1l10572
	
i1l10562:	
	goto	i1l10572
	line	1301
	
i1l5905:	
	
i1l10564:	
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
	goto	u388_25
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u388_25:
	skipnc
	goto	u388_21
	goto	u388_20
u388_21:
	goto	i1l10568
u388_20:
	goto	i1l10572
	line	1302
	
i1l10566:	
	goto	i1l10572
	
i1l5907:	
	line	1300
	
i1l10568:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
i1l10570:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u389_21
	goto	u389_20
u389_21:
	goto	i1l10564
u389_20:
	goto	i1l10572
	
i1l5906:	
	line	1433
	
i1l10572:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u390_21
	goto	u390_20
u390_21:
	goto	i1l10578
u390_20:
	line	1434
	
i1l10574:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l10576:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l10578
	
i1l5908:	
	line	1467
	
i1l10578:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	i1l10586
	
i1l5910:	
	line	1484
	
i1l10580:	
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
	
i1l10582:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l10584:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l10586
	line	1517
	
i1l5909:	
	line	1469
	
i1l10586:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u391_21
	goto	u391_20
u391_21:
	goto	i1l10580
u391_20:
	goto	i1l10588
	
i1l5911:	
	goto	i1l10588
	line	1525
	
i1l5894:	
	line	540
	
i1l10588:	
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
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l10538
u392_20:
	goto	i1l10590
	
i1l5912:	
	goto	i1l10590
	line	1527
	
i1l5899:	
	line	1530
	
i1l10590:	
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	i1l5913
	line	1532
	
i1l10592:	
	line	1533
;	Return value of _sprintf is never used
	
i1l5913:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ReadButtons
psect	text827,local,class=CODE,delta=2
global __ptext827
__ptext827:

;; *************** function _ReadButtons *****************
;; Defined at:
;;		line 143 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
psect	text827
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	143
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 2
; Regs used in _ReadButtons: [wreg+status,2+status,0+pclath+cstack]
	line	144
	
i1l10210:	
;HMI.c: 144: Debounce();
	fcall	_Debounce
	line	146
	
i1l10212:	
;HMI.c: 146: if(UpPressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u335_21
	goto	u335_20
u335_21:
	goto	i1l5121
u335_20:
	line	148
	
i1l10214:	
;HMI.c: 147: {
;HMI.c: 148: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	149
	
i1l10216:	
;HMI.c: 149: return 1;
	movlw	(01h)
	goto	i1l5122
	
i1l10218:	
	goto	i1l5122
	line	151
	
i1l5121:	
	line	153
;HMI.c: 151: }
;HMI.c: 153: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u336_21
	goto	u336_20
u336_21:
	goto	i1l5123
u336_20:
	line	155
	
i1l10220:	
;HMI.c: 154: {
;HMI.c: 155: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	156
	
i1l10222:	
;HMI.c: 156: return 2;
	movlw	(02h)
	goto	i1l5122
	
i1l10224:	
	goto	i1l5122
	line	158
	
i1l5123:	
	line	159
;HMI.c: 158: }
;HMI.c: 159: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u337_21
	goto	u337_20
u337_21:
	goto	i1l5124
u337_20:
	line	161
	
i1l10226:	
;HMI.c: 160: {
;HMI.c: 161: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	162
	
i1l10228:	
;HMI.c: 162: return 3;
	movlw	(03h)
	goto	i1l5122
	
i1l10230:	
	goto	i1l5122
	line	164
	
i1l5124:	
	line	165
;HMI.c: 164: }
;HMI.c: 165: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u338_21
	goto	u338_20
u338_21:
	goto	i1l5125
u338_20:
	line	167
	
i1l10232:	
;HMI.c: 166: {
;HMI.c: 167: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	168
	
i1l10234:	
;HMI.c: 168: return 4;
	movlw	(04h)
	goto	i1l5122
	
i1l10236:	
	goto	i1l5122
	line	170
	
i1l5125:	
	line	172
;HMI.c: 170: }
;HMI.c: 172: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l10244
u339_20:
	line	174
	
i1l10238:	
;HMI.c: 173: {
;HMI.c: 174: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	175
	
i1l10240:	
;HMI.c: 175: return 5;
	movlw	(05h)
	goto	i1l5122
	
i1l10242:	
	goto	i1l5122
	line	177
	
i1l5126:	
	line	178
	
i1l10244:	
;HMI.c: 177: }
;HMI.c: 178: return 0;
	movlw	(0)
	goto	i1l5122
	
i1l10246:	
	line	179
	
i1l5122:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
	global	_lcd_write_data
psect	text828,local,class=CODE,delta=2
global __ptext828
__ptext828:

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
psect	text828
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
	
i1l10068:	
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
	
i1l10070:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
i1l10072:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
i1l10074:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u510_27:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u510_27
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u510_27
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
psect	text829,local,class=CODE,delta=2
global __ptext829
__ptext829:

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
psect	text829
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
	
i1l10042:	
;adc.c: 6: switch(channel)
	goto	i1l10050
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
	goto	i1l10052
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
	goto	i1l10052
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
	goto	i1l10052
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
	goto	i1l10052
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
	goto	i1l10052
	line	35
;adc.c: 35: default:
	
i1l696:	
	line	36
	
i1l10044:	
;adc.c: 36: return 0;
	movlw	(0)
	goto	i1l697
	
i1l10046:	
	goto	i1l697
	line	37
	
i1l10048:	
;adc.c: 37: }
	goto	i1l10052
	line	6
	
i1l689:	
	
i1l10050:	
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
	goto	i1l10044
	opt asmopt_on

	line	37
	
i1l691:	
	line	39
	
i1l10052:	
;adc.c: 39: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u511_27:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u511_27
opt asmopt_on

	line	41
	
i1l10054:	
;adc.c: 41: return adc_read();
	fcall	_adc_read
	movf	(0+(?_adc_read)),w
	goto	i1l697
	
i1l10056:	
	line	43
	
i1l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
psect	text830,local,class=CODE,delta=2
global __ptext830
__ptext830:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
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
psect	text830
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
i1l10944:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u485_21
	goto	u485_20
u485_21:
	goto	i1l10948
u485_20:
	line	10
	
i1l10946:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	i1l10948
	line	12
	
i1l6804:	
	line	13
	
i1l10948:	
	btfss	(___awmod@divisor+1),7
	goto	u486_21
	goto	u486_20
u486_21:
	goto	i1l10952
u486_20:
	line	14
	
i1l10950:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	i1l10952
	
i1l6805:	
	line	15
	
i1l10952:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u487_21
	goto	u487_20
u487_21:
	goto	i1l10970
u487_20:
	line	16
	
i1l10954:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	i1l10960
	
i1l6808:	
	line	18
	
i1l10956:	
	movlw	01h
	
u488_25:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u488_25
	line	19
	
i1l10958:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	i1l10960
	line	20
	
i1l6807:	
	line	17
	
i1l10960:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u489_21
	goto	u489_20
u489_21:
	goto	i1l10956
u489_20:
	goto	i1l10962
	
i1l6809:	
	goto	i1l10962
	line	21
	
i1l6810:	
	line	22
	
i1l10962:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u490_25
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u490_25:
	skipc
	goto	u490_21
	goto	u490_20
u490_21:
	goto	i1l10966
u490_20:
	line	23
	
i1l10964:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	i1l10966
	
i1l6811:	
	line	24
	
i1l10966:	
	movlw	01h
	
u491_25:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u491_25
	line	25
	
i1l10968:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u492_21
	goto	u492_20
u492_21:
	goto	i1l10962
u492_20:
	goto	i1l10970
	
i1l6812:	
	goto	i1l10970
	line	26
	
i1l6806:	
	line	27
	
i1l10970:	
	movf	(___awmod@sign),w
	skipz
	goto	u493_20
	goto	i1l10974
u493_20:
	line	28
	
i1l10972:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	i1l10974
	
i1l6813:	
	line	29
	
i1l10974:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	i1l6814
	
i1l10976:	
	line	30
	
i1l6814:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___ftge
psect	text831,local,class=CODE,delta=2
global __ptext831
__ptext831:

;; *************** function ___ftge *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftge.c"
;; Parameters:    Size  Location     Type
;;  ff1             3    8[COMMON] float 
;;  ff2             3   11[COMMON] float 
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
;;      Params:         6       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       6       0       0       0
;;      Totals:         6       6       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCconvert
;; This function uses a non-reentrant model
;;
psect	text831
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftge.c"
	line	5
	global	__size_of___ftge
	__size_of___ftge	equ	__end_of___ftge-___ftge
	
___ftge:	
	opt	stack 1
; Regs used in ___ftge: [wreg+status,2+status,0]
	line	6
	
i1l10924:	
	btfss	(___ftge@ff1+2),(23)&7
	goto	u480_21
	goto	u480_20
u480_21:
	goto	i1l10928
u480_20:
	line	7
	
i1l10926:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___ftge+0)+0)
	movlw	0
	movwf	((??___ftge+0)+0+1)
	movlw	080h
	movwf	((??___ftge+0)+0+2)
	comf	(___ftge@ff1),w
	movwf	(??___ftge+3)+0
	comf	(___ftge@ff1+1),w
	movwf	((??___ftge+3)+0+1)
	comf	(___ftge@ff1+2),w
	movwf	((??___ftge+3)+0+2)
	incf	(??___ftge+3)+0,f
	skipnz
	incf	((??___ftge+3)+0+1),f
	skipnz
	incf	((??___ftge+3)+0+2),f
	movf	0+(??___ftge+3)+0,w
	addwf	(??___ftge+0)+0,f
	movf	1+(??___ftge+3)+0,w
	skipnc
	incfsz	1+(??___ftge+3)+0,w
	goto	u481_21
	goto	u481_22
u481_21:
	addwf	(??___ftge+0)+1,f
	
u481_22:
	movf	2+(??___ftge+3)+0,w
	skipnc
	incfsz	2+(??___ftge+3)+0,w
	goto	u481_23
	goto	u481_24
u481_23:
	addwf	(??___ftge+0)+2,f
	
u481_24:
	movf	0+(??___ftge+0)+0,w
	movwf	(___ftge@ff1)
	movf	1+(??___ftge+0)+0,w
	movwf	(___ftge@ff1+1)
	movf	2+(??___ftge+0)+0,w
	movwf	(___ftge@ff1+2)
	goto	i1l10928
	
i1l6763:	
	line	8
	
i1l10928:	
	btfss	(___ftge@ff2+2),(23)&7
	goto	u482_21
	goto	u482_20
u482_21:
	goto	i1l10932
u482_20:
	line	9
	
i1l10930:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___ftge+0)+0)
	movlw	0
	movwf	((??___ftge+0)+0+1)
	movlw	080h
	movwf	((??___ftge+0)+0+2)
	comf	(___ftge@ff2),w
	movwf	(??___ftge+3)+0
	comf	(___ftge@ff2+1),w
	movwf	((??___ftge+3)+0+1)
	comf	(___ftge@ff2+2),w
	movwf	((??___ftge+3)+0+2)
	incf	(??___ftge+3)+0,f
	skipnz
	incf	((??___ftge+3)+0+1),f
	skipnz
	incf	((??___ftge+3)+0+2),f
	movf	0+(??___ftge+3)+0,w
	addwf	(??___ftge+0)+0,f
	movf	1+(??___ftge+3)+0,w
	skipnc
	incfsz	1+(??___ftge+3)+0,w
	goto	u483_21
	goto	u483_22
u483_21:
	addwf	(??___ftge+0)+1,f
	
u483_22:
	movf	2+(??___ftge+3)+0,w
	skipnc
	incfsz	2+(??___ftge+3)+0,w
	goto	u483_23
	goto	u483_24
u483_23:
	addwf	(??___ftge+0)+2,f
	
u483_24:
	movf	0+(??___ftge+0)+0,w
	movwf	(___ftge@ff2)
	movf	1+(??___ftge+0)+0,w
	movwf	(___ftge@ff2+1)
	movf	2+(??___ftge+0)+0,w
	movwf	(___ftge@ff2+2)
	goto	i1l10932
	
i1l6764:	
	line	10
	
i1l10932:	
	movlw	080h
	xorwf	(___ftge@ff1+2),f
	line	11
	
i1l10934:	
	movlw	080h
	xorwf	(___ftge@ff2+2),f
	line	12
	
i1l10936:	
	movf	(___ftge@ff2+2),w
	subwf	(___ftge@ff1+2),w
	skipz
	goto	u484_25
	movf	(___ftge@ff2+1),w
	subwf	(___ftge@ff1+1),w
	skipz
	goto	u484_25
	movf	(___ftge@ff2),w
	subwf	(___ftge@ff1),w
u484_25:
	skipnc
	goto	u484_21
	goto	u484_20
u484_21:
	goto	i1l10940
u484_20:
	
i1l10938:	
	clrc
	
	goto	i1l6765
	
i1l10034:	
	
i1l10940:	
	setc
	
	goto	i1l6765
	
i1l10036:	
	goto	i1l6765
	
i1l10942:	
	line	13
	
i1l6765:	
	return
	opt stack 0
GLOBAL	__end_of___ftge
	__end_of___ftge:
;; =============== function ___ftge ends ============

	signat	___ftge,8312
	global	___ftneg
psect	text832,local,class=CODE,delta=2
global __ptext832
__ptext832:

;; *************** function ___ftneg *****************
;; Defined at:
;;		line 16 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftneg.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[COMMON] float 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    8[COMMON] float 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCconvert
;; This function uses a non-reentrant model
;;
psect	text832
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\ftneg.c"
	line	16
	global	__size_of___ftneg
	__size_of___ftneg	equ	__end_of___ftneg-___ftneg
	
___ftneg:	
	opt	stack 1
; Regs used in ___ftneg: [wreg]
	line	17
	
i1l10916:	
	movf	(___ftneg@f1+2),w
	iorwf	(___ftneg@f1+1),w
	iorwf	(___ftneg@f1),w
	skipnz
	goto	u479_21
	goto	u479_20
u479_21:
	goto	i1l10920
u479_20:
	line	18
	
i1l10918:	
	movlw	080h
	xorwf	(___ftneg@f1+2),f
	goto	i1l10920
	
i1l6759:	
	line	19
	
i1l10920:	
	goto	i1l6760
	
i1l10922:	
	line	20
	
i1l6760:	
	return
	opt stack 0
GLOBAL	__end_of___ftneg
	__end_of___ftneg:
;; =============== function ___ftneg ends ============

	signat	___ftneg,4219
	global	___fttol
psect	text833,local,class=CODE,delta=2
global __ptext833
__ptext833:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    0[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  lval            4    9[BANK0 ] unsigned long 
;;  exp1            1   13[BANK0 ] unsigned char 
;;  sign1           1    8[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] long 
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCconvert
;; This function uses a non-reentrant model
;;
psect	text833
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 1
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
i1l10852:	
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
	goto	u467_21
	goto	u467_20
u467_21:
	goto	i1l10858
u467_20:
	line	50
	
i1l10854:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	i1l6706
	
i1l10856:	
	goto	i1l6706
	
i1l6705:	
	line	51
	
i1l10858:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u468_25:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u468_20:
	addlw	-1
	skipz
	goto	u468_25
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
i1l10860:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
i1l10862:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
i1l10864:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
i1l10866:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
i1l10868:	
	btfss	(___fttol@exp1),7
	goto	u469_21
	goto	u469_20
u469_21:
	goto	i1l10878
u469_20:
	line	57
	
i1l10870:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u470_21
	goto	u470_20
u470_21:
	goto	i1l10876
u470_20:
	line	58
	
i1l10872:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	i1l6706
	
i1l10874:	
	goto	i1l6706
	
i1l6708:	
	goto	i1l10876
	line	59
	
i1l6709:	
	line	60
	
i1l10876:	
	movlw	01h
u471_25:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u471_25

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u472_21
	goto	u472_20
u472_21:
	goto	i1l10876
u472_20:
	goto	i1l10888
	
i1l6710:	
	line	62
	goto	i1l10888
	
i1l6707:	
	line	63
	
i1l10878:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u473_21
	goto	u473_20
u473_21:
	goto	i1l10886
u473_20:
	line	64
	
i1l10880:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	i1l6706
	
i1l10882:	
	goto	i1l6706
	
i1l6712:	
	line	65
	goto	i1l10886
	
i1l6714:	
	line	66
	
i1l10884:	
	movlw	01h
	movwf	(??___fttol+0)+0
u474_25:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u474_25
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	i1l10886
	line	68
	
i1l6713:	
	line	65
	
i1l10886:	
	movf	(___fttol@exp1),f
	skipz
	goto	u475_21
	goto	u475_20
u475_21:
	goto	i1l10884
u475_20:
	goto	i1l10888
	
i1l6715:	
	goto	i1l10888
	line	69
	
i1l6711:	
	line	70
	
i1l10888:	
	movf	(___fttol@sign1),w
	skipz
	goto	u476_20
	goto	i1l10892
u476_20:
	line	71
	
i1l10890:	
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
	goto	i1l10892
	
i1l6716:	
	line	72
	
i1l10892:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	i1l6706
	
i1l10894:	
	line	73
	
i1l6706:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text834,local,class=CODE,delta=2
global __ptext834
__ptext834:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[COMMON] unsigned um
;;  exp             1    3[COMMON] unsigned char 
;;  sign            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         5       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftadd
;;		___ftdiv
;;		___ftmul
;;		___lwtoft
;;		___lbtoft
;;		___abtoft
;;		___awtoft
;;		___altoft
;;		___lltoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text834
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 0
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
i1l10724:	
	movf	(___ftpack@exp),w
	skipz
	goto	u434_20
	goto	i1l10728
u434_20:
	
i1l10726:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u435_21
	goto	u435_20
u435_21:
	goto	i1l10734
u435_20:
	goto	i1l10728
	
i1l6930:	
	line	65
	
i1l10728:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	i1l6931
	
i1l10730:	
	goto	i1l6931
	
i1l6928:	
	line	66
	goto	i1l10734
	
i1l6933:	
	line	67
	
i1l10732:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u436_25:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u436_25

	goto	i1l10734
	line	69
	
i1l6932:	
	line	66
	
i1l10734:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u437_21
	goto	u437_20
u437_21:
	goto	i1l10732
u437_20:
	goto	i1l6935
	
i1l6934:	
	line	70
	goto	i1l6935
	
i1l6936:	
	line	71
	
i1l10736:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
i1l10738:	
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
	
i1l10740:	
	movlw	01h
u438_25:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u438_25

	line	74
	
i1l6935:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u439_21
	goto	u439_20
u439_21:
	goto	i1l10736
u439_20:
	goto	i1l10744
	
i1l6937:	
	line	75
	goto	i1l10744
	
i1l6939:	
	line	76
	
i1l10742:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u440_25:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u440_25
	goto	i1l10744
	line	78
	
i1l6938:	
	line	75
	
i1l10744:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u441_21
	goto	u441_20
u441_21:
	goto	i1l10742
u441_20:
	
i1l6940:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u442_21
	goto	u442_20
u442_21:
	goto	i1l6941
u442_20:
	line	80
	
i1l10746:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
i1l6941:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
i1l10748:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u443_25:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u443_20:
	addlw	-1
	skipz
	goto	u443_25
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
i1l10750:	
	movf	(___ftpack@sign),w
	skipz
	goto	u444_20
	goto	i1l6942
u444_20:
	line	84
	
i1l10752:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
i1l6942:	
	line	85
	line	86
	
i1l6931:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___lwmod
psect	text835,local,class=CODE,delta=2
global __ptext835
__ptext835:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
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
psect	text835
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l10632:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u404_21
	goto	u404_20
u404_21:
	goto	i1l10650
u404_20:
	line	9
	
i1l10634:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	i1l10640
	
i1l6614:	
	line	11
	
i1l10636:	
	movlw	01h
	
u405_25:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u405_25
	line	12
	
i1l10638:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	i1l10640
	line	13
	
i1l6613:	
	line	10
	
i1l10640:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u406_21
	goto	u406_20
u406_21:
	goto	i1l10636
u406_20:
	goto	i1l10642
	
i1l6615:	
	goto	i1l10642
	line	14
	
i1l6616:	
	line	15
	
i1l10642:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u407_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u407_25:
	skipc
	goto	u407_21
	goto	u407_20
u407_21:
	goto	i1l10646
u407_20:
	line	16
	
i1l10644:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	i1l10646
	
i1l6617:	
	line	17
	
i1l10646:	
	movlw	01h
	
u408_25:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u408_25
	line	18
	
i1l10648:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u409_21
	goto	u409_20
u409_21:
	goto	i1l10642
u409_20:
	goto	i1l10650
	
i1l6618:	
	goto	i1l10650
	line	19
	
i1l6612:	
	line	20
	
i1l10650:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	i1l6619
	
i1l10652:	
	line	21
	
i1l6619:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text836,local,class=CODE,delta=2
global __ptext836
__ptext836:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
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
psect	text836
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
i1l10606:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
i1l10608:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u397_21
	goto	u397_20
u397_21:
	goto	i1l10628
u397_20:
	line	11
	
i1l10610:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	i1l10616
	
i1l6604:	
	line	13
	
i1l10612:	
	movlw	01h
	
u398_25:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u398_25
	line	14
	
i1l10614:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	i1l10616
	line	15
	
i1l6603:	
	line	12
	
i1l10616:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u399_21
	goto	u399_20
u399_21:
	goto	i1l10612
u399_20:
	goto	i1l10618
	
i1l6605:	
	goto	i1l10618
	line	16
	
i1l6606:	
	line	17
	
i1l10618:	
	movlw	01h
	
u400_25:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u400_25
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u401_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u401_25:
	skipc
	goto	u401_21
	goto	u401_20
u401_21:
	goto	i1l10624
u401_20:
	line	19
	
i1l10620:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
i1l10622:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l10624
	line	21
	
i1l6607:	
	line	22
	
i1l10624:	
	movlw	01h
	
u402_25:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u402_25
	line	23
	
i1l10626:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u403_21
	goto	u403_20
u403_21:
	goto	i1l10618
u403_20:
	goto	i1l10628
	
i1l6608:	
	goto	i1l10628
	line	24
	
i1l6602:	
	line	25
	
i1l10628:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	i1l6609
	
i1l10630:	
	line	26
	
i1l6609:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text837,local,class=CODE,delta=2
global __ptext837
__ptext837:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
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
psect	text837
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 1
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
i1l10594:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	i1l10596
	line	6
	
i1l6596:	
	line	7
	
i1l10596:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u393_21
	goto	u393_20
u393_21:
	goto	i1l6597
u393_20:
	line	8
	
i1l10598:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
i1l6597:	
	line	9
	movlw	01h
	
u394_25:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u394_25
	line	10
	
i1l10600:	
	movlw	01h
	
u395_25:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u395_25
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u396_21
	goto	u396_20
u396_21:
	goto	i1l10596
u396_20:
	goto	i1l10602
	
i1l6598:	
	line	12
	
i1l10602:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	i1l6599
	
i1l10604:	
	line	13
	
i1l6599:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_Debounce
psect	text838,local,class=CODE,delta=2
global __ptext838
__ptext838:

;; *************** function _Debounce *****************
;; Defined at:
;;		line 63 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
psect	text838
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	63
	global	__size_of_Debounce
	__size_of_Debounce	equ	__end_of_Debounce-_Debounce
	
_Debounce:	
	opt	stack 2
; Regs used in _Debounce: [wreg+status,2+status,0]
	line	65
	
i1l10494:	
;HMI.c: 65: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u370_21
	goto	u370_20
u370_21:
	goto	i1l5103
u370_20:
	line	67
	
i1l10496:	
;HMI.c: 66: {
;HMI.c: 67: UpDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_UpDebounceCount)^080h,f	;volatile
	line	68
	
i1l10498:	
;HMI.c: 68: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount)^080h,w	;volatile
	skipc
	goto	u371_21
	goto	u371_20
u371_21:
	goto	i1l5105
u371_20:
	
i1l10500:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u372_21
	goto	u372_20
u372_21:
	goto	i1l5105
u372_20:
	line	70
	
i1l10502:	
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_UpDebounceCount)^080h	;volatile
	line	77
;HMI.c: 77: UpReleased = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_UpReleased/8),(_UpReleased)&7
	line	78
	
i1l5105:	
	line	81
;HMI.c: 78: }
;HMI.c: 81: if(!RB3)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(51/8),(51)&7
	goto	u373_21
	goto	u373_20
u373_21:
	goto	i1l5106
u373_20:
	line	83
	
i1l10504:	
;HMI.c: 82: {
;HMI.c: 83: DownDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_DownDebounceCount)^080h,f	;volatile
	line	84
	
i1l10506:	
;HMI.c: 84: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount)^080h,w	;volatile
	skipc
	goto	u374_21
	goto	u374_20
u374_21:
	goto	i1l5108
u374_20:
	
i1l10508:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u375_21
	goto	u375_20
u375_21:
	goto	i1l5108
u375_20:
	line	86
	
i1l10510:	
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_DownDebounceCount)^080h	;volatile
	line	93
;HMI.c: 93: DownReleased = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_DownReleased/8),(_DownReleased)&7
	line	94
	
i1l5108:	
	line	96
;HMI.c: 94: }
;HMI.c: 96: if(!RB4)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(52/8),(52)&7
	goto	u376_21
	goto	u376_20
u376_21:
	goto	i1l5109
u376_20:
	line	98
	
i1l10512:	
;HMI.c: 97: {
;HMI.c: 98: LeftDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_LeftDebounceCount)^080h,f	;volatile
	line	99
	
i1l10514:	
;HMI.c: 99: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount)^080h,w	;volatile
	skipc
	goto	u377_21
	goto	u377_20
u377_21:
	goto	i1l5111
u377_20:
	
i1l10516:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u378_21
	goto	u378_20
u378_21:
	goto	i1l5111
u378_20:
	line	101
	
i1l10518:	
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_LeftDebounceCount)^080h	;volatile
	line	108
;HMI.c: 108: LeftReleased = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_LeftReleased/8),(_LeftReleased)&7
	line	109
	
i1l5111:	
	line	111
;HMI.c: 109: }
;HMI.c: 111: if(!RB5)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u379_21
	goto	u379_20
u379_21:
	goto	i1l5112
u379_20:
	line	113
	
i1l10520:	
;HMI.c: 112: {
;HMI.c: 113: RightDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_RightDebounceCount)^080h,f	;volatile
	line	114
	
i1l10522:	
;HMI.c: 114: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount)^080h,w	;volatile
	skipc
	goto	u380_21
	goto	u380_20
u380_21:
	goto	i1l5114
u380_20:
	
i1l10524:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u381_21
	goto	u381_20
u381_21:
	goto	i1l5114
u381_20:
	line	116
	
i1l10526:	
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_RightDebounceCount)^080h	;volatile
	line	123
;HMI.c: 123: RightReleased = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RightReleased/8),(_RightReleased)&7
	line	124
	
i1l5114:	
	line	126
;HMI.c: 124: }
;HMI.c: 126: if(!RB6)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(54/8),(54)&7
	goto	u382_21
	goto	u382_20
u382_21:
	goto	i1l5115
u382_20:
	line	128
	
i1l10528:	
;HMI.c: 127: {
;HMI.c: 128: CenterDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_CenterDebounceCount)^080h,f	;volatile
	line	129
	
i1l10530:	
;HMI.c: 129: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount)^080h,w	;volatile
	skipc
	goto	u383_21
	goto	u383_20
u383_21:
	goto	i1l5118
u383_20:
	
i1l10532:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u384_21
	goto	u384_20
u384_21:
	goto	i1l5118
u384_20:
	line	131
	
i1l10534:	
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
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_CenterDebounceCount)^080h	;volatile
	line	138
;HMI.c: 138: CenterReleased = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
psect	text839,local,class=CODE,delta=2
global __ptext839
__ptext839:

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
psect	text839
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	64
	
i1l10058:	
;adc.c: 62: volatile unsigned int adc_value;
;adc.c: 64: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	66
	
i1l10060:	
;adc.c: 66: GO = 1;
	bsf	(250/8),(250)&7
	line	67
;adc.c: 67: while(GO) continue;
	goto	i1l703
	
i1l704:	
	
i1l703:	
	btfsc	(250/8),(250)&7
	goto	u314_21
	goto	u314_20
u314_21:
	goto	i1l703
u314_20:
	
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
psect	text839
	line	73
	
i1l10062:	
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
	
u315_25:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u315_25
	line	75
;adc.c: 75: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	78
	
i1l10064:	
;adc.c: 78: return (adc_value);
	movf	(adc_read@adc_value+1),w	;volatile
	clrf	(?_adc_read+1)
	addwf	(?_adc_read+1)
	movf	(adc_read@adc_value),w	;volatile
	clrf	(?_adc_read)
	addwf	(?_adc_read)

	goto	i1l706
	
i1l10066:	
	line	79
	
i1l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
psect	text840,local,class=CODE,delta=2
global __ptext840
__ptext840:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
