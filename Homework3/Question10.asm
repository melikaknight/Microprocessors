;
; SOALE10.asm
;
; Created: 11/16/2018 12:08:58 PM
; Author : Melika Abdollahi
;

.DSEG
final : .byte 11// for testing I have put 11, just replace 11 with 100 
.CSEG
initial : .db 11, 0x01, 0x67, 0x17, 0x03, 0x10, 0x05, 0x50, 0x25, 0xF0 , 0x08 , 0x12 //for testing I have put 11, just replace 11 with 100
rjmp start
; Replace with your application code
start:
    ldi ZH,high(initial)
	ldi ZL,low(initial)
	lpm r16,Z+
	ldi r18,0x00
	ldi XH,high(final)
	ldi XL,low(final)
    rjmp insertionsort
insertionsort:
	lpm r19,Z+
	rjmp FINDPLACE
	continue1: st X+,r19
	inc r18
	cp r16,r18
	brne insertionsort	
	rjmp start

find:
	ldi r17,0x00
	ldi XH,high(FINAL)
	ldi XL,low(FINAL)
	loop :
		cp r17,r18
		breq continue1
		ld r20,X+
		cp r19,r20
		brsh higher
		continue2: INC r17
		rjmp loop 
higher:
	mov r21,r19
	ld r19,-X
	st X+,r21
	rjmp continue2
