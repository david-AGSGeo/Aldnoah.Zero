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
# 29 "E:\Mechatronics 2\Assignment2\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 29 "E:\Mechatronics 2\Assignment2\Main.c"
	dw 0xFFFE & 0xFFFB & 0xFFFF & 0xFFBF & 0xFFF7 & 0xFFFF & 0xFF7F & 0xFFFF ;#
	FNCALL	_main,_init
	FNCALL	_main,_rotate
	FNCALL	_init,_init_adc
	FNCALL	_init,_lcd_init
	FNCALL	_lcd_init,_lcd_write_control
	FNROOT	_main
	FNCALL	_isr1,___lwmod
	FNCALL	_isr1,_readAvgDistance
	FNCALL	_isr1,_ADCconvert
	FNCALL	_ADCconvert,___lwmod
	FNCALL	_ADCconvert,_sprintf
	FNCALL	_ADCconvert,_lcd_set_cursor
	FNCALL	_ADCconvert,_lcd_write_string
	FNCALL	_readAvgDistance,_adc_read_channel
	FNCALL	_readAvgDistance,___lwdiv
	FNCALL	_readAvgDistance,_sprintf
	FNCALL	_readAvgDistance,_lcd_set_cursor
	FNCALL	_readAvgDistance,i1_lcd_write_control
	FNCALL	_readAvgDistance,_lcd_write_string
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
	file	"E:\Mechatronics 2\Assignment2\Main.c"
	line	70

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
	global	_pb0DebounceCount
	global	_pb1DebounceCount
	global	_pb2DebounceCount
	global	_pb3DebounceCount
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
	global	ADCconvert@F1220
	global	readAvgDistance@F1216
	global	readDistance@F1211
	global	_current_direction
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
	global	_TMR0
_TMR0	set	1
	global	_CARRY
_CARRY	set	24
	global	_CHS0
_CHS0	set	251
	global	_CHS1
_CHS1	set	252
	global	_CHS2
_CHS2	set	253
	global	_GIE
_GIE	set	95
	global	_GO
_GO	set	250
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
	global	_RE0
_RE0	set	72
	global	_RE1
_RE1	set	73
	global	_RE2
_RE2	set	74
	global	_TMR0IE
_TMR0IE	set	93
	global	_TMR0IF
_TMR0IF	set	90
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_OPTION_REG
_OPTION_REG	set	129
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
	file	"Assignment2_11055579.as"
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

_pb0DebounceCount:
       ds      1

_pb1DebounceCount:
       ds      1

_pb2DebounceCount:
       ds      1

_pb3DebounceCount:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
ADCconvert@F1220:
       ds      16

readAvgDistance@F1216:
       ds      16

readDistance@F1211:
       ds      16

_current_direction:
       ds      1

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"E:\Mechatronics 2\Assignment2\Main.c"
	line	70
_current_step:
       ds      1

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
	movlw	low((__pbssBANK1)+031h)
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
	global	??_init_adc
??_init_adc:	; 0 bytes @ 0x0
	global	??_lcd_write_control
??_lcd_write_control:	; 0 bytes @ 0x0
	global	?_rotate
?_rotate:	; 0 bytes @ 0x0
	global	rotate@direction
rotate@direction:	; 1 bytes @ 0x0
	ds	1
	global	??_rotate
??_rotate:	; 0 bytes @ 0x1
	ds	1
	global	lcd_write_control@databyte
lcd_write_control@databyte:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	??_init
??_init:	; 0 bytes @ 0x3
	global	rotate@steps
rotate@steps:	; 1 bytes @ 0x3
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	1
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init_adc
?_init_adc:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_lcd_write_control
?_lcd_write_control:	; 0 bytes @ 0x0
	global	?_lcd_set_cursor
?_lcd_set_cursor:	; 0 bytes @ 0x0
	global	?_lcd_write_string
?_lcd_write_string:	; 0 bytes @ 0x0
	global	?_isr1
?_isr1:	; 0 bytes @ 0x0
	global	?_init
?_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_write_data
?_lcd_write_data:	; 0 bytes @ 0x0
	global	??_lcd_write_data
