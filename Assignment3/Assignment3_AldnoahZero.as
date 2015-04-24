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
	FNCALL	_main,_Menu
	FNCALL	_main,_calibrateIR
	FNCALL	_main,_scan360
	FNCALL	_main,_rotate
	FNCALL	_main,_robotMove
	FNCALL	_main,_robotTurn
	FNCALL	_scan360,_readAvgDistance
	FNCALL	_scan360,_rotate
	FNCALL	_scan360,_UpdateDisplay
	FNCALL	_init,_init_adc
	FNCALL	_init,_lcd_init
	FNCALL	_init,_ser_init
	FNCALL	_init,_robo_init
	FNCALL	_UpdateDisplay,_lcd_write_control
	FNCALL	_UpdateDisplay,_sprintf
	FNCALL	_UpdateDisplay,_lcd_set_cursor
	FNCALL	_UpdateDisplay,_lcd_write_string
	FNCALL	_UpdateDisplay,___awmod
	FNCALL	_readAvgDistance,_readDistance
	FNCALL	_readAvgDistance,___lwdiv
	FNCALL	_readAvgDistance,_ADCconvert
	FNCALL	_readDistance,_adc_read_channel
	FNCALL	_calibrateIR,_rotate
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
	FNCALL	_isr1,i1_readAvgDistance
	FNCALL	_isr1,i1_UpdateDisplay
	FNCALL	_isr1,_ReadButtons
	FNCALL	i1_UpdateDisplay,i1_lcd_write_control
	FNCALL	i1_UpdateDisplay,i1_sprintf
	FNCALL	i1_UpdateDisplay,i1_lcd_set_cursor
	FNCALL	i1_UpdateDisplay,i1_lcd_write_string
	FNCALL	i1_UpdateDisplay,i1___awmod
	FNCALL	i1_readAvgDistance,i1_readDistance
	FNCALL	i1_readAvgDistance,i1___lwdiv
	FNCALL	i1_readAvgDistance,i1_ADCconvert
	FNCALL	i1_readDistance,i1_adc_read_channel
	FNCALL	i1_lcd_write_string,i1_lcd_write_data
	FNCALL	i1_lcd_set_cursor,i1_lcd_write_control
	FNCALL	i1_sprintf,i1___lwdiv
	FNCALL	i1_sprintf,i1___lwmod
	FNCALL	i1_ADCconvert,i1___wmul
	FNCALL	i1_ADCconvert,i1___lwdiv
	FNCALL	i1_adc_read_channel,i1_adc_read
	FNCALL	_ReadButtons,_Debounce
	FNCALL	intlevel1,_isr1
	global	intlevel1
	FNROOT	intlevel1
	global	_current_step
	global	_menuStrings
	global	_shortMenuStrings
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	30

;initializer for _current_step
	retlw	03Ch
psect	idataBANK3,class=CODE,space=0,delta=2
global __pidataBANK3
__pidataBANK3:
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
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
	global	_dist_high
	global	_dist_low
	global	_distance
	global	_total
	global	_CenterDebounceCount
	global	_DownDebounceCount
	global	_LeftDebounceCount
	global	_RightDebounceCount
	global	_SCAN_FLAG
	global	_UpDebounceCount
	global	_buttonPressed
	global	_currentMenu
	global	_current_direction
	global	_rxiptr
	global	_rxoptr
	global	_ser_tmp
	global	_serialInput
	global	_turnhighByte
	global	_turnlowByte
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
	global	UpdateDisplay@F1223
	global	_rxfifo
	global	_txfifo
	global	_totalSteps
	global	_adcVal
	global	_pos
	global	_test
	global	_highByte
	global	_lowByte
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

_dist_high:
       ds      2

_dist_low:
       ds      2

_distance:
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

_SCAN_FLAG:
       ds      1

_UpDebounceCount:
       ds      1

_buttonPressed:
       ds      1

_currentMenu:
       ds      1

_current_direction:
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

_txiptr:
       ds      1

_txoptr:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	30
_current_step:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_adcVal:
       ds      2

_pos:
       ds      2

_test:
       ds      2

_highByte:
       ds      1

_lowByte:
       ds      1

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
UpdateDisplay@F1223:
       ds      16

_rxfifo:
       ds      16

_txfifo:
       ds      16

_totalSteps:
       ds      2

psect	dataBANK3,class=BANK3,space=1
global __pdataBANK3
__pdataBANK3:
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	32
_menuStrings:
       ds      5

psect	dataBANK3
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
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
	movlw	low((__pbssBANK0)+01Bh)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+08h)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+032h)
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
; Initialize objects allocated to BANK3
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK3
	movlw low(__pdataBANK3+10)
	movwf btemp-1,f
	movlw high(__pidataBANK3)
	movwf btemp,f
	movlw low(__pidataBANK3)
	movwf btemp+1,f
	movlw low(__pdataBANK3)
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
	global	??_lcd_write_data
??_lcd_write_data:	; 0 bytes @ 0x0
	global	??_spi_transfer
??_spi_transfer:	; 0 bytes @ 0x0
	global	??_ser_putch
??_ser_putch:	; 0 bytes @ 0x0
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
	global	rotate@direction
rotate@direction:	; 1 bytes @ 0x3
	ds	1
	global	??_rotate
??_rotate:	; 0 bytes @ 0x4
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
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	??_adc_read_channel
??_adc_read_channel:	; 0 bytes @ 0x6
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x6
	global	rotate@steps
rotate@steps:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x6
	ds	1
	global	?_lcd_write_string
?_lcd_write_string:	; 0 bytes @ 0x7
	global	adc_read_channel@channel
adc_read_channel@channel:	; 1 bytes @ 0x7
	global	rotate@i
rotate@i:	; 1 bytes @ 0x7
	global	lcd_write_string@s
lcd_write_string@s:	; 2 bytes @ 0x7
	ds	1
	global	??_calibrateIR
??_calibrateIR:	; 0 bytes @ 0x8
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
	global	?i1_lcd_write_data
?i1_lcd_write_data:	; 0 bytes @ 0x0
	global	??i1_lcd_write_data
??i1_lcd_write_data:	; 0 bytes @ 0x0
	global	?i1_lcd_set_cursor
?i1_lcd_set_cursor:	; 0 bytes @ 0x0
	global	?i1_readAvgDistance
?i1_readAvgDistance:	; 0 bytes @ 0x0
	global	?i1_ADCconvert
?i1_ADCconvert:	; 0 bytes @ 0x0
	global	?i1_UpdateDisplay
?i1_UpdateDisplay:	; 0 bytes @ 0x0
	global	?_ReadButtons
?_ReadButtons:	; 1 bytes @ 0x0
	global	?_Menu
?_Menu:	; 1 bytes @ 0x0
	global	?_adc_read_channel
?_adc_read_channel:	; 1 bytes @ 0x0
	global	?_spi_transfer
?_spi_transfer:	; 1 bytes @ 0x0
	global	?i1_adc_read_channel
?i1_adc_read_channel:	; 1 bytes @ 0x0
	global	?i1_adc_read
?i1_adc_read:	; 2 bytes @ 0x0
	global	?i1___wmul
?i1___wmul:	; 2 bytes @ 0x0
	global	?i1___awmod
?i1___awmod:	; 2 bytes @ 0x0
	global	UpdateDisplay@serialInput
UpdateDisplay@serialInput:	; 1 bytes @ 0x0
	global	i1___wmul@multiplier
i1___wmul@multiplier:	; 2 bytes @ 0x0
	global	i1___awmod@divisor
i1___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_ReadButtons
??_ReadButtons:	; 0 bytes @ 0x1
	ds	1
	global	??i1_adc_read
??i1_adc_read:	; 0 bytes @ 0x2
	global	i1lcd_write_control@databyte
i1lcd_write_control@databyte:	; 1 bytes @ 0x2
	global	i1lcd_write_data@databyte
i1lcd_write_data@databyte:	; 1 bytes @ 0x2
	global	i1___wmul@multiplicand
i1___wmul@multiplicand:	; 2 bytes @ 0x2
	global	i1___awmod@dividend
i1___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??i1_lcd_set_cursor
??i1_lcd_set_cursor:	; 0 bytes @ 0x3
	global	i1lcd_set_cursor@address
i1lcd_set_cursor@address:	; 1 bytes @ 0x3
	ds	1
	global	??i1___wmul
??i1___wmul:	; 0 bytes @ 0x4
	global	??i1___awmod
??i1___awmod:	; 0 bytes @ 0x4
	global	i1adc_read@adc_value
i1adc_read@adc_value:	; 2 bytes @ 0x4
	global	i1___wmul@product
i1___wmul@product:	; 2 bytes @ 0x4
	ds	1
	global	i1___awmod@counter
i1___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	??i1_adc_read_channel
??i1_adc_read_channel:	; 0 bytes @ 0x6
	global	?i1___lwdiv
?i1___lwdiv:	; 2 bytes @ 0x6
	global	i1___awmod@sign
i1___awmod@sign:	; 1 bytes @ 0x6
	global	i1___lwdiv@divisor
i1___lwdiv@divisor:	; 2 bytes @ 0x6
	ds	1
	global	?i1_lcd_write_string
?i1_lcd_write_string:	; 0 bytes @ 0x7
	global	i1adc_read_channel@channel
i1adc_read_channel@channel:	; 1 bytes @ 0x7
	global	i1lcd_write_string@s
i1lcd_write_string@s:	; 2 bytes @ 0x7
	ds	1
	global	?i1_readDistance
?i1_readDistance:	; 2 bytes @ 0x8
	global	i1___lwdiv@dividend
i1___lwdiv@dividend:	; 2 bytes @ 0x8
	ds	1
	global	??i1_lcd_write_string
??i1_lcd_write_string:	; 0 bytes @ 0x9
	ds	1
	global	??i1_readDistance
??i1_readDistance:	; 0 bytes @ 0xA
	global	??i1___lwdiv
??i1___lwdiv:	; 0 bytes @ 0xA
	ds	1
	global	i1___lwdiv@counter
i1___lwdiv@counter:	; 1 bytes @ 0xB
	ds	1
	global	i1readDistance@fullval
i1readDistance@fullval:	; 2 bytes @ 0xC
	global	i1___lwdiv@quotient
i1___lwdiv@quotient:	; 2 bytes @ 0xC
	ds	2
	global	??i1_readAvgDistance
??i1_readAvgDistance:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??i1_ADCconvert
??i1_ADCconvert:	; 0 bytes @ 0x0
	global	?i1___lwmod
?i1___lwmod:	; 2 bytes @ 0x0
	global	i1___lwmod@divisor
i1___lwmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	i1readAvgDistance@fullval
i1readAvgDistance@fullval:	; 2 bytes @ 0x2
	global	i1___lwmod@dividend
i1___lwmod@dividend:	; 2 bytes @ 0x2
	ds	2
	global	??i1___lwmod
??i1___lwmod:	; 0 bytes @ 0x4
	global	i1readAvgDistance@i
i1readAvgDistance@i:	; 2 bytes @ 0x4
	ds	1
	global	i1___lwmod@counter
i1___lwmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	?i1_sprintf
?i1_sprintf:	; 2 bytes @ 0x6
	global	i1sprintf@f
i1sprintf@f:	; 1 bytes @ 0x6
	ds	5
	global	??i1_sprintf
??i1_sprintf:	; 0 bytes @ 0xB
	ds	3
	global	i1sprintf@ap
i1sprintf@ap:	; 1 bytes @ 0xE
	ds	1
	global	i1sprintf@flag
i1sprintf@flag:	; 1 bytes @ 0xF
	ds	1
	global	i1sprintf@prec
i1sprintf@prec:	; 1 bytes @ 0x10
	ds	1
	global	i1sprintf@_val
i1sprintf@_val:	; 4 bytes @ 0x11
	ds	4
	global	i1sprintf@sp
i1sprintf@sp:	; 1 bytes @ 0x15
	ds	1
	global	i1sprintf@c
i1sprintf@c:	; 1 bytes @ 0x16
	ds	1
	global	??i1_UpdateDisplay
??i1_UpdateDisplay:	; 0 bytes @ 0x17
	ds	5
	global	i1UpdateDisplay@adcOutput
i1UpdateDisplay@adcOutput:	; 16 bytes @ 0x1C
	ds	16
	global	??_isr1
??_isr1:	; 0 bytes @ 0x2C
	ds	5
