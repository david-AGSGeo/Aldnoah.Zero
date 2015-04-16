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
# 32 "E:\Aldnoah.Zero\Assignment3\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 32 "E:\Aldnoah.Zero\Assignment3\Main.c"
	dw 0xFFFE & 0xFFFB & 0xFFFF & 0xFFBF & 0xFFF7 & 0xFFFF & 0xFF7F & 0xFFFF ;#
	FNCALL	_main,_init
	FNCALL	_main,_ser_putch
	FNCALL	_init,_init_adc
	FNCALL	_init,_lcd_init
	FNCALL	_init,_ser_init
	FNCALL	_lcd_init,_lcd_write_control
	FNROOT	_main
	FNCALL	_isr1,___lwmod
	FNCALL	_isr1,_readAvgDistance
	FNCALL	_isr1,_ADCconvert
	FNCALL	_ADCconvert,___lwmod
	FNCALL	_ADCconvert,i1_lcd_write_control
	FNCALL	_ADCconvert,_sprintf
	FNCALL	_ADCconvert,_lcd_set_cursor
	FNCALL	_ADCconvert,_lcd_write_string
	FNCALL	_readAvgDistance,_adc_read_channel
	FNCALL	_readAvgDistance,___lwdiv
	FNCALL	_readAvgDistance,_sprintf
	FNCALL	_lcd_write_string,_lcd_write_data
	FNCALL	_lcd_set_cursor,i1_lcd_write_control
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_adc_read_channel,_adc_read
	FNCALL	intlevel1,_isr1
	global	intlevel1
	FNROOT	intlevel1
	global	_current_step
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
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
	global	_rxiptr
	global	_rxoptr
	global	_txiptr
	global	_txoptr
	global	_RTC_FLAG_10MS
	global	_RTC_FLAG_1MS
	global	_RTC_FLAG_250MS
	global	_RTC_FLAG_500MS
	global	_RTC_FLAG_50MS
	global	_pb0Pressed
	global	_pb0Released
	global	_pb1Pressed
	global	_pb1Released
	global	_pb2Pressed
	global	_pb2Released
	global	_pb3Pressed
	global	_pb3Released
	global	ADCconvert@F1192
	global	_rxfifo
	global	_txfifo
	global	readAvgDistance@F1184
	global	readDistance@F1189
	global	_current_direction
	global	_pb0DebounceCount
	global	_pb1DebounceCount
	global	_pb2DebounceCount
	global	_pb3DebounceCount
	global	_ser_tmp
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
	
STR_3:	
	retlw	68	;'D'
	retlw	105	;'i'
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	99	;'c'
	retlw	101	;'e'
	retlw	58	;':'
	retlw	32	;' '
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	99	;'c'
	retlw	109	;'m'
	retlw	0
psect	strings
	
STR_1:	
	retlw	65	;'A'
	retlw	100	;'d'
	retlw	99	;'c'
	retlw	32	;' '
	retlw	86	;'V'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	117	;'u'
	retlw	101	;'e'
	retlw	58	;':'
	retlw	32	;' '
	retlw	37	;'%'
	retlw	100	;'d'
	retlw	0
psect	strings
STR_2	equ	STR_1+0
	file	"Assignment3_AldnoahZero.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssBANK0,class=BANK0,bit,space=1
global __pbitbssBANK0
__pbitbssBANK0:
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

_pb0Pressed:
       ds      1

_pb0Released:
       ds      1

_pb1Pressed:
       ds      1

_pb1Released:
       ds      1

_pb2Pressed:
       ds      1

_pb2Released:
       ds      1

_pb3Pressed:
       ds      1

_pb3Released:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_RTC_Counter:
       ds      2

_rxiptr:
       ds      1

_rxoptr:
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

readAvgDistance@F1184:
       ds      16

readDistance@F1189:
       ds      16

_current_direction:
       ds      1

_pb0DebounceCount:
       ds      1

_pb1DebounceCount:
       ds      1

_pb2DebounceCount:
       ds      1

_pb3DebounceCount:
       ds      1

_ser_tmp:
       ds      1

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	21
_current_step:
       ds      1

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
ADCconvert@F1192:
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
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+046h)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+010h)
	fcall	clear_ram
; Initialize objects allocated to BANK1
	global __pidataBANK1
psect cinit,class=CODE,delta=2
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	fcall	__pidataBANK1+0		;fetch initializer
	movwf	__pdataBANK1+0&07fh		
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
	global	??_ser_putch
??_ser_putch:	; 0 bytes @ 0x0
	global	??_init_adc
??_init_adc:	; 0 bytes @ 0x0
	global	??_lcd_write_control
??_lcd_write_control:	; 0 bytes @ 0x0
	ds	1
	global	ser_putch@c
ser_putch@c:	; 1 bytes @ 0x1
	ds	1
	global	lcd_write_control@databyte
lcd_write_control@databyte:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	??_init
??_init:	; 0 bytes @ 0x3
	global	??_main
??_main:	; 0 bytes @ 0x3
	ds	3
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_ser_init
?_ser_init:	; 0 bytes @ 0x0
	global	?_ser_putch
?_ser_putch:	; 0 bytes @ 0x0
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
	global	?_lcd_write_string
?_lcd_write_string:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_isr1
?_isr1:	; 0 bytes @ 0x0
	global	?_init
?_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?i1_lcd_write_control
?i1_lcd_write_control:	; 0 bytes @ 0x0
	global	??i1_lcd_write_control
??i1_lcd_write_control:	; 0 bytes @ 0x0
	global	?_adc_read_channel
?_adc_read_channel:	; 1 bytes @ 0x0
	global	?_adc_read
?_adc_read:	; 2 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	ds	2
	global	??_adc_read
??_adc_read:	; 0 bytes @ 0x2
	global	lcd_write_data@databyte
lcd_write_data@databyte:	; 1 bytes @ 0x2
	global	i1lcd_write_control@databyte
i1lcd_write_control@databyte:	; 1 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_lcd_set_cursor
??_lcd_set_cursor:	; 0 bytes @ 0x3
	global	??_lcd_write_string
??_lcd_write_string:	; 0 bytes @ 0x3
	global	lcd_set_cursor@address
lcd_set_cursor@address:	; 1 bytes @ 0x3
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	lcd_write_string@s
lcd_write_string@s:	; 1 bytes @ 0x4
	global	adc_read@adc_value
adc_read@adc_value:	; 2 bytes @ 0x4
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	??_adc_read_channel
??_adc_read_channel:	; 0 bytes @ 0x6
	ds	1
	global	adc_read_channel@channel
adc_read_channel@channel:	; 1 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	ds	1
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x8
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x8
	ds	2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xA
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0xC
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x0
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0x0
	ds	3
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0x3
	ds	3
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x6
	ds	1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x7
	ds	1
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x8
	ds	1
	global	sprintf@_val
sprintf@_val:	; 4 bytes @ 0x9
	ds	4
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0xD
	ds	1
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0xE
	ds	1
	global	?_readAvgDistance
?_readAvgDistance:	; 2 bytes @ 0xF
	ds	2
	global	??_readAvgDistance
??_readAvgDistance:	; 0 bytes @ 0x11
	ds	4
	global	readAvgDistance@adcOutput
readAvgDistance@adcOutput:	; 16 bytes @ 0x15
	ds	16
	global	readAvgDistance@fullval
readAvgDistance@fullval:	; 2 bytes @ 0x25
	ds	2
	global	readAvgDistance@averageval
readAvgDistance@averageval:	; 2 bytes @ 0x27
	ds	2
	global	readAvgDistance@i
readAvgDistance@i:	; 2 bytes @ 0x29
	ds	2
	global	?_ADCconvert
?_ADCconvert:	; 0 bytes @ 0x2B
	global	ADCconvert@adcVal
ADCconvert@adcVal:	; 2 bytes @ 0x2B
	ds	2
	global	??_ADCconvert
??_ADCconvert:	; 0 bytes @ 0x2D
	ds	4
	global	ADCconvert@adcOutput
ADCconvert@adcOutput:	; 16 bytes @ 0x31
	ds	16
	global	ADCconvert@distance
ADCconvert@distance:	; 2 bytes @ 0x41
	ds	2
	global	??_isr1
??_isr1:	; 0 bytes @ 0x43
	ds	5
