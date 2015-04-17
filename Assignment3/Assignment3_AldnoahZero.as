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
	FNCALL	_ADCconvert,___lwmod
	FNCALL	_ReadButtons,_Debounce
	FNCALL	_adc_read_channel,_adc_read
	FNCALL	intlevel1,_isr1
	global	intlevel1
	FNROOT	intlevel1
	global	_menuStrings
	global	_shortMenuStrings
	global	_current_step
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
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
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	34
_menuStrings:
       ds      5

psect	dataBANK0
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
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
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	movlw low(__pdataBANK0+11)
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
	global	??_init_adc
??_init_adc:	; 0 bytes @ 0x0
	global	??_lcd_write_control
??_lcd_write_control:	; 0 bytes @ 0x0
	global	Menu@input
Menu@input:	; 1 bytes @ 0x0
	ds	2
	global	lcd_write_control@databyte
lcd_write_control@databyte:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	??_init
??_init:	; 0 bytes @ 0x3
	global	??_main
??_main:	; 0 bytes @ 0x3
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_readAvgDistance
?_readAvgDistance:	; 0 bytes @ 0x0
	global	?_UpdateDisplay
?_UpdateDisplay:	; 0 bytes @ 0x0
	global	?_ser_init
?_ser_init:	; 0 bytes @ 0x0
	global	?_Menu
?_Menu:	; 0 bytes @ 0x0
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
	global	?_adc_read_channel
?_adc_read_channel:	; 1 bytes @ 0x0
	global	?_adc_read
?_adc_read:	; 2 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
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
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_lcd_set_cursor
??_lcd_set_cursor:	; 0 bytes @ 0x3
	global	lcd_set_cursor@address
lcd_set_cursor@address:	; 1 bytes @ 0x3
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	adc_read@adc_value
adc_read@adc_value:	; 2 bytes @ 0x4
	ds	1
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	??_adc_read_channel
??_adc_read_channel:	; 0 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	?_lcd_write_string
?_lcd_write_string:	; 0 bytes @ 0x7
	global	adc_read_channel@channel
adc_read_channel@channel:	; 1 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	global	lcd_write_string@s
lcd_write_string@s:	; 2 bytes @ 0x7
	ds	1
	global	?_readDistance
?_readDistance:	; 2 bytes @ 0x8
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x8
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x8
	ds	1
	global	??_lcd_write_string
??_lcd_write_string:	; 0 bytes @ 0x9
	ds	1
	global	??_readDistance
??_readDistance:	; 0 bytes @ 0xA
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xA
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0xC
	global	readDistance@fullval
readDistance@fullval:	; 2 bytes @ 0xC
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xD
	ds	1
	global	??_readAvgDistance
??_readAvgDistance:	; 0 bytes @ 0xE
	global	??_ADCconvert
??_ADCconvert:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x0
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0x0
	global	readAvgDistance@fullval
readAvgDistance@fullval:	; 2 bytes @ 0x0
	ds	2
	global	readAvgDistance@i
readAvgDistance@i:	; 2 bytes @ 0x2
	ds	3
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0x5
	ds	3
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x8
	ds	1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x9
	ds	1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0xA
	ds	1
	global	sprintf@_val
sprintf@_val:	; 4 bytes @ 0xB
	ds	4
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0xF
	ds	1
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0x10
	ds	1
	global	??_UpdateDisplay
??_UpdateDisplay:	; 0 bytes @ 0x11
	ds	4
	global	UpdateDisplay@adcOutput
UpdateDisplay@adcOutput:	; 16 bytes @ 0x15
	ds	16
	global	??_isr1
??_isr1:	; 0 bytes @ 0x25
	ds	5
;;Data sizes: Strings 70, constant 10, data 11, bss 68, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     42      75
;; BANK1           80      3      51
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

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
;; S6353$_cp	PTR const unsigned char  size(1) Largest target is 0
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
;;   _isr1->___lwmod
;;   _readAvgDistance->_readDistance
;;   _readDistance->_adc_read_channel
;;   _lcd_write_string->___awmod
;;   _lcd_set_cursor->i1_lcd_write_control
;;   _sprintf->___lwmod
;;   _ADCconvert->___lwmod
;;   _ReadButtons->_Debounce
;;   _adc_read_channel->_adc_read
;;   ___lwmod->___lwdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _isr1 in BANK0
;;
;;   _isr1->_UpdateDisplay
;;   _UpdateDisplay->_sprintf
;;
;; Critical Paths under _main in BANK1
;;
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      44
;;                               _init
;;                               _Menu
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0      22
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
;; (4) _isr1                                                 5     5      0    2004
;;                                             37 BANK0      5     5      0
;;                            ___lwmod
;;                    _readAvgDistance
;;                      _UpdateDisplay
;;                        _ReadButtons
;; ---------------------------------------------------------------------------------
;; (5) _UpdateDisplay                                       20    20      0    1385
;;                                             17 BANK0     20    20      0
;;                i1_lcd_write_control
;;                            _sprintf
;;                     _lcd_set_cursor
;;                   _lcd_write_string
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (5) _readAvgDistance                                      4     4      0     460
;;                                              0 BANK0      4     4      0
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
;;                                              0 BANK0     17    12      5
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (6) _ADCconvert                                           0     0      0     159
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
;; (7) ___lwmod                                              6     2      4     159
;;                                              8 COMMON     6     2      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (7) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
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
;;
;; _isr1 (ROOT)
;;   ___lwmod
;;     ___lwdiv (ARG)
;;   _readAvgDistance
;;     _readDistance
;;       _adc_read_channel
;;         _adc_read
;;     ___lwdiv
;;     _ADCconvert
;;       ___lwmod
;;         ___lwdiv (ARG)
;;   _UpdateDisplay
;;     i1_lcd_write_control
;;     _sprintf
;;       ___lwdiv
;;       ___lwmod
;;         ___lwdiv (ARG)
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
;;BANK1               50      3      33       7       63.8%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      99      12        0.0%
;;ABS                  0      0      8C       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       D       2        0.0%
;;BANK0               50     2A      4B       5       93.8%
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
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_init
;;		_Menu
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	140
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	145
	
l8827:	
;Main.c: 145: init();
	fcall	_init
	goto	l8861
	line	151
;Main.c: 151: while(1)
	
l2172:	
	line	154
