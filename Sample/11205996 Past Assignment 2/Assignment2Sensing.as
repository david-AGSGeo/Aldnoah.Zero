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
# 3 "E:\Mechatronics Assignment 2\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "E:\Mechatronics Assignment 2\Main.c"
	dw 0xFFFE & 0xFFFB & 0xFFFF & 0xFFBF & 0xFFF7 & 0xFFFF & 0xFF7F & 0xFFFF ;#
	FNCALL	_main,_init
	FNCALL	_main,_init_adc
	FNCALL	_main,_lcd_init
	FNCALL	_main,_infrared
	FNCALL	_infrared,_adc_read_channel
	FNCALL	_infrared,___lwtoft
	FNCALL	_infrared,___ftadd
	FNCALL	_infrared,___awtoft
	FNCALL	_infrared,___ftdiv
	FNCALL	_infrared,___ftge
	FNCALL	_infrared,___ftmul
	FNCALL	_infrared,___ftneg
	FNCALL	_infrared,_lcd_set_cursor
	FNCALL	_infrared,_lcd_write_string
	FNCALL	_infrared,___fttol
	FNCALL	_infrared,_lcd_write_4_digit_bcd
	FNCALL	_lcd_init,_lcd_write_control
	FNCALL	_lcd_write_4_digit_bcd,_lcd_write_data
	FNCALL	_lcd_write_string,_lcd_write_data
	FNCALL	_lcd_set_cursor,_lcd_write_control
	FNCALL	___lwtoft,___ftpack
	FNCALL	___awtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNCALL	___ftadd,___ftpack
	FNCALL	_adc_read_channel,_adc_read
	FNROOT	_main
	FNCALL	_isr1,___lwmod
	FNCALL	intlevel1,_isr1
	global	intlevel1
	FNROOT	intlevel1
	global	_RTC_Counter
	global	_RTC_FLAG_10MS
	global	_RTC_FLAG_125MS
	global	_RTC_FLAG_1MS
	global	_RTC_FLAG_500MS
	global	_RTC_FLAG_50MS
	global	_ADCON0
psect	text558,local,class=CODE,delta=2
global __ptext558
__ptext558:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTA
_PORTA	set	5
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
	
STR_1:	
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
	retlw	0
psect	strings
	
STR_2:	
	retlw	65	;'A'
	retlw	68	;'D'
	retlw	67	;'C'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	file	"Assignment2Sensing.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_RTC_FLAG_10MS:
       ds      1

_RTC_FLAG_125MS:
       ds      1

_RTC_FLAG_1MS:
       ds      1

_RTC_FLAG_500MS:
       ds      1

_RTC_FLAG_50MS:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_RTC_Counter:
       ds      2

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_set_cursor
?_lcd_set_cursor:	; 0 bytes @ 0x0
	global	?_lcd_write_string
?_lcd_write_string:	; 0 bytes @ 0x0
	global	?_init_adc
?_init_adc:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_init
?_init:	; 0 bytes @ 0x0
	global	?_isr1
?_isr1:	; 0 bytes @ 0x0
	global	?_infrared
?_infrared:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_write_control
?_lcd_write_control:	; 0 bytes @ 0x0
	global	?_lcd_write_data
?_lcd_write_data:	; 0 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	??_isr1
??_isr1:	; 0 bytes @ 0x6
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_init_adc
??_init_adc:	; 0 bytes @ 0x0
	global	??_init
??_init:	; 0 bytes @ 0x0
	global	??_lcd_write_control
??_lcd_write_control:	; 0 bytes @ 0x0
	global	??_lcd_write_data
??_lcd_write_data:	; 0 bytes @ 0x0
	global	?___ftge
?___ftge:	; 1 bit 
	global	?_adc_read
?_adc_read:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	?___fttol
?___fttol:	; 4 bytes @ 0x0
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x0
	global	___ftge@ff1
___ftge@ff1:	; 3 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	ds	2
	global	??_adc_read
??_adc_read:	; 0 bytes @ 0x2
	global	lcd_write_control@databyte
lcd_write_control@databyte:	; 1 bytes @ 0x2
	global	lcd_write_data@databyte
lcd_write_data@databyte:	; 1 bytes @ 0x2
	ds	1
	global	??_lcd_set_cursor
??_lcd_set_cursor:	; 0 bytes @ 0x3
	global	??_lcd_write_string
??_lcd_write_string:	; 0 bytes @ 0x3
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	lcd_set_cursor@address
lcd_set_cursor@address:	; 1 bytes @ 0x3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	global	___ftge@ff2
___ftge@ff2:	; 3 bytes @ 0x3
	ds	1
	global	??___fttol
??___fttol:	; 0 bytes @ 0x4
	global	lcd_write_string@s
lcd_write_string@s:	; 1 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	global	adc_read@adc_value
adc_read@adc_value:	; 2 bytes @ 0x5
	ds	1
	global	??___ftge
??___ftge:	; 0 bytes @ 0x6
	ds	1
	global	?_adc_read_channel
?_adc_read_channel:	; 2 bytes @ 0x7
	ds	1
	global	?___awtoft
?___awtoft:	; 3 bytes @ 0x8
	global	?___ftneg
?___ftneg:	; 3 bytes @ 0x8
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x8
	global	___awtoft@c
___awtoft@c:	; 2 bytes @ 0x8
	global	___ftneg@f1
___ftneg@f1:	; 3 bytes @ 0x8
	ds	1
	global	??_adc_read_channel
??_adc_read_channel:	; 0 bytes @ 0x9
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x9
	ds	1
	global	adc_read_channel@channel
adc_read_channel@channel:	; 1 bytes @ 0xA
	ds	1
	global	??___awtoft
??___awtoft:	; 0 bytes @ 0xB
	global	??___ftneg
??___ftneg:	; 0 bytes @ 0xB
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0xB
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0xB
	ds	2
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0xD
	global	___awtoft@sign
___awtoft@sign:	; 1 bytes @ 0xD
	ds	1
	global	?_lcd_write_4_digit_bcd
?_lcd_write_4_digit_bcd:	; 0 bytes @ 0xE
	global	??___lwtoft
??___lwtoft:	; 0 bytes @ 0xE
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0xE
	global	lcd_write_4_digit_bcd@data
lcd_write_4_digit_bcd@data:	; 2 bytes @ 0xE
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0xE
	ds	1
	global	?___ftadd
?___ftadd:	; 3 bytes @ 0xF
	global	___ftadd@f1
___ftadd@f1:	; 3 bytes @ 0xF
	ds	1
	global	??_lcd_write_4_digit_bcd
??_lcd_write_4_digit_bcd:	; 0 bytes @ 0x10
	global	lcd_write_4_digit_bcd@TensDigit
lcd_write_4_digit_bcd@TensDigit:	; 2 bytes @ 0x10
	ds	1
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x11
	ds	1
	global	lcd_write_4_digit_bcd@HunsDigit
lcd_write_4_digit_bcd@HunsDigit:	; 2 bytes @ 0x12
	global	___ftadd@f2
___ftadd@f2:	; 3 bytes @ 0x12
	ds	2
	global	??___ftdiv
??___ftdiv:	; 0 bytes @ 0x14
	global	lcd_write_4_digit_bcd@ThousDigit
lcd_write_4_digit_bcd@ThousDigit:	; 2 bytes @ 0x14
	ds	1
	global	??___ftadd
??___ftadd:	; 0 bytes @ 0x15
	ds	1
	global	lcd_write_4_digit_bcd@OnesDigit
lcd_write_4_digit_bcd@OnesDigit:	; 2 bytes @ 0x16
	ds	2
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x18
	ds	1
	global	___ftadd@sign
___ftadd@sign:	; 1 bytes @ 0x19
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x19
	ds	1
	global	___ftadd@exp2
___ftadd@exp2:	; 1 bytes @ 0x1A
	ds	1
	global	___ftadd@exp1
___ftadd@exp1:	; 1 bytes @ 0x1B
	ds	1
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x1C
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x1C
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x1C
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x1D
	ds	2
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x1F
	ds	3
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x22
	ds	4
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x26
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x27
	ds	3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x2A
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x2B
	ds	1
	global	??_infrared
??_infrared:	; 0 bytes @ 0x2C
	global	infrared@adcVals
infrared@adcVals:	; 3 bytes @ 0x2C
	ds	3
	global	infrared@i
infrared@i:	; 2 bytes @ 0x2F
	ds	2
	global	_infrared$4525
_infrared$4525:	; 3 bytes @ 0x31
	ds	3
	global	infrared@total
infrared@total:	; 3 bytes @ 0x34
	ds	3
	global	??_main