;;Data sizes: Strings 29, constant 10, data 1, bss 92, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     72      80
;; BANK1           80      6      77
;; BANK3           96      0      16
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_readAvgDistance	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?_adc_read	unsigned int  size(1) Largest target is 0
;;
;; sprintf@f	PTR const unsigned char  size(1) Largest target is 15
;;		 -> STR_3(CODE[15]), STR_2(CODE[14]), STR_1(CODE[14]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;;		 -> ADCconvert@adcOutput(BANK0[16]), readDistance@adcOutput(BANK0[16]), readAvgDistance@adcOutput(BANK0[16]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK0[2]), 
;;
;; S5501$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; lcd_write_string@s	PTR unsigned char  size(1) Largest target is 16
;;		 -> ADCconvert@adcOutput(BANK0[16]), readDistance@adcOutput(BANK0[16]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr1 in COMMON
;;
;;   _isr1->___lwmod
;;   _ADCconvert->___lwmod
;;   _lcd_write_string->_lcd_write_data
;;   _lcd_set_cursor->i1_lcd_write_control
;;   _sprintf->___lwmod
;;   _adc_read_channel->_adc_read
;;   ___lwmod->___lwdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _isr1 in BANK0
;;
;;   _isr1->_ADCconvert
;;   _ADCconvert->_readAvgDistance
;;   _readAvgDistance->_sprintf
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0      44
;;                                              3 BANK1      3     3      0
;;                               _init
;;                          _ser_putch
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
;; (1) _ser_putch                                            2     2      0      22
;;                                              0 BANK1      2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _ser_init                                             1     1      0       0
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _isr1                                                 5     5      0    3386
;;                                             67 BANK0      5     5      0
;;                            ___lwmod
;;                    _readAvgDistance
;;                         _ADCconvert
;; ---------------------------------------------------------------------------------
;; (5) _ADCconvert                                          24    22      2    2075
;;                                             43 BANK0     24    22      2
;;                            ___lwmod
;;                i1_lcd_write_control
;;                            _sprintf
;;                     _lcd_set_cursor
;;                   _lcd_write_string
;;                    _readAvgDistance (ARG)
;; ---------------------------------------------------------------------------------
;; (5) _readAvgDistance                                     28    26      2    1152
;;                                             15 BANK0     28    26      2
;;                   _adc_read_channel
;;                            ___lwdiv
;;                            _sprintf
;; ---------------------------------------------------------------------------------
;; (6) _lcd_write_string                                     2     2      0      67
;;                                              3 COMMON     2     2      0
;;                     _lcd_write_data
;; ---------------------------------------------------------------------------------
;; (6) _lcd_set_cursor                                       1     1      0      96
;;                                              3 COMMON     1     1      0
;;                i1_lcd_write_control
;; ---------------------------------------------------------------------------------
;; (7) i1_lcd_write_control                                  3     3      0      73
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (6) _sprintf                                             15    12      3     798
;;                                              0 BANK0     15    12      3
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (7) _lcd_write_data                                       3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (6) _adc_read_channel                                     2     2      0      46
;;                                              6 COMMON     2     2      0
;;                           _adc_read
;; ---------------------------------------------------------------------------------
;; (7) ___lwmod                                              6     2      4     159
;;                                              8 COMMON     6     2      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (7) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (7) _adc_read                                             6     4      2      24
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 7
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;     _init_adc
;;     _lcd_init
;;       _lcd_write_control
;;     _ser_init
;;   _ser_putch
;;
;; _isr1 (ROOT)
;;   ___lwmod
;;     ___lwdiv (ARG)
;;   _readAvgDistance
;;     _adc_read_channel
;;       _adc_read
;;     ___lwdiv
;;     _sprintf
;;       ___lwdiv
;;       ___lwmod
;;         ___lwdiv (ARG)
;;   _ADCconvert
;;     ___lwmod
;;       ___lwdiv (ARG)
;;     i1_lcd_write_control
;;     _sprintf
;;       ___lwdiv
;;       ___lwmod
;;         ___lwdiv (ARG)
;;     _lcd_set_cursor
;;       i1_lcd_write_control
;;     _lcd_write_string
;;       _lcd_write_data
;;     _readAvgDistance (ARG)
;;       _adc_read_channel
;;         _adc_read
;;       ___lwdiv
;;       _sprintf
;;         ___lwdiv
;;         ___lwmod
;;           ___lwdiv (ARG)
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
;;BANK1               50      6      4D       7       96.3%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      C6      12        0.0%
;;ABS                  0      0      BB       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       B       2        0.0%
;;BANK0               50     48      50       5      100.0%
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
;;		line 211 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;      Temps:          0       0       3       0       0
;;      Totals:         0       0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_init
;;		_ser_putch
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	211
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	216
	
l7954:	
;Main.c: 216: init();
	fcall	_init
	line	217
	
l7956:	
;Main.c: 217: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	218
	
l7958:	
;Main.c: 218: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u3997:
	decfsz	((??_main+0)^080h+0),f
	goto	u3997
	decfsz	((??_main+0)^080h+0+1),f
	goto	u3997
	decfsz	((??_main+0)^080h+0+2),f
	goto	u3997
	nop2
opt asmopt_on

	line	219
	
l7960:	
;Main.c: 219: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	220
	
l7962:	
;Main.c: 220: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4007:
	decfsz	((??_main+0)^080h+0),f
	goto	u4007
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4007
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4007
	nop2
opt asmopt_on

	line	221
	
l7964:	
;Main.c: 221: ser_putch(140);
	movlw	(08Ch)
	fcall	_ser_putch
	line	222
	
l7966:	
;Main.c: 222: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4017:
	decfsz	((??_main+0)^080h+0),f
	goto	u4017
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4017
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4017
	nop2
opt asmopt_on

	line	223
	
l7968:	
;Main.c: 223: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	224
	
l7970:	
;Main.c: 224: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4027:
	decfsz	((??_main+0)^080h+0),f
	goto	u4027
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4027
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4027
	nop2
opt asmopt_on

	line	225
	
l7972:	
;Main.c: 225: ser_putch(4);
	movlw	(04h)
	fcall	_ser_putch
	line	226
	
l7974:	
;Main.c: 226: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4037:
	decfsz	((??_main+0)^080h+0),f
	goto	u4037
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4037
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4037
	nop2
opt asmopt_on

	line	227
	
l7976:	
;Main.c: 227: ser_putch(62);
	movlw	(03Eh)
	fcall	_ser_putch
	line	228
	
l7978:	
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
u4047:
	decfsz	((??_main+0)^080h+0),f
	goto	u4047
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4047
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4047
	nop2
opt asmopt_on

	line	229
	
l7980:	
;Main.c: 229: ser_putch(12);
	movlw	(0Ch)
	fcall	_ser_putch
	line	230
	
l7982:	
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
u4057:
	decfsz	((??_main+0)^080h+0),f
	goto	u4057
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4057
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4057
	nop2
opt asmopt_on

	line	231
	
l7984:	
;Main.c: 231: ser_putch(66);
	movlw	(042h)
	fcall	_ser_putch
	line	232
	
l7986:	
;Main.c: 232: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4067:
	decfsz	((??_main+0)^080h+0),f
	goto	u4067
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4067
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4067
	nop2
opt asmopt_on

	line	233
	
l7988:	
;Main.c: 233: ser_putch(12);
	movlw	(0Ch)
	fcall	_ser_putch
	line	234
	
l7990:	
;Main.c: 234: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4077:
	decfsz	((??_main+0)^080h+0),f
	goto	u4077
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4077
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4077
	nop2
opt asmopt_on

	line	235
	
l7992:	
;Main.c: 235: ser_putch(69);
	movlw	(045h)
	fcall	_ser_putch
	line	236
	
l7994:	
;Main.c: 236: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4087:
	decfsz	((??_main+0)^080h+0),f
	goto	u4087
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4087
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4087
	nop2
opt asmopt_on

	line	237
	
l7996:	
;Main.c: 237: ser_putch(12);
	movlw	(0Ch)
	fcall	_ser_putch
	line	238
	
l7998:	
;Main.c: 238: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4097:
	decfsz	((??_main+0)^080h+0),f
	goto	u4097
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4097
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4097
	nop2
opt asmopt_on

	line	239
	
l8000:	
;Main.c: 239: ser_putch(74);
	movlw	(04Ah)
	fcall	_ser_putch
	line	240
	
l8002:	
;Main.c: 240: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4107:
	decfsz	((??_main+0)^080h+0),f
	goto	u4107
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4107
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4107
	nop2
opt asmopt_on

	line	241
	
l8004:	
;Main.c: 241: ser_putch(36);
	movlw	(024h)
	fcall	_ser_putch
	line	242
	
l8006:	
;Main.c: 242: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4117:
	decfsz	((??_main+0)^080h+0),f
	goto	u4117
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4117
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4117
	nop2
opt asmopt_on

	line	243
	
l8008:	
;Main.c: 243: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	244
	
l8010:	
;Main.c: 244: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u4127:
	decfsz	((??_main+0)^080h+0),f
	goto	u4127
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4127
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4127
	nop2
opt asmopt_on

	line	245
	
l8012:	
;Main.c: 245: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	246
	
l8014:	
;Main.c: 246: _delay((unsigned long)((10000)*(20000000/4000.0)));
	opt asmopt_off
movlw  254
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	168
movwf	((??_main+0)^080h+0+1),f
	movlw	97
movwf	((??_main+0)^080h+0),f
u4137:
	decfsz	((??_main+0)^080h+0),f
	goto	u4137
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4137
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4137
opt asmopt_on

	goto	l8016
	line	252
;Main.c: 252: while(1)
	
l2201:	
	line	254
	
l8016:	
;Main.c: 253: {
;Main.c: 254: if(pb0Pressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_pb0Pressed/8),(_pb0Pressed)&7
	goto	u3951
	goto	u3950
u3951:
	goto	l8062
u3950:
	line	256
	
l8018:	
;Main.c: 255: {
;Main.c: 256: pb0Pressed = 0;
	bcf	(_pb0Pressed/8),(_pb0Pressed)&7
	line	259
	
l8020:	
;Main.c: 259: RB1 ^= 0x01;
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	260
	
l8022:	
;Main.c: 260: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	261
	
l8024:	
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
u4147:
	decfsz	((??_main+0)^080h+0),f
	goto	u4147
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4147
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4147
	nop2
opt asmopt_on

	line	262
;Main.c: 262: ser_putch(132);
	movlw	(084h)
	fcall	_ser_putch
	line	263
	
l8026:	
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
u4157:
	decfsz	((??_main+0)^080h+0),f
	goto	u4157
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4157
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4157
	nop2
opt asmopt_on

	line	264
	
l8028:	
;Main.c: 264: ser_putch(140);
	movlw	(08Ch)
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
u4167:
	decfsz	((??_main+0)^080h+0),f
	goto	u4167
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4167
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4167
	nop2
opt asmopt_on

	line	266
	
l8030:	
;Main.c: 266: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	267
	
l8032:	
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
u4177:
	decfsz	((??_main+0)^080h+0),f
	goto	u4177
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4177
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4177
	nop2
opt asmopt_on

	line	268
;Main.c: 268: ser_putch(4);
	movlw	(04h)
	fcall	_ser_putch
	line	269
	
l8034:	
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
u4187:
	decfsz	((??_main+0)^080h+0),f
	goto	u4187
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4187
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4187
	nop2
opt asmopt_on

	line	270
	
l8036:	
;Main.c: 270: ser_putch(62);
	movlw	(03Eh)
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
u4197:
	decfsz	((??_main+0)^080h+0),f
	goto	u4197
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4197
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4197
	nop2
opt asmopt_on

	line	272
	
l8038:	
;Main.c: 272: ser_putch(12);
	movlw	(0Ch)
	fcall	_ser_putch
	line	273
	
l8040:	
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
u4207:
	decfsz	((??_main+0)^080h+0),f
	goto	u4207
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4207
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4207
	nop2
opt asmopt_on

	line	274
;Main.c: 274: ser_putch(66);
	movlw	(042h)
	fcall	_ser_putch
	line	275
	
l8042:	
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
u4217:
	decfsz	((??_main+0)^080h+0),f
	goto	u4217
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4217
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4217
	nop2
opt asmopt_on

	line	276
	
l8044:	
;Main.c: 276: ser_putch(12);
	movlw	(0Ch)
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
u4227:
	decfsz	((??_main+0)^080h+0),f
	goto	u4227
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4227
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4227
	nop2
opt asmopt_on

	line	278
	
l8046:	
;Main.c: 278: ser_putch(69);
	movlw	(045h)
	fcall	_ser_putch
	line	279
	
l8048:	
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
u4237:
	decfsz	((??_main+0)^080h+0),f
	goto	u4237
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4237
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4237
	nop2
opt asmopt_on

	line	280
;Main.c: 280: ser_putch(12);
	movlw	(0Ch)
	fcall	_ser_putch
	line	281
	
l8050:	
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
u4247:
	decfsz	((??_main+0)^080h+0),f
	goto	u4247
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4247
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4247
	nop2
opt asmopt_on

	line	282
	
l8052:	
;Main.c: 282: ser_putch(74);
	movlw	(04Ah)
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
u4257:
	decfsz	((??_main+0)^080h+0),f
	goto	u4257
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4257
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4257
	nop2
opt asmopt_on

	line	284
	
l8054:	
;Main.c: 284: ser_putch(36);
	movlw	(024h)
	fcall	_ser_putch
	line	285
	
l8056:	
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
u4267:
	decfsz	((??_main+0)^080h+0),f
	goto	u4267
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4267
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4267
	nop2
opt asmopt_on

	line	286
;Main.c: 286: ser_putch(141);
	movlw	(08Dh)
	fcall	_ser_putch
	line	287
	
l8058:	
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
u4277:
	decfsz	((??_main+0)^080h+0),f
	goto	u4277
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4277
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4277
	nop2
opt asmopt_on

	line	288
	
l8060:	
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
u4287:
	decfsz	((??_main+0)^080h+0),f
	goto	u4287
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4287
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4287
	nop2
opt asmopt_on

	goto	l8062
	line	291
	
l2202:	
	line	293
	
l8062:	
;Main.c: 291: }
;Main.c: 293: if(pb1Pressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_pb1Pressed/8),(_pb1Pressed)&7
	goto	u3961
	goto	u3960
u3961:
	goto	l2203
u3960:
	line	295
	
l8064:	
;Main.c: 294: {
;Main.c: 295: pb1Pressed = 0;
	bcf	(_pb1Pressed/8),(_pb1Pressed)&7
	line	298
	
l2203:	
	line	300
;Main.c: 298: }
;Main.c: 300: if(pb2Pressed)
	btfss	(_pb2Pressed/8),(_pb2Pressed)&7
	goto	u3971
	goto	u3970
u3971:
	goto	l2204
u3970:
	line	302
	
l8066:	
;Main.c: 301: {
;Main.c: 302: pb2Pressed = 0;
	bcf	(_pb2Pressed/8),(_pb2Pressed)&7
	line	305
	
l2204:	
	line	307
;Main.c: 305: }
;Main.c: 307: if(pb3Pressed)
	btfss	(_pb3Pressed/8),(_pb3Pressed)&7
	goto	u3981
	goto	u3980
u3981:
	goto	l8016
u3980:
	line	309
	
l8068:	
;Main.c: 308: {
;Main.c: 309: pb3Pressed = 0;
	bcf	(_pb3Pressed/8),(_pb3Pressed)&7
	line	312
	
l8070:	
;Main.c: 312: current_direction ^= 0x01;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	xorwf	(_current_direction)^080h,f
	goto	l8016
	line	313
	
l2205:	
	goto	l8016
	line	314
	
l2206:	
	line	252
	goto	l8016
	
l2207:	
	line	315
	
l2208:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_init
psect	text496,local,class=CODE,delta=2
global __ptext496
__ptext496:

;; *************** function _init *****************
;; Defined at:
;;		line 182 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;		_init_adc
;;		_lcd_init
;;		_ser_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text496
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	182
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 1
; Regs used in _init: [wreg+status,2+status,0+pclath+cstack]
	line	183
	
l7944:	
;Main.c: 183: init_adc();
	fcall	_init_adc
	line	184
;Main.c: 184: lcd_init();
	fcall	_lcd_init
	line	185
;Main.c: 185: ser_init();
	fcall	_ser_init
	line	187
	
l7946:	
;Main.c: 187: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	193
	
l7948:	
;Main.c: 193: OPTION_REG = 0b00000100;
	movlw	(04h)
	movwf	(129)^080h	;volatile
	line	196
	
l7950:	
;Main.c: 196: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	199
	
l7952:	
;Main.c: 199: (GIE = 1);
	bsf	(95/8),(95)&7
	line	200
	
l2198:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_lcd_init
psect	text497,local,class=CODE,delta=2
global __ptext497
__ptext497:

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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_lcd_write_control
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text497
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 1
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l7924:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l7926:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l7928:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l7930:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l7932:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l7934:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l7936:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l7938:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l7940:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l7942:	
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
psect	text498,local,class=CODE,delta=2
global __ptext498
__ptext498:

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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text498
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	18
	global	__size_of_lcd_write_control
	__size_of_lcd_write_control	equ	__end_of_lcd_write_control-_lcd_write_control
	
_lcd_write_control:	
	opt	stack 1
; Regs used in _lcd_write_control: [wreg]
;lcd_write_control@databyte stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_write_control@databyte)^080h
	line	19
	
l7916:	
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
	
l7918:	
;lcd.c: 22: PORTD = databyte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_control@databyte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	23
	
l7920:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l7922:	
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
u4297:
	decfsz	((??_lcd_write_control+0)^080h+0),f
	goto	u4297
	decfsz	((??_lcd_write_control+0)^080h+0+1),f
	goto	u4297
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
psect	text499,local,class=CODE,delta=2
global __ptext499
__ptext499:

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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text499
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	46
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 2
; Regs used in _init_adc: [wreg+status,2]
	line	48
	
l7906:	
;adc.c: 48: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	49
	
l7908:	
;adc.c: 49: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	52
	
l7910:	
;adc.c: 52: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	53
	
l7912:	
;adc.c: 53: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	55
	
l7914:	
;adc.c: 55: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_init_adc+0)^080h+0,f
u4307:
decfsz	(??_init_adc+0)^080h+0,f
	goto	u4307
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
psect	text500,local,class=CODE,delta=2
global __ptext500
__ptext500:

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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_ser_puts
;;		_ser_puts2
;;		_ser_puthex
;; This function uses a non-reentrant model
;;
psect	text500
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	70
	global	__size_of_ser_putch
	__size_of_ser_putch	equ	__end_of_ser_putch-_ser_putch
	
_ser_putch:	
	opt	stack 3
; Regs used in _ser_putch: [wreg-fsr0h+status,2+status,0]
;ser_putch@c stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ser_putch@c)^080h
	line	71
	
l7640:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l7642
	
l4371:	
	line	72
;ser.c: 72: continue;
	goto	l7642
	
l4370:	
	line	71
	
l7642:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	xorwf	(_txoptr),w	;volatile
	skipnz
	goto	u3601
	goto	u3600
u3601:
	goto	l7642
u3600:
	
l4372:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l7644:	
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
	
l7646:	
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
	
l7648:	
;ser.c: 76: TXIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1124/8)^080h,(1124)&7
	line	77
	