;;Data sizes: Strings 95, constant 10, data 11, bss 85, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     49      79
;; BANK1           80     72      80
;; BANK3           96      0      60
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; i1sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?i1_sprintf(BANK0[2]), 
;;
;; ?i1___awmod	int  size(1) Largest target is 0
;;
;; i1sprintf@f	PTR const unsigned char  size(1) Largest target is 15
;;		 -> STR_12(CODE[15]), STR_11(CODE[15]), 
;;
;; ?i1_sprintf	int  size(1) Largest target is 0
;;
;; i1sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;;		 -> i1UpdateDisplay@adcOutput(BANK0[16]), 
;;
;; ?i1___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?i1_readDistance	unsigned int  size(1) Largest target is 0
;;
;; ?i1___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; i1lcd_write_string@s	PTR unsigned char  size(2) Largest target is 16
;;		 -> i1UpdateDisplay@adcOutput(BANK0[16]), STR_15(CODE[4]), STR_14(CODE[8]), STR_13(CODE[4]), 
;;		 -> STR_10(CODE[4]), STR_9(CODE[4]), STR_8(CODE[4]), STR_7(CODE[4]), 
;;		 -> STR_6(CODE[4]), STR_5(CODE[9]), STR_4(CODE[8]), STR_3(CODE[9]), 
;;		 -> STR_2(CODE[9]), STR_1(CODE[9]), 
;;
;; ?i1_adc_read	unsigned int  size(1) Largest target is 0
;;
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
;;		 -> STR_12(CODE[15]), STR_11(CODE[15]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 16
;;		 -> UpdateDisplay@adcOutput(BANK1[16]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(BANK1[2]), 
;;
;; S8114$_cp	PTR const unsigned char  size(1) Largest target is 0
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
;;		 -> STR_15(CODE[4]), STR_14(CODE[8]), STR_13(CODE[4]), UpdateDisplay@adcOutput(BANK1[16]), 
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
;;   i1_readAvgDistance->i1_readDistance
;;   i1_readAvgDistance->i1___lwdiv
;;   i1_readDistance->i1_adc_read_channel
;;   i1_lcd_write_string->i1___awmod
;;   i1_lcd_set_cursor->i1_lcd_write_control
;;   i1_sprintf->i1___lwdiv
;;   i1_ADCconvert->i1___lwdiv
;;   i1_adc_read_channel->i1_adc_read
;;   _ReadButtons->_Debounce
;;   i1___lwmod->i1___lwdiv
;;   i1___lwdiv->i1___wmul
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _isr1 in BANK0
;;
;;   _isr1->i1_UpdateDisplay
;;   i1_UpdateDisplay->i1_sprintf
;;   i1_readAvgDistance->i1_ADCconvert
;;   i1_sprintf->i1___lwmod
;;
;; Critical Paths under _main in BANK1
;;
;;   _main->_scan360
;;   _scan360->_UpdateDisplay
;;   _UpdateDisplay->_sprintf
;;   _readAvgDistance->_ADCconvert
;;   _readDistance->_adc_read_channel
;;   _calibrateIR->_rotate
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
;; (0) _main                                                 6     6      0    2625
;;                                             66 BANK1      6     6      0
;;                               _init
;;                               _Menu
;;                        _calibrateIR
;;                            _scan360
;;                             _rotate
;;                          _robotMove
;;                          _robotTurn
;; ---------------------------------------------------------------------------------
;; (1) _scan360                                              8     6      2    2138
;;                                             58 BANK1      8     6      2
;;                    _readAvgDistance
;;                             _rotate
;;                      _UpdateDisplay
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 1     1      0      44
;;                                              3 BANK1      1     1      0
;;                           _init_adc
;;                           _lcd_init
;;                           _ser_init
;;                          _robo_init
;; ---------------------------------------------------------------------------------
;; (2) _UpdateDisplay                                       22    22      0    1347
;;                                             37 BANK1     21    21      0
;;                  _lcd_write_control
;;                            _sprintf
;;                     _lcd_set_cursor
;;                   _lcd_write_string
;;                            ___awmod
;; ---------------------------------------------------------------------------------
;; (2) _readAvgDistance                                      4     4      0     555
;;                                             16 BANK1      4     4      0
;;                       _readDistance
;;                            ___lwdiv
;;                         _ADCconvert
;; ---------------------------------------------------------------------------------
;; (3) _readDistance                                         6     4      2      69
;;                                              8 BANK1      6     4      2
;;                   _adc_read_channel
;; ---------------------------------------------------------------------------------
;; (1) _calibrateIR                                          0     0      0      98
;;                             _rotate
;; ---------------------------------------------------------------------------------
;; (2) _lcd_init                                             0     0      0      22
;;                  _lcd_write_control
;; ---------------------------------------------------------------------------------
;; (3) _lcd_write_string                                     2     0      2      67
;;                                              7 BANK1      2     0      2
;;                     _lcd_write_data
;;                            ___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (3) _lcd_set_cursor                                       1     1      0      45
;;                                              3 BANK1      1     1      0
;;                  _lcd_write_control
;; ---------------------------------------------------------------------------------
;; (3) _sprintf                                             17    12      5     798
;;                                             20 BANK1     17    12      5
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (3) _ADCconvert                                           2     2      0     254
;;                                             14 BANK1      2     2      0
;;                             ___wmul
;;                            ___lwdiv
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
;; (4) _lcd_write_data                                       3     3      0      22
;;                                              0 BANK1      3     3      0
;; ---------------------------------------------------------------------------------
;; (4) _lcd_write_control                                    3     3      0      22
;;                                              0 BANK1      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _init_adc                                             1     1      0       0
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (4) _adc_read_channel                                     2     2      0      46
;;                                              6 BANK1      2     2      0
;;                           _adc_read
;; ---------------------------------------------------------------------------------
;; (3) ___awmod                                              7     3      4     296
;;                                              0 BANK1      7     3      4
;; ---------------------------------------------------------------------------------
;; (4) ___lwmod                                              6     2      4     159
;;                                             14 BANK1      6     2      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (4) ___lwdiv                                              8     4      4     162
;;                                              6 BANK1      8     4      4
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (4) ___wmul                                               6     2      4      92
;;                                              0 BANK1      6     2      4
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
;; (5) _adc_read                                             6     4      2      24
;;                                              0 BANK1      6     4      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (6) _isr1                                                 5     5      0    6643
;;                                             44 BANK0      5     5      0
;;                          i1___lwmod
;;                  i1_readAvgDistance
;;                    i1_UpdateDisplay
;;                        _ReadButtons
;; ---------------------------------------------------------------------------------
;; (7) i1_UpdateDisplay                                     22    22      0    4316
;;                                             23 BANK0     21    21      0
;;                i1_lcd_write_control
;;                          i1_sprintf
;;                   i1_lcd_set_cursor
;;                 i1_lcd_write_string
;;                          i1___awmod
;; ---------------------------------------------------------------------------------
;; (7) i1_readAvgDistance                                    4     4      0    1806
;;                                              2 BANK0      4     4      0
;;                     i1_readDistance
;;                          i1___lwdiv
;;                       i1_ADCconvert
;; ---------------------------------------------------------------------------------
;; (8) i1_readDistance                                       6     4      2     225
;;                                              8 COMMON     6     4      2
;;                 i1_adc_read_channel
;; ---------------------------------------------------------------------------------
;; (8) i1_lcd_write_string                                   2     0      2     221
;;                                              7 COMMON     2     0      2
;;                   i1_lcd_write_data
;;                          i1___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (8) i1_lcd_set_cursor                                     1     1      0     148
;;                                              3 COMMON     1     1      0
;;                i1_lcd_write_control
;; ---------------------------------------------------------------------------------
;; (8) i1_sprintf                                           17    12      5    2611
;;                                              6 BANK0     17    12      5
;;                          i1___lwdiv
;;                          i1___lwmod
;; ---------------------------------------------------------------------------------
;; (8) i1_ADCconvert                                         2     2      0     827
;;                                              0 BANK0      2     2      0
;;                           i1___wmul
;;                          i1___lwdiv
;; ---------------------------------------------------------------------------------
;; (9) i1_lcd_write_data                                     3     3      0      73
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (9) i1_lcd_write_control                                  3     3      0      73
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (9) i1_adc_read_channel                                   2     2      0     150
;;                                              6 COMMON     2     2      0
;;                         i1_adc_read
;; ---------------------------------------------------------------------------------
;; (7) _ReadButtons                                          0     0      0       0
;;                           _Debounce
;; ---------------------------------------------------------------------------------
;; (8) i1___awmod                                            7     3      4     969
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (9) i1___lwmod                                            6     2      4     521
;;                                              0 BANK0      6     2      4
;;                          i1___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (9) i1___lwdiv                                            8     4      4     527
;;                                              6 COMMON     8     4      4
;;                           i1___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (9) i1___wmul                                             6     2      4     300
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (10) i1_adc_read                                          6     4      2      77
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; (8) _Debounce                                             1     1      0       0
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 10
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
;;
;; _isr1 (ROOT)
;;   i1___lwmod
;;     i1___lwdiv (ARG)
;;       i1___wmul (ARG)
;;   i1_readAvgDistance
;;     i1_readDistance
;;       i1_adc_read_channel
;;         i1_adc_read
;;     i1___lwdiv
;;       i1___wmul (ARG)
;;     i1_ADCconvert
;;       i1___wmul
;;       i1___lwdiv
;;         i1___wmul (ARG)
;;   i1_UpdateDisplay
;;     i1_lcd_write_control
;;     i1_sprintf
;;       i1___lwdiv
;;         i1___wmul (ARG)
;;       i1___lwmod
;;         i1___lwdiv (ARG)
;;           i1___wmul (ARG)
;;     i1_lcd_set_cursor
;;       i1_lcd_write_control
;;     i1_lcd_write_string
;;       i1_lcd_write_data
;;       i1___awmod (ARG)
;;     i1___awmod
;;   _ReadButtons
;;     _Debounce
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0      3C       9       62.5%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50     48      50       7      100.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      F8      12        0.0%
;;ABS                  0      0      E9       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       F       2        0.0%
;;BANK0               50     31      4F       5       98.8%
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
;;		line 227 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  shortwall       2   69[BANK1 ] int 
;;  choice          1   71[BANK1 ] unsigned char 
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
;;      Locals:         0       0       3       0       0
;;      Temps:          0       0       3       0       0
;;      Totals:         0       0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:   10
;; This function calls:
;;		_init
;;		_Menu
;;		_calibrateIR
;;		_scan360
;;		_rotate
;;		_robotMove
;;		_robotTurn
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	227
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	232
	
l12248:	
;Main.c: 232: init();
	fcall	_init
	goto	l12250
	line	238
;Main.c: 238: while(1)
	
l2233:	
	line	240
	
l12250:	
;Main.c: 239: {
;Main.c: 240: unsigned char choice = 255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	line	241
	
l12252:	
;Main.c: 241: int shortwall = 0;
	clrf	(main@shortwall)^080h
	clrf	(main@shortwall+1)^080h
	line	242
	
l12254:	
;Main.c: 242: currentMenu = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_currentMenu)
	line	243
;Main.c: 243: switch (buttonPressed)
	goto	l12278
	line	245
;Main.c: 244: {
;Main.c: 245: case 1:
	
l2235:	
	line	246
	
l12256:	
;Main.c: 246: Menu(1);
	movlw	(01h)
	fcall	_Menu
	line	248
	
l12258:	
;Main.c: 248: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	250
;Main.c: 250: break;
	goto	l12300
	line	251
;Main.c: 251: case 2:
	
l2237:	
	line	252
	
l12260:	
;Main.c: 252: Menu(2);
	movlw	(02h)
	fcall	_Menu
	line	254
	
l12262:	
;Main.c: 254: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	256
;Main.c: 256: break;
	goto	l12300
	line	257
;Main.c: 257: case 3:
	
l2238:	
	line	258
	
l12264:	
;Main.c: 258: Menu(3);
	movlw	(03h)
	fcall	_Menu
	line	260
	
l12266:	
;Main.c: 260: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	262
;Main.c: 262: break;
	goto	l12300
	line	263
;Main.c: 263: case 4:
	
l2239:	
	line	264
	
l12268:	
;Main.c: 264: Menu(4);
	movlw	(04h)
	fcall	_Menu
	line	266
	
l12270:	
;Main.c: 266: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	268
;Main.c: 268: break;
	goto	l12300
	line	269
;Main.c: 269: case 5:
	
l2240:	
	line	270
	
l12272:	
;Main.c: 270: choice = Menu(5);
	movlw	(05h)
	fcall	_Menu
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	line	272
	
l12274:	
;Main.c: 272: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	274
;Main.c: 274: break;
	goto	l12300
	line	275
;Main.c: 275: default:
	
l2241:	
	line	277
;Main.c: 277: break;
	goto	l12300
	line	278
	
l12276:	
;Main.c: 278: }
	goto	l12300
	line	243
	
l2234:	
	
l12278:	
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
	goto	l12256
	xorlw	2^1	; case 2
	skipnz
	goto	l12260
	xorlw	3^2	; case 3
	skipnz
	goto	l12264
	xorlw	4^3	; case 4
	skipnz
	goto	l12268
	xorlw	5^4	; case 5
	skipnz
	goto	l12272
	goto	l12300
	opt asmopt_on

	line	278
	
l2236:	
	line	281
;Main.c: 281: switch (choice)
	goto	l12300
	line	283
;Main.c: 282: {
;Main.c: 283: case 0:
	
l2243:	
	line	284
	
l12280:	
;Main.c: 284: calibrateIR();
	fcall	_calibrateIR
	line	285
;Main.c: 285: break;
	goto	l12302
	line	286
;Main.c: 286: case 1:
	
l2245:	
	line	287
	
l12282:	
;Main.c: 287: shortwall = scan360();
	fcall	_scan360
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?_scan360))^080h,w
	clrf	(main@shortwall+1)^080h
	addwf	(main@shortwall+1)^080h
	movf	(0+(?_scan360))^080h,w
	clrf	(main@shortwall)^080h
	addwf	(main@shortwall)^080h

	line	288
	
l12284:	
;Main.c: 288: rotate((400 - shortwall), 0);
	clrf	(?_rotate)^080h
	decf	(main@shortwall)^080h,w
	xorlw	0ffh
	addlw	090h
	fcall	_rotate
	line	289
;Main.c: 289: break;
	goto	l12302
	line	290
;Main.c: 290: case 2:
	
l2246:	
	line	291
	
l12286:	
;Main.c: 291: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u6037:
	decfsz	((??_main+0)^080h+0),f
	goto	u6037
	decfsz	((??_main+0)^080h+0+1),f
	goto	u6037
	decfsz	((??_main+0)^080h+0+2),f
	goto	u6037
	nop2
opt asmopt_on

	line	292
	
l12288:	
;Main.c: 292: robotMove(2000);
	movlw	low(07D0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(07D0h)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	295
;Main.c: 295: break;
	goto	l12302
	line	296
;Main.c: 296: case 3:
	
l2247:	
	line	297
	
l12290:	
;Main.c: 297: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	138
movwf	((??_main+0)^080h+0+1),f
	movlw	86
movwf	((??_main+0)^080h+0),f
u6047:
	decfsz	((??_main+0)^080h+0),f
	goto	u6047
	decfsz	((??_main+0)^080h+0+1),f
	goto	u6047
	decfsz	((??_main+0)^080h+0+2),f
	goto	u6047
	nop2
opt asmopt_on

	line	298
	
l12292:	
;Main.c: 298: robotMove(1000);
	movlw	low(03E8h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(03E8h)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	299
	
l12294:	
;Main.c: 299: robotTurn(-90);
	movlw	low(-90)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotTurn)^080h
	movlw	high(-90)
	movwf	((?_robotTurn)^080h)+1
	fcall	_robotTurn
	line	300
	
l12296:	
;Main.c: 300: robotMove(1000);
	movlw	low(03E8h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(03E8h)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	301
;Main.c: 301: break;
	goto	l12302
	line	302
;Main.c: 302: case 4:
	
l2248:	
	line	304
;Main.c: 304: break;
	goto	l12302
	line	307
;Main.c: 307: default:
	
l2249:	
	line	309
;Main.c: 309: break;
	goto	l12302
	line	310
	
l12298:	
;Main.c: 310: }
	goto	l12302
	line	281
	
l2242:	
	
l12300:	
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
	goto	l12280
	xorlw	1^0	; case 1
	skipnz
	goto	l12282
	xorlw	2^1	; case 2
	skipnz
	goto	l12286
	xorlw	3^2	; case 3
	skipnz
	goto	l12290
	xorlw	4^3	; case 4
	skipnz
	goto	l12302
	goto	l12302
	opt asmopt_on

	line	310
	
l2244:	
	line	311
	
l12302:	
;Main.c: 311: choice = 255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	goto	l12250
	line	461
	
l2250:	
	line	238
	goto	l12250
	
l2251:	
	line	462
	
l2252:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_scan360
psect	text1131,local,class=CODE,delta=2
global __ptext1131
__ptext1131:

;; *************** function _scan360 *****************
;; Defined at:
;;		line 203 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  steps           2   64[BANK1 ] int 
;;  lowestSteps     2   62[BANK1 ] int 
;;  lowestVal       2   60[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  2   58[BANK1 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       6       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    9
;; This function calls:
;;		_readAvgDistance
;;		_rotate
;;		_UpdateDisplay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1131
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	203
	global	__size_of_scan360
	__size_of_scan360	equ	__end_of_scan360-_scan360
	
_scan360:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _scan360: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	204
	
l12218:	
;Main.c: 204: int lowestVal = 0, lowestSteps = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(scan360@lowestVal)^080h
	clrf	(scan360@lowestVal+1)^080h
	clrf	(scan360@lowestSteps)^080h
	clrf	(scan360@lowestSteps+1)^080h
	line	205
	
l12220:	
;Main.c: 205: SCAN_FLAG = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_SCAN_FLAG)
	bsf	status,0
	rlf	(_SCAN_FLAG),f
	line	206
	
l12222:	
;Main.c: 206: for (int steps = 0; steps < 400; steps++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(scan360@steps)^080h
	clrf	(scan360@steps+1)^080h
	
l12224:	
	movf	(scan360@steps+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0190h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6005
	movlw	low(0190h)
	subwf	(scan360@steps)^080h,w
u6005:

	skipc
	goto	u6001
	goto	u6000
u6001:
	goto	l12228
u6000:
	goto	l2228
	
l12226:	
	goto	l2228
	line	207
	
l2227:	
	line	208
	
l12228:	
;Main.c: 207: {
;Main.c: 208: readAvgDistance();
	fcall	_readAvgDistance
	line	209
	
l12230:	
;Main.c: 209: if (adcVal > lowestVal)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	subwf	(scan360@lowestVal+1)^080h,w
	skipz
	goto	u6015
	movf	(_adcVal)^080h,w	;volatile
	subwf	(scan360@lowestVal)^080h,w
u6015:
	skipnc
	goto	u6011
	goto	u6010
u6011:
	goto	l12234
u6010:
	line	211
	
l12232:	
;Main.c: 210: {
;Main.c: 211: lowestVal = adcVal;
	movf	(_adcVal+1)^080h,w	;volatile
	clrf	(scan360@lowestVal+1)^080h	;volatile
	addwf	(scan360@lowestVal+1)^080h	;volatile
	movf	(_adcVal)^080h,w	;volatile
	clrf	(scan360@lowestVal)^080h	;volatile
	addwf	(scan360@lowestVal)^080h	;volatile

	line	212
;Main.c: 212: lowestSteps = steps;
	movf	(scan360@steps+1)^080h,w
	clrf	(scan360@lowestSteps+1)^080h
	addwf	(scan360@lowestSteps+1)^080h
	movf	(scan360@steps)^080h,w
	clrf	(scan360@lowestSteps)^080h
	addwf	(scan360@lowestSteps)^080h

	goto	l12234
	line	214
	
l2229:	
	line	215
	
l12234:	
;Main.c: 214: }
;Main.c: 215: rotate(1, 1);
	clrf	(?_rotate)^080h
	bsf	status,0
	rlf	(?_rotate)^080h,f
	movlw	(01h)
	fcall	_rotate
	line	216
	
l12236:	
;Main.c: 216: UpdateDisplay(serialInput);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_serialInput),w	;volatile
	fcall	_UpdateDisplay
	line	217
	
l12238:	
;Main.c: 217: test = lowestSteps;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(scan360@lowestSteps+1)^080h,w
	clrf	(_test+1)^080h
	addwf	(_test+1)^080h
	movf	(scan360@lowestSteps)^080h,w
	clrf	(_test)^080h
	addwf	(_test)^080h

	line	206
	
l12240:	
	movlw	low(01h)
	addwf	(scan360@steps)^080h,f
	skipnc
	incf	(scan360@steps+1)^080h,f
	movlw	high(01h)
	addwf	(scan360@steps+1)^080h,f
	
l12242:	
	movf	(scan360@steps+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0190h))^80h
	subwf	btemp+1,w
	skipz
	goto	u6025
	movlw	low(0190h)
	subwf	(scan360@steps)^080h,w
u6025:

	skipc
	goto	u6021
	goto	u6020
u6021:
	goto	l12228
u6020:
	
l2228:	
	line	219
;Main.c: 218: }
;Main.c: 219: SCAN_FLAG = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_SCAN_FLAG)
	line	220
	
l12244:	
;Main.c: 220: return lowestSteps;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(scan360@lowestSteps+1)^080h,w
	clrf	(?_scan360+1)^080h
	addwf	(?_scan360+1)^080h
	movf	(scan360@lowestSteps)^080h,w
	clrf	(?_scan360)^080h
	addwf	(?_scan360)^080h

	goto	l2230
	
l12246:	
	line	221
	
l2230:	
	return
	opt stack 0
GLOBAL	__end_of_scan360
	__end_of_scan360:
;; =============== function _scan360 ends ============

	signat	_scan360,90
	global	_init
psect	text1132,local,class=CODE,delta=2
global __ptext1132
__ptext1132:

;; *************** function _init *****************
;; Defined at:
;;		line 132 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text1132
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	132
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 0
; Regs used in _init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	133
	
l12200:	
;Main.c: 133: init_adc();
	fcall	_init_adc
	line	134
;Main.c: 134: lcd_init();
	fcall	_lcd_init
	line	135
;Main.c: 135: ser_init();
	fcall	_ser_init
	line	136
	
l12202:	
;Main.c: 136: robo_init();
	fcall	_robo_init
	line	138
	
l12204:	
;Main.c: 138: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	140
	
l12206:	
;Main.c: 140: TRISC &= 0b10010000;
	movlw	(090h)
	movwf	(??_init+0)^080h+0
	movf	(??_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	142
	
l12208:	
;Main.c: 142: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	143
	
l12210:	
;Main.c: 143: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	145
	
l12212:	
;Main.c: 145: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	148
	
l12214:	
;Main.c: 148: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	151
	
l12216:	
;Main.c: 151: (GIE = 1);
	bsf	(95/8),(95)&7
	line	152
	
l2210:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_UpdateDisplay
psect	text1133,local,class=CODE,delta=2
global __ptext1133
__ptext1133:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 215 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;  serialInput     1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  serialInput     1    0[COMMON] unsigned char 
;;  adcOutput      16   42[BANK1 ] unsigned char [16]
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
;;      Locals:         0       0      16       0       0
;;      Temps:          0       0       5       0       0
;;      Totals:         0       0      21       0       0
;;Total ram usage:       21 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_lcd_write_control
;;		_sprintf
;;		_lcd_set_cursor
;;		_lcd_write_string
;;		___awmod
;; This function is called by:
;;		_scan360
;; This function uses a non-reentrant model
;;
psect	text1133
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	215
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _UpdateDisplay: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	216
	
l12160:	
;HMI.c: 216: char adcOutput[16] = "";
	movlw	(UpdateDisplay@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1223)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_UpdateDisplay+0)^080h+0
	movf	fsr0,w
	movwf	((??_UpdateDisplay+0)^080h+0+1)
	movlw	16
	movwf	((??_UpdateDisplay+0)^080h+0+2)
u5980:
	movf	(??_UpdateDisplay+0)^080h+0,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	
	movf	indf,w
	movwf	((??_UpdateDisplay+0)^080h+0+3)
	incf	(??_UpdateDisplay+0)^080h+0,f
	movf	((??_UpdateDisplay+0)^080h+0+1),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	
	movf	((??_UpdateDisplay+0)^080h+0+3),w
	movwf	indf
	incf	((??_UpdateDisplay+0)^080h+0+1),f
	decfsz	((??_UpdateDisplay+0)^080h+0+2),f
	goto	u5980
	line	217
;HMI.c: 217: switch (currentMenu)
	goto	l12198
	line	220
;HMI.c: 218: {
;HMI.c: 220: case 0:
	
l5240:	
	line	221
	
l12162:	
;HMI.c: 221: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	222
	
l12164:	
;HMI.c: 222: sprintf(adcOutput,"ADC:%d Dist:%d",adcVal, test);
	movlw	((STR_11-__stringbase))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_UpdateDisplay+0)^080h+0
	movf	(??_UpdateDisplay+0)^080h+0,w
	movwf	(?_sprintf)^080h
	movf	(_adcVal+1)^080h,w	;volatile
	clrf	1+(?_sprintf)^080h+01h
	addwf	1+(?_sprintf)^080h+01h
	movf	(_adcVal)^080h,w	;volatile
	clrf	0+(?_sprintf)^080h+01h
	addwf	0+(?_sprintf)^080h+01h

	movf	(_test+1)^080h,w	;volatile
	clrf	1+(?_sprintf)^080h+03h
	addwf	1+(?_sprintf)^080h+03h
	movf	(_test)^080h,w	;volatile
	clrf	0+(?_sprintf)^080h+03h
	addwf	0+(?_sprintf)^080h+03h

	movlw	(UpdateDisplay@adcOutput)&0ffh
	fcall	_sprintf
	line	225
	
l12166:	
;HMI.c: 225: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	226
;HMI.c: 226: lcd_write_string(adcOutput);
	movlw	(UpdateDisplay@adcOutput&0ffh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_lcd_write_string)^080h
	movlw	(0x1/2)
	movwf	(?_lcd_write_string+1)^080h
	fcall	_lcd_write_string
	line	231
	
l12168:	
;HMI.c: 231: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	232
	
l12170:	
;HMI.c: 232: if (pos > 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u5995
	movlw	low(01h)
	subwf	(_pos)^080h,w
u5995:

	skipc
	goto	u5991
	goto	u5990
u5991:
	goto	l12174
u5990:
	line	233
	
l12172:	
;HMI.c: 233: lcd_write_string(shortMenuStrings[pos - 1]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	0FFh
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(?_lcd_write_string)^080h
	movlw	80h
	movwf	(?_lcd_write_string+1)^080h
	fcall	_lcd_write_string
	goto	l12176
	line	234
	
l5241:	
	line	235
	
l12174:	
;HMI.c: 234: else
;HMI.c: 235: lcd_write_string(shortMenuStrings[pos + 5 - 1]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	04h
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(?_lcd_write_string)^080h
	movlw	80h
	movwf	(?_lcd_write_string+1)^080h
	fcall	_lcd_write_string
	goto	l12176
	
l5242:	
	line	236
	
l12176:	
;HMI.c: 236: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	237
	
l12178:	
;HMI.c: 237: lcd_write_string(menuStrings[pos]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	_menuStrings&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(?_lcd_write_string)^080h
	movlw	80h
	movwf	(?_lcd_write_string+1)^080h
	fcall	_lcd_write_string
	line	238
;HMI.c: 238: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	239
	
l12180:	
;HMI.c: 239: lcd_write_string(shortMenuStrings[(pos + 1) % 5]);
	movlw	low(05h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?___awmod)^080h
	movlw	high(05h)
	movwf	((?___awmod)^080h)+1
	movf	(_pos)^080h,w
	addlw	low(01h)
	movwf	0+(?___awmod)^080h+02h
	movf	(_pos+1)^080h,w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+0+(?___awmod)^080h+02h
	fcall	___awmod
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___awmod))^080h,w
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(?_lcd_write_string)^080h
	movlw	80h
	movwf	(?_lcd_write_string+1)^080h
	fcall	_lcd_write_string
	line	240
;HMI.c: 240: break;
	goto	l5246
	line	241
;HMI.c: 241: case 1:
	
l5244:	
	line	242
	
l12182:	
;HMI.c: 242: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	244
	
l12184:	
;HMI.c: 244: sprintf(adcOutput,"ADC:%d Dist:%d",highByte, lowByte);
	movlw	((STR_12-__stringbase))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_UpdateDisplay+0)^080h+0
	movf	(??_UpdateDisplay+0)^080h+0,w
	movwf	(?_sprintf)^080h
	movf	(_highByte)^080h,w
	movwf	(??_UpdateDisplay+1)^080h+0
	clrf	(??_UpdateDisplay+1)^080h+0+1
	movf	0+(??_UpdateDisplay+1)^080h+0,w
	movwf	0+(?_sprintf)^080h+01h
	movf	1+(??_UpdateDisplay+1)^080h+0,w
	movwf	1+(?_sprintf)^080h+01h
	movf	(_lowByte)^080h,w
	movwf	(??_UpdateDisplay+3)^080h+0
	clrf	(??_UpdateDisplay+3)^080h+0+1
	movf	0+(??_UpdateDisplay+3)^080h+0,w
	movwf	0+(?_sprintf)^080h+03h
	movf	1+(??_UpdateDisplay+3)^080h+0,w
	movwf	1+(?_sprintf)^080h+03h
	movlw	(UpdateDisplay@adcOutput)&0ffh
	fcall	_sprintf
	line	246
	
l12186:	
;HMI.c: 246: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	_lcd_set_cursor
	line	247
;HMI.c: 247: lcd_write_string(adcOutput);
	movlw	(UpdateDisplay@adcOutput&0ffh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_lcd_write_string)^080h
	movlw	(0x1/2)
	movwf	(?_lcd_write_string+1)^080h
	fcall	_lcd_write_string
	line	252
	
l12188:	
;HMI.c: 252: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	254
	
l12190:	
;HMI.c: 254: lcd_write_string("<<<");
	movlw	low((STR_13-__stringbase))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_lcd_write_string)^080h
	movlw	80h
	movwf	(?_lcd_write_string+1)^080h
	fcall	_lcd_write_string
	line	257
;HMI.c: 257: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	258
	
l12192:	
;HMI.c: 258: lcd_write_string("CONFIRM");
	movlw	low((STR_14-__stringbase))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_lcd_write_string)^080h
	movlw	80h
	movwf	(?_lcd_write_string+1)^080h
	fcall	_lcd_write_string
	line	259
	
l12194:	
;HMI.c: 259: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	260
;HMI.c: 260: lcd_write_string(">>>");
	movlw	low((STR_15-__stringbase))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_lcd_write_string)^080h
	movlw	80h
	movwf	(?_lcd_write_string+1)^080h
	fcall	_lcd_write_string
	line	261
;HMI.c: 261: break;
	goto	l5246
	line	263
;HMI.c: 263: default:
	
l5245:	
	line	265
;HMI.c: 265: break;
	goto	l5246
	line	268
	
l12196:	
;HMI.c: 268: }
	goto	l5246
	line	217
	
l5239:	
	
l12198:	
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
	goto	l12162
	xorlw	1^0	; case 1
	skipnz
	goto	l12182
	goto	l5246
	opt asmopt_on

	line	268
	
l5243:	
	line	269
	
l5246:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,4216
	global	_readAvgDistance
psect	text1134,local,class=CODE,delta=2
global __ptext1134
__ptext1134:

;; *************** function _readAvgDistance *****************
;; Defined at:
;;		line 10 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   18[BANK1 ] int 
;;  fullval         2   16[BANK1 ] unsigned int 
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
;;      Locals:         0       0       4       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_readDistance
;;		___lwdiv
;;		_ADCconvert
;; This function is called by:
;;		_scan360
;; This function uses a non-reentrant model
;;
psect	text1134
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	10
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _readAvgDistance: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	11
	
l12146:	
;infrared.c: 11: unsigned int fullval = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(readAvgDistance@fullval)^080h
	clrf	(readAvgDistance@fullval+1)^080h
	line	14
;infrared.c: 14: for (int i = 0; i < 10; i++)
	clrf	(readAvgDistance@i)^080h
	clrf	(readAvgDistance@i+1)^080h
	
l12148:	
	movf	(readAvgDistance@i+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u5965
	movlw	low(0Ah)
	subwf	(readAvgDistance@i)^080h,w
u5965:

	skipc
	goto	u5961
	goto	u5960
u5961:
	goto	l12152
u5960:
	goto	l12158
	
l12150:	
	goto	l12158
	line	15
	
l2955:	
	line	16
	
l12152:	
;infrared.c: 15: {
;infrared.c: 16: fullval += readDistance();
	fcall	_readDistance
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?_readDistance))^080h,w
	addwf	(readAvgDistance@fullval)^080h,f
	skipnc
	incf	(readAvgDistance@fullval+1)^080h,f
	movf	(1+(?_readDistance))^080h,w
	addwf	(readAvgDistance@fullval+1)^080h,f
	line	14
	
l12154:	
	movlw	low(01h)
	addwf	(readAvgDistance@i)^080h,f
	skipnc
	incf	(readAvgDistance@i+1)^080h,f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1)^080h,f
	
l12156:	
	movf	(readAvgDistance@i+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u5975
	movlw	low(0Ah)
	subwf	(readAvgDistance@i)^080h,w
u5975:

	skipc
	goto	u5971
	goto	u5970
u5971:
	goto	l12152
u5970:
	goto	l12158
	
l2956:	
	line	19
	
l12158:	
;infrared.c: 18: }
;infrared.c: 19: adcVal = fullval / 10;
	movlw	low(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?___lwdiv)^080h
	movlw	high(0Ah)
	movwf	((?___lwdiv)^080h)+1
	movf	(readAvgDistance@fullval+1)^080h,w
	clrf	1+(?___lwdiv)^080h+02h
	addwf	1+(?___lwdiv)^080h+02h
	movf	(readAvgDistance@fullval)^080h,w
	clrf	0+(?___lwdiv)^080h+02h
	addwf	0+(?___lwdiv)^080h+02h

	fcall	___lwdiv
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___lwdiv))^080h,w
	clrf	(_adcVal+1)^080h	;volatile
	addwf	(_adcVal+1)^080h	;volatile
	movf	(0+(?___lwdiv))^080h,w
	clrf	(_adcVal)^080h	;volatile
	addwf	(_adcVal)^080h	;volatile

	line	20
;infrared.c: 20: ADCconvert();
	fcall	_ADCconvert
	line	21
	
l2957:	
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,88
	global	_readDistance
psect	text1135,local,class=CODE,delta=2
global __ptext1135
__ptext1135:

;; *************** function _readDistance *****************
;; Defined at:
;;		line 24 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  fullval         2   12[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    8[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       2       0       0
;;      Totals:         0       0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_adc_read_channel
;; This function is called by:
;;		_readAvgDistance
;; This function uses a non-reentrant model
;;
psect	text1135
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	24
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	27
	
l12140:	
;infrared.c: 25: unsigned int fullval ;
;infrared.c: 27: fullval = adc_read_channel(0);
	movlw	(0)
	fcall	_adc_read_channel
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_readDistance+0)^080h+0
	clrf	(??_readDistance+0)^080h+0+1
	movf	0+(??_readDistance+0)^080h+0,w
	movwf	(readDistance@fullval)^080h
	movf	1+(??_readDistance+0)^080h+0,w
	movwf	(readDistance@fullval+1)^080h
	line	29
	
l12142:	
;infrared.c: 29: return fullval;
	movf	(readDistance@fullval+1)^080h,w
	clrf	(?_readDistance+1)^080h
	addwf	(?_readDistance+1)^080h
	movf	(readDistance@fullval)^080h,w
	clrf	(?_readDistance)^080h
	addwf	(?_readDistance)^080h

	goto	l2960
	
l12144:	
	line	30
	
l2960:	
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_calibrateIR
psect	text1136,local,class=CODE,delta=2
global __ptext1136
__ptext1136:

;; *************** function _calibrateIR *****************
;; Defined at:
;;		line 157 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
psect	text1136
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	157
	global	__size_of_calibrateIR
	__size_of_calibrateIR	equ	__end_of_calibrateIR-_calibrateIR
	
_calibrateIR:	
	opt	stack 0
; Regs used in _calibrateIR: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	159
	
l12116:	
;Main.c: 159: currentMenu = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_currentMenu)
	bsf	status,0
	rlf	(_currentMenu),f
	line	160
	
l12118:	
;Main.c: 160: rotate(8, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotate)^080h
	movlw	(08h)
	fcall	_rotate
	goto	l12138
	line	161
;Main.c: 161: while (1)
	
l2213:	
	line	163
