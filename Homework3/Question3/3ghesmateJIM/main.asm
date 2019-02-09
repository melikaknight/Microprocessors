;
; Question3ghesmate3.asm
;
; Created: 11/15/2018 11:37:15 AM
; Author : Melika Abdollahi
;


; Replace with your application code
start:
	ldi r16,(0<<DDD6)|(1<<DDD4)
	out DDRD,r16
	ldi r17,(1<<PD6)|(0<<PD4)
	out PORTD,r17
loop:
	ldi r18,PIND
	sbrc r18,6
	rjmp loop
trunonled2:
	ldi r20,10
	l2:
		ldi r19,(1<<PD6)
		out PORTD,r19
		nop
		rcall half_delay
		ldi r19,(0<<PD6)
		out PORTD,r19
		nop
		rcall half_delay
		dec r20
		brne l2
    rjmp loop
half_delay:
	        ldi r21,4
		delay_1:
			ldi r22,125
		delay_2:
			ldi r23,250
		delay_3:
			dec r23
			nop
			brne delay_3

			dec r22
			brne delay_2

			dec r21
			brne delay_1
			ret
