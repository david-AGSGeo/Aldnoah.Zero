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
	FNCALL	_init,_init_adc
	FNCALL	_init,_lcd_init
	FNCALL	_init,_ser_init
	FNCALL	_lcd_init,_lcd_write_control
	FNROOT	_main
	FNCALL	_isr1,___lwmod
	FNCALL	_isr1,_readAvgDistance
	FNCALL	_isr1,_ADCconvert
	FNCALL	_isr1,_ReadButtons
	FNCALL	_ADCconvert,___lwmod
	FNCALL	_ADCconvert,i1_lcd_write_control
	FNCALL	_ADCconvert,_sprintf
	FNCALL	_ADCconvert,_lcd_set_cursor
	FNCALL	_ADCconvert,_lcd_write_string
	FNCALL	_readAvgDistance,_readDistance
	FNCALL	_readAvgDistance,___lwdiv
	FNCALL	_readDistance,_adc_read_channel
	FNCALL	_lcd_write_string,_lcd_write_data
	FNCALL	_lcd_set_cursor,i1_lcd_write_control
	FNCALL	_sprintf,___lwdiv
	FNCALL	_sprintf,___lwmod
	FNCALL	_ReadButtons,_Debounce
	FNCALL	_adc_read_channel,_adc_read
	FNCALL	intlevel1,_isr1
	global	intlevel1
	FNROOT	intlevel1
	global	_current_step
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
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
	global	ADCconvert@F1190
	global	_rxfifo
	global	_txfifo
	global	readAvgDistance@F1184
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
	
STR_1:	
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
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	21
_current_step:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
ADCconvert@F1190:
       ds      16

_rxfifo:
       ds      16

_txfifo:
       ds      16

readAvgDistance@F1184:
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
	movlw	low((__pbssBANK0)+0Eh)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+040h)
	fcall	clear_ram
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
	global	??_init_adc
??_init_adc:	; 0 bytes @ 0x0
	global	??_lcd_write_control
??_lcd_write_control:	; 0 bytes @ 0x0
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
	global	?_ser_init
?_ser_init:	; 0 bytes @ 0x0
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
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
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
	global	?_readDistance
?_readDistance:	; 2 bytes @ 0x8
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x8
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x8
	ds	2
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
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_readAvgDistance
?_readAvgDistance:	; 2 bytes @ 0x0
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x0
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0x0
	ds	2
	global	??_readAvgDistance
??_readAvgDistance:	; 0 bytes @ 0x2
	ds	3
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0x5
	ds	1
	global	readAvgDistance@adcOutput
readAvgDistance@adcOutput:	; 16 bytes @ 0x6
	ds	2
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
	ds	6
	global	readAvgDistance@averageval
readAvgDistance@averageval:	; 2 bytes @ 0x16
	ds	2
	global	readAvgDistance@fullval
readAvgDistance@fullval:	; 2 bytes @ 0x18
	ds	2
	global	readAvgDistance@i
readAvgDistance@i:	; 2 bytes @ 0x1A
	ds	2
	global	?_ADCconvert
?_ADCconvert:	; 0 bytes @ 0x1C
	global	ADCconvert@adcVal
ADCconvert@adcVal:	; 2 bytes @ 0x1C
	ds	2
	global	??_ADCconvert
??_ADCconvert:	; 0 bytes @ 0x1E
	ds	4
	global	ADCconvert@adcOutput
ADCconvert@adcOutput:	; 16 bytes @ 0x22
	ds	16
	global	ADCconvert@distance
ADCconvert@distance:	; 2 bytes @ 0x32
	ds	2
	global	??_isr1
??_isr1:	; 0 bytes @ 0x34
	ds	5