;Main.c: 162: {
;Main.c: 163: switch (buttonPressed)
	goto	l12138
	line	165
;Main.c: 164: {
;Main.c: 165: case 1:
	
l2215:	
	line	168
;Main.c: 168: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	170
;Main.c: 170: break;
	goto	l12138
	line	171
;Main.c: 171: case 2:
	
l2217:	
	line	174
;Main.c: 174: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	176
;Main.c: 176: break;
	goto	l12138
	line	177
;Main.c: 177: case 3:
	
l2218:	
	line	178
	
l12120:	
;Main.c: 178: rotate(1, 1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotate)^080h
	bsf	status,0
	rlf	(?_rotate)^080h,f
	movlw	(01h)
	fcall	_rotate
	line	180
	
l12122:	
;Main.c: 180: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	182
;Main.c: 182: break;
	goto	l12138
	line	183
;Main.c: 183: case 4:
	
l2219:	
	line	184
	
l12124:	
;Main.c: 184: rotate(1, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotate)^080h
	movlw	(01h)
	fcall	_rotate
	line	186
	
l12126:	
;Main.c: 186: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	188
;Main.c: 188: break;
	goto	l12138
	line	189
;Main.c: 189: case 5:
	
l2220:	
	line	190
	
l12128:	
;Main.c: 190: totalSteps = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(_totalSteps)^0180h
	clrf	(_totalSteps+1)^0180h
	line	192
	
l12130:	
;Main.c: 192: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	goto	l2221
	line	193
	
l12132:	
;Main.c: 193: return;
	goto	l2221
	line	194
	
l12134:	
;Main.c: 194: break;
	goto	l12138
	line	195
;Main.c: 195: default:
	
l2222:	
	line	197
;Main.c: 197: break;
	goto	l12138
	line	198
	
l12136:	
;Main.c: 198: }
	goto	l12138
	line	163
	
l2214:	
	
l12138:	
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
	goto	l2215
	xorlw	2^1	; case 2
	skipnz
	goto	l2217
	xorlw	3^2	; case 3
	skipnz
	goto	l12120
	xorlw	4^3	; case 4
	skipnz
	goto	l12124
	xorlw	5^4	; case 5
	skipnz
	goto	l12128
	goto	l12138
	opt asmopt_on

	line	198
	
l2216:	
	goto	l12138
	line	199
	
l2223:	
	line	161
	goto	l12138
	
l2224:	
	line	200
	
l2221:	
	return
	opt stack 0
GLOBAL	__end_of_calibrateIR
	__end_of_calibrateIR:
;; =============== function _calibrateIR ends ============

	signat	_calibrateIR,88
	global	_lcd_init
psect	text1137,local,class=CODE,delta=2
global __ptext1137
__ptext1137:

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
psect	text1137
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 0
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
l12096:	
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
l12098:	
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
l12100:	
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
l12102:	
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
l12104:	
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
l12106:	
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
l12108:	
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
l12110:	
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
	
l12112:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l12114:	
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
psect	text1138,local,class=CODE,delta=2
global __ptext1138
__ptext1138:

;; *************** function _lcd_write_string *****************
;; Defined at:
;;		line 48 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               2    7[BANK1 ] PTR unsigned char 
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
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_lcd_write_data
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1138
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
l12088:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	l12094
	
l1409:	
	
l12090:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_string@s+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_string@s)^080h,w
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	fcall	stringtab
	fcall	_lcd_write_data
	
l12092:	
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(lcd_write_string@s)^080h,f
	skipnc
	incf	(lcd_write_string@s+1)^080h,f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1)^080h,f
	goto	l12094
	
l1408:	
	
l12094:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_string@s+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_string@s)^080h,w
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u5951
	goto	u5950
u5951:
	goto	l12090
u5950:
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
psect	text1139,local,class=CODE,delta=2
global __ptext1139
__ptext1139:

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 42 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    3[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_lcd_write_control
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1139
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	42
	global	__size_of_lcd_set_cursor
	__size_of_lcd_set_cursor	equ	__end_of_lcd_set_cursor-_lcd_set_cursor
	
_lcd_set_cursor:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _lcd_set_cursor: [wreg+status,2+status,0+pclath+cstack]
;lcd_set_cursor@address stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_set_cursor@address)^080h
	line	43
	
l12084:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)^080h+(7/8),(7)&7
	line	44
	
l12086:	
;lcd.c: 44: lcd_write_control(address);
	movf	(lcd_set_cursor@address)^080h,w
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
psect	text1140,local,class=CODE,delta=2
global __ptext1140
__ptext1140:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> UpdateDisplay@adcOutput(16), 
;;  f               1   20[BANK1 ] PTR const unsigned char 
;;		 -> STR_12(15), STR_11(15), 
;; Auto vars:     Size  Location     Type
;;  sp              1   35[BANK1 ] PTR unsigned char 
;;		 -> UpdateDisplay@adcOutput(16), 
;;  _val            4   31[BANK1 ] struct .
;;  c               1   36[BANK1 ] char 
;;  prec            1   30[BANK1 ] char 
;;  flag            1   29[BANK1 ] unsigned char 
;;  ap              1   28[BANK1 ] PTR void [1]
;;		 -> ?_sprintf(2), 
;; Return value:  Size  Location     Type
;;                  2   20[BANK1 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       5       0       0
;;      Locals:         0       0       9       0       0
;;      Temps:          0       0       3       0       0
;;      Totals:         0       0      17       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1140
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\doprnt.c"
	line	488
	global	__size_of_sprintf
	__size_of_sprintf	equ	__end_of_sprintf-_sprintf
	
_sprintf:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _sprintf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;sprintf@sp stored from wreg
	line	537
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(sprintf@sp)^080h
	
l12026:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)^080h+0
	movf	(??_sprintf+0)^080h+0,w
	movwf	(sprintf@ap)^080h
	line	540
	goto	l12078
	
l6711:	
	line	542
	
l12028:	
	movf	(sprintf@c)^080h,w
	xorlw	025h
	skipnz
	goto	u5871
	goto	u5870
u5871:
	goto	l6712
u5870:
	line	545
	
l12030:	
	movf	(sprintf@c)^080h,w
	movwf	(??_sprintf+0)^080h+0
	movf	(sprintf@sp)^080h,w
	movwf	fsr0
	movf	(??_sprintf+0)^080h+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l12032:	
	movlw	(01h)
	movwf	(??_sprintf+0)^080h+0
	movf	(??_sprintf+0)^080h+0,w
	addwf	(sprintf@sp)^080h,f
	line	546
	goto	l12078
	line	547
	
l6712:	
	line	552
	clrf	(sprintf@flag)^080h
	line	638
	goto	l12036
	line	640
	
l6714:	
	line	641
	goto	l12080
	line	700
	
l6716:	
	goto	l12038
	line	701
	
l6717:	
	line	702
	goto	l12038
	line	805
	
l6719:	
	line	816
	goto	l12078
	line	825
	
l12034:	
	goto	l12038
	line	638
	
l6713:	
	
l12036:	
	movlw	01h
	addwf	(sprintf@f)^080h,f
	movlw	-01h
	addwf	(sprintf@f)^080h,w
	movwf	fsr0
	fcall	stringdir
	movwf	(sprintf@c)^080h
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
	goto	l12080
	xorlw	100^0	; case 100
	skipnz
	goto	l12038
	xorlw	105^100	; case 105
	skipnz
	goto	l12038
	goto	l12078
	opt asmopt_on

	line	825
	
l6718:	
	line	1254
	
l12038:	
	movf	(sprintf@ap)^080h,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)^080h
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)^080h
	
l12040:	
	movlw	(02h)
	movwf	(??_sprintf+0)^080h+0
	movf	(??_sprintf+0)^080h+0,w
	addwf	(sprintf@ap)^080h,f
	line	1256
	
l12042:	
	btfss	(sprintf@_val+1)^080h,7
	goto	u5881
	goto	u5880
u5881:
	goto	l12048
u5880:
	line	1257
	
l12044:	
	movlw	(03h)
	movwf	(??_sprintf+0)^080h+0
	movf	(??_sprintf+0)^080h+0,w
	iorwf	(sprintf@flag)^080h,f
	line	1258
	
l12046:	
	comf	(sprintf@_val)^080h,f
	comf	(sprintf@_val+1)^080h,f
	incf	(sprintf@_val)^080h,f
	skipnz
	incf	(sprintf@_val+1)^080h,f
	goto	l12048
	line	1259
	
l6720:	
	line	1300
	
l12048:	
	clrf	(sprintf@c)^080h
	bsf	status,0
	rlf	(sprintf@c)^080h,f
	
l12050:	
	movf	(sprintf@c)^080h,w
	xorlw	05h
	skipz
	goto	u5891
	goto	u5890
u5891:
	goto	l12054
u5890:
	goto	l12062
	
l12052:	
	goto	l12062
	line	1301
	
l6721:	
	
l12054:	
	movf	(sprintf@c)^080h,w
	movwf	(??_sprintf+0)^080h+0
	addwf	(??_sprintf+0)^080h+0,w
	addlw	low((_dpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+1)^080h+0
	fcall	stringdir
	movwf	(??_sprintf+1)^080h+0+1
	movf	1+(??_sprintf+1)^080h+0,w
	subwf	(sprintf@_val+1)^080h,w
	skipz
	goto	u5905
	movf	0+(??_sprintf+1)^080h+0,w
	subwf	(sprintf@_val)^080h,w
u5905:
	skipnc
	goto	u5901
	goto	u5900
u5901:
	goto	l12058
u5900:
	goto	l12062
	line	1302
	
l12056:	
	goto	l12062
	
l6723:	
	line	1300
	
l12058:	
	movlw	(01h)
	movwf	(??_sprintf+0)^080h+0
	movf	(??_sprintf+0)^080h+0,w
	addwf	(sprintf@c)^080h,f
	
l12060:	
	movf	(sprintf@c)^080h,w
	xorlw	05h
	skipz
	goto	u5911
	goto	u5910
u5911:
	goto	l12054
u5910:
	goto	l12062
	
l6722:	
	line	1433
	
l12062:	
	movf	(sprintf@flag)^080h,w
	andlw	03h
	btfsc	status,2
	goto	u5921
	goto	u5920
u5921:
	goto	l12068
u5920:
	line	1434
	
l12064:	
	movlw	(02Dh)
	movwf	(??_sprintf+0)^080h+0
	movf	(sprintf@sp)^080h,w
	movwf	fsr0
	movf	(??_sprintf+0)^080h+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l12066:	
	movlw	(01h)
	movwf	(??_sprintf+0)^080h+0
	movf	(??_sprintf+0)^080h+0,w
	addwf	(sprintf@sp)^080h,f
	goto	l12068
	
l6724:	
	line	1467
	
l12068:	
	movf	(sprintf@c)^080h,w
	movwf	(??_sprintf+0)^080h+0
	movf	(??_sprintf+0)^080h+0,w
	movwf	(sprintf@prec)^080h
	line	1469
	goto	l12076
	
l6726:	
	line	1484
	
l12070:	
	movlw	low(0Ah)
	movwf	(?___lwmod)^080h
	movlw	high(0Ah)
	movwf	((?___lwmod)^080h)+1
	movf	(sprintf@prec)^080h,w
	movwf	(??_sprintf+0)^080h+0
	addwf	(??_sprintf+0)^080h+0,w
	addlw	low((_dpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?___lwdiv)^080h
	fcall	stringdir
	movwf	(?___lwdiv+1)^080h
	movf	(sprintf@_val+1)^080h,w
	clrf	1+(?___lwdiv)^080h+02h
	addwf	1+(?___lwdiv)^080h+02h
	movf	(sprintf@_val)^080h,w
	clrf	0+(?___lwdiv)^080h+02h
	addwf	0+(?___lwdiv)^080h+02h

	fcall	___lwdiv
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___lwdiv))^080h,w
	clrf	1+(?___lwmod)^080h+02h
	addwf	1+(?___lwmod)^080h+02h
	movf	(0+(?___lwdiv))^080h,w
	clrf	0+(?___lwmod)^080h+02h
	addwf	0+(?___lwmod)^080h+02h

	fcall	___lwmod
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___lwmod))^080h,w
	addlw	030h
	movwf	(??_sprintf+1)^080h+0
	movf	(??_sprintf+1)^080h+0,w
	movwf	(sprintf@c)^080h
	line	1516
	
l12072:	
	movf	(sprintf@c)^080h,w
	movwf	(??_sprintf+0)^080h+0
	movf	(sprintf@sp)^080h,w
	movwf	fsr0
	movf	(??_sprintf+0)^080h+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l12074:	
	movlw	(01h)
	movwf	(??_sprintf+0)^080h+0
	movf	(??_sprintf+0)^080h+0,w
	addwf	(sprintf@sp)^080h,f
	goto	l12076
	line	1517
	
l6725:	
	line	1469
	
l12076:	
	movlw	(-1)
	movwf	(??_sprintf+0)^080h+0
	movf	(??_sprintf+0)^080h+0,w
	addwf	(sprintf@prec)^080h,f
	movf	((sprintf@prec)^080h),w
	xorlw	-1
	skipz
	goto	u5931
	goto	u5930
u5931:
	goto	l12070
u5930:
	goto	l12078
	
l6727:	
	goto	l12078
	line	1525
	
l6710:	
	line	540
	
l12078:	
	movlw	01h
	addwf	(sprintf@f)^080h,f
	movlw	-01h
	addwf	(sprintf@f)^080h,w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+0)^080h+0
	movf	(??_sprintf+0)^080h+0,w
	movwf	(sprintf@c)^080h
	movf	((sprintf@c)^080h),f
	skipz
	goto	u5941
	goto	u5940
u5941:
	goto	l12028
u5940:
	goto	l12080
	
l6728:	
	goto	l12080
	line	1527
	
l6715:	
	line	1530
	
l12080:	
	movf	(sprintf@sp)^080h,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l6729
	line	1532
	
l12082:	
	line	1533
;	Return value of _sprintf is never used
	
l6729:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ADCconvert
psect	text1141,local,class=CODE,delta=2
global __ptext1141
__ptext1141:

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
;;      Temps:          0       0       2       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		___wmul
;;		___lwdiv
;; This function is called by:
;;		_readAvgDistance
;; This function uses a non-reentrant model
;;
psect	text1141
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	33
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _ADCconvert: [wreg+status,2+status,0+pclath+cstack]
	line	39
	
l11984:	
;infrared.c: 39: if (adcVal >= 213 && adcVal < 234)
	movlw	high(0D5h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u5731
	goto	u5730
u5731:
	goto	l11990
u5730:
	
l11986:	
	movlw	high(0EAh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0EAh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u5741
	goto	u5740
u5741:
	goto	l11990
u5740:
	line	41
	
l11988:	
;infrared.c: 40: {
;infrared.c: 41: distance = 15 + ((20-15)*(234-adcVal))/(234-213);
	movlw	low(015h)
	movwf	(?___lwdiv)^080h
	movlw	high(015h)
	movwf	((?___lwdiv)^080h)+1
	comf	(_adcVal)^080h,w	;volatile
	movwf	(??_ADCconvert+0)^080h+0
	comf	(_adcVal+1)^080h,w	;volatile
	movwf	((??_ADCconvert+0)^080h+0+1)
	incf	(??_ADCconvert+0)^080h+0,f
	skipnz
	incf	((??_ADCconvert+0)^080h+0+1),f
	movf	0+(??_ADCconvert+0)^080h+0,w
	addlw	low(0EAh)
	movwf	(?___wmul)^080h
	movf	1+(??_ADCconvert+0)^080h+0,w
	skipnc
	addlw	1
	addlw	high(0EAh)
	movwf	1+(?___wmul)^080h
	movlw	low(05h)
	movwf	0+(?___wmul)^080h+02h
	movlw	high(05h)
	movwf	(0+(?___wmul)^080h+02h)+1
	fcall	___wmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___wmul))^080h,w
	clrf	1+(?___lwdiv)^080h+02h
	addwf	1+(?___lwdiv)^080h+02h
	movf	(0+(?___wmul))^080h,w
	clrf	0+(?___lwdiv)^080h+02h
	addwf	0+(?___lwdiv)^080h+02h

	fcall	___lwdiv
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___lwdiv))^080h,w
	addlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___lwdiv))^080h,w
	skipnc
	addlw	1
	addlw	high(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_distance)	;volatile
	line	42
;infrared.c: 42: }
	goto	l2976
	line	43
	
l2963:	
	
l11990:	
;infrared.c: 43: else if (adcVal >= 170 && adcVal < 213)
	movlw	high(0AAh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u5751
	goto	u5750
u5751:
	goto	l11996
u5750:
	
l11992:	
	movlw	high(0D5h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u5761
	goto	u5760
u5761:
	goto	l11996
u5760:
	line	45
	
l11994:	
;infrared.c: 44: {
;infrared.c: 45: distance = 20 + ((30-20)*(213-adcVal))/(213-170);
	movlw	low(02Bh)
	movwf	(?___lwdiv)^080h
	movlw	high(02Bh)
	movwf	((?___lwdiv)^080h)+1
	comf	(_adcVal)^080h,w	;volatile
	movwf	(??_ADCconvert+0)^080h+0
	comf	(_adcVal+1)^080h,w	;volatile
	movwf	((??_ADCconvert+0)^080h+0+1)
	incf	(??_ADCconvert+0)^080h+0,f
	skipnz
	incf	((??_ADCconvert+0)^080h+0+1),f
	movf	0+(??_ADCconvert+0)^080h+0,w
	addlw	low(0D5h)
	movwf	(?___wmul)^080h
	movf	1+(??_ADCconvert+0)^080h+0,w
	skipnc
	addlw	1
	addlw	high(0D5h)
	movwf	1+(?___wmul)^080h
	movlw	low(0Ah)
	movwf	0+(?___wmul)^080h+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)^080h+02h)+1
	fcall	___wmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___wmul))^080h,w
	clrf	1+(?___lwdiv)^080h+02h
	addwf	1+(?___lwdiv)^080h+02h
	movf	(0+(?___wmul))^080h,w
	clrf	0+(?___lwdiv)^080h+02h
	addwf	0+(?___lwdiv)^080h+02h

	fcall	___lwdiv
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___lwdiv))^080h,w
	addlw	low(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___lwdiv))^080h,w
	skipnc
	addlw	1
	addlw	high(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_distance)	;volatile
	line	46
;infrared.c: 46: }
	goto	l2976
	line	47
	
l2965:	
	
l11996:	
;infrared.c: 47: else if (adcVal >= 128 && adcVal < 170)
	movlw	high(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u5771
	goto	u5770
u5771:
	goto	l12002
u5770:
	
l11998:	
	movlw	high(0AAh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u5781
	goto	u5780
u5781:
	goto	l12002
u5780:
	line	49
	
l12000:	
;infrared.c: 48: {
;infrared.c: 49: distance = 30 + ((40-30)*(170-adcVal))/(170-128);
	movlw	low(02Ah)
	movwf	(?___lwdiv)^080h
	movlw	high(02Ah)
	movwf	((?___lwdiv)^080h)+1
	comf	(_adcVal)^080h,w	;volatile
	movwf	(??_ADCconvert+0)^080h+0
	comf	(_adcVal+1)^080h,w	;volatile
	movwf	((??_ADCconvert+0)^080h+0+1)
	incf	(??_ADCconvert+0)^080h+0,f
	skipnz
	incf	((??_ADCconvert+0)^080h+0+1),f
	movf	0+(??_ADCconvert+0)^080h+0,w
	addlw	low(0AAh)
	movwf	(?___wmul)^080h
	movf	1+(??_ADCconvert+0)^080h+0,w
	skipnc
	addlw	1
	addlw	high(0AAh)
	movwf	1+(?___wmul)^080h
	movlw	low(0Ah)
	movwf	0+(?___wmul)^080h+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)^080h+02h)+1
	fcall	___wmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___wmul))^080h,w
	clrf	1+(?___lwdiv)^080h+02h
	addwf	1+(?___lwdiv)^080h+02h
	movf	(0+(?___wmul))^080h,w
	clrf	0+(?___lwdiv)^080h+02h
	addwf	0+(?___lwdiv)^080h+02h

	fcall	___lwdiv
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___lwdiv))^080h,w
	addlw	low(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___lwdiv))^080h,w
	skipnc
	addlw	1
	addlw	high(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_distance)	;volatile
	line	50
;infrared.c: 50: }
	goto	l2976
	line	51
	
l2967:	
	
l12002:	
;infrared.c: 51: else if (adcVal >= 107 && adcVal < 128)
	movlw	high(06Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u5791
	goto	u5790
u5791:
	goto	l12008
u5790:
	
l12004:	
	movlw	high(080h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u5801
	goto	u5800
u5801:
	goto	l12008
u5800:
	line	53
	
l12006:	
;infrared.c: 52: {
;infrared.c: 53: distance = 40 + ((50-40)*(128-adcVal))/(128-107);
	movlw	low(015h)
	movwf	(?___lwdiv)^080h
	movlw	high(015h)
	movwf	((?___lwdiv)^080h)+1
	comf	(_adcVal)^080h,w	;volatile
	movwf	(??_ADCconvert+0)^080h+0
	comf	(_adcVal+1)^080h,w	;volatile
	movwf	((??_ADCconvert+0)^080h+0+1)
	incf	(??_ADCconvert+0)^080h+0,f
	skipnz
	incf	((??_ADCconvert+0)^080h+0+1),f
	movf	0+(??_ADCconvert+0)^080h+0,w
	addlw	low(080h)
	movwf	(?___wmul)^080h
	movf	1+(??_ADCconvert+0)^080h+0,w
	skipnc
	addlw	1
	addlw	high(080h)
	movwf	1+(?___wmul)^080h
	movlw	low(0Ah)
	movwf	0+(?___wmul)^080h+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)^080h+02h)+1
	fcall	___wmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___wmul))^080h,w
	clrf	1+(?___lwdiv)^080h+02h
	addwf	1+(?___lwdiv)^080h+02h
	movf	(0+(?___wmul))^080h,w
	clrf	0+(?___lwdiv)^080h+02h
	addwf	0+(?___lwdiv)^080h+02h

	fcall	___lwdiv
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___lwdiv))^080h,w
	addlw	low(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___lwdiv))^080h,w
	skipnc
	addlw	1
	addlw	high(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_distance)	;volatile
	line	54
;infrared.c: 54: }
	goto	l2976
	line	55
	
l2969:	
	
l12008:	
;infrared.c: 55: else if (adcVal >= 77 && adcVal < 107)
	movlw	high(04Dh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u5811
	goto	u5810
u5811:
	goto	l12014
u5810:
	
l12010:	
	movlw	high(06Bh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u5821
	goto	u5820
u5821:
	goto	l12014
u5820:
	line	57
	
l12012:	
;infrared.c: 56: {
;infrared.c: 57: distance = 50 + ((60-50)*(107-adcVal))/(107-77);
	movlw	low(01Eh)
	movwf	(?___lwdiv)^080h
	movlw	high(01Eh)
	movwf	((?___lwdiv)^080h)+1
	comf	(_adcVal)^080h,w	;volatile
	movwf	(??_ADCconvert+0)^080h+0
	comf	(_adcVal+1)^080h,w	;volatile
	movwf	((??_ADCconvert+0)^080h+0+1)
	incf	(??_ADCconvert+0)^080h+0,f
	skipnz
	incf	((??_ADCconvert+0)^080h+0+1),f
	movf	0+(??_ADCconvert+0)^080h+0,w
	addlw	low(06Bh)
	movwf	(?___wmul)^080h
	movf	1+(??_ADCconvert+0)^080h+0,w
	skipnc
	addlw	1
	addlw	high(06Bh)
	movwf	1+(?___wmul)^080h
	movlw	low(0Ah)
	movwf	0+(?___wmul)^080h+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)^080h+02h)+1
	fcall	___wmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___wmul))^080h,w
	clrf	1+(?___lwdiv)^080h+02h
	addwf	1+(?___lwdiv)^080h+02h
	movf	(0+(?___wmul))^080h,w
	clrf	0+(?___lwdiv)^080h+02h
	addwf	0+(?___lwdiv)^080h+02h

	fcall	___lwdiv
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___lwdiv))^080h,w
	addlw	low(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___lwdiv))^080h,w
	skipnc
	addlw	1
	addlw	high(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_distance)	;volatile
	line	58
;infrared.c: 58: }
	goto	l2976
	line	59
	
l2971:	
	