??_main:	; 0 bytes @ 0x37
;;Data sizes: Strings 17, constant 0, data 0, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          13     10      13
;; BANK0           80     55      55
;; BANK1           80      0       0
;; BANK3           85      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?_adc_read	unsigned int  size(1) Largest target is 0
;;
;; ?_adc_read_channel	unsigned int  size(1) Largest target is 0
;;
;; ?___ftneg	float  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___ftdiv	float  size(1) Largest target is 0
;;
;; ?___awtoft	float  size(1) Largest target is 0
;;
;; ?___ftadd	float  size(1) Largest target is 0
;;
;; ?___lwtoft	float  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; lcd_write_string@s	PTR unsigned char  size(1) Largest target is 11
;;		 -> STR_2(CODE[6]), STR_1(CODE[11]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr1 in COMMON
;;
;;   _isr1->___lwmod
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_infrared
;;   _infrared->___ftmul
;;   _lcd_init->_lcd_write_control
;;   _lcd_write_4_digit_bcd->___fttol
;;   _lcd_write_string->_lcd_write_data
;;   _lcd_set_cursor->_lcd_write_control
;;   ___lwtoft->_adc_read_channel
;;   ___awtoft->___ftpack
;;   ___ftmul->___ftadd
;;   ___ftdiv->___awtoft
;;   ___ftadd->___lwtoft
;;   _adc_read_channel->_adc_read
;;   ___ftneg->___ftpack
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
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    5250
;;                               _init
;;                           _init_adc
;;                           _lcd_init
;;                           _infrared
;; ---------------------------------------------------------------------------------
;; (1) _infrared                                            29    29      0    5228
;;                                             44 BANK0     11    11      0
;;                   _adc_read_channel
;;                           ___lwtoft
;;                            ___ftadd
;;                           ___awtoft
;;                            ___ftdiv
;;                             ___ftge
;;                            ___ftmul
;;                            ___ftneg
;;                     _lcd_set_cursor
;;                   _lcd_write_string
;;                            ___fttol
;;              _lcd_write_4_digit_bcd
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      22
;;                  _lcd_write_control
;; ---------------------------------------------------------------------------------
;; (2) _lcd_write_4_digit_bcd                               10     8      2     274
;;                                             14 BANK0     10     8      2
;;                     _lcd_write_data
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) _lcd_write_string                                     2     2      0      67
;;                                              3 BANK0      2     2      0
;;                     _lcd_write_data
;; ---------------------------------------------------------------------------------
;; (2) _lcd_set_cursor                                       1     1      0      45
;;                                              3 BANK0      1     1      0
;;                  _lcd_write_control
;; ---------------------------------------------------------------------------------
;; (2) ___lwtoft                                             4     1      3     231
;;                                             11 BANK0      4     1      3
;;                           ___ftpack
;;                   _adc_read_channel (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___awtoft                                             6     3      3     300
;;                                              8 BANK0      6     3      3
;;                           ___ftpack
;; ---------------------------------------------------------------------------------
;; (2) ___ftmul                                             16    10      6     535
;;                                             28 BANK0     16    10      6
;;                           ___ftpack
;;                            ___ftadd (ARG)
;;                            ___ftneg (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftdiv                                             16    10      6     489
;;                                             14 BANK0     16    10      6
;;                           ___ftpack
;;                           ___awtoft (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftadd                                             13     7      6    1049
;;                                             15 BANK0     13     7      6
;;                           ___ftpack
;;                           ___lwtoft (ARG)
;;                   _adc_read_channel (ARG)
;;                            ___ftneg (ARG)
;; ---------------------------------------------------------------------------------
;; (3) _lcd_write_data                                       3     3      0      22
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (3) _lcd_write_control                                    3     3      0      22
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _init_adc                                             1     1      0       0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _adc_read_channel                                     4     2      2      47
;;                                              7 BANK0      4     2      2
;;                           _adc_read
;; ---------------------------------------------------------------------------------
;; (2) ___ftge                                              12     6      6     136
;;                                              0 BANK0     12     6      6
;; ---------------------------------------------------------------------------------
;; (2) ___ftneg                                              3     0      3      45
;;                                              8 BANK0      3     0      3
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___fttol                                             14    10      4     252
;;                                              0 BANK0     14    10      4
;; ---------------------------------------------------------------------------------
;; (3) ___ftpack                                             8     3      5     209
;;                                              0 BANK0      8     3      5
;; ---------------------------------------------------------------------------------
;; (3) _adc_read                                             7     5      2      25
;;                                              0 BANK0      7     5      2
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _isr1                                                 4     4      0     105
;;                                              6 COMMON     4     4      0
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (5) ___lwmod                                              6     2      4     105
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;   _init_adc
;;   _lcd_init
;;     _lcd_write_control
;;   _infrared
;;     _adc_read_channel
;;       _adc_read
;;     ___lwtoft
;;       ___ftpack
;;       _adc_read_channel (ARG)
;;         _adc_read
;;     ___ftadd
;;       ___ftpack
;;       ___lwtoft (ARG)
;;         ___ftpack
;;         _adc_read_channel (ARG)
;;           _adc_read
;;       _adc_read_channel (ARG)
;;         _adc_read
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;     ___awtoft
;;       ___ftpack
;;     ___ftdiv
;;       ___ftpack
;;       ___awtoft (ARG)
;;         ___ftpack
;;     ___ftge
;;     ___ftmul
;;       ___ftpack
;;       ___ftadd (ARG)
;;         ___ftpack
;;         ___lwtoft (ARG)
;;           ___ftpack
;;           _adc_read_channel (ARG)
;;             _adc_read
;;         _adc_read_channel (ARG)
;;           _adc_read
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;     ___ftneg
;;       ___ftpack (ARG)
;;     _lcd_set_cursor
;;       _lcd_write_control
;;     _lcd_write_string
;;       _lcd_write_data
;;     ___fttol
;;     _lcd_write_4_digit_bcd
;;       _lcd_write_data
;;       ___fttol (ARG)
;;
;; _isr1 (ROOT)
;;   ___lwmod
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            D      0       1       0        7.7%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               D      A       D       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       7       2        0.0%
;;ABS                  0      0      44       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     37      37       5       68.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            55      0       0       8        0.0%
;;BANK3               55      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      4B      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 114 in file "E:\Mechatronics Assignment 2\Main.c"
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_init
;;		_init_adc
;;		_lcd_init
;;		_infrared
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Mechatronics Assignment 2\Main.c"
	line	114
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	115
	
l6419:	
;Main.c: 115: init();
	fcall	_init
	line	116
;Main.c: 116: init_adc();
	fcall	_init_adc
	line	117
;Main.c: 117: lcd_init();
	fcall	_lcd_init
	goto	l6421
	line	119
;Main.c: 119: while(1)
	
l1423:	
	line	121
	
l6421:	
;Main.c: 120: {
;Main.c: 121: infrared();
	fcall	_infrared
	goto	l6421
	line	123
	
l1424:	
	line	119
	goto	l6421
	
l1425:	
	line	124
	
l1426:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_infrared
psect	text559,local,class=CODE,delta=2
global __ptext559
__ptext559:

;; *************** function _infrared *****************
;; Defined at:
;;		line 47 in file "E:\Mechatronics Assignment 2\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  total           3   52[BANK0 ] PTR unsigned char 
;;  adcVals         3   44[BANK0 ] PTR unsigned char 
;;  i               2   47[BANK0 ] int 
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
;;      Locals:         0      11       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0      11       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_adc_read_channel
;;		___lwtoft
;;		___ftadd
;;		___awtoft
;;		___ftdiv
;;		___ftge
;;		___ftmul
;;		___ftneg
;;		_lcd_set_cursor
;;		_lcd_write_string
;;		___fttol
;;		_lcd_write_4_digit_bcd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text559
	file	"E:\Mechatronics Assignment 2\Main.c"
	line	47
	global	__size_of_infrared
	__size_of_infrared	equ	__end_of_infrared-_infrared
	
_infrared:	
	opt	stack 3
; Regs used in _infrared: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	48
	
l6347:	
;Main.c: 48: double adcVals = 0;
	movlw	0x0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(infrared@adcVals)
	movlw	0x0
	movwf	(infrared@adcVals+1)
	movlw	0x0
	movwf	(infrared@adcVals+2)
	line	49
;Main.c: 49: double total = 0;
	movlw	0x0
	movwf	(infrared@total)
	movlw	0x0
	movwf	(infrared@total+1)
	movlw	0x0
	movwf	(infrared@total+2)
	line	51
	
l6349:	
;Main.c: 50: int i;
;Main.c: 51: i = 0;
	clrf	(infrared@i)
	clrf	(infrared@i+1)
	line	53
;Main.c: 53: while (RTC_FLAG_125MS == 0)
	goto	l6355
	
l1405:	
	line	55
	
l6351:	
;Main.c: 54: {
;Main.c: 55: i++;
	movlw	low(01h)
	addwf	(infrared@i),f
	skipnc
	incf	(infrared@i+1),f
	movlw	high(01h)
	addwf	(infrared@i+1),f
	line	56
	
l6353:	
;Main.c: 56: total = total + adc_read_channel(0);
	movf	(infrared@total),w
	movwf	(?___ftadd)
	movf	(infrared@total+1),w
	movwf	(?___ftadd+1)
	movf	(infrared@total+2),w
	movwf	(?___ftadd+2)
	movlw	(0)
	fcall	_adc_read_channel
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_adc_read_channel)),w
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(0+(?_adc_read_channel)),w
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwtoft)),w
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___lwtoft)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___lwtoft)),w
	movwf	2+(?___ftadd)+03h
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(infrared@total)
	movf	(1+(?___ftadd)),w
	movwf	(infrared@total+1)
	movf	(2+(?___ftadd)),w
	movwf	(infrared@total+2)
	goto	l6355
	line	57
	
l1404:	
	line	53
	
l6355:	
	btfss	(_RTC_FLAG_125MS/8),(_RTC_FLAG_125MS)&7
	goto	u3401
	goto	u3400
u3401:
	goto	l6351
u3400:
	
l1406:	
	line	59
;Main.c: 57: }
;Main.c: 59: RTC_FLAG_125MS = 0;
	bcf	(_RTC_FLAG_125MS/8),(_RTC_FLAG_125MS)&7
	line	60
	
l6357:	
;Main.c: 60: total = total/i;
	movf	(infrared@i+1),w
	clrf	(?___awtoft+1)
	addwf	(?___awtoft+1)
	movf	(infrared@i),w
	clrf	(?___awtoft)
	addwf	(?___awtoft)

	fcall	___awtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awtoft)),w
	movwf	(?___ftdiv)
	movf	(1+(?___awtoft)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___awtoft)),w
	movwf	(?___ftdiv+2)
	movf	(infrared@total),w
	movwf	0+(?___ftdiv)+03h
	movf	(infrared@total+1),w
	movwf	1+(?___ftdiv)+03h
	movf	(infrared@total+2),w
	movwf	2+(?___ftdiv)+03h
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(infrared@total)
	movf	(1+(?___ftdiv)),w
	movwf	(infrared@total+1)
	movf	(2+(?___ftdiv)),w
	movwf	(infrared@total+2)
	line	61
	
l6359:	
;Main.c: 61: adcVals = total;
	movf	(infrared@total),w
	movwf	(infrared@adcVals)
	movf	(infrared@total+1),w
	movwf	(infrared@adcVals+1)
	movf	(infrared@total+2),w
	movwf	(infrared@adcVals+2)
	line	63
	
l6361:	
;Main.c: 63: total = total/202;
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x4a
	movwf	(?___ftdiv+1)
	movlw	0x43
	movwf	(?___ftdiv+2)
	movf	(infrared@total),w
	movwf	0+(?___ftdiv)+03h
	movf	(infrared@total+1),w
	movwf	1+(?___ftdiv)+03h
	movf	(infrared@total+2),w
	movwf	2+(?___ftdiv)+03h
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(infrared@total)
	movf	(1+(?___ftdiv)),w
	movwf	(infrared@total+1)
	movf	(2+(?___ftdiv)),w
	movwf	(infrared@total+2)
	line	67
	
l6363:	
;Main.c: 67: if (total >= 2.5 && total < 3)
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x20
	movwf	1+(?___ftge)+03h
	movlw	0x40
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u3411
	goto	u3410
u3411:
	goto	l6369
u3410:
	
l6365:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x40
	movwf	1+(?___ftge)+03h
	movlw	0x40
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u3421
	goto	u3420
u3421:
	goto	l6369
u3420:
	line	69
	
l6367:	
;Main.c: 68: {
;Main.c: 69: total = 20 - 20*(total - 2.5);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	0+(?___ftadd)+03h
	movf	(infrared@total+1),w
	movwf	1+(?___ftadd)+03h
	movf	(infrared@total+2),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x20
	movwf	(?___ftadd+1)
	movlw	0xc0
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
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___ftneg)
	movf	(1+(?___ftmul)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftneg)),w
	movwf	(_infrared$4525)
	movf	(1+(?___ftneg)),w
	movwf	(_infrared$4525+1)
	movf	(2+(?___ftneg)),w
	movwf	(_infrared$4525+2)
;Main.c: 68: {
;Main.c: 69: total = 20 - 20*(total - 2.5);
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0xa0
	movwf	(?___ftadd+1)
	movlw	0x41
	movwf	(?___ftadd+2)
	movf	(_infrared$4525),w
	movwf	0+(?___ftadd)+03h
	movf	(_infrared$4525+1),w
	movwf	1+(?___ftadd)+03h
	movf	(_infrared$4525+2),w
	movwf	2+(?___ftadd)+03h
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(infrared@total)
	movf	(1+(?___ftadd)),w
	movwf	(infrared@total+1)
	movf	(2+(?___ftadd)),w
	movwf	(infrared@total+2)
	line	70
;Main.c: 70: }
	goto	l6405
	line	71
	