l7650:	
;ser.c: 77: GIE=1;
	bsf	(95/8),(95)&7
	line	78
	
l4373:	
	return
	opt stack 0
GLOBAL	__end_of_ser_putch
	__end_of_ser_putch:
;; =============== function _ser_putch ends ============

	signat	_ser_putch,4216
	global	_ser_init
psect	text501,local,class=CODE,delta=2
global __ptext501
__ptext501:

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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text501
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 2
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l7614:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l7616:	
;ser.c: 115: TRISC &= 0b10111111;
	movlw	(0BFh)
	movwf	(??_ser_init+0)^080h+0
	movf	(??_ser_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	116
	
l7618:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l7620:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l7622:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l7624:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l7626:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l7628:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l7630:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l7632:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l7634:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l7636:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l7638:	
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
	
l4395:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_isr1
psect	text502,local,class=CODE,delta=2
global __ptext502
__ptext502:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 89 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lwmod
;;		_readAvgDistance
;;		_ADCconvert
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text502
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	89
	global	__size_of_isr1
	__size_of_isr1	equ	__end_of_isr1-_isr1
	
_isr1:	
	opt	stack 1
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
psect	text502
	line	91
	
i1l7422:	
;Main.c: 91: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	btfss	(101/8),(101)&7
	goto	u310_21
	goto	u310_20
u310_21:
	goto	i1l7432
u310_20:
	
i1l7424:	
	movf	(26),w	;volatile
	movwf	(??_isr1+0)+0
	movf	(_rxiptr),w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	movf	(??_isr1+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
i1l7426:	
	movf	(_rxiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ser_tmp)^080h
	
i1l7428:	
	movf	(_ser_tmp)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_rxoptr),w	;volatile
	skipnz
	goto	u311_21
	goto	u311_20
u311_21:
	goto	i1l7432
u311_20:
	
i1l7430:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ser_tmp)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)	;volatile
	goto	i1l7432
	