l12014:	
;infrared.c: 59: else if (adcVal >= 56 && adcVal < 77)
	movlw	high(038h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u5831
	goto	u5830
u5831:
	goto	l12020
u5830:
	
l12016:	
	movlw	high(04Dh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u5841
	goto	u5840
u5841:
	goto	l12020
u5840:
	line	61
	
l12018:	
;infrared.c: 60: {
;infrared.c: 61: distance = 60 + ((70-60)*(77-adcVal))/(77-56);
	movlw	low(015h)
	movwf	(?___lwdiv)^080h
	movlw	high(015h)
	movwf	((?___lwdiv)^080h)+1
	comf	(_adcVal)^080h,w	;volatile
	movwf	(??_ADCconvert+0)^080h+0
	comf	(_adcVal+1)^080h,w	;volatile
	movwf	((??_ADCconvert+0)^080h+0+1)
	incf	(??_ADCconvert+0)^080h+0,f
	skipnz
	incf	((??_ADCconvert+0)^080h+0+1),f
	movf	0+(??_ADCconvert+0)^080h+0,w
	addlw	low(04Dh)
	movwf	(?___wmul)^080h
	movf	1+(??_ADCconvert+0)^080h+0,w
	skipnc
	addlw	1
	addlw	high(04Dh)
	movwf	1+(?___wmul)^080h
	movlw	low(0Ah)
	movwf	0+(?___wmul)^080h+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)^080h+02h)+1
	fcall	___wmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___wmul))^080h,w
	clrf	1+(?___lwdiv)^080h+02h
	addwf	1+(?___lwdiv)^080h+02h
	movf	(0+(?___wmul))^080h,w
	clrf	0+(?___lwdiv)^080h+02h
	addwf	0+(?___lwdiv)^080h+02h

	fcall	___lwdiv
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___lwdiv))^080h,w
	addlw	low(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___lwdiv))^080h,w
	skipnc
	addlw	1
	addlw	high(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_distance)	;volatile
	line	62
;infrared.c: 62: }
	goto	l2976
	line	63
	
l2973:	
	
l12020:	
;infrared.c: 63: else if (adcVal >= 43 && adcVal < 56)
	movlw	high(02Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(02Bh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u5851
	goto	u5850
u5851:
	goto	l2976
u5850:
	
l12022:	
	movlw	high(038h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u5861
	goto	u5860
u5861:
	goto	l2976
u5860:
	line	65
	
l12024:	
;infrared.c: 64: {
;infrared.c: 65: distance = 70 + ((80-70)*(56-adcVal))/(56-43);
	movlw	low(0Dh)
	movwf	(?___lwdiv)^080h
	movlw	high(0Dh)
	movwf	((?___lwdiv)^080h)+1
	comf	(_adcVal)^080h,w	;volatile
	movwf	(??_ADCconvert+0)^080h+0
	comf	(_adcVal+1)^080h,w	;volatile
	movwf	((??_ADCconvert+0)^080h+0+1)
	incf	(??_ADCconvert+0)^080h+0,f
	skipnz
	incf	((??_ADCconvert+0)^080h+0+1),f
	movf	0+(??_ADCconvert+0)^080h+0,w
	addlw	low(038h)
	movwf	(?___wmul)^080h
	movf	1+(??_ADCconvert+0)^080h+0,w
	skipnc
	addlw	1
	addlw	high(038h)
	movwf	1+(?___wmul)^080h
	movlw	low(0Ah)
	movwf	0+(?___wmul)^080h+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)^080h+02h)+1
	fcall	___wmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___wmul))^080h,w
	clrf	1+(?___lwdiv)^080h+02h
	addwf	1+(?___lwdiv)^080h+02h
	movf	(0+(?___wmul))^080h,w
	clrf	0+(?___lwdiv)^080h+02h
	addwf	0+(?___lwdiv)^080h+02h

	fcall	___lwdiv
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___lwdiv))^080h,w
	addlw	low(046h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___lwdiv))^080h,w
	skipnc
	addlw	1
	addlw	high(046h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(_distance)	;volatile
	goto	l2976
	line	66
	
l2975:	
	goto	l2976
	line	67
	
l2974:	
	goto	l2976
	
l2972:	
	goto	l2976
	
l2970:	
	goto	l2976
	
l2968:	
	goto	l2976
	
l2966:	
	goto	l2976
	
l2964:	
	
l2976:	
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,88
	global	_robotTurn
psect	text1142,local,class=CODE,delta=2
global __ptext1142
__ptext1142:

;; *************** function _robotTurn *****************
;; Defined at:
;;		line 74 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1142
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	74
	global	__size_of_robotTurn
	__size_of_robotTurn	equ	__end_of_robotTurn-_robotTurn
	
_robotTurn:	
	opt	stack 1
; Regs used in _robotTurn: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	77
	
l11974:	
;robot.c: 77: turnlowByte = (unsigned char) (distance) ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(robotTurn@distance)^080h,w
	movwf	(??_robotTurn+0)^080h+0
	movf	(??_robotTurn+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_turnlowByte)
	line	78
	
l11976:	
;robot.c: 78: turnhighByte = (unsigned char) (distance >> 8);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(robotTurn@distance+1)^080h,w
	movwf	(??_robotTurn+0)^080h+0
	movf	(??_robotTurn+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_turnhighByte)
	line	79
	
l11978:	
;robot.c: 79: if (distance >= 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(robotTurn@distance+1)^080h,7
	goto	u5721
	goto	u5720
u5721:
	goto	l11982
u5720:
	line	81
	
l11980:	
;robot.c: 80: {
;robot.c: 81: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	83
;robot.c: 83: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	85
;robot.c: 85: ser_putch(100);
	movlw	(064h)
	fcall	_ser_putch
	line	87
;robot.c: 87: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	89
;robot.c: 89: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	90
;robot.c: 90: }
	goto	l6700
	line	91
	
l6699:	
	line	93
	
l11982:	
;robot.c: 91: else
;robot.c: 92: {
;robot.c: 93: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	95
;robot.c: 95: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	97
;robot.c: 97: ser_putch(100);
	movlw	(064h)
	fcall	_ser_putch
	line	99
;robot.c: 99: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	101
;robot.c: 101: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	102
	
l6700:	
	line	103
;robot.c: 102: }
;robot.c: 103: ser_putch(157);
	movlw	(09Dh)
	fcall	_ser_putch
	line	105
;robot.c: 105: ser_putch(turnhighByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_turnhighByte),w
	fcall	_ser_putch
	line	107
;robot.c: 107: ser_putch(turnlowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_turnlowByte),w
	fcall	_ser_putch
	line	109
;robot.c: 109: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	111
;robot.c: 111: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	113
;robot.c: 113: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	115
;robot.c: 115: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	117
;robot.c: 117: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	119
	
l6701:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurn
	__end_of_robotTurn:
;; =============== function _robotTurn ends ============

	signat	_robotTurn,4216
	global	_robotMove
psect	text1143,local,class=CODE,delta=2
global __ptext1143
__ptext1143:

;; *************** function _robotMove *****************
;; Defined at:
;;		line 27 in file "E:\Aldnoah.Zero\Assignment3\robot.c"
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
psect	text1143
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	27
	global	__size_of_robotMove
	__size_of_robotMove	equ	__end_of_robotMove-_robotMove
	
_robotMove:	
	opt	stack 1
; Regs used in _robotMove: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	29
	
l11964:	
;robot.c: 29: lowByte = (unsigned char) (distance) ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(robotMove@distance)^080h,w
	movwf	(??_robotMove+0)^080h+0
	movf	(??_robotMove+0)^080h+0,w
	movwf	(_lowByte)^080h
	line	30
	
l11966:	
;robot.c: 30: highByte = (unsigned char) (distance >> 8);
	movf	(robotMove@distance+1)^080h,w
	movwf	(??_robotMove+0)^080h+0
	movf	(??_robotMove+0)^080h+0,w
	movwf	(_highByte)^080h
	line	31
	
l11968:	
;robot.c: 31: if (distance >= 0)
	btfsc	(robotMove@distance+1)^080h,7
	goto	u5711
	goto	u5710
u5711:
	goto	l11972
u5710:
	line	33
	
l11970:	
;robot.c: 32: {
;robot.c: 33: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	35
;robot.c: 35: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	37
;robot.c: 37: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	39
;robot.c: 39: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	41
;robot.c: 41: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	42
;robot.c: 42: }
	goto	l6695
	line	43
	
l6694:	
	line	45
	
l11972:	
;robot.c: 43: else
;robot.c: 44: {
;robot.c: 45: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	47
;robot.c: 47: ser_putch(0xff);
	movlw	(0FFh)
	fcall	_ser_putch
	line	49
;robot.c: 49: ser_putch(0x38);
	movlw	(038h)
	fcall	_ser_putch
	line	51
;robot.c: 51: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	53
;robot.c: 53: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	54
	
l6695:	
	line	55
;robot.c: 54: }
;robot.c: 55: ser_putch(156);
	movlw	(09Ch)
	fcall	_ser_putch
	line	57
;robot.c: 57: ser_putch(highByte);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_highByte)^080h,w
	fcall	_ser_putch
	line	59
;robot.c: 59: ser_putch(lowByte);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_lowByte)^080h,w
	fcall	_ser_putch
	line	61
;robot.c: 61: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	63
;robot.c: 63: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	65
;robot.c: 65: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	67
;robot.c: 67: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	69
;robot.c: 69: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	71
	
l6696:	
	return
	opt stack 0
GLOBAL	__end_of_robotMove
	__end_of_robotMove:
;; =============== function _robotMove ends ============

	signat	_robotMove,4216
	global	_rotate
psect	text1144,local,class=CODE,delta=2
global __ptext1144
__ptext1144:

;; *************** function _rotate *****************
;; Defined at:
;;		line 48 in file "E:\Aldnoah.Zero\Assignment3\steppermotor.c"
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
;;		_scan360
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1144
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
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
	
l11932:	
;steppermotor.c: 50: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	51
	
l11934:	
;steppermotor.c: 51: if (direction == 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(rotate@direction)^080h,f
	skipz
	goto	u5691
	goto	u5690
u5691:
	goto	l11938
u5690:
	line	52
	
l11936:	
;steppermotor.c: 52: spi_transfer(0b00001111);
	movlw	(0Fh)
	fcall	_spi_transfer
	goto	l11940
	line	53
	
l3677:	
	line	54
	
l11938:	
;steppermotor.c: 53: else
;steppermotor.c: 54: spi_transfer(0b00001101);
	movlw	(0Dh)
	fcall	_spi_transfer
	goto	l11940
	
l3678:	
	line	55
	
l11940:	
;steppermotor.c: 55: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11942:	
	bcf	(57/8),(57)&7
	line	56
	
l11944:	
;steppermotor.c: 56: for (unsigned char i = 0; i < steps; i++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(rotate@i)^080h
	goto	l11950
	line	57
	
l3680:	
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
	
l11946:	
;steppermotor.c: 59: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_rotate+0)^080h+0+1),f
	movlw	101
movwf	((??_rotate+0)^080h+0),f
u6057:
	decfsz	((??_rotate+0)^080h+0),f
	goto	u6057
	decfsz	((??_rotate+0)^080h+0+1),f
	goto	u6057
	nop2
opt asmopt_on

	line	56
	
l11948:	
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotate+0)^080h+0
	movf	(??_rotate+0)^080h+0,w
	addwf	(rotate@i)^080h,f
	goto	l11950
	
l3679:	
	
l11950:	
	movf	(rotate@steps)^080h,w
	subwf	(rotate@i)^080h,w
	skipc
	goto	u5701
	goto	u5700
u5701:
	goto	l3680
u5700:
	
l3681:	
	line	61
;steppermotor.c: 60: }
;steppermotor.c: 61: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	62
	
l11952:	
;steppermotor.c: 62: spi_transfer(0b00000000);
	movlw	(0)
	fcall	_spi_transfer
	line	63
	
l11954:	
;steppermotor.c: 63: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l11956:	
	bcf	(57/8),(57)&7
	line	64
	
l11958:	
;steppermotor.c: 64: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l11960:	
	nop
	
l11962:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	65
	
l3682:	
	return
	opt stack 0
GLOBAL	__end_of_rotate
	__end_of_rotate:
;; =============== function _rotate ends ============

	signat	_rotate,8312
	global	_robo_init
psect	text1145,local,class=CODE,delta=2
global __ptext1145
__ptext1145:

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
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_ser_putch
;; This function is called by:
;;		_init
;; This function uses a non-reentrant model
;;
psect	text1145
	file	"E:\Aldnoah.Zero\Assignment3\robot.c"
	line	9
	global	__size_of_robo_init
	__size_of_robo_init	equ	__end_of_robo_init-_robo_init
	
_robo_init:	
	opt	stack 0
; Regs used in _robo_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	10
	
l11930:	
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
	
l6686:	
	return
	opt stack 0
GLOBAL	__end_of_robo_init
	__end_of_robo_init:
;; =============== function _robo_init ends ============

	signat	_robo_init,88
	global	_lcd_write_data
psect	text1146,local,class=CODE,delta=2
global __ptext1146
__ptext1146:

;; *************** function _lcd_write_data *****************
;; Defined at:
;;		line 30 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
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
;;		_lcd_write_string
;;		_lcd_write_2_digit_bcd
;;		_lcd_write_3_digit_bcd
;; This function uses a non-reentrant model
;;
psect	text1146
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	30
	global	__size_of_lcd_write_data
	__size_of_lcd_write_data	equ	__end_of_lcd_write_data-_lcd_write_data
	
_lcd_write_data:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _lcd_write_data: [wreg]
;lcd_write_data@databyte stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_write_data@databyte)^080h
	line	31
	
l11922:	
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
	
l11924:	
;lcd.c: 34: PORTD = databyte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_data@databyte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	35
	
l11926:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
l11928:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_lcd_write_data+0)^080h+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)^080h+0),f
u6067:
	decfsz	((??_lcd_write_data+0)^080h+0),f
	goto	u6067
	decfsz	((??_lcd_write_data+0)^080h+0+1),f
	goto	u6067
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
psect	text1147,local,class=CODE,delta=2
global __ptext1147
__ptext1147:

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
;;		_lcd_set_cursor
;;		_lcd_init
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1147
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	18
	global	__size_of_lcd_write_control
	__size_of_lcd_write_control	equ	__end_of_lcd_write_control-_lcd_write_control
	
_lcd_write_control:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _lcd_write_control: [wreg]
;lcd_write_control@databyte stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_write_control@databyte)^080h
	line	19
	
l11914:	
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
	
l11916:	
;lcd.c: 22: PORTD = databyte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_control@databyte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	23
	
l11918:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
l11920:	
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
u6077:
	decfsz	((??_lcd_write_control+0)^080h+0),f
	goto	u6077
	decfsz	((??_lcd_write_control+0)^080h+0+1),f
	goto	u6077
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
psect	text1148,local,class=CODE,delta=2
global __ptext1148
__ptext1148:

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
psect	text1148
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	46
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
	
_init_adc:	
	opt	stack 1
; Regs used in _init_adc: [wreg+status,2]
	line	48
	
l11904:	
;adc.c: 48: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	49
	
l11906:	
;adc.c: 49: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	52
	
l11908:	
;adc.c: 52: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	53
	
l11910:	
;adc.c: 53: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	55
	
l11912:	
;adc.c: 55: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_init_adc+0)^080h+0,f
u6087:
decfsz	(??_init_adc+0)^080h+0,f
	goto	u6087
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
psect	text1149,local,class=CODE,delta=2
global __ptext1149
__ptext1149:

;; *************** function _adc_read_channel *****************
;; Defined at:
;;		line 5 in file "E:\Aldnoah.Zero\Assignment3\adc.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1    7[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_adc_read
;; This function is called by:
;;		_readDistance
;; This function uses a non-reentrant model
;;
psect	text1149
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	5
	global	__size_of_adc_read_channel
	__size_of_adc_read_channel	equ	__end_of_adc_read_channel-_adc_read_channel
	
_adc_read_channel:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _adc_read_channel: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;adc_read_channel@channel stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(adc_read_channel@channel)^080h
	line	6
	
l11888:	
;adc.c: 6: switch(channel)
	goto	l11896
	line	8
;adc.c: 7: {
;adc.c: 8: case 0:
	
l690:	
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
	goto	l11898
	line	13
;adc.c: 13: case 1:
	
l692:	
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
	goto	l11898
	line	18
;adc.c: 18: case 2:
	
l693:	
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
	goto	l11898
	line	23
;adc.c: 23: case 3:
	
l694:	
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
	goto	l11898
	line	28
;adc.c: 28: case 4:
	
l695:	
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
	goto	l11898
	line	35
;adc.c: 35: default:
	
l696:	
	line	36
	
l11890:	
;adc.c: 36: return 0;
	movlw	(0)
	goto	l697
	
l11892:	
	goto	l697
	line	37
	
l11894:	
;adc.c: 37: }
	goto	l11898
	line	6
	
l689:	
	
l11896:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(adc_read_channel@channel)^080h,w
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
	goto	l11890
	opt asmopt_on

	line	37
	
l691:	
	line	39
	
l11898:	
;adc.c: 39: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	(??_adc_read_channel+0)^080h+0,f
u6097:
decfsz	(??_adc_read_channel+0)^080h+0,f
	goto	u6097
opt asmopt_on

	line	41
	
l11900:	
;adc.c: 41: return adc_read();
	fcall	_adc_read
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?_adc_read))^080h,w
	goto	l697
	