l1407:	
	
l6369:	
;Main.c: 71: else if (total >= 2 && total < 2.5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x0
	movwf	1+(?___ftge)+03h
	movlw	0x40
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u3431
	goto	u3430
u3431:
	goto	l6375
u3430:
	
l6371:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x20
	movwf	1+(?___ftge)+03h
	movlw	0x40
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u3441
	goto	u3440
u3441:
	goto	l6375
u3440:
	line	73
	
l6373:	
;Main.c: 72: {
;Main.c: 73: total = 30 - 20*(total - 2);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	0+(?___ftadd)+03h
	movf	(infrared@total+1),w
	movwf	1+(?___ftadd)+03h
	movf	(infrared@total+2),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x0
	movwf	(?___ftadd+1)
	movlw	0xc0
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
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___ftneg)
	movf	(1+(?___ftmul)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftneg)),w
	movwf	(_infrared$4525)
	movf	(1+(?___ftneg)),w
	movwf	(_infrared$4525+1)
	movf	(2+(?___ftneg)),w
	movwf	(_infrared$4525+2)
;Main.c: 72: {
;Main.c: 73: total = 30 - 20*(total - 2);
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0xf0
	movwf	(?___ftadd+1)
	movlw	0x41
	movwf	(?___ftadd+2)
	movf	(_infrared$4525),w
	movwf	0+(?___ftadd)+03h
	movf	(_infrared$4525+1),w
	movwf	1+(?___ftadd)+03h
	movf	(_infrared$4525+2),w
	movwf	2+(?___ftadd)+03h
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(infrared@total)
	movf	(1+(?___ftadd)),w
	movwf	(infrared@total+1)
	movf	(2+(?___ftadd)),w
	movwf	(infrared@total+2)
	line	74
;Main.c: 74: }
	goto	l6405
	line	75
	
l1409:	
	
l6375:	
;Main.c: 75: else if (total >= 1.5 && total < 2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0xc0
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u3451
	goto	u3450
u3451:
	goto	l6381
u3450:
	
l6377:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x0
	movwf	1+(?___ftge)+03h
	movlw	0x40
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u3461
	goto	u3460
u3461:
	goto	l6381
u3460:
	line	77
	
l6379:	
;Main.c: 76: {
;Main.c: 77: total = 40 - 20*(total - 1.5);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	0+(?___ftadd)+03h
	movf	(infrared@total+1),w
	movwf	1+(?___ftadd)+03h
	movf	(infrared@total+2),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0xc0
	movwf	(?___ftadd+1)
	movlw	0xbf
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
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___ftneg)
	movf	(1+(?___ftmul)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftneg)),w
	movwf	(_infrared$4525)
	movf	(1+(?___ftneg)),w
	movwf	(_infrared$4525+1)
	movf	(2+(?___ftneg)),w
	movwf	(_infrared$4525+2)
;Main.c: 76: {
;Main.c: 77: total = 40 - 20*(total - 1.5);
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x20
	movwf	(?___ftadd+1)
	movlw	0x42
	movwf	(?___ftadd+2)
	movf	(_infrared$4525),w
	movwf	0+(?___ftadd)+03h
	movf	(_infrared$4525+1),w
	movwf	1+(?___ftadd)+03h
	movf	(_infrared$4525+2),w
	movwf	2+(?___ftadd)+03h
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(infrared@total)
	movf	(1+(?___ftadd)),w
	movwf	(infrared@total+1)
	movf	(2+(?___ftadd)),w
	movwf	(infrared@total+2)
	line	78
;Main.c: 78: }
	goto	l6405
	line	79
	
l1411:	
	
l6381:	
;Main.c: 79: else if (total >= 1.25 && total < 1.5)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0xa0
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u3471
	goto	u3470
u3471:
	goto	l6387
u3470:
	
l6383:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0xc0
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u3481
	goto	u3480
u3481:
	goto	l6387
u3480:
	line	81
	
l6385:	
;Main.c: 80: {
;Main.c: 81: total = 50 - 40*(total - 1.25);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	0+(?___ftadd)+03h
	movf	(infrared@total+1),w
	movwf	1+(?___ftadd)+03h
	movf	(infrared@total+2),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0xa0
	movwf	(?___ftadd+1)
	movlw	0xbf
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
	movlw	0x42
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___ftneg)
	movf	(1+(?___ftmul)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftneg)),w
	movwf	(_infrared$4525)
	movf	(1+(?___ftneg)),w
	movwf	(_infrared$4525+1)
	movf	(2+(?___ftneg)),w
	movwf	(_infrared$4525+2)
;Main.c: 80: {
;Main.c: 81: total = 50 - 40*(total - 1.25);
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x48
	movwf	(?___ftadd+1)
	movlw	0x42
	movwf	(?___ftadd+2)
	movf	(_infrared$4525),w
	movwf	0+(?___ftadd)+03h
	movf	(_infrared$4525+1),w
	movwf	1+(?___ftadd)+03h
	movf	(_infrared$4525+2),w
	movwf	2+(?___ftadd)+03h
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(infrared@total)
	movf	(1+(?___ftadd)),w
	movwf	(infrared@total+1)
	movf	(2+(?___ftadd)),w
	movwf	(infrared@total+2)
	line	82
;Main.c: 82: }
	goto	l6405
	line	83
	
l1413:	
	
l6387:	
;Main.c: 83: else if (total >= 0.9 && total < 1.25)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x66
	movwf	0+(?___ftge)+03h
	movlw	0x66
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u3491
	goto	u3490
u3491:
	goto	l6393
u3490:
	
l6389:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0xa0
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u3501
	goto	u3500
u3501:
	goto	l6393
u3500:
	line	85
	
l6391:	
;Main.c: 84: {
;Main.c: 85: total = 70 - 40*(total - 0.9);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	0+(?___ftadd)+03h
	movf	(infrared@total+1),w
	movwf	1+(?___ftadd)+03h
	movf	(infrared@total+2),w
	movwf	2+(?___ftadd)+03h
	movlw	0x66
	movwf	(?___ftadd)
	movlw	0x66
	movwf	(?___ftadd+1)
	movlw	0xbf
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
	movlw	0x42
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___ftneg)
	movf	(1+(?___ftmul)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftneg)),w
	movwf	(_infrared$4525)
	movf	(1+(?___ftneg)),w
	movwf	(_infrared$4525+1)
	movf	(2+(?___ftneg)),w
	movwf	(_infrared$4525+2)
;Main.c: 84: {
;Main.c: 85: total = 70 - 40*(total - 0.9);
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x8c
	movwf	(?___ftadd+1)
	movlw	0x42
	movwf	(?___ftadd+2)
	movf	(_infrared$4525),w
	movwf	0+(?___ftadd)+03h
	movf	(_infrared$4525+1),w
	movwf	1+(?___ftadd)+03h
	movf	(_infrared$4525+2),w
	movwf	2+(?___ftadd)+03h
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(infrared@total)
	movf	(1+(?___ftadd)),w
	movwf	(infrared@total+1)
	movf	(2+(?___ftadd)),w
	movwf	(infrared@total+2)
	line	86
;Main.c: 86: }
	goto	l6405
	line	87
	
l1415:	
	
l6393:	
;Main.c: 87: else if (total >= 0.65 && total < 0.9)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x66
	movwf	0+(?___ftge)+03h
	movlw	0x26
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u3511
	goto	u3510
u3511:
	goto	l6399
u3510:
	
l6395:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x66
	movwf	0+(?___ftge)+03h
	movlw	0x66
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u3521
	goto	u3520
u3521:
	goto	l6399
u3520:
	line	89
	
l6397:	
;Main.c: 88: {
;Main.c: 89: total = 100 - (30/0.25)*(total - 0.65);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	0+(?___ftadd)+03h
	movf	(infrared@total+1),w
	movwf	1+(?___ftadd)+03h
	movf	(infrared@total+2),w
	movwf	2+(?___ftadd)+03h
	movlw	0x66
	movwf	(?___ftadd)
	movlw	0x26
	movwf	(?___ftadd+1)
	movlw	0xbf
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
	movlw	0xf0
	movwf	(?___ftmul+1)
	movlw	0x42
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___ftneg)
	movf	(1+(?___ftmul)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftneg)),w
	movwf	(_infrared$4525)
	movf	(1+(?___ftneg)),w
	movwf	(_infrared$4525+1)
	movf	(2+(?___ftneg)),w
	movwf	(_infrared$4525+2)
;Main.c: 88: {
;Main.c: 89: total = 100 - (30/0.25)*(total - 0.65);
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0xc8
	movwf	(?___ftadd+1)
	movlw	0x42
	movwf	(?___ftadd+2)
	movf	(_infrared$4525),w
	movwf	0+(?___ftadd)+03h
	movf	(_infrared$4525+1),w
	movwf	1+(?___ftadd)+03h
	movf	(_infrared$4525+2),w
	movwf	2+(?___ftadd)+03h
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(infrared@total)
	movf	(1+(?___ftadd)),w
	movwf	(infrared@total+1)
	movf	(2+(?___ftadd)),w
	movwf	(infrared@total+2)
	line	90
;Main.c: 90: }
	goto	l6405
	line	91
	
l1417:	
	
l6399:	
;Main.c: 91: else if (total >= 0.5 && total < 0.65)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x0
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfss	status,0
	goto	u3531
	goto	u3530
u3531:
	goto	l6405
u3530:
	
l6401:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___ftge)
	movf	(infrared@total+1),w
	movwf	(?___ftge+1)
	movf	(infrared@total+2),w
	movwf	(?___ftge+2)
	movlw	0x66
	movwf	0+(?___ftge)+03h
	movlw	0x26
	movwf	1+(?___ftge)+03h
	movlw	0x3f
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u3541
	goto	u3540
u3541:
	goto	l6405
u3540:
	line	93
	
l6403:	
;Main.c: 92: {
;Main.c: 93: total = 140 - (40/0.15)*(total - 0.5);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	0+(?___ftadd)+03h
	movf	(infrared@total+1),w
	movwf	1+(?___ftadd)+03h
	movf	(infrared@total+2),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x0
	movwf	(?___ftadd+1)
	movlw	0xbf
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
	movlw	0x55
	movwf	(?___ftmul)
	movlw	0x85
	movwf	(?___ftmul+1)
	movlw	0x43
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___ftneg)
	movf	(1+(?___ftmul)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftneg)),w
	movwf	(_infrared$4525)
	movf	(1+(?___ftneg)),w
	movwf	(_infrared$4525+1)
	movf	(2+(?___ftneg)),w
	movwf	(_infrared$4525+2)
