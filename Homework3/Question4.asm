;
; SOALE4.asm
;
; Created: 11/15/2018 5:28:27 PM
; Author : Melika Abdollahi
;


; Replace with your application code
start:
	cli 
	ldi r16,0
	ldi r17,0x00
	ldi r18,0x00
	ldi r20,10
	EEPROM_WRITE:
	sbic EECR,EEWE
	rjmp EEPROM_WRITE
	out EEARL,r17
	out EEARH,r18
	out EEDR,r16
	sbi EECR,EEMWE
	sbi EECR,EEWE
    inc r16
	inc r17
	cp r16,r20
	brne EEPROM_WRITE
	.EXIT
    rjmp start