;;Data sizes: Strings 15, constant 10, data 1, bss 78, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     57      74
;; BANK1           80      3      67
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_readDistance	unsigned int  size(1) Largest target is 0
;;
;; ?_readAvgDistance	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?_adc_read	unsigned int  size(1) Largest target is 0
;;
;; sprintf@f	PTR const unsigned char  size(1) Largest target is 15
;;		 -> STR_1(CODE[15]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;;		 -> ADCconvert@adcOutput(BANK0[16]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK0[2]), 
;;
;; S6328$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; lcd_write_string@s	PTR unsigned char  size(1) Largest target is 16
;;		 -> ADCconvert@adcOutput(BANK0[16]), 
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
;;   _readAvgDistance->_readDistance
;;   _readDistance->_adc_read_channel
;;   _lcd_write_string->_lcd_write_data
;;   _lcd_set_cursor->i1_lcd_write_control
;;   _sprintf->___lwmod
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
;;   _isr1->_ADCconvert
;;   _ADCconvert->_readAvgDistance
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
;; (0) _main                                                 0     0      0      22
;;                               _init
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
;; (2) _ser_init                                             1     1      0       0
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _isr1                                                 5     5      0    2581
;;                                             52 BANK0      5     5      0
;;                            ___lwmod
;;                    _readAvgDistance
;;                         _ADCconvert
;;                        _ReadButtons
;; ---------------------------------------------------------------------------------
;; (5) _ADCconvert                                          24    22      2    2097
;;                                             28 BANK0     24    22      2
;;                            ___lwmod
;;                i1_lcd_write_control
;;                            _sprintf
;;                     _lcd_set_cursor
;;                   _lcd_write_string
;;                    _readAvgDistance (ARG)
;; ---------------------------------------------------------------------------------
;; (5) _readAvgDistance                                     28    26      2     325
;;                                              0 BANK0     28    26      2
;;                       _readDistance
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (6) _readDistance                                         6     4      2      69
;;                                              8 COMMON     6     4      2
;;                   _adc_read_channel
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
;; (6) _sprintf                                             17    12      5     798
;;                                              0 BANK0     17    12      5
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
;;
;; _isr1 (ROOT)
;;   ___lwmod
;;     ___lwdiv (ARG)
;;   _readAvgDistance
;;     _readDistance
;;       _adc_read_channel
;;         _adc_read
;;     ___lwdiv
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
;;       _readDistance
;;         _adc_read_channel
;;           _adc_read
;;       ___lwdiv
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
;;BANK1               50      3      43       7       83.8%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      A8      12        0.0%
;;ABS                  0      0      9B       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       D       2        0.0%
;;BANK0               50     39      4A       5       92.5%
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
;;		line 137 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	137
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	142
	
l8640:	
;Main.c: 142: init();
	fcall	_init
	goto	l8664
	line	148
;Main.c: 148: while(1)
	
l2165:	
	line	151
;Main.c: 149: {
;Main.c: 151: switch (buttonPressed)
	goto	l8664
	line	153
;Main.c: 152: {
;Main.c: 153: case 1:
	
l2167:	
	line	154
	
l8642:	
;Main.c: 154: RB1 ^= 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	155
	
l8644:	
;Main.c: 155: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	156
;Main.c: 156: break;
	goto	l8664
	line	157
;Main.c: 157: case 2:
	
l2169:	
	line	158
	
l8646:	
;Main.c: 158: RB1 ^= 0x01;
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	159
	
l8648:	
;Main.c: 159: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	160
;Main.c: 160: break;
	goto	l8664
	line	161
;Main.c: 161: case 3:
	
l2170:	
	line	162
	
l8650:	
;Main.c: 162: RB1 ^= 0x01;
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	163
	
l8652:	
;Main.c: 163: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	164
;Main.c: 164: break;
	goto	l8664
	line	165
;Main.c: 165: case 4:
	
l2171:	
	line	166
	
l8654:	
;Main.c: 166: RB1 ^= 0x01;
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	167
	
l8656:	
;Main.c: 167: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	168
;Main.c: 168: break;
	goto	l8664
	line	169
;Main.c: 169: case 5:
	
l2172:	
	line	170
	
l8658:	
;Main.c: 170: RB1 ^= 0x01;
	movlw	1<<((49)&7)
	xorwf	((49)/8),f
	line	171
	
l8660:	
;Main.c: 171: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	172
;Main.c: 172: break;
	goto	l8664
	line	173
;Main.c: 173: default:
	
l2173:	
	line	175
;Main.c: 175: break;
	goto	l8664
	line	176
	
l8662:	
;Main.c: 176: }
	goto	l8664
	line	151
	
l2166:	
	
l8664:	
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
	goto	l8642
	xorlw	2^1	; case 2
	skipnz
	goto	l8646
	xorlw	3^2	; case 3
	skipnz
	goto	l8650
	xorlw	4^3	; case 4
	skipnz
	goto	l8654
	xorlw	5^4	; case 5
	skipnz
	goto	l8658
	goto	l8664
	opt asmopt_on

	line	176
	
l2168:	
	goto	l8664
	line	241
	
l2174:	
	line	148
	goto	l8664
	
l2175:	
	line	242
	
l2176:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_init
psect	text532,local,class=CODE,delta=2
global __ptext532
__ptext532:

;; *************** function _init *****************
;; Defined at:
;;		line 108 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text532
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	108
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 0
; Regs used in _init: [wreg+status,2+status,0+pclath+cstack]
	line	109
	
l8630:	
;Main.c: 109: init_adc();
	fcall	_init_adc
	line	110
;Main.c: 110: lcd_init();
	fcall	_lcd_init
	line	111
;Main.c: 111: ser_init();
	fcall	_ser_init
	line	113
	
l8632:	
;Main.c: 113: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	119
	
l8634:	
;Main.c: 119: OPTION_REG = 0b00000100;
	movlw	(04h)
	movwf	(129)^080h	;volatile
	line	122
	
l8636:	
;Main.c: 122: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	125
	
l8638:	
;Main.c: 125: (GIE = 1);
	bsf	(95/8),(95)&7
	line	126
	
l2162:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_lcd_init
psect	text533,local,class=CODE,delta=2
global __ptext533
__ptext533:

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
psect	text533
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 0
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l8610:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l8612:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l8614:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l8616:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l8618:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l8620:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l8622:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l8624:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l8626:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l8628:	
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
psect	text534,local,class=CODE,delta=2
global __ptext534
__ptext534:

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
psect	text534
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
	
l8602:	
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
	
l8604:	
;lcd.c: 22: PORTD = databyte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_control@databyte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	23
	
l8606:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l8608:	
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
u4057:
	decfsz	((??_lcd_write_control+0)^080h+0),f
	goto	u4057
	decfsz	((??_lcd_write_control+0)^080h+0+1),f
	goto	u4057
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
psect	text535,local,class=CODE,delta=2
global __ptext535
__ptext535:

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
psect	text535
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	46
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 1
; Regs used in _init_adc: [wreg+status,2]
	line	48
	
l8592:	
;adc.c: 48: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	49
	
l8594:	
;adc.c: 49: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	52
	
l8596:	
;adc.c: 52: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	53
	
l8598:	
;adc.c: 53: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	55
	
l8600:	
;adc.c: 55: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_init_adc+0)^080h+0,f
u4067:
decfsz	(??_init_adc+0)^080h+0,f
	goto	u4067
opt asmopt_on

	line	57
	
l700:	
	return
	opt stack 0
GLOBAL	__end_of_init_adc
	__end_of_init_adc:
;; =============== function _init_adc ends ============

	signat	_init_adc,88
	global	_ser_init
psect	text536,local,class=CODE,delta=2
global __ptext536
__ptext536:

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
psect	text536
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 1
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l8268:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l8270:	
;ser.c: 115: TRISC &= 0b10111111;
	movlw	(0BFh)
	movwf	(??_ser_init+0)^080h+0
	movf	(??_ser_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	116
	
l8272:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l8274:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l8276:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l8278:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l8280:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l8282:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l8284:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l8286:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l8288:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l8290:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l8292:	
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
	
l4361:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_isr1
psect	text537,local,class=CODE,delta=2
global __ptext537
__ptext537:

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
;;		_ADCconvert
;;		_ReadButtons
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text537
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
psect	text537
	line	77
	
i1l8072:	
;Main.c: 77: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	btfss	(101/8),(101)&7
	goto	u313_21
	goto	u313_20
u313_21:
	goto	i1l8082
u313_20:
	
i1l8074:	
	movf	(26),w	;volatile
	movwf	(??_isr1+0)+0
	movf	(_rxiptr),w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	movf	(??_isr1+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
i1l8076:	
	movf	(_rxiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_ser_tmp)
	
i1l8078:	
	movf	(_ser_tmp),w
	xorwf	(_rxoptr),w	;volatile
	skipnz
	goto	u314_21
	goto	u314_20
u314_21:
	goto	i1l8082
u314_20:
	
i1l8080:	
	movf	(_ser_tmp),w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)	;volatile
	goto	i1l8082
	
i1l2151:	
	goto	i1l8082
	
i1l2150:	
	
i1l8082:	
	btfss	(100/8),(100)&7
	goto	u315_21
	goto	u315_20
u315_21:
	goto	i1l2152
u315_20:
	
i1l8084:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u316_21
	goto	u316_20
u316_21:
	goto	i1l2152
u316_20:
	
i1l8086:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_txoptr),w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(25)	;volatile
	
i1l8088:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	addwf	(_txoptr),f	;volatile
	
i1l8090:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr),f	;volatile
	
