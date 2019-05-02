;
; hw51alef.asm
;
; Created: 12/2/2018 6:22:24 PM
; Author : Nasrin Ataei
;


; Replace with your application code
.include"M16DEF.INC"
.org 0x00
rjmp main
 .org 0x0012
 rjmp TOV0_SUBROUTINE
main:
	clr r20
	clr r23
	ldi r18,high(RAMEND)
	out SPH,r18
	ldi r18,low(RAMEND)
	out SPL,r18

	ldi r18,0x0F
	out DDRC,r18

	ldi r17,(1<<TOIE0)
	out TIMSK,r17             //vaghfeye timer 0 ro faal konim
	ldi r16,224
	out TCNT0,r16
	
	ldi r18,(1<<CS00)|(1<<CS02)
	out TCCR0,r18

	clr r22
	sei
here:
	rjmp here

TOV0_SUBROUTINE:
	ldi r16,224
	out TCNT0,r16
	inc r22
	inc r23
	inc r24
	in r21,PINC
	ldi r20,0x01
	and r20,r21
	brne L1
	sbi PORTC,0
	rjmp PC_1
L1:
	cbi PORTC,0
PC_1:
	cpi r22,0x02
	brne PC_2
	clr r22
	in r21,PINC
	ldi r20,0x02
	and r20,r21
	brne L2
	sbi PORTC,1
	rjmp PC_2
L2:	
	cbi PORTC,1
PC_2:	
	cpi r23,0x04
	brne PC_3
	clr r23
	in r21,PINC
	ldi r20,0x04
	and r20,r21
	brne L3
	sbi PORTC,2
	rjmp PC_3
L3:	
	cbi PORTC,2
PC_3:	
	cpi r24,0x08
	brne reti_0
	clr r24
	in r21,PINC
	ldi r20,0x08
	and r20,r21
	brne L4
	sbi PORTC,3
	rjmp reti_0
L4:	
	cbi PORTC,3

reti_0: 
	reti	 
	
	
