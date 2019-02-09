;
; Question3ghesmate5.asm
;
; Created: 11/15/2018 1:07:50 PM
; Author : Melika Abdollahi
;


; Replace with your application code
start:
    //set kardane maghadire watchdog timer
	ldi r16,0b00001111
	out WDTCR 
    rjmp start