i1l8092:	
	movf	(_txoptr),w	;volatile
	xorwf	(_txiptr),w	;volatile
	skipz
	goto	u317_21
	goto	u317_20
u317_21:
	goto	i1l2152
u317_20:
	
i1l8094:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2152
	
i1l2153:	
	
i1l2152:	
	line	79
;Main.c: 79: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u318_21
	goto	u318_20
u318_21:
	goto	i1l2159
u318_20:
	line	81
	
i1l8096:	
;Main.c: 80: {
;Main.c: 81: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	82
	
i1l8098:	
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
	
i1l8100:	
;Main.c: 86: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	87
	
i1l8102:	
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
	goto	u319_21
	goto	u319_20
u319_21:
	goto	i1l8106
u319_20:
	
i1l8104:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l8106
	
i1l2155:	
	line	88
	
i1l8106:	
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
	goto	u320_21
	goto	u320_20
u320_21:
	goto	i1l8110
u320_20:
	
i1l8108:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l8110
	
i1l2156:	
	line	89
	
i1l8110:	
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
	goto	u321_21
	goto	u321_20
u321_21:
	goto	i1l8116
u321_20:
	line	91
	
i1l8112:	
;Main.c: 90: {
;Main.c: 91: ADCconvert(readAvgDistance());
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
	line	93
	
i1l8114:	
;Main.c: 93: RTC_FLAG_250MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l8116
	line	95
	
i1l2157:	
	line	96
	
i1l8116:	
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
	goto	u322_21
	goto	u322_20
u322_21:
	goto	i1l8124
u322_20:
	line	98
	
i1l8118:	
;Main.c: 97: {
;Main.c: 98: RTC_FLAG_500MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	99
	
i1l8120:	
;Main.c: 99: RTC_Counter = 0;
	clrf	(_RTC_Counter)	;volatile
	clrf	(_RTC_Counter+1)	;volatile
	line	100
	
i1l8122:	
;Main.c: 100: RB0 ^= 0x01;
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l8124
	line	101
	
i1l2158:	
	line	103
	
i1l8124:	
;Main.c: 101: }
;Main.c: 103: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_buttonPressed)	;volatile
	goto	i1l2159
	line	104
	
i1l2154:	
	line	105
	
i1l2159:	
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
psect	text538,local,class=CODE,delta=2
global __ptext538
__ptext538:

;; *************** function _ADCconvert *****************
;; Defined at:
;;		line 33 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;  adcVal          2   28[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  adcOutput      16   34[BANK0 ] unsigned char [16]
;;  distance        2   50[BANK0 ] unsigned int 
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
psect	text538
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	33
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [allreg]
	line	34
	
i1l8148:	
;infrared.c: 34: char adcOutput[16] = "";
	movlw	(ADCconvert@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(ADCconvert@F1190)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADCconvert+0)+0
	movf	fsr0,w
	movwf	((??_ADCconvert+0)+0+1)
	movlw	16
	movwf	((??_ADCconvert+0)+0+2)
u326_20:
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
	goto	u326_20
	line	36
	
i1l8150:	
;infrared.c: 35: unsigned int distance;
;infrared.c: 36: if (adcVal > 250)
	movlw	high(0FBh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0FBh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u327_21
	goto	u327_20
u327_21:
	goto	i1l8154
u327_20:
	line	38
	
i1l8152:	
;infrared.c: 37: {
;infrared.c: 38: distance = 20;
	movlw	low(014h)
	movwf	(ADCconvert@distance)
	movlw	high(014h)
	movwf	((ADCconvert@distance))+1
	line	39
;infrared.c: 39: }
	goto	i1l2886
	line	40
	
i1l2885:	
	
i1l8154:	
;infrared.c: 40: else if (adcVal < 250 && adcVal >= 190)
	movlw	high(0FAh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0FAh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u328_21
	goto	u328_20
u328_21:
	goto	i1l8160
u328_20:
	
i1l8156:	
	movlw	high(0BEh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0BEh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u329_21
	goto	u329_20
u329_21:
	goto	i1l8160
u329_20:
	line	42
	
i1l8158:	
;infrared.c: 41: {
;infrared.c: 42: distance = 20+ (adcVal%100) ;
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
	line	43
;infrared.c: 43: }
	goto	i1l2886
	line	44
	
i1l2887:	
	
i1l8160:	
;infrared.c: 44: else if (adcVal < 190 && adcVal >= 96)
	movlw	high(0BEh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0BEh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l8166
u330_20:
	
i1l8162:	
	movlw	high(060h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(060h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u331_21
	goto	u331_20
u331_21:
	goto	i1l8166
u331_20:
	line	46
	
i1l8164:	
;infrared.c: 45: {
;infrared.c: 46: distance = 30+ (adcVal%100) ;
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
	line	47
;infrared.c: 47: }
	goto	i1l2886
	line	48
	
i1l2889:	
	
i1l8166:	
;infrared.c: 48: else if (adcVal < 190 && adcVal >= 96)
	movlw	high(0BEh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(0BEh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u332_21
	goto	u332_20
u332_21:
	goto	i1l8172
u332_20:
	
i1l8168:	
	movlw	high(060h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(060h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u333_21
	goto	u333_20
u333_21:
	goto	i1l8172
u333_20:
	line	50
	
i1l8170:	
;infrared.c: 49: {
;infrared.c: 50: distance = 40+ (adcVal%100) ;
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
	line	51
;infrared.c: 51: }
	goto	i1l2886
	line	52
	
i1l2891:	
	
i1l8172:	
;infrared.c: 52: else if (adcVal < 115 && adcVal >= 96)
	movlw	high(073h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(073h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u334_21
	goto	u334_20
u334_21:
	goto	i1l8178
u334_20:
	
i1l8174:	
	movlw	high(060h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(060h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u335_21
	goto	u335_20
u335_21:
	goto	i1l8178
u335_20:
	line	54
	
i1l8176:	
;infrared.c: 53: {
;infrared.c: 54: distance = 50+ (adcVal%100) ;
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
	line	55
;infrared.c: 55: }
	goto	i1l2886
	line	56
	
i1l2893:	
	
i1l8178:	
;infrared.c: 56: else if (adcVal < 96 && adcVal >= 82)
	movlw	high(060h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(060h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u336_21
	goto	u336_20
u336_21:
	goto	i1l8184
u336_20:
	
i1l8180:	
	movlw	high(052h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(052h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u337_21
	goto	u337_20
u337_21:
	goto	i1l8184
u337_20:
	line	58
	
i1l8182:	
;infrared.c: 57: {
;infrared.c: 58: distance = 60+ (adcVal%100) ;
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
	line	59
;infrared.c: 59: }
	goto	i1l2886
	line	60
	
i1l2895:	
	
i1l8184:	
;infrared.c: 60: else if (adcVal < 82 && adcVal >= 70)
	movlw	high(052h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(052h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u338_21
	goto	u338_20
u338_21:
	goto	i1l8190
u338_20:
	
i1l8186:	
	movlw	high(046h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(046h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l8190
u339_20:
	line	62
	
i1l8188:	
;infrared.c: 61: {
;infrared.c: 62: distance = 70+ (adcVal%100) ;
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
	line	63
;infrared.c: 63: }
	goto	i1l2886
	line	64
	
i1l2897:	
	
i1l8190:	
;infrared.c: 64: else if (adcVal < 70 && adcVal >= 64)
	movlw	high(046h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(046h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u340_21
	goto	u340_20
u340_21:
	goto	i1l8196
u340_20:
	
i1l8192:	
	movlw	high(040h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(040h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u341_21
	goto	u341_20
u341_21:
	goto	i1l8196
u341_20:
	line	66
	
i1l8194:	
;infrared.c: 65: {
;infrared.c: 66: distance = 80+ (adcVal%100) ;
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
	line	67
;infrared.c: 67: }
	goto	i1l2886
	line	68
	
i1l2899:	
	
i1l8196:	
;infrared.c: 68: else if (adcVal < 64 && adcVal >= 56)
	movlw	high(040h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(040h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u342_21
	goto	u342_20
u342_21:
	goto	i1l8202
u342_20:
	
i1l8198:	
	movlw	high(038h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(038h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u343_21
	goto	u343_20
u343_21:
	goto	i1l8202
u343_20:
	line	70
	
i1l8200:	
;infrared.c: 69: {
;infrared.c: 70: distance = 90+ (adcVal%100) ;
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
	line	71
;infrared.c: 71: }
	goto	i1l2886
	line	72
	
i1l2901:	
	
i1l8202:	
;infrared.c: 72: else if (adcVal < 56 && adcVal >= 45)
	movlw	high(038h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(038h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l8208
u344_20:
	
i1l8204:	
	movlw	high(02Dh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(02Dh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u345_21
	goto	u345_20
u345_21:
	goto	i1l8208
u345_20:
	line	74
	
i1l8206:	
;infrared.c: 73: {
;infrared.c: 74: distance = 100+ (adcVal%100) ;
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
	line	75
;infrared.c: 75: }
	goto	i1l2886
	line	76
	
i1l2903:	
	
i1l8208:	
;infrared.c: 76: else if (adcVal < 45 && adcVal >= 40)
	movlw	high(02Dh)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(02Dh)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u346_21
	goto	u346_20
u346_21:
	goto	i1l8214
u346_20:
	
i1l8210:	
	movlw	high(028h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(028h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u347_21
	goto	u347_20
u347_21:
	goto	i1l8214
u347_20:
	line	78
	
i1l8212:	
;infrared.c: 77: {
;infrared.c: 78: distance = 110+ (adcVal%100) ;
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
	line	79
;infrared.c: 79: }
	goto	i1l2886
	line	80
	
i1l2905:	
	
i1l8214:	
;infrared.c: 80: else if (adcVal < 40 && adcVal >= 33)
	movlw	high(028h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(028h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l8220
u348_20:
	
i1l8216:	
	movlw	high(021h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(021h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipc
	goto	u349_21
	goto	u349_20
u349_21:
	goto	i1l8220
u349_20:
	line	82
	
i1l8218:	
;infrared.c: 81: {
;infrared.c: 82: distance = 120+ (adcVal%100) ;
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
	line	83
;infrared.c: 83: }
	goto	i1l2886
	line	84
	
i1l2907:	
	
i1l8220:	
;infrared.c: 84: else if (adcVal < 33 )
	movlw	high(021h)
	subwf	(ADCconvert@adcVal+1),w
	movlw	low(021h)
	skipnz
	subwf	(ADCconvert@adcVal),w
	skipnc
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l2886
u350_20:
	line	86
	
i1l8222:	
;infrared.c: 85: {
;infrared.c: 86: distance = 130 + (adcVal%100) ;
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
	goto	i1l2886
	line	87
	
i1l2909:	
	goto	i1l2886
	line	91
	
i1l2908:	
	goto	i1l2886
	
i1l2906:	
	goto	i1l2886
	
i1l2904:	
	goto	i1l2886
	
i1l2902:	
	goto	i1l2886
	
i1l2900:	
	goto	i1l2886
	
i1l2898:	
	goto	i1l2886
	
i1l2896:	
	goto	i1l2886
	
i1l2894:	
	goto	i1l2886
	
i1l2892:	
	goto	i1l2886
	
i1l2890:	
	goto	i1l2886
	
i1l2888:	
	
i1l2886:	
;infrared.c: 87: }
;infrared.c: 91: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	i1_lcd_write_control
	line	92
	
i1l8224:	
;infrared.c: 92: sprintf(adcOutput,"ADC:%d Dist:%d",adcVal, distance);
	movlw	((STR_1-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ADCconvert+0)+0
	movf	(??_ADCconvert+0)+0,w
	movwf	(?_sprintf)
	movf	(ADCconvert@adcVal+1),w
	clrf	1+(?_sprintf)+01h
	addwf	1+(?_sprintf)+01h
	movf	(ADCconvert@adcVal),w
	clrf	0+(?_sprintf)+01h
	addwf	0+(?_sprintf)+01h

	movf	(ADCconvert@distance+1),w
	clrf	1+(?_sprintf)+03h
	addwf	1+(?_sprintf)+03h
	movf	(ADCconvert@distance),w
	clrf	0+(?_sprintf)+03h
	addwf	0+(?_sprintf)+03h

	movlw	(ADCconvert@adcOutput)&0ffh
	fcall	_sprintf
	line	93
	
i1l8226:	
;infrared.c: 93: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	94
	
i1l8228:	
;infrared.c: 94: lcd_write_string(adcOutput);
	movlw	(ADCconvert@adcOutput)&0ffh
	fcall	_lcd_write_string
	line	95
	
i1l2910:	
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,4216
	global	_readAvgDistance
psect	text539,local,class=CODE,delta=2
global __ptext539
__ptext539:

;; *************** function _readAvgDistance *****************
;; Defined at:
;;		line 10 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   26[BANK0 ] int 
;;  adcOutput      16    6[BANK0 ] unsigned char [16]
;;  fullval         2   24[BANK0 ] unsigned int 
;;  averageval      2   22[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_readDistance
;;		___lwdiv
;; This function is called by:
;;		_isr1
;; This function uses a non-reentrant model
;;
psect	text539
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	10
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [allreg]
	line	11
	
i1l8126:	
;infrared.c: 11: unsigned int fullval = 0, averageval;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(readAvgDistance@fullval)
	clrf	(readAvgDistance@fullval+1)
	line	12
	
i1l8128:	
;infrared.c: 12: char adcOutput[16] = "";
	movlw	(readAvgDistance@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(readAvgDistance@F1184)
	movwf	(??_readAvgDistance+0)+0
	movf	fsr0,w
	movwf	((??_readAvgDistance+0)+0+1)
	movlw	16
	movwf	((??_readAvgDistance+0)+0+2)
u323_20:
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
	goto	u323_20
	line	14
	
i1l8130:	
;infrared.c: 14: for (int i = 0; i < 10; i++)
	clrf	(readAvgDistance@i)
	clrf	(readAvgDistance@i+1)
	
i1l8132:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u324_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u324_25:

	skipc
	goto	u324_21
	goto	u324_20
u324_21:
	goto	i1l8136
u324_20:
	goto	i1l8142
	
i1l8134:	
	goto	i1l8142
	line	15
	
i1l2875:	
	line	16
	
i1l8136:	
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
	
i1l8138:	
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
i1l8140:	
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u325_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u325_25:

	skipc
	goto	u325_21
	goto	u325_20
u325_21:
	goto	i1l8136
u325_20:
	goto	i1l8142
	
i1l2876:	
	line	19
	
i1l8142:	
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
	
i1l8144:	
;infrared.c: 20: return averageval;
	movf	(readAvgDistance@averageval+1),w
	clrf	(?_readAvgDistance+1)
	addwf	(?_readAvgDistance+1)
	movf	(readAvgDistance@averageval),w
	clrf	(?_readAvgDistance)
	addwf	(?_readAvgDistance)

	goto	i1l2877
	
i1l8146:	
	line	21
	
i1l2877:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,90
	global	_readDistance
psect	text540,local,class=CODE,delta=2
global __ptext540
__ptext540:

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
psect	text540
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	24
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	27
	
i1l8294:	
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
	
i1l8296:	
;infrared.c: 29: return fullval;
	movf	(readDistance@fullval+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@fullval),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

	goto	i1l2880
	
i1l8298:	
	line	30
	
i1l2880:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_lcd_write_string
psect	text541,local,class=CODE,delta=2
global __ptext541
__ptext541:

;; *************** function _lcd_write_string *****************
;; Defined at:
;;		line 48 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR unsigned char 
;;		 -> ADCconvert@adcOutput(16), 
;; Auto vars:     Size  Location     Type
;;  s               1    4[COMMON] PTR unsigned char 
;;		 -> ADCconvert@adcOutput(16), 
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
;; This function uses a non-reentrant model
;;
psect	text541
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
	
i1l8038:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	i1l8044
	
i1l1403:	
	
i1l8040:	
	movf	(lcd_write_string@s),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_lcd_write_data
	
i1l8042:	
	movlw	(01h)
	movwf	(??_lcd_write_string+0)+0
	movf	(??_lcd_write_string+0)+0,w
	addwf	(lcd_write_string@s),f
	goto	i1l8044
	
i1l1402:	
	
i1l8044:	
	movf	(lcd_write_string@s),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,f
	skipz
	goto	u309_21
	goto	u309_20
u309_21:
	goto	i1l8040
u309_20:
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
psect	text542,local,class=CODE,delta=2
global __ptext542
__ptext542:

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
;; This function uses a non-reentrant model
;;
psect	text542
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
	
i1l8034:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
i1l8036:	
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
psect	text543,local,class=CODE,delta=2
global __ptext543
__ptext543:

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
psect	text543
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
	
i1l8584:	
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
	
i1l8586:	
;lcd.c: 22: PORTD = databyte;
	movf	(i1lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
i1l8588:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
i1l8590:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??i1_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??i1_lcd_write_control+0)+0),f
u407_27:
	decfsz	((??i1_lcd_write_control+0)+0),f
	goto	u407_27
	decfsz	((??i1_lcd_write_control+0)+0+1),f
	goto	u407_27
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
psect	text544,local,class=CODE,delta=2
global __ptext544
__ptext544:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> ADCconvert@adcOutput(16), 
;;  f               1    0[BANK0 ] PTR const unsigned char 
;;		 -> STR_1(15), 
;; Auto vars:     Size  Location     Type
;;  sp              1   15[BANK0 ] PTR unsigned char 
;;		 -> ADCconvert@adcOutput(16), 
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
;;		_ADCconvert
;; This function uses a non-reentrant model
;;
psect	text544
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
	
i1l8300:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	i1l8352
	
i1l5109:	
	line	542
	
i1l8302:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u356_21
	goto	u356_20
u356_21:
	goto	i1l5110
u356_20:
	line	545
	
i1l8304:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l8306:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	i1l8352
	line	547
	
i1l5110:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	i1l8310
	line	640
	
i1l5112:	
	line	641
	goto	i1l8354
	line	700
	
i1l5114:	
	goto	i1l8312
	line	701
	
i1l5115:	
	line	702
	goto	i1l8312
	line	805
	
i1l5117:	
	line	816
	goto	i1l8352
	line	825
	
i1l8308:	
	goto	i1l8312
	line	638
	
i1l5111:	
	
i1l8310:	
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
	goto	i1l8354
	xorlw	100^0	; case 100
	skipnz
	goto	i1l8312
	xorlw	105^100	; case 105
	skipnz
	goto	i1l8312
	goto	i1l8352
	opt asmopt_on

	line	825
	
i1l5116:	
	line	1254
	
i1l8312:	
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
i1l8314:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
i1l8316:	
	btfss	(sprintf@_val+1),7
	goto	u357_21
	goto	u357_20
u357_21:
	goto	i1l8322
u357_20:
	line	1257
	
i1l8318:	
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
i1l8320:	
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
	goto	i1l8322
	line	1259
	
i1l5118:	
	line	1300
	
i1l8322:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
i1l8324:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u358_21
	goto	u358_20
u358_21:
	goto	i1l8328
u358_20:
	goto	i1l8336
	
i1l8326:	
	goto	i1l8336
	line	1301
	
i1l5119:	
	
i1l8328:	
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
	goto	u359_25
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u359_25:
	skipnc
	goto	u359_21
	goto	u359_20
u359_21:
	goto	i1l8332
u359_20:
	goto	i1l8336
	line	1302
	
i1l8330:	
	goto	i1l8336
	
i1l5121:	
	line	1300
	
i1l8332:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
i1l8334:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u360_21
	goto	u360_20
u360_21:
	goto	i1l8328
u360_20:
	goto	i1l8336
	
i1l5120:	
	line	1433
	
i1l8336:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u361_21
	goto	u361_20
u361_21:
	goto	i1l8342
u361_20:
	line	1434
	
i1l8338:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l8340:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l8342
	
i1l5122:	
	line	1467
	
i1l8342:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	i1l8350
	
i1l5124:	
	line	1484
	
i1l8344:	
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
	
i1l8346:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l8348:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	i1l8350
	line	1517
	
i1l5123:	
	line	1469
	
i1l8350:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u362_21
	goto	u362_20
u362_21:
	goto	i1l8344
u362_20:
	goto	i1l8352
	
i1l5125:	
	goto	i1l8352
	line	1525
	
i1l5108:	
	line	540
	
i1l8352:	
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
	goto	u363_21
	goto	u363_20
u363_21:
	goto	i1l8302
u363_20:
	goto	i1l8354
	
i1l5126:	
	goto	i1l8354
	line	1527
	
i1l5113:	
	line	1530
	
i1l8354:	
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	i1l5127
	line	1532
	
i1l8356:	
	line	1533
;	Return value of _sprintf is never used
	
i1l5127:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ReadButtons
psect	text545,local,class=CODE,delta=2
global __ptext545
__ptext545:

;; *************** function _ReadButtons *****************
;; Defined at:
;;		line 116 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
psect	text545
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	116
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 2
; Regs used in _ReadButtons: [wreg+status,2+status,0+pclath+cstack]
	line	117
	
i1l8230:	
;HMI.c: 117: Debounce();
	fcall	_Debounce
	line	119
	
i1l8232:	
;HMI.c: 119: if(UpPressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u351_21
	goto	u351_20
u351_21:
	goto	i1l5094
u351_20:
	line	121
	
i1l8234:	
;HMI.c: 120: {
;HMI.c: 121: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	122
	
i1l8236:	
;HMI.c: 122: return 1;
	movlw	(01h)
	goto	i1l5095
	
i1l8238:	
	goto	i1l5095
	line	124
	
i1l5094:	
	line	126
;HMI.c: 124: }
;HMI.c: 126: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l5096
u352_20:
	line	128
	
i1l8240:	
;HMI.c: 127: {
;HMI.c: 128: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	129
	
i1l8242:	
;HMI.c: 129: return 2;
	movlw	(02h)
	goto	i1l5095
	
i1l8244:	
	goto	i1l5095
	line	131
	
i1l5096:	
	line	132
;HMI.c: 131: }
;HMI.c: 132: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u353_21
	goto	u353_20
u353_21:
	goto	i1l5097
u353_20:
	line	134
	
i1l8246:	
;HMI.c: 133: {
;HMI.c: 134: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	135
	
i1l8248:	
;HMI.c: 135: return 3;
	movlw	(03h)
	goto	i1l5095
	
i1l8250:	
	goto	i1l5095
	line	137
	
i1l5097:	
	line	138
;HMI.c: 137: }
;HMI.c: 138: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l5098
u354_20:
	line	140
	
i1l8252:	
;HMI.c: 139: {
;HMI.c: 140: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	141
	
i1l8254:	
;HMI.c: 141: return 4;
	movlw	(04h)
	goto	i1l5095
	
i1l8256:	
	goto	i1l5095
	line	143
	
i1l5098:	
	line	145
;HMI.c: 143: }
;HMI.c: 145: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l8264
u355_20:
	line	147
	
i1l8258:	
;HMI.c: 146: {
;HMI.c: 147: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	148
	
i1l8260:	
;HMI.c: 148: return 5;
	movlw	(05h)
	goto	i1l5095
	
i1l8262:	
	goto	i1l5095
	line	150
	
i1l5099:	
	line	151
	
i1l8264:	
;HMI.c: 150: }
;HMI.c: 151: return 0;
	movlw	(0)
	goto	i1l5095
	
i1l8266:	
	line	152
	
i1l5095:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
	global	_lcd_write_data
psect	text546,local,class=CODE,delta=2
global __ptext546
__ptext546:

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
psect	text546
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
	
i1l8026:	
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
	
i1l8028:	
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
i1l8030:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
i1l8032:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
u408_27:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u408_27
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u408_27
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
psect	text547,local,class=CODE,delta=2
global __ptext547
__ptext547:

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
psect	text547
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
	
i1l8000:	
;adc.c: 6: switch(channel)
	goto	i1l8008
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
	goto	i1l8010
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
	goto	i1l8010
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
	goto	i1l8010
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
	goto	i1l8010
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
	goto	i1l8010
	line	35
;adc.c: 35: default:
	
i1l696:	
	line	36
	
i1l8002:	
;adc.c: 36: return 0;
	movlw	(0)
	goto	i1l697
	
i1l8004:	
	goto	i1l697
	line	37
	
i1l8006:	
;adc.c: 37: }
	goto	i1l8010
	line	6
	
i1l689:	
	
i1l8008:	
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
	goto	i1l8002
	opt asmopt_on

	line	37
	
i1l691:	
	line	39
	
i1l8010:	
;adc.c: 39: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
u409_27:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u409_27
opt asmopt_on

	line	41
	
i1l8012:	
;adc.c: 41: return adc_read();
	fcall	_adc_read
	movf	(0+(?_adc_read)),w
	goto	i1l697
	
i1l8014:	
	line	43
	
i1l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___lwmod
psect	text548,local,class=CODE,delta=2
global __ptext548
__ptext548:

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
psect	text548
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l8562:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u399_21
	goto	u399_20
u399_21:
	goto	i1l8580
u399_20:
	line	9
	
i1l8564:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	i1l8570
	
i1l5828:	
	line	11
	
i1l8566:	
	movlw	01h
	
u400_25:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u400_25
	line	12
	
i1l8568:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	i1l8570
	line	13
	
i1l5827:	
	line	10
	
i1l8570:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u401_21
	goto	u401_20
u401_21:
	goto	i1l8566
u401_20:
	goto	i1l8572
	
i1l5829:	
	goto	i1l8572
	line	14
	
i1l5830:	
	line	15
	
i1l8572:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u402_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u402_25:
	skipc
	goto	u402_21
	goto	u402_20
u402_21:
	goto	i1l8576
u402_20:
	line	16
	
i1l8574:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	i1l8576
	
i1l5831:	
	line	17
	
i1l8576:	
	movlw	01h
	
u403_25:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u403_25
	line	18
	
i1l8578:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u404_21
	goto	u404_20
u404_21:
	goto	i1l8572
u404_20:
	goto	i1l8580
	
i1l5832:	
	goto	i1l8580
	line	19
	
i1l5826:	
	line	20
	
i1l8580:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	i1l5833
	
i1l8582:	
	line	21
	
i1l5833:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text549,local,class=CODE,delta=2
global __ptext549
__ptext549:

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
psect	text549
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
i1l8536:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
i1l8538:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l8558
u392_20:
	line	11
	
i1l8540:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	i1l8546
	
i1l5818:	
	line	13
	
i1l8542:	
	movlw	01h
	
u393_25:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u393_25
	line	14
	
i1l8544:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	i1l8546
	line	15
	
i1l5817:	
	line	12
	
i1l8546:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u394_21
	goto	u394_20
u394_21:
	goto	i1l8542
u394_20:
	goto	i1l8548
	
i1l5819:	
	goto	i1l8548
	line	16
	
i1l5820:	
	line	17
	
i1l8548:	
	movlw	01h
	
u395_25:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u395_25
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u396_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u396_25:
	skipc
	goto	u396_21
	goto	u396_20
u396_21:
	goto	i1l8554
u396_20:
	line	19
	
i1l8550:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
i1l8552:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l8554
	line	21
	
i1l5821:	
	line	22
	
i1l8554:	
	movlw	01h
	
u397_25:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u397_25
	line	23
	
i1l8556:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u398_21
	goto	u398_20
u398_21:
	goto	i1l8548
u398_20:
	goto	i1l8558
	
i1l5822:	
	goto	i1l8558
	line	24
	
i1l5816:	
	line	25
	
i1l8558:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	i1l5823
	
i1l8560:	
	line	26
	
i1l5823:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_Debounce
psect	text550,local,class=CODE,delta=2
global __ptext550
__ptext550:

;; *************** function _Debounce *****************
;; Defined at:
;;		line 36 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
psect	text550
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	36
	global	__size_of_Debounce
	__size_of_Debounce	equ	__end_of_Debounce-_Debounce
	
_Debounce:	
	opt	stack 2
; Regs used in _Debounce: [wreg+status,2+status,0]
	line	38
	
i1l8494:	
;HMI.c: 38: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u377_21
	goto	u377_20
u377_21:
	goto	i1l5076
u377_20:
	line	40
	
i1l8496:	
;HMI.c: 39: {
;HMI.c: 40: UpDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_UpDebounceCount),f	;volatile
	line	41
	
i1l8498:	
;HMI.c: 41: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount),w	;volatile
	skipc
	goto	u378_21
	goto	u378_20
u378_21:
	goto	i1l5078
u378_20:
	
i1l8500:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u379_21
	goto	u379_20
u379_21:
	goto	i1l5078
u379_20:
	line	43
	
i1l8502:	
;HMI.c: 42: {
;HMI.c: 43: UpPressed = 1;
	bsf	(_UpPressed/8),(_UpPressed)&7
	line	44
;HMI.c: 44: UpReleased = 0;
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l5078
	line	45
	
i1l5077:	
	line	46
;HMI.c: 45: }
;HMI.c: 46: }
	goto	i1l5078
	line	47
	
i1l5076:	
	line	49
;HMI.c: 47: else
;HMI.c: 48: {
;HMI.c: 49: UpDebounceCount = 0;
	clrf	(_UpDebounceCount)	;volatile
	line	50
;HMI.c: 50: UpReleased = 1;
	bsf	(_UpReleased/8),(_UpReleased)&7
	line	51
	
i1l5078:	
	line	54
;HMI.c: 51: }
;HMI.c: 54: if(!RB3)
	btfsc	(51/8),(51)&7
	goto	u380_21
	goto	u380_20
u380_21:
	goto	i1l5079
u380_20:
	line	56
	
i1l8504:	
;HMI.c: 55: {
;HMI.c: 56: DownDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_DownDebounceCount),f	;volatile
	line	57
	
i1l8506:	
;HMI.c: 57: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount),w	;volatile
	skipc
	goto	u381_21
	goto	u381_20
u381_21:
	goto	i1l5081
u381_20:
	
i1l8508:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u382_21
	goto	u382_20
u382_21:
	goto	i1l5081
u382_20:
	line	59
	
i1l8510:	
;HMI.c: 58: {
;HMI.c: 59: DownPressed = 1;
	bsf	(_DownPressed/8),(_DownPressed)&7
	line	60
;HMI.c: 60: DownReleased = 0;
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l5081
	line	61
	
i1l5080:	
	line	62
;HMI.c: 61: }
;HMI.c: 62: }
	goto	i1l5081
	line	63
	
i1l5079:	
	line	65
;HMI.c: 63: else
;HMI.c: 64: {
;HMI.c: 65: DownDebounceCount = 0;
	clrf	(_DownDebounceCount)	;volatile
	line	66
;HMI.c: 66: DownReleased = 1;
	bsf	(_DownReleased/8),(_DownReleased)&7
	line	67
	
i1l5081:	
	line	69
;HMI.c: 67: }
;HMI.c: 69: if(!RB4)
	btfsc	(52/8),(52)&7
	goto	u383_21
	goto	u383_20
u383_21:
	goto	i1l5082
u383_20:
	line	71
	
i1l8512:	
;HMI.c: 70: {
;HMI.c: 71: LeftDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_LeftDebounceCount),f	;volatile
	line	72
	
i1l8514:	
;HMI.c: 72: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount),w	;volatile
	skipc
	goto	u384_21
	goto	u384_20
u384_21:
	goto	i1l5084
u384_20:
	
i1l8516:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u385_21
	goto	u385_20
u385_21:
	goto	i1l5084
u385_20:
	line	74
	
i1l8518:	
;HMI.c: 73: {
;HMI.c: 74: LeftPressed = 1;
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	line	75
;HMI.c: 75: LeftReleased = 0;
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l5084
	line	76
	
i1l5083:	
	line	77
;HMI.c: 76: }
;HMI.c: 77: }
	goto	i1l5084
	line	78
	
i1l5082:	
	line	80
;HMI.c: 78: else
;HMI.c: 79: {
;HMI.c: 80: LeftDebounceCount = 0;
	clrf	(_LeftDebounceCount)	;volatile
	line	81
;HMI.c: 81: LeftReleased = 1;
	bsf	(_LeftReleased/8),(_LeftReleased)&7
	line	82
	
i1l5084:	
	line	84
;HMI.c: 82: }
;HMI.c: 84: if(!RB5)
	btfsc	(53/8),(53)&7
	goto	u386_21
	goto	u386_20
u386_21:
	goto	i1l5085
u386_20:
	line	86
	
i1l8520:	
;HMI.c: 85: {
;HMI.c: 86: RightDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_RightDebounceCount),f	;volatile
	line	87
	
i1l8522:	
;HMI.c: 87: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount),w	;volatile
	skipc
	goto	u387_21
	goto	u387_20
u387_21:
	goto	i1l5087
u387_20:
	
i1l8524:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u388_21
	goto	u388_20
u388_21:
	goto	i1l5087
u388_20:
	line	89
	
i1l8526:	
;HMI.c: 88: {
;HMI.c: 89: RightPressed = 1;
	bsf	(_RightPressed/8),(_RightPressed)&7
	line	90
;HMI.c: 90: RightReleased = 0;
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l5087
	line	91
	
i1l5086:	
	line	92
;HMI.c: 91: }
;HMI.c: 92: }
	goto	i1l5087
	line	93
	
i1l5085:	
	line	95
;HMI.c: 93: else
;HMI.c: 94: {
;HMI.c: 95: RightDebounceCount = 0;
	clrf	(_RightDebounceCount)	;volatile
	line	96
;HMI.c: 96: RightReleased = 1;
	bsf	(_RightReleased/8),(_RightReleased)&7
	line	97
	
i1l5087:	
	line	99
;HMI.c: 97: }
;HMI.c: 99: if(!RB6)
	btfsc	(54/8),(54)&7
	goto	u389_21
	goto	u389_20
u389_21:
	goto	i1l5088
u389_20:
	line	101
	
i1l8528:	
;HMI.c: 100: {
;HMI.c: 101: CenterDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_CenterDebounceCount),f	;volatile
	line	102
	
i1l8530:	
;HMI.c: 102: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount),w	;volatile
	skipc
	goto	u390_21
	goto	u390_20
u390_21:
	goto	i1l5091
u390_20:
	
i1l8532:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u391_21
	goto	u391_20
u391_21:
	goto	i1l5091
u391_20:
	line	104
	
i1l8534:	
;HMI.c: 103: {
;HMI.c: 104: CenterPressed = 1;
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	line	105
;HMI.c: 105: CenterReleased = 0;
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l5091
	line	106
	
i1l5089:	
	line	107
;HMI.c: 106: }
;HMI.c: 107: }
	goto	i1l5091
	line	108
	
i1l5088:	
	line	110
;HMI.c: 108: else
;HMI.c: 109: {
;HMI.c: 110: CenterDebounceCount = 0;
	clrf	(_CenterDebounceCount)	;volatile
	line	111
;HMI.c: 111: CenterReleased = 1;
	bsf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l5091
	line	112
	
i1l5090:	
	line	113
	
i1l5091:	
	return
	opt stack 0
GLOBAL	__end_of_Debounce
	__end_of_Debounce:
;; =============== function _Debounce ends ============

	signat	_Debounce,88
	global	_adc_read
psect	text551,local,class=CODE,delta=2
global __ptext551
__ptext551:

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
psect	text551
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	64
	
i1l8016:	
;adc.c: 62: volatile unsigned int adc_value;
;adc.c: 64: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	66
	
i1l8018:	
;adc.c: 66: GO = 1;
	bsf	(250/8),(250)&7
	line	67
;adc.c: 67: while(GO) continue;
	goto	i1l703
	
i1l704:	
	
i1l703:	
	btfsc	(250/8),(250)&7
	goto	u307_21
	goto	u307_20
u307_21:
	goto	i1l703
u307_20:
	
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
psect	text551
	line	73
	
i1l8020:	
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
	
u308_25:
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u308_25
	line	75
;adc.c: 75: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	78
	
i1l8022:	
;adc.c: 78: return (adc_value);
	movf	(adc_read@adc_value+1),w	;volatile
	clrf	(?_adc_read+1)
	addwf	(?_adc_read+1)
	movf	(adc_read@adc_value),w	;volatile
	clrf	(?_adc_read)
	addwf	(?_adc_read)

	goto	i1l706
	
i1l8024:	
	line	79
	
i1l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
psect	text552,local,class=CODE,delta=2
global __ptext552
__ptext552:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
