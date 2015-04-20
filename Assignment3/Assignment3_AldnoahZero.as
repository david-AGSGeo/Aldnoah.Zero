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
<<<<<<< HEAD
	FNCALL	_main,_calibrateIR
	FNCALL	_main,_rotateOld
	FNCALL	_init,_init_adc
	FNCALL	_init,_lcd_init
	FNCALL	_calibrateIR,_rotateOld
	FNCALL	_lcd_init,_lcd_write_control
=======
	FNCALL	_main,_spi_transfer
	FNCALL	_main,_robotMove
	FNCALL	_main,_robotTurn
	FNCALL	_main,_ser_putch
	FNCALL	_init,_init_adc
	FNCALL	_init,_lcd_init
	FNCALL	_init,_ser_init
	FNCALL	_init,_robo_init
	FNCALL	_lcd_init,_lcd_write_control
	FNCALL	_robotTurn,_ser_putch
	FNCALL	_robotMove,_ser_putch
	FNCALL	_robo_init,_ser_putch
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	global	_shortMenuStrings
	global	_menuStrings
	global	_current_step
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	36

;initializer for _shortMenuStrings
	retlw	(STR_6-__stringbase)&0ffh
	retlw	(STR_7-__stringbase)&0ffh
	retlw	(STR_8-__stringbase)&0ffh
	retlw	(STR_9-__stringbase)&0ffh
	retlw	(STR_10-__stringbase)&0ffh
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	line	35
=======
	global	_current_step
	global	_menuStrings
	global	_shortMenuStrings
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	21

;initializer for _current_step
	retlw	03Ch
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	32
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

;initializer for _menuStrings
	retlw	(STR_1-__stringbase)&0ffh
	retlw	(STR_2-__stringbase)&0ffh
	retlw	(STR_3-__stringbase)&0ffh
	retlw	(STR_4-__stringbase)&0ffh
	retlw	(STR_5-__stringbase)&0ffh
<<<<<<< HEAD
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	30

;initializer for _current_step
	retlw	03Ch
=======
	line	33

;initializer for _shortMenuStrings
	retlw	(STR_6-__stringbase)&0ffh
	retlw	(STR_7-__stringbase)&0ffh
	retlw	(STR_8-__stringbase)&0ffh
	retlw	(STR_9-__stringbase)&0ffh
	retlw	(STR_10-__stringbase)&0ffh
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	global	UpdateDisplay@F1211
	global	_rxfifo
	global	_txfifo
	global	_totalSteps
=======
	global	UpdateDisplay@F1223
	global	_rxfifo
	global	_txfifo
	global	_distance
	global	_turnhighByte
	global	_turnlowByte
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
STR_8:	
	retlw	68	;'D'
	retlw	114	;'r'
	retlw	50	;'2'
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
<<<<<<< HEAD
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	36
_shortMenuStrings:
       ds      5
=======
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	21
_current_step:
       ds      1
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
<<<<<<< HEAD
UpdateDisplay@F1211:
=======
UpdateDisplay@F1223:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
       ds      16

_rxfifo:
       ds      16

_txfifo:
       ds      16

<<<<<<< HEAD
_totalSteps:
       ds      2

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	35
=======
_distance:
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
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
_menuStrings:
       ds      5

psect	dataBANK1
<<<<<<< HEAD
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	30
_current_step:
       ds      1
=======
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	33
_shortMenuStrings:
       ds      5
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

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
<<<<<<< HEAD
	movlw	low((__pbssBANK0)+017h)
=======
	movlw	low((__pbssBANK0)+01Bh)
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
<<<<<<< HEAD
	movlw	low((__pbssBANK1)+032h)
=======
	movlw	low((__pbssBANK1)+034h)
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	movlw low(__pdataBANK1+6)
=======
	movlw low(__pdataBANK1+10)
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
global init_ram, __pidataBANK0
	movlw low(__pdataBANK0+5)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
=======
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	?_rotateOld
?_rotateOld:	; 0 bytes @ 0x0
	global	??_Menu
??_Menu:	; 0 bytes @ 0x0
	global	??_init_adc
??_init_adc:	; 0 bytes @ 0x0
	global	??_lcd_write_control
??_lcd_write_control:	; 0 bytes @ 0x0
	global	rotateOld@direction
rotateOld@direction:	; 1 bytes @ 0x0
	global	Menu@input
Menu@input:	; 1 bytes @ 0x0
	ds	1
	global	??_rotateOld
??_rotateOld:	; 0 bytes @ 0x1
	ds	1
<<<<<<< HEAD
	global	lcd_write_control@databyte
lcd_write_control@databyte:	; 1 bytes @ 0x2
=======
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
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	??_init
??_init:	; 0 bytes @ 0x3
	global	rotateOld@steps
rotateOld@steps:	; 1 bytes @ 0x3
	ds	1
<<<<<<< HEAD
	global	??_calibrateIR
??_calibrateIR:	; 0 bytes @ 0x4
=======
	global	??_robotMove
??_robotMove:	; 0 bytes @ 0x4
	global	??_robotTurn
??_robotTurn:	; 0 bytes @ 0x4
	ds	1
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	1
	global	main@choice
main@choice:	; 1 bytes @ 0x5
	ds	1
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_readAvgDistance
?_readAvgDistance:	; 0 bytes @ 0x0
	global	?_UpdateDisplay
?_UpdateDisplay:	; 0 bytes @ 0x0
<<<<<<< HEAD
=======
	global	?_ser_init
?_ser_init:	; 0 bytes @ 0x0
	global	?_robo_init
?_robo_init:	; 0 bytes @ 0x0
	global	?_ser_putch
?_ser_putch:	; 0 bytes @ 0x0
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
;;Data sizes: Strings 79, constant 10, data 11, bss 73, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     49      79
;; BANK1           80      6      62
=======
;;Data sizes: Strings 70, constant 10, data 11, bss 79, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     49      79
;; BANK1           80      9      71
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
;; S8053$_cp	PTR const unsigned char  size(1) Largest target is 0
=======
;; S8090$_cp	PTR const unsigned char  size(1) Largest target is 0
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
;;		 -> UpdateDisplay@adcOutput(BANK0[16]), STR_10(CODE[4]), STR_9(CODE[4]), STR_8(CODE[4]), 
;;		 -> STR_7(CODE[4]), STR_6(CODE[4]), STR_5(CODE[9]), STR_4(CODE[8]), 
;;		 -> STR_3(CODE[9]), STR_2(CODE[9]), STR_1(CODE[9]), 
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
<<<<<<< HEAD
;;   _main->_rotateOld
;;   _calibrateIR->_rotateOld
;;   _lcd_init->_lcd_write_control
=======
;;   _main->_robotMove
;;   _main->_robotTurn
;;   _lcd_init->_lcd_write_control
;;   _robotTurn->_ser_putch
;;   _robotMove->_ser_putch
;;   _robo_init->_ser_putch
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
;; (0) _main                                                 2     2      0     247
;;                                              4 BANK1      2     2      0
;;                               _init
;;                               _Menu
;;                        _calibrateIR
;;                          _rotateOld
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0      22
;;                           _init_adc
;;                           _lcd_init
;; ---------------------------------------------------------------------------------
;; (1) _calibrateIR                                          0     0      0      89
;;                          _rotateOld
=======
;; (0) _main                                                 4     4      0     319
;;                                              5 BANK1      4     4      0
;;                               _init
;;                               _Menu
;;                       _spi_transfer
;;                          _robotMove
;;                          _robotTurn
;;                          _ser_putch
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 1     1      0      44
;;                                              3 BANK1      1     1      0
;;                           _init_adc
;;                           _lcd_init
;;                           _ser_init
;;                          _robo_init
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;; ---------------------------------------------------------------------------------
;; (2) _lcd_init                                             0     0      0      22
;;                  _lcd_write_control
;; ---------------------------------------------------------------------------------
<<<<<<< HEAD
;; (1) _rotateOld                                            4     3      1      89
;;                                              0 BANK1      4     3      1
=======
;; (1) _robotTurn                                            3     1      2      88
;;                                              2 BANK1      3     1      2
;;                          _ser_putch
;; ---------------------------------------------------------------------------------
;; (1) _robotMove                                            3     1      2      88
;;                                              2 BANK1      3     1      2
;;                          _ser_putch
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
;; (1) _Menu                                                 1     1      0      22
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _isr1                                                 5     5      0    2099
;;                                             44 BANK0      5     5      0
;;                            ___lwmod
;;                    _readAvgDistance
;;                      _UpdateDisplay
;;                        _ReadButtons
;; ---------------------------------------------------------------------------------
;; (5) _UpdateDisplay                                       22    22      0    1385
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
<<<<<<< HEAD
;;   _Menu
;;   _calibrateIR
;;     _rotateOld
;;   _rotateOld
=======
;;     _ser_init
;;     _robo_init
;;       _ser_putch
;;   _Menu
;;   _spi_transfer
;;   _robotMove
;;     _ser_putch
;;   _robotTurn
;;     _ser_putch
;;   _ser_putch
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
;;BANK1               50      6      3E       7       77.5%
=======
;;BANK1               50      9      47       7       88.8%
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      B1      12        0.0%
;;ABS                  0      0      A4       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       D       2        0.0%
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
<<<<<<< HEAD
;;		line 198 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
=======
;;		line 169 in file "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  choice          1    5[BANK1 ] unsigned char 
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
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    8
;; This function calls:
;;		_init
;;		_Menu
<<<<<<< HEAD
;;		_calibrateIR
;;		_rotateOld
=======
;;		_spi_transfer
;;		_robotMove
;;		_robotTurn
;;		_ser_putch
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
<<<<<<< HEAD
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	198
=======
	file	"H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	line	169
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
<<<<<<< HEAD
	line	203
	
l10603:	
;Main.c: 203: init();
	fcall	_init
	goto	l10605
	line	209
;Main.c: 209: while(1)
	
l2194:	
	line	211
	
l10605:	
;Main.c: 210: {
;Main.c: 211: unsigned char choice = 255;
=======
	line	174
	
l10716:	
;Main.c: 174: init();
	fcall	_init
	goto	l10718
	line	180
;Main.c: 180: while(1)
	
l2212:	
	line	182
	
l10718:	
;Main.c: 181: {
;Main.c: 182: unsigned char choice = 255;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
<<<<<<< HEAD
	line	213
;Main.c: 213: switch (buttonPressed)
	goto	l10629
	line	215
;Main.c: 214: {
;Main.c: 215: case 1:
	
l2196:	
	line	216
	
l10607:	
;Main.c: 216: Menu(1);
	movlw	(01h)
	fcall	_Menu
	line	218
	
l10609:	
;Main.c: 218: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	220
;Main.c: 220: break;
	goto	l10637
	line	221
;Main.c: 221: case 2:
	
l2198:	
	line	222
	
l10611:	
;Main.c: 222: Menu(2);
	movlw	(02h)
	fcall	_Menu
	line	224
	
l10613:	
;Main.c: 224: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	226
;Main.c: 226: break;
	goto	l10637
	line	227
;Main.c: 227: case 3:
	
l2199:	
	line	228
	
l10615:	
;Main.c: 228: Menu(3);
	movlw	(03h)
	fcall	_Menu
	line	230
	
l10617:	
;Main.c: 230: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	232
;Main.c: 232: break;
	goto	l10637
	line	233
;Main.c: 233: case 4:
	
l2200:	
	line	234
	
l10619:	
;Main.c: 234: Menu(4);
	movlw	(04h)
	fcall	_Menu
	line	236
	
l10621:	
;Main.c: 236: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	238
;Main.c: 238: break;
	goto	l10637
	line	239
;Main.c: 239: case 5:
	
l2201:	
	line	240
	
l10623:	
;Main.c: 240: choice = Menu(5);
=======
	line	184
;Main.c: 184: switch (buttonPressed)
	goto	l10742
	line	186
;Main.c: 185: {
;Main.c: 186: case 1:
	
l2214:	
	line	187
	
l10720:	
;Main.c: 187: Menu(1);
	movlw	(01h)
	fcall	_Menu
	line	189
	
l10722:	
;Main.c: 189: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	191
;Main.c: 191: break;
	goto	l10852
	line	192
;Main.c: 192: case 2:
	
l2216:	
	line	193
	
l10724:	
;Main.c: 193: Menu(2);
	movlw	(02h)
	fcall	_Menu
	line	195
	
l10726:	
;Main.c: 195: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	197
;Main.c: 197: break;
	goto	l10852
	line	198
;Main.c: 198: case 3:
	
l2217:	
	line	199
	
l10728:	
;Main.c: 199: Menu(3);
	movlw	(03h)
	fcall	_Menu
	line	201
	
l10730:	
;Main.c: 201: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	203
;Main.c: 203: break;
	goto	l10852
	line	204
;Main.c: 204: case 4:
	
l2218:	
	line	205
	
l10732:	
;Main.c: 205: Menu(4);
	movlw	(04h)
	fcall	_Menu
	line	207
	
l10734:	
;Main.c: 207: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	209
;Main.c: 209: break;
	goto	l10852
	line	210
;Main.c: 210: case 5:
	
l2219:	
	line	211
	
l10736:	
;Main.c: 211: choice = Menu(5);
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(05h)
	fcall	_Menu
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
<<<<<<< HEAD
	line	242
	
l10625:	
;Main.c: 242: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	244
;Main.c: 244: break;
	goto	l10637
	line	245
;Main.c: 245: default:
	
l2202:	
	line	247
;Main.c: 247: break;
	goto	l10637
	line	248
	
l10627:	
;Main.c: 248: }
	goto	l10637
	line	213
	
l2195:	
	
l10629:	
=======
	line	213
	
l10738:	
;Main.c: 213: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	215
;Main.c: 215: break;
	goto	l10852
	line	216
;Main.c: 216: default:
	
l2220:	
	line	218
;Main.c: 218: break;
	goto	l10852
	line	219
	
l10740:	
;Main.c: 219: }
	goto	l10852
	line	184
	
l2213:	
	
l10742:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	l10607
	xorlw	2^1	; case 2
	skipnz
	goto	l10611
	xorlw	3^2	; case 3
	skipnz
	goto	l10615
	xorlw	4^3	; case 4
	skipnz
	goto	l10619
	xorlw	5^4	; case 5
	skipnz
	goto	l10623
	goto	l10637
	opt asmopt_on

	line	248
	
l2197:	
	line	251
;Main.c: 251: switch (choice)
	goto	l10637
	line	253
;Main.c: 252: {
;Main.c: 253: case 0:
	
l2204:	
	line	254
	
l10631:	
;Main.c: 254: calibrateIR();
	fcall	_calibrateIR
	line	255
;Main.c: 255: break;
	goto	l10639
	line	256
;Main.c: 256: case 1:
	
l2206:	
	line	257
	
l10633:	
;Main.c: 257: rotateOld(100, 1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotateOld)^080h
	bsf	status,0
	rlf	(?_rotateOld)^080h,f
	movlw	(064h)
	fcall	_rotateOld
	line	259
;Main.c: 259: break;
	goto	l10639
	line	260
;Main.c: 260: case 2:
	
l2207:	
	line	264
;Main.c: 264: break;
	goto	l10639
	line	265
;Main.c: 265: case 3:
	
l2208:	
	line	268
;Main.c: 268: break;
	goto	l10639
	line	269
;Main.c: 269: case 4:
	
l2209:	
	line	271
;Main.c: 271: break;
	goto	l10639
	line	274
;Main.c: 274: default:
	
l2210:	
	line	276
;Main.c: 276: break;
	goto	l10639
	line	277
	
l10635:	
;Main.c: 277: }
	goto	l10639
	line	251
	
l2203:	
	
l10637:	
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
	goto	l10631
	xorlw	1^0	; case 1
	skipnz
	goto	l10633
	xorlw	2^1	; case 2
	skipnz
	goto	l10639
	xorlw	3^2	; case 3
	skipnz
	goto	l10639
	xorlw	4^3	; case 4
	skipnz
	goto	l10639
	goto	l10639
	opt asmopt_on

	line	277
	
l2205:	
	line	278
	
l10639:	
;Main.c: 278: choice = 255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	goto	l10605
	line	428
	
l2211:	
	line	209
	goto	l10605
	
l2212:	
	line	429
	
l2213:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_init
psect	text637,local,class=CODE,delta=2
global __ptext637
__ptext637:

;; *************** function _init *****************
;; Defined at:
;;		line 124 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text637
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	124
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 0
; Regs used in _init: [wreg+status,2+status,0+pclath+cstack]
	line	125
	
l10591:	
;Main.c: 125: init_adc();
	fcall	_init_adc
	line	126
;Main.c: 126: lcd_init();
	fcall	_lcd_init
	line	129
	
l10593:	
;Main.c: 129: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	130
	
l10595:	
;Main.c: 130: TRISC = 0x00;
	clrf	(135)^080h	;volatile
	line	138
	
l10597:	
;Main.c: 138: OPTION_REG = 0b00000100;
	movlw	(04h)
	movwf	(129)^080h	;volatile
	line	141
	
l10599:	
;Main.c: 141: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	144
	
l10601:	
;Main.c: 144: (GIE = 1);
	bsf	(95/8),(95)&7
	line	145
	
l2177:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_calibrateIR
psect	text638,local,class=CODE,delta=2
global __ptext638
__ptext638:

;; *************** function _calibrateIR *****************
;; Defined at:
;;		line 150 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
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
;;		_rotateOld
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text638
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	150
	global	__size_of_calibrateIR
	__size_of_calibrateIR	equ	__end_of_calibrateIR-_calibrateIR
	
_calibrateIR:	
	opt	stack 1
; Regs used in _calibrateIR: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	151
	
l10569:	
;Main.c: 151: rotateOld(8, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotateOld)^080h
	movlw	(08h)
	fcall	_rotateOld
	goto	l10589
	line	152
;Main.c: 152: while (1)
	
l2180:	
	line	154
;Main.c: 153: {
;Main.c: 154: switch (buttonPressed)
	goto	l10589
	line	156
;Main.c: 155: {
;Main.c: 156: case 1:
	
l2182:	
	line	159
;Main.c: 159: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	161
;Main.c: 161: break;
	goto	l10589
	line	162
;Main.c: 162: case 2:
	
l2184:	
	line	165
;Main.c: 165: buttonPressed = 0;
	clrf	(_buttonPressed)	;volatile
	line	167
;Main.c: 167: break;
	goto	l10589
	line	168
;Main.c: 168: case 3:
	
l2185:	
	line	169
	
l10571:	
;Main.c: 169: rotateOld(1, 1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotateOld)^080h
	bsf	status,0
	rlf	(?_rotateOld)^080h,f
	movlw	(01h)
	fcall	_rotateOld
	line	171
	
l10573:	
;Main.c: 171: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	173
;Main.c: 173: break;
	goto	l10589
	line	174
;Main.c: 174: case 4:
	
l2186:	
	line	175
	
l10575:	
;Main.c: 175: rotateOld(1, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_rotateOld)^080h
	movlw	(01h)
	fcall	_rotateOld
	line	177
	
l10577:	
;Main.c: 177: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	line	179
;Main.c: 179: break;
	goto	l10589
	line	180
;Main.c: 180: case 5:
	
l2187:	
	line	181
	
l10579:	
;Main.c: 181: totalSteps = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_totalSteps)^080h
	clrf	(_totalSteps+1)^080h
	line	183
	
l10581:	
;Main.c: 183: buttonPressed = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_buttonPressed)	;volatile
	goto	l2188
	line	184
	
l10583:	
;Main.c: 184: return;
	goto	l2188
	line	185
	
l10585:	
;Main.c: 185: break;
	goto	l10589
	line	186
;Main.c: 186: default:
	
l2189:	
	line	188
;Main.c: 188: break;
	goto	l10589
	line	189
	
l10587:	
;Main.c: 189: }
	goto	l10589
	line	154
	
l2181:	
	
l10589:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_buttonPressed),w	;volatile
=======
	goto	l10720
	xorlw	2^1	; case 2
	skipnz
	goto	l10724
	xorlw	3^2	; case 3
	skipnz
	goto	l10728
	xorlw	4^3	; case 4
	skipnz
	goto	l10732
	xorlw	5^4	; case 5
	skipnz
	goto	l10736
	goto	l10852
	opt asmopt_on

	line	219
	