;Main.c: 152: {
;Main.c: 154: switch (buttonPressed)
	goto	l8861
	line	156
;Main.c: 155: {
;Main.c: 156: case 1:
	
l2174:	
	line	157
	
l8829:	
;Main.c: 157: Menu(1);
	movlw	(01h)
	fcall	_Menu
	line	158
	
l8831:	
;Main.c: 158: RB1 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	159
	
l8833:	
;Main.c: 159: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	161
;Main.c: 161: break;
	goto	l8861
	line	162
;Main.c: 162: case 2:
	
l2176:	
	line	163
	
l8835:	
;Main.c: 163: Menu(2);
	movlw	(02h)
	fcall	_Menu
	line	164
	
l8837:	
;Main.c: 164: RB1 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	165
	
l8839:	
;Main.c: 165: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	167
;Main.c: 167: break;
	goto	l8861
	line	168
;Main.c: 168: case 3:
	
l2177:	
	line	169
	
l8841:	
;Main.c: 169: Menu(3);
	movlw	(03h)
	fcall	_Menu
	line	170
	
l8843:	
;Main.c: 170: RB1 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	171
	
l8845:	
;Main.c: 171: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	173
;Main.c: 173: break;
	goto	l8861
	line	174
;Main.c: 174: case 4:
	
l2178:	
	line	175
	
l8847:	
;Main.c: 175: Menu(4);
	movlw	(04h)
	fcall	_Menu
	line	176
	
l8849:	
;Main.c: 176: RB1 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	177
	
l8851:	
;Main.c: 177: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	179
;Main.c: 179: break;
	goto	l8861
	line	180
;Main.c: 180: case 5:
	
l2179:	
	line	181
	
l8853:	
;Main.c: 181: Menu(5);
	movlw	(05h)
	fcall	_Menu
	line	182
	
l8855:	
;Main.c: 182: RB1 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	183
	
l8857:	
;Main.c: 183: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	185
;Main.c: 185: break;
	goto	l8861
	line	186
;Main.c: 186: default:
	
l2180:	
	line	188
;Main.c: 188: break;
	goto	l8861
	line	189
	
l8859:	
;Main.c: 189: }
	goto	l8861
	line	154
	
l2173:	
	
l8861:	
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
	goto	l8829
	xorlw	2^1	; case 2
	skipnz
	goto	l8835
	xorlw	3^2	; case 3
	skipnz
	goto	l8841
	xorlw	4^3	; case 4
	skipnz
	goto	l8847
	xorlw	5^4	; case 5
	skipnz
	goto	l8853
	goto	l8861
	opt asmopt_on

	line	189
	
l2175:	
	goto	l8861
	line	255
	
l2181:	
	line	151
	goto	l8861
	
l2182:	
	line	256
	
l2183:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_init
psect	text579,local,class=CODE,delta=2
global __ptext579
__ptext579:

;; *************** function _init *****************
;; Defined at:
;;		line 111 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_init_adc
;;		_lcd_init
;;		_ser_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text579
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	111
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 0
; Regs used in _init: [wreg+status,2+status,0+pclath+cstack]
	line	112
	
l8817:	
;Main.c: 112: init_adc();
	fcall	_init_adc
	line	113
;Main.c: 113: lcd_init();
	fcall	_lcd_init
	line	114
;Main.c: 114: ser_init();
	fcall	_ser_init
	line	116
	
l8819:	
;Main.c: 116: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	122
	
l8821:	
;Main.c: 122: OPTION_REG = 0b00000100;
	movlw	(04h)
	movwf	(129)^080h	;volatile
	line	125
	
l8823:	
;Main.c: 125: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	128
	
l8825:	
;Main.c: 128: (GIE = 1);
	bsf	(95/8),(95)&7
	line	129
	
l2169:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_lcd_init
psect	text580,local,class=CODE,delta=2
global __ptext580
__ptext580:

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
psect	text580
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 0
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l8797:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l8799:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l8801:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l8803:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l8805:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l8807:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l8809:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l8811:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l8813:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l8815:	
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
psect	text581,local,class=CODE,delta=2
global __ptext581
__ptext581:

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
psect	text581
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
	
l8789:	
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
	
l8791:	
;lcd.c: 22: PORTD = databyte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_control@databyte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	23
	
l8793:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l8795:	
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
u4207:
	decfsz	((??_lcd_write_control+0)^080h+0),f
	goto	u4207
	decfsz	((??_lcd_write_control+0)^080h+0+1),f
	goto	u4207
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
psect	text582,local,class=CODE,delta=2
global __ptext582
__ptext582:

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
psect	text582
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	46
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 1
; Regs used in _init_adc: [wreg+status,2]
	line	48
	
l8779:	
;adc.c: 48: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	49
	
l8781:	
;adc.c: 49: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	52
	
l8783:	
;adc.c: 52: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	53
	
l8785:	
;adc.c: 53: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	55
	
l8787:	
;adc.c: 55: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_init_adc+0)^080h+0,f
u4217:
decfsz	(??_init_adc+0)^080h+0,f
	goto	u4217
opt asmopt_on

	line	57
	
l700:	
	return
	opt stack 0
GLOBAL	__end_of_init_adc
	__end_of_init_adc:
;; =============== function _init_adc ends ============

	signat	_init_adc,88
	global	_Menu
psect	text583,local,class=CODE,delta=2
global __ptext583
__ptext583:

;; *************** function _Menu *****************
;; Defined at:
;;		line 182 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;  input           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  input           1    0[BANK1 ] unsigned char 
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
psect	text583
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
	
l8349:	
;HMI.c: 183: switch (input)
	goto	l8367
	line	185
;HMI.c: 184: {
;HMI.c: 185: case 1:
	
l5122:	
	line	187
;HMI.c: 187: break;
	goto	l5139
	line	188
;HMI.c: 188: case 2:
	
l5124:	
	line	190
;HMI.c: 190: break;
	goto	l5139
	line	191
;HMI.c: 191: case 3:
	
l5125:	
	line	192
	
l8351:	
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
	
l8353:	
;HMI.c: 193: if (pos < 0)
	btfss	(_pos+1),7
	goto	u3361
	goto	u3360
u3361:
	goto	l5139
u3360:
	line	194
	
l8355:	
;HMI.c: 194: pos = 5 - 1;
	movlw	low(04h)
	movwf	(_pos)
	movlw	high(04h)
	movwf	((_pos))+1
	goto	l5139
	
l5126:	
	line	196
;HMI.c: 196: break;
	goto	l5139
	line	197
;HMI.c: 197: case 4:
	
l5127:	
	line	198
	
l8357:	
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
	goto	u3371
	goto	u3370
u3371:
	goto	l5139
u3370:
	line	200
	
l8359:	
;HMI.c: 200: pos = 0;
	clrf	(_pos)
	clrf	(_pos+1)
	goto	l5139
	
l5128:	
	line	202
;HMI.c: 202: break;
	goto	l5139
	line	203
;HMI.c: 203: case 5:
	
l5129:	
	line	204
;HMI.c: 204: switch (pos)
	goto	l8363
	line	206
;HMI.c: 205: {
;HMI.c: 206: case 0:
	
l5131:	
	line	208
;HMI.c: 208: break;
	goto	l5139
	line	209
;HMI.c: 209: case 1:
	
l5133:	
	line	211
;HMI.c: 211: break;
	goto	l5139
	line	212
;HMI.c: 212: case 2:
	
l5134:	
	line	214
;HMI.c: 214: break;
	goto	l5139
	line	215
;HMI.c: 215: case 3:
	
l5135:	
	line	217
;HMI.c: 217: break;
	goto	l5139
	line	218
;HMI.c: 218: case 4:
	
l5136:	
	line	220
;HMI.c: 220: break;
	goto	l5139
	line	221
;HMI.c: 221: default:
	
l5137:	
	line	222
;HMI.c: 222: break;
	goto	l5139
	line	223
	
l8361:	
;HMI.c: 223: }
	goto	l5139
	line	204
	
l5130:	
	
l8363:	
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

	bcf	status, 5	;RP0=0, select bank0
	movf (_pos+1),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l8883
	goto	l5139
	opt asmopt_on
	
l8883:	
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

	movf (_pos),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5139
	xorlw	1^0	; case 1
	skipnz
	goto	l5139
	xorlw	2^1	; case 2
	skipnz
	goto	l5139
	xorlw	3^2	; case 3
	skipnz
	goto	l5139
	xorlw	4^3	; case 4
	skipnz
	goto	l5139
	goto	l5139
	opt asmopt_on

	line	223
	
l5132:	
	line	224
;HMI.c: 224: break;
	goto	l5139
	line	226
;HMI.c: 226: default:
	
l5138:	
	line	228
;HMI.c: 228: break;
	goto	l5139
	line	229
	
l8365:	
;HMI.c: 229: }
	goto	l5139
	line	183
	
