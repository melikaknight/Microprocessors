;
; SOALE6.asm
;
; Created: 11/16/2018 8:30:24 AM
; Author : Melika Abdollahi
;


; Replace with your application code
.CSEG
BCDTo_7Seg: .db 0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67 
      rjmp  Start
start:
	ldi r17,(1<<DDB0)|(1<<DDB1)|(1<<DDB2)|(1<<DDB3)|(1<<DDB4)|(1<<DDB5)|(1<<DDB6)
	out DDRB,r17
	ldi r18,(0<<PB0)|(0<<PB1)|(0<<PB2)|(0<<PB3)|(0<<PB4)|(0<<PB5)|(0<<PB6)
	out PORTB,r18
	ldi r19,0
	ldi r20,10
    rjmp readfromeeprom
readfromeeprom:
	ldi r19,0
	ldi r21,0
	ldi r22,0
	
	loop:	
		sbic EECR,EEWE
		rjmp loop
		ldi ZH,high(BCDTo_7Seg)
		ldi ZL,low(BCDTo_7Seg)
		out EEARH,r22
		out EEARL,r21
		sbi	EECR,EERE
		in r16,EEDR
		rjmp find 
		back :out PORTB,r24
		rjmp delay2sec
		continue :inc r21
		inc r19
		cp r19,r18
		brne loop
		rjmp readfromeeprom
find:
	ldi r25,0x00
	label :
		lpm r24,z+
		cp r25,r16
		breq back
		inc r25
		rjmp label

delay2sec:
	ldi r21,16
del1:
	ldi r22,125
del2:
	ldi r23,250
del3:
	dec r23
	nop
	brne del3
	
	dec r22
	brne del2
	
	dec r21
	brne del1
	rjmp continue