l2215:	
	line	222
;Main.c: 222: switch (choice)
	goto	l10852
	line	224
;Main.c: 223: {
;Main.c: 224: case 0:
	
l2222:	
	line	225
;Main.c: 225: RC0 = 1; RC1 = 1;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bsf	(57/8),(57)&7
	line	226
	
l10744:	
;Main.c: 226: spi_transfer(0b00001011);
	movlw	(0Bh)
	fcall	_spi_transfer
	line	227
	
l10746:	
;Main.c: 227: RC0 = 0; RC1 = 0;;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l10748:	
	bcf	(57/8),(57)&7
	line	228
	
l10750:	
;Main.c: 228: RC2 = 1; _nop(); RC2 = 0;;
	bsf	(58/8),(58)&7
	
l10752:	
	nop
	
l10754:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	229
;Main.c: 229: break;
	goto	l10854
	line	230
;Main.c: 230: case 1:
	
l2224:	
	line	231
	
l10756:	
;Main.c: 231: robotMove(500);
	movlw	low(01F4h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(01F4h)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	232
	
l10758:	
;Main.c: 232: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4267:
	decfsz	((??_main+0)^080h+0),f
	goto	u4267
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4267
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4267
opt asmopt_on

	line	233
	
l10760:	
;Main.c: 233: robotTurn(90);
	movlw	low(05Ah)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotTurn)^080h
	movlw	high(05Ah)
	movwf	((?_robotTurn)^080h)+1
	fcall	_robotTurn
	line	234
;Main.c: 234: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4277:
	decfsz	((??_main+0)^080h+0),f
	goto	u4277
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4277
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4277
opt asmopt_on

	line	235
	
l10762:	
;Main.c: 235: robotMove(500);
	movlw	low(01F4h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(01F4h)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	236
	
l10764:	
;Main.c: 236: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4287:
	decfsz	((??_main+0)^080h+0),f
	goto	u4287
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4287
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4287
opt asmopt_on

	line	237
;Main.c: 237: robotTurn(90);
	movlw	low(05Ah)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotTurn)^080h
	movlw	high(05Ah)
	movwf	((?_robotTurn)^080h)+1
	fcall	_robotTurn
	line	238
	
l10766:	
;Main.c: 238: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4297:
	decfsz	((??_main+0)^080h+0),f
	goto	u4297
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4297
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4297
opt asmopt_on

	line	239
	
l10768:	
;Main.c: 239: robotMove(500);
	movlw	low(01F4h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(01F4h)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	240
;Main.c: 240: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4307:
	decfsz	((??_main+0)^080h+0),f
	goto	u4307
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4307
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4307
opt asmopt_on

	line	241
	
l10770:	
;Main.c: 241: robotTurn(90);
	movlw	low(05Ah)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotTurn)^080h
	movlw	high(05Ah)
	movwf	((?_robotTurn)^080h)+1
	fcall	_robotTurn
	line	242
	
l10772:	
;Main.c: 242: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4317:
	decfsz	((??_main+0)^080h+0),f
	goto	u4317
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4317
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4317
opt asmopt_on

	line	243
;Main.c: 243: robotMove(500);
	movlw	low(01F4h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(01F4h)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	244
	
l10774:	
;Main.c: 244: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4327:
	decfsz	((??_main+0)^080h+0),f
	goto	u4327
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4327
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4327
opt asmopt_on

	line	245
	
l10776:	
;Main.c: 245: robotTurn(90);
	movlw	low(05Ah)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotTurn)^080h
	movlw	high(05Ah)
	movwf	((?_robotTurn)^080h)+1
	fcall	_robotTurn
	line	247
;Main.c: 247: break;
	goto	l10854
	line	248
;Main.c: 248: case 2:
	
l2225:	
	line	250
	
l10778:	
;Main.c: 250: robotMove(-200);
	movlw	low(-200)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(-200)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	251
	
l10780:	
;Main.c: 251: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4337:
	decfsz	((??_main+0)^080h+0),f
	goto	u4337
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4337
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4337
opt asmopt_on

	line	252
	
l10782:	
;Main.c: 252: robotTurn(-90);
	movlw	low(-90)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotTurn)^080h
	movlw	high(-90)
	movwf	((?_robotTurn)^080h)+1
	fcall	_robotTurn
	line	253
;Main.c: 253: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4347:
	decfsz	((??_main+0)^080h+0),f
	goto	u4347
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4347
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4347
opt asmopt_on

	line	254
	
l10784:	
;Main.c: 254: robotMove(-200);
	movlw	low(-200)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(-200)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	255
	
l10786:	
;Main.c: 255: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4357:
	decfsz	((??_main+0)^080h+0),f
	goto	u4357
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4357
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4357
opt asmopt_on

	line	256
;Main.c: 256: robotTurn(-90);
	movlw	low(-90)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotTurn)^080h
	movlw	high(-90)
	movwf	((?_robotTurn)^080h)+1
	fcall	_robotTurn
	line	257
	
l10788:	
;Main.c: 257: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4367:
	decfsz	((??_main+0)^080h+0),f
	goto	u4367
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4367
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4367
opt asmopt_on

	line	258
	
l10790:	
;Main.c: 258: robotMove(-200);
	movlw	low(-200)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(-200)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	259
;Main.c: 259: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4377:
	decfsz	((??_main+0)^080h+0),f
	goto	u4377
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4377
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4377
opt asmopt_on

	line	260
	
l10792:	
;Main.c: 260: robotTurn(-90);
	movlw	low(-90)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotTurn)^080h
	movlw	high(-90)
	movwf	((?_robotTurn)^080h)+1
	fcall	_robotTurn
	line	261
	
l10794:	
;Main.c: 261: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4387:
	decfsz	((??_main+0)^080h+0),f
	goto	u4387
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4387
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4387
opt asmopt_on

	line	262
;Main.c: 262: robotMove(-200);
	movlw	low(-200)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotMove)^080h
	movlw	high(-200)
	movwf	((?_robotMove)^080h)+1
	fcall	_robotMove
	line	263
	
l10796:	
;Main.c: 263: _delay((unsigned long)((2000)*(20000000/4000.0)));
	opt asmopt_off
movlw  51
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	188
movwf	((??_main+0)^080h+0+1),f
	movlw	16
movwf	((??_main+0)^080h+0),f
u4397:
	decfsz	((??_main+0)^080h+0),f
	goto	u4397
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4397
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4397
opt asmopt_on

	line	264
	
l10798:	
;Main.c: 264: robotTurn(-90);
	movlw	low(-90)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotTurn)^080h
	movlw	high(-90)
	movwf	((?_robotTurn)^080h)+1
	fcall	_robotTurn
	line	266
;Main.c: 266: break;
	goto	l10854
	line	267
;Main.c: 267: case 3:
	
l2226:	
	line	268
	
l10800:	
;Main.c: 268: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	269
	
l10802:	
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
u4407:
	decfsz	((??_main+0)^080h+0),f
	goto	u4407
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4407
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4407
	nop2
opt asmopt_on

	line	270
	
l10804:	
;Main.c: 270: ser_putch(132);
	movlw	(084h)
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
u4417:
	decfsz	((??_main+0)^080h+0),f
	goto	u4417
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4417
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4417
	nop2
opt asmopt_on

	line	273
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
u4427:
	decfsz	((??_main+0)^080h+0),f
	goto	u4427
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4427
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4427
	nop2
opt asmopt_on

	line	275
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
u4437:
	decfsz	((??_main+0)^080h+0),f
	goto	u4437
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4437
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4437
	nop2
opt asmopt_on

	line	276
	
l10806:	
;Main.c: 276: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	277
	
l10808:	
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
u4447:
	decfsz	((??_main+0)^080h+0),f
	goto	u4447
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4447
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4447
	nop2
opt asmopt_on

	line	278
;Main.c: 278: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	279
	
l10810:	
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
u4457:
	decfsz	((??_main+0)^080h+0),f
	goto	u4457
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4457
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4457
	nop2
opt asmopt_on

	line	280
	
l10812:	
;Main.c: 280: ser_putch(44);
	movlw	(02Ch)
	fcall	_ser_putch
	line	281
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
u4467:
	decfsz	((??_main+0)^080h+0),f
	goto	u4467
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4467
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4467
	nop2
opt asmopt_on

	line	282
	
l10814:	
;Main.c: 282: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	283
	
l10816:	
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
u4477:
	decfsz	((??_main+0)^080h+0),f
	goto	u4477
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4477
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4477
	nop2
opt asmopt_on

	line	284
;Main.c: 284: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	285
	
l10818:	
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
u4487:
	decfsz	((??_main+0)^080h+0),f
	goto	u4487
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4487
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4487
	nop2
opt asmopt_on

	line	286
	
l10820:	
;Main.c: 286: ser_putch(156);
	movlw	(09Ch)
	fcall	_ser_putch
	line	287
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
u4497:
	decfsz	((??_main+0)^080h+0),f
	goto	u4497
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4497
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4497
	nop2
opt asmopt_on

	line	288
	
l10822:	
;Main.c: 288: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	289
	
l10824:	
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
u4507:
	decfsz	((??_main+0)^080h+0),f
	goto	u4507
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4507
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4507
	nop2
opt asmopt_on

	line	290
;Main.c: 290: ser_putch(144);
	movlw	(090h)
	fcall	_ser_putch
	line	291
	
l10826:	
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
u4517:
	decfsz	((??_main+0)^080h+0),f
	goto	u4517
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4517
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4517
	nop2
opt asmopt_on

	line	292
	
l10828:	
;Main.c: 292: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	293
;Main.c: 293: _delay((unsigned long)((100)*(20000000/4000.0)));
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

	line	294
	
l10830:	
;Main.c: 294: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	295
	
l10832:	
;Main.c: 295: _delay((unsigned long)((100)*(20000000/4000.0)));
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

	line	296
;Main.c: 296: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	297
	
l10834:	
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
u4547:
	decfsz	((??_main+0)^080h+0),f
	goto	u4547
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4547
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4547
	nop2
opt asmopt_on

	line	298
	
l10836:	
;Main.c: 298: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	299
;Main.c: 299: _delay((unsigned long)((100)*(20000000/4000.0)));
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

	line	300
	
l10838:	
;Main.c: 300: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	301
	
l10840:	
;Main.c: 301: _delay((unsigned long)((100)*(20000000/4000.0)));
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

	line	303
	
l10842:	
;Main.c: 303: _delay((unsigned long)((100)*(20000000/4000.0)));
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

	line	305
;Main.c: 305: break;
	goto	l10854
	line	306
;Main.c: 306: case 4:
	
l2227:	
	line	307
	
l10844:	
;Main.c: 307: robotTurn(90);
	movlw	low(05Ah)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotTurn)^080h
	movlw	high(05Ah)
	movwf	((?_robotTurn)^080h)+1
	fcall	_robotTurn
	line	308
	
l10846:	
;Main.c: 308: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_main+0)^080h+0+2),f
movlw	94
movwf	((??_main+0)^080h+0+1),f
	movlw	134
movwf	((??_main+0)^080h+0),f
u4587:
	decfsz	((??_main+0)^080h+0),f
	goto	u4587
	decfsz	((??_main+0)^080h+0+1),f
	goto	u4587
	decfsz	((??_main+0)^080h+0+2),f
	goto	u4587
	clrwdt
opt asmopt_on

	line	309
	
l10848:	
;Main.c: 309: robotTurn(-90);
	movlw	low(-90)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(?_robotTurn)^080h
	movlw	high(-90)
	movwf	((?_robotTurn)^080h)+1
	fcall	_robotTurn
	line	326
;Main.c: 326: break;
	goto	l10854
	line	329
;Main.c: 329: default:
	
l2228:	
	line	331
;Main.c: 331: break;
	goto	l10854
	line	332
	
l10850:	
;Main.c: 332: }
	goto	l10854
	line	222
	
l2221:	
	
l10852:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@choice)^080h,w
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 1 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           26    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
<<<<<<< HEAD
	xorlw	1^0	; case 1
	skipnz
	goto	l2182
	xorlw	2^1	; case 2
	skipnz
	goto	l2184
	xorlw	3^2	; case 3
	skipnz
	goto	l10571
	xorlw	4^3	; case 4
	skipnz
	goto	l10575
	xorlw	5^4	; case 5
	skipnz
	goto	l10579
	goto	l10589
	opt asmopt_on

	line	189
	
l2183:	
	goto	l10589
	line	190
	
l2190:	
	line	152
	goto	l10589
	
l2191:	
	line	191
	
l2188:	
=======
	xorlw	0^0	; case 0
	skipnz
	goto	l2222
	xorlw	1^0	; case 1
	skipnz
	goto	l10756
	xorlw	2^1	; case 2
	skipnz
	goto	l10778
	xorlw	3^2	; case 3
	skipnz
	goto	l10800
	xorlw	4^3	; case 4
	skipnz
	goto	l10844
	goto	l10854
	opt asmopt_on

	line	332
	
l2223:	
	line	333
	
l10854:	
;Main.c: 333: choice = 255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_main+0)^080h+0
	movf	(??_main+0)^080h+0,w
	movwf	(main@choice)^080h
	goto	l10718
	line	483
	
l2229:	
	line	180
	goto	l10718
	
l2230:	
	line	484
	
l2231:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_init
psect	text713,local,class=CODE,delta=2
global __ptext713
__ptext713:

;; *************** function _init *****************
;; Defined at:
;;		line 125 in file "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
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
psect	text713
	file	"H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	line	125
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 0
; Regs used in _init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	126
	
l10694:	
;Main.c: 126: init_adc();
	fcall	_init_adc
	line	127
;Main.c: 127: lcd_init();
	fcall	_lcd_init
	line	128
;Main.c: 128: ser_init();
	fcall	_ser_init
	line	129
	
l10696:	
;Main.c: 129: robo_init();
	fcall	_robo_init
	line	131
	
l10698:	
;Main.c: 131: TRISB = 0b11111100;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	133
	
l10700:	
;Main.c: 133: TRISC &= 0b10010000;
	movlw	(090h)
	movwf	(??_init+0)^080h+0
	movf	(??_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	135
	
l10702:	
;Main.c: 135: SSPSTAT = 0b01000000;
	movlw	(040h)
	movwf	(148)^080h	;volatile
	line	136
	
l10704:	
;Main.c: 136: SSPCON = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	137
	
l10706:	
;Main.c: 137: RC0 = 0; RC1 = 0;
	bcf	(56/8),(56)&7
	
l10708:	
	bcf	(57/8),(57)&7
	line	139
	
l10710:	
;Main.c: 139: OPTION_REG = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	142
	
l10712:	
;Main.c: 142: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	145
	
l10714:	
;Main.c: 145: (GIE = 1);
	bsf	(95/8),(95)&7
	line	146
	
l2203:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of_calibrateIR
	__end_of_calibrateIR:
;; =============== function _calibrateIR ends ============

	signat	_calibrateIR,88
	global	_lcd_init
<<<<<<< HEAD
psect	text639,local,class=CODE,delta=2
global __ptext639
__ptext639:
=======
psect	text714,local,class=CODE,delta=2
global __ptext714
__ptext714:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 101 in file "H:\Aldnoah.Zero\trunk\Assignment3\lcd.c"
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
<<<<<<< HEAD
psect	text639
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
=======
psect	text714
	file	"H:\Aldnoah.Zero\trunk\Assignment3\lcd.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	101
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 0
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	105
	
<<<<<<< HEAD
l10549:	
=======
l10674:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 105: ADCON1 = 0b00000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	108
	
<<<<<<< HEAD
l10551:	
=======
l10676:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 108: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	109
	
<<<<<<< HEAD
l10553:	
=======
l10678:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 109: PORTE = 0;
	clrf	(9)	;volatile
	line	111
	
<<<<<<< HEAD
l10555:	
=======
l10680:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 111: TRISD = 0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	112
	
<<<<<<< HEAD
l10557:	
=======
l10682:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 112: TRISE = 0b00000000;
	clrf	(137)^080h	;volatile
	line	115
	
<<<<<<< HEAD
l10559:	
=======
l10684:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 115: lcd_write_control(0b00000001);
	movlw	(01h)
	fcall	_lcd_write_control
	line	116
	
<<<<<<< HEAD
l10561:	
=======
l10686:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 116: lcd_write_control(0b00111000);
	movlw	(038h)
	fcall	_lcd_write_control
	line	117
	
<<<<<<< HEAD
l10563:	
=======
l10688:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 117: lcd_write_control(0b00001100);
	movlw	(0Ch)
	fcall	_lcd_write_control
	line	118
<<<<<<< HEAD
	
l10565:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l10567:	
;lcd.c: 119: lcd_write_control(0b00000010);
	movlw	(02h)
	fcall	_lcd_write_control
	line	121
=======
	
l10690:	
;lcd.c: 118: lcd_write_control(0b00000110);
	movlw	(06h)
	fcall	_lcd_write_control
	line	119
	
l10692:	
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
psect	text715,local,class=CODE,delta=2
global __ptext715
__ptext715:

;; *************** function _robotTurn *****************
;; Defined at:
;;		line 66 in file "H:\Aldnoah.Zero\trunk\Assignment3\robot.c"
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
psect	text715
	file	"H:\Aldnoah.Zero\trunk\Assignment3\robot.c"
	line	66
	global	__size_of_robotTurn
	__size_of_robotTurn	equ	__end_of_robotTurn-_robotTurn
	
_robotTurn:	
	opt	stack 1
; Regs used in _robotTurn: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	69
	
l10664:	
;robot.c: 69: turnlowByte = (unsigned char) (distance) ;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(robotTurn@distance)^080h,w
	movwf	(??_robotTurn+0)^080h+0
	movf	(??_robotTurn+0)^080h+0,w
	movwf	(_turnlowByte)^080h
	line	70
	
l10666:	
;robot.c: 70: turnhighByte = (unsigned char) (distance >> 8);
	movf	(robotTurn@distance+1)^080h,w
	movwf	(??_robotTurn+0)^080h+0
	movf	(??_robotTurn+0)^080h+0,w
	movwf	(_turnhighByte)^080h
	line	71
	
l10668:	
;robot.c: 71: if (distance >= 0)
	btfsc	(robotTurn@distance+1)^080h,7
	goto	u4251
	goto	u4250
u4251:
	goto	l10672
u4250:
	line	73
	
l10670:	
;robot.c: 72: {
;robot.c: 73: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	75
;robot.c: 75: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	77
;robot.c: 77: ser_putch(100);
	movlw	(064h)
	fcall	_ser_putch
	line	79
;robot.c: 79: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	81
;robot.c: 81: ser_putch(1);
	movlw	(01h)
	fcall	_ser_putch
	line	82
;robot.c: 82: }
	goto	l6648
	line	83
	
l6647:	
	line	85
	
l10672:	
;robot.c: 83: else
;robot.c: 84: {
;robot.c: 85: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	87
;robot.c: 87: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	89
;robot.c: 89: ser_putch(100);
	movlw	(064h)
	fcall	_ser_putch
	line	91
;robot.c: 91: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	93
;robot.c: 93: ser_putch(255);
	movlw	(0FFh)
	fcall	_ser_putch
	line	94
	
l6648:	
	line	95
;robot.c: 94: }
;robot.c: 95: ser_putch(157);
	movlw	(09Dh)
	fcall	_ser_putch
	line	97
;robot.c: 97: ser_putch(turnhighByte);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_turnhighByte)^080h,w
	fcall	_ser_putch
	line	99
