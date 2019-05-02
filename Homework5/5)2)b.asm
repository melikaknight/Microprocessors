;
; HW52basm
;
; Created: 12/2/2018 7:55:01 PM
; Author : Nasrin Ataei
;


; Replace with your application code
.include"M16DEF.INC"
.org 0x00
rjmp main

main:

	ldi r18,high(RAMEND)
	out SPH,r18
	ldi r18,low(RAMEND)
	out SPL,r18
	
	sbi DDRB,3

	sbi PORTD,7
	sbi PORTD,6

	ldi r16,0XFF
	out OCR0,r16
	
	ldi r18,(1<<CS00)|(0<<CS02)|(0<<WGM01)|(1<<WGM00)|(1<<COM01)|(0<<COM00)
	out TCCR0,r18

	sei
here:
	in r16,PIND
	com r16
	andi r16,0b11000000
	cpi r16,0b10000000
	brne L2
	ldi r17,0x7F
	out OCR0,r17
	rjmp here
L2:
	cpi r16,0b01000000
	brne here
	ldi r17,0xFF
	out OCR0,r17
	rjmp here