i1l2175:	
	goto	i1l7432
	
i1l2174:	
	
i1l7432:	
	btfss	(100/8),(100)&7
	goto	u312_21
	goto	u312_20
u312_21:
	goto	i1l2176
u312_20:
	
i1l7434:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u313_21
	goto	u313_20
u313_21:
	goto	i1l2176
u313_20:
	
i1l7436:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_txoptr),w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(25)	;volatile
	
i1l7438:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	addwf	(_txoptr),f	;volatile
	
i1l7440:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr),f	;volatile
	
i1l7442:	
	movf	(_txoptr),w	;volatile
	xorwf	(_txiptr),w	;volatile
	skipz
	goto	u314_21
	goto	u314_20
u314_21:
	goto	i1l2176
u314_20:
	
i1l7444:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2176
	
i1l2177:	
	
i1l2176:	
	line	93
;Main.c: 93: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u315_21
	goto	u315_20
u315_21:
	goto	i1l2195
u315_20:
	line	95
	
i1l7446:	
;Main.c: 94: {
;Main.c: 95: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	96
	
i1l7448:	
;Main.c: 96: TMR0 = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	98
;Main.c: 98: RTC_Counter++;
	movlw	low(01h)
	addwf	(_RTC_Counter),f	;volatile
	skipnc
	incf	(_RTC_Counter+1),f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1),f	;volatile
	line	100
	
i1l7450:	
;Main.c: 100: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	101
	
i1l7452:	
;Main.c: 101: if(RTC_Counter % 10 == 0) RTC_FLAG_10MS = 1;
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
	goto	u316_21
	goto	u316_20
u316_21:
	goto	i1l7456
u316_20:
	
i1l7454:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l7456
	
i1l2179:	
	line	102
	
i1l7456:	
;Main.c: 102: if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
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
	goto	u317_21
	goto	u317_20
u317_21:
	goto	i1l7460
u317_20:
	
i1l7458:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l7460
	
i1l2180:	
	line	103
	
i1l7460:	
;Main.c: 103: if(RTC_Counter % 250 == 0)
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
	goto	u318_21
	goto	u318_20
u318_21:
	goto	i1l7466
u318_20:
	line	105
	
i1l7462:	
;Main.c: 104: {
;Main.c: 105: ADCconvert(readAvgDistance());
	fcall	_readAvgDistance
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_readAvgDistance)),w
	clrf	(?_ADCconvert+1)
	addwf	(?_ADCconvert+1)
	movf	(0+(?_readAvgDistance)),w
	clrf	(?_ADCconvert)
	addwf	(?_ADCconvert)

	fcall	_ADCconvert
	line	107
	
i1l7464:	
;Main.c: 107: RTC_FLAG_250MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l7466
	line	109
	
i1l2181:	
	line	110
	
i1l7466:	
;Main.c: 109: }
;Main.c: 110: if(RTC_Counter % 500 == 0)
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
	goto	u319_21
	goto	u319_20
u319_21:
	goto	i1l7474
u319_20:
	line	112
	
i1l7468:	
;Main.c: 111: {
;Main.c: 112: RTC_FLAG_500MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	113
	
i1l7470:	
;Main.c: 113: RTC_Counter = 0;
	clrf	(_RTC_Counter)	;volatile
	clrf	(_RTC_Counter+1)	;volatile
	line	114
	
i1l7472:	
;Main.c: 114: RB0 ^= 0x01;
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l7474
	line	115
	
i1l2182:	
	line	118
	
i1l7474:	
;Main.c: 115: }
;Main.c: 118: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u320_21
	goto	u320_20
u320_21:
	goto	i1l2183
u320_20:
	line	120
	
i1l7476:	
;Main.c: 119: {
;Main.c: 120: pb0DebounceCount++;
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pb0DebounceCount)^080h,f	;volatile
	line	121
	
i1l7478:	
;Main.c: 121: if(pb0DebounceCount >= 10 & pb0Released)
	movlw	(0Ah)
	subwf	(_pb0DebounceCount)^080h,w	;volatile
	skipc
	goto	u321_21
	goto	u321_20
u321_21:
	goto	i1l2185
u321_20:
	
i1l7480:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_pb0Released/8),(_pb0Released)&7
	goto	u322_21
	goto	u322_20
u322_21:
	goto	i1l2185
u322_20:
	line	123
	