;robot.c: 99: ser_putch(turnlowByte);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_turnlowByte)^080h,w
	fcall	_ser_putch
	line	101
;robot.c: 101: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	103
;robot.c: 103: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	105
;robot.c: 105: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	107
;robot.c: 107: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	109
;robot.c: 109: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	111
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	
l6649:	
	return
	opt stack 0
GLOBAL	__end_of_robotTurn
	__end_of_robotTurn:
;; =============== function _robotTurn ends ============

<<<<<<< HEAD
	signat	_lcd_init,88
	global	_rotateOld
psect	text640,local,class=CODE,delta=2
global __ptext640
__ptext640:
=======
	signat	_robotTurn,4216
	global	_robotMove
psect	text716,local,class=CODE,delta=2
global __ptext716
__ptext716:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

;; *************** function _rotateOld *****************
;; Defined at:
<<<<<<< HEAD
;;		line 65 in file "E:\Aldnoah.Zero\Assignment3\steppermotor.c"
=======
;;		line 19 in file "H:\Aldnoah.Zero\trunk\Assignment3\robot.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_calibrateIR
;;		_main
;; This function uses a non-reentrant model
;;
<<<<<<< HEAD
psect	text640
	file	"E:\Aldnoah.Zero\Assignment3\steppermotor.c"
	line	65
	global	__size_of_rotateOld
	__size_of_rotateOld	equ	__end_of_rotateOld-_rotateOld
	
_rotateOld:	
	opt	stack 2
; Regs used in _rotateOld: [wreg-fsr0h+status,2+status,0]
;rotateOld@steps stored from wreg
	line	68
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(rotateOld@steps)^080h
	
l10487:	
;steppermotor.c: 68: for(;steps!=0;--steps)
	movf	(rotateOld@steps)^080h,f
	skipz
	goto	u4151
	goto	u4150
u4151:
	goto	l10491
u4150:
	goto	l10547
	
l10489:	
	goto	l10547
	line	69
	
l3638:	
	line	70
	