;Main.c: 92: {
;Main.c: 93: total = 140 - (40/0.15)*(total - 0.5);
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0xc
	movwf	(?___ftadd+1)
	movlw	0x43
	movwf	(?___ftadd+2)
	movf	(_infrared$4525),w
	movwf	0+(?___ftadd)+03h
	movf	(_infrared$4525+1),w
	movwf	1+(?___ftadd)+03h
	movf	(_infrared$4525+2),w
	movwf	2+(?___ftadd)+03h
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(infrared@total)
	movf	(1+(?___ftadd)),w
	movwf	(infrared@total+1)
	movf	(2+(?___ftadd)),w
	movwf	(infrared@total+2)
	goto	l6405
	line	94
	
l1419:	
	goto	l6405
	line	98
	
l1418:	
	goto	l6405
	
l1416:	
	goto	l6405
	
l1414:	
	goto	l6405
	
l1412:	
	goto	l6405
	
l1410:	
	goto	l6405
	
l1408:	
	
l6405:	
;Main.c: 94: }
;Main.c: 98: RTC_FLAG_500MS = 0;
	bcf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	99
;Main.c: 99: lcd_set_cursor(0);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	100
	
l6407:	
;Main.c: 100: lcd_write_string("Distance: ");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_write_string
	line	102
	
l6409:	
;Main.c: 102: lcd_set_cursor(10);
	movlw	(0Ah)
	fcall	_lcd_set_cursor
	line	103
	
l6411:	
;Main.c: 103: lcd_write_4_digit_bcd(total);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@total),w
	movwf	(?___fttol)
	movf	(infrared@total+1),w
	movwf	(?___fttol+1)
	movf	(infrared@total+2),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(((0+(?___fttol)))),w
	clrf	(?_lcd_write_4_digit_bcd+1)
	addwf	(?_lcd_write_4_digit_bcd+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(?_lcd_write_4_digit_bcd)
	addwf	(?_lcd_write_4_digit_bcd)

	fcall	_lcd_write_4_digit_bcd
	line	105
	
l6413:	
;Main.c: 105: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	106
;Main.c: 106: lcd_write_string("ADC: ");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_lcd_write_string
	line	108
	
l6415:	
;Main.c: 108: lcd_set_cursor(0x4A);
	movlw	(04Ah)
	fcall	_lcd_set_cursor
	line	109
	
l6417:	
;Main.c: 109: lcd_write_4_digit_bcd(adcVals);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(infrared@adcVals),w
	movwf	(?___fttol)
	movf	(infrared@adcVals+1),w
	movwf	(?___fttol+1)
	movf	(infrared@adcVals+2),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(((0+(?___fttol)))),w
	clrf	(?_lcd_write_4_digit_bcd+1)
	addwf	(?_lcd_write_4_digit_bcd+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(?_lcd_write_4_digit_bcd)
	addwf	(?_lcd_write_4_digit_bcd)

	fcall	_lcd_write_4_digit_bcd
	line	110
	
l1420:	
	return
	opt stack 0
GLOBAL	__end_of_infrared
	__end_of_infrared:
;; =============== function _infrared ends ============

	signat	_infrared,88
	global	_lcd_init
psect	text560,local,class=CODE,delta=2
global __ptext560
__ptext560:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 108 in file "E:\Mechatronics Assignment 2\lcd.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text560
	file	"E:\Mechatronics Assignment 2\lcd.c"
	line	108
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 4
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	112
	
l6327:	
;lcd.c: 112: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	115
	
l6329:	
;lcd.c: 115: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	116
	
l6331:	
;lcd.c: 116: PORTE = 0;
	clrf	(9)	;volatile
	line	118
	
l6333:	
;lcd.c: 118: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	119
	
l6335:	
;lcd.c: 119: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	122
	
l6337:	
;lcd.c: 122: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	123
	
l6339:	
;lcd.c: 123: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	124
	
l6341:	
;lcd.c: 124: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	125
	
l6343:	
;lcd.c: 125: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	126
	
l6345:	
;lcd.c: 126: lcd_write_control(0b00000010);
	movlw	(02h)
	fcall	_lcd_write_control
	line	128
	
l2852:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_write_4_digit_bcd
psect	text561,local,class=CODE,delta=2
global __ptext561
__ptext561:

;; *************** function _lcd_write_4_digit_bcd *****************
;; Defined at:
;;		line 73 in file "E:\Mechatronics Assignment 2\lcd.c"
;; Parameters:    Size  Location     Type
;;  data            2   14[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  OnesDigit       2   22[BANK0 ] unsigned int 
;;  ThousDigit      2   20[BANK0 ] unsigned int 
;;  HunsDigit       2   18[BANK0 ] unsigned int 
;;  TensDigit       2   16[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       8       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_write_data
;; This function is called by:
;;		_infrared
;; This function uses a non-reentrant model
;;
psect	text561
	file	"E:\Mechatronics Assignment 2\lcd.c"
	line	73
	global	__size_of_lcd_write_4_digit_bcd
	__size_of_lcd_write_4_digit_bcd	equ	__end_of_lcd_write_4_digit_bcd-_lcd_write_4_digit_bcd
	
_lcd_write_4_digit_bcd:	
	opt	stack 3
; Regs used in _lcd_write_4_digit_bcd: [wreg+status,2+status,0+pclath+cstack]
	line	77
	
l6299:	
;lcd.c: 74: unsigned int OnesDigit, TensDigit, HunsDigit, ThousDigit;
;lcd.c: 77: OnesDigit = data;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_4_digit_bcd@data+1),w
	clrf	(lcd_write_4_digit_bcd@OnesDigit+1)
	addwf	(lcd_write_4_digit_bcd@OnesDigit+1)
	movf	(lcd_write_4_digit_bcd@data),w
	clrf	(lcd_write_4_digit_bcd@OnesDigit)
	addwf	(lcd_write_4_digit_bcd@OnesDigit)

	line	78
	
l6301:	
;lcd.c: 78: TensDigit = 0;
	clrf	(lcd_write_4_digit_bcd@TensDigit)
	clrf	(lcd_write_4_digit_bcd@TensDigit+1)
	line	79
	
l6303:	
;lcd.c: 79: HunsDigit = 0;
	clrf	(lcd_write_4_digit_bcd@HunsDigit)
	clrf	(lcd_write_4_digit_bcd@HunsDigit+1)
	line	80
	
l6305:	
;lcd.c: 80: ThousDigit = 0;
	clrf	(lcd_write_4_digit_bcd@ThousDigit)
	clrf	(lcd_write_4_digit_bcd@ThousDigit+1)
	line	83
;lcd.c: 83: while (OnesDigit >= 1000)
	goto	l6311
	
l2841:	
	line	85
	
l6307:	
;lcd.c: 84: {
;lcd.c: 85: OnesDigit = OnesDigit - 1000;
	movf	(lcd_write_4_digit_bcd@OnesDigit),w
	addlw	low(0FC18h)
	movwf	(lcd_write_4_digit_bcd@OnesDigit)
	movf	(lcd_write_4_digit_bcd@OnesDigit+1),w
	skipnc
	addlw	1
	addlw	high(0FC18h)
	movwf	1+(lcd_write_4_digit_bcd@OnesDigit)
	line	86
	
l6309:	
;lcd.c: 86: ThousDigit++;
	movlw	low(01h)
	addwf	(lcd_write_4_digit_bcd@ThousDigit),f
	skipnc
	incf	(lcd_write_4_digit_bcd@ThousDigit+1),f
	movlw	high(01h)
	addwf	(lcd_write_4_digit_bcd@ThousDigit+1),f
	goto	l6311
	line	87
	
l2840:	
	line	83
	
l6311:	
	movlw	high(03E8h)
	subwf	(lcd_write_4_digit_bcd@OnesDigit+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(lcd_write_4_digit_bcd@OnesDigit),w
	skipnc
	goto	u3371
	goto	u3370
u3371:
	goto	l6307
u3370:
	goto	l6317
	
l2842:	
	line	89
;lcd.c: 87: }
;lcd.c: 89: while (OnesDigit >= 100)
	goto	l6317
	
l2844:	
	line	91
	
l6313:	
;lcd.c: 90: {
;lcd.c: 91: OnesDigit = OnesDigit - 100;
	movf	(lcd_write_4_digit_bcd@OnesDigit),w
	addlw	low(0FF9Ch)
	movwf	(lcd_write_4_digit_bcd@OnesDigit)
	movf	(lcd_write_4_digit_bcd@OnesDigit+1),w
	skipnc
	addlw	1
	addlw	high(0FF9Ch)
	movwf	1+(lcd_write_4_digit_bcd@OnesDigit)
	line	92
	
l6315:	
;lcd.c: 92: HunsDigit++;
	movlw	low(01h)
	addwf	(lcd_write_4_digit_bcd@HunsDigit),f
	skipnc
	incf	(lcd_write_4_digit_bcd@HunsDigit+1),f
	movlw	high(01h)
	addwf	(lcd_write_4_digit_bcd@HunsDigit+1),f
	goto	l6317
	line	93
	
l2843:	
	line	89
	
l6317:	
	movlw	high(064h)
	subwf	(lcd_write_4_digit_bcd@OnesDigit+1),w
	movlw	low(064h)
	skipnz
	subwf	(lcd_write_4_digit_bcd@OnesDigit),w
	skipnc
	goto	u3381
	goto	u3380
u3381:
	goto	l6313
u3380:
	goto	l6323
	
l2845:	
	line	95
;lcd.c: 93: }
;lcd.c: 95: while (OnesDigit >= 10)
	goto	l6323
	
l2847:	
	line	97
	
l6319:	
;lcd.c: 96: {
;lcd.c: 97: OnesDigit = OnesDigit - 10;
	movf	(lcd_write_4_digit_bcd@OnesDigit),w
	addlw	low(0FFF6h)
	movwf	(lcd_write_4_digit_bcd@OnesDigit)
	movf	(lcd_write_4_digit_bcd@OnesDigit+1),w
	skipnc
	addlw	1
	addlw	high(0FFF6h)
	movwf	1+(lcd_write_4_digit_bcd@OnesDigit)
	line	98
	
l6321:	
;lcd.c: 98: TensDigit++;
	movlw	low(01h)
	addwf	(lcd_write_4_digit_bcd@TensDigit),f
	skipnc
	incf	(lcd_write_4_digit_bcd@TensDigit+1),f
	movlw	high(01h)
	addwf	(lcd_write_4_digit_bcd@TensDigit+1),f
	goto	l6323
	line	99
	
l2846:	
	line	95
	
l6323:	
	movlw	high(0Ah)
	subwf	(lcd_write_4_digit_bcd@OnesDigit+1),w
	movlw	low(0Ah)
	skipnz
	subwf	(lcd_write_4_digit_bcd@OnesDigit),w
	skipnc
	goto	u3391
	goto	u3390
u3391:
	goto	l6319
u3390:
	goto	l6325
	
l2848:	
	line	101
	
l6325:	
;lcd.c: 99: }
;lcd.c: 101: lcd_write_data((unsigned char)ThousDigit + 48);
	movf	(lcd_write_4_digit_bcd@ThousDigit),w
	addlw	030h
	fcall	_lcd_write_data
	line	102
;lcd.c: 102: lcd_write_data((unsigned char)HunsDigit + 48);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_4_digit_bcd@HunsDigit),w
	addlw	030h
	fcall	_lcd_write_data
	line	103
;lcd.c: 103: lcd_write_data((unsigned char)TensDigit + 48);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_4_digit_bcd@TensDigit),w
	addlw	030h
	fcall	_lcd_write_data
	line	104
;lcd.c: 104: lcd_write_data((unsigned char)OnesDigit + 48);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_write_4_digit_bcd@OnesDigit),w
	addlw	030h
	fcall	_lcd_write_data
	line	105
	
l2849:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_4_digit_bcd
	__end_of_lcd_write_4_digit_bcd:
;; =============== function _lcd_write_4_digit_bcd ends ============

	signat	_lcd_write_4_digit_bcd,4216
	global	_lcd_write_string
psect	text562,local,class=CODE,delta=2
global __ptext562
__ptext562:

;; *************** function _lcd_write_string *****************
;; Defined at:
;;		line 47 in file "E:\Mechatronics Assignment 2\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR unsigned char 
;;		 -> STR_2(6), STR_1(11), 
;; Auto vars:     Size  Location     Type
;;  s               1    4[BANK0 ] PTR unsigned char 
;;		 -> STR_2(6), STR_1(11), 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_write_data
;; This function is called by:
;;		_infrared
;; This function uses a non-reentrant model
;;
psect	text562
	file	"E:\Mechatronics Assignment 2\lcd.c"
	line	47
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 3
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_write_string@s stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_write_string@s)
	line	49
	