i1l7482:	
;Main.c: 122: {
;Main.c: 123: pb0Pressed = 1;
	bsf	(_pb0Pressed/8),(_pb0Pressed)&7
	line	124
;Main.c: 124: pb0Released = 0;
	bcf	(_pb0Released/8),(_pb0Released)&7
	goto	i1l2185
	line	125
	
i1l2184:	
	line	126
;Main.c: 125: }
;Main.c: 126: }
	goto	i1l2185
	line	127
	
i1l2183:	
	line	129
;Main.c: 127: else
;Main.c: 128: {
;Main.c: 129: pb0DebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_pb0DebounceCount)^080h	;volatile
	line	130
;Main.c: 130: pb0Released = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_pb0Released/8),(_pb0Released)&7
	line	131
	
i1l2185:	
	line	134
;Main.c: 131: }
;Main.c: 134: if(!RB3)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(51/8),(51)&7
	goto	u323_21
	goto	u323_20
u323_21:
	goto	i1l2186
u323_20:
	line	136
	
i1l7484:	
;Main.c: 135: {
;Main.c: 136: pb1DebounceCount++;
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pb1DebounceCount)^080h,f	;volatile
	line	137
	
i1l7486:	
;Main.c: 137: if(pb1DebounceCount >= 10 & pb1Released)
	movlw	(0Ah)
	subwf	(_pb1DebounceCount)^080h,w	;volatile
	skipc
	goto	u324_21
	goto	u324_20
u324_21:
	goto	i1l2188
u324_20:
	
i1l7488:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_pb1Released/8),(_pb1Released)&7
	goto	u325_21
	goto	u325_20
u325_21:
	goto	i1l2188
u325_20:
	line	139
	
i1l7490:	
;Main.c: 138: {
;Main.c: 139: pb1Pressed = 1;
	bsf	(_pb1Pressed/8),(_pb1Pressed)&7
	line	140
;Main.c: 140: pb1Released = 0;
	bcf	(_pb1Released/8),(_pb1Released)&7
	goto	i1l2188
	line	141
	
i1l2187:	
	line	142
;Main.c: 141: }
;Main.c: 142: }
	goto	i1l2188
	line	143
	
i1l2186:	
	line	145
;Main.c: 143: else
;Main.c: 144: {
;Main.c: 145: pb1DebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_pb1DebounceCount)^080h	;volatile
	line	146
;Main.c: 146: pb1Released = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_pb1Released/8),(_pb1Released)&7
	line	147
	
i1l2188:	
	line	149
;Main.c: 147: }
;Main.c: 149: if(!RB4)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(52/8),(52)&7
	goto	u326_21
	goto	u326_20
u326_21:
	goto	i1l2189
u326_20:
	line	151
	
i1l7492:	
;Main.c: 150: {
;Main.c: 151: pb2DebounceCount++;
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pb2DebounceCount)^080h,f	;volatile
	line	152
	
i1l7494:	
;Main.c: 152: if(pb2DebounceCount >= 10 & pb2Released)
	movlw	(0Ah)
	subwf	(_pb2DebounceCount)^080h,w	;volatile
	skipc
	goto	u327_21
	goto	u327_20
u327_21:
	goto	i1l2191
u327_20:
	
i1l7496:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_pb2Released/8),(_pb2Released)&7
	goto	u328_21
	goto	u328_20
u328_21:
	goto	i1l2191
u328_20:
	line	154
	
i1l7498:	
;Main.c: 153: {
;Main.c: 154: pb2Pressed = 1;
	bsf	(_pb2Pressed/8),(_pb2Pressed)&7
	line	155
;Main.c: 155: pb2Released = 0;
	bcf	(_pb2Released/8),(_pb2Released)&7
	goto	i1l2191
	line	156
	
i1l2190:	
	line	157
;Main.c: 156: }
;Main.c: 157: }
	goto	i1l2191
	line	158
	
i1l2189:	
	line	160
;Main.c: 158: else
;Main.c: 159: {
;Main.c: 160: pb2DebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_pb2DebounceCount)^080h	;volatile
	line	161
;Main.c: 161: pb2Released = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_pb2Released/8),(_pb2Released)&7
	line	162
	
i1l2191:	
	line	164
;Main.c: 162: }
;Main.c: 164: if(!RB5)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(53/8),(53)&7
	goto	u329_21
	goto	u329_20
u329_21:
	goto	i1l2192
u329_20:
	line	166
	
i1l7500:	
;Main.c: 165: {
;Main.c: 166: pb3DebounceCount++;
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_pb3DebounceCount)^080h,f	;volatile
	line	167
	
i1l7502:	
;Main.c: 167: if(pb3DebounceCount >= 10 & pb3Released)
	movlw	(0Ah)
	subwf	(_pb3DebounceCount)^080h,w	;volatile
	skipc
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l2195
u330_20:
	
i1l7504:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_pb3Released/8),(_pb3Released)&7
	goto	u331_21
	goto	u331_20
u331_21:
	goto	i1l2195
u331_20:
	line	169
	
i1l7506:	
;Main.c: 168: {
;Main.c: 169: pb3Pressed = 1;
	bsf	(_pb3Pressed/8),(_pb3Pressed)&7
	line	170
;Main.c: 170: pb3Released = 0;
	bcf	(_pb3Released/8),(_pb3Released)&7
	goto	i1l2195
	line	171
	
i1l2193:	
	line	172
;Main.c: 171: }
;Main.c: 172: }
	goto	i1l2195
	line	173
	
i1l2192:	
	line	175
;Main.c: 173: else
;Main.c: 174: {
;Main.c: 175: pb3DebounceCount = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_pb3DebounceCount)^080h	;volatile
	line	176
;Main.c: 176: pb3Released = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_pb3Released/8),(_pb3Released)&7
	goto	i1l2195
	line	177
	
i1l2194:	
	goto	i1l2195
	line	178
	
i1l2178:	
	line	179
	
i1l2195:	
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
	global	_ADCconvert
psect	text503,local,class=CODE,delta=2
global __ptext503
__ptext503:

;; *************** function _ADCconvert *****************
;; Defined at:
;;		line 44 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;  adcVal          2   43[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  adcOutput      16   49[BANK0 ] unsigned char [16]
;;  distance        2   65[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0      18       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      24       0       0       0
;;Total ram usage:       24 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lwmod
;;		i1_lcd_write_control
;;		_sprintf
;;		_lcd_set_cursor
;;		_lcd_write_string
;; This function is called by:
;;		_isr1
;; This function uses a non-reentrant model
;;
psect	text503
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	44
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [allreg]
	line	45
	
i1l7532:	
;infrared.c: 45: char adcOutput[16] = "";
	movlw	(ADCconvert@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(ADCconvert@F1192)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADCconvert+0)+0
	movf	fsr0,w
	movwf	((??_ADCconvert+0)+0+1)
	movlw	16
	movwf	((??_ADCconvert+0)+0+2)
u335_20:
	movf	(??_ADCconvert+0)+0,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	
	movf	indf,w
	movwf	((??_ADCconvert+0)+0+3)
	incf	(??_ADCconvert+0)+0,f
	movf	((??_ADCconvert+0)+0+1),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	((??_ADCconvert+0)+0+3),w
	movwf	indf
	incf	((??_ADCconvert+0)+0+1),f
	decfsz	((??_ADCconvert+0)+0+2),f
	goto	u335_20
	line	47
	
i1l7534:	
;infrared.c: 46: unsigned int distance;
;infrared.c: 47: if (adcVal > 250)
	movlw	high(0FBh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0FBh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u336_21
	goto	u336_20
u336_21:
	goto	i1l7538
u336_20:
	line	49
	
i1l7536:	
;infrared.c: 48: {
;infrared.c: 49: distance = 20;
	movlw	low(014h)
	movwf	(ADCconvert@distance)
	movlw	high(014h)
	movwf	((ADCconvert@distance))+1
	line	50
;infrared.c: 50: }
	goto	i1l2920
	line	51
	
i1l2919:	
	
i1l7538:	
;infrared.c: 51: else if (adcVal < 250 && adcVal >= 190)
	movlw	high(0FAh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0FAh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u337_21
	goto	u337_20
u337_21:
	goto	i1l7544
u337_20:
	
i1l7540:	
	movlw	high(0BEh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0BEh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u338_21
	goto	u338_20
u338_21:
	goto	i1l7544
u338_20:
	line	53
	
i1l7542:	
;infrared.c: 52: {
;infrared.c: 53: distance = 20+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADCconvert@distance)
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(014h)
	movwf	1+(ADCconvert@distance)
	line	54
;infrared.c: 54: }
	goto	i1l2920
	line	55
	
i1l2921:	
	
i1l7544:	
;infrared.c: 55: else if (adcVal < 190 && adcVal >= 96)
	movlw	high(0BEh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0BEh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l7550
u339_20:
	
i1l7546:	
	movlw	high(060h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(060h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u340_21
	goto	u340_20
u340_21:
	goto	i1l7550
u340_20:
	line	57
	
i1l7548:	
;infrared.c: 56: {
;infrared.c: 57: distance = 30+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADCconvert@distance)
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(01Eh)
	movwf	1+(ADCconvert@distance)
	line	58
;infrared.c: 58: }
	goto	i1l2920
	line	59
	
i1l2923:	
	
i1l7550:	
;infrared.c: 59: else if (adcVal < 190 && adcVal >= 96)
	movlw	high(0BEh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0BEh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u341_21
	goto	u341_20
u341_21:
	goto	i1l7556
u341_20:
	
i1l7552:	
	movlw	high(060h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(060h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u342_21
	goto	u342_20
u342_21:
	goto	i1l7556
u342_20:
	line	61
	
i1l7554:	
;infrared.c: 60: {
;infrared.c: 61: distance = 40+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADCconvert@distance)
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(028h)
	movwf	1+(ADCconvert@distance)
	line	62
;infrared.c: 62: }
	goto	i1l2920
	line	63
	
i1l2925:	
	
i1l7556:	
;infrared.c: 63: else if (adcVal < 115 && adcVal >= 96)
	movlw	high(073h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(073h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u343_21
	goto	u343_20
u343_21:
	goto	i1l7562
u343_20:
	
i1l7558:	
	movlw	high(060h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(060h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l7562
u344_20:
	line	65
	
i1l7560:	
;infrared.c: 64: {
;infrared.c: 65: distance = 50+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADCconvert@distance)
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(032h)
	movwf	1+(ADCconvert@distance)
	line	66
;infrared.c: 66: }
	goto	i1l2920
	line	67
	
i1l2927:	
	
i1l7562:	
;infrared.c: 67: else if (adcVal < 96 && adcVal >= 82)
	movlw	high(060h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(060h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u345_21
	goto	u345_20
u345_21:
	goto	i1l7568
u345_20:
	
i1l7564:	
	movlw	high(052h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(052h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u346_21
	goto	u346_20
u346_21:
	goto	i1l7568
u346_20:
	line	69
	
i1l7566:	
;infrared.c: 68: {
;infrared.c: 69: distance = 60+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADCconvert@distance)
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(03Ch)
	movwf	1+(ADCconvert@distance)
	line	70
;infrared.c: 70: }
	goto	i1l2920
	line	71
	
i1l2929:	
	
i1l7568:	
;infrared.c: 71: else if (adcVal < 82 && adcVal >= 70)
	movlw	high(052h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(052h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u347_21
	goto	u347_20
u347_21:
	goto	i1l7574
u347_20:
	
i1l7570:	
	movlw	high(046h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(046h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l7574
u348_20:
	line	73
	
i1l7572:	
;infrared.c: 72: {
;infrared.c: 73: distance = 70+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(046h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADCconvert@distance)
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(046h)
	movwf	1+(ADCconvert@distance)
	line	74
;infrared.c: 74: }
	goto	i1l2920
	line	75
	
i1l2931:	
	
i1l7574:	
;infrared.c: 75: else if (adcVal < 70 && adcVal >= 64)
	movlw	high(046h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(046h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u349_21
	goto	u349_20
u349_21:
	goto	i1l7580
u349_20:
	
i1l7576:	
	movlw	high(040h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(040h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l7580
u350_20:
	line	77
	
i1l7578:	
;infrared.c: 76: {
;infrared.c: 77: distance = 80+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(050h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADCconvert@distance)
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(050h)
	movwf	1+(ADCconvert@distance)
	line	78
;infrared.c: 78: }
	goto	i1l2920
	line	79
	
i1l2933:	
	
i1l7580:	
;infrared.c: 79: else if (adcVal < 64 && adcVal >= 56)
	movlw	high(040h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(040h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u351_21
	goto	u351_20
u351_21:
	goto	i1l7586
u351_20:
	
i1l7582:	
	movlw	high(038h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(038h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l7586
u352_20:
	line	81
	
i1l7584:	
;infrared.c: 80: {
;infrared.c: 81: distance = 90+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(05Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADCconvert@distance)
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(05Ah)
	movwf	1+(ADCconvert@distance)
	line	82
;infrared.c: 82: }
	goto	i1l2920
	line	83
	
i1l2935:	
	
i1l7586:	
;infrared.c: 83: else if (adcVal < 56 && adcVal >= 45)
	movlw	high(038h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(038h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u353_21
	goto	u353_20
u353_21:
	goto	i1l7592
u353_20:
	
i1l7588:	
	movlw	high(02Dh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(02Dh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l7592
u354_20:
	line	85
	
i1l7590:	
;infrared.c: 84: {
;infrared.c: 85: distance = 100+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADCconvert@distance)
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(064h)
	movwf	1+(ADCconvert@distance)
	line	86
;infrared.c: 86: }
	goto	i1l2920
	line	87
	
i1l2937:	
	
i1l7592:	
;infrared.c: 87: else if (adcVal < 45 && adcVal >= 40)
	movlw	high(02Dh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(02Dh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l7598
u355_20:
	
i1l7594:	
	movlw	high(028h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(028h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u356_21
	goto	u356_20
u356_21:
	goto	i1l7598
u356_20:
	line	89
	
i1l7596:	
;infrared.c: 88: {
;infrared.c: 89: distance = 110+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(06Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADCconvert@distance)
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(06Eh)
	movwf	1+(ADCconvert@distance)
	line	90
;infrared.c: 90: }
	goto	i1l2920
	line	91
	
i1l2939:	
	
i1l7598:	
;infrared.c: 91: else if (adcVal < 40 && adcVal >= 33)
	movlw	high(028h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(028h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u357_21
	goto	u357_20
u357_21:
	goto	i1l7604
u357_20:
	
i1l7600:	
	movlw	high(021h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(021h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u358_21
	goto	u358_20
u358_21:
	goto	i1l7604
u358_20:
	line	93
	
i1l7602:	
;infrared.c: 92: {
;infrared.c: 93: distance = 120+ (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(078h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADCconvert@distance)
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(078h)
	movwf	1+(ADCconvert@distance)
	line	94
;infrared.c: 94: }
	goto	i1l2920
	line	95
	
i1l2941:	
	
i1l7604:	
;infrared.c: 95: else if (adcVal < 33 )
	movlw	high(021h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(021h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u359_21
	goto	u359_20
u359_21:
	goto	i1l2920
u359_20:
	line	97
	
i1l7606:	
;infrared.c: 96: {
;infrared.c: 97: distance = 130 + (adcVal%100) ;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	low(082h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(ADCconvert@distance)
	movf	(1+(?___lwmod)),w
	skipnc
	addlw	1
	addlw	high(082h)
	movwf	1+(ADCconvert@distance)
	goto	i1l2920
	line	98
	
i1l2943:	
	goto	i1l2920
	line	102
	
i1l2942:	
	goto	i1l2920
	
i1l2940:	
	goto	i1l2920
	
i1l2938:	
	goto	i1l2920
	
i1l2936:	
	goto	i1l2920
	
i1l2934:	
	goto	i1l2920
	
i1l2932:	
	goto	i1l2920
	
i1l2930:	
	goto	i1l2920
	
i1l2928:	
	goto	i1l2920
	
i1l2926:	
	goto	i1l2920
	
i1l2924:	
	goto	i1l2920
	
i1l2922:	
	
i1l2920:	
;infrared.c: 98: }
;infrared.c: 102: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	i1_lcd_write_control
	line	103
	
i1l7608:	
;infrared.c: 103: sprintf(adcOutput,"Distance: %dcm", distance);
	movlw	((STR_3-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADCconvert+0)+0
	movf	(??_ADCconvert+0)+0,w
	movwf	(?_sprintf)
	movf	(ADCconvert@distance+1),w
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	movf	(ADCconvert@distance),w
	clrf	0+(?_sprintf)+01h
	addwf	0+(?_sprintf)+01h

	movlw	(ADCconvert@adcOutput)&0ffh
	fcall	_sprintf
	line	104
	
i1l7610:	
;infrared.c: 104: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	106
	
i1l7612:	
;infrared.c: 106: lcd_write_string(adcOutput);
	movlw	(ADCconvert@adcOutput)&0ffh
	fcall	_lcd_write_string
	line	107
	
i1l2944:	
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,4216
	global	_readAvgDistance
psect	text504,local,class=CODE,delta=2
global __ptext504
__ptext504:

;; *************** function _readAvgDistance *****************
;; Defined at:
;;		line 10 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   41[BANK0 ] int 
;;  adcOutput      16   21[BANK0 ] unsigned char [16]
;;  averageval      2   39[BANK0 ] unsigned int 
;;  fullval         2   37[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   15[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0      22       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      28       0       0       0
;;Total ram usage:       28 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_adc_read_channel
;;		___lwdiv
;;		_sprintf
;; This function is called by:
;;		_isr1
;; This function uses a non-reentrant model
;;
psect	text504
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	10
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 1
; Regs used in _readAvgDistance: [allreg]
	line	11
	
i1l7508:	
;infrared.c: 11: unsigned int fullval = 0, averageval;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(readAvgDistance@fullval)
	clrf	(readAvgDistance@fullval+1)
	line	12
	
i1l7510:	
;infrared.c: 12: char adcOutput[16] = "";
	movlw	(readAvgDistance@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(readAvgDistance@F1184)
	movwf	(??_readAvgDistance+0)+0
	movf	fsr0,w
	movwf	((??_readAvgDistance+0)+0+1)
	movlw	16
	movwf	((??_readAvgDistance+0)+0+2)
u332_20:
	movf	(??_readAvgDistance+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	
	movf	indf,w
	movwf	((??_readAvgDistance+0)+0+3)
	incf	(??_readAvgDistance+0)+0,f
	movf	((??_readAvgDistance+0)+0+1),w
	movwf	fsr0
	
	movf	((??_readAvgDistance+0)+0+3),w
	movwf	indf
	incf	((??_readAvgDistance+0)+0+1),f
	decfsz	((??_readAvgDistance+0)+0+2),f
	goto	u332_20
	line	14
	
i1l7512:	
;infrared.c: 14: for (int i = 0; i < 10; i++)
	clrf	(readAvgDistance@i)
	clrf	(readAvgDistance@i+1)
	
i1l7514:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u333_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u333_25:

	skipc
	goto	u333_21
	goto	u333_20
u333_21:
	goto	i1l7518
u333_20:
	goto	i1l7524
	
i1l7516:	
	goto	i1l7524
	line	15
	
i1l2907:	
	line	16
	
i1l7518:	
;infrared.c: 15: {
;infrared.c: 16: fullval += adc_read_channel(0);
	movlw	(0)
	fcall	_adc_read_channel
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_readAvgDistance+0)+0
	clrf	(??_readAvgDistance+0)+0+1
	movf	0+(??_readAvgDistance+0)+0,w
	addwf	(readAvgDistance@fullval),f
	skipnc
	incf	(readAvgDistance@fullval+1),f
	movf	1+(??_readAvgDistance+0)+0,w
	addwf	(readAvgDistance@fullval+1),f
	line	14
	
i1l7520:	
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
i1l7522:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u334_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u334_25:

	skipc
	goto	u334_21
	goto	u334_20
u334_21:
	goto	i1l7518
u334_20:
	goto	i1l7524
	
i1l2908:	
	line	19
	
i1l7524:	
;infrared.c: 18: }
;infrared.c: 19: averageval = fullval / 10;
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
	clrf	(readAvgDistance@averageval+1)
	addwf	(readAvgDistance@averageval+1)
	movf	(0+(?___lwdiv)),w
	clrf	(readAvgDistance@averageval)
	addwf	(readAvgDistance@averageval)

	line	20
	
i1l7526:	
;infrared.c: 20: sprintf(adcOutput,"Adc Value: %d", averageval);
	movlw	((STR_1-__stringbase))&0ffh
	movwf	(??_readAvgDistance+0)+0
	movf	(??_readAvgDistance+0)+0,w
	movwf	(?_sprintf)
	movf	(readAvgDistance@averageval+1),w
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	movf	(readAvgDistance@averageval),w
	clrf	0+(?_sprintf)+01h
	addwf	0+(?_sprintf)+01h

	movlw	(readAvgDistance@adcOutput)&0ffh
	fcall	_sprintf
	line	24
	
i1l7528:	
;infrared.c: 24: return averageval;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(readAvgDistance@averageval+1),w
	clrf	(?_readAvgDistance+1)
	addwf	(?_readAvgDistance+1)
	movf	(readAvgDistance@averageval),w
	clrf	(?_readAvgDistance)
	addwf	(?_readAvgDistance)

	goto	i1l2909
	
i1l7530:	
	line	25
	
i1l2909:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,90
	global	_lcd_write_string
psect	text505,local,class=CODE,delta=2
global __ptext505
__ptext505:

;; *************** function _lcd_write_string *****************
;; Defined at:
;;		line 48 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR unsigned char 
;;		 -> ADCconvert@adcOutput(16), readDistance@adcOutput(16), 
;; Auto vars:     Size  Location     Type
;;  s               1    4[COMMON] PTR unsigned char 
;;		 -> ADCconvert@adcOutput(16), readDistance@adcOutput(16), 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_write_data
;; This function is called by:
;;		_ADCconvert
;;		_readDistance
;; This function uses a non-reentrant model
;;
psect	text505
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 1
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_write_string@s stored from wreg
	movwf	(lcd_write_string@s)
	line	50
	
i1l7388:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	i1l7394
	
i1l1403:	
	
i1l7390:	
	movf	(lcd_write_string@s),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_write_data
	
i1l7392:	
	movlw	(01h)
	movwf	(??_lcd_write_string+0)+0
	movf	(??_lcd_write_string+0)+0,w
	addwf	(lcd_write_string@s),f
	goto	i1l7394
	
i1l1402:	
	
i1l7394:	
	movf	(lcd_write_string@s),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,f
	skipz
	goto	u306_21
	goto	u306_20
u306_21:
	goto	i1l7390
u306_20:
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
psect	text506,local,class=CODE,delta=2
global __ptext506
__ptext506:

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
;;		_ADCconvert
;;		_readDistance
;; This function uses a non-reentrant model
;;
psect	text506
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
	
i1l7384:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
i1l7386:	
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
psect	text507,local,class=CODE,delta=2
global __ptext507
__ptext507:

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
;;		_ADCconvert
;; This function uses a non-reentrant model
;;
psect	text507
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
	
i1l7898:	
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
	
i1l7900:	
;lcd.c: 22: PORTD = databyte;
	movf	(i1lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
i1l7902:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
i1l7904:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??i1_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??i1_lcd_write_control+0)+0),f
u431_27:
	decfsz	((??i1_lcd_write_control+0)+0),f
	goto	u431_27
	decfsz	((??i1_lcd_write_control+0)+0+1),f
	goto	u431_27
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
psect	text508,local,class=CODE,delta=2
global __ptext508
__ptext508:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> ADCconvert@adcOutput(16), readDistance@adcOutput(16), readAvgDistance@adcOutput(16), 
;;  f               1    0[BANK0 ] PTR const unsigned char 
;;		 -> STR_3(15), STR_2(14), STR_1(14), 
;; Auto vars:     Size  Location     Type
;;  sp              1   13[BANK0 ] PTR unsigned char 
;;		 -> ADCconvert@adcOutput(16), readDistance@adcOutput(16), readAvgDistance@adcOutput(16), 
;;  _val            4    9[BANK0 ] struct .
;;  c               1   14[BANK0 ] char 
;;  prec            1    8[BANK0 ] char 
;;  flag            1    7[BANK0 ] unsigned char 
;;  ap              1    6[BANK0 ] PTR void [1]
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
;;      Params:         0       3       0       0       0
;;      Locals:         0       9       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_readAvgDistance
;;		_ADCconvert
;;		_readDistance
;; This function uses a non-reentrant model
;;
psect	text508
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
	
i1l7652:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	i1l7704
	
i1l4405:	
	line	542
	
i1l7654:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u361_21
	goto	u361_20
u361_21:
	goto	i1l4406
u361_20:
	line	545
	
i1l7656:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l7658:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	i1l7704
	line	547
	
i1l4406:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	i1l7662
	line	640
	
i1l4408:	
	line	641
	goto	i1l7706
	line	700
	
i1l4410:	
	goto	i1l7664
	line	701
	
i1l4411:	
	line	702
	goto	i1l7664
	line	805
	
i1l4413:	
	line	816
	goto	i1l7704
	line	825
	
i1l7660:	
	goto	i1l7664
	line	638
	
i1l4407:	
	
i1l7662:	
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
	goto	i1l7706
	xorlw	100^0	; case 100
	skipnz
	goto	i1l7664
	xorlw	105^100	; case 105
	skipnz
	goto	i1l7664
	goto	i1l7704
	opt asmopt_on

	line	825
	
i1l4412:	
	line	1254
	
i1l7664:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
i1l7666:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
i1l7668:	
	btfss	(sprintf@_val+1),7
	goto	u362_21
	goto	u362_20
u362_21:
	goto	i1l7674
u362_20:
	line	1257
	
i1l7670:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
i1l7672:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	i1l7674
	line	1259
	
i1l4414:	
	line	1300
	
i1l7674:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
i1l7676:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u363_21
	goto	u363_20
u363_21:
	goto	i1l7680
u363_20:
	goto	i1l7688
	
i1l7678:	
	goto	i1l7688
	line	1301
	
i1l4415:	
	
i1l7680:	
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
	goto	u364_25
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u364_25:
	skipnc
	goto	u364_21
	goto	u364_20
u364_21:
	goto	i1l7684
u364_20:
	goto	i1l7688
	line	1302
	
i1l7682:	
	goto	i1l7688
	
i1l4417:	
	line	1300
	
i1l7684:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
i1l7686:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u365_21
	goto	u365_20
u365_21:
	goto	i1l7680
u365_20:
	goto	i1l7688
	
i1l4416:	
	line	1433
	
i1l7688:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u366_21
	goto	u366_20
u366_21:
	goto	i1l7694
u366_20:
	line	1434
	
i1l7690:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l7692:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l7694
	
i1l4418:	
	line	1467
	
i1l7694:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	i1l7702
	
i1l4420:	
	line	1484
	
i1l7696:	
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
	
i1l7698:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l7700:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l7702
	line	1517
	
i1l4419:	
	line	1469
	
i1l7702:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u367_21
	goto	u367_20
u367_21:
	goto	i1l7696
u367_20:
	goto	i1l7704
	
i1l4421:	
	goto	i1l7704
	line	1525
	
i1l4404:	
	line	540
	
i1l7704:	
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
	goto	u368_21
	goto	u368_20
u368_21:
	goto	i1l7654
u368_20:
	goto	i1l7706
	
i1l4422:	
	goto	i1l7706
	line	1527
	
i1l4409:	
	line	1530
	
i1l7706:	
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	i1l4423
	line	1532
	
i1l7708:	
	line	1533
;	Return value of _sprintf is never used
	
i1l4423:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_lcd_write_data
psect	text509,local,class=CODE,delta=2
global __ptext509
__ptext509:

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
psect	text509
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
	
i1l7376:	
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
	
i1l7378:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
i1l7380:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
i1l7382:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u432_27:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u432_27
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u432_27
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
psect	text510,local,class=CODE,delta=2
global __ptext510
__ptext510:

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
;;		_readAvgDistance
;;		_readDistance
;; This function uses a non-reentrant model
;;
psect	text510
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	5
	global	__size_of_adc_read_channel
	__size_of_adc_read_channel	equ	__end_of_adc_read_channel-_adc_read_channel
	
_adc_read_channel:	
	opt	stack 1
; Regs used in _adc_read_channel: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;adc_read_channel@channel stored from wreg
	movwf	(adc_read_channel@channel)
	line	6
	
i1l7350:	
;adc.c: 6: switch(channel)
	goto	i1l7358
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
	goto	i1l7360
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
	goto	i1l7360
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
	goto	i1l7360
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
	goto	i1l7360
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
	goto	i1l7360
	line	35
;adc.c: 35: default:
	
i1l696:	
	line	36
	
i1l7352:	
;adc.c: 36: return 0;
	movlw	(0)
	goto	i1l697
	
i1l7354:	
	goto	i1l697
	line	37
	
i1l7356:	
;adc.c: 37: }
	goto	i1l7360
	line	6
	
i1l689:	
	
i1l7358:	
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
	goto	i1l7352
	opt asmopt_on

	line	37
	
i1l691:	
	line	39
	
i1l7360:	
;adc.c: 39: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u433_27:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u433_27
opt asmopt_on

	line	41
	
i1l7362:	
;adc.c: 41: return adc_read();
	fcall	_adc_read
	movf	(0+(?_adc_read)),w
	goto	i1l697
	
i1l7364:	
	line	43
	
i1l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___lwmod
psect	text511,local,class=CODE,delta=2
global __ptext511
__ptext511:

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
psect	text511
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l7876:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u389_21
	goto	u389_20
u389_21:
	goto	i1l7894
u389_20:
	line	9
	
i1l7878:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	i1l7884
	
i1l5124:	
	line	11
	
i1l7880:	
	movlw	01h
	
u390_25:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u390_25
	line	12
	
i1l7882:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	i1l7884
	line	13
	
i1l5123:	
	line	10
	
i1l7884:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u391_21
	goto	u391_20
u391_21:
	goto	i1l7880
u391_20:
	goto	i1l7886
	
i1l5125:	
	goto	i1l7886
	line	14
	
i1l5126:	
	line	15
	
i1l7886:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u392_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u392_25:
	skipc
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l7890
u392_20:
	line	16
	
i1l7888:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	i1l7890
	
i1l5127:	
	line	17
	
i1l7890:	
	movlw	01h
	
u393_25:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u393_25
	line	18
	
i1l7892:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u394_21
	goto	u394_20
u394_21:
	goto	i1l7886
u394_20:
	goto	i1l7894
	
i1l5128:	
	goto	i1l7894
	line	19
	
i1l5122:	
	line	20
	
i1l7894:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	i1l5129
	
i1l7896:	
	line	21
	
i1l5129:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text512,local,class=CODE,delta=2
global __ptext512
__ptext512:

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
psect	text512
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
i1l7850:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
i1l7852:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u382_21
	goto	u382_20
u382_21:
	goto	i1l7872
u382_20:
	line	11
	
i1l7854:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	i1l7860
	
i1l5114:	
	line	13
	
i1l7856:	
	movlw	01h
	
u383_25:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u383_25
	line	14
	
i1l7858:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	i1l7860
	line	15
	
i1l5113:	
	line	12
	
i1l7860:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u384_21
	goto	u384_20
u384_21:
	goto	i1l7856
u384_20:
	goto	i1l7862
	
i1l5115:	
	goto	i1l7862
	line	16
	
i1l5116:	
	line	17
	
i1l7862:	
	movlw	01h
	
u385_25:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u385_25
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u386_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u386_25:
	skipc
	goto	u386_21
	goto	u386_20
u386_21:
	goto	i1l7868
u386_20:
	line	19
	
i1l7864:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
i1l7866:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l7868
	line	21
	
i1l5117:	
	line	22
	
i1l7868:	
	movlw	01h
	
u387_25:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u387_25
	line	23
	
i1l7870:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u388_21
	goto	u388_20
u388_21:
	goto	i1l7862
u388_20:
	goto	i1l7872
	
i1l5118:	
	goto	i1l7872
	line	24
	
i1l5112:	
	line	25
	
i1l7872:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	i1l5119
	
i1l7874:	
	line	26
	
i1l5119:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_adc_read
psect	text513,local,class=CODE,delta=2
global __ptext513
__ptext513:

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
psect	text513
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 1
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	64
	
i1l7366:	
;adc.c: 62: volatile unsigned int adc_value;
;adc.c: 64: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	66
	
i1l7368:	
;adc.c: 66: GO = 1;
	bsf	(250/8),(250)&7
	line	67
;adc.c: 67: while(GO) continue;
	goto	i1l703
	
i1l704:	
	
i1l703:	
	btfsc	(250/8),(250)&7
	goto	u304_21
	goto	u304_20
u304_21:
	goto	i1l703
u304_20:
	
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
psect	text513
	line	73
	
i1l7370:	
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
	
u305_25:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u305_25
	line	75
;adc.c: 75: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	78
	
i1l7372:	
;adc.c: 78: return (adc_value);
	movf	(adc_read@adc_value+1),w	;volatile
	clrf	(?_adc_read+1)
	addwf	(?_adc_read+1)
	movf	(adc_read@adc_value),w	;volatile
	clrf	(?_adc_read)
	addwf	(?_adc_read)

	goto	i1l706
	
i1l7374:	
	line	79
	
i1l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
psect	text514,local,class=CODE,delta=2
global __ptext514
__ptext514:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