l10491:	
;steppermotor.c: 69: {
;steppermotor.c: 70: if (direction == 0)
	movf	(rotateOld@direction)^080h,f
	skipz
	goto	u4161
	goto	u4160
u4161:
	goto	l10517
u4160:
	goto	l10515
	line	72
	
l10493:	
;steppermotor.c: 71: {
;steppermotor.c: 72: switch(current_step)
	goto	l10515
	line	74
;steppermotor.c: 73: {
;steppermotor.c: 74: case 0b00111100: PORTC = 0b00101110; current_step = 0b00101110;
	
l3642:	
	
l10495:	
	movlw	(02Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(02Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	75
;steppermotor.c: 75: break;
	goto	l10543
	line	76
;steppermotor.c: 76: case 0b00101110: PORTC = 0b00101011; current_step = 0b00101011;
	
l3644:	
	
l10497:	
	movlw	(02Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(02Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	77
;steppermotor.c: 77: break;
	goto	l10543
	line	78
;steppermotor.c: 78: case 0b00101011: PORTC = 0b00100111; current_step = 0b00100111;
	
l3645:	
	
l10499:	
	movlw	(027h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(027h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	79
;steppermotor.c: 79: break;
	goto	l10543
	line	80
;steppermotor.c: 80: case 0b00100111: PORTC = 0b00110101; current_step = 0b00110101;
	
l3646:	
	
l10501:	
	movlw	(035h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(035h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	81
;steppermotor.c: 81: break;
	goto	l10543
	line	82
;steppermotor.c: 82: case 0b00110101: PORTC = 0b00010111; current_step = 0b00010111;
	
l3647:	
	
l10503:	
	movlw	(017h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(017h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	83
;steppermotor.c: 83: break;
	goto	l10543
	line	84
;steppermotor.c: 84: case 0b00010111: PORTC = 0b00011011; current_step = 0b00011011;
	
l3648:	
	
l10505:	
	movlw	(01Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(01Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	85
;steppermotor.c: 85: break;
	goto	l10543
	line	86
;steppermotor.c: 86: case 0b00011011: PORTC = 0b00011110; current_step = 0b00011110;
	
l3649:	
	
l10507:	
	movlw	(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(01Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	87
;steppermotor.c: 87: break;
	goto	l10543
	line	88
;steppermotor.c: 88: case 0b00011110: PORTC = 0b00111100; current_step = 0b00111100;
	
l3650:	
	
l10509:	
	movlw	(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(03Ch)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	89
;steppermotor.c: 89: break;
	goto	l10543
	line	91
;steppermotor.c: 91: default: PORTC = 0b00111001;
	
l3651:	
	
l10511:	
	movlw	(039h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	92
;steppermotor.c: 92: break;
	goto	l10543
	line	93
	
l10513:	
;steppermotor.c: 93: }
	goto	l10543
	line	72
	
l3641:	
	
l10515:	
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
	goto	l10505
	xorlw	27^23	; case 27
	skipnz
	goto	l10507
	xorlw	30^27	; case 30
	skipnz
	goto	l10509
	xorlw	39^30	; case 39
	skipnz
	goto	l10501
	xorlw	43^39	; case 43
	skipnz
	goto	l10499
	xorlw	46^43	; case 46
	skipnz
	goto	l10497
	xorlw	53^46	; case 53
	skipnz
	goto	l10503
	xorlw	60^53	; case 60
	skipnz
	goto	l10495
	goto	l10511
	opt asmopt_on

	line	93
	
l3643:	
	line	94
;steppermotor.c: 94: }
	goto	l10543
	line	95
	
l3640:	
	
l10517:	
;steppermotor.c: 95: else if (direction == 1)
	movf	(rotateOld@direction)^080h,w
	xorlw	01h
	skipz
	goto	u4171
	goto	u4170
u4171:
	goto	l10543
u4170:
	goto	l10541
	line	97
	
l10519:	
;steppermotor.c: 96: {
;steppermotor.c: 97: switch(current_step)
	goto	l10541
	line	99
;steppermotor.c: 98: {
;steppermotor.c: 99: case 0b00111100: PORTC = 0b00011110; current_step = 0b00011110;
	
l3655:	
	
l10521:	
	movlw	(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(01Eh)
=======
psect	text716
	file	"H:\Aldnoah.Zero\trunk\Assignment3\robot.c"
	line	19
	global	__size_of_robotMove
	__size_of_robotMove	equ	__end_of_robotMove-_robotMove
	
_robotMove:	
	opt	stack 1
; Regs used in _robotMove: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	21
	
l10654:	
;robot.c: 21: lowByte = (unsigned char) (distance) ;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	100
;steppermotor.c: 100: break;
	goto	l10543
	line	101
;steppermotor.c: 101: case 0b00101110: PORTC = 0b00111100; current_step = 0b00111100;
	
l3657:	
	
l10523:	
	movlw	(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
<<<<<<< HEAD
	movwf	(7)	;volatile
	movlw	(03Ch)
=======
	movwf	(_lowByte)
	line	22
	
l10656:	
;robot.c: 22: highByte = (unsigned char) (distance >> 8);
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	102
;steppermotor.c: 102: break;
	goto	l10543
	line	103
;steppermotor.c: 103: case 0b00101011: PORTC = 0b00101110; current_step = 0b00101110;
	
l3658:	
	
l10525:	
	movlw	(02Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
<<<<<<< HEAD
	movwf	(7)	;volatile
	movlw	(02Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	104
;steppermotor.c: 104: break;
	goto	l10543
	line	105
;steppermotor.c: 105: case 0b00100111: PORTC = 0b00101011; current_step = 0b00101011;
	
l3659:	
	
l10527:	
	movlw	(02Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(02Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	106
;steppermotor.c: 106: break;
	goto	l10543
	line	107
;steppermotor.c: 107: case 0b00110101: PORTC = 0b00100111; current_step = 0b00100111;
	
l3660:	
	
l10529:	
	movlw	(027h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(027h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	108
;steppermotor.c: 108: break;
	goto	l10543
	line	109
;steppermotor.c: 109: case 0b00010111: PORTC = 0b00110101; current_step = 0b00110101;
	
l3661:	
	
l10531:	
	movlw	(035h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(035h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	110
;steppermotor.c: 110: break;
	goto	l10543
	line	111
;steppermotor.c: 111: case 0b00011011: PORTC = 0b00010111; current_step = 0b00010111;
	
l3662:	
	
l10533:	
	movlw	(017h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(017h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	112
;steppermotor.c: 112: break;
	goto	l10543
	line	113
;steppermotor.c: 113: case 0b00011110: PORTC = 0b00011011; current_step = 0b00011011;
	
l3663:	
	
l10535:	
	movlw	(01Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	movlw	(01Bh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rotateOld+0)^080h+0
	movf	(??_rotateOld+0)^080h+0,w
	movwf	(_current_step)^080h
	line	114
;steppermotor.c: 114: break;
	goto	l10543
	line	116
;steppermotor.c: 116: default: PORTC = 0b00111001;
	
l3664:	
	
l10537:	
	movlw	(039h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	117
;steppermotor.c: 117: break;
	goto	l10543
	line	118
	
l10539:	
;steppermotor.c: 118: }
	goto	l10543
	line	97
	
l3654:	
	
l10541:	
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
	goto	l10531
	xorlw	27^23	; case 27
	skipnz
	goto	l10533
	xorlw	30^27	; case 30
	skipnz
	goto	l10535
	xorlw	39^30	; case 39
	skipnz
	goto	l10527
	xorlw	43^39	; case 43
	skipnz
	goto	l10525
	xorlw	46^43	; case 46
	skipnz
	goto	l10523
	xorlw	53^46	; case 53
	skipnz
	goto	l10529
	xorlw	60^53	; case 60
	skipnz
	goto	l10521
	goto	l10537
	opt asmopt_on

	line	118
	
l3656:	
	line	119
;steppermotor.c: 119: }
	goto	l10543
	line	120
	
l3653:	
	goto	l10543
	line	123
;steppermotor.c: 120: else
;steppermotor.c: 121: {
	
l3665:	
	goto	l10543
	
l3652:	
	line	125
	
l10543:	
;steppermotor.c: 123: }
;steppermotor.c: 125: _delay((unsigned long)((15)*(20000000/4000.0)));
	opt asmopt_off
movlw	98
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_rotateOld+0)^080h+0+1),f
	movlw	101
movwf	((??_rotateOld+0)^080h+0),f
u4197:
	decfsz	((??_rotateOld+0)^080h+0),f
	goto	u4197
	decfsz	((??_rotateOld+0)^080h+0+1),f
	goto	u4197
	nop2
opt asmopt_on

	line	68
	
l10545:	
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(rotateOld@steps)^080h,f
	movf	(rotateOld@steps)^080h,f
	skipz
	goto	u4181
	goto	u4180
u4181:
	goto	l10491
u4180:
	goto	l10547
	
l3639:	
	line	128
	
l10547:	
;steppermotor.c: 126: }
;steppermotor.c: 128: PORTC = 0b00111001;
	movlw	(039h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	129
	
l3666:	
=======
	movwf	(_highByte)
	line	23
	
l10658:	
;robot.c: 23: if (distance >= 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(robotMove@distance+1)^080h,7
	goto	u4241
	goto	u4240
u4241:
	goto	l10662
u4240:
	line	25
	
l10660:	
;robot.c: 24: {
;robot.c: 25: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	27
;robot.c: 27: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	29
;robot.c: 29: ser_putch(200);
	movlw	(0C8h)
	fcall	_ser_putch
	line	31
;robot.c: 31: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	33
;robot.c: 33: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	34
;robot.c: 34: }
	goto	l6643
	line	35
	
l6642:	
	line	37
	
l10662:	
;robot.c: 35: else
;robot.c: 36: {
;robot.c: 37: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	39
;robot.c: 39: ser_putch(0xff);
	movlw	(0FFh)
	fcall	_ser_putch
	line	41
;robot.c: 41: ser_putch(0x38);
	movlw	(038h)
	fcall	_ser_putch
	line	43
;robot.c: 43: ser_putch(128);
	movlw	(080h)
	fcall	_ser_putch
	line	45
;robot.c: 45: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	46
	
l6643:	
	line	47
;robot.c: 46: }
;robot.c: 47: ser_putch(156);
	movlw	(09Ch)
	fcall	_ser_putch
	line	49
;robot.c: 49: ser_putch(highByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_highByte),w
	fcall	_ser_putch
	line	51
;robot.c: 51: ser_putch(lowByte);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_lowByte),w
	fcall	_ser_putch
	line	53
;robot.c: 53: ser_putch(137);
	movlw	(089h)
	fcall	_ser_putch
	line	55
;robot.c: 55: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	57
;robot.c: 57: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	59
;robot.c: 59: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	61
;robot.c: 61: ser_putch(0);
	movlw	(0)
	fcall	_ser_putch
	line	63
	
l6644:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of_rotateOld
	__end_of_rotateOld:
;; =============== function _rotateOld ends ============

<<<<<<< HEAD
	signat	_rotateOld,8312
	global	_lcd_write_control
psect	text641,local,class=CODE,delta=2
global __ptext641
__ptext641:
=======
	signat	_robotMove,4216
	global	_robo_init
psect	text717,local,class=CODE,delta=2
global __ptext717
__ptext717:

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
psect	text717
	file	"H:\Aldnoah.Zero\trunk\Assignment3\robot.c"
	line	9
	global	__size_of_robo_init
	__size_of_robo_init	equ	__end_of_robo_init-_robo_init
	
_robo_init:	
	opt	stack 0
; Regs used in _robo_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	10
	
l10652:	
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
	
l6639:	
	return
	opt stack 0
GLOBAL	__end_of_robo_init
	__end_of_robo_init:
;; =============== function _robo_init ends ============

	signat	_robo_init,88
	global	_lcd_write_control
psect	text718,local,class=CODE,delta=2
global __ptext718
__ptext718:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

;; *************** function _lcd_write_control *****************
;; Defined at:
;;		line 18 in file "H:\Aldnoah.Zero\trunk\Assignment3\lcd.c"
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
<<<<<<< HEAD
psect	text641
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
=======
psect	text718
	file	"H:\Aldnoah.Zero\trunk\Assignment3\lcd.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
<<<<<<< HEAD
l10479:	
=======
l10644:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
<<<<<<< HEAD
l10481:	
=======
l10646:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 22: PORTD = databyte;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_write_control@databyte)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	23
	
<<<<<<< HEAD
l10483:	
=======
l10648:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
<<<<<<< HEAD
l10485:	
=======
l10650:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
u4207:
	decfsz	((??_lcd_write_control+0)^080h+0),f
	goto	u4207
	decfsz	((??_lcd_write_control+0)^080h+0+1),f
	goto	u4207
=======
u4597:
	decfsz	((??_lcd_write_control+0)^080h+0),f
	goto	u4597
	decfsz	((??_lcd_write_control+0)^080h+0+1),f
	goto	u4597
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
psect	text642,local,class=CODE,delta=2
global __ptext642
__ptext642:
=======
psect	text719,local,class=CODE,delta=2
global __ptext719
__ptext719:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

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
<<<<<<< HEAD
psect	text642
=======
psect	text719
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	46
	global	__size_of_init_adc
	__size_of_init_adc	equ	__end_of_init_adc-_init_adc
<<<<<<< HEAD
	
_init_adc:	
	opt	stack 1
; Regs used in _init_adc: [wreg+status,2]
	line	48
	
l10469:	
;adc.c: 48: PORTA = 0;
=======
	
_init_adc:	
	opt	stack 1
; Regs used in _init_adc: [wreg+status,2]
	line	48
	
l10634:	
;adc.c: 48: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	49
	
l10636:	
;adc.c: 49: TRISA = 0b00111111;
	movlw	(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	52
	
l10638:	
;adc.c: 52: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	53
	
l10640:	
;adc.c: 53: ADCON1 = 0b0000010;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	55
	
l10642:	
;adc.c: 55: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_init_adc+0)^080h+0,f
u4607:
decfsz	(??_init_adc+0)^080h+0,f
	goto	u4607
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
psect	text720,local,class=CODE,delta=2
global __ptext720
__ptext720:

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
;;		_robo_init
;;		_robotMove
;;		_robotTurn
;;		_ser_puts
;;		_ser_puts2
;;		_ser_puthex
;; This function uses a non-reentrant model
;;
psect	text720
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
	
l10234:	
;ser.c: 71: while (((txiptr+1) & (16-1))==txoptr)
	goto	l10236
	
l4380:	
	line	72
;ser.c: 72: continue;
	goto	l10236
	
l4379:	
	line	71
	
l10236:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	xorwf	(_txoptr),w	;volatile
	skipnz
	goto	u3461
	goto	u3460
u3461:
	goto	l10236
u3460:
	
l4381:	
	line	73
;ser.c: 73: GIE=0;
	bcf	(95/8),(95)&7
	line	74
	
l10238:	
;ser.c: 74: txfifo[txiptr] = c;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(ser_putch@c)^080h,w
	movwf	(??_ser_putch+0)^080h+0
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	49
	
<<<<<<< HEAD
l10471:	
;adc.c: 49: TRISA = 0b00111111;
	movlw	(03Fh)
=======
l10240:	
;ser.c: 75: txiptr=(txiptr+1) & (16-1);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_txiptr),w	;volatile
	addlw	01h
	andlw	0Fh
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	52
	
l10473:	
;adc.c: 52: ADCON0 = 0b10100001;
	movlw	(0A1h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	53
	
<<<<<<< HEAD
l10475:	
;adc.c: 53: ADCON1 = 0b0000010;
	movlw	(02h)
=======
l10242:	
;ser.c: 76: TXIE=1;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	55
	
<<<<<<< HEAD
l10477:	
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
=======
l10244:	
;ser.c: 77: GIE=1;
	bsf	(95/8),(95)&7
	line	78
	
l4382:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of_init_adc
	__end_of_init_adc:
;; =============== function _init_adc ends ============

	signat	_init_adc,88
	global	_Menu
<<<<<<< HEAD
psect	text643,local,class=CODE,delta=2
global __ptext643
__ptext643:

;; *************** function _Menu *****************
;; Defined at:
;;		line 183 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
=======
psect	text721,local,class=CODE,delta=2
global __ptext721
__ptext721:

;; *************** function _Menu *****************
;; Defined at:
;;		line 180 in file "H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
psect	text643
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	183
=======
psect	text721
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	180
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
l10208:	
;HMI.c: 181: switch (input)
	goto	l10228
	line	183
;HMI.c: 182: {
;HMI.c: 183: case 1:
	
<<<<<<< HEAD
l10059:	
;HMI.c: 184: switch (input)
	goto	l10079
=======
l5178:	
	line	185
;HMI.c: 185: break;
	goto	l10230
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	186
;HMI.c: 186: case 2:
	
<<<<<<< HEAD
l5166:	
	line	188
;HMI.c: 188: break;
	goto	l10081
=======
l5180:	
	line	188
;HMI.c: 188: break;
	goto	l10230
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	189
;HMI.c: 189: case 3:
	
<<<<<<< HEAD
l5168:	
	line	191
;HMI.c: 191: break;
	goto	l10081
	line	192
;HMI.c: 192: case 3:
	
l5169:	
	line	193
	
l10061:	
;HMI.c: 193: pos--;
=======
l5181:	
	line	190
	
l10210:	
;HMI.c: 190: pos--;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_pos),f
	skipnc
	incf	(_pos+1),f
	movlw	high(-1)
	addwf	(_pos+1),f
	line	191
	
<<<<<<< HEAD
l10063:	
;HMI.c: 194: if (pos < 0)
	btfss	(_pos+1),7
	goto	u3411
	goto	u3410
u3411:
	goto	l10081
u3410:
	line	195
	
l10065:	
;HMI.c: 195: pos = 5 - 1;
=======
l10212:	
;HMI.c: 191: if (pos < 0)
	btfss	(_pos+1),7
	goto	u3441
	goto	u3440
u3441:
	goto	l10230
u3440:
	line	192
	
l10214:	
;HMI.c: 192: pos = 5 - 1;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	low(04h)
	movwf	(_pos)
	movlw	high(04h)
	movwf	((_pos))+1
<<<<<<< HEAD
	goto	l10081
	
l5170:	
	line	197
;HMI.c: 197: break;
	goto	l10081
	line	198
;HMI.c: 198: case 4:
	
l5171:	
	line	199
	
l10067:	
;HMI.c: 199: pos++;
=======
	goto	l10230
	
l5182:	
	line	194
;HMI.c: 194: break;
	goto	l10230
	line	195
;HMI.c: 195: case 4:
	
l5183:	
	line	196
	
l10216:	
;HMI.c: 196: pos++;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	u3421
	goto	u3420
u3421:
	goto	l10081
u3420:
	line	201
	
l10069:	
;HMI.c: 201: pos = 0;
	clrf	(_pos)
	clrf	(_pos+1)
	goto	l10081
	
l5172:	
	line	203
;HMI.c: 203: break;
	goto	l10081
	line	204
;HMI.c: 204: case 5:
	
l5173:	
	line	205
	
l10071:	
;HMI.c: 205: return pos;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_pos),w
	goto	l5174
	
l10073:	
	goto	l5174
	line	206
	
l10075:	
;HMI.c: 206: break;
	goto	l10081
	line	208
;HMI.c: 208: default:
	
l5175:	
	line	210
;HMI.c: 210: break;
	goto	l10081
	line	211
	
l10077:	
;HMI.c: 211: }
	goto	l10081
	line	184
	
l5165:	
	
l10079:	
=======
	goto	u3451
	goto	u3450
u3451:
	goto	l10230
u3450:
	line	198
	
l10218:	
;HMI.c: 198: pos = 0;
	clrf	(_pos)
	clrf	(_pos+1)
	goto	l10230
	
l5184:	
	line	200
;HMI.c: 200: break;
	goto	l10230
	line	201
;HMI.c: 201: case 5:
	
l5185:	
	line	202
	
l10220:	
;HMI.c: 202: return pos;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_pos),w
	goto	l5186
	
l10222:	
	goto	l5186
	line	203
	
l10224:	
;HMI.c: 203: break;
	goto	l10230
	line	205
;HMI.c: 205: default:
	
l5187:	
	line	207
;HMI.c: 207: break;
	goto	l10230
	line	208
	
l10226:	
;HMI.c: 208: }
	goto	l10230
	line	181
	
l5177:	
	
l10228:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	l10081
	xorlw	2^1	; case 2
	skipnz
	goto	l10081
	xorlw	3^2	; case 3
	skipnz
	goto	l10061
	xorlw	4^3	; case 4
	skipnz
	goto	l10067
	xorlw	5^4	; case 5
	skipnz
	goto	l10071
	goto	l10081
=======
	goto	l10230
	xorlw	2^1	; case 2
	skipnz
	goto	l10230
	xorlw	3^2	; case 3
	skipnz
	goto	l10210
	xorlw	4^3	; case 4
	skipnz
	goto	l10216
	xorlw	5^4	; case 5
	skipnz
	goto	l10220
	goto	l10230
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	opt asmopt_on

	line	208
	
<<<<<<< HEAD
l5167:	
	line	212
	
l10081:	
;HMI.c: 212: return 255;
	movlw	(0FFh)
	goto	l5174
	
l10083:	
	line	213
	
l5174:	
=======
l5179:	
	line	209
	
l10230:	
;HMI.c: 209: return 255;
	movlw	(0FFh)
	goto	l5186
	
l10232:	
	line	210
	
l5186:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of_Menu
	__end_of_Menu:
;; =============== function _Menu ends ============

	signat	_Menu,4217
<<<<<<< HEAD
	global	_isr1
psect	text644,local,class=CODE,delta=2
global __ptext644
__ptext644:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 84 in file "E:\Aldnoah.Zero\Assignment3\Main.c"
=======
	global	_spi_transfer
psect	text722,local,class=CODE,delta=2
global __ptext722
__ptext722:

;; *************** function _spi_transfer *****************
;; Defined at:
;;		line 151 in file "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
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
psect	text722
	file	"H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	line	151
	global	__size_of_spi_transfer
	__size_of_spi_transfer	equ	__end_of_spi_transfer-_spi_transfer
	
_spi_transfer:	
	opt	stack 2
; Regs used in _spi_transfer: [wreg]
;spi_transfer@data stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(spi_transfer@data)^080h
	line	152
	
l10198:	
;Main.c: 152: unsigned char temp = 0;
	clrf	(spi_transfer@temp)^080h
	line	154
;Main.c: 154: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	155
	
l10200:	
;Main.c: 155: SSPBUF = data;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(spi_transfer@data)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	157
;Main.c: 157: while (SSPIF == 0);
	goto	l2206
	
l2207:	
	
l2206:	
	btfss	(99/8),(99)&7
	goto	u3431
	goto	u3430
u3431:
	goto	l2206
u3430:
	goto	l10202
	
l2208:	
	line	158
	
l10202:	
;Main.c: 158: temp = SSPBUF;
	movf	(19),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_spi_transfer+0)^080h+0
	movf	(??_spi_transfer+0)^080h+0,w
	movwf	(spi_transfer@temp)^080h
	line	159
	
l10204:	
;Main.c: 159: SSPIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	goto	l2209
	line	161
	
l10206:	
	line	162
;Main.c: 161: return temp;
;	Return value of _spi_transfer is never used
	
l2209:	
	return
	opt stack 0
GLOBAL	__end_of_spi_transfer
	__end_of_spi_transfer:
;; =============== function _spi_transfer ends ============

	signat	_spi_transfer,4217
	global	_ser_init
psect	text723,local,class=CODE,delta=2
global __ptext723
__ptext723:

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
psect	text723
	file	"E:\Aldnoah.Zero\Assignment3\ser.c"
	line	113
	global	__size_of_ser_init
	__size_of_ser_init	equ	__end_of_ser_init-_ser_init
	
_ser_init:	
	opt	stack 1
; Regs used in _ser_init: [wreg+status,2+status,0]
	line	114
	
l10172:	
;ser.c: 114: TRISC |= 0b10000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	115
	
l10174:	
;ser.c: 115: TRISC &= 0b10111111;
	movlw	(0BFh)
	movwf	(??_ser_init+0)^080h+0
	movf	(??_ser_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	116
	
l10176:	
;ser.c: 116: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	118
	
l10178:	
;ser.c: 118: SPBRG=20;
	movlw	(014h)
	movwf	(153)^080h	;volatile
	line	121
	
l10180:	
;ser.c: 121: TX9=0;
	bcf	(1222/8)^080h,(1222)&7
	line	122
	
l10182:	
;ser.c: 122: RX9=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(198/8),(198)&7
	line	124
	
l10184:	
;ser.c: 124: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	125
	
l10186:	
;ser.c: 125: SPEN=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	126
	
l10188:	
;ser.c: 126: CREN=1;
	bsf	(196/8),(196)&7
	line	127
	
l10190:	
;ser.c: 127: TXIE=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	line	128
	
l10192:	
;ser.c: 128: RCIE=1;
	bsf	(1125/8)^080h,(1125)&7
	line	129
	
l10194:	
;ser.c: 129: TXEN=1;
	bsf	(1221/8)^080h,(1221)&7
	line	132
	
l10196:	
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
	
l4404:	
	return
	opt stack 0
GLOBAL	__end_of_ser_init
	__end_of_ser_init:
;; =============== function _ser_init ends ============

	signat	_ser_init,88
	global	_isr1
psect	text724,local,class=CODE,delta=2
global __ptext724
__ptext724:

;; *************** function _isr1 *****************
;; Defined at:
;;		line 83 in file "H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
psect	text644
	file	"E:\Aldnoah.Zero\Assignment3\Main.c"
	line	84
=======
psect	text724
	file	"H:\Aldnoah.Zero\trunk\Assignment3\Main.c"
	line	83
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
psect	text644
	line	86
	
i1l9925:	
;Main.c: 86: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	btfss	(101/8),(101)&7
	goto	u321_21
	goto	u321_20
u321_21:
	goto	i1l9935
u321_20:
	
i1l9927:	
=======
psect	text724
	line	85
	
i1l10038:	
;Main.c: 85: if (RCIF) { rxfifo[rxiptr]=RCREG; ser_tmp=(rxiptr+1) & (16-1); if (ser_tmp!=rxoptr) rxiptr=ser_tmp; } if (TXIF && TXIE) { TXREG = txfifo[txoptr]; ++txoptr; txoptr &= (16-1); if (txoptr==txiptr) { TXIE = 0; } };
	btfss	(101/8),(101)&7
	goto	u323_21
	goto	u323_20
u323_21:
	goto	i1l10048
u323_20:
	
i1l10040:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(26),w	;volatile
	movwf	(??_isr1+0)+0
	movf	(_rxiptr),w
	addlw	_rxfifo&0ffh
	movwf	fsr0
	movf	(??_isr1+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
<<<<<<< HEAD
i1l9929:	
=======
i1l10042:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(_rxiptr),w	;volatile
	addlw	01h
	andlw	0Fh
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_ser_tmp)
	
<<<<<<< HEAD
i1l9931:	
	movf	(_ser_tmp),w
	xorwf	(_rxoptr),w	;volatile
	skipnz
	goto	u322_21
	goto	u322_20
u322_21:
	goto	i1l9935
u322_20:
	
i1l9933:	
=======
i1l10044:	
	movf	(_ser_tmp),w
	xorwf	(_rxoptr),w	;volatile
	skipnz
	goto	u324_21
	goto	u324_20
u324_21:
	goto	i1l10048
u324_20:
	
i1l10046:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(_ser_tmp),w
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_rxiptr)	;volatile
<<<<<<< HEAD
	goto	i1l9935
	
i1l2165:	
	goto	i1l9935
	
i1l2164:	
	
i1l9935:	
	btfss	(100/8),(100)&7
	goto	u323_21
	goto	u323_20
u323_21:
	goto	i1l2166
u323_20:
	
i1l9937:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u324_21
	goto	u324_20
u324_21:
	goto	i1l2166
u324_20:
	
i1l9939:	
=======
	goto	i1l10048
	
i1l2191:	
	goto	i1l10048
	
i1l2190:	
	
i1l10048:	
	btfss	(100/8),(100)&7
	goto	u325_21
	goto	u325_20
u325_21:
	goto	i1l2192
u325_20:
	
i1l10050:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1124/8)^080h,(1124)&7
	goto	u326_21
	goto	u326_20
u326_21:
	goto	i1l2192
u326_20:
	
i1l10052:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_txoptr),w
	addlw	_txfifo&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(25)	;volatile
	
<<<<<<< HEAD
i1l9941:	
=======
i1l10054:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	addwf	(_txoptr),f	;volatile
	
<<<<<<< HEAD
i1l9943:	
=======
i1l10056:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(0Fh)
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	andwf	(_txoptr),f	;volatile
	
<<<<<<< HEAD
i1l9945:	
	movf	(_txoptr),w	;volatile
	xorwf	(_txiptr),w	;volatile
	skipz
	goto	u325_21
	goto	u325_20
u325_21:
	goto	i1l2166
u325_20:
	
i1l9947:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2166
	
i1l2167:	
	
i1l2166:	
	line	88
;Main.c: 88: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u326_21
	goto	u326_20
u326_21:
	goto	i1l2174
u326_20:
	line	90
	
i1l9949:	
=======
i1l10058:	
	movf	(_txoptr),w	;volatile
	xorwf	(_txiptr),w	;volatile
	skipz
	goto	u327_21
	goto	u327_20
u327_21:
	goto	i1l2192
u327_20:
	
i1l10060:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1124/8)^080h,(1124)&7
	goto	i1l2192
	
i1l2193:	
	
i1l2192:	
	line	88
;Main.c: 88: if(TMR0IF)
	btfss	(90/8),(90)&7
	goto	u328_21
	goto	u328_20
u328_21:
	goto	i1l2200
u328_20:
	line	90
	
i1l10062:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;Main.c: 89: {
;Main.c: 90: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	91
	
<<<<<<< HEAD
i1l9951:	
=======
i1l10064:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;Main.c: 91: TMR0 = 100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	93
;Main.c: 93: RTC_Counter++;
	movlw	low(01h)
	addwf	(_RTC_Counter),f	;volatile
	skipnc
	incf	(_RTC_Counter+1),f	;volatile
	movlw	high(01h)
	addwf	(_RTC_Counter+1),f	;volatile
	line	95
	
<<<<<<< HEAD
i1l9953:	
=======
i1l10066:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;Main.c: 95: RTC_FLAG_1MS = 1;
	bsf	(_RTC_FLAG_1MS/8),(_RTC_FLAG_1MS)&7
	line	96
	
<<<<<<< HEAD
i1l9955:	
=======
i1l10068:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;Main.c: 96: if(RTC_Counter % 10 == 0)
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
<<<<<<< HEAD
	goto	u327_21
	goto	u327_20
u327_21:
	goto	i1l9959
u327_20:
	line	98
	
i1l9957:	
;Main.c: 97: {
;Main.c: 98: RTC_FLAG_10MS = 1;
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l9959
	line	100
	
i1l2169:	
	line	101
	
i1l9959:	
;Main.c: 100: }
;Main.c: 101: if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
=======
	goto	u329_21
	goto	u329_20
u329_21:
	goto	i1l10072
u329_20:
	line	98
	
i1l10070:	
;Main.c: 97: {
;Main.c: 98: RTC_FLAG_10MS = 1;
	bsf	(_RTC_FLAG_10MS/8),(_RTC_FLAG_10MS)&7
	goto	i1l10072
	line	101
	
i1l2195:	
	line	102
	
i1l10072:	
;Main.c: 101: }
;Main.c: 102: if(RTC_Counter % 50 == 0) RTC_FLAG_50MS = 1;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	u328_21
	goto	u328_20
u328_21:
	goto	i1l9963
u328_20:
	
i1l9961:	
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l9963
	
i1l2170:	
	line	102
	
i1l9963:	
;Main.c: 102: if(RTC_Counter % 250 == 0)
=======
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l10076
u330_20:
	
i1l10074:	
	bsf	(_RTC_FLAG_50MS/8),(_RTC_FLAG_50MS)&7
	goto	i1l10076
	
i1l2196:	
	line	103
	
i1l10076:	
;Main.c: 103: if(RTC_Counter % 250 == 0)
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	u329_21
	goto	u329_20
u329_21:
	goto	i1l9969
u329_20:
	line	104
	
i1l9965:	
;Main.c: 103: {
;Main.c: 104: readAvgDistance();
	fcall	_readAvgDistance
	line	105
;Main.c: 105: UpdateDisplay();
	fcall	_UpdateDisplay
	line	106
	
i1l9967:	
;Main.c: 106: RTC_FLAG_250MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l9969
	line	108
	
i1l2171:	
	line	109
	
i1l9969:	
;Main.c: 108: }
;Main.c: 109: if(RTC_Counter % 500 == 0)
=======
	goto	u331_21
	goto	u331_20
u331_21:
	goto	i1l10082
u331_20:
	line	105
	
i1l10078:	
;Main.c: 104: {
;Main.c: 105: readAvgDistance();
	fcall	_readAvgDistance
	line	106
;Main.c: 106: UpdateDisplay(serialInput);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_serialInput),w	;volatile
	fcall	_UpdateDisplay
	line	107
	
i1l10080:	
;Main.c: 107: RTC_FLAG_250MS = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_RTC_FLAG_250MS/8),(_RTC_FLAG_250MS)&7
	goto	i1l10082
	line	109
	
i1l2197:	
	line	110
	
i1l10082:	
;Main.c: 109: }
;Main.c: 110: if(RTC_Counter % 500 == 0)
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	u330_21
	goto	u330_20
u330_21:
	goto	i1l9977
u330_20:
	line	111
	
i1l9971:	
;Main.c: 110: {
;Main.c: 111: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	112
	
i1l9973:	
;Main.c: 112: RTC_Counter = 0;
	clrf	(_RTC_Counter)	;volatile
	clrf	(_RTC_Counter+1)	;volatile
	line	113
	
i1l9975:	
;Main.c: 113: RB0 ^= 0x01;
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l9977
	line	114
	
i1l2172:	
	line	116
	
i1l9977:	
;Main.c: 114: }
;Main.c: 116: if (buttonPressed == 0)
	movf	(_buttonPressed),f
	skipz	;volatile
	goto	u331_21
	goto	u331_20
u331_21:
	goto	i1l2174
u331_20:
	line	118
	
i1l9979:	
;Main.c: 117: {
;Main.c: 118: buttonPressed = ReadButtons();
=======
	goto	u332_21
	goto	u332_20
u332_21:
	goto	i1l10090
u332_20:
	line	112
	
i1l10084:	
;Main.c: 111: {
;Main.c: 112: RTC_FLAG_500MS = 1;
	bsf	(_RTC_FLAG_500MS/8),(_RTC_FLAG_500MS)&7
	line	113
	
i1l10086:	
;Main.c: 113: RTC_Counter = 0;
	clrf	(_RTC_Counter)	;volatile
	clrf	(_RTC_Counter+1)	;volatile
	line	114
	
i1l10088:	
;Main.c: 114: RB0 ^= 0x01;
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	goto	i1l10090
	line	115
	
i1l2198:	
	line	117
	
i1l10090:	
;Main.c: 115: }
;Main.c: 117: if (buttonPressed == 0)
	movf	(_buttonPressed),f
	skipz	;volatile
	goto	u333_21
	goto	u333_20
u333_21:
	goto	i1l2200
u333_20:
	line	119
	
i1l10092:	
;Main.c: 118: {
;Main.c: 119: buttonPressed = ReadButtons();
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	fcall	_ReadButtons
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_isr1+0)+0
	movf	(??_isr1+0)+0,w
	movwf	(_buttonPressed)	;volatile
<<<<<<< HEAD
	goto	i1l2174
	line	119
	
i1l2173:	
	goto	i1l2174
	line	120
	
i1l2168:	
	line	121
	
i1l2174:	
=======
	goto	i1l2200
	line	120
	
i1l2199:	
	goto	i1l2200
	line	121
	
i1l2194:	
	line	122
	
i1l2200:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
psect	text645,local,class=CODE,delta=2
global __ptext645
__ptext645:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 216 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
=======
psect	text725,local,class=CODE,delta=2
global __ptext725
__ptext725:

;; *************** function _UpdateDisplay *****************
;; Defined at:
;;		line 220 in file "H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
psect	text645
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	216
=======
psect	text725
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	220
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	global	__size_of_UpdateDisplay
	__size_of_UpdateDisplay	equ	__end_of_UpdateDisplay-_UpdateDisplay
	
_UpdateDisplay:	
	opt	stack 1
; Regs used in _UpdateDisplay: [allreg]
	line	221
	
<<<<<<< HEAD
i1l9997:	
;HMI.c: 217: char adcOutput[16] = "";
	movlw	(UpdateDisplay@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1211)
=======
i1l10110:	
;HMI.c: 221: char adcOutput[16] = "";
	movlw	(UpdateDisplay@adcOutput)&0ffh
	movwf	fsr0
	movlw	low(UpdateDisplay@F1223)
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_UpdateDisplay+0)+0
	movf	fsr0,w
	movwf	((??_UpdateDisplay+0)+0+1)
	movlw	16
	movwf	((??_UpdateDisplay+0)+0+2)
<<<<<<< HEAD
u334_20:
=======
u336_20:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	u334_20
	line	218
	
i1l9999:	
;HMI.c: 218: lcd_write_control(0b00000001);
=======
	goto	u336_20
	line	222
	
i1l10112:	
;HMI.c: 222: lcd_write_control(0b00000001);
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	fcall	i1_lcd_write_control
	line	224
	
<<<<<<< HEAD
i1l10001:	
;HMI.c: 220: sprintf(adcOutput,"ADC:%d Dist:%d",highByte, lowByte);
=======
i1l10114:	
;HMI.c: 224: sprintf(adcOutput,"ADC:%d Dist:%d",highByte, lowByte);
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	line	226
	
<<<<<<< HEAD
i1l10003:	
;HMI.c: 222: lcd_set_cursor(0x00);
=======
i1l10116:	
;HMI.c: 226: lcd_set_cursor(0x00);
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(0)
	fcall	_lcd_set_cursor
	line	227
	
<<<<<<< HEAD
i1l10005:	
;HMI.c: 223: lcd_write_string(adcOutput);
=======
i1l10118:	
;HMI.c: 227: lcd_write_string(adcOutput);
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(UpdateDisplay@adcOutput&0ffh)
	movwf	(?_lcd_write_string)
	movlw	(0x0/2)
	movwf	(?_lcd_write_string+1)
	fcall	_lcd_write_string
	line	232
	
<<<<<<< HEAD
i1l10007:	
;HMI.c: 228: lcd_set_cursor(0x40);
=======
i1l10120:	
;HMI.c: 232: lcd_set_cursor(0x40);
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(040h)
	fcall	_lcd_set_cursor
	line	233
	
<<<<<<< HEAD
i1l10009:	
;HMI.c: 229: if (pos > 0)
=======
i1l10122:	
;HMI.c: 233: if (pos > 0)
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_pos+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
<<<<<<< HEAD
	goto	u335_25
	movlw	low(01h)
	subwf	(_pos),w
u335_25:

	skipc
	goto	u335_21
	goto	u335_20
u335_21:
	goto	i1l10013
u335_20:
	line	230
	
i1l10011:	
;HMI.c: 230: lcd_write_string(shortMenuStrings[pos - 1]);
=======
	goto	u337_25
	movlw	low(01h)
	subwf	(_pos),w
u337_25:

	skipc
	goto	u337_21
	goto	u337_20
u337_21:
	goto	i1l10126
u337_20:
	line	234
	
i1l10124:	
;HMI.c: 234: lcd_write_string(shortMenuStrings[pos - 1]);
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l10015
	line	231
	
i1l5180:	
	line	232
	
i1l10013:	
;HMI.c: 231: else
;HMI.c: 232: lcd_write_string(shortMenuStrings[pos + 5 - 1]);
=======
	goto	i1l10128
	line	235
	
i1l5197:	
	line	236
	
i1l10126:	
;HMI.c: 235: else
;HMI.c: 236: lcd_write_string(shortMenuStrings[pos + 5 - 1]);
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l10015
	
i1l5181:	
	line	233
	
i1l10015:	
;HMI.c: 233: lcd_set_cursor(0x44);
=======
	goto	i1l10128
	
i1l5198:	
	line	237
	
i1l10128:	
;HMI.c: 237: lcd_set_cursor(0x44);
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(044h)
	fcall	_lcd_set_cursor
	line	238
	
<<<<<<< HEAD
i1l10017:	
;HMI.c: 234: lcd_write_string(menuStrings[pos]);
=======
i1l10130:	
;HMI.c: 238: lcd_write_string(menuStrings[pos]);
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	line	239
;HMI.c: 239: lcd_set_cursor(0x4D);
	movlw	(04Dh)
	fcall	_lcd_set_cursor
	line	240
	
<<<<<<< HEAD
i1l10019:	
;HMI.c: 236: lcd_write_string(shortMenuStrings[(pos + 1) % 5]);
=======
i1l10132:	
;HMI.c: 240: lcd_write_string(shortMenuStrings[(pos + 1) % 5]);
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	line	241
	
<<<<<<< HEAD
i1l5182:	
=======
i1l5199:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of_UpdateDisplay
	__end_of_UpdateDisplay:
;; =============== function _UpdateDisplay ends ============

	signat	_UpdateDisplay,4216
	global	_readAvgDistance
<<<<<<< HEAD
psect	text646,local,class=CODE,delta=2
global __ptext646
__ptext646:
=======
psect	text726,local,class=CODE,delta=2
global __ptext726
__ptext726:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

;; *************** function _readAvgDistance *****************
;; Defined at:
;;		line 10 in file "E:\Aldnoah.Zero\Assignment3\infrared.c"
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
<<<<<<< HEAD
psect	text646
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
=======
psect	text726
	file	"H:\Aldnoah.Zero\trunk\Assignment3\infrared.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	10
	global	__size_of_readAvgDistance
	__size_of_readAvgDistance	equ	__end_of_readAvgDistance-_readAvgDistance
	
_readAvgDistance:	
	opt	stack 0
; Regs used in _readAvgDistance: [allreg]
	line	11
	
<<<<<<< HEAD
i1l9981:	
=======
i1l10094:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;infrared.c: 11: unsigned int fullval = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(readAvgDistance@fullval)
	clrf	(readAvgDistance@fullval+1)
	line	14
;infrared.c: 14: for (int i = 0; i < 10; i++)
	clrf	(readAvgDistance@i)
	clrf	(readAvgDistance@i+1)
	
<<<<<<< HEAD
i1l9983:	
=======
i1l10096:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
<<<<<<< HEAD
	goto	u332_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u332_25:

	skipc
	goto	u332_21
	goto	u332_20
u332_21:
	goto	i1l9987
u332_20:
	goto	i1l9993
	
i1l9985:	
	goto	i1l9993
	line	15
	
i1l2908:	
	line	16
	
i1l9987:	
=======
	goto	u334_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u334_25:

	skipc
	goto	u334_21
	goto	u334_20
u334_21:
	goto	i1l10100
u334_20:
	goto	i1l10106
	
i1l10098:	
	goto	i1l10106
	line	15
	
i1l2932:	
	line	16
	
i1l10100:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
<<<<<<< HEAD
i1l9989:	
=======
i1l10102:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	low(01h)
	addwf	(readAvgDistance@i),f
	skipnc
	incf	(readAvgDistance@i+1),f
	movlw	high(01h)
	addwf	(readAvgDistance@i+1),f
	
<<<<<<< HEAD
i1l9991:	
=======
i1l10104:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(readAvgDistance@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
<<<<<<< HEAD
	goto	u333_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u333_25:

	skipc
	goto	u333_21
	goto	u333_20
u333_21:
	goto	i1l9987
u333_20:
	goto	i1l9993
	
i1l2909:	
	line	19
	
i1l9993:	
=======
	goto	u335_25
	movlw	low(0Ah)
	subwf	(readAvgDistance@i),w
u335_25:

	skipc
	goto	u335_21
	goto	u335_20
u335_21:
	goto	i1l10100
u335_20:
	goto	i1l10106
	
i1l2933:	
	line	19
	
i1l10106:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
<<<<<<< HEAD
i1l9995:	
=======
i1l10108:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;infrared.c: 20: ADCconvert();
	fcall	_ADCconvert
	line	21
	
<<<<<<< HEAD
i1l2910:	
=======
i1l2934:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of_readAvgDistance
	__end_of_readAvgDistance:
;; =============== function _readAvgDistance ends ============

	signat	_readAvgDistance,88
	global	_readDistance
<<<<<<< HEAD
psect	text647,local,class=CODE,delta=2
global __ptext647
__ptext647:
=======
psect	text727,local,class=CODE,delta=2
global __ptext727
__ptext727:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

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
<<<<<<< HEAD
psect	text647
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
=======
psect	text727
	file	"H:\Aldnoah.Zero\trunk\Assignment3\infrared.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	24
	global	__size_of_readDistance
	__size_of_readDistance	equ	__end_of_readDistance-_readDistance
	
_readDistance:	
	opt	stack 0
; Regs used in _readDistance: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	27
	
<<<<<<< HEAD
i1l10085:	
=======
i1l10246:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
<<<<<<< HEAD
i1l10087:	
=======
i1l10248:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;infrared.c: 29: return fullval;
	movf	(readDistance@fullval+1),w
	clrf	(?_readDistance+1)
	addwf	(?_readDistance+1)
	movf	(readDistance@fullval),w
	clrf	(?_readDistance)
	addwf	(?_readDistance)

<<<<<<< HEAD
	goto	i1l2913
	
i1l10089:	
	line	30
	
i1l2913:	
=======
	goto	i1l2937
	
i1l10250:	
	line	30
	
i1l2937:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of_readDistance
	__end_of_readDistance:
;; =============== function _readDistance ends ============

	signat	_readDistance,90
	global	_lcd_write_string
<<<<<<< HEAD
psect	text648,local,class=CODE,delta=2
global __ptext648
__ptext648:
=======
psect	text728,local,class=CODE,delta=2
global __ptext728
__ptext728:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

;; *************** function _lcd_write_string *****************
;; Defined at:
;;		line 48 in file "H:\Aldnoah.Zero\trunk\Assignment3\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               2    7[COMMON] PTR unsigned char 
;;		 -> UpdateDisplay@adcOutput(16), STR_10(4), STR_9(4), STR_8(4), 
;;		 -> STR_7(4), STR_6(4), STR_5(9), STR_4(8), 
;;		 -> STR_3(9), STR_2(9), STR_1(9), 
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
<<<<<<< HEAD
psect	text648
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
=======
psect	text728
	file	"H:\Aldnoah.Zero\trunk\Assignment3\lcd.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	48
	global	__size_of_lcd_write_string
	__size_of_lcd_write_string	equ	__end_of_lcd_write_string-_lcd_write_string
	
_lcd_write_string:	
	opt	stack 1
; Regs used in _lcd_write_string: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	50
	
<<<<<<< HEAD
i1l9891:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	i1l9897
=======
i1l10004:	
;lcd.c: 50: while(*s) lcd_write_data(*s++);
	goto	i1l10010
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	
i1l1409:	
	
<<<<<<< HEAD
i1l9893:	
=======
i1l10006:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(lcd_write_string@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_write_data
	
<<<<<<< HEAD
i1l9895:	
=======
i1l10008:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	low(01h)
	addwf	(lcd_write_string@s),f
	skipnc
	incf	(lcd_write_string@s+1),f
	movlw	high(01h)
	addwf	(lcd_write_string@s+1),f
<<<<<<< HEAD
	goto	i1l9897
=======
	goto	i1l10010
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	
i1l1408:	
	
<<<<<<< HEAD
i1l9897:	
=======
i1l10010:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(lcd_write_string@s+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(lcd_write_string@s),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
<<<<<<< HEAD
	goto	u317_21
	goto	u317_20
u317_21:
	goto	i1l9893
u317_20:
	goto	i1l1405
	
i1l1404:	
=======
	goto	u319_21
	goto	u319_20
u319_21:
	goto	i1l10006
u319_20:
	goto	i1l1411
	
i1l1410:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	51
	
i1l1411:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write_string
	__end_of_lcd_write_string:
;; =============== function _lcd_write_string ends ============

	signat	_lcd_write_string,4216
	global	_lcd_set_cursor
<<<<<<< HEAD
psect	text649,local,class=CODE,delta=2
global __ptext649
__ptext649:
=======
psect	text729,local,class=CODE,delta=2
global __ptext729
__ptext729:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

;; *************** function _lcd_set_cursor *****************
;; Defined at:
;;		line 42 in file "H:\Aldnoah.Zero\trunk\Assignment3\lcd.c"
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
<<<<<<< HEAD
psect	text649
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
=======
psect	text729
	file	"H:\Aldnoah.Zero\trunk\Assignment3\lcd.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	42
	global	__size_of_lcd_set_cursor
	__size_of_lcd_set_cursor	equ	__end_of_lcd_set_cursor-_lcd_set_cursor
	
_lcd_set_cursor:	
	opt	stack 1
; Regs used in _lcd_set_cursor: [wreg+status,2+status,0+pclath+cstack]
;lcd_set_cursor@address stored from wreg
	movwf	(lcd_set_cursor@address)
	line	43
	
<<<<<<< HEAD
i1l9887:	
=======
i1l10000:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 43: address |= 0b10000000;
	bsf	(lcd_set_cursor@address)+(7/8),(7)&7
	line	44
	
<<<<<<< HEAD
i1l9889:	
=======
i1l10002:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
psect	text650,local,class=CODE,delta=2
global __ptext650
__ptext650:
=======
psect	text730,local,class=CODE,delta=2
global __ptext730
__ptext730:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

;; *************** function i1_lcd_write_control *****************
;; Defined at:
;;		line 18 in file "H:\Aldnoah.Zero\trunk\Assignment3\lcd.c"
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
<<<<<<< HEAD
psect	text650
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
=======
psect	text730
	file	"H:\Aldnoah.Zero\trunk\Assignment3\lcd.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	18
	global	__size_ofi1_lcd_write_control
	__size_ofi1_lcd_write_control	equ	__end_ofi1_lcd_write_control-i1_lcd_write_control
	
i1_lcd_write_control:	
	opt	stack 1
; Regs used in i1_lcd_write_control: [wreg]
;i1lcd_write_control@databyte stored from wreg
	movwf	(i1lcd_write_control@databyte)
	line	19
	
<<<<<<< HEAD
i1l10461:	
=======
i1l10626:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
<<<<<<< HEAD
i1l10463:	
=======
i1l10628:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 22: PORTD = databyte;
	movf	(i1lcd_write_control@databyte),w
	movwf	(8)	;volatile
	line	23
	
<<<<<<< HEAD
i1l10465:	
=======
i1l10630:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 23: RE2 = 1;
	bsf	(74/8),(74)&7
	line	24
	
<<<<<<< HEAD
i1l10467:	
=======
i1l10632:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 24: RE2 = 0;
	bcf	(74/8),(74)&7
	line	25
;lcd.c: 25: _delay((unsigned long)((2)*(20000000/4000.0)));
	opt asmopt_off
movlw	13
movwf	((??i1_lcd_write_control+0)+0+1),f
	movlw	251
movwf	((??i1_lcd_write_control+0)+0),f
<<<<<<< HEAD
u422_27:
	decfsz	((??i1_lcd_write_control+0)+0),f
	goto	u422_27
	decfsz	((??i1_lcd_write_control+0)+0+1),f
	goto	u422_27
=======
u461_27:
	decfsz	((??i1_lcd_write_control+0)+0),f
	goto	u461_27
	decfsz	((??i1_lcd_write_control+0)+0+1),f
	goto	u461_27
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
psect	text651,local,class=CODE,delta=2
global __ptext651
__ptext651:
=======
psect	text731,local,class=CODE,delta=2
global __ptext731
__ptext731:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

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
<<<<<<< HEAD
psect	text651
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\doprnt.c"
=======
psect	text731
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\doprnt.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
<<<<<<< HEAD
i1l10275:	
=======
i1l10474:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
<<<<<<< HEAD
	goto	i1l10327
	
i1l6622:	
	line	542
	
i1l10277:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u381_21
	goto	u381_20
u381_21:
	goto	i1l6623
u381_20:
	line	545
	
i1l10279:	
=======
	goto	i1l10526
	
i1l6659:	
	line	542
	
i1l10476:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u390_21
	goto	u390_20
u390_21:
	goto	i1l6660
u390_20:
	line	545
	
i1l10478:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
<<<<<<< HEAD
i1l10281:	
=======
i1l10480:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
<<<<<<< HEAD
	goto	i1l10327
	line	547
	
i1l6623:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	i1l10285
	line	640
	
i1l6625:	
	line	641
	goto	i1l10329
	line	700
	
i1l6627:	
	goto	i1l10287
	line	701
	
i1l6628:	
	line	702
	goto	i1l10287
	line	805
	
i1l6630:	
	line	816
	goto	i1l10327
	line	825
	
i1l10283:	
	goto	i1l10287
	line	638
	
i1l6624:	
	
i1l10285:	
=======
	goto	i1l10526
	line	547
	
i1l6660:	
	line	552
	clrf	(sprintf@flag)
	line	638
	goto	i1l10484
	line	640
	
i1l6662:	
	line	641
	goto	i1l10528
	line	700
	
i1l6664:	
	goto	i1l10486
	line	701
	
i1l6665:	
	line	702
	goto	i1l10486
	line	805
	
i1l6667:	
	line	816
	goto	i1l10526
	line	825
	
i1l10482:	
	goto	i1l10486
	line	638
	
i1l6661:	
	
i1l10484:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l10329
	xorlw	100^0	; case 100
	skipnz
	goto	i1l10287
	xorlw	105^100	; case 105
	skipnz
	goto	i1l10287
	goto	i1l10327
=======
	goto	i1l10528
	xorlw	100^0	; case 100
	skipnz
	goto	i1l10486
	xorlw	105^100	; case 105
	skipnz
	goto	i1l10486
	goto	i1l10526
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	opt asmopt_on

	line	825
	
<<<<<<< HEAD
i1l6629:	
	line	1254
	
i1l10287:	
=======
i1l6666:	
	line	1254
	
i1l10486:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(sprintf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
<<<<<<< HEAD
i1l10289:	
=======
i1l10488:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1256
	
<<<<<<< HEAD
i1l10291:	
	btfss	(sprintf@_val+1),7
	goto	u382_21
	goto	u382_20
u382_21:
	goto	i1l10297
u382_20:
	line	1257
	
i1l10293:	
=======
i1l10490:	
	btfss	(sprintf@_val+1),7
	goto	u391_21
	goto	u391_20
u391_21:
	goto	i1l10496
u391_20:
	line	1257
	
i1l10492:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(03h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	iorwf	(sprintf@flag),f
	line	1258
	
<<<<<<< HEAD
i1l10295:	
=======
i1l10494:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	comf	(sprintf@_val),f
	comf	(sprintf@_val+1),f
	incf	(sprintf@_val),f
	skipnz
	incf	(sprintf@_val+1),f
<<<<<<< HEAD
	goto	i1l10297
	line	1259
	
i1l6631:	
	line	1300
	
i1l10297:	
=======
	goto	i1l10496
	line	1259
	
i1l6668:	
	line	1300
	
i1l10496:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
<<<<<<< HEAD
i1l10299:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u383_21
	goto	u383_20
u383_21:
	goto	i1l10303
u383_20:
	goto	i1l10311
	
i1l10301:	
	goto	i1l10311
	line	1301
	
i1l6632:	
	
i1l10303:	
=======
i1l10498:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l10502
u392_20:
	goto	i1l10510
	
i1l10500:	
	goto	i1l10510
	line	1301
	
i1l6669:	
	
i1l10502:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	u384_25
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u384_25:
	skipnc
	goto	u384_21
	goto	u384_20
u384_21:
	goto	i1l10307
u384_20:
	goto	i1l10311
	line	1302
	
i1l10305:	
	goto	i1l10311
	
i1l6634:	
	line	1300
	
i1l10307:	
=======
	goto	u393_25
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u393_25:
	skipnc
	goto	u393_21
	goto	u393_20
u393_21:
	goto	i1l10506
u393_20:
	goto	i1l10510
	line	1302
	
i1l10504:	
	goto	i1l10510
	
i1l6671:	
	line	1300
	
i1l10506:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
<<<<<<< HEAD
i1l10309:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u385_21
	goto	u385_20
u385_21:
	goto	i1l10303
u385_20:
	goto	i1l10311
	
i1l6633:	
	line	1433
	
i1l10311:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u386_21
	goto	u386_20
u386_21:
	goto	i1l10317
u386_20:
	line	1434
	
i1l10313:	
=======
i1l10508:	
	movf	(sprintf@c),w
	xorlw	05h
	skipz
	goto	u394_21
	goto	u394_20
u394_21:
	goto	i1l10502
u394_20:
	goto	i1l10510
	
i1l6670:	
	line	1433
	
i1l10510:	
	movf	(sprintf@flag),w
	andlw	03h
	btfsc	status,2
	goto	u395_21
	goto	u395_20
u395_21:
	goto	i1l10516
u395_20:
	line	1434
	
i1l10512:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(02Dh)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
<<<<<<< HEAD
i1l10315:	
=======
i1l10514:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
<<<<<<< HEAD
	goto	i1l10317
	
i1l6635:	
	line	1467
	
i1l10317:	
=======
	goto	i1l10516
	
i1l6672:	
	line	1467
	
i1l10516:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
<<<<<<< HEAD
	goto	i1l10325
	
i1l6637:	
	line	1484
	
i1l10319:	
=======
	goto	i1l10524
	
i1l6674:	
	line	1484
	
i1l10518:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
<<<<<<< HEAD
i1l10321:	
=======
i1l10520:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
<<<<<<< HEAD
i1l10323:	
=======
i1l10522:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
<<<<<<< HEAD
	goto	i1l10325
	line	1517
	
i1l6636:	
	line	1469
	
i1l10325:	
=======
	goto	i1l10524
	line	1517
	
i1l6673:	
	line	1469
	
i1l10524:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
<<<<<<< HEAD
	goto	u387_21
	goto	u387_20
u387_21:
	goto	i1l10319
u387_20:
	goto	i1l10327
	
i1l6638:	
	goto	i1l10327
	line	1525
	
i1l6621:	
	line	540
	
i1l10327:	
=======
	goto	u396_21
	goto	u396_20
u396_21:
	goto	i1l10518
u396_20:
	goto	i1l10526
	
i1l6675:	
	goto	i1l10526
	line	1525
	
i1l6658:	
	line	540
	
i1l10526:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	u388_21
	goto	u388_20
u388_21:
	goto	i1l10277
u388_20:
	goto	i1l10329
	
i1l6639:	
	goto	i1l10329
	line	1527
	
i1l6626:	
	line	1530
	
i1l10329:	
=======
	goto	u397_21
	goto	u397_20
u397_21:
	goto	i1l10476
u397_20:
	goto	i1l10528
	
i1l6676:	
	goto	i1l10528
	line	1527
	
i1l6663:	
	line	1530
	
i1l10528:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
<<<<<<< HEAD
	goto	i1l6640
	line	1532
	
i1l10331:	
	line	1533
;	Return value of _sprintf is never used
	
i1l6640:	
=======
	goto	i1l6677
	line	1532
	
i1l10530:	
	line	1533
;	Return value of _sprintf is never used
	
i1l6677:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_ADCconvert
<<<<<<< HEAD
psect	text652,local,class=CODE,delta=2
global __ptext652
__ptext652:
=======
psect	text732,local,class=CODE,delta=2
global __ptext732
__ptext732:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___wmul
;;		___lwdiv
;; This function is called by:
;;		_readAvgDistance
;; This function uses a non-reentrant model
;;
<<<<<<< HEAD
psect	text652
	file	"E:\Aldnoah.Zero\Assignment3\infrared.c"
=======
psect	text732
	file	"H:\Aldnoah.Zero\trunk\Assignment3\infrared.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	33
	global	__size_of_ADCconvert
	__size_of_ADCconvert	equ	__end_of_ADCconvert-_ADCconvert
	
_ADCconvert:	
	opt	stack 1
; Regs used in _ADCconvert: [wreg+status,2+status,0+pclath+cstack]
	line	39
	
<<<<<<< HEAD
i1l10091:	
=======
i1l10252:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;infrared.c: 39: if (adcVal >= 213 && adcVal < 234)
	movlw	high(0D5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
<<<<<<< HEAD
	goto	u343_21
	goto	u343_20
u343_21:
	goto	i1l10097
u343_20:
	
i1l10093:	
=======
	goto	u347_21
	goto	u347_20
u347_21:
	goto	i1l10258
u347_20:
	
i1l10254:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	high(0EAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0EAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
<<<<<<< HEAD
	goto	u344_21
	goto	u344_20
u344_21:
	goto	i1l10097
u344_20:
	line	41
	
i1l10095:	
=======
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l10258
u348_20:
	line	41
	
i1l10256:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l2929
	line	43
	
i1l2916:	
	
i1l10097:	
=======
	goto	i1l2953
	line	43
	
i1l2940:	
	
i1l10258:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;infrared.c: 43: else if (adcVal >= 170 && adcVal < 213)
	movlw	high(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
<<<<<<< HEAD
	goto	u345_21
	goto	u345_20
u345_21:
	goto	i1l10103
u345_20:
	
i1l10099:	
=======
	goto	u349_21
	goto	u349_20
u349_21:
	goto	i1l10264
u349_20:
	
i1l10260:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	high(0D5h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0D5h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
<<<<<<< HEAD
	goto	u346_21
	goto	u346_20
u346_21:
	goto	i1l10103
u346_20:
	line	45
	
i1l10101:	
=======
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l10264
u350_20:
	line	45
	
i1l10262:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l2929
	line	47
	
i1l2918:	
	
i1l10103:	
=======
	goto	i1l2953
	line	47
	
i1l2942:	
	
i1l10264:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;infrared.c: 47: else if (adcVal >= 128 && adcVal < 170)
	movlw	high(080h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
<<<<<<< HEAD
	goto	u347_21
	goto	u347_20
u347_21:
	goto	i1l10109
u347_20:
	
i1l10105:	
=======
	goto	u351_21
	goto	u351_20
u351_21:
	goto	i1l10270
u351_20:
	
i1l10266:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	high(0AAh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(0AAh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
<<<<<<< HEAD
	goto	u348_21
	goto	u348_20
u348_21:
	goto	i1l10109
u348_20:
	line	49
	
i1l10107:	
=======
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l10270
u352_20:
	line	49
	
i1l10268:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l2929
	line	51
	
i1l2920:	
	
i1l10109:	
=======
	goto	i1l2953
	line	51
	
i1l2944:	
	
i1l10270:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;infrared.c: 51: else if (adcVal >= 107 && adcVal < 128)
	movlw	high(06Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
<<<<<<< HEAD
	goto	u349_21
	goto	u349_20
u349_21:
	goto	i1l10115
u349_20:
	
i1l10111:	
=======
	goto	u353_21
	goto	u353_20
u353_21:
	goto	i1l10276
u353_20:
	
i1l10272:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	high(080h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(080h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
<<<<<<< HEAD
	goto	u350_21
	goto	u350_20
u350_21:
	goto	i1l10115
u350_20:
	line	53
	
i1l10113:	
=======
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l10276
u354_20:
	line	53
	
i1l10274:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l2929
	line	55
	
i1l2922:	
	
i1l10115:	
=======
	goto	i1l2953
	line	55
	
i1l2946:	
	
i1l10276:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;infrared.c: 55: else if (adcVal >= 77 && adcVal < 107)
	movlw	high(04Dh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
<<<<<<< HEAD
	goto	u351_21
	goto	u351_20
u351_21:
	goto	i1l10121
u351_20:
	
i1l10117:	
=======
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l10282
u355_20:
	
i1l10278:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	high(06Bh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(06Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
<<<<<<< HEAD
	goto	u352_21
	goto	u352_20
u352_21:
	goto	i1l10121
u352_20:
	line	57
	
i1l10119:	
=======
	goto	u356_21
	goto	u356_20
u356_21:
	goto	i1l10282
u356_20:
	line	57
	
i1l10280:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l2929
	line	59
	
i1l2924:	
	
i1l10121:	
=======
	goto	i1l2953
	line	59
	
i1l2948:	
	
i1l10282:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;infrared.c: 59: else if (adcVal >= 56 && adcVal < 77)
	movlw	high(038h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
<<<<<<< HEAD
	goto	u353_21
	goto	u353_20
u353_21:
	goto	i1l10127
u353_20:
	
i1l10123:	
=======
	goto	u357_21
	goto	u357_20
u357_21:
	goto	i1l10288
u357_20:
	
i1l10284:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	high(04Dh)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(04Dh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
<<<<<<< HEAD
	goto	u354_21
	goto	u354_20
u354_21:
	goto	i1l10127
u354_20:
	line	61
	
i1l10125:	
=======
	goto	u358_21
	goto	u358_20
u358_21:
	goto	i1l10288
u358_20:
	line	61
	
i1l10286:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l2929
	line	63
	
i1l2926:	
	
i1l10127:	
=======
	goto	i1l2953
	line	63
	
i1l2950:	
	
i1l10288:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;infrared.c: 63: else if (adcVal >= 43 && adcVal < 56)
	movlw	high(02Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_adcVal+1),w	;volatile
	movlw	low(02Bh)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipc
<<<<<<< HEAD
	goto	u355_21
	goto	u355_20
u355_21:
	goto	i1l2929
u355_20:
	
i1l10129:	
=======
	goto	u359_21
	goto	u359_20
u359_21:
	goto	i1l2953
u359_20:
	
i1l10290:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	high(038h)
	subwf	(_adcVal+1),w	;volatile
	movlw	low(038h)
	skipnz
	subwf	(_adcVal),w	;volatile
	skipnc
<<<<<<< HEAD
	goto	u356_21
	goto	u356_20
u356_21:
	goto	i1l2929
u356_20:
	line	65
	
i1l10131:	
=======
	goto	u360_21
	goto	u360_20
u360_21:
	goto	i1l2953
u360_20:
	line	65
	
i1l10292:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	movwf	1+(_distance)	;volatile
	goto	i1l2929
	line	66
	
i1l2928:	
	goto	i1l2929
	line	67
	
i1l2927:	
	goto	i1l2929
	
i1l2925:	
	goto	i1l2929
	
i1l2923:	
	goto	i1l2929
	
i1l2921:	
	goto	i1l2929
	
i1l2919:	
	goto	i1l2929
	
i1l2917:	
	
i1l2929:	
=======
	movwf	1+(_distance)^080h	;volatile
	goto	i1l2953
	line	66
	
i1l2952:	
	goto	i1l2953
	line	67
	
i1l2951:	
	goto	i1l2953
	
i1l2949:	
	goto	i1l2953
	
i1l2947:	
	goto	i1l2953
	
i1l2945:	
	goto	i1l2953
	
i1l2943:	
	goto	i1l2953
	
i1l2941:	
	
i1l2953:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of_ADCconvert
	__end_of_ADCconvert:
;; =============== function _ADCconvert ends ============

	signat	_ADCconvert,88
	global	_ReadButtons
<<<<<<< HEAD
psect	text653,local,class=CODE,delta=2
global __ptext653
__ptext653:

;; *************** function _ReadButtons *****************
;; Defined at:
;;		line 144 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
=======
psect	text733,local,class=CODE,delta=2
global __ptext733
__ptext733:

;; *************** function _ReadButtons *****************
;; Defined at:
;;		line 141 in file "H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
psect	text653
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	144
=======
psect	text733
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	141
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	global	__size_of_ReadButtons
	__size_of_ReadButtons	equ	__end_of_ReadButtons-_ReadButtons
	
_ReadButtons:	
	opt	stack 2
; Regs used in _ReadButtons: [wreg+status,2+status,0+pclath+cstack]
	line	142
	
<<<<<<< HEAD
i1l10021:	
;HMI.c: 145: Debounce();
=======
i1l10134:	
;HMI.c: 142: Debounce();
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	fcall	_Debounce
	line	144
	
<<<<<<< HEAD
i1l10023:	
;HMI.c: 147: if(UpPressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u336_21
	goto	u336_20
u336_21:
	goto	i1l5157
u336_20:
	line	149
	
i1l10025:	
;HMI.c: 148: {
;HMI.c: 149: UpPressed = 0;
=======
i1l10136:	
;HMI.c: 144: if(UpPressed)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_UpPressed/8),(_UpPressed)&7
	goto	u338_21
	goto	u338_20
u338_21:
	goto	i1l5169
u338_20:
	line	146
	
i1l10138:	
;HMI.c: 145: {
;HMI.c: 146: UpPressed = 0;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bcf	(_UpPressed/8),(_UpPressed)&7
	line	147
	
<<<<<<< HEAD
i1l10027:	
;HMI.c: 150: return 1;
	movlw	(01h)
	goto	i1l5158
	
i1l10029:	
	goto	i1l5158
	line	152
	
i1l5157:	
	line	154
;HMI.c: 152: }
;HMI.c: 154: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u337_21
	goto	u337_20
u337_21:
	goto	i1l5159
u337_20:
	line	156
	
i1l10031:	
;HMI.c: 155: {
;HMI.c: 156: DownPressed = 0;
=======
i1l10140:	
;HMI.c: 147: return 1;
	movlw	(01h)
	goto	i1l5170
	
i1l10142:	
	goto	i1l5170
	line	149
	
i1l5169:	
	line	151
;HMI.c: 149: }
;HMI.c: 151: if(DownPressed)
	btfss	(_DownPressed/8),(_DownPressed)&7
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l5171
u339_20:
	line	153
	
i1l10144:	
;HMI.c: 152: {
;HMI.c: 153: DownPressed = 0;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bcf	(_DownPressed/8),(_DownPressed)&7
	line	154
	
<<<<<<< HEAD
i1l10033:	
;HMI.c: 157: return 2;
	movlw	(02h)
	goto	i1l5158
	
i1l10035:	
	goto	i1l5158
	line	159
	
i1l5159:	
	line	160
;HMI.c: 159: }
;HMI.c: 160: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u338_21
	goto	u338_20
u338_21:
	goto	i1l5160
u338_20:
	line	162
	
i1l10037:	
;HMI.c: 161: {
;HMI.c: 162: LeftPressed = 0;
=======
i1l10146:	
;HMI.c: 154: return 2;
	movlw	(02h)
	goto	i1l5170
	
i1l10148:	
	goto	i1l5170
	line	156
	
i1l5171:	
	line	157
;HMI.c: 156: }
;HMI.c: 157: if(LeftPressed)
	btfss	(_LeftPressed/8),(_LeftPressed)&7
	goto	u340_21
	goto	u340_20
u340_21:
	goto	i1l5172
u340_20:
	line	159
	
i1l10150:	
;HMI.c: 158: {
;HMI.c: 159: LeftPressed = 0;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bcf	(_LeftPressed/8),(_LeftPressed)&7
	line	160
	
<<<<<<< HEAD
i1l10039:	
;HMI.c: 163: return 3;
	movlw	(03h)
	goto	i1l5158
	
i1l10041:	
	goto	i1l5158
	line	165
	
i1l5160:	
	line	166
;HMI.c: 165: }
;HMI.c: 166: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u339_21
	goto	u339_20
u339_21:
	goto	i1l5161
u339_20:
	line	168
	
i1l10043:	
;HMI.c: 167: {
;HMI.c: 168: RightPressed = 0;
=======
i1l10152:	
;HMI.c: 160: return 3;
	movlw	(03h)
	goto	i1l5170
	
i1l10154:	
	goto	i1l5170
	line	162
	
i1l5172:	
	line	163
;HMI.c: 162: }
;HMI.c: 163: if(RightPressed)
	btfss	(_RightPressed/8),(_RightPressed)&7
	goto	u341_21
	goto	u341_20
u341_21:
	goto	i1l5173
u341_20:
	line	165
	
i1l10156:	
;HMI.c: 164: {
;HMI.c: 165: RightPressed = 0;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bcf	(_RightPressed/8),(_RightPressed)&7
	line	166
	
<<<<<<< HEAD
i1l10045:	
;HMI.c: 169: return 4;
	movlw	(04h)
	goto	i1l5158
	
i1l10047:	
	goto	i1l5158
	line	171
	
i1l5161:	
	line	173
;HMI.c: 171: }
;HMI.c: 173: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u340_21
	goto	u340_20
u340_21:
	goto	i1l10055
u340_20:
	line	175
	
i1l10049:	
;HMI.c: 174: {
;HMI.c: 175: CenterPressed = 0;
=======
i1l10158:	
;HMI.c: 166: return 4;
	movlw	(04h)
	goto	i1l5170
	
i1l10160:	
	goto	i1l5170
	line	168
	
i1l5173:	
	line	170
;HMI.c: 168: }
;HMI.c: 170: if(CenterPressed)
	btfss	(_CenterPressed/8),(_CenterPressed)&7
	goto	u342_21
	goto	u342_20
u342_21:
	goto	i1l10168
u342_20:
	line	172
	
i1l10162:	
;HMI.c: 171: {
;HMI.c: 172: CenterPressed = 0;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bcf	(_CenterPressed/8),(_CenterPressed)&7
	line	173
	
<<<<<<< HEAD
i1l10051:	
;HMI.c: 176: return 5;
	movlw	(05h)
	goto	i1l5158
	
i1l10053:	
	goto	i1l5158
	line	178
	
i1l5162:	
	line	179
	
i1l10055:	
;HMI.c: 178: }
;HMI.c: 179: return 0;
	movlw	(0)
	goto	i1l5158
	
i1l10057:	
	line	180
	
i1l5158:	
=======
i1l10164:	
;HMI.c: 173: return 5;
	movlw	(05h)
	goto	i1l5170
	
i1l10166:	
	goto	i1l5170
	line	175
	
i1l5174:	
	line	176
	
i1l10168:	
;HMI.c: 175: }
;HMI.c: 176: return 0;
	movlw	(0)
	goto	i1l5170
	
i1l10170:	
	line	177
	
i1l5170:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of_ReadButtons
	__end_of_ReadButtons:
;; =============== function _ReadButtons ends ============

	signat	_ReadButtons,89
	global	_lcd_write_data
<<<<<<< HEAD
psect	text654,local,class=CODE,delta=2
global __ptext654
__ptext654:
=======
psect	text734,local,class=CODE,delta=2
global __ptext734
__ptext734:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

;; *************** function _lcd_write_data *****************
;; Defined at:
;;		line 30 in file "H:\Aldnoah.Zero\trunk\Assignment3\lcd.c"
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
<<<<<<< HEAD
psect	text654
	file	"E:\Aldnoah.Zero\Assignment3\lcd.c"
=======
psect	text734
	file	"H:\Aldnoah.Zero\trunk\Assignment3\lcd.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	30
	global	__size_of_lcd_write_data
	__size_of_lcd_write_data	equ	__end_of_lcd_write_data-_lcd_write_data
	
_lcd_write_data:	
	opt	stack 1
; Regs used in _lcd_write_data: [wreg]
;lcd_write_data@databyte stored from wreg
	movwf	(lcd_write_data@databyte)
	line	31
	
<<<<<<< HEAD
i1l9879:	
=======
i1l9992:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
<<<<<<< HEAD
i1l9881:	
=======
i1l9994:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 34: PORTD = databyte;
	movf	(lcd_write_data@databyte),w
	movwf	(8)	;volatile
	line	35
	
<<<<<<< HEAD
i1l9883:	
=======
i1l9996:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 35: RE2 = 1;
	bsf	(74/8),(74)&7
	line	36
	
<<<<<<< HEAD
i1l9885:	
=======
i1l9998:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;lcd.c: 36: RE2 = 0;
	bcf	(74/8),(74)&7
	line	37
;lcd.c: 37: _delay((unsigned long)((1)*(20000000/4000.0)));
	opt asmopt_off
movlw	7
movwf	((??_lcd_write_data+0)+0+1),f
	movlw	125
movwf	((??_lcd_write_data+0)+0),f
<<<<<<< HEAD
u423_27:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u423_27
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u423_27
=======
u462_27:
	decfsz	((??_lcd_write_data+0)+0),f
	goto	u462_27
	decfsz	((??_lcd_write_data+0)+0+1),f
	goto	u462_27
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
psect	text655,local,class=CODE,delta=2
global __ptext655
__ptext655:
=======
psect	text735,local,class=CODE,delta=2
global __ptext735
__ptext735:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

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
<<<<<<< HEAD
psect	text655
=======
psect	text735
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
<<<<<<< HEAD
i1l9853:	
;adc.c: 6: switch(channel)
	goto	i1l9861
=======
i1l9966:	
;adc.c: 6: switch(channel)
	goto	i1l9974
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l9863
=======
	goto	i1l9976
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l9863
=======
	goto	i1l9976
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l9863
=======
	goto	i1l9976
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l9863
=======
	goto	i1l9976
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l9863
=======
	goto	i1l9976
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	35
;adc.c: 35: default:
	
i1l696:	
	line	36
	
<<<<<<< HEAD
i1l9855:	
=======
i1l9968:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;adc.c: 36: return 0;
	movlw	(0)
	goto	i1l697
	
<<<<<<< HEAD
i1l9857:	
	goto	i1l697
	line	37
	
i1l9859:	
;adc.c: 37: }
	goto	i1l9863
=======
i1l9970:	
	goto	i1l697
	line	37
	
i1l9972:	
;adc.c: 37: }
	goto	i1l9976
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	6
	
i1l689:	
	
<<<<<<< HEAD
i1l9861:	
=======
i1l9974:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
	goto	i1l9855
=======
	goto	i1l9968
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	opt asmopt_on

	line	37
	
i1l691:	
	line	39
	
<<<<<<< HEAD
i1l9863:	
=======
i1l9976:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;adc.c: 39: _delay((unsigned long)((50)*(20000000/4000000.0)));
	opt asmopt_off
movlw	83
movwf	(??_adc_read_channel+0)+0,f
<<<<<<< HEAD
u424_27:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u424_27
=======
u463_27:
decfsz	(??_adc_read_channel+0)+0,f
	goto	u463_27
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
opt asmopt_on

	line	41
	
<<<<<<< HEAD
i1l9865:	
=======
i1l9978:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;adc.c: 41: return adc_read();
	fcall	_adc_read
	movf	(0+(?_adc_read)),w
	goto	i1l697
	
<<<<<<< HEAD
i1l9867:	
=======
i1l9980:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	43
	
i1l697:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read_channel
	__end_of_adc_read_channel:
;; =============== function _adc_read_channel ends ============

	signat	_adc_read_channel,4217
	global	___awmod
<<<<<<< HEAD
psect	text656,local,class=CODE,delta=2
global __ptext656
__ptext656:
=======
psect	text736,local,class=CODE,delta=2
global __ptext736
__ptext736:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

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
<<<<<<< HEAD
psect	text656
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
=======
psect	text736
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\awmod.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
<<<<<<< HEAD
i1l10427:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u406_21
	goto	u406_20
u406_21:
	goto	i1l10431
u406_20:
	line	10
	
i1l10429:	
=======
i1l10592:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u415_21
	goto	u415_20
u415_21:
	goto	i1l10596
u415_20:
	line	10
	
i1l10594:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
<<<<<<< HEAD
	goto	i1l10431
	line	12
	
i1l7531:	
	line	13
	
i1l10431:	
	btfss	(___awmod@divisor+1),7
	goto	u407_21
	goto	u407_20
u407_21:
	goto	i1l10435
u407_20:
	line	14
	
i1l10433:	
=======
	goto	i1l10596
	line	12
	
i1l7568:	
	line	13
	
i1l10596:	
	btfss	(___awmod@divisor+1),7
	goto	u416_21
	goto	u416_20
u416_21:
	goto	i1l10600
u416_20:
	line	14
	
i1l10598:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
<<<<<<< HEAD
	goto	i1l10435
	
i1l7532:	
	line	15
	
i1l10435:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u408_21
	goto	u408_20
u408_21:
	goto	i1l10453
u408_20:
	line	16
	
i1l10437:	
=======
	goto	i1l10600
	
i1l7569:	
	line	15
	
i1l10600:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u417_21
	goto	u417_20
u417_21:
	goto	i1l10618
u417_20:
	line	16
	
i1l10602:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
<<<<<<< HEAD
	goto	i1l10443
	
i1l7535:	
	line	18
	
i1l10439:	
	movlw	01h
	
u409_25:
=======
	goto	i1l10608
	
i1l7572:	
	line	18
	
i1l10604:	
	movlw	01h
	
u418_25:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
<<<<<<< HEAD
	goto	u409_25
	line	19
	
i1l10441:	
=======
	goto	u418_25
	line	19
	
i1l10606:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
<<<<<<< HEAD
	goto	i1l10443
	line	20
	
i1l7534:	
	line	17
	
i1l10443:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u410_21
	goto	u410_20
u410_21:
	goto	i1l10439
u410_20:
	goto	i1l10445
	
i1l7536:	
	goto	i1l10445
	line	21
	
i1l7537:	
	line	22
	
i1l10445:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u411_25
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u411_25:
	skipc
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l10449
u411_20:
	line	23
	
i1l10447:	
=======
	goto	i1l10608
	line	20
	
i1l7571:	
	line	17
	
i1l10608:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u419_21
	goto	u419_20
u419_21:
	goto	i1l10604
u419_20:
	goto	i1l10610
	
i1l7573:	
	goto	i1l10610
	line	21
	
i1l7574:	
	line	22
	
i1l10610:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u420_25
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u420_25:
	skipc
	goto	u420_21
	goto	u420_20
u420_21:
	goto	i1l10614
u420_20:
	line	23
	
i1l10612:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
<<<<<<< HEAD
	goto	i1l10449
	
i1l7538:	
	line	24
	
i1l10449:	
	movlw	01h
	
u412_25:
=======
	goto	i1l10614
	
i1l7575:	
	line	24
	
i1l10614:	
	movlw	01h
	
u421_25:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
<<<<<<< HEAD
	goto	u412_25
	line	25
	
i1l10451:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u413_21
	goto	u413_20
u413_21:
	goto	i1l10445
u413_20:
	goto	i1l10453
	
i1l7539:	
	goto	i1l10453
	line	26
	
i1l7533:	
	line	27
	
i1l10453:	
	movf	(___awmod@sign),w
	skipz
	goto	u414_20
	goto	i1l10457
u414_20:
	line	28
	
i1l10455:	
=======
	goto	u421_25
	line	25
	
i1l10616:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u422_21
	goto	u422_20
u422_21:
	goto	i1l10610
u422_20:
	goto	i1l10618
	
i1l7576:	
	goto	i1l10618
	line	26
	
i1l7570:	
	line	27
	
i1l10618:	
	movf	(___awmod@sign),w
	skipz
	goto	u423_20
	goto	i1l10622
u423_20:
	line	28
	
i1l10620:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
<<<<<<< HEAD
	goto	i1l10457
	
i1l7540:	
	line	29
	
i1l10457:	
=======
	goto	i1l10622
	
i1l7577:	
	line	29
	
i1l10622:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

<<<<<<< HEAD
	goto	i1l7541
	
i1l10459:	
	line	30
	
i1l7541:	
=======
	goto	i1l7578
	
i1l10624:	
	line	30
	
i1l7578:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___lwmod
<<<<<<< HEAD
psect	text657,local,class=CODE,delta=2
global __ptext657
__ptext657:
=======
psect	text737,local,class=CODE,delta=2
global __ptext737
__ptext737:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

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
<<<<<<< HEAD
psect	text657
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwmod.c"
=======
psect	text737
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 1
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
<<<<<<< HEAD
i1l10405:	
=======
i1l10570:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
<<<<<<< HEAD
	goto	u400_21
	goto	u400_20
u400_21:
	goto	i1l10423
u400_20:
	line	9
	
i1l10407:	
=======
	goto	u409_21
	goto	u409_20
u409_21:
	goto	i1l10588
u409_20:
	line	9
	
i1l10572:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
<<<<<<< HEAD
	goto	i1l10413
	
i1l7341:	
	line	11
	
i1l10409:	
	movlw	01h
	
u401_25:
=======
	goto	i1l10578
	
i1l7378:	
	line	11
	
i1l10574:	
	movlw	01h
	
u410_25:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
<<<<<<< HEAD
	goto	u401_25
	line	12
	
i1l10411:	
=======
	goto	u410_25
	line	12
	
i1l10576:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
<<<<<<< HEAD
	goto	i1l10413
	line	13
	
i1l7340:	
	line	10
	
i1l10413:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u402_21
	goto	u402_20
u402_21:
	goto	i1l10409
u402_20:
	goto	i1l10415
	
i1l7342:	
	goto	i1l10415
	line	14
	
i1l7343:	
	line	15
	
i1l10415:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u403_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u403_25:
	skipc
	goto	u403_21
	goto	u403_20
u403_21:
	goto	i1l10419
u403_20:
	line	16
	
i1l10417:	
=======
	goto	i1l10578
	line	13
	
i1l7377:	
	line	10
	
i1l10578:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u411_21
	goto	u411_20
u411_21:
	goto	i1l10574
u411_20:
	goto	i1l10580
	
i1l7379:	
	goto	i1l10580
	line	14
	
i1l7380:	
	line	15
	
i1l10580:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u412_25
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u412_25:
	skipc
	goto	u412_21
	goto	u412_20
u412_21:
	goto	i1l10584
u412_20:
	line	16
	
i1l10582:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
<<<<<<< HEAD
	goto	i1l10419
	
i1l7344:	
	line	17
	
i1l10419:	
	movlw	01h
	
u404_25:
=======
	goto	i1l10584
	
i1l7381:	
	line	17
	
i1l10584:	
	movlw	01h
	
u413_25:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
<<<<<<< HEAD
	goto	u404_25
	line	18
	
i1l10421:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u405_21
	goto	u405_20
u405_21:
	goto	i1l10415
u405_20:
	goto	i1l10423
	
i1l7345:	
	goto	i1l10423
	line	19
	
i1l7339:	
	line	20
	
i1l10423:	
=======
	goto	u413_25
	line	18
	
i1l10586:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u414_21
	goto	u414_20
u414_21:
	goto	i1l10580
u414_20:
	goto	i1l10588
	
i1l7382:	
	goto	i1l10588
	line	19
	
i1l7376:	
	line	20
	
i1l10588:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

<<<<<<< HEAD
	goto	i1l7346
	
i1l10425:	
	line	21
	
i1l7346:	
=======
	goto	i1l7383
	
i1l10590:	
	line	21
	
i1l7383:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
<<<<<<< HEAD
psect	text658,local,class=CODE,delta=2
global __ptext658
__ptext658:
=======
psect	text738,local,class=CODE,delta=2
global __ptext738
__ptext738:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

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
<<<<<<< HEAD
psect	text658
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
=======
psect	text738
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 1
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
<<<<<<< HEAD
i1l10379:	
=======
i1l10544:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
<<<<<<< HEAD
i1l10381:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u393_21
	goto	u393_20
u393_21:
	goto	i1l10401
u393_20:
	line	11
	
i1l10383:	
=======
i1l10546:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u402_21
	goto	u402_20
u402_21:
	goto	i1l10566
u402_20:
	line	11
	
i1l10548:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
<<<<<<< HEAD
	goto	i1l10389
	
i1l7331:	
	line	13
	
i1l10385:	
	movlw	01h
	
u394_25:
=======
	goto	i1l10554
	
i1l7368:	
	line	13
	
i1l10550:	
	movlw	01h
	
u403_25:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
<<<<<<< HEAD
	goto	u394_25
	line	14
	
i1l10387:	
=======
	goto	u403_25
	line	14
	
i1l10552:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
<<<<<<< HEAD
	goto	i1l10389
	line	15
	
i1l7330:	
	line	12
	
i1l10389:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u395_21
	goto	u395_20
u395_21:
	goto	i1l10385
u395_20:
	goto	i1l10391
	
i1l7332:	
	goto	i1l10391
	line	16
	
i1l7333:	
	line	17
	
i1l10391:	
	movlw	01h
	
u396_25:
=======
	goto	i1l10554
	line	15
	
i1l7367:	
	line	12
	
i1l10554:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u404_21
	goto	u404_20
u404_21:
	goto	i1l10550
u404_20:
	goto	i1l10556
	
i1l7369:	
	goto	i1l10556
	line	16
	
i1l7370:	
	line	17
	
i1l10556:	
	movlw	01h
	
u405_25:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
<<<<<<< HEAD
	goto	u396_25
=======
	goto	u405_25
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
<<<<<<< HEAD
	goto	u397_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u397_25:
	skipc
	goto	u397_21
	goto	u397_20
u397_21:
	goto	i1l10397
u397_20:
	line	19
	
i1l10393:	
=======
	goto	u406_25
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u406_25:
	skipc
	goto	u406_21
	goto	u406_20
u406_21:
	goto	i1l10562
u406_20:
	line	19
	
i1l10558:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
<<<<<<< HEAD
i1l10395:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l10397
	line	21
	
i1l7334:	
	line	22
	
i1l10397:	
	movlw	01h
	
u398_25:
=======
i1l10560:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	i1l10562
	line	21
	
i1l7371:	
	line	22
	
i1l10562:	
	movlw	01h
	
u407_25:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
<<<<<<< HEAD
	goto	u398_25
	line	23
	
i1l10399:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u399_21
	goto	u399_20
u399_21:
	goto	i1l10391
u399_20:
	goto	i1l10401
	
i1l7335:	
	goto	i1l10401
	line	24
	
i1l7329:	
	line	25
	
i1l10401:	
=======
	goto	u407_25
	line	23
	
i1l10564:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u408_21
	goto	u408_20
u408_21:
	goto	i1l10556
u408_20:
	goto	i1l10566
	
i1l7372:	
	goto	i1l10566
	line	24
	
i1l7366:	
	line	25
	
i1l10566:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

<<<<<<< HEAD
	goto	i1l7336
	
i1l10403:	
	line	26
	
i1l7336:	
=======
	goto	i1l7373
	
i1l10568:	
	line	26
	
i1l7373:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
<<<<<<< HEAD
psect	text659,local,class=CODE,delta=2
global __ptext659
__ptext659:
=======
psect	text739,local,class=CODE,delta=2
global __ptext739
__ptext739:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

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
<<<<<<< HEAD
psect	text659
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\wmul.c"
=======
psect	text739
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 1
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
<<<<<<< HEAD
i1l10367:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	i1l10369
	line	6
	
i1l7323:	
	line	7
	
i1l10369:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u389_21
	goto	u389_20
u389_21:
	goto	i1l7324
u389_20:
	line	8
	
i1l10371:	
=======
i1l10532:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	i1l10534
	line	6
	
i1l7360:	
	line	7
	
i1l10534:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u398_21
	goto	u398_20
u398_21:
	goto	i1l7361
u398_20:
	line	8
	
i1l10536:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
<<<<<<< HEAD
i1l7324:	
	line	9
	movlw	01h
	
u390_25:
=======
i1l7361:	
	line	9
	movlw	01h
	
u399_25:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
<<<<<<< HEAD
	goto	u390_25
	line	10
	
i1l10373:	
	movlw	01h
	
u391_25:
=======
	goto	u399_25
	line	10
	
i1l10538:	
	movlw	01h
	
u400_25:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
<<<<<<< HEAD
	goto	u391_25
=======
	goto	u400_25
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
<<<<<<< HEAD
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l10369
u392_20:
	goto	i1l10375
	
i1l7325:	
	line	12
	
i1l10375:	
=======
	goto	u401_21
	goto	u401_20
u401_21:
	goto	i1l10534
u401_20:
	goto	i1l10540
	
i1l7362:	
	line	12
	
i1l10540:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

<<<<<<< HEAD
	goto	i1l7326
	
i1l10377:	
	line	13
	
i1l7326:	
=======
	goto	i1l7363
	
i1l10542:	
	line	13
	
i1l7363:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_Debounce
<<<<<<< HEAD
psect	text660,local,class=CODE,delta=2
global __ptext660
__ptext660:

;; *************** function _Debounce *****************
;; Defined at:
;;		line 64 in file "E:\Aldnoah.Zero\Assignment3\HMI.c"
=======
psect	text740,local,class=CODE,delta=2
global __ptext740
__ptext740:

;; *************** function _Debounce *****************
;; Defined at:
;;		line 61 in file "H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
<<<<<<< HEAD
psect	text660
	file	"E:\Aldnoah.Zero\Assignment3\HMI.c"
	line	64
=======
psect	text740
	file	"H:\Aldnoah.Zero\trunk\Assignment3\HMI.c"
	line	61
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	global	__size_of_Debounce
	__size_of_Debounce	equ	__end_of_Debounce-_Debounce
	
_Debounce:	
	opt	stack 2
; Regs used in _Debounce: [wreg+status,2+status,0]
	line	63
	
<<<<<<< HEAD
i1l10233:	
;HMI.c: 66: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u366_21
	goto	u366_20
u366_21:
	goto	i1l5139
u366_20:
	line	68
	
i1l10235:	
;HMI.c: 67: {
;HMI.c: 68: UpDebounceCount++;
=======
i1l10418:	
;HMI.c: 63: if(!RB2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(50/8),(50)&7
	goto	u373_21
	goto	u373_20
u373_21:
	goto	i1l5151
u373_20:
	line	65
	
i1l10420:	
;HMI.c: 64: {
;HMI.c: 65: UpDebounceCount++;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_UpDebounceCount),f	;volatile
	line	66
	
<<<<<<< HEAD
i1l10237:	
;HMI.c: 69: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount),w	;volatile
	skipc
	goto	u367_21
	goto	u367_20
u367_21:
	goto	i1l5141
u367_20:
	
i1l10239:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u368_21
	goto	u368_20
u368_21:
	goto	i1l5141
u368_20:
	line	71
	
i1l10241:	
;HMI.c: 70: {
;HMI.c: 71: UpPressed = 1;
=======
i1l10422:	
;HMI.c: 66: if(UpDebounceCount >= 10 & UpReleased)
	movlw	(0Ah)
	subwf	(_UpDebounceCount),w	;volatile
	skipc
	goto	u374_21
	goto	u374_20
u374_21:
	goto	i1l5153
u374_20:
	
i1l10424:	
	btfss	(_UpReleased/8),(_UpReleased)&7
	goto	u375_21
	goto	u375_20
u375_21:
	goto	i1l5153
u375_20:
	line	68
	
i1l10426:	
;HMI.c: 67: {
;HMI.c: 68: UpPressed = 1;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bsf	(_UpPressed/8),(_UpPressed)&7
	line	69
;HMI.c: 69: UpReleased = 0;
	bcf	(_UpReleased/8),(_UpReleased)&7
<<<<<<< HEAD
	goto	i1l5141
	line	73
	
i1l5140:	
	line	74
;HMI.c: 73: }
;HMI.c: 74: }
	goto	i1l5141
	line	75
	
i1l5139:	
	line	77
;HMI.c: 75: else
;HMI.c: 76: {
;HMI.c: 77: UpDebounceCount = 0;
=======
	goto	i1l5153
	line	70
	
i1l5152:	
	line	71
;HMI.c: 70: }
;HMI.c: 71: }
	goto	i1l5153
	line	72
	
i1l5151:	
	line	74
;HMI.c: 72: else
;HMI.c: 73: {
;HMI.c: 74: UpDebounceCount = 0;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrf	(_UpDebounceCount)	;volatile
	line	75
;HMI.c: 75: UpReleased = 1;
	bsf	(_UpReleased/8),(_UpReleased)&7
	line	76
	
<<<<<<< HEAD
i1l5141:	
	line	82
;HMI.c: 79: }
;HMI.c: 82: if(!RB3)
	btfsc	(51/8),(51)&7
	goto	u369_21
	goto	u369_20
u369_21:
	goto	i1l5142
u369_20:
	line	84
	
i1l10243:	
;HMI.c: 83: {
;HMI.c: 84: DownDebounceCount++;
=======
i1l5153:	
	line	79
;HMI.c: 76: }
;HMI.c: 79: if(!RB3)
	btfsc	(51/8),(51)&7
	goto	u376_21
	goto	u376_20
u376_21:
	goto	i1l5154
u376_20:
	line	81
	
i1l10428:	
;HMI.c: 80: {
;HMI.c: 81: DownDebounceCount++;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_DownDebounceCount),f	;volatile
	line	82
	
<<<<<<< HEAD
i1l10245:	
;HMI.c: 85: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount),w	;volatile
	skipc
	goto	u370_21
	goto	u370_20
u370_21:
	goto	i1l5144
u370_20:
	
i1l10247:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u371_21
	goto	u371_20
u371_21:
	goto	i1l5144
u371_20:
	line	87
	
i1l10249:	
;HMI.c: 86: {
;HMI.c: 87: DownPressed = 1;
=======
i1l10430:	
;HMI.c: 82: if(DownDebounceCount >= 10 & DownReleased)
	movlw	(0Ah)
	subwf	(_DownDebounceCount),w	;volatile
	skipc
	goto	u377_21
	goto	u377_20
u377_21:
	goto	i1l5156
u377_20:
	
i1l10432:	
	btfss	(_DownReleased/8),(_DownReleased)&7
	goto	u378_21
	goto	u378_20
u378_21:
	goto	i1l5156
u378_20:
	line	84
	
i1l10434:	
;HMI.c: 83: {
;HMI.c: 84: DownPressed = 1;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bsf	(_DownPressed/8),(_DownPressed)&7
	line	85
;HMI.c: 85: DownReleased = 0;
	bcf	(_DownReleased/8),(_DownReleased)&7
<<<<<<< HEAD
	goto	i1l5144
	line	89
	
i1l5143:	
	line	90
;HMI.c: 89: }
;HMI.c: 90: }
	goto	i1l5144
	line	91
	
i1l5142:	
	line	93
;HMI.c: 91: else
;HMI.c: 92: {
;HMI.c: 93: DownDebounceCount = 0;
=======
	goto	i1l5156
	line	86
	
i1l5155:	
	line	87
;HMI.c: 86: }
;HMI.c: 87: }
	goto	i1l5156
	line	88
	
i1l5154:	
	line	90
;HMI.c: 88: else
;HMI.c: 89: {
;HMI.c: 90: DownDebounceCount = 0;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrf	(_DownDebounceCount)	;volatile
	line	91
;HMI.c: 91: DownReleased = 1;
	bsf	(_DownReleased/8),(_DownReleased)&7
	line	92
	
<<<<<<< HEAD
i1l5144:	
	line	97
;HMI.c: 95: }
;HMI.c: 97: if(!RB4)
	btfsc	(52/8),(52)&7
	goto	u372_21
	goto	u372_20
u372_21:
	goto	i1l5145
u372_20:
	line	99
	
i1l10251:	
;HMI.c: 98: {
;HMI.c: 99: LeftDebounceCount++;
=======
i1l5156:	
	line	94
;HMI.c: 92: }
;HMI.c: 94: if(!RB4)
	btfsc	(52/8),(52)&7
	goto	u379_21
	goto	u379_20
u379_21:
	goto	i1l5157
u379_20:
	line	96
	
i1l10436:	
;HMI.c: 95: {
;HMI.c: 96: LeftDebounceCount++;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_LeftDebounceCount),f	;volatile
	line	97
	
<<<<<<< HEAD
i1l10253:	
;HMI.c: 100: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount),w	;volatile
	skipc
	goto	u373_21
	goto	u373_20
u373_21:
	goto	i1l5147
u373_20:
	
i1l10255:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u374_21
	goto	u374_20
u374_21:
	goto	i1l5147
u374_20:
	line	102
	
i1l10257:	
;HMI.c: 101: {
;HMI.c: 102: LeftPressed = 1;
=======
i1l10438:	
;HMI.c: 97: if(LeftDebounceCount >= 10 & LeftReleased)
	movlw	(0Ah)
	subwf	(_LeftDebounceCount),w	;volatile
	skipc
	goto	u380_21
	goto	u380_20
u380_21:
	goto	i1l5159
u380_20:
	
i1l10440:	
	btfss	(_LeftReleased/8),(_LeftReleased)&7
	goto	u381_21
	goto	u381_20
u381_21:
	goto	i1l5159
u381_20:
	line	99
	
i1l10442:	
;HMI.c: 98: {
;HMI.c: 99: LeftPressed = 1;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bsf	(_LeftPressed/8),(_LeftPressed)&7
	line	100
;HMI.c: 100: LeftReleased = 0;
	bcf	(_LeftReleased/8),(_LeftReleased)&7
<<<<<<< HEAD
	goto	i1l5147
	line	104
	
i1l5146:	
	line	105
;HMI.c: 104: }
;HMI.c: 105: }
	goto	i1l5147
	line	106
	
i1l5145:	
	line	108
;HMI.c: 106: else
;HMI.c: 107: {
;HMI.c: 108: LeftDebounceCount = 0;
=======
	goto	i1l5159
	line	101
	
i1l5158:	
	line	102
;HMI.c: 101: }
;HMI.c: 102: }
	goto	i1l5159
	line	103
	
i1l5157:	
	line	105
;HMI.c: 103: else
;HMI.c: 104: {
;HMI.c: 105: LeftDebounceCount = 0;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrf	(_LeftDebounceCount)	;volatile
	line	106
;HMI.c: 106: LeftReleased = 1;
	bsf	(_LeftReleased/8),(_LeftReleased)&7
	line	107
	
<<<<<<< HEAD
i1l5147:	
	line	112
;HMI.c: 110: }
;HMI.c: 112: if(!RB5)
	btfsc	(53/8),(53)&7
	goto	u375_21
	goto	u375_20
u375_21:
	goto	i1l5148
u375_20:
	line	114
	
i1l10259:	
;HMI.c: 113: {
;HMI.c: 114: RightDebounceCount++;
=======
i1l5159:	
	line	109
;HMI.c: 107: }
;HMI.c: 109: if(!RB5)
	btfsc	(53/8),(53)&7
	goto	u382_21
	goto	u382_20
u382_21:
	goto	i1l5160
u382_20:
	line	111
	
i1l10444:	
;HMI.c: 110: {
;HMI.c: 111: RightDebounceCount++;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_RightDebounceCount),f	;volatile
	line	112
	
<<<<<<< HEAD
i1l10261:	
;HMI.c: 115: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount),w	;volatile
	skipc
	goto	u376_21
	goto	u376_20
u376_21:
	goto	i1l5150
u376_20:
	
i1l10263:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u377_21
	goto	u377_20
u377_21:
	goto	i1l5150
u377_20:
	line	117
	
i1l10265:	
;HMI.c: 116: {
;HMI.c: 117: RightPressed = 1;
=======
i1l10446:	
;HMI.c: 112: if(RightDebounceCount >= 10 & RightReleased)
	movlw	(0Ah)
	subwf	(_RightDebounceCount),w	;volatile
	skipc
	goto	u383_21
	goto	u383_20
u383_21:
	goto	i1l5162
u383_20:
	
i1l10448:	
	btfss	(_RightReleased/8),(_RightReleased)&7
	goto	u384_21
	goto	u384_20
u384_21:
	goto	i1l5162
u384_20:
	line	114
	
i1l10450:	
;HMI.c: 113: {
;HMI.c: 114: RightPressed = 1;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bsf	(_RightPressed/8),(_RightPressed)&7
	line	115
;HMI.c: 115: RightReleased = 0;
	bcf	(_RightReleased/8),(_RightReleased)&7
<<<<<<< HEAD
	goto	i1l5150
	line	119
	
i1l5149:	
	line	120
;HMI.c: 119: }
;HMI.c: 120: }
	goto	i1l5150
	line	121
	
i1l5148:	
	line	123
;HMI.c: 121: else
;HMI.c: 122: {
;HMI.c: 123: RightDebounceCount = 0;
=======
	goto	i1l5162
	line	116
	
i1l5161:	
	line	117
;HMI.c: 116: }
;HMI.c: 117: }
	goto	i1l5162
	line	118
	
i1l5160:	
	line	120
;HMI.c: 118: else
;HMI.c: 119: {
;HMI.c: 120: RightDebounceCount = 0;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrf	(_RightDebounceCount)	;volatile
	line	121
;HMI.c: 121: RightReleased = 1;
	bsf	(_RightReleased/8),(_RightReleased)&7
	line	122
	
<<<<<<< HEAD
i1l5150:	
	line	127
;HMI.c: 125: }
;HMI.c: 127: if(!RB6)
	btfsc	(54/8),(54)&7
	goto	u378_21
	goto	u378_20
u378_21:
	goto	i1l5151
u378_20:
	line	129
	
i1l10267:	
;HMI.c: 128: {
;HMI.c: 129: CenterDebounceCount++;
=======
i1l5162:	
	line	124
;HMI.c: 122: }
;HMI.c: 124: if(!RB6)
	btfsc	(54/8),(54)&7
	goto	u385_21
	goto	u385_20
u385_21:
	goto	i1l5163
u385_20:
	line	126
	
i1l10452:	
;HMI.c: 125: {
;HMI.c: 126: CenterDebounceCount++;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	movlw	(01h)
	movwf	(??_Debounce+0)+0
	movf	(??_Debounce+0)+0,w
	addwf	(_CenterDebounceCount),f	;volatile
	line	127
	
<<<<<<< HEAD
i1l10269:	
;HMI.c: 130: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount),w	;volatile
	skipc
	goto	u379_21
	goto	u379_20
u379_21:
	goto	i1l5154
u379_20:
	
i1l10271:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u380_21
	goto	u380_20
u380_21:
	goto	i1l5154
u380_20:
	line	132
	
i1l10273:	
;HMI.c: 131: {
;HMI.c: 132: CenterPressed = 1;
=======
i1l10454:	
;HMI.c: 127: if(CenterDebounceCount >= 10 & CenterReleased)
	movlw	(0Ah)
	subwf	(_CenterDebounceCount),w	;volatile
	skipc
	goto	u386_21
	goto	u386_20
u386_21:
	goto	i1l5166
u386_20:
	
i1l10456:	
	btfss	(_CenterReleased/8),(_CenterReleased)&7
	goto	u387_21
	goto	u387_20
u387_21:
	goto	i1l5166
u387_20:
	line	129
	
i1l10458:	
;HMI.c: 128: {
;HMI.c: 129: CenterPressed = 1;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	bsf	(_CenterPressed/8),(_CenterPressed)&7
	line	130
;HMI.c: 130: CenterReleased = 0;
	bcf	(_CenterReleased/8),(_CenterReleased)&7
<<<<<<< HEAD
	goto	i1l5154
	line	134
	
i1l5152:	
	line	135
;HMI.c: 134: }
;HMI.c: 135: }
	goto	i1l5154
	line	136
	
i1l5151:	
	line	138
;HMI.c: 136: else
;HMI.c: 137: {
;HMI.c: 138: CenterDebounceCount = 0;
=======
	goto	i1l5166
	line	131
	
i1l5164:	
	line	132
;HMI.c: 131: }
;HMI.c: 132: }
	goto	i1l5166
	line	133
	
i1l5163:	
	line	135
;HMI.c: 133: else
;HMI.c: 134: {
;HMI.c: 135: CenterDebounceCount = 0;
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrf	(_CenterDebounceCount)	;volatile
	line	136
;HMI.c: 136: CenterReleased = 1;
	bsf	(_CenterReleased/8),(_CenterReleased)&7
<<<<<<< HEAD
	goto	i1l5154
	line	140
	
i1l5153:	
	line	141
	
i1l5154:	
=======
	goto	i1l5166
	line	137
	
i1l5165:	
	line	138
	
i1l5166:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	return
	opt stack 0
GLOBAL	__end_of_Debounce
	__end_of_Debounce:
;; =============== function _Debounce ends ============

	signat	_Debounce,88
	global	_adc_read
<<<<<<< HEAD
psect	text661,local,class=CODE,delta=2
global __ptext661
__ptext661:
=======
psect	text741,local,class=CODE,delta=2
global __ptext741
__ptext741:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63

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
<<<<<<< HEAD
psect	text661
=======
psect	text741
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	file	"E:\Aldnoah.Zero\Assignment3\adc.c"
	line	61
	global	__size_of_adc_read
	__size_of_adc_read	equ	__end_of_adc_read-_adc_read
	
_adc_read:	
	opt	stack 0
; Regs used in _adc_read: [wreg+status,2+status,0]
	line	64
	
<<<<<<< HEAD
i1l9869:	
=======
i1l9982:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;adc.c: 62: volatile unsigned int adc_value;
;adc.c: 64: ADRESH = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(30)	;volatile
	line	66
	
<<<<<<< HEAD
i1l9871:	
=======
i1l9984:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;adc.c: 66: GO = 1;
	bsf	(250/8),(250)&7
	line	67
;adc.c: 67: while(GO) continue;
	goto	i1l703
	
i1l704:	
	
i1l703:	
	btfsc	(250/8),(250)&7
<<<<<<< HEAD
	goto	u315_21
	goto	u315_20
u315_21:
	goto	i1l703
u315_20:
=======
	goto	u317_21
	goto	u317_20
u317_21:
	goto	i1l703
u317_20:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	
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
<<<<<<< HEAD
psect	text661
	line	73
	
i1l9873:	
=======
psect	text741
	line	73
	
i1l9986:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
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
	
<<<<<<< HEAD
u316_25:
=======
u318_25:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	clrc
	rlf	(adc_read@adc_value),f	;volatile
	rlf	(adc_read@adc_value+1),f	;volatile
	addlw	-1
	skipz
<<<<<<< HEAD
	goto	u316_25
=======
	goto	u318_25
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	75
;adc.c: 75: adc_value |= (ADRESL >> 15);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	line	78
	
<<<<<<< HEAD
i1l9875:	
=======
i1l9988:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
;adc.c: 78: return (adc_value);
	movf	(adc_read@adc_value+1),w	;volatile
	clrf	(?_adc_read+1)
	addwf	(?_adc_read+1)
	movf	(adc_read@adc_value),w	;volatile
	clrf	(?_adc_read)
	addwf	(?_adc_read)

	goto	i1l706
	
<<<<<<< HEAD
i1l9877:	
=======
i1l9990:	
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	line	79
	
i1l706:	
	return
	opt stack 0
GLOBAL	__end_of_adc_read
	__end_of_adc_read:
;; =============== function _adc_read ends ============

	signat	_adc_read,90
<<<<<<< HEAD
psect	text662,local,class=CODE,delta=2
global __ptext662
__ptext662:
=======
psect	text742,local,class=CODE,delta=2
global __ptext742
__ptext742:
>>>>>>> 665d90c2dcbd14ad0ec12d153788e0746e5c7d63
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