l6291:	
;lcd.c: 49: while(*s) lcd_write_data(*s++);
	goto	l6297
	
l2829:	
	
l6293:	
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_write_data
	
l6295:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_lcd_write_string+0)+0
	movf	(??_lcd_write_string+0)+0,w
	addwf	(lcd_write_string@s),f
	goto	l6297
	
l2828:	
	
l6297:	
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u3361
	goto	u3360
u3361:
	goto	l6293
u3360:
	goto	l2831
	
l2830:	
	line	50
	
l2831:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_string
	__end_of_lcd_write_string:
;; =============== function _lcd_write_string ends ============

	signat	_lcd_write_string,4216
	global	_lcd_set_cursor
psect	text563,local,class=CODE,delta=2
global __ptext563
__ptext563:

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 41 in file "E:\Mechatronics Assignment 2\lcd.c"
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
;;		_infrared
;; This function uses a non-reentrant model
;;
psect	text563
	file	"E:\Mechatronics Assignment 2\lcd.c"
	line	41
	global	__size_of_lcd_set_cursor
	__size_of_lcd_set_cursor	equ	__end_of_lcd_set_cursor-_lcd_set_cursor
	
_lcd_set_cursor:	
	opt	stack 3
; Regs used in _lcd_set_cursor: [wreg+status,2+status,0+pclath+cstack]
;lcd_set_cursor@address stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_set_cursor@address)
	line	42
	
l6287:	
;lcd.c: 42: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	43
	
l6289:	
;lcd.c: 43: lcd_write_control(address);
	movf	(lcd_set_cursor@address),w
	fcall	_lcd_write_control
	line	44
	
l2825:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_set_cursor
	__end_of_lcd_set_cursor:
;; =============== function _lcd_set_cursor ends ============

	signat	_lcd_set_cursor,4216
	global	___lwtoft
psect	text564,local,class=CODE,delta=2
global __ptext564
__ptext564:

;; *************** function ___lwtoft *****************
;; Defined at:
;;		line 29 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   11[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3   11[BANK0 ] float 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_infrared
;; This function uses a non-reentrant model
;;
psect	text564
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwtoft.c"
	line	29
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
	opt	stack 3
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l6283:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___lwtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lwtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lwtoft+2)
	goto	l3758
	
l6285:	
	line	31
	
l3758:	
	return
	opt stack 0
GLOBAL	__end_of___lwtoft
	__end_of___lwtoft:
;; =============== function ___lwtoft ends ============

	signat	___lwtoft,4219
	global	___awtoft
psect	text565,local,class=CODE,delta=2
global __ptext565
__ptext565:

;; *************** function ___awtoft *****************
;; Defined at:
;;		line 33 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2    8[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    8[BANK0 ] float 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_infrared
;; This function uses a non-reentrant model
;;
psect	text565
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awtoft.c"
	line	33
	global	__size_of___awtoft
	__size_of___awtoft	equ	__end_of___awtoft-___awtoft
	
___awtoft:	
	opt	stack 3
; Regs used in ___awtoft: [wreg+status,2+status,0+pclath+cstack]
	line	36
	
l6275:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awtoft@sign)
	line	37
	btfss	(___awtoft@c+1),7
	goto	u3351
	goto	u3350
u3351:
	goto	l6279
u3350:
	line	38
	
l6277:	
	comf	(___awtoft@c),f
	comf	(___awtoft@c+1),f
	incf	(___awtoft@c),f
	skipnz
	incf	(___awtoft@c+1),f
	line	39
	clrf	(___awtoft@sign)
	bsf	status,0
	rlf	(___awtoft@sign),f
	goto	l6279
	line	40
	
l3671:	
	line	41
	
l6279:	
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
	goto	l3672
	
l6281:	
	line	42
	
l3672:	
	return
	opt stack 0
GLOBAL	__end_of___awtoft
	__end_of___awtoft:
;; =============== function ___awtoft ends ============

	signat	___awtoft,4219
	global	___ftmul
psect	text566,local,class=CODE,delta=2
global __ptext566
__ptext566:

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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_infrared
;; This function uses a non-reentrant model
;;
psect	text566
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 3
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l6225:	
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
	goto	u3211
	goto	u3210
u3211:
	goto	l6231
u3210:
	line	57
	
l6227:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l3634
	
l6229:	
	goto	l3634
	
l3633:	
	line	58
	
l6231:	
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
	goto	u3221
	goto	u3220
u3221:
	goto	l6237
u3220:
	line	59
	
l6233:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l3634
	
l6235:	
	goto	l3634
	
l3635:	
	line	60
	
l6237:	
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
u3235:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3230:
	addlw	-1
	skipz
	goto	u3235
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
u3245:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3240:
	addlw	-1
	skipz
	goto	u3245
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
	
l6239:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l6241:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l6243:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l6245:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l6247:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l6249
	line	70
	
l3636:	
	line	71
	
l6249:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3251
	goto	u3250
u3251:
	goto	l6253
u3250:
	line	72
	
l6251:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3261
	addwf	(___ftmul@f3_as_product+1),f
u3261:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3262
	addwf	(___ftmul@f3_as_product+2),f
u3262:

	goto	l6253
	
l3637:	
	line	73
	
l6253:	
	movlw	01h
u3275:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3275

	line	74
	
l6255:	
	movlw	01h
u3285:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u3285
	line	75
	
l6257:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3291
	goto	u3290
u3291:
	goto	l6249
u3290:
	goto	l6259
	
l3638:	
	line	76
	
l6259:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l6261
	line	77
	
l3639:	
	line	78
	
l6261:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3301
	goto	u3300
u3301:
	goto	l6265
u3300:
	line	79
	
l6263:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3311
	addwf	(___ftmul@f3_as_product+1),f
u3311:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3312
	addwf	(___ftmul@f3_as_product+2),f
u3312:

	goto	l6265
	
l3640:	
	line	80
	
l6265:	
	movlw	01h
u3325:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3325

	line	81
	
l6267:	
	movlw	01h
u3335:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u3335

	line	82
	
l6269:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3341
	goto	u3340
u3341:
	goto	l6261
u3340:
	goto	l6271
	
l3641:	
	line	83
	
l6271:	
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
	goto	l3634
	
l6273:	
	line	84
	