l5121:	
	
l8367:	
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
	goto	l5139
	xorlw	2^1	; case 2
	skipnz
	goto	l5139
	xorlw	3^2	; case 3
	skipnz
	goto	l8351
	xorlw	4^3	; case 4
	skipnz
	goto	l8357
	xorlw	5^4	; case 5
	skipnz
	goto	l8363
	goto	l5139
	opt asmopt_on

	line	229
	
l5123:	
	line	230
	
l5139:	
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4216
	global	_ser_init
psect	text584,local,class=CODE,delta=2
global __ptext584
__ptext584:

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
psect	text584
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 1
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l8323:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l8325:	
;ser.c: 115: TRISC &= 0b10111111;
	movlw	(0BFh)
	movwf	(??_ser_init+0)^080h+0
	movf	(??_ser_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	116
	
l8327:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l8329:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l8331:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l8333:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l8335:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l8337:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l8339:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l8341:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l8343:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l8345:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l8347:	
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
	
l4362:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_isr1
psect	text585,local,class=CODE,delta=2
global __ptext585
__ptext585:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 75 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text585
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	75
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
psect	text585
	line	77
	
i1l8189:	
;Main.c: 77: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	btfss	(101/8),(101)&7
	goto	u316_21
	goto	u316_20
u316_21:
	goto	i1l8199
u316_20:
	
i1l8191:	
	movf	(26),w	;volatile
	movwf	(??_isr1+0)+0
	movf	(_rxiptr),w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	movf	(??_isr1+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
i1l8193:	
	movf	(_rxiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_ser_tmp)
	
i1l8195:	
	movf	(_ser_tmp),w
	xorwf	(_rxoptr),w	;volatile
	skipnz
	goto	u317_21
	goto	u317_20
u317_21:
	goto	i1l8199
u317_20:
	
i1l8197:	
	movf	(_ser_tmp),w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)	;volatile
	goto	i1l8199
	
i1l2157:	
	goto	i1l8199
	
i1l2156:	
	
i1l8199:	
	btfss	(100/8),(100)&7
	goto	u318_21
	goto	u318_20
u318_21:
	goto	i1l2158
u318_20:
	
i1l8201:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u319_21
	goto	u319_20
u319_21:
	goto	i1l2158
u319_20:
	
i1l8203:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_txoptr),w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(25)	;volatile
	
i1l8205:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	addwf	(_txoptr),f	;volatile
	
i1l8207:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr),f	;volatile
	
i1l8209:	
	movf	(_txoptr),w	;volatile
	xorwf	(_txiptr),w	;volatile
	skipz
	goto	u320_21
	goto	u320_20
u320_21:
	goto	i1l2158
u320_20:
	
i1l8211:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2158
	
i1l2159:	
	
i1l2158:	
	line	79
;Main.c: 79: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u321_21
	goto	u321_20
u321_21:
	goto	i1l2166
u321_20:
	line	81
	
i1l8213:	
;Main.c: 80: {
;Main.c: 81: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	82
	
i1l8215:	
;Main.c: 82: TMR0 = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	84
;Main.c: 84: RTC_Counter++;
	movlw	low(01h)
	addwf	(_RTC_Counter),f	;volatile
	skipnc
	incf	(_RTC_Counter+1),f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1),f	;volatile
	line	86
	
i1l8217:	
;Main.c: 86: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	87
	
i1l8219:	
;Main.c: 87: if(RTC_Counter % 10 == 0) RTC_FLAG_10MS = 1;
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
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u322_21
	goto	u322_20
u322_21:
	goto	i1l8223
u322_20:
	
i1l8221:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l8223
	
i1l2161:	
	line	88
	
i1l8223:	
;Main.c: 88: if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
	movlw	low(032h)
	movwf	(?___lwmod)
	movlw	high(032h)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u323_21
	goto	u323_20
u323_21:
	goto	i1l8227
u323_20:
	
i1l8225:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l8227
	
i1l2162:	
	line	89
	
i1l8227:	
;Main.c: 89: if(RTC_Counter % 250 == 0)
	movlw	low(0FAh)
	movwf	(?___lwmod)
	movlw	high(0FAh)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u324_21
	goto	u324_20
u324_21:
	goto	i1l8233
u324_20:
	line	91
	
i1l8229:	
;Main.c: 90: {
;Main.c: 91: readAvgDistance();
	fcall	_readAvgDistance
	line	92
;Main.c: 92: UpdateDisplay();
	fcall	_UpdateDisplay
	line	93
	
i1l8231:	
;Main.c: 93: RTC_FLAG_250MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l8233
	line	95
	
i1l2163:	
	line	96
	
i1l8233:	
;Main.c: 95: }
;Main.c: 96: if(RTC_Counter % 500 == 0)
	movlw	low(01F4h)
	movwf	(?___lwmod)
	movlw	high(01F4h)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u325_21
	goto	u325_20
u325_21:
	goto	i1l8241
u325_20:
	line	98
	
i1l8235:	
;Main.c: 97: {
;Main.c: 98: RTC_FLAG_500MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	99
	
i1l8237:	
;Main.c: 99: RTC_Counter = 0;
	clrf	(_RTC_Counter)	;volatile
	clrf	(_RTC_Counter+1)	;volatile
	line	100
	
i1l8239:	
;Main.c: 100: RB0 ^= 0x01;
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l8241
	line	101
	
i1l2164:	
	line	103
	
i1l8241:	
;Main.c: 101: }
;Main.c: 103: if (buttonPressed == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_buttonPressed),f
	skipz	;volatile
	goto	u326_21
	goto	u326_20
u326_21:
	goto	i1l2166
u326_20:
	line	105
	
i1l8243:	
;Main.c: 104: {
;Main.c: 105: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_buttonPressed)	;volatile
	goto	i1l2166
	line	106
	
i1l2165:	
	goto	i1l2166
	line	107
	
i1l2160:	
	line	108
	
i1l2166:	
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
psect	text586,local,class=CODE,delta=2
global __ptext586
__ptext586:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 233 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adcOutput      16   21[BANK0 ] unsigned char [16]
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
psect	text586
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	233
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
	opt	stack 1
; Regs used in _UpdateDisplay: [allreg]
	line	234
	
