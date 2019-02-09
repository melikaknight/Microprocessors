;
; Soake5.asm
;
; Created: 11/16/2018 8:04:22 AM
; Author : Melika Abdollahi
;
.CSEG
BCDTo7_Seg: .DB 0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67
; Replace with your application code
start:
    ldi r17,(1<<DDB0)|(1<<DDB1)|(1<<DDB2)|(1<<DDB3)|(1<<DDB4)|(1<<DDB5)|(1<<DDB6)
	out DDRB,r17
	ldi r18,(0<<PB0)|(0<<PB1)|(0<<PB2)|(0<<PB3)|(0<<PB4)|(0<<PB5)|(0<<PB6)
	out PORTB,r18
    rjmp start