l3634:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___ftdiv
psect	text567,local,class=CODE,delta=2
global __ptext567
__ptext567:

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 50 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3   14[BANK0 ] float 
;;  f1              3   17[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   25[BANK0 ] float 
;;  sign            1   29[BANK0 ] unsigned char 
;;  exp             1   28[BANK0 ] unsigned char 
;;  cntr            1   24[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   14[BANK0 ] float 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_infrared
;; This function uses a non-reentrant model
;;
psect	text567
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftdiv.c"
	line	50
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
	opt	stack 3
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
l6183:	
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
	goto	u3131
	goto	u3130
u3131:
	goto	l6189
u3130:
	line	56
	
l6185:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l3624
	
l6187:	
	goto	l3624
	
l3623:	
	line	57
	
l6189:	
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
	goto	u3141
	goto	u3140
u3141:
	goto	l6195
u3140:
	line	58
	
l6191:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l3624
	
l6193:	
	goto	l3624
	
l3625:	
	line	59
	
l6195:	
	movlw	0
	movwf	(___ftdiv@f3)
	movlw	0
	movwf	(___ftdiv@f3+1)
	movlw	0
	movwf	(___ftdiv@f3+2)
	line	60
	
l6197:	
	movlw	(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	61
	
l6199:	
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u3155:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u3150:
	addlw	-1
	skipz
	goto	u3155
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	line	62
	
l6201:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u3165:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u3160:
	addlw	-1
	skipz
	goto	u3165
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	xorwf	(___ftdiv@sign),f
	line	63
	
l6203:	
	movlw	(080h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	andwf	(___ftdiv@sign),f
	line	64
	
l6205:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	65
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	66
	
l6207:	
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
	goto	l6209
	line	69
	
l3626:	
	line	70
	
l6209:	
	movlw	01h
u3175:
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	addlw	-1
	skipz
	goto	u3175
	line	71
	
l6211:	
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u3185
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u3185
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u3185:
	skipc
	goto	u3181
	goto	u3180
u3181:
	goto	l6217
u3180:
	line	72
	
l6213:	
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
	
l6215:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	goto	l6217
	line	74
	
l3627:	
	line	75
	
l6217:	
	movlw	01h
u3195:
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	addlw	-1
	skipz
	goto	u3195
	line	76
	
l6219:	
	movlw	low(01h)
	subwf	(___ftdiv@cntr),f
	btfss	status,2
	goto	u3201
	goto	u3200
u3201:
	goto	l6209
u3200:
	goto	l6221
	
l3628:	
	line	77
	
l6221:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___ftdiv)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftdiv+2)
	goto	l3624
	
l6223:	
	line	78
	
l3624:	
	return
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
;; =============== function ___ftdiv ends ============

	signat	___ftdiv,8315
	global	___ftadd
psect	text568,local,class=CODE,delta=2
global __ptext568
__ptext568:

;; *************** function ___ftadd *****************
;; Defined at:
;;		line 87 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftadd.c"
;; Parameters:    Size  Location     Type
;;  f1              3   15[BANK0 ] float 
;;  f2              3   18[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  exp1            1   27[BANK0 ] unsigned char 
;;  exp2            1   26[BANK0 ] unsigned char 
;;  sign            1   25[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   15[BANK0 ] float 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_infrared
;;		___ftsub
;; This function uses a non-reentrant model
;;
psect	text568
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftadd.c"
	line	87
	global	__size_of___ftadd
	__size_of___ftadd	equ	__end_of___ftadd-___ftadd
	
___ftadd:	
	opt	stack 3
; Regs used in ___ftadd: [wreg+status,2+status,0+pclath+cstack]
	line	90
	
l6113:	
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
	
l6115:	
	movf	(___ftadd@exp1),w
	skipz
	goto	u2890
	goto	l6121
u2890:
	
l6117:	
	movf	(___ftadd@exp2),w
	subwf	(___ftadd@exp1),w
	skipnc
	goto	u2901
	goto	u2900
u2901:
	goto	l6125
u2900:
	
l6119:	
	decf	(___ftadd@exp1),w
	xorlw	0ffh
	addwf	(___ftadd@exp2),w
	movwf	(??___ftadd+0)+0
	movlw	(019h)
	subwf	0+(??___ftadd+0)+0,w
	skipc
	goto	u2911
	goto	u2910
u2911:
	goto	l6125
u2910:
	goto	l6121
	
l3581:	
	line	93
	
l6121:	
	movf	(___ftadd@f2),w
	movwf	(?___ftadd)
	movf	(___ftadd@f2+1),w
	movwf	(?___ftadd+1)
	movf	(___ftadd@f2+2),w
	movwf	(?___ftadd+2)
	goto	l3582
	
l6123:	
	goto	l3582
	
l3579:	
	line	94
	
l6125:	
	movf	(___ftadd@exp2),w
	skipz
	goto	u2920
	goto	l3585
u2920:
	
l6127:	
	movf	(___ftadd@exp1),w
	subwf	(___ftadd@exp2),w
	skipnc
	goto	u2931
	goto	u2930
u2931:
	goto	l6131
u2930:
	
l6129:	
	decf	(___ftadd@exp2),w
	xorlw	0ffh
	addwf	(___ftadd@exp1),w
	movwf	(??___ftadd+0)+0
	movlw	(019h)
	subwf	0+(??___ftadd+0)+0,w
	skipc
	goto	u2941
	goto	u2940
u2941:
	goto	l6131
u2940:
	
l3585:	
	line	95
	goto	l3582
	
l3583:	
	line	96
	
l6131:	
	movlw	(06h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	movwf	(___ftadd@sign)
	line	97
	
l6133:	
	btfss	(___ftadd@f1+2),(23)&7
	goto	u2951
	goto	u2950
u2951:
	goto	l3586
u2950:
	line	98
	
l6135:	
	bsf	(___ftadd@sign)+(7/8),(7)&7
	
l3586:	
	line	99
	btfss	(___ftadd@f2+2),(23)&7
	goto	u2961
	goto	u2960
u2961:
	goto	l3587
u2960:
	line	100
	
l6137:	
	bsf	(___ftadd@sign)+(6/8),(6)&7
	
l3587:	
	line	101
	bsf	(___ftadd@f1)+(15/8),(15)&7
	line	102
	
l6139:	
	movlw	0FFh
	andwf	(___ftadd@f1),f
	movlw	0FFh
	andwf	(___ftadd@f1+1),f
	movlw	0
	andwf	(___ftadd@f1+2),f
	line	103
	
l6141:	
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
	goto	u2971
	goto	u2970
u2971:
	goto	l6153
u2970:
	goto	l6143
	line	109
	
l3589:	
	line	110
	
l6143:	
	movlw	01h
u2985:
	clrc
	rlf	(___ftadd@f2),f
	rlf	(___ftadd@f2+1),f
	rlf	(___ftadd@f2+2),f
	addlw	-1
	skipz
	goto	u2985
	line	111
	movlw	low(01h)
	subwf	(___ftadd@exp2),f
	line	112
	
l6145:	
	movf	(___ftadd@exp2),w
	xorwf	(___ftadd@exp1),w
	skipnz
	goto	u2991
	goto	u2990
u2991:
	goto	l6151
u2990:
	
l6147:	
	movlw	low(01h)
	subwf	(___ftadd@sign),f
	movf	((___ftadd@sign)),w
	andlw	07h
	btfss	status,2
	goto	u3001
	goto	u3000
u3001:
	goto	l6143
u3000:
	goto	l6151
	
l3591:	
	goto	l6151
	
l3592:	
	line	113
	goto	l6151
	
l3594:	
	line	114
	
l6149:	
	movlw	01h
u3015:
	clrc
	rrf	(___ftadd@f1+2),f
	rrf	(___ftadd@f1+1),f
	rrf	(___ftadd@f1),f
	addlw	-1
	skipz
	goto	u3015

	line	115
	movlw	(01h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	addwf	(___ftadd@exp1),f
	goto	l6151
	line	116
	
l3593:	
	line	113
	
l6151:	
	movf	(___ftadd@exp1),w
	xorwf	(___ftadd@exp2),w
	skipz
	goto	u3021
	goto	u3020
u3021:
	goto	l6149
u3020:
	goto	l3596
	
l3595:	
	line	117
	goto	l3596
	
l3588:	
	
l6153:	
	movf	(___ftadd@exp1),w
	subwf	(___ftadd@exp2),w
	skipnc
	goto	u3031
	goto	u3030
u3031:
	goto	l3596
u3030:
	goto	l6155
	line	120
	
l3598:	
	line	121
	
l6155:	
	movlw	01h
u3045:
	clrc
	rlf	(___ftadd@f1),f
	rlf	(___ftadd@f1+1),f
	rlf	(___ftadd@f1+2),f
	addlw	-1
	skipz
	goto	u3045
	line	122
	movlw	low(01h)
	subwf	(___ftadd@exp1),f
	line	123
	
l6157:	
	movf	(___ftadd@exp2),w
	xorwf	(___ftadd@exp1),w
	skipnz
	goto	u3051
	goto	u3050
u3051:
	goto	l6163
u3050:
	
l6159:	
	movlw	low(01h)
	subwf	(___ftadd@sign),f
	movf	((___ftadd@sign)),w
	andlw	07h
	btfss	status,2
	goto	u3061
	goto	u3060
u3061:
	goto	l6155
u3060:
	goto	l6163
	
l3600:	
	goto	l6163
	
l3601:	
	line	124
	goto	l6163
	
l3603:	
	line	125
	
l6161:	
	movlw	01h
u3075:
	clrc
	rrf	(___ftadd@f2+2),f
	rrf	(___ftadd@f2+1),f
	rrf	(___ftadd@f2),f
	addlw	-1
	skipz
	goto	u3075

	line	126
	movlw	(01h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	addwf	(___ftadd@exp2),f
	goto	l6163
	line	127
	
l3602:	
	line	124
	
l6163:	
	movf	(___ftadd@exp1),w
	xorwf	(___ftadd@exp2),w
	skipz
	goto	u3081
	goto	u3080
u3081:
	goto	l6161
u3080:
	goto	l3596
	
l3604:	
	goto	l3596
	line	128
	
l3597:	
	line	129
	
l3596:	
	btfss	(___ftadd@sign),(7)&7
	goto	u3091
	goto	u3090
u3091:
	goto	l6167
u3090:
	line	131
	
l6165:	
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
	goto	l6167
	line	133
	
l3605:	
	line	134
	
l6167:	
	btfss	(___ftadd@sign),(6)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l6171
u3100:
	line	136
	
l6169:	
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
	goto	l6171
	line	138
	
l3606:	
	line	139
	
l6171:	
	clrf	(___ftadd@sign)
	line	140
	movf	(___ftadd@f1),w
	addwf	(___ftadd@f2),f
	movf	(___ftadd@f1+1),w
	clrz
	skipnc
	incf	(___ftadd@f1+1),w
	skipnz
	goto	u3111
	addwf	(___ftadd@f2+1),f
u3111:
	movf	(___ftadd@f1+2),w
	clrz
	skipnc
	incf	(___ftadd@f1+2),w
	skipnz
	goto	u3112
	addwf	(___ftadd@f2+2),f
u3112:

	line	141
	
l6173:	
	btfss	(___ftadd@f2+2),(23)&7
	goto	u3121
	goto	u3120
u3121:
	goto	l6179
u3120:
	line	142
	
l6175:	
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
	
l6177:	
	clrf	(___ftadd@sign)
	bsf	status,0
	rlf	(___ftadd@sign),f
	goto	l6179
	line	145
	
l3607:	
	line	146
	
l6179:	
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___ftadd)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftadd+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftadd+2)
	goto	l3582
	
l6181:	
	line	148
	
l3582:	
	return
	opt stack 0
GLOBAL	__end_of___ftadd
	__end_of___ftadd:
;; =============== function ___ftadd ends ============

	signat	___ftadd,8315
	global	_lcd_write_data
psect	text569,local,class=CODE,delta=2
global __ptext569
__ptext569:

;; *************** function _lcd_write_data *****************
;; Defined at:
;;		line 29 in file "E:\Mechatronics Assignment 2\lcd.c"
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
;;		_lcd_write_4_digit_bcd
;;		_lcd_write_2_digit_bcd
;; This function uses a non-reentrant model
;;
psect	text569
	file	"E:\Mechatronics Assignment 2\lcd.c"
	line	29
	global	__size_of_lcd_write_data
	__size_of_lcd_write_data	equ	__end_of_lcd_write_data-_lcd_write_data
	
_lcd_write_data:	
	opt	stack 3
; Regs used in _lcd_write_data: [wreg]
;lcd_write_data@databyte stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_write_data@databyte)
	line	30
	
l6105:	
;lcd.c: 30: RE2 = 0;
	bcf	(74/8),(74)&7
	line	31
;lcd.c: 31: RE1 = 0;
	bcf	(73/8),(73)&7
	line	32
;lcd.c: 32: RE0 = 1;
	bsf	(72/8),(72)&7
	line	33
	
l6107:	
;lcd.c: 33: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	34
	
l6109:	
;lcd.c: 34: RE2 = 1;
	bsf	(74/8),(74)&7
	line	35
	
l6111:	
;lcd.c: 35: RE2 = 0;
	bcf	(74/8),(74)&7
	line	36
;lcd.c: 36: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u3557:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u3557
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u3557
opt asmopt_on

	line	37
	
l2822:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_data
	__end_of_lcd_write_data:
;; =============== function _lcd_write_data ends ============

	signat	_lcd_write_data,4216
	global	_lcd_write_control
psect	text570,local,class=CODE,delta=2
global __ptext570
__ptext570:

;; *************** function _lcd_write_control *****************
;; Defined at:
;;		line 17 in file "E:\Mechatronics Assignment 2\lcd.c"
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
;; This function uses a non-reentrant model
;;
psect	text570
	file	"E:\Mechatronics Assignment 2\lcd.c"
	line	17
	global	__size_of_lcd_write_control
	__size_of_lcd_write_control	equ	__end_of_lcd_write_control-_lcd_write_control
	
_lcd_write_control:	
	opt	stack 3
; Regs used in _lcd_write_control: [wreg]
;lcd_write_control@databyte stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_write_control@databyte)
	line	18
	
l6097:	
;lcd.c: 18: RE2 = 0;
	bcf	(74/8),(74)&7
	line	19
;lcd.c: 19: RE1 = 0;
	bcf	(73/8),(73)&7
	line	20
;lcd.c: 20: RE0 = 0;
	bcf	(72/8),(72)&7
	line	21
	
l6099:	
;lcd.c: 21: PORTD = databyte;
	movf	(lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	22
	
l6101:	
;lcd.c: 22: RE2 = 1;
	bsf	(74/8),(74)&7
	line	23
	
l6103:	
;lcd.c: 23: RE2 = 0;
	bcf	(74/8),(74)&7
	line	24
;lcd.c: 24: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??_lcd_write_control+0)+0),f
u3567:
	decfsz	((??_lcd_write_control+0)+0),f
	goto	u3567
	decfsz	((??_lcd_write_control+0)+0+1),f
	goto	u3567
	nop2
opt asmopt_on

	line	25
	
l2819:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_control
	__end_of_lcd_write_control:
;; =============== function _lcd_write_control ends ============

	signat	_lcd_write_control,4216
	global	_init_adc
psect	text571,local,class=CODE,delta=2
global __ptext571
__ptext571:

;; *************** function _init_adc *****************
;; Defined at:
;;		line 47 in file "E:\Mechatronics Assignment 2\adc.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text571
	file	"E:\Mechatronics Assignment 2\adc.c"
	line	47
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 5
; Regs used in _init_adc: [wreg+status,2]
	line	49
	
l6087:	
;adc.c: 49: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	50
	
l6089:	
;adc.c: 50: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	53
	
l6091:	
;adc.c: 53: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	54
	
l6093:	
;adc.c: 54: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	56
	
l6095:	
;adc.c: 56: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	(??_init_adc+0)+0,f
u3577:
decfsz	(??_init_adc+0)+0,f
	goto	u3577
opt asmopt_on

	line	58
	
l2126:	
	return
	opt stack 0
GLOBAL	__end_of_init_adc
	__end_of_init_adc:
;; =============== function _init_adc ends ============

	signat	_init_adc,88
	global	_adc_read_channel
psect	text572,local,class=CODE,delta=2
global __ptext572
__ptext572:

;; *************** function _adc_read_channel *****************
;; Defined at:
;;		line 6 in file "E:\Mechatronics Assignment 2\adc.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    7[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_adc_read
;; This function is called by:
;;		_infrared
;; This function uses a non-reentrant model
;;
psect	text572
	file	"E:\Mechatronics Assignment 2\adc.c"
	line	6
	global	__size_of_adc_read_channel
	__size_of_adc_read_channel	equ	__end_of_adc_read_channel-_adc_read_channel
	
_adc_read_channel:	
	opt	stack 3
; Regs used in _adc_read_channel: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;adc_read_channel@channel stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(adc_read_channel@channel)
	line	7
	
l6071:	
;adc.c: 7: switch(channel)
	goto	l6079
	line	9
;adc.c: 8: {
;adc.c: 9: case 0:
	
l2116:	
	line	10
;adc.c: 10: CHS0 = 0;
	bcf	(251/8),(251)&7
	line	11
;adc.c: 11: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	12
;adc.c: 12: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	13
;adc.c: 13: break;
	goto	l6081
	line	14
;adc.c: 14: case 1:
	
l2118:	
	line	15
;adc.c: 15: CHS0 = 1;
	bsf	(251/8),(251)&7
	line	16
;adc.c: 16: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	17
;adc.c: 17: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	18
;adc.c: 18: break;
	goto	l6081
	line	19
;adc.c: 19: case 2:
	
l2119:	
	line	20
;adc.c: 20: CHS0 = 0;
	bcf	(251/8),(251)&7
	line	21
;adc.c: 21: CHS1 = 1;
	bsf	(252/8),(252)&7
	line	22
;adc.c: 22: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	23
;adc.c: 23: break;
	goto	l6081
	line	24
;adc.c: 24: case 3:
	
l2120:	
	line	25
;adc.c: 25: CHS0 = 1;
	bsf	(251/8),(251)&7
	line	26
;adc.c: 26: CHS1 = 1;
	bsf	(252/8),(252)&7
	line	27
;adc.c: 27: CHS2 = 0;
	bcf	(253/8),(253)&7
	line	28
;adc.c: 28: break;
	goto	l6081
	line	29
;adc.c: 29: case 4:
	
l2121:	
	line	30
;adc.c: 30: CHS0 = 0;
	bcf	(251/8),(251)&7
	line	31
;adc.c: 31: CHS1 = 0;
	bcf	(252/8),(252)&7
	line	32
;adc.c: 32: CHS2 = 1;
	bsf	(253/8),(253)&7
	line	33
;adc.c: 33: break;
	goto	l6081
	line	36
;adc.c: 36: default:
	
l2122:	
	line	37
	
l6073:	
;adc.c: 37: return 0;
	clrf	(?_adc_read_channel)
	clrf	(?_adc_read_channel+1)
	goto	l2123
	
l6075:	
	goto	l2123
	line	38
	
l6077:	
;adc.c: 38: }
	goto	l6081
	line	7
	
l2115:	
	
l6079:	
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
	goto	l2116
	xorlw	1^0	; case 1
	skipnz
	goto	l2118
	xorlw	2^1	; case 2
	skipnz
	goto	l2119
	xorlw	3^2	; case 3
	skipnz
	goto	l2120
	xorlw	4^3	; case 4
	skipnz
	goto	l2121
	goto	l6073
	opt asmopt_on

	line	38
	
l2117:	
	line	40
	
l6081:	
;adc.c: 40: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u3587:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u3587
opt asmopt_on

	line	42
	
l6083:	
;adc.c: 42: return adc_read();
	fcall	_adc_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_adc_read)),w
	clrf	(?_adc_read_channel+1)
	addwf	(?_adc_read_channel+1)
	movf	(0+(?_adc_read)),w
	clrf	(?_adc_read_channel)
	addwf	(?_adc_read_channel)

	goto	l2123
	
