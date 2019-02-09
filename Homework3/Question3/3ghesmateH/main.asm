;
; Question4.asm
;
; Created: 11/15/2018 3:41:47 PM
; Author : Melika Abdollahi
;


; Replace with your application code
start:
    ldi r16,(0<<DDD3)|(0<<DDD6)|(1<<DDD5)
	out DDRD,r16
	ldi r17,(1<<PD3)|(1<<PD6)|(0<<PD5)
	out PORTD,r17
	ldi r18,0b00001111
	out WDTCR,r18
	nop
	loop:
		in r18,PIND
		sbrs r18,3 //nazade dokme ro
		rjmp turnon
	next:
		in r18,PIND
		sbrs r18,6
		wdr
		rjmp loop
	turn on:
		ldi r19,(1<<PD5)
		out PORTD,r19
		nop
    rjmp next