i1l8261:	
;HMI.c: 234: char adcOutput[16] = "";
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
u329_20:
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
	goto	u329_20
	line	235
	
i1l8263:	
;HMI.c: 235: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	i1_lcd_write_control
	line	236
	
i1l8265:	
;HMI.c: 236: sprintf(adcOutput,"ADC:%d Dist:%d",adcVal, distance);
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
	line	237
	
i1l8267:	
;HMI.c: 237: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	238
	
i1l8269:	
;HMI.c: 238: lcd_write_string(adcOutput);
	movlw	(UpdateDisplay@adcOutput&0ffh)
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	243
	
i1l8271:	
;HMI.c: 243: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	244
	
i1l8273:	
;HMI.c: 244: if (pos > 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_pos+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u330_25
	movlw	low(01h)
	subwf	(_pos),w
u330_25:

	skipc
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l8277
u330_20:
	line	245
	
i1l8275:	
;HMI.c: 245: lcd_write_string(shortMenuStrings[pos - 1]);
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
	goto	i1l8279
	line	246
	
i1l5144:	
	line	247
	
i1l8277:	
;HMI.c: 246: else
;HMI.c: 247: lcd_write_string(shortMenuStrings[pos + 5 - 1]);
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
	goto	i1l8279
	
i1l5145:	
	line	248
	
i1l8279:	
;HMI.c: 248: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	249
	
i1l8281:	
;HMI.c: 249: lcd_write_string(menuStrings[pos]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_pos),w
	addlw	_menuStrings&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(?_lcd_write_string)
	movlw	80h
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	250
;HMI.c: 250: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	251
	
i1l8283:	
;HMI.c: 251: lcd_write_string(shortMenuStrings[(pos + 1) % 5]);
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
	line	252
	
i1l5146:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,88
	global	_readAvgDistance
psect	text587,local,class=CODE,delta=2
global __ptext587
__ptext587:

;; *************** function _readAvgDistance *****************
;; Defined at:
;;		line 10 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    2[BANK0 ] int 
;;  fullval         2    0[BANK0 ] unsigned int 
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
psect	text587
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	10
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [allreg]
	line	11
	
i1l8245:	
;infrared.c: 11: unsigned int fullval = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(readAvgDistance@fullval)
	clrf	(readAvgDistance@fullval+1)
	line	14
;infrared.c: 14: for (int i = 0; i < 10; i++)
	clrf	(readAvgDistance@i)
	clrf	(readAvgDistance@i+1)
	
i1l8247:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u327_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u327_25:

	skipc
	goto	u327_21
	goto	u327_20
u327_21:
	goto	i1l8251
u327_20:
	goto	i1l8257
	
i1l8249:	
	goto	i1l8257
	line	15
	
i1l2878:	
	line	16
	
i1l8251:	
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
	
i1l8253:	
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
i1l8255:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u328_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u328_25:

	skipc
	goto	u328_21
	goto	u328_20
u328_21:
	goto	i1l8251
u328_20:
	goto	i1l8257
	
i1l2879:	
	line	19
	
i1l8257:	
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
	
i1l8259:	
;infrared.c: 20: ADCconvert();
	fcall	_ADCconvert
	line	21
	
i1l2880:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,88
	global	_readDistance
psect	text588,local,class=CODE,delta=2
global __ptext588
__ptext588:

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
psect	text588
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	24
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	27
	
i1l8373:	
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
	
i1l8375:	
;infrared.c: 29: return fullval;
	movf	(readDistance@fullval+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@fullval),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	i1l2883
	
i1l8377:	
	line	30
	
i1l2883:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_lcd_write_string
psect	text589,local,class=CODE,delta=2
global __ptext589
__ptext589:

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
psect	text589
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 1
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
i1l8155:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	i1l8161
	
i1l1403:	
	
i1l8157:	
	movf	(lcd_write_string@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
i1l8159:	
	movlw	low(01h)
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
	goto	i1l8161
	
i1l1402:	
	
i1l8161:	
	movf	(lcd_write_string@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u312_21
	goto	u312_20
u312_21:
	goto	i1l8157
u312_20:
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
psect	text590,local,class=CODE,delta=2
global __ptext590
__ptext590:

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
psect	text590
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
	
i1l8151:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
i1l8153:	
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
psect	text591,local,class=CODE,delta=2
global __ptext591
__ptext591:

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
psect	text591
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
	
i1l8771:	
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
	
i1l8773:	
;lcd.c: 22: PORTD = databyte;
	movf	(i1lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
i1l8775:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
i1l8777:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??i1_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??i1_lcd_write_control+0)+0),f
u422_27:
	decfsz	((??i1_lcd_write_control+0)+0),f
	goto	u422_27
	decfsz	((??i1_lcd_write_control+0)+0+1),f
	goto	u422_27
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
psect	text592,local,class=CODE,delta=2
global __ptext592
__ptext592:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> UpdateDisplay@adcOutput(16), 
;;  f               1    0[BANK0 ] PTR const unsigned char 
;;		 -> STR_11(15), 
;; Auto vars:     Size  Location     Type
;;  sp              1   15[BANK0 ] PTR unsigned char 
;;		 -> UpdateDisplay@adcOutput(16), 
;;  _val            4   11[BANK0 ] struct .
;;  c               1   16[BANK0 ] char 
;;  prec            1   10[BANK0 ] char 
;;  flag            1    9[BANK0 ] unsigned char 
;;  ap              1    8[BANK0 ] PTR void [1]
;;		 -> ?_sprintf(2), 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
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
psect	text592
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
	
i1l8631:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	i1l8683
	
i1l5156:	
	line	542
	
i1l8633:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u390_21
	goto	u390_20
u390_21:
	goto	i1l5157
u390_20:
	line	545
	
i1l8635:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l8637:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	i1l8683
	line	547
	
i1l5157:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	i1l8641
	line	640
	
i1l5159:	
	line	641
	goto	i1l8685
	line	700
	
i1l5161:	
	goto	i1l8643
	line	701
	
i1l5162:	
	line	702
	goto	i1l8643
	line	805
	
i1l5164:	
	line	816
	goto	i1l8683
	line	825
	
i1l8639:	
	goto	i1l8643
	line	638
	
i1l5158:	
	
i1l8641:	
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
	goto	i1l8685
	xorlw	100^0	; case 100
	skipnz
	goto	i1l8643
	xorlw	105^100	; case 105
	skipnz
	goto	i1l8643
	goto	i1l8683
	opt asmopt_on

	line	825
	
i1l5163:	
	line	1254
	
i1l8643:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
i1l8645:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
i1l8647:	
	btfss	(sprintf@_val+1),7
	goto	u391_21
	goto	u391_20
u391_21:
	goto	i1l8653
u391_20:
	line	1257
	
i1l8649:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
i1l8651:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	i1l8653
	line	1259
	
i1l5165:	
	line	1300
	
i1l8653:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
i1l8655:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l8659
u392_20:
	goto	i1l8667
	
i1l8657:	
	goto	i1l8667
	line	1301
	
i1l5166:	
	
i1l8659:	
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
	goto	i1l8663
u393_20:
	goto	i1l8667
	line	1302
	
i1l8661:	
	goto	i1l8667
	
i1l5168:	
	line	1300
	
i1l8663:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
i1l8665:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u394_21
	goto	u394_20
u394_21:
	goto	i1l8659
u394_20:
	goto	i1l8667
	
i1l5167:	
	line	1433
	
i1l8667:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u395_21
	goto	u395_20
u395_21:
	goto	i1l8673
u395_20:
	line	1434
	
i1l8669:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l8671:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l8673
	
i1l5169:	
	line	1467
	
i1l8673:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	i1l8681
	
i1l5171:	
	line	1484
	
i1l8675:	
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
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_sprintf+1)+0
	movf	(??_sprintf+1)+0,w
	movwf	(sprintf@c)
	line	1516
	
i1l8677:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l8679:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l8681
	line	1517
	
i1l5170:	
	line	1469
	
i1l8681:	
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
	goto	i1l8675
u396_20:
	goto	i1l8683
	
i1l5172:	
	goto	i1l8683
	line	1525
	
i1l5155:	
	line	540
	
i1l8683:	
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
	goto	i1l8633
u397_20:
	goto	i1l8685
	
i1l5173:	
	goto	i1l8685
	line	1527
	
i1l5160:	
	line	1530
	
i1l8685:	
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	i1l5174
	line	1532
	
i1l8687:	
	line	1533
;	Return value of _sprintf is never used
	
i1l5174:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ADCconvert
psect	text593,local,class=CODE,delta=2
global __ptext593
__ptext593:

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
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwmod
;; This function is called by:
;;		_readAvgDistance
;; This function uses a non-reentrant model
;;
psect	text593
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	33
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [wreg+status,2+status,0+pclath+cstack]
	line	35
	
i1l8379:	
;infrared.c: 35: if (adcVal > 250)
	movlw	high(0FBh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0FBh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u338_21
	goto	u338_20
u338_21:
	goto	i1l8383
u338_20:
	line	37
	
i1l8381:	
;infrared.c: 36: {
;infrared.c: 37: distance = 20;
	movlw	low(014h)
	movwf	(_distance)	;volatile
	movlw	high(014h)
	movwf	((_distance))+1	;volatile
	line	38
;infrared.c: 38: }
	goto	i1l2911
	line	39
	
i1l2886:	
	
i1l8383:	
;infrared.c: 39: else if (adcVal < 250 && adcVal >= 190)
	movlw	high(0FAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0FAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l8389
u339_20:
	
i1l8385:	
	movlw	high(0BEh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0BEh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u340_21
	goto	u340_20
u340_21:
	goto	i1l8389
u340_20:
	line	41
	
i1l8387:	
;infrared.c: 40: {
;infrared.c: 41: distance = 20+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(014h)
	movwf	1+(_distance)	;volatile
	line	42
;infrared.c: 42: }
	goto	i1l2911
	line	43
	
i1l2888:	
	
i1l8389:	
;infrared.c: 43: else if (adcVal < 190 && adcVal >= 96)
	movlw	high(0BEh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0BEh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u341_21
	goto	u341_20
u341_21:
	goto	i1l8395
u341_20:
	
i1l8391:	
	movlw	high(060h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(060h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u342_21
	goto	u342_20
u342_21:
	goto	i1l8395
u342_20:
	line	45
	
i1l8393:	
;infrared.c: 44: {
;infrared.c: 45: distance = 30+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(01Eh)
	movwf	1+(_distance)	;volatile
	line	46
;infrared.c: 46: }
	goto	i1l2911
	line	47
	
i1l2890:	
	
i1l8395:	
;infrared.c: 47: else if (adcVal < 190 && adcVal >= 96)
	movlw	high(0BEh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0BEh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u343_21
	goto	u343_20
u343_21:
	goto	i1l8401
u343_20:
	
i1l8397:	
	movlw	high(060h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(060h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l8401
u344_20:
	line	49
	
i1l8399:	
;infrared.c: 48: {
;infrared.c: 49: distance = 40+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(028h)
	movwf	1+(_distance)	;volatile
	line	50
;infrared.c: 50: }
	goto	i1l2911
	line	51
	
i1l2892:	
	
i1l8401:	
;infrared.c: 51: else if (adcVal < 115 && adcVal >= 96)
	movlw	high(073h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(073h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u345_21
	goto	u345_20
u345_21:
	goto	i1l8407
u345_20:
	
i1l8403:	
	movlw	high(060h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(060h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u346_21
	goto	u346_20
u346_21:
	goto	i1l8407
u346_20:
	line	53
	
i1l8405:	
;infrared.c: 52: {
;infrared.c: 53: distance = 50+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(032h)
	movwf	1+(_distance)	;volatile
	line	54
;infrared.c: 54: }
	goto	i1l2911
	line	55
	
i1l2894:	
	
i1l8407:	
;infrared.c: 55: else if (adcVal < 96 && adcVal >= 82)
	movlw	high(060h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(060h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u347_21
	goto	u347_20
u347_21:
	goto	i1l8413
u347_20:
	
i1l8409:	
	movlw	high(052h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(052h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l8413
u348_20:
	line	57
	
i1l8411:	
;infrared.c: 56: {
;infrared.c: 57: distance = 60+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(03Ch)
	movwf	1+(_distance)	;volatile
	line	58
;infrared.c: 58: }
	goto	i1l2911
	line	59
	
i1l2896:	
	
i1l8413:	
;infrared.c: 59: else if (adcVal < 82 && adcVal >= 70)
	movlw	high(052h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(052h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u349_21
	goto	u349_20
u349_21:
	goto	i1l8419
u349_20:
	
i1l8415:	
	movlw	high(046h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(046h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l8419
u350_20:
	line	61
	
i1l8417:	
;infrared.c: 60: {
;infrared.c: 61: distance = 70+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(046h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(046h)
	movwf	1+(_distance)	;volatile
	line	62
;infrared.c: 62: }
	goto	i1l2911
	line	63
	
i1l2898:	
	
i1l8419:	
;infrared.c: 63: else if (adcVal < 70 && adcVal >= 64)
	movlw	high(046h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(046h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u351_21
	goto	u351_20
u351_21:
	goto	i1l8425
u351_20:
	
i1l8421:	
	movlw	high(040h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(040h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l8425
u352_20:
	line	65
	
i1l8423:	
;infrared.c: 64: {
;infrared.c: 65: distance = 80+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(050h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(050h)
	movwf	1+(_distance)	;volatile
	line	66
;infrared.c: 66: }
	goto	i1l2911
	line	67
	
i1l2900:	
	
i1l8425:	
;infrared.c: 67: else if (adcVal < 64 && adcVal >= 56)
	movlw	high(040h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(040h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u353_21
	goto	u353_20
u353_21:
	goto	i1l8431
u353_20:
	
i1l8427:	
	movlw	high(038h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l8431
u354_20:
	line	69
	
i1l8429:	
;infrared.c: 68: {
;infrared.c: 69: distance = 90+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(05Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(05Ah)
	movwf	1+(_distance)	;volatile
	line	70
;infrared.c: 70: }
	goto	i1l2911
	line	71
	
i1l2902:	
	
i1l8431:	
;infrared.c: 71: else if (adcVal < 56 && adcVal >= 45)
	movlw	high(038h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l8437
u355_20:
	
i1l8433:	
	movlw	high(02Dh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(02Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u356_21
	goto	u356_20
u356_21:
	goto	i1l8437
u356_20:
	line	73
	
i1l8435:	
;infrared.c: 72: {
;infrared.c: 73: distance = 100+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(064h)
	movwf	1+(_distance)	;volatile
	line	74
;infrared.c: 74: }
	goto	i1l2911
	line	75
	
i1l2904:	
	
i1l8437:	
;infrared.c: 75: else if (adcVal < 45 && adcVal >= 40)
	movlw	high(02Dh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(02Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u357_21
	goto	u357_20
u357_21:
	goto	i1l8443
u357_20:
	
i1l8439:	
	movlw	high(028h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(028h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u358_21
	goto	u358_20
u358_21:
	goto	i1l8443
u358_20:
	line	77
	
i1l8441:	
;infrared.c: 76: {
;infrared.c: 77: distance = 110+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(06Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(06Eh)
	movwf	1+(_distance)	;volatile
	line	78
;infrared.c: 78: }
	goto	i1l2911
	line	79
	
i1l2906:	
	
i1l8443:	
;infrared.c: 79: else if (adcVal < 40 && adcVal >= 33)
	movlw	high(028h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(028h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u359_21
	goto	u359_20
u359_21:
	goto	i1l8449
u359_20:
	
i1l8445:	
	movlw	high(021h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(021h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
	goto	u360_21
	goto	u360_20
u360_21:
	goto	i1l8449
u360_20:
	line	81
	
i1l8447:	
;infrared.c: 80: {
;infrared.c: 81: distance = 120+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(078h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(078h)
	movwf	1+(_distance)	;volatile
	line	82
;infrared.c: 82: }
	goto	i1l2911
	line	83
	
i1l2908:	
	
i1l8449:	
;infrared.c: 83: else if (adcVal < 33 )
	movlw	high(021h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(021h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
	goto	u361_21
	goto	u361_20
u361_21:
	goto	i1l2911
u361_20:
	line	85
	
i1l8451:	
;infrared.c: 84: {
;infrared.c: 85: distance = 130 + (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_adcVal+1),w	;volatile
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_adcVal),w	;volatile
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(082h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(082h)
	movwf	1+(_distance)	;volatile
	goto	i1l2911
	line	86
	
i1l2910:	
	goto	i1l2911
	line	96
	
i1l2909:	
	goto	i1l2911
	
i1l2907:	
	goto	i1l2911
	
i1l2905:	
	goto	i1l2911
	
i1l2903:	
	goto	i1l2911
	
i1l2901:	
	goto	i1l2911
	
i1l2899:	
	goto	i1l2911
	
i1l2897:	
	goto	i1l2911
	
i1l2895:	
	goto	i1l2911
	
i1l2893:	
	goto	i1l2911
	
i1l2891:	
	goto	i1l2911
	
i1l2889:	
	goto	i1l2911
	
i1l2887:	
	
i1l2911:	
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,88
	global	_ReadButtons
psect	text594,local,class=CODE,delta=2
global __ptext594
__ptext594:

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
psect	text594
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	143
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 2
; Regs used in _ReadButtons: [wreg+status,2+status,0+pclath+cstack]
	line	144
	
i1l8285:	
;HMI.c: 144: Debounce();
	fcall	_Debounce
	line	146
	
i1l8287:	
;HMI.c: 146: if(UpPressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u331_21
	goto	u331_20
u331_21:
	goto	i1l5113
u331_20:
	line	148
	
i1l8289:	
;HMI.c: 147: {
;HMI.c: 148: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	149
	
i1l8291:	
;HMI.c: 149: return 1;
	movlw	(01h)
	goto	i1l5114
	
i1l8293:	
	goto	i1l5114
	line	151
	
i1l5113:	
	line	153
;HMI.c: 151: }
;HMI.c: 153: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u332_21
	goto	u332_20
u332_21:
	goto	i1l5115
u332_20:
	line	155
	
i1l8295:	
;HMI.c: 154: {
;HMI.c: 155: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	156
	
i1l8297:	
;HMI.c: 156: return 2;
	movlw	(02h)
	goto	i1l5114
	
i1l8299:	
	goto	i1l5114
	line	158
	
i1l5115:	
	line	159
;HMI.c: 158: }
;HMI.c: 159: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u333_21
	goto	u333_20
u333_21:
	goto	i1l5116
u333_20:
	line	161
	
i1l8301:	
;HMI.c: 160: {
;HMI.c: 161: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	162
	
i1l8303:	
;HMI.c: 162: return 3;
	movlw	(03h)
	goto	i1l5114
	
i1l8305:	
	goto	i1l5114
	line	164
	
i1l5116:	
	line	165
;HMI.c: 164: }
;HMI.c: 165: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u334_21
	goto	u334_20
u334_21:
	goto	i1l5117
u334_20:
	line	167
	
i1l8307:	
;HMI.c: 166: {
;HMI.c: 167: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	168
	
i1l8309:	
;HMI.c: 168: return 4;
	movlw	(04h)
	goto	i1l5114
	
i1l8311:	
	goto	i1l5114
	line	170
	
i1l5117:	
	line	172
;HMI.c: 170: }
;HMI.c: 172: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u335_21
	goto	u335_20
u335_21:
	goto	i1l8319
u335_20:
	line	174
	
i1l8313:	
;HMI.c: 173: {
;HMI.c: 174: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	175
	
i1l8315:	
;HMI.c: 175: return 5;
	movlw	(05h)
	goto	i1l5114
	
i1l8317:	
	goto	i1l5114
	line	177
	
i1l5118:	
	line	178
	
i1l8319:	
;HMI.c: 177: }
;HMI.c: 178: return 0;
	movlw	(0)
	goto	i1l5114
	
i1l8321:	
	line	179
	
i1l5114:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
	global	_lcd_write_data
psect	text595,local,class=CODE,delta=2
global __ptext595
__ptext595:

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
psect	text595
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
	
i1l8143:	
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
	
i1l8145:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
i1l8147:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
i1l8149:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u423_27:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u423_27
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u423_27
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
psect	text596,local,class=CODE,delta=2
global __ptext596
__ptext596:

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
psect	text596
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
	
i1l8117:	
;adc.c: 6: switch(channel)
	goto	i1l8125
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
	goto	i1l8127
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
	goto	i1l8127
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
	goto	i1l8127
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
	goto	i1l8127
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
	goto	i1l8127
	line	35
;adc.c: 35: default:
	
i1l696:	
	line	36
	
i1l8119:	
;adc.c: 36: return 0;
	movlw	(0)
	goto	i1l697
	
i1l8121:	
	goto	i1l697
	line	37
	
i1l8123:	
;adc.c: 37: }
	goto	i1l8127
	line	6
	
i1l689:	
	
i1l8125:	
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
	goto	i1l8119
	opt asmopt_on

	line	37
	
i1l691:	
	line	39
	
i1l8127:	
;adc.c: 39: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u424_27:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u424_27
opt asmopt_on

	line	41
	
i1l8129:	
;adc.c: 41: return adc_read();
	fcall	_adc_read
	movf	(0+(?_adc_read)),w
	goto	i1l697
	
i1l8131:	
	line	43
	
i1l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
psect	text597,local,class=CODE,delta=2
global __ptext597
__ptext597:

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
psect	text597
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
i1l8737:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l8741
u411_20:
	line	10
	
i1l8739:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	i1l8741
	line	12
	
i1l6065:	
	line	13
	
i1l8741:	
	btfss	(___awmod@divisor+1),7
	goto	u412_21
	goto	u412_20
u412_21:
	goto	i1l8745
u412_20:
	line	14
	
i1l8743:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	i1l8745
	
i1l6066:	
	line	15
	
i1l8745:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u413_21
	goto	u413_20
u413_21:
	goto	i1l8763
u413_20:
	line	16
	
i1l8747:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	i1l8753
	
i1l6069:	
	line	18
	
i1l8749:	
	movlw	01h
	
u414_25:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u414_25
	line	19
	
i1l8751:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	i1l8753
	line	20
	
i1l6068:	
	line	17
	
i1l8753:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u415_21
	goto	u415_20
u415_21:
	goto	i1l8749
u415_20:
	goto	i1l8755
	
i1l6070:	
	goto	i1l8755
	line	21
	
i1l6071:	
	line	22
	
i1l8755:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u416_25
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u416_25:
	skipc
	goto	u416_21
	goto	u416_20
u416_21:
	goto	i1l8759
u416_20:
	line	23
	
i1l8757:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	i1l8759
	
i1l6072:	
	line	24
	
i1l8759:	
	movlw	01h
	
u417_25:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u417_25
	line	25
	
i1l8761:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u418_21
	goto	u418_20
u418_21:
	goto	i1l8755
u418_20:
	goto	i1l8763
	
i1l6073:	
	goto	i1l8763
	line	26
	
i1l6067:	
	line	27
	
i1l8763:	
	movf	(___awmod@sign),w
	skipz
	goto	u419_20
	goto	i1l8767
u419_20:
	line	28
	
i1l8765:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	i1l8767
	
i1l6074:	
	line	29
	
i1l8767:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	i1l6075
	
i1l8769:	
	line	30
	
i1l6075:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___lwmod
psect	text598,local,class=CODE,delta=2
global __ptext598
__ptext598:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    8[COMMON] unsigned int 
;;  dividend        2   10[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    8[COMMON] unsigned int 
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
;;		_ADCconvert
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text598
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l8715:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u405_21
	goto	u405_20
u405_21:
	goto	i1l8733
u405_20:
	line	9
	
i1l8717:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	i1l8723
	
i1l5875:	
	line	11
	
i1l8719:	
	movlw	01h
	
u406_25:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u406_25
	line	12
	
i1l8721:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	i1l8723
	line	13
	
i1l5874:	
	line	10
	
i1l8723:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u407_21
	goto	u407_20
u407_21:
	goto	i1l8719
u407_20:
	goto	i1l8725
	
i1l5876:	
	goto	i1l8725
	line	14
	
i1l5877:	
	line	15
	
i1l8725:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u408_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u408_25:
	skipc
	goto	u408_21
	goto	u408_20
u408_21:
	goto	i1l8729
u408_20:
	line	16
	
i1l8727:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	i1l8729
	
i1l5878:	
	line	17
	
i1l8729:	
	movlw	01h
	
u409_25:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u409_25
	line	18
	
i1l8731:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u410_21
	goto	u410_20
u410_21:
	goto	i1l8725
u410_20:
	goto	i1l8733
	
i1l5879:	
	goto	i1l8733
	line	19
	
i1l5873:	
	line	20
	
i1l8733:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	i1l5880
	
i1l8735:	
	line	21
	
i1l5880:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text599,local,class=CODE,delta=2
global __ptext599
__ptext599:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
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
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_readAvgDistance
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text599
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
i1l8689:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
i1l8691:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u398_21
	goto	u398_20
u398_21:
	goto	i1l8711
u398_20:
	line	11
	
i1l8693:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	i1l8699
	
i1l5865:	
	line	13
	
i1l8695:	
	movlw	01h
	
u399_25:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u399_25
	line	14
	
i1l8697:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	i1l8699
	line	15
	
i1l5864:	
	line	12
	
i1l8699:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u400_21
	goto	u400_20
u400_21:
	goto	i1l8695
u400_20:
	goto	i1l8701
	
i1l5866:	
	goto	i1l8701
	line	16
	
i1l5867:	
	line	17
	
i1l8701:	
	movlw	01h
	
u401_25:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u401_25
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u402_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u402_25:
	skipc
	goto	u402_21
	goto	u402_20
u402_21:
	goto	i1l8707
u402_20:
	line	19
	
i1l8703:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
i1l8705:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l8707
	line	21
	
i1l5868:	
	line	22
	
i1l8707:	
	movlw	01h
	
u403_25:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u403_25
	line	23
	
i1l8709:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u404_21
	goto	u404_20
u404_21:
	goto	i1l8701
u404_20:
	goto	i1l8711
	
i1l5869:	
	goto	i1l8711
	line	24
	
i1l5863:	
	line	25
	
i1l8711:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	i1l5870
	
i1l8713:	
	line	26
	
i1l5870:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_Debounce
psect	text600,local,class=CODE,delta=2
global __ptext600
__ptext600:

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
psect	text600
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	63
	global	__size_of_Debounce
	__size_of_Debounce	equ	__end_of_Debounce-_Debounce
	
_Debounce:	
	opt	stack 2
; Regs used in _Debounce: [wreg+status,2+status,0]
	line	65
	
i1l8589:	
;HMI.c: 65: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u375_21
	goto	u375_20
u375_21:
	goto	i1l5095
u375_20:
	line	67
	
i1l8591:	
;HMI.c: 66: {
;HMI.c: 67: UpDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_UpDebounceCount),f	;volatile
	line	68
	
i1l8593:	
;HMI.c: 68: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount),w	;volatile
	skipc
	goto	u376_21
	goto	u376_20
u376_21:
	goto	i1l5097
u376_20:
	
i1l8595:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u377_21
	goto	u377_20
u377_21:
	goto	i1l5097
u377_20:
	line	70
	
i1l8597:	
;HMI.c: 69: {
;HMI.c: 70: UpPressed = 1;
	bsf	(_UpPressed/8),(_UpPressed)&7
	line	71
;HMI.c: 71: UpReleased = 0;
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l5097
	line	72
	
i1l5096:	
	line	73
;HMI.c: 72: }
;HMI.c: 73: }
	goto	i1l5097
	line	74
	
i1l5095:	
	line	76
;HMI.c: 74: else
;HMI.c: 75: {
;HMI.c: 76: UpDebounceCount = 0;
	clrf	(_UpDebounceCount)	;volatile
	line	77
;HMI.c: 77: UpReleased = 1;
	bsf	(_UpReleased/8),(_UpReleased)&7
	line	78
	
i1l5097:	
	line	81
;HMI.c: 78: }
;HMI.c: 81: if(!RB3)
	btfsc	(51/8),(51)&7
	goto	u378_21
	goto	u378_20
u378_21:
	goto	i1l5098
u378_20:
	line	83
	
i1l8599:	
;HMI.c: 82: {
;HMI.c: 83: DownDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_DownDebounceCount),f	;volatile
	line	84
	
i1l8601:	
;HMI.c: 84: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount),w	;volatile
	skipc
	goto	u379_21
	goto	u379_20
u379_21:
	goto	i1l5100
u379_20:
	
i1l8603:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u380_21
	goto	u380_20
u380_21:
	goto	i1l5100
u380_20:
	line	86
	
i1l8605:	
;HMI.c: 85: {
;HMI.c: 86: DownPressed = 1;
	bsf	(_DownPressed/8),(_DownPressed)&7
	line	87
;HMI.c: 87: DownReleased = 0;
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l5100
	line	88
	
i1l5099:	
	line	89
;HMI.c: 88: }
;HMI.c: 89: }
	goto	i1l5100
	line	90
	
i1l5098:	
	line	92
;HMI.c: 90: else
;HMI.c: 91: {
;HMI.c: 92: DownDebounceCount = 0;
	clrf	(_DownDebounceCount)	;volatile
	line	93
;HMI.c: 93: DownReleased = 1;
	bsf	(_DownReleased/8),(_DownReleased)&7
	line	94
	
i1l5100:	
	line	96
;HMI.c: 94: }
;HMI.c: 96: if(!RB4)
	btfsc	(52/8),(52)&7
	goto	u381_21
	goto	u381_20
u381_21:
	goto	i1l5101
u381_20:
	line	98
	
i1l8607:	
;HMI.c: 97: {
;HMI.c: 98: LeftDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_LeftDebounceCount),f	;volatile
	line	99
	
i1l8609:	
;HMI.c: 99: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount),w	;volatile
	skipc
	goto	u382_21
	goto	u382_20
u382_21:
	goto	i1l5103
u382_20:
	
i1l8611:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u383_21
	goto	u383_20
u383_21:
	goto	i1l5103
u383_20:
	line	101
	
i1l8613:	
;HMI.c: 100: {
;HMI.c: 101: LeftPressed = 1;
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	line	102
;HMI.c: 102: LeftReleased = 0;
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l5103
	line	103
	
i1l5102:	
	line	104
;HMI.c: 103: }
;HMI.c: 104: }
	goto	i1l5103
	line	105
	
i1l5101:	
	line	107
;HMI.c: 105: else
;HMI.c: 106: {
;HMI.c: 107: LeftDebounceCount = 0;
	clrf	(_LeftDebounceCount)	;volatile
	line	108
;HMI.c: 108: LeftReleased = 1;
	bsf	(_LeftReleased/8),(_LeftReleased)&7
	line	109
	
i1l5103:	
	line	111
;HMI.c: 109: }
;HMI.c: 111: if(!RB5)
	btfsc	(53/8),(53)&7
	goto	u384_21
	goto	u384_20
u384_21:
	goto	i1l5104
u384_20:
	line	113
	
i1l8615:	
;HMI.c: 112: {
;HMI.c: 113: RightDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_RightDebounceCount),f	;volatile
	line	114
	
i1l8617:	
;HMI.c: 114: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount),w	;volatile
	skipc
	goto	u385_21
	goto	u385_20
u385_21:
	goto	i1l5106
u385_20:
	
i1l8619:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u386_21
	goto	u386_20
u386_21:
	goto	i1l5106
u386_20:
	line	116
	
i1l8621:	
;HMI.c: 115: {
;HMI.c: 116: RightPressed = 1;
	bsf	(_RightPressed/8),(_RightPressed)&7
	line	117
;HMI.c: 117: RightReleased = 0;
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l5106
	line	118
	
i1l5105:	
	line	119
;HMI.c: 118: }
;HMI.c: 119: }
	goto	i1l5106
	line	120
	
i1l5104:	
	line	122
;HMI.c: 120: else
;HMI.c: 121: {
;HMI.c: 122: RightDebounceCount = 0;
	clrf	(_RightDebounceCount)	;volatile
	line	123
;HMI.c: 123: RightReleased = 1;
	bsf	(_RightReleased/8),(_RightReleased)&7
	line	124
	
i1l5106:	
	line	126
;HMI.c: 124: }
;HMI.c: 126: if(!RB6)
	btfsc	(54/8),(54)&7
	goto	u387_21
	goto	u387_20
u387_21:
	goto	i1l5107
u387_20:
	line	128
	
i1l8623:	
;HMI.c: 127: {
;HMI.c: 128: CenterDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_CenterDebounceCount),f	;volatile
	line	129
	
i1l8625:	
;HMI.c: 129: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount),w	;volatile
	skipc
	goto	u388_21
	goto	u388_20
u388_21:
	goto	i1l5110
u388_20:
	
i1l8627:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u389_21
	goto	u389_20
u389_21:
	goto	i1l5110
u389_20:
	line	131
	
i1l8629:	
;HMI.c: 130: {
;HMI.c: 131: CenterPressed = 1;
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	line	132
;HMI.c: 132: CenterReleased = 0;
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l5110
	line	133
	
i1l5108:	
	line	134
;HMI.c: 133: }
;HMI.c: 134: }
	goto	i1l5110
	line	135
	
i1l5107:	
	line	137
;HMI.c: 135: else
;HMI.c: 136: {
;HMI.c: 137: CenterDebounceCount = 0;
	clrf	(_CenterDebounceCount)	;volatile
	line	138
;HMI.c: 138: CenterReleased = 1;
	bsf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l5110
	line	139
	
i1l5109:	
	line	140
	
i1l5110:	
	return
	opt stack 0
GLOBAL	__end_of_Debounce
	__end_of_Debounce:
;; =============== function _Debounce ends ============

	signat	_Debounce,88
	global	_adc_read
psect	text601,local,class=CODE,delta=2
global __ptext601
__ptext601:

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
psect	text601
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	64
	
i1l8133:	
;adc.c: 62: volatile unsigned int adc_value;
;adc.c: 64: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	66
	
i1l8135:	
;adc.c: 66: GO = 1;
	bsf	(250/8),(250)&7
	line	67
;adc.c: 67: while(GO) continue;
	goto	i1l703
	
i1l704:	
	
i1l703:	
	btfsc	(250/8),(250)&7
	goto	u310_21
	goto	u310_20
u310_21:
	goto	i1l703
u310_20:
	
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
psect	text601
	line	73
	
i1l8137:	
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
	
u311_25:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u311_25
	line	75
;adc.c: 75: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	78
	
i1l8139:	
;adc.c: 78: return (adc_value);
	movf	(adc_read@adc_value+1),w	;volatile
	clrf	(?_adc_read+1)
	addwf	(?_adc_read+1)
	movf	(adc_read@adc_value),w	;volatile
	clrf	(?_adc_read)
	addwf	(?_adc_read)

	goto	i1l706
	
i1l8141:	
	line	79
	
i1l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
psect	text602,local,class=CODE,delta=2
global __ptext602
__ptext602:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