l6085:	
	line	44
	
l2123:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4218
	global	___ftge
psect	text573,local,class=CODE,delta=2
global __ptext573
__ptext573:

;; *************** function ___ftge *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftge.c"
;; Parameters:    Size  Location     Type
;;  ff1             3    0[BANK0 ] float 
;;  ff2             3    3[BANK0 ] float 
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
;;      Params:         0       6       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       6       0       0       0
;;      Totals:         0      12       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_infrared
;; This function uses a non-reentrant model
;;
psect	text573
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftge.c"
	line	5
	global	__size_of___ftge
	__size_of___ftge	equ	__end_of___ftge-___ftge
	
___ftge:	
	opt	stack 4
; Regs used in ___ftge: [wreg+status,2+status,0]
	line	6
	
l6009:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(___ftge@ff1+2),(23)&7
	goto	u2781
	goto	u2780
u2781:
	goto	l6013
u2780:
	line	7
	
l6011:	
	movlw	0
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
	goto	u2791
	goto	u2792
u2791:
	addwf	(??___ftge+0)+1,f
	
u2792:
	movf	2+(??___ftge+3)+0,w
	skipnc
	incfsz	2+(??___ftge+3)+0,w
	goto	u2793
	goto	u2794
u2793:
	addwf	(??___ftge+0)+2,f
	
u2794:
	movf	0+(??___ftge+0)+0,w
	movwf	(___ftge@ff1)
	movf	1+(??___ftge+0)+0,w
	movwf	(___ftge@ff1+1)
	movf	2+(??___ftge+0)+0,w
	movwf	(___ftge@ff1+2)
	goto	l6013
	
l3702:	
	line	8
	
l6013:	
	btfss	(___ftge@ff2+2),(23)&7
	goto	u2801
	goto	u2800
u2801:
	goto	l6017
u2800:
	line	9
	
l6015:	
	movlw	0
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
	goto	u2811
	goto	u2812
u2811:
	addwf	(??___ftge+0)+1,f
	
u2812:
	movf	2+(??___ftge+3)+0,w
	skipnc
	incfsz	2+(??___ftge+3)+0,w
	goto	u2813
	goto	u2814
u2813:
	addwf	(??___ftge+0)+2,f
	
u2814:
	movf	0+(??___ftge+0)+0,w
	movwf	(___ftge@ff2)
	movf	1+(??___ftge+0)+0,w
	movwf	(___ftge@ff2+1)
	movf	2+(??___ftge+0)+0,w
	movwf	(___ftge@ff2+2)
	goto	l6017
	
l3703:	
	line	10
	
l6017:	
	movlw	080h
	xorwf	(___ftge@ff1+2),f
	line	11
	
l6019:	
	movlw	080h
	xorwf	(___ftge@ff2+2),f
	line	12
	
l6021:	
	movf	(___ftge@ff2+2),w
	subwf	(___ftge@ff1+2),w
	skipz
	goto	u2825
	movf	(___ftge@ff2+1),w
	subwf	(___ftge@ff1+1),w
	skipz
	goto	u2825
	movf	(___ftge@ff2),w
	subwf	(___ftge@ff1),w
u2825:
	skipnc
	goto	u2821
	goto	u2820
u2821:
	goto	l6025
u2820:
	
l6023:	
	clrc
	
	goto	l3704
	
l5875:	
	
l6025:	
	setc
	
	goto	l3704
	
l5877:	
	goto	l3704
	
l6027:	
	line	13
	
l3704:	
	return
	opt stack 0
GLOBAL	__end_of___ftge
	__end_of___ftge:
;; =============== function ___ftge ends ============

	signat	___ftge,8312
	global	___ftneg
psect	text574,local,class=CODE,delta=2
global __ptext574
__ptext574:

;; *************** function ___ftneg *****************
;; Defined at:
;;		line 16 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftneg.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    8[BANK0 ] float 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_infrared
;; This function uses a non-reentrant model
;;
psect	text574
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\ftneg.c"
	line	16
	global	__size_of___ftneg
	__size_of___ftneg	equ	__end_of___ftneg-___ftneg
	
___ftneg:	
	opt	stack 4
; Regs used in ___ftneg: [wreg]
	line	17
	
l6001:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftneg@f1+2),w
	iorwf	(___ftneg@f1+1),w
	iorwf	(___ftneg@f1),w
	skipnz
	goto	u2771
	goto	u2770
u2771:
	goto	l6005
u2770:
	line	18
	
l6003:	
	movlw	080h
	xorwf	(___ftneg@f1+2),f
	goto	l6005
	
l3698:	
	line	19
	
l6005:	
	goto	l3699
	
l6007:	
	line	20
	
l3699:	
	return
	opt stack 0
GLOBAL	__end_of___ftneg
	__end_of___ftneg:
;; =============== function ___ftneg ends ============

	signat	___ftneg,4219
	global	___fttol
psect	text575,local,class=CODE,delta=2
global __ptext575
__ptext575:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\fttol.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_infrared
;; This function uses a non-reentrant model
;;
psect	text575
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 4
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l5945:	
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
	goto	u2661
	goto	u2660
u2661:
	goto	l5951
u2660:
	line	50
	
l5947:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l3645
	
l5949:	
	goto	l3645
	
l3644:	
	line	51
	
l5951:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u2675:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u2670:
	addlw	-1
	skipz
	goto	u2675
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l5953:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l5955:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l5957:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l5959:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l5961:	
	btfss	(___fttol@exp1),7
	goto	u2681
	goto	u2680
u2681:
	goto	l5971
u2680:
	line	57
	
l5963:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u2691
	goto	u2690
u2691:
	goto	l5969
u2690:
	line	58
	
l5965:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l3645
	
l5967:	
	goto	l3645
	
l3647:	
	goto	l5969
	line	59
	
