;
; AssemblerApplication3.asm
;
; Created: 11/15/2018 10:22:48 AM
; Author : Melika Abdollahi
;


; Replace with your application code
start:
	ldi r16,(0<<DDD3)|(1<<DDD5)
	out DDRD,r16
	ldi r17,(1<<PD3)|(0<<PD5)
	out PORTD,r17
	nop
loop:
	in r16,PIND	
	sbrc r16,3
    rjmp trunoffled1
turnonled1:
	ldi r18,(1<<PD5)|(1<<PD3)
	out PORTD,r18
	nop
	rjmp loop
trunoffled1:
	ldi r18,(0<<PD5)|(1<<PD3)
	out PORTD,r18
	nop
    rjmp loop