l11902:	
	line	43
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
psect	text1150,local,class=CODE,delta=2
global __ptext1150
__ptext1150:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK1 ] int 
;;  dividend        2    2[BANK1 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[BANK1 ] unsigned char 
;;  counter         1    5[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK1 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1150
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 0
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l11546:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(___awmod@sign)^080h
	line	9
	btfss	(___awmod@dividend+1)^080h,7
	goto	u5051
	goto	u5050
u5051:
	goto	l11550
u5050:
	line	10
	
l11548:	
	comf	(___awmod@dividend)^080h,f
	comf	(___awmod@dividend+1)^080h,f
	incf	(___awmod@dividend)^080h,f
	skipnz
	incf	(___awmod@dividend+1)^080h,f
	line	11
	clrf	(___awmod@sign)^080h
	bsf	status,0
	rlf	(___awmod@sign)^080h,f
	goto	l11550
	line	12
	
l7620:	
	line	13
	
l11550:	
	btfss	(___awmod@divisor+1)^080h,7
	goto	u5061
	goto	u5060
u5061:
	goto	l11554
u5060:
	line	14
	
l11552:	
	comf	(___awmod@divisor)^080h,f
	comf	(___awmod@divisor+1)^080h,f
	incf	(___awmod@divisor)^080h,f
	skipnz
	incf	(___awmod@divisor+1)^080h,f
	goto	l11554
	
l7621:	
	line	15
	
l11554:	
	movf	(___awmod@divisor+1)^080h,w
	iorwf	(___awmod@divisor)^080h,w
	skipnz
	goto	u5071
	goto	u5070
u5071:
	goto	l11572
u5070:
	line	16
	
l11556:	
	clrf	(___awmod@counter)^080h
	bsf	status,0
	rlf	(___awmod@counter)^080h,f
	line	17
	goto	l11562
	
l7624:	
	line	18
	
l11558:	
	movlw	01h
	
u5085:
	clrc
	rlf	(___awmod@divisor)^080h,f
	rlf	(___awmod@divisor+1)^080h,f
	addlw	-1
	skipz
	goto	u5085
	line	19
	
l11560:	
	movlw	(01h)
	movwf	(??___awmod+0)^080h+0
	movf	(??___awmod+0)^080h+0,w
	addwf	(___awmod@counter)^080h,f
	goto	l11562
	line	20
	
l7623:	
	line	17
	
l11562:	
	btfss	(___awmod@divisor+1)^080h,(15)&7
	goto	u5091
	goto	u5090
u5091:
	goto	l11558
u5090:
	goto	l11564
	
l7625:	
	goto	l11564
	line	21
	
l7626:	
	line	22
	
l11564:	
	movf	(___awmod@divisor+1)^080h,w
	subwf	(___awmod@dividend+1)^080h,w
	skipz
	goto	u5105
	movf	(___awmod@divisor)^080h,w
	subwf	(___awmod@dividend)^080h,w
u5105:
	skipc
	goto	u5101
	goto	u5100
u5101:
	goto	l11568
u5100:
	line	23
	
l11566:	
	movf	(___awmod@divisor)^080h,w
	subwf	(___awmod@dividend)^080h,f
	movf	(___awmod@divisor+1)^080h,w
	skipc
	decf	(___awmod@dividend+1)^080h,f
	subwf	(___awmod@dividend+1)^080h,f
	goto	l11568
	
l7627:	
	line	24
	
l11568:	
	movlw	01h
	
u5115:
	clrc
	rrf	(___awmod@divisor+1)^080h,f
	rrf	(___awmod@divisor)^080h,f
	addlw	-1
	skipz
	goto	u5115
	line	25
	
l11570:	
	movlw	low(01h)
	subwf	(___awmod@counter)^080h,f
	btfss	status,2
	goto	u5121
	goto	u5120
u5121:
	goto	l11564
u5120:
	goto	l11572
	
l7628:	
	goto	l11572
	line	26
	
l7622:	
	line	27
	
l11572:	
	movf	(___awmod@sign)^080h,w
	skipz
	goto	u5130
	goto	l11576
u5130:
	line	28
	
l11574:	
	comf	(___awmod@dividend)^080h,f
	comf	(___awmod@dividend+1)^080h,f
	incf	(___awmod@dividend)^080h,f
	skipnz
	incf	(___awmod@dividend+1)^080h,f
	goto	l11576
	
l7629:	
	line	29
	
l11576:	
	movf	(___awmod@dividend+1)^080h,w
	clrf	(?___awmod+1)^080h
	addwf	(?___awmod+1)^080h
	movf	(___awmod@dividend)^080h,w
	clrf	(?___awmod)^080h
	addwf	(?___awmod)^080h

	goto	l7630
	
l11578:	
	line	30
	
l7630:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___lwmod
psect	text1151,local,class=CODE,delta=2
global __ptext1151
__ptext1151:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2   14[BANK1 ] unsigned int 
;;  dividend        2   16[BANK1 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   19[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   14[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text1151
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l11524:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(___lwmod@divisor+1)^080h,w
	iorwf	(___lwmod@divisor)^080h,w
	skipnz
	goto	u4991
	goto	u4990
u4991:
	goto	l11542
u4990:
	line	9
	
l11526:	
	clrf	(___lwmod@counter)^080h
	bsf	status,0
	rlf	(___lwmod@counter)^080h,f
	line	10
	goto	l11532
	
l7430:	
	line	11
	
l11528:	
	movlw	01h
	
u5005:
	clrc
	rlf	(___lwmod@divisor)^080h,f
	rlf	(___lwmod@divisor+1)^080h,f
	addlw	-1
	skipz
	goto	u5005
	line	12
	
l11530:	
	movlw	(01h)
	movwf	(??___lwmod+0)^080h+0
	movf	(??___lwmod+0)^080h+0,w
	addwf	(___lwmod@counter)^080h,f
	goto	l11532
	line	13
	
l7429:	
	line	10
	
l11532:	
	btfss	(___lwmod@divisor+1)^080h,(15)&7
	goto	u5011
	goto	u5010
u5011:
	goto	l11528
u5010:
	goto	l11534
	
l7431:	
	goto	l11534
	line	14
	
l7432:	
	line	15
	
l11534:	
	movf	(___lwmod@divisor+1)^080h,w
	subwf	(___lwmod@dividend+1)^080h,w
	skipz
	goto	u5025
	movf	(___lwmod@divisor)^080h,w
	subwf	(___lwmod@dividend)^080h,w
u5025:
	skipc
	goto	u5021
	goto	u5020
u5021:
	goto	l11538
u5020:
	line	16
	
l11536:	
	movf	(___lwmod@divisor)^080h,w
	subwf	(___lwmod@dividend)^080h,f
	movf	(___lwmod@divisor+1)^080h,w
	skipc
	decf	(___lwmod@dividend+1)^080h,f
	subwf	(___lwmod@dividend+1)^080h,f
	goto	l11538
	
l7433:	
	line	17
	
l11538:	
	movlw	01h
	
u5035:
	clrc
	rrf	(___lwmod@divisor+1)^080h,f
	rrf	(___lwmod@divisor)^080h,f
	addlw	-1
	skipz
	goto	u5035
	line	18
	
l11540:	
	movlw	low(01h)
	subwf	(___lwmod@counter)^080h,f
	btfss	status,2
	goto	u5041
	goto	u5040
u5041:
	goto	l11534
u5040:
	goto	l11542
	
l7434:	
	goto	l11542
	line	19
	
l7428:	
	line	20
	
l11542:	
	movf	(___lwmod@dividend+1)^080h,w
	clrf	(?___lwmod+1)^080h
	addwf	(?___lwmod+1)^080h
	movf	(___lwmod@dividend)^080h,w
	clrf	(?___lwmod)^080h
	addwf	(?___lwmod)^080h

	goto	l7435
	
l11544:	
	line	21
	
l7435:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text1152,local,class=CODE,delta=2
global __ptext1152
__ptext1152:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    6[BANK1 ] unsigned int 
;;  dividend        2    8[BANK1 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   11[BANK1 ] unsigned int 
;;  counter         1   13[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    6[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       3       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_readAvgDistance
;;		_ADCconvert
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text1152
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l11498:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(___lwdiv@quotient)^080h
	clrf	(___lwdiv@quotient+1)^080h
	line	10
	
l11500:	
	movf	(___lwdiv@divisor+1)^080h,w
	iorwf	(___lwdiv@divisor)^080h,w
	skipnz
	goto	u4921
	goto	u4920
u4921:
	goto	l11520
u4920:
	line	11
	
l11502:	
	clrf	(___lwdiv@counter)^080h
	bsf	status,0
	rlf	(___lwdiv@counter)^080h,f
	line	12
	goto	l11508
	
l7420:	
	line	13
	
l11504:	
	movlw	01h
	
u4935:
	clrc
	rlf	(___lwdiv@divisor)^080h,f
	rlf	(___lwdiv@divisor+1)^080h,f
	addlw	-1
	skipz
	goto	u4935
	line	14
	
l11506:	
	movlw	(01h)
	movwf	(??___lwdiv+0)^080h+0
	movf	(??___lwdiv+0)^080h+0,w
	addwf	(___lwdiv@counter)^080h,f
	goto	l11508
	line	15
	
l7419:	
	line	12
	
l11508:	
	btfss	(___lwdiv@divisor+1)^080h,(15)&7
	goto	u4941
	goto	u4940
u4941:
	goto	l11504
u4940:
	goto	l11510
	
l7421:	
	goto	l11510
	line	16
	
l7422:	
	line	17
	
l11510:	
	movlw	01h
	
u4955:
	clrc
	rlf	(___lwdiv@quotient)^080h,f
	rlf	(___lwdiv@quotient+1)^080h,f
	addlw	-1
	skipz
	goto	u4955
	line	18
	movf	(___lwdiv@divisor+1)^080h,w
	subwf	(___lwdiv@dividend+1)^080h,w
	skipz
	goto	u4965
	movf	(___lwdiv@divisor)^080h,w
	subwf	(___lwdiv@dividend)^080h,w
u4965:
	skipc
	goto	u4961
	goto	u4960
u4961:
	goto	l11516
u4960:
	line	19
	
l11512:	
	movf	(___lwdiv@divisor)^080h,w
	subwf	(___lwdiv@dividend)^080h,f
	movf	(___lwdiv@divisor+1)^080h,w
	skipc
	decf	(___lwdiv@dividend+1)^080h,f
	subwf	(___lwdiv@dividend+1)^080h,f
	line	20
	
l11514:	
	bsf	(___lwdiv@quotient)^080h+(0/8),(0)&7
	goto	l11516
	line	21
	
l7423:	
	line	22
	
l11516:	
	movlw	01h
	
u4975:
	clrc
	rrf	(___lwdiv@divisor+1)^080h,f
	rrf	(___lwdiv@divisor)^080h,f
	addlw	-1
	skipz
	goto	u4975
	line	23
	
l11518:	
	movlw	low(01h)
	subwf	(___lwdiv@counter)^080h,f
	btfss	status,2
	goto	u4981
	goto	u4980
u4981:
	goto	l11510
u4980:
	goto	l11520
	
l7424:	
	goto	l11520
	line	24
	
l7418:	
	line	25
	
l11520:	
	movf	(___lwdiv@quotient+1)^080h,w
	clrf	(?___lwdiv+1)^080h
	addwf	(?___lwdiv+1)^080h
	movf	(___lwdiv@quotient)^080h,w
	clrf	(?___lwdiv)^080h
	addwf	(?___lwdiv)^080h

	goto	l7425
	
l11522:	
	line	26
	
l7425:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text1153,local,class=CODE,delta=2
global __ptext1153
__ptext1153:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[BANK1 ] unsigned int 
;;  multiplicand    2    2[BANK1 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ADCconvert
;; This function uses a non-reentrant model
;;
psect	text1153
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l11486:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(___wmul@product)^080h
	clrf	(___wmul@product+1)^080h
	goto	l11488
	line	6
	
l7412:	
	line	7
	
l11488:	
	btfss	(___wmul@multiplier)^080h,(0)&7
	goto	u4881
	goto	u4880
u4881:
	goto	l7413
u4880:
	line	8
	
l11490:	
	movf	(___wmul@multiplicand)^080h,w
	addwf	(___wmul@product)^080h,f
	skipnc
	incf	(___wmul@product+1)^080h,f
	movf	(___wmul@multiplicand+1)^080h,w
	addwf	(___wmul@product+1)^080h,f
	
l7413:	
	line	9
	movlw	01h
	
u4895:
	clrc
	rlf	(___wmul@multiplicand)^080h,f
	rlf	(___wmul@multiplicand+1)^080h,f
	addlw	-1
	skipz
	goto	u4895
	line	10
	
l11492:	
	movlw	01h
	
u4905:
	clrc
	rrf	(___wmul@multiplier+1)^080h,f
	rrf	(___wmul@multiplier)^080h,f
	addlw	-1
	skipz
	goto	u4905
	line	11
	movf	((___wmul@multiplier+1)^080h),w
	iorwf	((___wmul@multiplier)^080h),w
	skipz
	goto	u4911
	goto	u4910
u4911:
	goto	l11488
u4910:
	goto	l11494
	
l7414:	
	line	12
	
l11494:	
	movf	(___wmul@product+1)^080h,w
	clrf	(?___wmul+1)^080h
	addwf	(?___wmul+1)^080h
	movf	(___wmul@product)^080h,w
	clrf	(?___wmul)^080h
	addwf	(?___wmul)^080h

	goto	l7415
	
l11496:	
	line	13
	
l7415:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_ser_putch
psect	text1154,local,class=CODE,delta=2
global __ptext1154
__ptext1154:

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
psect	text1154
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
	
l11386:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l11388
	
l4423:	
	line	72
;ser.c: 72: continue;
	goto	l11388
	
l4422:	
	line	71
	
l11388:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	xorwf	(_txoptr),w	;volatile
	skipnz
	goto	u4651
	goto	u4650
u4651:
	goto	l11388
u4650:
	
l4424:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l11390:	
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
	bsf	status, 7	;select IRP bank3
	movwf	indf
	line	75
	
l11392:	
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
	
l11394:	
;ser.c: 76: TXIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1124/8)^080h,(1124)&7
	line	77
	
l11396:	
;ser.c: 77: GIE=1;
	bsf	(95/8),(95)&7
	line	78
	
l4425:	
	return
	opt stack 0
GLOBAL	__end_of_ser_putch
	__end_of_ser_putch:
;; =============== function _ser_putch ends ============

	signat	_ser_putch,4216
	global	_spi_transfer
psect	text1155,local,class=CODE,delta=2
global __ptext1155
__ptext1155:

;; *************** function _spi_transfer *****************
;; Defined at:
;;		line 34 in file "E:\Aldnoah.Zero\Assignment3\steppermotor.c"
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
psect	text1155
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
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
	
l11284:	
;steppermotor.c: 35: unsigned char temp = 0;
	clrf	(spi_transfer@temp)^080h
	line	37
;steppermotor.c: 37: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	38
	
l11286:	
;steppermotor.c: 38: SSPBUF = data;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(spi_transfer@data)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	40
;steppermotor.c: 40: while (SSPIF == 0);
	goto	l3671
	
l3672:	
	
l3671:	
	btfss	(99/8),(99)&7
	goto	u4571
	goto	u4570
u4571:
	goto	l3671
u4570:
	goto	l11288
	
l3673:	
	line	41
	
l11288:	
;steppermotor.c: 41: temp = SSPBUF;
	movf	(19),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_spi_transfer+0)^080h+0
	movf	(??_spi_transfer+0)^080h+0,w
	movwf	(spi_transfer@temp)^080h
	line	42
	
l11290:	
;steppermotor.c: 42: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	goto	l3674
	line	44
	
l11292:	
	line	45
;steppermotor.c: 44: return temp;
;	Return value of _spi_transfer is never used
	
l3674:	
	return
	opt stack 0
GLOBAL	__end_of_spi_transfer
	__end_of_spi_transfer:
;; =============== function _spi_transfer ends ============

	signat	_spi_transfer,4217
	global	_Menu
psect	text1156,local,class=CODE,delta=2
global __ptext1156
__ptext1156:

;; *************** function _Menu *****************
;; Defined at:
;;		line 180 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
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
psect	text1156
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
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
	
l11260:	
;HMI.c: 181: switch (input)
	goto	l11278
	line	183
;HMI.c: 182: {
;HMI.c: 183: case 1:
	
l5225:	
	line	185
;HMI.c: 185: break;
	goto	l11280
	line	186
;HMI.c: 186: case 2:
	
l5227:	
	line	188
;HMI.c: 188: break;
	goto	l11280
	line	189
;HMI.c: 189: case 3:
	
l5228:	
	line	190
	
l11262:	
;HMI.c: 190: pos--;
	movlw	low(-1)
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(-1)
	addwf	(_pos+1)^080h,f
	line	191
	
l11264:	
;HMI.c: 191: if (pos < 0)
	btfss	(_pos+1)^080h,7
	goto	u4551
	goto	u4550
u4551:
	goto	l11280
u4550:
	line	192
	
l11266:	
;HMI.c: 192: pos = 5 - 1;
	movlw	low(04h)
	movwf	(_pos)^080h
	movlw	high(04h)
	movwf	((_pos)^080h)+1
	goto	l11280
	
l5229:	
	line	194
;HMI.c: 194: break;
	goto	l11280
	line	195
;HMI.c: 195: case 4:
	
l5230:	
	line	196
	
l11268:	
;HMI.c: 196: pos++;
	movlw	low(01h)
	addwf	(_pos)^080h,f
	skipnc
	incf	(_pos+1)^080h,f
	movlw	high(01h)
	addwf	(_pos+1)^080h,f
	line	197
;HMI.c: 197: if (pos == 5)
	movlw	05h
	xorwf	(_pos)^080h,w
	iorwf	(_pos+1)^080h,w
	skipz
	goto	u4561
	goto	u4560
u4561:
	goto	l11280
u4560:
	line	198
	
l11270:	
;HMI.c: 198: pos = 0;
	clrf	(_pos)^080h
	clrf	(_pos+1)^080h
	goto	l11280
	
l5231:	
	line	200
;HMI.c: 200: break;
	goto	l11280
	line	201
;HMI.c: 201: case 5:
	
l5232:	
	line	202
	
l11272:	
;HMI.c: 202: return pos;
	movf	(_pos)^080h,w
	goto	l5233
	
l11274:	
	goto	l5233
	line	205
;HMI.c: 205: default:
	
l5234:	
	line	207
;HMI.c: 207: break;
	goto	l11280
	line	208
	
l11276:	
;HMI.c: 208: }
	goto	l11280
	line	181
	
l5224:	
	
l11278:	
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
	goto	l11280
	xorlw	2^1	; case 2
	skipnz
	goto	l11280
	xorlw	3^2	; case 3
	skipnz
	goto	l11262
	xorlw	4^3	; case 4
	skipnz
	goto	l11268
	xorlw	5^4	; case 5
	skipnz
	goto	l11272
	goto	l11280
	opt asmopt_on

	line	208
	
l5226:	
	line	209
	
l11280:	
;HMI.c: 209: return 255;
	movlw	(0FFh)
	goto	l5233
	
l11282:	
	line	210
	
l5233:	
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4217
	global	_ser_init
psect	text1157,local,class=CODE,delta=2
global __ptext1157
__ptext1157:

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
psect	text1157
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 1
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l11234:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l11236:	
;ser.c: 115: TRISC &= 0b10111111;
	movlw	(0BFh)
	movwf	(??_ser_init+0)^080h+0
	movf	(??_ser_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	116
	
l11238:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l11240:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l11242:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l11244:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l11246:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l11248:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l11250:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l11252:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l11254:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l11256:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l11258:	
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
	
l4447:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_adc_read
psect	text1158,local,class=CODE,delta=2
global __ptext1158
__ptext1158:

;; *************** function _adc_read *****************
;; Defined at:
;;		line 61 in file "E:\Aldnoah.Zero\Assignment3\adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adc_value       2    4[BANK1 ] volatile unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       2       0       0
;;      Totals:         0       0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_adc_read_channel
;; This function uses a non-reentrant model
;;
psect	text1158
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	64
	
l11100:	
;adc.c: 62: volatile unsigned int adc_value;
;adc.c: 64: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	66
	
l11102:	
;adc.c: 66: GO = 1;
	bsf	(250/8),(250)&7
	line	67
;adc.c: 67: while(GO) continue;
	goto	l703
	
l704:	
	
l703:	
	btfsc	(250/8),(250)&7
	goto	u4331
	goto	u4330
u4331:
	goto	l703
u4330:
	
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
psect	text1158
	line	73
	
l11104:	
;adc.c: 73: adc_value = ADRESH;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(30),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_adc_read+0)^080h+0
	clrf	(??_adc_read+0)^080h+0+1
	movf	0+(??_adc_read+0)^080h+0,w
	movwf	(adc_read@adc_value)^080h	;volatile
	movf	1+(??_adc_read+0)^080h+0,w
	movwf	(adc_read@adc_value+1)^080h	;volatile
	line	74
;adc.c: 74: adc_value <<= 1;
	movlw	01h
	
u4345:
	clrc
	rlf	(adc_read@adc_value)^080h,f	;volatile
	rlf	(adc_read@adc_value+1)^080h,f	;volatile
	addlw	-1
	skipz
	goto	u4345
	line	75
;adc.c: 75: adc_value |= (ADRESL >> 15);
	movf	(158)^080h,w	;volatile
	line	78
	
l11106:	
;adc.c: 78: return (adc_value);
	movf	(adc_read@adc_value+1)^080h,w	;volatile
	clrf	(?_adc_read+1)^080h
	addwf	(?_adc_read+1)^080h
	movf	(adc_read@adc_value)^080h,w	;volatile
	clrf	(?_adc_read)^080h
	addwf	(?_adc_read)^080h

	goto	l706
	
l11108:	
	line	79
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
	global	_isr1
psect	text1159,local,class=CODE,delta=2
global __ptext1159
__ptext1159:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 87 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;		i1___lwmod
;;		i1_readAvgDistance
;;		i1_UpdateDisplay
;;		_ReadButtons
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1159
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	87
	global	__size_of_isr1
	__size_of_isr1	equ	__end_of_isr1-_isr1
	
_isr1:	
;; hardware stack exceeded
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
psect	text1159
	line	89
	
i1l11136:	
;Main.c: 89: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	btfss	(101/8),(101)&7
	goto	u438_21
	goto	u438_20
u438_21:
	goto	i1l11146
u438_20:
	
i1l11138:	
	movf	(26),w	;volatile
	movwf	(??_isr1+0)+0
	movf	(_rxiptr),w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	movf	(??_isr1+0)+0,w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	
i1l11140:	
	movf	(_rxiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_ser_tmp)
	
i1l11142:	
	movf	(_ser_tmp),w
	xorwf	(_rxoptr),w	;volatile
	skipnz
	goto	u439_21
	goto	u439_20
u439_21:
	goto	i1l11146
u439_20:
	
i1l11144:	
	movf	(_ser_tmp),w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)	;volatile
	goto	i1l11146
	
i1l2197:	
	goto	i1l11146
	
i1l2196:	
	
i1l11146:	
	btfss	(100/8),(100)&7
	goto	u440_21
	goto	u440_20
u440_21:
	goto	i1l2198
u440_20:
	
i1l11148:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u441_21
	goto	u441_20
u441_21:
	goto	i1l2198
u441_20:
	
i1l11150:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_txoptr),w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(25)	;volatile
	
i1l11152:	
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	addwf	(_txoptr),f	;volatile
	
i1l11154:	
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr),f	;volatile
	
i1l11156:	
	movf	(_txoptr),w	;volatile
	xorwf	(_txiptr),w	;volatile
	skipz
	goto	u442_21
	goto	u442_20
u442_21:
	goto	i1l2198
u442_20:
	
i1l11158:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2198
	
i1l2199:	
	
i1l2198:	
	line	92
;Main.c: 92: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u443_21
	goto	u443_20
u443_21:
	goto	i1l2207
u443_20:
	line	94
	
i1l11160:	
;Main.c: 93: {
;Main.c: 94: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	95
	
i1l11162:	
;Main.c: 95: TMR0 = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	97
;Main.c: 97: RTC_Counter++;
	movlw	low(01h)
	addwf	(_RTC_Counter),f	;volatile
	skipnc
	incf	(_RTC_Counter+1),f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1),f	;volatile
	line	99
	
i1l11164:	
;Main.c: 99: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	100
	
i1l11166:	
;Main.c: 100: if(RTC_Counter % 10 == 0)
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((1+(?i1___lwmod))),w
	iorwf	((0+(?i1___lwmod))),w
	skipz
	goto	u444_21
	goto	u444_20
u444_21:
	goto	i1l11170
u444_20:
	line	102
	
i1l11168:	
;Main.c: 101: {
;Main.c: 102: RTC_FLAG_10MS = 1;
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l11170
	line	105
	
i1l2201:	
	line	106
	
i1l11170:	
;Main.c: 105: }
;Main.c: 106: if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
	movlw	low(032h)
	movwf	(?i1___lwmod)
	movlw	high(032h)
	movwf	((?i1___lwmod))+1
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?i1___lwmod)+02h
	addwf	1+(?i1___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?i1___lwmod)+02h
	addwf	0+(?i1___lwmod)+02h

	fcall	i1___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((1+(?i1___lwmod))),w
	iorwf	((0+(?i1___lwmod))),w
	skipz
	goto	u445_21
	goto	u445_20
u445_21:
	goto	i1l11174
u445_20:
	
i1l11172:	
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l11174
	
i1l2202:	
	line	107
	
i1l11174:	
;Main.c: 107: if(RTC_Counter % 250 == 0)
	movlw	low(0FAh)
	movwf	(?i1___lwmod)
	movlw	high(0FAh)
	movwf	((?i1___lwmod))+1
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?i1___lwmod)+02h
	addwf	1+(?i1___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?i1___lwmod)+02h
	addwf	0+(?i1___lwmod)+02h

	fcall	i1___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((1+(?i1___lwmod))),w
	iorwf	((0+(?i1___lwmod))),w
	skipz
	goto	u446_21
	goto	u446_20
u446_21:
	goto	i1l11184
u446_20:
	line	109
	
i1l11176:	
;Main.c: 108: {
;Main.c: 109: if (SCAN_FLAG == 0)
	movf	(_SCAN_FLAG),f
	skipz
	goto	u447_21
	goto	u447_20
u447_21:
	goto	i1l11182
u447_20:
	line	111
	
i1l11178:	
;Main.c: 110: {
;Main.c: 111: readAvgDistance();
	fcall	i1_readAvgDistance
	line	112
	
i1l11180:	
;Main.c: 112: UpdateDisplay(serialInput);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_serialInput),w	;volatile
	fcall	i1_UpdateDisplay
	goto	i1l11182
	line	113
	
i1l2204:	
	line	114
	
i1l11182:	
;Main.c: 113: }
;Main.c: 114: RTC_FLAG_250MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l11184
	line	116
	
i1l2203:	
	line	117
	
i1l11184:	
;Main.c: 116: }
;Main.c: 117: if(RTC_Counter % 500 == 0)
	movlw	low(01F4h)
	movwf	(?i1___lwmod)
	movlw	high(01F4h)
	movwf	((?i1___lwmod))+1
	movf	(_RTC_Counter+1),w	;volatile
	clrf	1+(?i1___lwmod)+02h
	addwf	1+(?i1___lwmod)+02h
	movf	(_RTC_Counter),w	;volatile
	clrf	0+(?i1___lwmod)+02h
	addwf	0+(?i1___lwmod)+02h

	fcall	i1___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((1+(?i1___lwmod))),w
	iorwf	((0+(?i1___lwmod))),w
	skipz
	goto	u448_21
	goto	u448_20
u448_21:
	goto	i1l11192
u448_20:
	line	119
	
i1l11186:	
;Main.c: 118: {
;Main.c: 119: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	120
	
i1l11188:	
;Main.c: 120: RTC_Counter = 0;
	clrf	(_RTC_Counter)	;volatile
	clrf	(_RTC_Counter+1)	;volatile
	line	121
	
i1l11190:	
;Main.c: 121: RB0 ^= 0x01;
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l11192
	line	122
	
i1l2205:	
	line	124
	
i1l11192:	
;Main.c: 122: }
;Main.c: 124: if (buttonPressed == 0)
	movf	(_buttonPressed),f
	skipz	;volatile
	goto	u449_21
	goto	u449_20
u449_21:
	goto	i1l2207
u449_20:
	line	126
	
i1l11194:	
;Main.c: 125: {
;Main.c: 126: buttonPressed = ReadButtons();
	fcall	_ReadButtons
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_buttonPressed)	;volatile
	goto	i1l2207
	line	127
	
i1l2206:	
	goto	i1l2207
	line	128
	
i1l2200:	
	line	129
	
i1l2207:	
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
	global	i1_UpdateDisplay
psect	text1160,local,class=CODE,delta=2
global __ptext1160
__ptext1160:

;; *************** function i1_UpdateDisplay *****************
;; Defined at:
;;		line 215 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
;; Parameters:    Size  Location     Type
;;  UpdateDispla    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  UpdateDispla    1 (no storage) unsigned char 
;;  UpdateDispla   16   28[BANK0 ] unsigned char [16]
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		i1_lcd_write_control
;;		i1_sprintf
;;		i1_lcd_set_cursor
;;		i1_lcd_write_string
;;		i1___awmod
;; This function is called by:
;;		_isr1
;; This function uses a non-reentrant model
;;
psect	text1160
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	215
	global	__size_ofi1_UpdateDisplay
	__size_ofi1_UpdateDisplay	equ	__end_ofi1_UpdateDisplay-i1_UpdateDisplay
	
i1_UpdateDisplay:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1_UpdateDisplay: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	216
	
i1l11696:	
;HMI.c: 216: char adcOutput[16] = "";
	movlw	(i1UpdateDisplay@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1223)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??i1_UpdateDisplay+0)+0
	movf	fsr0,w
	movwf	((??i1_UpdateDisplay+0)+0+1)
	movlw	16
	movwf	((??i1_UpdateDisplay+0)+0+2)
u533_20:
	movf	(??i1_UpdateDisplay+0)+0,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	
	movf	indf,w
	movwf	((??i1_UpdateDisplay+0)+0+3)
	incf	(??i1_UpdateDisplay+0)+0,f
	movf	((??i1_UpdateDisplay+0)+0+1),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	((??i1_UpdateDisplay+0)+0+3),w
	movwf	indf
	incf	((??i1_UpdateDisplay+0)+0+1),f
	decfsz	((??i1_UpdateDisplay+0)+0+2),f
	goto	u533_20
	line	217
;HMI.c: 217: switch (currentMenu)
	goto	i1l11734
	line	220
;HMI.c: 218: {
;HMI.c: 220: case 0:
	
i1l5240:	
	line	221
	
i1l11698:	
;HMI.c: 221: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	i1_lcd_write_control
	line	222
	
i1l11700:	
;HMI.c: 222: sprintf(adcOutput,"ADC:%d Dist:%d",adcVal, test);
	movlw	((STR_11-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??i1_UpdateDisplay+0)+0
	movf	(??i1_UpdateDisplay+0)+0,w
	movwf	(?i1_sprintf)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?i1_sprintf)+01h
	addwf	1+(?i1_sprintf)+01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?i1_sprintf)+01h
	addwf	0+(?i1_sprintf)+01h

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_test+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?i1_sprintf)+03h
	addwf	1+(?i1_sprintf)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_test)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?i1_sprintf)+03h
	addwf	0+(?i1_sprintf)+03h

	movlw	(i1UpdateDisplay@adcOutput)&0ffh
	fcall	i1_sprintf
	line	225
	
i1l11702:	
;HMI.c: 225: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	i1_lcd_set_cursor
	line	226
;HMI.c: 226: lcd_write_string(adcOutput);
	movlw	(i1UpdateDisplay@adcOutput&0ffh)
	movwf	(?i1_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?i1_lcd_write_string+1)
	fcall	i1_lcd_write_string
	line	231
	
i1l11704:	
;HMI.c: 231: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	i1_lcd_set_cursor
	line	232
	