l3648:	
	line	60
	
l5969:	
	movlw	01h
u2705:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u2705

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u2711
	goto	u2710
u2711:
	goto	l5969
u2710:
	goto	l5981
	
l3649:	
	line	62
	goto	l5981
	
l3646:	
	line	63
	
l5971:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u2721
	goto	u2720
u2721:
	goto	l5979
u2720:
	line	64
	
l5973:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l3645
	
l5975:	
	goto	l3645
	
l3651:	
	line	65
	goto	l5979
	
l3653:	
	line	66
	
l5977:	
	movlw	01h
	movwf	(??___fttol+0)+0
u2735:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u2735
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	l5979
	line	68
	
l3652:	
	line	65
	
l5979:	
	movf	(___fttol@exp1),f
	skipz
	goto	u2741
	goto	u2740
u2741:
	goto	l5977
u2740:
	goto	l5981
	
l3654:	
	goto	l5981
	line	69
	
l3650:	
	line	70
	
l5981:	
	movf	(___fttol@sign1),w
	skipz
	goto	u2750
	goto	l5985
u2750:
	line	71
	
l5983:	
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
	goto	l5985
	
l3655:	
	line	72
	
l5985:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	l3645
	
l5987:	
	line	73
	
l3645:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text576,local,class=CODE,delta=2
global __ptext576
__ptext576:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftadd
;;		___ftdiv
;;		___ftmul
;;		___awtoft
;;		___lwtoft
;;		___lbtoft
;;		___abtoft
;;		___altoft
;;		___lltoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text576
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 3
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l5909:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftpack@exp),w
	skipz
	goto	u2550
	goto	l5913
u2550:
	
l5911:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u2561
	goto	u2560
u2561:
	goto	l5919
u2560:
	goto	l5913
	
l3869:	
	line	65
	
l5913:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l3870
	
l5915:	
	goto	l3870
	
l3867:	
	line	66
	goto	l5919
	
l3872:	
	line	67
	
l5917:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u2575:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2575

	goto	l5919
	line	69
	
l3871:	
	line	66
	
l5919:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2581
	goto	u2580
u2581:
	goto	l5917
u2580:
	goto	l3874
	
l3873:	
	line	70
	goto	l3874
	
l3875:	
	line	71
	
l5921:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l5923:	
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
	
l5925:	
	movlw	01h
u2595:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2595

	line	74
	
l3874:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2601
	goto	u2600
u2601:
	goto	l5921
u2600:
	goto	l5929
	
l3876:	
	line	75
	goto	l5929
	
l3878:	
	line	76
	
l5927:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u2615:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u2615
	goto	l5929
	line	78
	
l3877:	
	line	75
	
l5929:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u2621
	goto	u2620
u2621:
	goto	l5927
u2620:
	
l3879:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u2631
	goto	u2630
u2631:
	goto	l3880
u2630:
	line	80
	
l5931:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l3880:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l5933:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u2645:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u2640:
	addlw	-1
	skipz
	goto	u2645
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l5935:	
	movf	(___ftpack@sign),w
	skipz
	goto	u2650
	goto	l3881
u2650:
	line	84
	
l5937:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l3881:	
	line	85
	line	86
	
l3870:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	_adc_read
psect	text577,local,class=CODE,delta=2
global __ptext577
__ptext577:

;; *************** function _adc_read *****************
;; Defined at:
;;		line 62 in file "E:\Mechatronics Assignment 2\adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adc_value       2    5[BANK0 ] volatile unsigned int 
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
;;      Temps:          0       3       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_adc_read_channel
;; This function uses a non-reentrant model
;;
psect	text577
	file	"E:\Mechatronics Assignment 2\adc.c"
	line	62
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 3
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	65
	
l5887:	
;adc.c: 63: volatile unsigned int adc_value;
;adc.c: 65: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	67
	
l5889:	
;adc.c: 67: GO = 1;
	bsf	(250/8),(250)&7
	line	68
;adc.c: 68: while(GO) continue;
	goto	l2129
	
l2130:	
	
l2129:	
	btfsc	(250/8),(250)&7
	goto	u2511
	goto	u2510
u2511:
	goto	l2129
u2510:
	goto	l5891
	
l2131:	
	line	74
	
l5891:	
;adc.c: 74: adc_value = ADRESH;
	movf	(30),w	;volatile
	movwf	(??_adc_read+0)+0
	clrf	(??_adc_read+0)+0+1
	movf	0+(??_adc_read+0)+0,w
	movwf	(adc_read@adc_value)	;volatile
	movf	1+(??_adc_read+0)+0,w
	movwf	(adc_read@adc_value+1)	;volatile
	line	75
;adc.c: 75: adc_value <<=2;
	movlw	02h
	
u2525:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u2525
	line	76
	
l5893:	
;adc.c: 76: adc_value |= ADRESL>>6;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_adc_read+0)+0
	movlw	06h
u2535:
	clrc
	rrf	(??_adc_read+0)+0,f
	addlw	-1
	skipz
	goto	u2535
	movf	0+(??_adc_read+0)+0,w
	movwf	(??_adc_read+1)+0
	clrf	(??_adc_read+1)+0+1
	movf	0+(??_adc_read+1)+0,w
	iorwf	(adc_read@adc_value),f	;volatile
	movf	1+(??_adc_read+1)+0,w
	iorwf	(adc_read@adc_value+1),f	;volatile
	line	79
	
l5895:	
;adc.c: 79: return (adc_value);
	movf	(adc_read@adc_value+1),w	;volatile
	clrf	(?_adc_read+1)
	addwf	(?_adc_read+1)
	movf	(adc_read@adc_value),w	;volatile
	clrf	(?_adc_read)
	addwf	(?_adc_read)

	goto	l2132
	
l5897:	
	line	80
	
l2132:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
	global	_init
psect	text578,local,class=CODE,delta=2
global __ptext578
__ptext578:

;; *************** function _init *****************
;; Defined at:
;;		line 4 in file "E:\Mechatronics Assignment 2\initialise.c"
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
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text578
	file	"E:\Mechatronics Assignment 2\initialise.c"
	line	4
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 5
; Regs used in _init: [wreg+status,2]
	line	7
	
l5879:	
;initialise.c: 7: TRISB = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	14
	
l5881:	
;initialise.c: 14: OPTION_REG = 0b00000100;
	movlw	(04h)
	movwf	(129)^080h	;volatile
	line	16
	
l5883:	
;initialise.c: 16: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	20
	
l5885:	
;initialise.c: 20: (GIE = 1);
	bsf	(95/8),(95)&7
	line	21
	
l685:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_isr1
psect	text579,local,class=CODE,delta=2
global __ptext579
__ptext579:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 24 in file "E:\Mechatronics Assignment 2\Main.c"
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
;;      Temps:          4       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwmod
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text579
	file	"E:\Mechatronics Assignment 2\Main.c"
	line	24
	global	__size_of_isr1
	__size_of_isr1	equ	__end_of_isr1-_isr1
	
_isr1:	
	opt	stack 3
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
	movwf	(??_isr1+0)
	movf	fsr0,w
	movwf	(??_isr1+1)
	movf	pclath,w
	movwf	(??_isr1+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_isr1+3)
	ljmp	_isr1
psect	text579
	line	26
	
i1l4661:	
;Main.c: 26: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l1401
u1_20:
	line	28
	
i1l4663:	
;Main.c: 27: {
;Main.c: 28: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	29
	
i1l4665:	
;Main.c: 29: TMR0 = 100;
	movlw	(064h)
	movwf	(1)	;volatile
	line	31
;Main.c: 31: RTC_Counter++;
	movlw	low(01h)
	addwf	(_RTC_Counter),f	;volatile
	skipnc
	incf	(_RTC_Counter+1),f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1),f	;volatile
	line	33
	
i1l4667:	
;Main.c: 33: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	34
	
i1l4669:	
;Main.c: 34: if(RTC_Counter % 10 == 0) RTC_FLAG_10MS = 1;
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
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l4673
u2_20:
	
i1l4671:	
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l4673
	
i1l1397:	
	line	35
	
i1l4673:	
;Main.c: 35: if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
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
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l4677
u3_20:
	
i1l4675:	
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l4677
	
i1l1398:	
	line	36
	
i1l4677:	
;Main.c: 36: if(RTC_Counter % 125 == 0) RTC_FLAG_125MS = 1;
	movlw	low(07Dh)
	movwf	(?___lwmod)
	movlw	high(07Dh)
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
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l4681
u4_20:
	
i1l4679:	
	bsf	(_RTC_FLAG_125MS/8),(_RTC_FLAG_125MS)&7
	goto	i1l4681
	
i1l1399:	
	line	37
	
i1l4681:	
;Main.c: 37: if(RTC_Counter % 500 == 0)
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
	movf	((1+(?___lwmod))),w
	iorwf	((0+(?___lwmod))),w
	skipz
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l1401
u5_20:
	line	39
	
i1l4683:	
;Main.c: 38: {
;Main.c: 39: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	40
	
i1l4685:	
;Main.c: 40: RTC_Counter = 0;
	clrf	(_RTC_Counter)	;volatile
	clrf	(_RTC_Counter+1)	;volatile
	line	41
	
i1l4687:	
;Main.c: 41: RB0 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l1401
	line	42
	
i1l1400:	
	goto	i1l1401
	line	43
	
i1l1396:	
	line	44
	
i1l1401:	
	movf	(??_isr1+3),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(??_isr1+2),w
	movwf	pclath
	movf	(??_isr1+1),w
	movwf	fsr0
	swapf	(??_isr1+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr1
	__end_of_isr1:
;; =============== function _isr1 ends ============

	signat	_isr1,88
	global	___lwmod
psect	text580,local,class=CODE,delta=2
global __ptext580
__ptext580:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[COMMON] unsigned char 
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
psect	text580
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 3
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l4843:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u31_21
	goto	u31_20
u31_21:
	goto	i1l4861
u31_20:
	line	9
	
i1l4845:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	i1l4851
	
i1l3553:	
	line	11
	
i1l4847:	
	movlw	01h
	
u32_25:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u32_25
	line	12
	
i1l4849:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	i1l4851
	line	13
	
i1l3552:	
	line	10
	
i1l4851:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u33_21
	goto	u33_20
u33_21:
	goto	i1l4847
u33_20:
	goto	i1l4853
	
i1l3554:	
	goto	i1l4853
	line	14
	
i1l3555:	
	line	15
	
i1l4853:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u34_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u34_25:
	skipc
	goto	u34_21
	goto	u34_20
u34_21:
	goto	i1l4857
u34_20:
	line	16
	
i1l4855:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	i1l4857
	
i1l3556:	
	line	17
	
i1l4857:	
	movlw	01h
	
u35_25:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u35_25
	line	18
	
i1l4859:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u36_21
	goto	u36_20
u36_21:
	goto	i1l4853
u36_20:
	goto	i1l4861
	
i1l3557:	
	goto	i1l4861
	line	19
	
i1l3551:	
	line	20
	
i1l4861:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	i1l3558
	
i1l4863:	
	line	21
	
i1l3558:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
psect	text581,local,class=CODE,delta=2
global __ptext581
__ptext581:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