??_lcd_write_data:	; 0 bytes @ 0x0
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
;;Data sizes: Strings 29, constant 10, data 1, bss 55, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     72      80
;; BANK1           80      5      55
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_adc_read	unsigned int  size(1) Largest target is 0
;;
;; ?_readAvgDistance	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; sprintf@f	PTR const unsigned char  size(1) Largest target is 15
;;		 -> STR_3(CODE[15]), STR_2(CODE[14]), STR_1(CODE[14]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;;		 -> ADCconvert@adcOutput(BANK0[16]), readAvgDistance@adcOutput(BANK0[16]), readDistance@adcOutput(BANK0[16]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK0[2]), 
;;
;; S3018$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; lcd_write_string@s	PTR unsigned char  size(1) Largest target is 16
;;		 -> ADCconvert@adcOutput(BANK0[16]), readAvgDistance@adcOutput(BANK0[16]), readDistance@adcOutput(BANK0[16]), 
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
;;   _main->_rotate
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0     111
;;                                              4 BANK1      1     1      0
;;                               _init
;;                             _rotate
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0      22
;;                           _init_adc
;;                           _lcd_init
;; ---------------------------------------------------------------------------------
;; (2) _lcd_init                                             0     0      0      22
;;                  _lcd_write_control
;; ---------------------------------------------------------------------------------
;; (3) _lcd_write_control                                    3     3      0      22
;;                                              0 BANK1      3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _rotate                                               4     3      1      89
;;                                              0 BANK1      4     3      1
;; ---------------------------------------------------------------------------------
;; (2) _init_adc                                             1     1      0       0
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _isr1                                                 5     5      0    3573
;;                                             67 BANK0      5     5      0
;;                            ___lwmod
;;                    _readAvgDistance
;;                         _ADCconvert
;; ---------------------------------------------------------------------------------
;; (5) _ADCconvert                                          24    22      2    2002
;;                                             43 BANK0     24    22      2
;;                            ___lwmod
;;                            _sprintf
;;                     _lcd_set_cursor
;;                   _lcd_write_string
;;                    _readAvgDistance (ARG)
;; ---------------------------------------------------------------------------------
;; (5) _readAvgDistance                                     28    26      2    1412
;;                                             15 BANK0     28    26      2
;;                   _adc_read_channel
;;                            ___lwdiv
;;                            _sprintf
;;                     _lcd_set_cursor
;;                i1_lcd_write_control
;;                   _lcd_write_string
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
;; (7) _lcd_write_data                                       3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (6) _sprintf                                             15    12      3     798
;;                                              0 BANK0     15    12      3
;;                            ___lwdiv
;;                            ___lwmod
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
;;   _rotate
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
;;     _lcd_set_cursor
;;       i1_lcd_write_control
;;     i1_lcd_write_control
;;     _lcd_write_string
;;       _lcd_write_data
;;   _ADCconvert
;;     ___lwmod
;;       ___lwdiv (ARG)
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
;;       _lcd_set_cursor
;;         i1_lcd_write_control
;;       i1_lcd_write_control
;;       _lcd_write_string
;;         _lcd_write_data
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
;;BANK1               50      5      37       7       68.8%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      A0      12        0.0%
;;ABS                  0      0      95       3        0.0%
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
;;		line 385 in file "E:\Mechatronics 2\Assignment2\Main.c"
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
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_init
;;		_rotate
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Mechatronics 2\Assignment2\Main.c"
	line	385
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	390
	
l5478:	
;Main.c: 390: init();
	fcall	_init
	line	392
	
l5480:	
;Main.c: 392: rotate(8, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotate)^080h
	movlw	(08h)
	fcall	_rotate
	goto	l5482
	line	395
;Main.c: 395: while(1)
	
l843:	
	line	397
	
l5482:	
;Main.c: 396: {
;Main.c: 397: if(pb0Pressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_pb0Pressed/8),(_pb0Pressed)&7
	goto	u3671
	goto	u3670
u3671:
	goto	l5488
u3670:
	line	399
	
l5484:	
;Main.c: 398: {
;Main.c: 399: pb0Pressed = 0;
	bcf	(_pb0Pressed/8),(_pb0Pressed)&7
	line	402
	
l5486:	
;Main.c: 402: RB1 ^= 0x01;
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	goto	l5488
	line	405
	
l844:	
	line	407
	
l5488:	
;Main.c: 405: }
;Main.c: 407: if(pb1Pressed)
	btfss	(_pb1Pressed/8),(_pb1Pressed)&7
	goto	u3681
	goto	u3680
u3681:
	goto	l5494
u3680:
	line	409
	
l5490:	
;Main.c: 408: {
;Main.c: 409: pb1Pressed = 0;
	bcf	(_pb1Pressed/8),(_pb1Pressed)&7
	line	411
	
l5492:	
;Main.c: 411: rotate(2, 1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotate)^080h
	bsf	status,0
	rlf	(?_rotate)^080h,f
	movlw	(02h)
	fcall	_rotate
	goto	l5494
	line	412
	
l845:	
	line	414
	
l5494:	
;Main.c: 412: }
;Main.c: 414: if(pb2Pressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_pb2Pressed/8),(_pb2Pressed)&7
	goto	u3691
	goto	u3690
u3691:
	goto	l5500
u3690:
	line	416
	
l5496:	
;Main.c: 415: {
;Main.c: 416: pb2Pressed = 0;
	bcf	(_pb2Pressed/8),(_pb2Pressed)&7
	line	418
	
l5498:	
;Main.c: 418: rotate(2, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotate)^080h
	movlw	(02h)
	fcall	_rotate
	goto	l5500
	line	419
	
l846:	
	line	421
	
l5500:	
;Main.c: 419: }
;Main.c: 421: if(pb3Pressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_pb3Pressed/8),(_pb3Pressed)&7
	goto	u3701
	goto	u3700
u3701:
	goto	l5482
u3700:
	line	423
	
l5502:	
;Main.c: 422: {
;Main.c: 423: pb3Pressed = 0;
	bcf	(_pb3Pressed/8),(_pb3Pressed)&7
	line	425
	
l5504:	
;Main.c: 425: rotate(200, current_direction);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_direction)^080h,w
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(?_rotate)^080h
	movlw	(0C8h)
	fcall	_rotate
	line	426
	
l5506:	
;Main.c: 426: current_direction ^= 0x01;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	xorwf	(_current_direction)^080h,f
	goto	l5482
	line	427
	
l847:	
	goto	l5482
	line	428
	
l848:	
	line	395
	goto	l5482
	
l849:	
	line	429
	
l850:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_init
psect	text457,local,class=CODE,delta=2
global __ptext457
__ptext457:

;; *************** function _init *****************
;; Defined at:
;;		line 195 in file "E:\Mechatronics 2\Assignment2\Main.c"
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
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text457
	file	"E:\Mechatronics 2\Assignment2\Main.c"
	line	195
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 1
; Regs used in _init: [wreg+status,2+status,0+pclath+cstack]
	line	196
	
l5466:	
;Main.c: 196: init_adc();
	fcall	_init_adc
	line	197
;Main.c: 197: lcd_init();
	fcall	_lcd_init
	line	199
	
l5468:	
;Main.c: 199: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	202
	
l5470:	
;Main.c: 202: TRISC = 0x00;
	clrf	(135)^080h	;volatile
	line	205
	
l5472:	
;Main.c: 205: OPTION_REG = 0b00000100;
	movlw	(04h)
	movwf	(129)^080h	;volatile
	line	208
	
l5474:	
;Main.c: 208: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	211
	
l5476:	
;Main.c: 211: (GIE = 1);
	bsf	(95/8),(95)&7
	line	212
	
l767:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_lcd_init
psect	text458,local,class=CODE,delta=2
global __ptext458
__ptext458:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 101 in file "E:\Mechatronics 2\Assignment2\lcd.c"
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
psect	text458
	file	"E:\Mechatronics 2\Assignment2\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 1
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l5446:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l5448:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l5450:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l5452:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l5454:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l5456:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l5458:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l5460:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l5462:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l5464:	
;lcd.c: 119: lcd_write_control(0b00000010);
	movlw	(02h)
	fcall	_lcd_write_control
	line	121
	
l2273:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_write_control
psect	text459,local,class=CODE,delta=2
global __ptext459
__ptext459:

;; *************** function _lcd_write_control *****************
;; Defined at:
;;		line 18 in file "E:\Mechatronics 2\Assignment2\lcd.c"
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
;;		_readDistance
;; This function uses a non-reentrant model
;;
psect	text459
	file	"E:\Mechatronics 2\Assignment2\lcd.c"
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
	
l5438:	
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
	
l5440:	
;lcd.c: 22: PORTD = databyte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_control@databyte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	23
	
l5442:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l5444:	
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
u3717:
	decfsz	((??_lcd_write_control+0)^080h+0),f
	goto	u3717
	decfsz	((??_lcd_write_control+0)^080h+0+1),f
	goto	u3717
	nop2
opt asmopt_on

	line	26
	
l2243:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_control
	__end_of_lcd_write_control:
;; =============== function _lcd_write_control ends ============

	signat	_lcd_write_control,4216
	global	_rotate
psect	text460,local,class=CODE,delta=2
global __ptext460
__ptext460:

;; *************** function _rotate *****************
;; Defined at:
;;		line 217 in file "E:\Mechatronics 2\Assignment2\Main.c"
;; Parameters:    Size  Location     Type
;;  steps           1    wreg     unsigned char 
;;  direction       1    0[BANK1 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  steps           1    3[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       1       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       2       0       0
;;      Totals:         0       0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text460
	file	"E:\Mechatronics 2\Assignment2\Main.c"
	line	217
	global	__size_of_rotate
	__size_of_rotate	equ	__end_of_rotate-_rotate
	
_rotate:	
	opt	stack 3
; Regs used in _rotate: [wreg-fsr0h+status,2+status,0]
;rotate@steps stored from wreg
	line	220
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(rotate@steps)^080h
	
l5376:	
;Main.c: 220: for(;steps!=0;--steps)
	movf	(rotate@steps)^080h,f
	skipz
	goto	u3631
	goto	u3630
u3631:
	goto	l5380
u3630:
	goto	l5436
	
l5378:	
	goto	l5436
	line	221
	
l770:	
	line	222
	
l5380:	
;Main.c: 221: {
;Main.c: 222: if (direction == 0)
	movf	(rotate@direction)^080h,f
	skipz
	goto	u3641
	goto	u3640
u3641:
	goto	l5406
u3640:
	goto	l5404
	line	224
	
l5382:	
;Main.c: 223: {
;Main.c: 224: switch(current_step)
	goto	l5404
	line	226
;Main.c: 225: {
;Main.c: 226: case 0b00111100: PORTC = 0b00101110; current_step = 0b00101110;
	
l774:	
	
l5384:	
	movlw	(02Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(02Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	227
;Main.c: 227: break;
	goto	l5432
	line	228
;Main.c: 228: case 0b00101110: PORTC = 0b00101011; current_step = 0b00101011;
	
l776:	
	
l5386:	
	movlw	(02Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(02Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	229
;Main.c: 229: break;
	goto	l5432
	line	230
;Main.c: 230: case 0b00101011: PORTC = 0b00100111; current_step = 0b00100111;
	
l777:	
	
l5388:	
	movlw	(027h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(027h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	231
;Main.c: 231: break;
	goto	l5432
	line	232
;Main.c: 232: case 0b00100111: PORTC = 0b00110101; current_step = 0b00110101;
	
l778:	
	
l5390:	
	movlw	(035h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(035h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	233
;Main.c: 233: break;
	goto	l5432
	line	234
;Main.c: 234: case 0b00110101: PORTC = 0b00010111; current_step = 0b00010111;
	
l779:	
	
l5392:	
	movlw	(017h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(017h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	235
;Main.c: 235: break;
	goto	l5432
	line	236
;Main.c: 236: case 0b00010111: PORTC = 0b00011011; current_step = 0b00011011;
	
l780:	
	
l5394:	
	movlw	(01Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(01Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	237
;Main.c: 237: break;
	goto	l5432
	line	238
;Main.c: 238: case 0b00011011: PORTC = 0b00011110; current_step = 0b00011110;
	
l781:	
	
l5396:	
	movlw	(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(01Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	239
;Main.c: 239: break;
	goto	l5432
	line	240
;Main.c: 240: case 0b00011110: PORTC = 0b00111100; current_step = 0b00111100;
	
l782:	
	
l5398:	
	movlw	(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(03Ch)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	241
;Main.c: 241: break;
	goto	l5432
	line	243
;Main.c: 243: default: PORTC = 0b00111001;
	
l783:	
	
l5400:	
	movlw	(039h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	244
;Main.c: 244: break;
	goto	l5432
	line	245
	
l5402:	
;Main.c: 245: }
	goto	l5432
	line	224
	
l773:	
	
l5404:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_step)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 23 to 60
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
; direct_byte          125    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	23^0	; case 23
	skipnz
	goto	l5394
	xorlw	27^23	; case 27
	skipnz
	goto	l5396
	xorlw	30^27	; case 30
	skipnz
	goto	l5398
	xorlw	39^30	; case 39
	skipnz
	goto	l5390
	xorlw	43^39	; case 43
	skipnz
	goto	l5388
	xorlw	46^43	; case 46
	skipnz
	goto	l5386
	xorlw	53^46	; case 53
	skipnz
	goto	l5392
	xorlw	60^53	; case 60
	skipnz
	goto	l5384
	goto	l5400
	opt asmopt_on

	line	245
	
l775:	
	line	246
;Main.c: 246: }
	goto	l5432
	line	247
	
l772:	
	
l5406:	
;Main.c: 247: else if (direction == 1)
	movf	(rotate@direction)^080h,w
	xorlw	01h
	skipz
	goto	u3651
	goto	u3650
u3651:
	goto	l5432
u3650:
	goto	l5430
	line	249
	
l5408:	
;Main.c: 248: {
;Main.c: 249: switch(current_step)
	goto	l5430
	line	251
;Main.c: 250: {
;Main.c: 251: case 0b00111100: PORTC = 0b00011110; current_step = 0b00011110;
	
l787:	
	
l5410:	
	movlw	(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(01Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	252
;Main.c: 252: break;
	goto	l5432
	line	253
;Main.c: 253: case 0b00101110: PORTC = 0b00111100; current_step = 0b00111100;
	
l789:	
	
l5412:	
	movlw	(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(03Ch)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	254
;Main.c: 254: break;
	goto	l5432
	line	255
;Main.c: 255: case 0b00101011: PORTC = 0b00101110; current_step = 0b00101110;
	
l790:	
	
l5414:	
	movlw	(02Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(02Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	256
;Main.c: 256: break;
	goto	l5432
	line	257
;Main.c: 257: case 0b00100111: PORTC = 0b00101011; current_step = 0b00101011;
	
l791:	
	
l5416:	
	movlw	(02Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(02Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	258
;Main.c: 258: break;
	goto	l5432
	line	259
;Main.c: 259: case 0b00110101: PORTC = 0b00100111; current_step = 0b00100111;
	
l792:	
	
l5418:	
	movlw	(027h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(027h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	260
;Main.c: 260: break;
	goto	l5432
	line	261
;Main.c: 261: case 0b00010111: PORTC = 0b00110101; current_step = 0b00110101;
	
l793:	
	
l5420:	
	movlw	(035h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(035h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	262
;Main.c: 262: break;
	goto	l5432
	line	263
;Main.c: 263: case 0b00011011: PORTC = 0b00010111; current_step = 0b00010111;
	
l794:	
	
l5422:	
	movlw	(017h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(017h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	264
;Main.c: 264: break;
	goto	l5432
	line	265
;Main.c: 265: case 0b00011110: PORTC = 0b00011011; current_step = 0b00011011;
	
l795:	
	
l5424:	
	movlw	(01Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(01Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	movwf	(_current_step)^080h
	line	266
;Main.c: 266: break;
	goto	l5432
	line	268
;Main.c: 268: default: PORTC = 0b00111001;
	
l796:	
	
l5426:	
	movlw	(039h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	269
;Main.c: 269: break;
	goto	l5432
	line	270
	
l5428:	
;Main.c: 270: }
	goto	l5432
	line	249
	
l786:	
	
l5430:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_step)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 23 to 60
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
; direct_byte          125    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	23^0	; case 23
	skipnz
	goto	l5420
	xorlw	27^23	; case 27
	skipnz
	goto	l5422
	xorlw	30^27	; case 30
	skipnz
	goto	l5424
	xorlw	39^30	; case 39
	skipnz
	goto	l5416
	xorlw	43^39	; case 43
	skipnz
	goto	l5414
	xorlw	46^43	; case 46
	skipnz
	goto	l5412
	xorlw	53^46	; case 53
	skipnz
	goto	l5418
	xorlw	60^53	; case 60
	skipnz
	goto	l5410
	goto	l5426
	opt asmopt_on

	line	270
	
l788:	
	line	271
;Main.c: 271: }
	goto	l5432
	line	272
	
l785:	
	goto	l5432
	line	275
;Main.c: 272: else
;Main.c: 273: {
	
l797:	
	goto	l5432
	
l784:	
	line	277
	
l5432:	
;Main.c: 275: }
;Main.c: 277: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_rotate+0)^080h+0+1),f
	movlw	101
movwf	((??_rotate+0)^080h+0),f
u3727:
	decfsz	((??_rotate+0)^080h+0),f
	goto	u3727
	decfsz	((??_rotate+0)^080h+0+1),f
	goto	u3727
	nop2
opt asmopt_on

	line	220
	
l5434:	
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(rotate@steps)^080h,f
	movf	(rotate@steps)^080h,f
	skipz
	goto	u3661
	goto	u3660
u3661:
	goto	l5380
u3660:
	goto	l5436
	
l771:	
	line	280
	
l5436:	
;Main.c: 278: }
;Main.c: 280: PORTC = 0b00111001;
	movlw	(039h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	281
	
l798:	
	return
	opt stack 0
GLOBAL	__end_of_rotate
	__end_of_rotate:
;; =============== function _rotate ends ============

	signat	_rotate,8312
	global	_init_adc
psect	text461,local,class=CODE,delta=2
global __ptext461
__ptext461:

;; *************** function _init_adc *****************
;; Defined at:
;;		line 46 in file "E:\Mechatronics 2\Assignment2\adc.c"
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
psect	text461
	file	"E:\Mechatronics 2\Assignment2\adc.c"
	line	46
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 2
; Regs used in _init_adc: [wreg+status,2]
	line	48
	
l5366:	
;adc.c: 48: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	49
	
l5368:	
;adc.c: 49: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	52
	
l5370:	
;adc.c: 52: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	53
	
l5372:	
;adc.c: 53: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	55
	
l5374:	
;adc.c: 55: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_init_adc+0)^080h+0,f
u3737:
decfsz	(??_init_adc+0)^080h+0,f
	goto	u3737
opt asmopt_on

	line	57
	
l1550:	
	return
	opt stack 0
GLOBAL	__end_of_init_adc
	__end_of_init_adc:
;; =============== function _init_adc ends ============

	signat	_init_adc,88
	global	_isr1
psect	text462,local,class=CODE,delta=2
global __ptext462
__ptext462:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 104 in file "E:\Mechatronics 2\Assignment2\Main.c"
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
psect	text462
	file	"E:\Mechatronics 2\Assignment2\Main.c"
	line	104
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
psect	text462
	line	106
	
i1l4988:	
;Main.c: 106: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u290_21
	goto	u290_20
u290_21:
	goto	i1l764
u290_20:
	line	108
	
i1l4990:	
;Main.c: 107: {
;Main.c: 108: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	109
	
i1l4992:	
;Main.c: 109: TMR0 = 100;
	movlw	(064h)
	movwf	(1)	;volatile
	line	111
;Main.c: 111: RTC_Counter++;
	movlw	low(01h)
	addwf	(_RTC_Counter),f	;volatile
	skipnc
	incf	(_RTC_Counter+1),f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1),f	;volatile
	line	113
	
i1l4994:	
;Main.c: 113: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	114
	
i1l4996:	
;Main.c: 114: if(RTC_Counter % 10 == 0) RTC_FLAG_10MS = 1;
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
	goto	u291_21
	goto	u291_20
u291_21:
	goto	i1l5000
u291_20:
	
i1l4998:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l5000
	
i1l748:	
	line	115
	
i1l5000:	
;Main.c: 115: if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
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
	goto	u292_21
	goto	u292_20
u292_21:
	goto	i1l5004
u292_20:
	
i1l5002:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l5004
	
i1l749:	
	line	116
	
i1l5004:	
;Main.c: 116: if(RTC_Counter % 250 == 0)
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
	goto	u293_21
	goto	u293_20
u293_21:
	goto	i1l5010
u293_20:
	line	118
	
i1l5006:	
;Main.c: 117: {
;Main.c: 118: ADCconvert(readAvgDistance());
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
	line	120
	
i1l5008:	
;Main.c: 120: RTC_FLAG_250MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l5010
	line	122
	
i1l750:	
	line	123
	
i1l5010:	
;Main.c: 122: }
;Main.c: 123: if(RTC_Counter % 500 == 0)
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
	goto	u294_21
	goto	u294_20
u294_21:
	goto	i1l5018
u294_20:
	line	125
	
i1l5012:	
;Main.c: 124: {
;Main.c: 125: RTC_FLAG_500MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	126
	
i1l5014:	
;Main.c: 126: RTC_Counter = 0;
	clrf	(_RTC_Counter)	;volatile
	clrf	(_RTC_Counter+1)	;volatile
	line	127
	
i1l5016:	
;Main.c: 127: RB0 ^= 0x01;
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l5018
	line	128
	
i1l751:	
	line	131
	
i1l5018:	
;Main.c: 128: }
;Main.c: 131: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u295_21
	goto	u295_20
u295_21:
	goto	i1l752
u295_20:
	line	133
	
i1l5020:	
;Main.c: 132: {
;Main.c: 133: pb0DebounceCount++;
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	addwf	(_pb0DebounceCount),f	;volatile
	line	134
	
i1l5022:	
;Main.c: 134: if(pb0DebounceCount >= 10 & pb0Released)
	movlw	(0Ah)
	subwf	(_pb0DebounceCount),w	;volatile
	skipc
	goto	u296_21
	goto	u296_20
u296_21:
	goto	i1l754
u296_20:
	
i1l5024:	
	btfss	(_pb0Released/8),(_pb0Released)&7
	goto	u297_21
	goto	u297_20
u297_21:
	goto	i1l754
u297_20:
	line	136
	
i1l5026:	
;Main.c: 135: {
;Main.c: 136: pb0Pressed = 1;
	bsf	(_pb0Pressed/8),(_pb0Pressed)&7
	line	137
;Main.c: 137: pb0Released = 0;
	bcf	(_pb0Released/8),(_pb0Released)&7
	goto	i1l754
	line	138
	
i1l753:	
	line	139
;Main.c: 138: }
;Main.c: 139: }
	goto	i1l754
	line	140
	
i1l752:	
	line	142
;Main.c: 140: else
;Main.c: 141: {
;Main.c: 142: pb0DebounceCount = 0;
	clrf	(_pb0DebounceCount)	;volatile
	line	143
;Main.c: 143: pb0Released = 1;
	bsf	(_pb0Released/8),(_pb0Released)&7
	line	144
	
i1l754:	
	line	147
;Main.c: 144: }
;Main.c: 147: if(!RB3)
	btfsc	(51/8),(51)&7
	goto	u298_21
	goto	u298_20
u298_21:
	goto	i1l755
u298_20:
	line	149
	
i1l5028:	
;Main.c: 148: {
;Main.c: 149: pb1DebounceCount++;
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	addwf	(_pb1DebounceCount),f	;volatile
	line	150
	
i1l5030:	
;Main.c: 150: if(pb1DebounceCount >= 10 & pb1Released)
	movlw	(0Ah)
	subwf	(_pb1DebounceCount),w	;volatile
	skipc
	goto	u299_21
	goto	u299_20
u299_21:
	goto	i1l757
u299_20:
	
i1l5032:	
	btfss	(_pb1Released/8),(_pb1Released)&7
	goto	u300_21
	goto	u300_20
u300_21:
	goto	i1l757
u300_20:
	line	152
	
i1l5034:	
;Main.c: 151: {
;Main.c: 152: pb1Pressed = 1;
	bsf	(_pb1Pressed/8),(_pb1Pressed)&7
	line	153
;Main.c: 153: pb1Released = 0;
	bcf	(_pb1Released/8),(_pb1Released)&7
	goto	i1l757
	line	154
	
i1l756:	
	line	155
;Main.c: 154: }
;Main.c: 155: }
	goto	i1l757
	line	156
	
i1l755:	
	line	158
;Main.c: 156: else
;Main.c: 157: {
;Main.c: 158: pb1DebounceCount = 0;
	clrf	(_pb1DebounceCount)	;volatile
	line	159
;Main.c: 159: pb1Released = 1;
	bsf	(_pb1Released/8),(_pb1Released)&7
	line	160
	
i1l757:	
	line	162
;Main.c: 160: }
;Main.c: 162: if(!RB4)
	btfsc	(52/8),(52)&7
	goto	u301_21
	goto	u301_20
u301_21:
	goto	i1l758
u301_20:
	line	164
	
i1l5036:	
;Main.c: 163: {
;Main.c: 164: pb2DebounceCount++;
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	addwf	(_pb2DebounceCount),f	;volatile
	line	165
	
i1l5038:	
;Main.c: 165: if(pb2DebounceCount >= 10 & pb2Released)
	movlw	(0Ah)
	subwf	(_pb2DebounceCount),w	;volatile
	skipc
	goto	u302_21
	goto	u302_20
u302_21:
	goto	i1l760
u302_20:
	
i1l5040:	
	btfss	(_pb2Released/8),(_pb2Released)&7
	goto	u303_21
	goto	u303_20
u303_21:
	goto	i1l760
u303_20:
	line	167
	
i1l5042:	
;Main.c: 166: {
;Main.c: 167: pb2Pressed = 1;
	bsf	(_pb2Pressed/8),(_pb2Pressed)&7
	line	168
;Main.c: 168: pb2Released = 0;
	bcf	(_pb2Released/8),(_pb2Released)&7
	goto	i1l760
	line	169
	
i1l759:	
	line	170
;Main.c: 169: }
;Main.c: 170: }
	goto	i1l760
	line	171
	
i1l758:	
	line	173
;Main.c: 171: else
;Main.c: 172: {
;Main.c: 173: pb2DebounceCount = 0;
	clrf	(_pb2DebounceCount)	;volatile
	line	174
;Main.c: 174: pb2Released = 1;
	bsf	(_pb2Released/8),(_pb2Released)&7
	line	175
	
i1l760:	
	line	177
;Main.c: 175: }
;Main.c: 177: if(!RB5)
	btfsc	(53/8),(53)&7
	goto	u304_21
	goto	u304_20
u304_21:
	goto	i1l761
u304_20:
	line	179
	
i1l5044:	
;Main.c: 178: {
;Main.c: 179: pb3DebounceCount++;
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	addwf	(_pb3DebounceCount),f	;volatile
	line	180
	
i1l5046:	
;Main.c: 180: if(pb3DebounceCount >= 10 & pb3Released)
	movlw	(0Ah)
	subwf	(_pb3DebounceCount),w	;volatile
	skipc
	goto	u305_21
	goto	u305_20
u305_21:
	goto	i1l764
u305_20:
	
i1l5048:	
	btfss	(_pb3Released/8),(_pb3Released)&7
	goto	u306_21
	goto	u306_20
u306_21:
	goto	i1l764
u306_20:
	line	182
	
i1l5050:	
;Main.c: 181: {
;Main.c: 182: pb3Pressed = 1;
	bsf	(_pb3Pressed/8),(_pb3Pressed)&7
	line	183
;Main.c: 183: pb3Released = 0;
	bcf	(_pb3Released/8),(_pb3Released)&7
	goto	i1l764
	line	184
	
i1l762:	
	line	185
;Main.c: 184: }
;Main.c: 185: }
	goto	i1l764
	line	186
	
i1l761:	
	line	188
;Main.c: 186: else
;Main.c: 187: {
;Main.c: 188: pb3DebounceCount = 0;
	clrf	(_pb3DebounceCount)	;volatile
	line	189
;Main.c: 189: pb3Released = 1;
	bsf	(_pb3Released/8),(_pb3Released)&7
	goto	i1l764
	line	190
	
i1l763:	
	goto	i1l764
	line	191
	
i1l747:	
	line	192
	
i1l764:	
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
psect	text463,local,class=CODE,delta=2
global __ptext463
__ptext463:

;; *************** function _ADCconvert *****************
;; Defined at:
;;		line 318 in file "E:\Mechatronics 2\Assignment2\Main.c"
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
;;		_sprintf
;;		_lcd_set_cursor
;;		_lcd_write_string
;; This function is called by:
;;		_isr1
;; This function uses a non-reentrant model
;;
psect	text463
	file	"E:\Mechatronics 2\Assignment2\Main.c"
	line	318
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [allreg]
	line	319
	
i1l5082:	
;Main.c: 319: char adcOutput[16] = "";
	movlw	(ADCconvert@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(ADCconvert@F1220)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADCconvert+0)+0
	movf	fsr0,w
	movwf	((??_ADCconvert+0)+0+1)
	movlw	16
	movwf	((??_ADCconvert+0)+0+2)
u310_20:
	movf	(??_ADCconvert+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	
	movf	indf,w
	movwf	((??_ADCconvert+0)+0+3)
	incf	(??_ADCconvert+0)+0,f
	movf	((??_ADCconvert+0)+0+1),w
	movwf	fsr0
	
	movf	((??_ADCconvert+0)+0+3),w
	movwf	indf
	incf	((??_ADCconvert+0)+0+1),f
	decfsz	((??_ADCconvert+0)+0+2),f
	goto	u310_20
	line	321
	
i1l5084:	
;Main.c: 320: unsigned int distance;
;Main.c: 321: if (adcVal > 250)
	movlw	high(0FBh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0FBh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u311_21
	goto	u311_20
u311_21:
	goto	i1l5088
u311_20:
	line	323
	
i1l5086:	
;Main.c: 322: {
;Main.c: 323: distance = 20;
	movlw	low(014h)
	movwf	(ADCconvert@distance)
	movlw	high(014h)
	movwf	((ADCconvert@distance))+1
	line	324
;Main.c: 324: }
	goto	i1l5158
	line	325
	
i1l815:	
	
i1l5088:	
;Main.c: 325: else if (adcVal < 250 && adcVal >= 190)
	movlw	high(0FAh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0FAh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u312_21
	goto	u312_20
u312_21:
	goto	i1l5094
u312_20:
	
i1l5090:	
	movlw	high(0BEh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0BEh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u313_21
	goto	u313_20
u313_21:
	goto	i1l5094
u313_20:
	line	327
	
i1l5092:	
;Main.c: 326: {
;Main.c: 327: distance = 20+ (adcVal%100) ;
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
	line	328
;Main.c: 328: }
	goto	i1l5158
	line	329
	
i1l817:	
	
i1l5094:	
;Main.c: 329: else if (adcVal < 190 && adcVal >= 96)
	movlw	high(0BEh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0BEh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u314_21
	goto	u314_20
u314_21:
	goto	i1l5100
u314_20:
	
i1l5096:	
	movlw	high(060h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(060h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u315_21
	goto	u315_20
u315_21:
	goto	i1l5100
u315_20:
	line	331
	
i1l5098:	
;Main.c: 330: {
;Main.c: 331: distance = 30+ (adcVal%100) ;
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
	line	332
;Main.c: 332: }
	goto	i1l5158
	line	333
	
i1l819:	
	
i1l5100:	
;Main.c: 333: else if (adcVal < 190 && adcVal >= 96)
	movlw	high(0BEh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0BEh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u316_21
	goto	u316_20
u316_21:
	goto	i1l5106
u316_20:
	
i1l5102:	
	movlw	high(060h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(060h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u317_21
	goto	u317_20
u317_21:
	goto	i1l5106
u317_20:
	line	335
	
i1l5104:	
;Main.c: 334: {
;Main.c: 335: distance = 40+ (adcVal%100) ;
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
	line	336
;Main.c: 336: }
	goto	i1l5158
	line	337
	
i1l821:	
	
i1l5106:	
;Main.c: 337: else if (adcVal < 115 && adcVal >= 96)
	movlw	high(073h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(073h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u318_21
	goto	u318_20
u318_21:
	goto	i1l5112
u318_20:
	
i1l5108:	
	movlw	high(060h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(060h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u319_21
	goto	u319_20
u319_21:
	goto	i1l5112
u319_20:
	line	339
	
i1l5110:	
;Main.c: 338: {
;Main.c: 339: distance = 50+ (adcVal%100) ;
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
	line	340
;Main.c: 340: }
	goto	i1l5158
	line	341
	
i1l823:	
	
i1l5112:	
;Main.c: 341: else if (adcVal < 96 && adcVal >= 82)
	movlw	high(060h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(060h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u320_21
	goto	u320_20
u320_21:
	goto	i1l5118
u320_20:
	
i1l5114:	
	movlw	high(052h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(052h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u321_21
	goto	u321_20
u321_21:
	goto	i1l5118
u321_20:
	line	343
	
i1l5116:	
;Main.c: 342: {
;Main.c: 343: distance = 60+ (adcVal%100) ;
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
	line	344
;Main.c: 344: }
	goto	i1l5158
	line	345
	
i1l825:	
	
i1l5118:	
;Main.c: 345: else if (adcVal < 82 && adcVal >= 70)
	movlw	high(052h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(052h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u322_21
	goto	u322_20
u322_21:
	goto	i1l5124
u322_20:
	
i1l5120:	
	movlw	high(046h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(046h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u323_21
	goto	u323_20
u323_21:
	goto	i1l5124
u323_20:
	line	347
	
i1l5122:	
;Main.c: 346: {
;Main.c: 347: distance = 70+ (adcVal%100) ;
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
	line	348
;Main.c: 348: }
	goto	i1l5158
	line	349
	
i1l827:	
	
i1l5124:	
;Main.c: 349: else if (adcVal < 70 && adcVal >= 64)
	movlw	high(046h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(046h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u324_21
	goto	u324_20
u324_21:
	goto	i1l5130
u324_20:
	
i1l5126:	
	movlw	high(040h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(040h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u325_21
	goto	u325_20
u325_21:
	goto	i1l5130
u325_20:
	line	351
	
i1l5128:	
;Main.c: 350: {
;Main.c: 351: distance = 80+ (adcVal%100) ;
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
	line	352
;Main.c: 352: }
	goto	i1l5158
	line	353
	
i1l829:	
	
i1l5130:	
;Main.c: 353: else if (adcVal < 64 && adcVal >= 56)
	movlw	high(040h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(040h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u326_21
	goto	u326_20
u326_21:
	goto	i1l5136
u326_20:
	
i1l5132:	
	movlw	high(038h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(038h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u327_21
	goto	u327_20
u327_21:
	goto	i1l5136
u327_20:
	line	355
	
i1l5134:	
;Main.c: 354: {
;Main.c: 355: distance = 90+ (adcVal%100) ;
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
	line	356
;Main.c: 356: }
	goto	i1l5158
	line	357
	
i1l831:	
	
i1l5136:	
;Main.c: 357: else if (adcVal < 56 && adcVal >= 45)
	movlw	high(038h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(038h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u328_21
	goto	u328_20
u328_21:
	goto	i1l5142
u328_20:
	
i1l5138:	
	movlw	high(02Dh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(02Dh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u329_21
	goto	u329_20
u329_21:
	goto	i1l5142
u329_20:
	line	359
	
i1l5140:	
;Main.c: 358: {
;Main.c: 359: distance = 100+ (adcVal%100) ;
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
	line	360
;Main.c: 360: }
	goto	i1l5158
	line	361
	
i1l833:	
	
i1l5142:	
;Main.c: 361: else if (adcVal < 45 && adcVal >= 40)
	movlw	high(02Dh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(02Dh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l5148
u330_20:
	
i1l5144:	
	movlw	high(028h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(028h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u331_21
	goto	u331_20
u331_21:
	goto	i1l5148
u331_20:
	line	363
	
i1l5146:	
;Main.c: 362: {
;Main.c: 363: distance = 110+ (adcVal%100) ;
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
	line	364
;Main.c: 364: }
	goto	i1l5158
	line	365
	
i1l835:	
	
i1l5148:	
;Main.c: 365: else if (adcVal < 40 && adcVal >= 33)
	movlw	high(028h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(028h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u332_21
	goto	u332_20
u332_21:
	goto	i1l5154
u332_20:
	
i1l5150:	
	movlw	high(021h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(021h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u333_21
	goto	u333_20
u333_21:
	goto	i1l5154
u333_20:
	line	367
	
i1l5152:	
;Main.c: 366: {
;Main.c: 367: distance = 120+ (adcVal%100) ;
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
	line	368
;Main.c: 368: }
	goto	i1l5158
	line	369
	
i1l837:	
	
i1l5154:	
;Main.c: 369: else if (adcVal < 33 )
	movlw	high(021h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(021h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u334_21
	goto	u334_20
u334_21:
	goto	i1l5158
u334_20:
	line	371
	
i1l5156:	
;Main.c: 370: {
;Main.c: 371: distance = 130 + (adcVal%100) ;
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
	goto	i1l5158
	line	372
	
i1l839:	
	goto	i1l5158
	line	377
	
i1l838:	
	goto	i1l5158
	
i1l836:	
	goto	i1l5158
	
i1l834:	
	goto	i1l5158
	
i1l832:	
	goto	i1l5158
	
i1l830:	
	goto	i1l5158
	
i1l828:	
	goto	i1l5158
	
i1l826:	
	goto	i1l5158
	
i1l824:	
	goto	i1l5158
	
i1l822:	
	goto	i1l5158
	
i1l820:	
	goto	i1l5158
	
i1l818:	
	goto	i1l5158
	
i1l816:	
	
i1l5158:	
;Main.c: 372: }
;Main.c: 377: sprintf(adcOutput,"Distance: %dcm", distance);
	movlw	((STR_3-__stringbase))&0ffh
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
	line	378
	
i1l5160:	
;Main.c: 378: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	380
;Main.c: 380: lcd_write_string(adcOutput);
	movlw	(ADCconvert@adcOutput)&0ffh
	fcall	_lcd_write_string
	line	381
	
i1l840:	
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,4216
	global	_readAvgDistance
psect	text464,local,class=CODE,delta=2
global __ptext464
__ptext464:

;; *************** function _readAvgDistance *****************
;; Defined at:
;;		line 300 in file "E:\Mechatronics 2\Assignment2\Main.c"
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
;;		_lcd_set_cursor
;;		i1_lcd_write_control
;;		_lcd_write_string
;; This function is called by:
;;		_isr1
;; This function uses a non-reentrant model
;;
psect	text464
	file	"E:\Mechatronics 2\Assignment2\Main.c"
	line	300
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 1
; Regs used in _readAvgDistance: [allreg]
	line	301
	
i1l5052:	
;Main.c: 301: unsigned int fullval = 0, averageval;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(readAvgDistance@fullval)
	clrf	(readAvgDistance@fullval+1)
	line	302
	
i1l5054:	
;Main.c: 302: char adcOutput[16] = "";
	movlw	(readAvgDistance@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(readAvgDistance@F1216)
	movwf	(??_readAvgDistance+0)+0
	movf	fsr0,w
	movwf	((??_readAvgDistance+0)+0+1)
	movlw	16
	movwf	((??_readAvgDistance+0)+0+2)
u307_20:
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
	goto	u307_20
	line	304
	
i1l5056:	
;Main.c: 304: for (int i = 0; i < 10; i++)
	clrf	(readAvgDistance@i)
	clrf	(readAvgDistance@i+1)
	
i1l5058:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u308_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u308_25:

	skipc
	goto	u308_21
	goto	u308_20
u308_21:
	goto	i1l5062
u308_20:
	goto	i1l5068
	
i1l5060:	
	goto	i1l5068
	line	305
	
i1l808:	
	line	306
	
i1l5062:	
;Main.c: 305: {
;Main.c: 306: fullval += adc_read_channel(0);
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
	line	304
	
i1l5064:	
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
i1l5066:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u309_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u309_25:

	skipc
	goto	u309_21
	goto	u309_20
u309_21:
	goto	i1l5062
u309_20:
	goto	i1l5068
	
i1l809:	
	line	309
	
i1l5068:	
;Main.c: 308: }
;Main.c: 309: averageval = fullval / 10;
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

	line	310
	
i1l5070:	
;Main.c: 310: sprintf(adcOutput,"Adc Value: %d", averageval);
	movlw	((STR_2-__stringbase))&0ffh
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
	line	311
	
i1l5072:	
;Main.c: 311: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	312
	
i1l5074:	
;Main.c: 312: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	i1_lcd_write_control
	line	313
	
i1l5076:	
;Main.c: 313: lcd_write_string(adcOutput);
	movlw	(readAvgDistance@adcOutput)&0ffh
	fcall	_lcd_write_string
	line	314
	
i1l5078:	
;Main.c: 314: return averageval;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(readAvgDistance@averageval+1),w
	clrf	(?_readAvgDistance+1)
	addwf	(?_readAvgDistance+1)
	movf	(readAvgDistance@averageval),w
	clrf	(?_readAvgDistance)
	addwf	(?_readAvgDistance)

	goto	i1l810
	
i1l5080:	
	line	315
	
i1l810:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,90
	global	_lcd_write_string
psect	text465,local,class=CODE,delta=2
global __ptext465
__ptext465:

;; *************** function _lcd_write_string *****************
;; Defined at:
;;		line 48 in file "E:\Mechatronics 2\Assignment2\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR unsigned char 
;;		 -> ADCconvert@adcOutput(16), readAvgDistance@adcOutput(16), readDistance@adcOutput(16), 
;; Auto vars:     Size  Location     Type
;;  s               1    4[COMMON] PTR unsigned char 
;;		 -> ADCconvert@adcOutput(16), readAvgDistance@adcOutput(16), readDistance@adcOutput(16), 
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
;;		_readAvgDistance
;;		_ADCconvert
;;		_readDistance
;; This function uses a non-reentrant model
;;
psect	text465
	file	"E:\Mechatronics 2\Assignment2\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 1
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_write_string@s stored from wreg
	movwf	(lcd_write_string@s)
	line	50
	
i1l5258:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	i1l5264
	
i1l2253:	
	
i1l5260:	
	movf	(lcd_write_string@s),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_write_data
	
i1l5262:	
	movlw	(01h)
	movwf	(??_lcd_write_string+0)+0
	movf	(??_lcd_write_string+0)+0,w
	addwf	(lcd_write_string@s),f
	goto	i1l5264
	
i1l2252:	
	
i1l5264:	
	movf	(lcd_write_string@s),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,f
	skipz
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l5260
u344_20:
	goto	i1l2255
	
i1l2254:	
	line	51
	
i1l2255:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_string
	__end_of_lcd_write_string:
;; =============== function _lcd_write_string ends ============

	signat	_lcd_write_string,4216
	global	_lcd_set_cursor
psect	text466,local,class=CODE,delta=2
global __ptext466
__ptext466:

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 42 in file "E:\Mechatronics 2\Assignment2\lcd.c"
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
;;		_readAvgDistance
;;		_ADCconvert
;;		_readDistance
;; This function uses a non-reentrant model
;;
psect	text466
	file	"E:\Mechatronics 2\Assignment2\lcd.c"
	line	42
	global	__size_of_lcd_set_cursor
	__size_of_lcd_set_cursor	equ	__end_of_lcd_set_cursor-_lcd_set_cursor
	
_lcd_set_cursor:	
	opt	stack 1
; Regs used in _lcd_set_cursor: [wreg+status,2+status,0+pclath+cstack]
;lcd_set_cursor@address stored from wreg
	movwf	(lcd_set_cursor@address)
	line	43
	
i1l5254:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
i1l5256:	
;lcd.c: 44: lcd_write_control(address);
	movf	(lcd_set_cursor@address),w
	fcall	i1_lcd_write_control
	line	45
	
i1l2249:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
;; =============== function _lcd_set_cursor ends ============

	signat	_lcd_set_cursor,4216
	global	i1_lcd_write_control
psect	text467,local,class=CODE,delta=2
global __ptext467
__ptext467:

;; *************** function i1_lcd_write_control *****************
;; Defined at:
;;		line 18 in file "E:\Mechatronics 2\Assignment2\lcd.c"
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
;;		_readAvgDistance
;;		_lcd_set_cursor
;; This function uses a non-reentrant model
;;
psect	text467
	file	"E:\Mechatronics 2\Assignment2\lcd.c"
	line	18
	global	__size_ofi1_lcd_write_control
	__size_ofi1_lcd_write_control	equ	__end_ofi1_lcd_write_control-i1_lcd_write_control
	
i1_lcd_write_control:	
	opt	stack 1
; Regs used in i1_lcd_write_control: [wreg]
;i1lcd_write_control@databyte stored from wreg
	movwf	(i1lcd_write_control@databyte)
	line	19
	
i1l5358:	
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
	
i1l5360:	
;lcd.c: 22: PORTD = databyte;
	movf	(i1lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
i1l5362:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
i1l5364:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??i1_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??i1_lcd_write_control+0)+0),f
u374_27:
	decfsz	((??i1_lcd_write_control+0)+0),f
	goto	u374_27
	decfsz	((??i1_lcd_write_control+0)+0+1),f
	goto	u374_27
	nop2
opt asmopt_on

	line	26
	
i1l2243:	
	return
	opt stack 0
GLOBAL	__end_ofi1_lcd_write_control
	__end_ofi1_lcd_write_control:
;; =============== function i1_lcd_write_control ends ============

	signat	i1_lcd_write_control,88
	global	_lcd_write_data
psect	text468,local,class=CODE,delta=2
global __ptext468
__ptext468:

;; *************** function _lcd_write_data *****************
;; Defined at:
;;		line 30 in file "E:\Mechatronics 2\Assignment2\lcd.c"
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
psect	text468
	file	"E:\Mechatronics 2\Assignment2\lcd.c"
	line	30
	global	__size_of_lcd_write_data
	__size_of_lcd_write_data	equ	__end_of_lcd_write_data-_lcd_write_data
	
_lcd_write_data:	
	opt	stack 1
; Regs used in _lcd_write_data: [wreg]
;lcd_write_data@databyte stored from wreg
	movwf	(lcd_write_data@databyte)
	line	31
	
i1l5292:	
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
	
i1l5294:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
i1l5296:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
i1l5298:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u375_27:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u375_27
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u375_27
opt asmopt_on

	line	38
	
i1l2246:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_data
	__end_of_lcd_write_data:
;; =============== function _lcd_write_data ends ============

	signat	_lcd_write_data,4216
	global	_sprintf
psect	text469,local,class=CODE,delta=2
global __ptext469
__ptext469:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> ADCconvert@adcOutput(16), readAvgDistance@adcOutput(16), readDistance@adcOutput(16), 
;;  f               1    0[BANK0 ] PTR const unsigned char 
;;		 -> STR_3(15), STR_2(14), STR_1(14), 
;; Auto vars:     Size  Location     Type
;;  sp              1   13[BANK0 ] PTR unsigned char 
;;		 -> ADCconvert@adcOutput(16), readAvgDistance@adcOutput(16), readDistance@adcOutput(16), 
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
psect	text469
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
	
i1l5196:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	i1l5248
	
i1l2283:	
	line	542
	
i1l5198:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u336_21
	goto	u336_20
u336_21:
	goto	i1l2284
u336_20:
	line	545
	
i1l5200:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l5202:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	i1l5248
	line	547
	
i1l2284:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	i1l5206
	line	640
	
i1l2286:	
	line	641
	goto	i1l5250
	line	700
	
i1l2288:	
	goto	i1l5208
	line	701
	
i1l2289:	
	line	702
	goto	i1l5208
	line	805
	
i1l2291:	
	line	816
	goto	i1l5248
	line	825
	
i1l5204:	
	goto	i1l5208
	line	638
	
i1l2285:	
	
i1l5206:	
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
	goto	i1l5250
	xorlw	100^0	; case 100
	skipnz
	goto	i1l5208
	xorlw	105^100	; case 105
	skipnz
	goto	i1l5208
	goto	i1l5248
	opt asmopt_on

	line	825
	
i1l2290:	
	line	1254
	
i1l5208:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
i1l5210:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
i1l5212:	
	btfss	(sprintf@_val+1),7
	goto	u337_21
	goto	u337_20
u337_21:
	goto	i1l5218
u337_20:
	line	1257
	
i1l5214:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
i1l5216:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	i1l5218
	line	1259
	
i1l2292:	
	line	1300
	
i1l5218:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
i1l5220:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u338_21
	goto	u338_20
u338_21:
	goto	i1l5224
u338_20:
	goto	i1l5232
	
i1l5222:	
	goto	i1l5232
	line	1301
	
i1l2293:	
	
i1l5224:	
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
	goto	u339_25
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u339_25:
	skipnc
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l5228
u339_20:
	goto	i1l5232
	line	1302
	
i1l5226:	
	goto	i1l5232
	
i1l2295:	
	line	1300
	
i1l5228:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
i1l5230:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u340_21
	goto	u340_20
u340_21:
	goto	i1l5224
u340_20:
	goto	i1l5232
	
i1l2294:	
	line	1433
	
i1l5232:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u341_21
	goto	u341_20
u341_21:
	goto	i1l5238
u341_20:
	line	1434
	
i1l5234:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l5236:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l5238
	
i1l2296:	
	line	1467
	
i1l5238:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	i1l5246
	
i1l2298:	
	line	1484
	
i1l5240:	
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
	
i1l5242:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l5244:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l5246
	line	1517
	
i1l2297:	
	line	1469
	
i1l5246:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u342_21
	goto	u342_20
u342_21:
	goto	i1l5240
u342_20:
	goto	i1l5248
	
i1l2299:	
	goto	i1l5248
	line	1525
	
i1l2282:	
	line	540
	
i1l5248:	
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
	goto	u343_21
	goto	u343_20
u343_21:
	goto	i1l5198
u343_20:
	goto	i1l5250
	
i1l2300:	
	goto	i1l5250
	line	1527
	
i1l2287:	
	line	1530
	
i1l5250:	
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	i1l2301
	line	1532
	
i1l5252:	
	line	1533
;	Return value of _sprintf is never used
	
i1l2301:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_adc_read_channel
psect	text470,local,class=CODE,delta=2
global __ptext470
__ptext470:

;; *************** function _adc_read_channel *****************
;; Defined at:
;;		line 5 in file "E:\Mechatronics 2\Assignment2\adc.c"
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
psect	text470
	file	"E:\Mechatronics 2\Assignment2\adc.c"
	line	5
	global	__size_of_adc_read_channel
	__size_of_adc_read_channel	equ	__end_of_adc_read_channel-_adc_read_channel
	
_adc_read_channel:	
	opt	stack 1
; Regs used in _adc_read_channel: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;adc_read_channel@channel stored from wreg
	movwf	(adc_read_channel@channel)
	line	6
	
i1l5180:	
;adc.c: 6: switch(channel)
	goto	i1l5188
	line	8
;adc.c: 7: {
;adc.c: 8: case 0:
	
i1l1540:	
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
	goto	i1l5190
	line	13
;adc.c: 13: case 1:
	
i1l1542:	
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
	goto	i1l5190
	line	18
;adc.c: 18: case 2:
	
i1l1543:	
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
	goto	i1l5190
	line	23
;adc.c: 23: case 3:
	
i1l1544:	
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
	goto	i1l5190
	line	28
;adc.c: 28: case 4:
	
i1l1545:	
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
	goto	i1l5190
	line	35
;adc.c: 35: default:
	
i1l1546:	
	line	36
	
i1l5182:	
;adc.c: 36: return 0;
	movlw	(0)
	goto	i1l1547
	
i1l5184:	
	goto	i1l1547
	line	37
	
i1l5186:	
;adc.c: 37: }
	goto	i1l5190
	line	6
	
i1l1539:	
	
i1l5188:	
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
	goto	i1l1540
	xorlw	1^0	; case 1
	skipnz
	goto	i1l1542
	xorlw	2^1	; case 2
	skipnz
	goto	i1l1543
	xorlw	3^2	; case 3
	skipnz
	goto	i1l1544
	xorlw	4^3	; case 4
	skipnz
	goto	i1l1545
	goto	i1l5182
	opt asmopt_on

	line	37
	
i1l1541:	
	line	39
	
i1l5190:	
;adc.c: 39: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u376_27:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u376_27
opt asmopt_on

	line	41
	
i1l5192:	
;adc.c: 41: return adc_read();
	fcall	_adc_read
	movf	(0+(?_adc_read)),w
	goto	i1l1547
	
i1l5194:	
	line	43
	
i1l1547:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___lwmod
psect	text471,local,class=CODE,delta=2
global __ptext471
__ptext471:

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
psect	text471
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l5336:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u357_21
	goto	u357_20
u357_21:
	goto	i1l5354
u357_20:
	line	9
	
i1l5338:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	i1l5344
	
i1l3002:	
	line	11
	
i1l5340:	
	movlw	01h
	
u358_25:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u358_25
	line	12
	
i1l5342:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	i1l5344
	line	13
	
i1l3001:	
	line	10
	
i1l5344:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u359_21
	goto	u359_20
u359_21:
	goto	i1l5340
u359_20:
	goto	i1l5346
	
i1l3003:	
	goto	i1l5346
	line	14
	
i1l3004:	
	line	15
	
i1l5346:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u360_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u360_25:
	skipc
	goto	u360_21
	goto	u360_20
u360_21:
	goto	i1l5350
u360_20:
	line	16
	
i1l5348:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	i1l5350
	
i1l3005:	
	line	17
	
i1l5350:	
	movlw	01h
	
u361_25:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u361_25
	line	18
	
i1l5352:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u362_21
	goto	u362_20
u362_21:
	goto	i1l5346
u362_20:
	goto	i1l5354
	
i1l3006:	
	goto	i1l5354
	line	19
	
i1l3000:	
	line	20
	
i1l5354:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	i1l3007
	
i1l5356:	
	line	21
	
i1l3007:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text472,local,class=CODE,delta=2
global __ptext472
__ptext472:

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
psect	text472
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
i1l5310:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
i1l5312:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l5332
u350_20:
	line	11
	
i1l5314:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	i1l5320
	
i1l2992:	
	line	13
	
i1l5316:	
	movlw	01h
	
u351_25:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u351_25
	line	14
	
i1l5318:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	i1l5320
	line	15
	
i1l2991:	
	line	12
	
i1l5320:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l5316
u352_20:
	goto	i1l5322
	
i1l2993:	
	goto	i1l5322
	line	16
	
i1l2994:	
	line	17
	
i1l5322:	
	movlw	01h
	
u353_25:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u353_25
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u354_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u354_25:
	skipc
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l5328
u354_20:
	line	19
	
i1l5324:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
i1l5326:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l5328
	line	21
	
i1l2995:	
	line	22
	
i1l5328:	
	movlw	01h
	
u355_25:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u355_25
	line	23
	
i1l5330:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u356_21
	goto	u356_20
u356_21:
	goto	i1l5322
u356_20:
	goto	i1l5332
	
i1l2996:	
	goto	i1l5332
	line	24
	
i1l2990:	
	line	25
	
i1l5332:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	i1l2997
	
i1l5334:	
	line	26
	
i1l2997:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_adc_read
psect	text473,local,class=CODE,delta=2
global __ptext473
__ptext473:

;; *************** function _adc_read *****************
;; Defined at:
;;		line 61 in file "E:\Mechatronics 2\Assignment2\adc.c"
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
psect	text473
	file	"E:\Mechatronics 2\Assignment2\adc.c"
	line	61
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 1
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	64
	
i1l5282:	
;adc.c: 62: volatile unsigned int adc_value;
;adc.c: 64: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	66
	
i1l5284:	
;adc.c: 66: GO = 1;
	bsf	(250/8),(250)&7
	line	67
;adc.c: 67: while(GO) continue;
	goto	i1l1553
	
i1l1554:	
	
i1l1553:	
	btfsc	(250/8),(250)&7
	goto	u347_21
	goto	u347_20
u347_21:
	goto	i1l1553
u347_20:
	
i1l1555:	
	line	68
# 68 "E:\Mechatronics 2\Assignment2\adc.c"
nop ;#
	line	69
# 69 "E:\Mechatronics 2\Assignment2\adc.c"
nop ;#
	line	70
# 70 "E:\Mechatronics 2\Assignment2\adc.c"
nop ;#
psect	text473
	line	73
	
i1l5286:	
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
	
u348_25:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u348_25
	line	75
;adc.c: 75: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	78
	
i1l5288:	
;adc.c: 78: return (adc_value);
	movf	(adc_read@adc_value+1),w	;volatile
	clrf	(?_adc_read+1)
	addwf	(?_adc_read+1)
	movf	(adc_read@adc_value),w	;volatile
	clrf	(?_adc_read)
	addwf	(?_adc_read)

	goto	i1l1556
	
i1l5290:	
	line	79
	
i1l1556:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
psect	text474,local,class=CODE,delta=2
global __ptext474
__ptext474:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