i1l11706:	
;HMI.c: 232: if (pos > 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u534_25
	movlw	low(01h)
	subwf	(_pos)^080h,w
u534_25:

	skipc
	goto	u534_21
	goto	u534_20
u534_21:
	goto	i1l11710
u534_20:
	line	233
	
i1l11708:	
;HMI.c: 233: lcd_write_string(shortMenuStrings[pos - 1]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	0FFh
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(?i1_lcd_write_string)
	movlw	80h
	movwf	(?i1_lcd_write_string+1)
	fcall	i1_lcd_write_string
	goto	i1l11712
	line	234
	
i1l5241:	
	line	235
	
i1l11710:	
;HMI.c: 234: else
;HMI.c: 235: lcd_write_string(shortMenuStrings[pos + 5 - 1]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	04h
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(?i1_lcd_write_string)
	movlw	80h
	movwf	(?i1_lcd_write_string+1)
	fcall	i1_lcd_write_string
	goto	i1l11712
	
i1l5242:	
	line	236
	
i1l11712:	
;HMI.c: 236: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	i1_lcd_set_cursor
	line	237
	
i1l11714:	
;HMI.c: 237: lcd_write_string(menuStrings[pos]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	_menuStrings&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(?i1_lcd_write_string)
	movlw	80h
	movwf	(?i1_lcd_write_string+1)
	fcall	i1_lcd_write_string
	line	238
;HMI.c: 238: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	i1_lcd_set_cursor
	line	239
	
i1l11716:	
;HMI.c: 239: lcd_write_string(shortMenuStrings[(pos + 1) % 5]);
	movlw	low(05h)
	movwf	(?i1___awmod)
	movlw	high(05h)
	movwf	((?i1___awmod))+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_pos)^080h,w
	addlw	low(01h)
	movwf	0+(?i1___awmod)+02h
	movf	(_pos+1)^080h,w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+0+(?i1___awmod)+02h
	fcall	i1___awmod
	movf	(0+(?i1___awmod)),w
	addlw	_shortMenuStrings&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(?i1_lcd_write_string)
	movlw	80h
	movwf	(?i1_lcd_write_string+1)
	fcall	i1_lcd_write_string
	line	240
;HMI.c: 240: break;
	goto	i1l5246
	line	241
;HMI.c: 241: case 1:
	
i1l5244:	
	line	242
	
i1l11718:	
;HMI.c: 242: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	i1_lcd_write_control
	line	244
	
i1l11720:	
;HMI.c: 244: sprintf(adcOutput,"ADC:%d Dist:%d",highByte, lowByte);
	movlw	((STR_12-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??i1_UpdateDisplay+0)+0
	movf	(??i1_UpdateDisplay+0)+0,w
	movwf	(?i1_sprintf)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_highByte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??i1_UpdateDisplay+1)+0
	clrf	(??i1_UpdateDisplay+1)+0+1
	movf	0+(??i1_UpdateDisplay+1)+0,w
	movwf	0+(?i1_sprintf)+01h
	movf	1+(??i1_UpdateDisplay+1)+0,w
	movwf	1+(?i1_sprintf)+01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_lowByte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??i1_UpdateDisplay+3)+0
	clrf	(??i1_UpdateDisplay+3)+0+1
	movf	0+(??i1_UpdateDisplay+3)+0,w
	movwf	0+(?i1_sprintf)+03h
	movf	1+(??i1_UpdateDisplay+3)+0,w
	movwf	1+(?i1_sprintf)+03h
	movlw	(i1UpdateDisplay@adcOutput)&0ffh
	fcall	i1_sprintf
	line	246
	
i1l11722:	
;HMI.c: 246: lcd_set_cursor(0x00);
	movlw	(0)
	fcall	i1_lcd_set_cursor
	line	247
;HMI.c: 247: lcd_write_string(adcOutput);
	movlw	(i1UpdateDisplay@adcOutput&0ffh)
	movwf	(?i1_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?i1_lcd_write_string+1)
	fcall	i1_lcd_write_string
	line	252
	
i1l11724:	
;HMI.c: 252: lcd_set_cursor(0x40);
	movlw	(040h)
	fcall	i1_lcd_set_cursor
	line	254
	
i1l11726:	
;HMI.c: 254: lcd_write_string("<<<");
	movlw	low((STR_13-__stringbase))
	movwf	(?i1_lcd_write_string)
	movlw	80h
	movwf	(?i1_lcd_write_string+1)
	fcall	i1_lcd_write_string
	line	257
;HMI.c: 257: lcd_set_cursor(0x44);
	movlw	(044h)
	fcall	i1_lcd_set_cursor
	line	258
	
i1l11728:	
;HMI.c: 258: lcd_write_string("CONFIRM");
	movlw	low((STR_14-__stringbase))
	movwf	(?i1_lcd_write_string)
	movlw	80h
	movwf	(?i1_lcd_write_string+1)
	fcall	i1_lcd_write_string
	line	259
	
i1l11730:	
;HMI.c: 259: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	i1_lcd_set_cursor
	line	260
;HMI.c: 260: lcd_write_string(">>>");
	movlw	low((STR_15-__stringbase))
	movwf	(?i1_lcd_write_string)
	movlw	80h
	movwf	(?i1_lcd_write_string+1)
	fcall	i1_lcd_write_string
	line	261
;HMI.c: 261: break;
	goto	i1l5246
	line	263
;HMI.c: 263: default:
	
i1l5245:	
	line	265
;HMI.c: 265: break;
	goto	i1l5246
	line	268
	
i1l11732:	
;HMI.c: 268: }
	goto	i1l5246
	line	217
	
i1l5239:	
	
i1l11734:	
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
	goto	i1l11698
	xorlw	1^0	; case 1
	skipnz
	goto	i1l11718
	goto	i1l5246
	opt asmopt_on

	line	268
	
i1l5243:	
	line	269
	
i1l5246:	
	return
	opt stack 0
GLOBAL	__end_ofi1_UpdateDisplay
	__end_ofi1_UpdateDisplay:
;; =============== function i1_UpdateDisplay ends ============

	signat	i1_UpdateDisplay,88
	global	i1_readAvgDistance
psect	text1161,local,class=CODE,delta=2
global __ptext1161
__ptext1161:

;; *************** function i1_readAvgDistance *****************
;; Defined at:
;;		line 10 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  readAvgDista    2    4[BANK0 ] int 
;;  readAvgDista    2    2[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		i1_readDistance
;;		i1___lwdiv
;;		i1_ADCconvert
;; This function is called by:
;;		_isr1
;; This function uses a non-reentrant model
;;
psect	text1161
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	10
	global	__size_ofi1_readAvgDistance
	__size_ofi1_readAvgDistance	equ	__end_ofi1_readAvgDistance-i1_readAvgDistance
	
i1_readAvgDistance:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1_readAvgDistance: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	11
	
i1l11634:	
;infrared.c: 11: unsigned int fullval = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(i1readAvgDistance@fullval)
	clrf	(i1readAvgDistance@fullval+1)
	line	14
;infrared.c: 14: for (int i = 0; i < 10; i++)
	clrf	(i1readAvgDistance@i)
	clrf	(i1readAvgDistance@i+1)
	
i1l11636:	
	movf	(i1readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u517_25
	movlw	low(0Ah)
	subwf	(i1readAvgDistance@i),w
u517_25:

	skipc
	goto	u517_21
	goto	u517_20
u517_21:
	goto	i1l11640
u517_20:
	goto	i1l11646
	
i1l11638:	
	goto	i1l11646
	line	15
	
i1l2955:	
	line	16
	
i1l11640:	
;infrared.c: 15: {
;infrared.c: 16: fullval += readDistance();
	fcall	i1_readDistance
	movf	(0+(?i1_readDistance)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(i1readAvgDistance@fullval),f
	skipnc
	incf	(i1readAvgDistance@fullval+1),f
	movf	(1+(?i1_readDistance)),w
	addwf	(i1readAvgDistance@fullval+1),f
	line	14
	
i1l11642:	
	movlw	low(01h)
	addwf	(i1readAvgDistance@i),f
	skipnc
	incf	(i1readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(i1readAvgDistance@i+1),f
	
i1l11644:	
	movf	(i1readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u518_25
	movlw	low(0Ah)
	subwf	(i1readAvgDistance@i),w
u518_25:

	skipc
	goto	u518_21
	goto	u518_20
u518_21:
	goto	i1l11640
u518_20:
	goto	i1l11646
	
i1l2956:	
	line	19
	
i1l11646:	
;infrared.c: 18: }
;infrared.c: 19: adcVal = fullval / 10;
	movlw	low(0Ah)
	movwf	(?i1___lwdiv)
	movlw	high(0Ah)
	movwf	((?i1___lwdiv))+1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(i1readAvgDistance@fullval+1),w
	clrf	1+(?i1___lwdiv)+02h
	addwf	1+(?i1___lwdiv)+02h
	movf	(i1readAvgDistance@fullval),w
	clrf	0+(?i1___lwdiv)+02h
	addwf	0+(?i1___lwdiv)+02h

	fcall	i1___lwdiv
	movf	(1+(?i1___lwdiv)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_adcVal+1)^080h	;volatile
	addwf	(_adcVal+1)^080h	;volatile
	movf	(0+(?i1___lwdiv)),w
	clrf	(_adcVal)^080h	;volatile
	addwf	(_adcVal)^080h	;volatile

	line	20
;infrared.c: 20: ADCconvert();
	fcall	i1_ADCconvert
	line	21
	
i1l2957:	
	return
	opt stack 0
GLOBAL	__end_ofi1_readAvgDistance
	__end_ofi1_readAvgDistance:
;; =============== function i1_readAvgDistance ends ============

	signat	i1_readAvgDistance,88
	global	i1_readDistance
psect	text1162,local,class=CODE,delta=2
global __ptext1162
__ptext1162:

;; *************** function i1_readDistance *****************
;; Defined at:
;;		line 24 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  readDistance    2   12[COMMON] unsigned int 
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
;;		i1_adc_read_channel
;; This function is called by:
;;		i1_readAvgDistance
;; This function uses a non-reentrant model
;;
psect	text1162
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	24
	global	__size_ofi1_readDistance
	__size_ofi1_readDistance	equ	__end_ofi1_readDistance-i1_readDistance
	
i1_readDistance:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1_readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	27
	
i1l11648:	
;infrared.c: 25: unsigned int fullval ;
;infrared.c: 27: fullval = adc_read_channel(0);
	movlw	(0)
	fcall	i1_adc_read_channel
	movwf	(??i1_readDistance+0)+0
	clrf	(??i1_readDistance+0)+0+1
	movf	0+(??i1_readDistance+0)+0,w
	movwf	(i1readDistance@fullval)
	movf	1+(??i1_readDistance+0)+0,w
	movwf	(i1readDistance@fullval+1)
	line	29
	
i1l11650:	
;infrared.c: 29: return fullval;
	movf	(i1readDistance@fullval+1),w
	clrf	(?i1_readDistance+1)
	addwf	(?i1_readDistance+1)
	movf	(i1readDistance@fullval),w
	clrf	(?i1_readDistance)
	addwf	(?i1_readDistance)

	goto	i1l2960
	
i1l11652:	
	line	30
	
i1l2960:	
	return
	opt stack 0
GLOBAL	__end_ofi1_readDistance
	__end_ofi1_readDistance:
;; =============== function i1_readDistance ends ============

	signat	i1_readDistance,90
	global	i1_lcd_write_string
psect	text1163,local,class=CODE,delta=2
global __ptext1163
__ptext1163:

;; *************** function i1_lcd_write_string *****************
;; Defined at:
;;		line 48 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  lcd_write_st    2    7[COMMON] PTR unsigned char 
;;		 -> i1UpdateDisplay@adcOutput(16), STR_15(4), STR_14(8), STR_13(4), 
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
;;		i1_lcd_write_data
;; This function is called by:
;;		i1_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1163
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	48
	global	__size_ofi1_lcd_write_string
	__size_ofi1_lcd_write_string	equ	__end_ofi1_lcd_write_string-i1_lcd_write_string
	
i1_lcd_write_string:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1_lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
i1l11626:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	i1l11632
	
i1l1409:	
	
i1l11628:	
	movf	(i1lcd_write_string@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(i1lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	i1_lcd_write_data
	
i1l11630:	
	movlw	low(01h)
	addwf	(i1lcd_write_string@s),f
	skipnc
	incf	(i1lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(i1lcd_write_string@s+1),f
	goto	i1l11632
	
i1l1408:	
	
i1l11632:	
	movf	(i1lcd_write_string@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(i1lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u516_21
	goto	u516_20
u516_21:
	goto	i1l11628
u516_20:
	goto	i1l1411
	
i1l1410:	
	line	51
	
i1l1411:	
	return
	opt stack 0
GLOBAL	__end_ofi1_lcd_write_string
	__end_ofi1_lcd_write_string:
;; =============== function i1_lcd_write_string ends ============

	signat	i1_lcd_write_string,88
	global	i1_lcd_set_cursor
psect	text1164,local,class=CODE,delta=2
global __ptext1164
__ptext1164:

;; *************** function i1_lcd_set_cursor *****************
;; Defined at:
;;		line 42 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  lcd_set_curs    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  lcd_set_curs    1    3[COMMON] unsigned char 
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
;;		i1_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1164
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	42
	global	__size_ofi1_lcd_set_cursor
	__size_ofi1_lcd_set_cursor	equ	__end_ofi1_lcd_set_cursor-i1_lcd_set_cursor
	
i1_lcd_set_cursor:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1_lcd_set_cursor: [wreg+status,2+status,0+pclath+cstack]
;i1lcd_set_cursor@address stored from wreg
	movwf	(i1lcd_set_cursor@address)
	line	43
	
i1l11622:	
;lcd.c: 43: address |= 0b10000000;
	bsf	(i1lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
i1l11624:	
;lcd.c: 44: lcd_write_control(address);
	movf	(i1lcd_set_cursor@address),w
	fcall	i1_lcd_write_control
	line	45
	
i1l1405:	
	return
	opt stack 0
GLOBAL	__end_ofi1_lcd_set_cursor
	__end_ofi1_lcd_set_cursor:
;; =============== function i1_lcd_set_cursor ends ============

	signat	i1_lcd_set_cursor,88
	global	i1_sprintf
psect	text1165,local,class=CODE,delta=2
global __ptext1165
__ptext1165:

;; *************** function i1_sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sprintf         1    wreg     PTR unsigned char 
;;		 -> i1UpdateDisplay@adcOutput(16), 
;;  sprintf         1    6[BANK0 ] PTR const unsigned char 
;;		 -> STR_12(15), STR_11(15), 
;; Auto vars:     Size  Location     Type
;;  sprintf         1   21[BANK0 ] PTR unsigned char 
;;		 -> i1UpdateDisplay@adcOutput(16), 
;;  sprintf         4   17[BANK0 ] struct .
;;  sprintf         1   22[BANK0 ] char 
;;  sprintf         1   16[BANK0 ] char 
;;  sprintf         1   15[BANK0 ] unsigned char 
;;  sprintf         1   14[BANK0 ] PTR void [1]
;;		 -> ?i1_sprintf(2), 
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
;;		i1___lwdiv
;;		i1___lwmod
;; This function is called by:
;;		i1_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1165
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\lib\doprnt.c"
	line	488
	global	__size_ofi1_sprintf
	__size_ofi1_sprintf	equ	__end_ofi1_sprintf-i1_sprintf
	
i1_sprintf:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1_sprintf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;i1sprintf@sp stored from wreg
	line	537
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(i1sprintf@sp)
	
i1l11736:	
;doprnt.c: 489: va_list ap;
;doprnt.c: 494: signed char c;
;doprnt.c: 501: signed char prec;
;doprnt.c: 503: unsigned char flag;
;doprnt.c: 522: union {
;doprnt.c: 523: unsigned int _val;
;doprnt.c: 524: struct {
;doprnt.c: 525: const char * _cp;
;doprnt.c: 526: unsigned _len;
;doprnt.c: 527: } _str;
;doprnt.c: 528: } _val;
;doprnt.c: 537: *ap = __va_start();
	movlw	(?i1_sprintf+01h)&0ffh
	movwf	(??i1_sprintf+0)+0
	movf	(??i1_sprintf+0)+0,w
	movwf	(i1sprintf@ap)
	line	540
;doprnt.c: 540: while(c = *f++) {
	goto	i1l11788
	
i1l6711:	
	line	542
	
i1l11738:	
;doprnt.c: 542: if(c != '%')
	movf	(i1sprintf@c),w
	xorlw	025h
	skipnz
	goto	u535_21
	goto	u535_20
u535_21:
	goto	i1l6712
u535_20:
	line	545
	
i1l11740:	
;doprnt.c: 544: {
;doprnt.c: 545: ((*sp++ = (c)));
	movf	(i1sprintf@c),w
	movwf	(??i1_sprintf+0)+0
	movf	(i1sprintf@sp),w
	movwf	fsr0
	movf	(??i1_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l11742:	
	movlw	(01h)
	movwf	(??i1_sprintf+0)+0
	movf	(??i1_sprintf+0)+0,w
	addwf	(i1sprintf@sp),f
	line	546
;doprnt.c: 546: continue;
	goto	i1l11788
	line	547
	
i1l6712:	
	line	552
;doprnt.c: 547: }
;doprnt.c: 552: flag = 0;
	clrf	(i1sprintf@flag)
	line	638
;doprnt.c: 638: switch(c = *f++) {
	goto	i1l11746
	line	640
;doprnt.c: 640: case 0:
	
i1l6714:	
	line	641
;doprnt.c: 641: goto alldone;
	goto	i1l11790
	line	700
;doprnt.c: 700: case 'd':
	
i1l6716:	
	goto	i1l11748
	line	701
	
i1l6717:	
	line	702
;doprnt.c: 701: case 'i':
;doprnt.c: 702: break;
	goto	i1l11748
	line	805
;doprnt.c: 805: default:
	
i1l6719:	
	line	816
;doprnt.c: 816: continue;
	goto	i1l11788
	line	825
	
i1l11744:	
;doprnt.c: 825: }
	goto	i1l11748
	line	638
	
i1l6713:	
	
i1l11746:	
	movlw	01h
	addwf	(i1sprintf@f),f
	movlw	-01h
	addwf	(i1sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(i1sprintf@c)
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
	goto	i1l11790
	xorlw	100^0	; case 100
	skipnz
	goto	i1l11748
	xorlw	105^100	; case 105
	skipnz
	goto	i1l11748
	goto	i1l11788
	opt asmopt_on

	line	825
	
i1l6718:	
	line	1254
	
i1l11748:	
;doprnt.c: 1248: {
;doprnt.c: 1254: _val._val = (int)(*(int *)__va_arg((*(int **)ap), (int)0));
	movf	(i1sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(i1sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(i1sprintf@_val+1)
	
i1l11750:	
	movlw	(02h)
	movwf	(??i1_sprintf+0)+0
	movf	(??i1_sprintf+0)+0,w
	addwf	(i1sprintf@ap),f
	line	1256
	
i1l11752:	
;doprnt.c: 1256: if((int)_val._val < 0) {
	btfss	(i1sprintf@_val+1),7
	goto	u536_21
	goto	u536_20
u536_21:
	goto	i1l11758
u536_20:
	line	1257
	
i1l11754:	
;doprnt.c: 1257: flag |= 0x03;
	movlw	(03h)
	movwf	(??i1_sprintf+0)+0
	movf	(??i1_sprintf+0)+0,w
	iorwf	(i1sprintf@flag),f
	line	1258
	
i1l11756:	
;doprnt.c: 1258: _val._val = -_val._val;
	comf	(i1sprintf@_val),f
	comf	(i1sprintf@_val+1),f
	incf	(i1sprintf@_val),f
	skipnz
	incf	(i1sprintf@_val+1),f
	goto	i1l11758
	line	1259
	
i1l6720:	
	line	1300
	
i1l11758:	
;doprnt.c: 1259: }
;doprnt.c: 1261: }
;doprnt.c: 1300: for(c = 1 ; c != sizeof dpowers/sizeof dpowers[0] ; c++)
	clrf	(i1sprintf@c)
	bsf	status,0
	rlf	(i1sprintf@c),f
	
i1l11760:	
	movf	(i1sprintf@c),w
	xorlw	05h
	skipz
	goto	u537_21
	goto	u537_20
u537_21:
	goto	i1l11764
u537_20:
	goto	i1l11772
	
i1l11762:	
	goto	i1l11772
	line	1301
	
i1l6721:	
	
i1l11764:	
;doprnt.c: 1301: if(_val._val < dpowers[c])
	movf	(i1sprintf@c),w
	movwf	(??i1_sprintf+0)+0
	addwf	(??i1_sprintf+0)+0,w
	addlw	low((_dpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??i1_sprintf+1)+0
	fcall	stringdir
	movwf	(??i1_sprintf+1)+0+1
	movf	1+(??i1_sprintf+1)+0,w
	subwf	(i1sprintf@_val+1),w
	skipz
	goto	u538_25
	movf	0+(??i1_sprintf+1)+0,w
	subwf	(i1sprintf@_val),w
u538_25:
	skipnc
	goto	u538_21
	goto	u538_20
u538_21:
	goto	i1l11768
u538_20:
	goto	i1l11772
	line	1302
	
i1l11766:	
;doprnt.c: 1302: break;
	goto	i1l11772
	
i1l6723:	
	line	1300
	
i1l11768:	
	movlw	(01h)
	movwf	(??i1_sprintf+0)+0
	movf	(??i1_sprintf+0)+0,w
	addwf	(i1sprintf@c),f
	
i1l11770:	
	movf	(i1sprintf@c),w
	xorlw	05h
	skipz
	goto	u539_21
	goto	u539_20
u539_21:
	goto	i1l11764
u539_20:
	goto	i1l11772
	
i1l6722:	
	line	1433
	
i1l11772:	
;doprnt.c: 1417: {
;doprnt.c: 1433: if(flag & 0x03)
	movf	(i1sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u540_21
	goto	u540_20
u540_21:
	goto	i1l11778
u540_20:
	line	1434
	
i1l11774:	
;doprnt.c: 1434: ((*sp++ = ('-')));
	movlw	(02Dh)
	movwf	(??i1_sprintf+0)+0
	movf	(i1sprintf@sp),w
	movwf	fsr0
	movf	(??i1_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l11776:	
	movlw	(01h)
	movwf	(??i1_sprintf+0)+0
	movf	(??i1_sprintf+0)+0,w
	addwf	(i1sprintf@sp),f
	goto	i1l11778
	
i1l6724:	
	line	1467
	
i1l11778:	
;doprnt.c: 1464: }
;doprnt.c: 1467: prec = c;
	movf	(i1sprintf@c),w
	movwf	(??i1_sprintf+0)+0
	movf	(??i1_sprintf+0)+0,w
	movwf	(i1sprintf@prec)
	line	1469
;doprnt.c: 1469: while(prec--) {
	goto	i1l11786
	
i1l6726:	
	line	1484
	
i1l11780:	
;doprnt.c: 1473: {
;doprnt.c: 1484: c = (_val._val / dpowers[prec]) % 10 + '0';
	movlw	low(0Ah)
	movwf	(?i1___lwmod)
	movlw	high(0Ah)
	movwf	((?i1___lwmod))+1
	movf	(i1sprintf@prec),w
	movwf	(??i1_sprintf+0)+0
	addwf	(??i1_sprintf+0)+0,w
	addlw	low((_dpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?i1___lwdiv)
	fcall	stringdir
	movwf	(?i1___lwdiv+1)
	movf	(i1sprintf@_val+1),w
	clrf	1+(?i1___lwdiv)+02h
	addwf	1+(?i1___lwdiv)+02h
	movf	(i1sprintf@_val),w
	clrf	0+(?i1___lwdiv)+02h
	addwf	0+(?i1___lwdiv)+02h

	fcall	i1___lwdiv
	movf	(1+(?i1___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?i1___lwmod)+02h
	addwf	1+(?i1___lwmod)+02h
	movf	(0+(?i1___lwdiv)),w
	clrf	0+(?i1___lwmod)+02h
	addwf	0+(?i1___lwmod)+02h

	fcall	i1___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?i1___lwmod)),w
	addlw	030h
	movwf	(??i1_sprintf+1)+0
	movf	(??i1_sprintf+1)+0,w
	movwf	(i1sprintf@c)
	line	1516
	
i1l11782:	
;doprnt.c: 1515: }
;doprnt.c: 1516: ((*sp++ = (c)));
	movf	(i1sprintf@c),w
	movwf	(??i1_sprintf+0)+0
	movf	(i1sprintf@sp),w
	movwf	fsr0
	movf	(??i1_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
i1l11784:	
	movlw	(01h)
	movwf	(??i1_sprintf+0)+0
	movf	(??i1_sprintf+0)+0,w
	addwf	(i1sprintf@sp),f
	goto	i1l11786
	line	1517
	
i1l6725:	
	line	1469
	
i1l11786:	
	movlw	(-1)
	movwf	(??i1_sprintf+0)+0
	movf	(??i1_sprintf+0)+0,w
	addwf	(i1sprintf@prec),f
	movf	((i1sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u541_21
	goto	u541_20
u541_21:
	goto	i1l11780
u541_20:
	goto	i1l11788
	
i1l6727:	
	goto	i1l11788
	line	1525
	
i1l6710:	
	line	540
	
i1l11788:	
	movlw	01h
	addwf	(i1sprintf@f),f
	movlw	-01h
	addwf	(i1sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??i1_sprintf+0)+0
	movf	(??i1_sprintf+0)+0,w
	movwf	(i1sprintf@c)
	movf	((i1sprintf@c)),f
	skipz
	goto	u542_21
	goto	u542_20
u542_21:
	goto	i1l11738
u542_20:
	goto	i1l11790
	
i1l6728:	
	goto	i1l11790
	line	1527
;doprnt.c: 1517: }
;doprnt.c: 1525: }
;doprnt.c: 1527: alldone:
	
i1l6715:	
	line	1530
	
i1l11790:	
;doprnt.c: 1530: *sp = 0;
	movf	(i1sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	i1l6729
	line	1532
	
i1l11792:	
	line	1533
;doprnt.c: 1532: return 0;
;	Return value of i1_sprintf is never used
	
i1l6729:	
	return
	opt stack 0
GLOBAL	__end_ofi1_sprintf
	__end_ofi1_sprintf:
;; =============== function i1_sprintf ends ============

	signat	i1_sprintf,90
	global	i1_ADCconvert
psect	text1166,local,class=CODE,delta=2
global __ptext1166
__ptext1166:

;; *************** function i1_ADCconvert *****************
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1___wmul
;;		i1___lwdiv
;; This function is called by:
;;		i1_readAvgDistance
;; This function uses a non-reentrant model
;;
psect	text1166
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
	line	33
	global	__size_ofi1_ADCconvert
	__size_ofi1_ADCconvert	equ	__end_ofi1_ADCconvert-i1_ADCconvert
	
i1_ADCconvert:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1_ADCconvert: [wreg+status,2+status,0+pclath+cstack]
	line	39
	
i1l11654:	
;infrared.c: 39: if (adcVal >= 213 && adcVal < 234)
	movlw	high(0D5h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u519_21
	goto	u519_20
u519_21:
	goto	i1l11660
u519_20:
	
i1l11656:	
	movlw	high(0EAh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0EAh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u520_21
	goto	u520_20
u520_21:
	goto	i1l11660
u520_20:
	line	41
	
i1l11658:	
;infrared.c: 40: {
;infrared.c: 41: distance = 15 + ((20-15)*(234-adcVal))/(234-213);
	movlw	low(015h)
	movwf	(?i1___lwdiv)
	movlw	high(015h)
	movwf	((?i1___lwdiv))+1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??i1_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??i1_ADCconvert+0)+0+1)
	incf	(??i1_ADCconvert+0)+0,f
	skipnz
	incf	((??i1_ADCconvert+0)+0+1),f
	movf	0+(??i1_ADCconvert+0)+0,w
	addlw	low(0EAh)
	movwf	(?i1___wmul)
	movf	1+(??i1_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(0EAh)
	movwf	1+(?i1___wmul)
	movlw	low(05h)
	movwf	0+(?i1___wmul)+02h
	movlw	high(05h)
	movwf	(0+(?i1___wmul)+02h)+1
	fcall	i1___wmul
	movf	(1+(?i1___wmul)),w
	clrf	1+(?i1___lwdiv)+02h
	addwf	1+(?i1___lwdiv)+02h
	movf	(0+(?i1___wmul)),w
	clrf	0+(?i1___lwdiv)+02h
	addwf	0+(?i1___lwdiv)+02h

	fcall	i1___lwdiv
	movf	(0+(?i1___lwdiv)),w
	addlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?i1___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(0Fh)
	movwf	1+(_distance)	;volatile
	line	42
;infrared.c: 42: }
	goto	i1l2976
	line	43
	
i1l2963:	
	
i1l11660:	
;infrared.c: 43: else if (adcVal >= 170 && adcVal < 213)
	movlw	high(0AAh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u521_21
	goto	u521_20
u521_21:
	goto	i1l11666
u521_20:
	
i1l11662:	
	movlw	high(0D5h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u522_21
	goto	u522_20
u522_21:
	goto	i1l11666
u522_20:
	line	45
	
i1l11664:	
;infrared.c: 44: {
;infrared.c: 45: distance = 20 + ((30-20)*(213-adcVal))/(213-170);
	movlw	low(02Bh)
	movwf	(?i1___lwdiv)
	movlw	high(02Bh)
	movwf	((?i1___lwdiv))+1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??i1_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??i1_ADCconvert+0)+0+1)
	incf	(??i1_ADCconvert+0)+0,f
	skipnz
	incf	((??i1_ADCconvert+0)+0+1),f
	movf	0+(??i1_ADCconvert+0)+0,w
	addlw	low(0D5h)
	movwf	(?i1___wmul)
	movf	1+(??i1_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(0D5h)
	movwf	1+(?i1___wmul)
	movlw	low(0Ah)
	movwf	0+(?i1___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?i1___wmul)+02h)+1
	fcall	i1___wmul
	movf	(1+(?i1___wmul)),w
	clrf	1+(?i1___lwdiv)+02h
	addwf	1+(?i1___lwdiv)+02h
	movf	(0+(?i1___wmul)),w
	clrf	0+(?i1___lwdiv)+02h
	addwf	0+(?i1___lwdiv)+02h

	fcall	i1___lwdiv
	movf	(0+(?i1___lwdiv)),w
	addlw	low(014h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?i1___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(014h)
	movwf	1+(_distance)	;volatile
	line	46
;infrared.c: 46: }
	goto	i1l2976
	line	47
	
i1l2965:	
	
i1l11666:	
;infrared.c: 47: else if (adcVal >= 128 && adcVal < 170)
	movlw	high(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u523_21
	goto	u523_20
u523_21:
	goto	i1l11672
u523_20:
	
i1l11668:	
	movlw	high(0AAh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u524_21
	goto	u524_20
u524_21:
	goto	i1l11672
u524_20:
	line	49
	
i1l11670:	
;infrared.c: 48: {
;infrared.c: 49: distance = 30 + ((40-30)*(170-adcVal))/(170-128);
	movlw	low(02Ah)
	movwf	(?i1___lwdiv)
	movlw	high(02Ah)
	movwf	((?i1___lwdiv))+1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??i1_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??i1_ADCconvert+0)+0+1)
	incf	(??i1_ADCconvert+0)+0,f
	skipnz
	incf	((??i1_ADCconvert+0)+0+1),f
	movf	0+(??i1_ADCconvert+0)+0,w
	addlw	low(0AAh)
	movwf	(?i1___wmul)
	movf	1+(??i1_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(0AAh)
	movwf	1+(?i1___wmul)
	movlw	low(0Ah)
	movwf	0+(?i1___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?i1___wmul)+02h)+1
	fcall	i1___wmul
	movf	(1+(?i1___wmul)),w
	clrf	1+(?i1___lwdiv)+02h
	addwf	1+(?i1___lwdiv)+02h
	movf	(0+(?i1___wmul)),w
	clrf	0+(?i1___lwdiv)+02h
	addwf	0+(?i1___lwdiv)+02h

	fcall	i1___lwdiv
	movf	(0+(?i1___lwdiv)),w
	addlw	low(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?i1___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(01Eh)
	movwf	1+(_distance)	;volatile
	line	50
;infrared.c: 50: }
	goto	i1l2976
	line	51
	
i1l2967:	
	
i1l11672:	
;infrared.c: 51: else if (adcVal >= 107 && adcVal < 128)
	movlw	high(06Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u525_21
	goto	u525_20
u525_21:
	goto	i1l11678
u525_20:
	
i1l11674:	
	movlw	high(080h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u526_21
	goto	u526_20
u526_21:
	goto	i1l11678
u526_20:
	line	53
	
i1l11676:	
;infrared.c: 52: {
;infrared.c: 53: distance = 40 + ((50-40)*(128-adcVal))/(128-107);
	movlw	low(015h)
	movwf	(?i1___lwdiv)
	movlw	high(015h)
	movwf	((?i1___lwdiv))+1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??i1_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??i1_ADCconvert+0)+0+1)
	incf	(??i1_ADCconvert+0)+0,f
	skipnz
	incf	((??i1_ADCconvert+0)+0+1),f
	movf	0+(??i1_ADCconvert+0)+0,w
	addlw	low(080h)
	movwf	(?i1___wmul)
	movf	1+(??i1_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(080h)
	movwf	1+(?i1___wmul)
	movlw	low(0Ah)
	movwf	0+(?i1___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?i1___wmul)+02h)+1
	fcall	i1___wmul
	movf	(1+(?i1___wmul)),w
	clrf	1+(?i1___lwdiv)+02h
	addwf	1+(?i1___lwdiv)+02h
	movf	(0+(?i1___wmul)),w
	clrf	0+(?i1___lwdiv)+02h
	addwf	0+(?i1___lwdiv)+02h

	fcall	i1___lwdiv
	movf	(0+(?i1___lwdiv)),w
	addlw	low(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?i1___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(028h)
	movwf	1+(_distance)	;volatile
	line	54
;infrared.c: 54: }
	goto	i1l2976
	line	55
	
i1l2969:	
	
i1l11678:	
;infrared.c: 55: else if (adcVal >= 77 && adcVal < 107)
	movlw	high(04Dh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u527_21
	goto	u527_20
u527_21:
	goto	i1l11684
u527_20:
	
i1l11680:	
	movlw	high(06Bh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u528_21
	goto	u528_20
u528_21:
	goto	i1l11684
u528_20:
	line	57
	
i1l11682:	
;infrared.c: 56: {
;infrared.c: 57: distance = 50 + ((60-50)*(107-adcVal))/(107-77);
	movlw	low(01Eh)
	movwf	(?i1___lwdiv)
	movlw	high(01Eh)
	movwf	((?i1___lwdiv))+1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??i1_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??i1_ADCconvert+0)+0+1)
	incf	(??i1_ADCconvert+0)+0,f
	skipnz
	incf	((??i1_ADCconvert+0)+0+1),f
	movf	0+(??i1_ADCconvert+0)+0,w
	addlw	low(06Bh)
	movwf	(?i1___wmul)
	movf	1+(??i1_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(06Bh)
	movwf	1+(?i1___wmul)
	movlw	low(0Ah)
	movwf	0+(?i1___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?i1___wmul)+02h)+1
	fcall	i1___wmul
	movf	(1+(?i1___wmul)),w
	clrf	1+(?i1___lwdiv)+02h
	addwf	1+(?i1___lwdiv)+02h
	movf	(0+(?i1___wmul)),w
	clrf	0+(?i1___lwdiv)+02h
	addwf	0+(?i1___lwdiv)+02h

	fcall	i1___lwdiv
	movf	(0+(?i1___lwdiv)),w
	addlw	low(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?i1___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(032h)
	movwf	1+(_distance)	;volatile
	line	58
;infrared.c: 58: }
	goto	i1l2976
	line	59
	
i1l2971:	
	
i1l11684:	
;infrared.c: 59: else if (adcVal >= 56 && adcVal < 77)
	movlw	high(038h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u529_21
	goto	u529_20
u529_21:
	goto	i1l11690
u529_20:
	
i1l11686:	
	movlw	high(04Dh)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u530_21
	goto	u530_20
u530_21:
	goto	i1l11690
u530_20:
	line	61
	
i1l11688:	
;infrared.c: 60: {
;infrared.c: 61: distance = 60 + ((70-60)*(77-adcVal))/(77-56);
	movlw	low(015h)
	movwf	(?i1___lwdiv)
	movlw	high(015h)
	movwf	((?i1___lwdiv))+1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??i1_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??i1_ADCconvert+0)+0+1)
	incf	(??i1_ADCconvert+0)+0,f
	skipnz
	incf	((??i1_ADCconvert+0)+0+1),f
	movf	0+(??i1_ADCconvert+0)+0,w
	addlw	low(04Dh)
	movwf	(?i1___wmul)
	movf	1+(??i1_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(04Dh)
	movwf	1+(?i1___wmul)
	movlw	low(0Ah)
	movwf	0+(?i1___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?i1___wmul)+02h)+1
	fcall	i1___wmul
	movf	(1+(?i1___wmul)),w
	clrf	1+(?i1___lwdiv)+02h
	addwf	1+(?i1___lwdiv)+02h
	movf	(0+(?i1___wmul)),w
	clrf	0+(?i1___lwdiv)+02h
	addwf	0+(?i1___lwdiv)+02h

	fcall	i1___lwdiv
	movf	(0+(?i1___lwdiv)),w
	addlw	low(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?i1___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(03Ch)
	movwf	1+(_distance)	;volatile
	line	62
;infrared.c: 62: }
	goto	i1l2976
	line	63
	
i1l2973:	
	
i1l11690:	
;infrared.c: 63: else if (adcVal >= 43 && adcVal < 56)
	movlw	high(02Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(02Bh)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipc
	goto	u531_21
	goto	u531_20
u531_21:
	goto	i1l2976
u531_20:
	
i1l11692:	
	movlw	high(038h)
	subwf	(_adcVal+1)^080h,w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal)^080h,w	;volatile
	skipnc
	goto	u532_21
	goto	u532_20
u532_21:
	goto	i1l2976
u532_20:
	line	65
	
i1l11694:	
;infrared.c: 64: {
;infrared.c: 65: distance = 70 + ((80-70)*(56-adcVal))/(56-43);
	movlw	low(0Dh)
	movwf	(?i1___lwdiv)
	movlw	high(0Dh)
	movwf	((?i1___lwdiv))+1
	comf	(_adcVal)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??i1_ADCconvert+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	comf	(_adcVal+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??i1_ADCconvert+0)+0+1)
	incf	(??i1_ADCconvert+0)+0,f
	skipnz
	incf	((??i1_ADCconvert+0)+0+1),f
	movf	0+(??i1_ADCconvert+0)+0,w
	addlw	low(038h)
	movwf	(?i1___wmul)
	movf	1+(??i1_ADCconvert+0)+0,w
	skipnc
	addlw	1
	addlw	high(038h)
	movwf	1+(?i1___wmul)
	movlw	low(0Ah)
	movwf	0+(?i1___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?i1___wmul)+02h)+1
	fcall	i1___wmul
	movf	(1+(?i1___wmul)),w
	clrf	1+(?i1___lwdiv)+02h
	addwf	1+(?i1___lwdiv)+02h
	movf	(0+(?i1___wmul)),w
	clrf	0+(?i1___lwdiv)+02h
	addwf	0+(?i1___lwdiv)+02h

	fcall	i1___lwdiv
	movf	(0+(?i1___lwdiv)),w
	addlw	low(046h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_distance)	;volatile
	movf	(1+(?i1___lwdiv)),w
	skipnc
	addlw	1
	addlw	high(046h)
	movwf	1+(_distance)	;volatile
	goto	i1l2976
	line	66
	
i1l2975:	
	goto	i1l2976
	line	67
	
i1l2974:	
	goto	i1l2976
	
i1l2972:	
	goto	i1l2976
	
i1l2970:	
	goto	i1l2976
	
i1l2968:	
	goto	i1l2976
	
i1l2966:	
	goto	i1l2976
	
i1l2964:	
	
i1l2976:	
	return
	opt stack 0
GLOBAL	__end_ofi1_ADCconvert
	__end_ofi1_ADCconvert:
;; =============== function i1_ADCconvert ends ============

	signat	i1_ADCconvert,88
	global	i1_lcd_write_data
psect	text1167,local,class=CODE,delta=2
global __ptext1167
__ptext1167:

;; *************** function i1_lcd_write_data *****************
;; Defined at:
;;		line 30 in file "E:\Aldnoah.Zero\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  lcd_write_da    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  lcd_write_da    1    2[COMMON] unsigned char 
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
;;		i1_lcd_write_string
;; This function uses a non-reentrant model
;;
psect	text1167
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	30
	global	__size_ofi1_lcd_write_data
	__size_ofi1_lcd_write_data	equ	__end_ofi1_lcd_write_data-i1_lcd_write_data
	
i1_lcd_write_data:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1_lcd_write_data: [wreg]
;i1lcd_write_data@databyte stored from wreg
	movwf	(i1lcd_write_data@databyte)
	line	31
	
i1l11614:	
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
	
i1l11616:	
;lcd.c: 34: PORTD = databyte;
	movf	(i1lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
i1l11618:	
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
i1l11620:	
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??i1_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??i1_lcd_write_data+0)+0),f
u610_27:
	decfsz	((??i1_lcd_write_data+0)+0),f
	goto	u610_27
	decfsz	((??i1_lcd_write_data+0)+0+1),f
	goto	u610_27
opt asmopt_on

	line	38
	
i1l1402:	
	return
	opt stack 0
GLOBAL	__end_ofi1_lcd_write_data
	__end_ofi1_lcd_write_data:
;; =============== function i1_lcd_write_data ends ============

	signat	i1_lcd_write_data,88
	global	i1_lcd_write_control
psect	text1168,local,class=CODE,delta=2
global __ptext1168
__ptext1168:

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
;;		i1_lcd_set_cursor
;;		i1_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1168
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
	line	18
	global	__size_ofi1_lcd_write_control
	__size_ofi1_lcd_write_control	equ	__end_ofi1_lcd_write_control-i1_lcd_write_control
	
i1_lcd_write_control:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1_lcd_write_control: [wreg]
;i1lcd_write_control@databyte stored from wreg
	movwf	(i1lcd_write_control@databyte)
	line	19
	
i1l11606:	
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
	
i1l11608:	
;lcd.c: 22: PORTD = databyte;
	movf	(i1lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
i1l11610:	
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
i1l11612:	
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??i1_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??i1_lcd_write_control+0)+0),f
u611_27:
	decfsz	((??i1_lcd_write_control+0)+0),f
	goto	u611_27
	decfsz	((??i1_lcd_write_control+0)+0+1),f
	goto	u611_27
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
	global	i1_adc_read_channel
psect	text1169,local,class=CODE,delta=2
global __ptext1169
__ptext1169:

;; *************** function i1_adc_read_channel *****************
;; Defined at:
;;		line 5 in file "E:\Aldnoah.Zero\Assignment3\adc.c"
;; Parameters:    Size  Location     Type
;;  adc_read_cha    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  adc_read_cha    1    7[COMMON] unsigned char 
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
;;		i1_adc_read
;; This function is called by:
;;		i1_readDistance
;; This function uses a non-reentrant model
;;
psect	text1169
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	5
	global	__size_ofi1_adc_read_channel
	__size_ofi1_adc_read_channel	equ	__end_ofi1_adc_read_channel-i1_adc_read_channel
	
i1_adc_read_channel:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1_adc_read_channel: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;i1adc_read_channel@channel stored from wreg
	movwf	(i1adc_read_channel@channel)
	line	6
	
i1l11580:	
;adc.c: 6: switch(channel)
	goto	i1l11588
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
	goto	i1l11590
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
	goto	i1l11590
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
	goto	i1l11590
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
	goto	i1l11590
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
	goto	i1l11590
	line	35
;adc.c: 35: default:
	
i1l696:	
	line	36
	
i1l11582:	
;adc.c: 36: return 0;
	movlw	(0)
	goto	i1l697
	
i1l11584:	
	goto	i1l697
	line	37
	
i1l11586:	
;adc.c: 37: }
	goto	i1l11590
	line	6
	
i1l689:	
	
i1l11588:	
	movf	(i1adc_read_channel@channel),w
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
	goto	i1l11582
	opt asmopt_on

	line	37
	
i1l691:	
	line	39
	
i1l11590:	
;adc.c: 39: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??i1_adc_read_channel+0)+0,f
u612_27:
decfsz	(??i1_adc_read_channel+0)+0,f
	goto	u612_27
opt asmopt_on

	line	41
	
i1l11592:	
;adc.c: 41: return adc_read();
	fcall	i1_adc_read
	movf	(0+(?i1_adc_read)),w
	goto	i1l697
	
i1l11594:	
	line	43
	
i1l697:	
	return
	opt stack 0
GLOBAL	__end_ofi1_adc_read_channel
	__end_ofi1_adc_read_channel:
;; =============== function i1_adc_read_channel ends ============

	signat	i1_adc_read_channel,89
	global	_ReadButtons
psect	text1170,local,class=CODE,delta=2
global __ptext1170
__ptext1170:

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
psect	text1170
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	141
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 0
; Regs used in _ReadButtons: [wreg+status,2+status,0+pclath+cstack]
	line	142
	
i1l11196:	
;HMI.c: 142: Debounce();
	fcall	_Debounce
	line	144
	
i1l11198:	
;HMI.c: 144: if(UpPressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u450_21
	goto	u450_20
u450_21:
	goto	i1l5216
u450_20:
	line	146
	
i1l11200:	
;HMI.c: 145: {
;HMI.c: 146: UpPressed = 0;
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	147
	
i1l11202:	
;HMI.c: 147: return 1;
	movlw	(01h)
	goto	i1l5217
	
i1l11204:	
	goto	i1l5217
	line	149
	
i1l5216:	
	line	151
;HMI.c: 149: }
;HMI.c: 151: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u451_21
	goto	u451_20
u451_21:
	goto	i1l5218
u451_20:
	line	153
	
i1l11206:	
;HMI.c: 152: {
;HMI.c: 153: DownPressed = 0;
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	154
	
i1l11208:	
;HMI.c: 154: return 2;
	movlw	(02h)
	goto	i1l5217
	
i1l11210:	
	goto	i1l5217
	line	156
	
i1l5218:	
	line	157
;HMI.c: 156: }
;HMI.c: 157: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u452_21
	goto	u452_20
u452_21:
	goto	i1l5219
u452_20:
	line	159
	
i1l11212:	
;HMI.c: 158: {
;HMI.c: 159: LeftPressed = 0;
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	160
	
i1l11214:	
;HMI.c: 160: return 3;
	movlw	(03h)
	goto	i1l5217
	
i1l11216:	
	goto	i1l5217
	line	162
	
i1l5219:	
	line	163
;HMI.c: 162: }
;HMI.c: 163: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u453_21
	goto	u453_20
u453_21:
	goto	i1l5220
u453_20:
	line	165
	
i1l11218:	
;HMI.c: 164: {
;HMI.c: 165: RightPressed = 0;
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	166
	
i1l11220:	
;HMI.c: 166: return 4;
	movlw	(04h)
	goto	i1l5217
	
i1l11222:	
	goto	i1l5217
	line	168
	
i1l5220:	
	line	170
;HMI.c: 168: }
;HMI.c: 170: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u454_21
	goto	u454_20
u454_21:
	goto	i1l11230
u454_20:
	line	172
	
i1l11224:	
;HMI.c: 171: {
;HMI.c: 172: CenterPressed = 0;
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	173
	
i1l11226:	
;HMI.c: 173: return 5;
	movlw	(05h)
	goto	i1l5217
	
i1l11228:	
	goto	i1l5217
	line	175
	
i1l5221:	
	line	176
	
i1l11230:	
;HMI.c: 175: }
;HMI.c: 176: return 0;
	movlw	(0)
	goto	i1l5217
	
i1l11232:	
	line	177
	
i1l5217:	
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
	global	i1___awmod
psect	text1171,local,class=CODE,delta=2
global __ptext1171
__ptext1171:

;; *************** function i1___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  __awmod         2    0[COMMON] int 
;;  __awmod         2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  __awmod         1    6[COMMON] unsigned char 
;;  __awmod         1    5[COMMON] unsigned char 
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
;;		i1_UpdateDisplay
;; This function uses a non-reentrant model
;;
psect	text1171
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_ofi1___awmod
	__size_ofi1___awmod	equ	__end_ofi1___awmod-i1___awmod
	
i1___awmod:	
	opt	stack 0
; Regs used in i1___awmod: [wreg+status,2+status,0]
	line	8
	
i1l11854:	
	clrf	(i1___awmod@sign)
	line	9
	btfss	(i1___awmod@dividend+1),7
	goto	u560_21
	goto	u560_20
u560_21:
	goto	i1l11858
u560_20:
	line	10
	
i1l11856:	
	comf	(i1___awmod@dividend),f
	comf	(i1___awmod@dividend+1),f
	incf	(i1___awmod@dividend),f
	skipnz
	incf	(i1___awmod@dividend+1),f
	line	11
	clrf	(i1___awmod@sign)
	bsf	status,0
	rlf	(i1___awmod@sign),f
	goto	i1l11858
	line	12
	
i1l7620:	
	line	13
	
i1l11858:	
	btfss	(i1___awmod@divisor+1),7
	goto	u561_21
	goto	u561_20
u561_21:
	goto	i1l11862
u561_20:
	line	14
	
i1l11860:	
	comf	(i1___awmod@divisor),f
	comf	(i1___awmod@divisor+1),f
	incf	(i1___awmod@divisor),f
	skipnz
	incf	(i1___awmod@divisor+1),f
	goto	i1l11862
	
i1l7621:	
	line	15
	
i1l11862:	
	movf	(i1___awmod@divisor+1),w
	iorwf	(i1___awmod@divisor),w
	skipnz
	goto	u562_21
	goto	u562_20
u562_21:
	goto	i1l11880
u562_20:
	line	16
	
i1l11864:	
	clrf	(i1___awmod@counter)
	bsf	status,0
	rlf	(i1___awmod@counter),f
	line	17
	goto	i1l11870
	
i1l7624:	
	line	18
	
i1l11866:	
	movlw	01h
	
u563_25:
	clrc
	rlf	(i1___awmod@divisor),f
	rlf	(i1___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u563_25
	line	19
	
i1l11868:	
	movlw	(01h)
	movwf	(??i1___awmod+0)+0
	movf	(??i1___awmod+0)+0,w
	addwf	(i1___awmod@counter),f
	goto	i1l11870
	line	20
	
i1l7623:	
	line	17
	
i1l11870:	
	btfss	(i1___awmod@divisor+1),(15)&7
	goto	u564_21
	goto	u564_20
u564_21:
	goto	i1l11866
u564_20:
	goto	i1l11872
	
i1l7625:	
	goto	i1l11872
	line	21
	
i1l7626:	
	line	22
	
i1l11872:	
	movf	(i1___awmod@divisor+1),w
	subwf	(i1___awmod@dividend+1),w
	skipz
	goto	u565_25
	movf	(i1___awmod@divisor),w
	subwf	(i1___awmod@dividend),w
u565_25:
	skipc
	goto	u565_21
	goto	u565_20
u565_21:
	goto	i1l11876
u565_20:
	line	23
	
i1l11874:	
	movf	(i1___awmod@divisor),w
	subwf	(i1___awmod@dividend),f
	movf	(i1___awmod@divisor+1),w
	skipc
	decf	(i1___awmod@dividend+1),f
	subwf	(i1___awmod@dividend+1),f
	goto	i1l11876
	
i1l7627:	
	line	24
	
i1l11876:	
	movlw	01h
	
u566_25:
	clrc
	rrf	(i1___awmod@divisor+1),f
	rrf	(i1___awmod@divisor),f
	addlw	-1
	skipz
	goto	u566_25
	line	25
	
i1l11878:	
	movlw	low(01h)
	subwf	(i1___awmod@counter),f
	btfss	status,2
	goto	u567_21
	goto	u567_20
u567_21:
	goto	i1l11872
u567_20:
	goto	i1l11880
	
i1l7628:	
	goto	i1l11880
	line	26
	
i1l7622:	
	line	27
	
i1l11880:	
	movf	(i1___awmod@sign),w
	skipz
	goto	u568_20
	goto	i1l11884
u568_20:
	line	28
	
i1l11882:	
	comf	(i1___awmod@dividend),f
	comf	(i1___awmod@dividend+1),f
	incf	(i1___awmod@dividend),f
	skipnz
	incf	(i1___awmod@dividend+1),f
	goto	i1l11884
	
i1l7629:	
	line	29
	
i1l11884:	
	movf	(i1___awmod@dividend+1),w
	clrf	(?i1___awmod+1)
	addwf	(?i1___awmod+1)
	movf	(i1___awmod@dividend),w
	clrf	(?i1___awmod)
	addwf	(?i1___awmod)

	goto	i1l7630
	
i1l11886:	
	line	30
	
i1l7630:	
	return
	opt stack 0
GLOBAL	__end_ofi1___awmod
	__end_ofi1___awmod:
;; =============== function i1___awmod ends ============

	signat	i1___awmod,90
	global	i1___lwmod
psect	text1172,local,class=CODE,delta=2
global __ptext1172
__ptext1172:

;; *************** function i1___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  __lwmod         2    0[BANK0 ] unsigned int 
;;  __lwmod         2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  __lwmod         1    5[BANK0 ] unsigned char 
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
;;		i1_sprintf
;; This function uses a non-reentrant model
;;
psect	text1172
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_ofi1___lwmod
	__size_ofi1___lwmod	equ	__end_ofi1___lwmod-i1___lwmod
	
i1___lwmod:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1___lwmod: [wreg+status,2+status,0]
	line	8
	
i1l11832:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(i1___lwmod@divisor+1),w
	iorwf	(i1___lwmod@divisor),w
	skipnz
	goto	u554_21
	goto	u554_20
u554_21:
	goto	i1l11850
u554_20:
	line	9
	
i1l11834:	
	clrf	(i1___lwmod@counter)
	bsf	status,0
	rlf	(i1___lwmod@counter),f
	line	10
	goto	i1l11840
	
i1l7430:	
	line	11
	
i1l11836:	
	movlw	01h
	
u555_25:
	clrc
	rlf	(i1___lwmod@divisor),f
	rlf	(i1___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u555_25
	line	12
	
i1l11838:	
	movlw	(01h)
	movwf	(??i1___lwmod+0)+0
	movf	(??i1___lwmod+0)+0,w
	addwf	(i1___lwmod@counter),f
	goto	i1l11840
	line	13
	
i1l7429:	
	line	10
	
i1l11840:	
	btfss	(i1___lwmod@divisor+1),(15)&7
	goto	u556_21
	goto	u556_20
u556_21:
	goto	i1l11836
u556_20:
	goto	i1l11842
	
i1l7431:	
	goto	i1l11842
	line	14
	
i1l7432:	
	line	15
	
i1l11842:	
	movf	(i1___lwmod@divisor+1),w
	subwf	(i1___lwmod@dividend+1),w
	skipz
	goto	u557_25
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),w
u557_25:
	skipc
	goto	u557_21
	goto	u557_20
u557_21:
	goto	i1l11846
u557_20:
	line	16
	
i1l11844:	
	movf	(i1___lwmod@divisor),w
	subwf	(i1___lwmod@dividend),f
	movf	(i1___lwmod@divisor+1),w
	skipc
	decf	(i1___lwmod@dividend+1),f
	subwf	(i1___lwmod@dividend+1),f
	goto	i1l11846
	
i1l7433:	
	line	17
	
i1l11846:	
	movlw	01h
	
u558_25:
	clrc
	rrf	(i1___lwmod@divisor+1),f
	rrf	(i1___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u558_25
	line	18
	
i1l11848:	
	movlw	low(01h)
	subwf	(i1___lwmod@counter),f
	btfss	status,2
	goto	u559_21
	goto	u559_20
u559_21:
	goto	i1l11842
u559_20:
	goto	i1l11850
	
i1l7434:	
	goto	i1l11850
	line	19
	
i1l7428:	
	line	20
	
i1l11850:	
	movf	(i1___lwmod@dividend+1),w
	clrf	(?i1___lwmod+1)
	addwf	(?i1___lwmod+1)
	movf	(i1___lwmod@dividend),w
	clrf	(?i1___lwmod)
	addwf	(?i1___lwmod)

	goto	i1l7435
	
i1l11852:	
	line	21
	
i1l7435:	
	return
	opt stack 0
GLOBAL	__end_ofi1___lwmod
	__end_ofi1___lwmod:
;; =============== function i1___lwmod ends ============

	signat	i1___lwmod,90
	global	i1___lwdiv
psect	text1173,local,class=CODE,delta=2
global __ptext1173
__ptext1173:

;; *************** function i1___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  __lwdiv         2    6[COMMON] unsigned int 
;;  __lwdiv         2    8[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  __lwdiv         2   12[COMMON] unsigned int 
;;  __lwdiv         1   11[COMMON] unsigned char 
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
;;		i1_readAvgDistance
;;		i1_ADCconvert
;;		i1_sprintf
;; This function uses a non-reentrant model
;;
psect	text1173
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_ofi1___lwdiv
	__size_ofi1___lwdiv	equ	__end_ofi1___lwdiv-i1___lwdiv
	
i1___lwdiv:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1___lwdiv: [wreg+status,2+status,0]
	line	9
	
i1l11806:	
	clrf	(i1___lwdiv@quotient)
	clrf	(i1___lwdiv@quotient+1)
	line	10
	
i1l11808:	
	movf	(i1___lwdiv@divisor+1),w
	iorwf	(i1___lwdiv@divisor),w
	skipnz
	goto	u547_21
	goto	u547_20
u547_21:
	goto	i1l11828
u547_20:
	line	11
	
i1l11810:	
	clrf	(i1___lwdiv@counter)
	bsf	status,0
	rlf	(i1___lwdiv@counter),f
	line	12
	goto	i1l11816
	
i1l7420:	
	line	13
	
i1l11812:	
	movlw	01h
	
u548_25:
	clrc
	rlf	(i1___lwdiv@divisor),f
	rlf	(i1___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u548_25
	line	14
	
i1l11814:	
	movlw	(01h)
	movwf	(??i1___lwdiv+0)+0
	movf	(??i1___lwdiv+0)+0,w
	addwf	(i1___lwdiv@counter),f
	goto	i1l11816
	line	15
	
i1l7419:	
	line	12
	
i1l11816:	
	btfss	(i1___lwdiv@divisor+1),(15)&7
	goto	u549_21
	goto	u549_20
u549_21:
	goto	i1l11812
u549_20:
	goto	i1l11818
	
i1l7421:	
	goto	i1l11818
	line	16
	
i1l7422:	
	line	17
	
i1l11818:	
	movlw	01h
	
u550_25:
	clrc
	rlf	(i1___lwdiv@quotient),f
	rlf	(i1___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u550_25
	line	18
	movf	(i1___lwdiv@divisor+1),w
	subwf	(i1___lwdiv@dividend+1),w
	skipz
	goto	u551_25
	movf	(i1___lwdiv@divisor),w
	subwf	(i1___lwdiv@dividend),w
u551_25:
	skipc
	goto	u551_21
	goto	u551_20
u551_21:
	goto	i1l11824
u551_20:
	line	19
	
i1l11820:	
	movf	(i1___lwdiv@divisor),w
	subwf	(i1___lwdiv@dividend),f
	movf	(i1___lwdiv@divisor+1),w
	skipc
	decf	(i1___lwdiv@dividend+1),f
	subwf	(i1___lwdiv@dividend+1),f
	line	20
	
i1l11822:	
	bsf	(i1___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l11824
	line	21
	
i1l7423:	
	line	22
	
i1l11824:	
	movlw	01h
	
u552_25:
	clrc
	rrf	(i1___lwdiv@divisor+1),f
	rrf	(i1___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u552_25
	line	23
	
i1l11826:	
	movlw	low(01h)
	subwf	(i1___lwdiv@counter),f
	btfss	status,2
	goto	u553_21
	goto	u553_20
u553_21:
	goto	i1l11818
u553_20:
	goto	i1l11828
	
i1l7424:	
	goto	i1l11828
	line	24
	
i1l7418:	
	line	25
	
i1l11828:	
	movf	(i1___lwdiv@quotient+1),w
	clrf	(?i1___lwdiv+1)
	addwf	(?i1___lwdiv+1)
	movf	(i1___lwdiv@quotient),w
	clrf	(?i1___lwdiv)
	addwf	(?i1___lwdiv)

	goto	i1l7425
	
i1l11830:	
	line	26
	
i1l7425:	
	return
	opt stack 0
GLOBAL	__end_ofi1___lwdiv
	__end_ofi1___lwdiv:
;; =============== function i1___lwdiv ends ============

	signat	i1___lwdiv,90
	global	i1___wmul
psect	text1174,local,class=CODE,delta=2
global __ptext1174
__ptext1174:

;; *************** function i1___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  __wmul          2    0[COMMON] unsigned int 
;;  __wmul          2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  __wmul          2    4[COMMON] unsigned int 
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
;;		i1_ADCconvert
;; This function uses a non-reentrant model
;;
psect	text1174
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_ofi1___wmul
	__size_ofi1___wmul	equ	__end_ofi1___wmul-i1___wmul
	
i1___wmul:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1___wmul: [wreg+status,2+status,0]
	line	4
	
i1l11794:	
	clrf	(i1___wmul@product)
	clrf	(i1___wmul@product+1)
	goto	i1l11796
	line	6
	
i1l7412:	
	line	7
	
i1l11796:	
	btfss	(i1___wmul@multiplier),(0)&7
	goto	u543_21
	goto	u543_20
u543_21:
	goto	i1l7413
u543_20:
	line	8
	
i1l11798:	
	movf	(i1___wmul@multiplicand),w
	addwf	(i1___wmul@product),f
	skipnc
	incf	(i1___wmul@product+1),f
	movf	(i1___wmul@multiplicand+1),w
	addwf	(i1___wmul@product+1),f
	
i1l7413:	
	line	9
	movlw	01h
	
u544_25:
	clrc
	rlf	(i1___wmul@multiplicand),f
	rlf	(i1___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u544_25
	line	10
	
i1l11800:	
	movlw	01h
	
u545_25:
	clrc
	rrf	(i1___wmul@multiplier+1),f
	rrf	(i1___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u545_25
	line	11
	movf	((i1___wmul@multiplier+1)),w
	iorwf	((i1___wmul@multiplier)),w
	skipz
	goto	u546_21
	goto	u546_20
u546_21:
	goto	i1l11796
u546_20:
	goto	i1l11802
	
i1l7414:	
	line	12
	
i1l11802:	
	movf	(i1___wmul@product+1),w
	clrf	(?i1___wmul+1)
	addwf	(?i1___wmul+1)
	movf	(i1___wmul@product),w
	clrf	(?i1___wmul)
	addwf	(?i1___wmul)

	goto	i1l7415
	
i1l11804:	
	line	13
	
i1l7415:	
	return
	opt stack 0
GLOBAL	__end_ofi1___wmul
	__end_ofi1___wmul:
;; =============== function i1___wmul ends ============

	signat	i1___wmul,90
	global	i1_adc_read
psect	text1175,local,class=CODE,delta=2
global __ptext1175
__ptext1175:

;; *************** function i1_adc_read *****************
;; Defined at:
;;		line 61 in file "E:\Aldnoah.Zero\Assignment3\adc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adc_read        2    4[COMMON] volatile unsigned int 
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
;;		i1_adc_read_channel
;; This function uses a non-reentrant model
;;
psect	text1175
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_ofi1_adc_read
	__size_ofi1_adc_read	equ	__end_ofi1_adc_read-i1_adc_read
	
i1_adc_read:	
;; hardware stack exceeded
	opt	stack 0
; Regs used in i1_adc_read: [wreg+status,2+status,0]
	line	64
	
i1l11596:	
;adc.c: 62: volatile unsigned int adc_value;
;adc.c: 64: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	66
	
i1l11598:	
;adc.c: 66: GO = 1;
	bsf	(250/8),(250)&7
	line	67
;adc.c: 67: while(GO) continue;
	goto	i1l703
	
i1l704:	
	
i1l703:	
	btfsc	(250/8),(250)&7
	goto	u514_21
	goto	u514_20
u514_21:
	goto	i1l703
u514_20:
	
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
psect	text1175
	line	73
	
i1l11600:	
;adc.c: 73: adc_value = ADRESH;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(30),w	;volatile
	movwf	(??i1_adc_read+0)+0
	clrf	(??i1_adc_read+0)+0+1
	movf	0+(??i1_adc_read+0)+0,w
	movwf	(i1adc_read@adc_value)	;volatile
	movf	1+(??i1_adc_read+0)+0,w
	movwf	(i1adc_read@adc_value+1)	;volatile
	line	74
;adc.c: 74: adc_value <<= 1;
	movlw	01h
	
u515_25:
	clrc
	rlf	(i1adc_read@adc_value),f	;volatile
	rlf	(i1adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
	goto	u515_25
	line	75
;adc.c: 75: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	78
	
i1l11602:	
;adc.c: 78: return (adc_value);
	movf	(i1adc_read@adc_value+1),w	;volatile
	clrf	(?i1_adc_read+1)
	addwf	(?i1_adc_read+1)
	movf	(i1adc_read@adc_value),w	;volatile
	clrf	(?i1_adc_read)
	addwf	(?i1_adc_read)

	goto	i1l706
	
i1l11604:	
	line	79
	
i1l706:	
	return
	opt stack 0
GLOBAL	__end_ofi1_adc_read
	__end_ofi1_adc_read:
;; =============== function i1_adc_read ends ============

	signat	i1_adc_read,90
	global	_Debounce
psect	text1176,local,class=CODE,delta=2
global __ptext1176
__ptext1176:

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
psect	text1176
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	61
	global	__size_of_Debounce
	__size_of_Debounce	equ	__end_of_Debounce-_Debounce
	
_Debounce:	
	opt	stack 0
; Regs used in _Debounce: [wreg+status,2+status,0]
	line	63
	
i1l11430:	
;HMI.c: 63: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u471_21
	goto	u471_20
u471_21:
	goto	i1l5198
u471_20:
	line	65
	
i1l11432:	
;HMI.c: 64: {
;HMI.c: 65: UpDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_UpDebounceCount),f	;volatile
	line	66
	
i1l11434:	
;HMI.c: 66: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount),w	;volatile
	skipc
	goto	u472_21
	goto	u472_20
u472_21:
	goto	i1l5200
u472_20:
	
i1l11436:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u473_21
	goto	u473_20
u473_21:
	goto	i1l5200
u473_20:
	line	68
	
i1l11438:	
;HMI.c: 67: {
;HMI.c: 68: UpPressed = 1;
	bsf	(_UpPressed/8),(_UpPressed)&7
	line	69
;HMI.c: 69: UpReleased = 0;
	bcf	(_UpReleased/8),(_UpReleased)&7
	goto	i1l5200
	line	70
	
i1l5199:	
	line	71
;HMI.c: 70: }
;HMI.c: 71: }
	goto	i1l5200
	line	72
	
i1l5198:	
	line	74
;HMI.c: 72: else
;HMI.c: 73: {
;HMI.c: 74: UpDebounceCount = 0;
	clrf	(_UpDebounceCount)	;volatile
	line	75
;HMI.c: 75: UpReleased = 1;
	bsf	(_UpReleased/8),(_UpReleased)&7
	line	76
	
i1l5200:	
	line	79
;HMI.c: 76: }
;HMI.c: 79: if(!RB3)
	btfsc	(51/8),(51)&7
	goto	u474_21
	goto	u474_20
u474_21:
	goto	i1l5201
u474_20:
	line	81
	
i1l11440:	
;HMI.c: 80: {
;HMI.c: 81: DownDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_DownDebounceCount),f	;volatile
	line	82
	
i1l11442:	
;HMI.c: 82: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount),w	;volatile
	skipc
	goto	u475_21
	goto	u475_20
u475_21:
	goto	i1l5203
u475_20:
	
i1l11444:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u476_21
	goto	u476_20
u476_21:
	goto	i1l5203
u476_20:
	line	84
	
i1l11446:	
;HMI.c: 83: {
;HMI.c: 84: DownPressed = 1;
	bsf	(_DownPressed/8),(_DownPressed)&7
	line	85
;HMI.c: 85: DownReleased = 0;
	bcf	(_DownReleased/8),(_DownReleased)&7
	goto	i1l5203
	line	86
	
i1l5202:	
	line	87
;HMI.c: 86: }
;HMI.c: 87: }
	goto	i1l5203
	line	88
	
i1l5201:	
	line	90
;HMI.c: 88: else
;HMI.c: 89: {
;HMI.c: 90: DownDebounceCount = 0;
	clrf	(_DownDebounceCount)	;volatile
	line	91
;HMI.c: 91: DownReleased = 1;
	bsf	(_DownReleased/8),(_DownReleased)&7
	line	92
	
i1l5203:	
	line	94
;HMI.c: 92: }
;HMI.c: 94: if(!RB4)
	btfsc	(52/8),(52)&7
	goto	u477_21
	goto	u477_20
u477_21:
	goto	i1l5204
u477_20:
	line	96
	
i1l11448:	
;HMI.c: 95: {
;HMI.c: 96: LeftDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_LeftDebounceCount),f	;volatile
	line	97
	
i1l11450:	
;HMI.c: 97: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount),w	;volatile
	skipc
	goto	u478_21
	goto	u478_20
u478_21:
	goto	i1l5206
u478_20:
	
i1l11452:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u479_21
	goto	u479_20
u479_21:
	goto	i1l5206
u479_20:
	line	99
	
i1l11454:	
;HMI.c: 98: {
;HMI.c: 99: LeftPressed = 1;
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	line	100
;HMI.c: 100: LeftReleased = 0;
	bcf	(_LeftReleased/8),(_LeftReleased)&7
	goto	i1l5206
	line	101
	
i1l5205:	
	line	102
;HMI.c: 101: }
;HMI.c: 102: }
	goto	i1l5206
	line	103
	
i1l5204:	
	line	105
;HMI.c: 103: else
;HMI.c: 104: {
;HMI.c: 105: LeftDebounceCount = 0;
	clrf	(_LeftDebounceCount)	;volatile
	line	106
;HMI.c: 106: LeftReleased = 1;
	bsf	(_LeftReleased/8),(_LeftReleased)&7
	line	107
	
i1l5206:	
	line	109
;HMI.c: 107: }
;HMI.c: 109: if(!RB5)
	btfsc	(53/8),(53)&7
	goto	u480_21
	goto	u480_20
u480_21:
	goto	i1l5207
u480_20:
	line	111
	
i1l11456:	
;HMI.c: 110: {
;HMI.c: 111: RightDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_RightDebounceCount),f	;volatile
	line	112
	
i1l11458:	
;HMI.c: 112: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount),w	;volatile
	skipc
	goto	u481_21
	goto	u481_20
u481_21:
	goto	i1l5209
u481_20:
	
i1l11460:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u482_21
	goto	u482_20
u482_21:
	goto	i1l5209
u482_20:
	line	114
	
i1l11462:	
;HMI.c: 113: {
;HMI.c: 114: RightPressed = 1;
	bsf	(_RightPressed/8),(_RightPressed)&7
	line	115
;HMI.c: 115: RightReleased = 0;
	bcf	(_RightReleased/8),(_RightReleased)&7
	goto	i1l5209
	line	116
	
i1l5208:	
	line	117
;HMI.c: 116: }
;HMI.c: 117: }
	goto	i1l5209
	line	118
	
i1l5207:	
	line	120
;HMI.c: 118: else
;HMI.c: 119: {
;HMI.c: 120: RightDebounceCount = 0;
	clrf	(_RightDebounceCount)	;volatile
	line	121
;HMI.c: 121: RightReleased = 1;
	bsf	(_RightReleased/8),(_RightReleased)&7
	line	122
	
i1l5209:	
	line	124
;HMI.c: 122: }
;HMI.c: 124: if(!RB6)
	btfsc	(54/8),(54)&7
	goto	u483_21
	goto	u483_20
u483_21:
	goto	i1l5210
u483_20:
	line	126
	
i1l11464:	
;HMI.c: 125: {
;HMI.c: 126: CenterDebounceCount++;
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_CenterDebounceCount),f	;volatile
	line	127
	
i1l11466:	
;HMI.c: 127: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount),w	;volatile
	skipc
	goto	u484_21
	goto	u484_20
u484_21:
	goto	i1l5213
u484_20:
	
i1l11468:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u485_21
	goto	u485_20
u485_21:
	goto	i1l5213
u485_20:
	line	129
	
i1l11470:	
;HMI.c: 128: {
;HMI.c: 129: CenterPressed = 1;
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	line	130
;HMI.c: 130: CenterReleased = 0;
	bcf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l5213
	line	131
	
i1l5211:	
	line	132
;HMI.c: 131: }
;HMI.c: 132: }
	goto	i1l5213
	line	133
	
i1l5210:	
	line	135
;HMI.c: 133: else
;HMI.c: 134: {
;HMI.c: 135: CenterDebounceCount = 0;
	clrf	(_CenterDebounceCount)	;volatile
	line	136
;HMI.c: 136: CenterReleased = 1;
	bsf	(_CenterReleased/8),(_CenterReleased)&7
	goto	i1l5213
	line	137
	
i1l5212:	
	line	138
	
i1l5213:	
	return
	opt stack 0
GLOBAL	__end_of_Debounce
	__end_of_Debounce:
;; =============== function _Debounce ends ============

	signat	_Debounce,88
psect	text1177,local,class=CODE,delta=2
global __ptext1177
__ptext1177:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
