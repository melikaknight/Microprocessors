;
; MAIN9.asm
;
; 
; Author : Melika Abdollahi
;
.CSEG
RJMP start

; Replace with your application code
start:
    ;N IS IN R10,I assume N is 20 for testing
	LDI R16,20
	MOV R10,R16
	RJMP FUNC
FUNC:
	LDI R16,1
	LOOP:
	 CP R16,R10
	 BREQ END
	 INC R16
	 CP R16,R10
	 BREQ END
	 INC R16
	 CP R16,R10
	 BREQ END
	 INC R16
	 CP R16,R10
	 BREQ END
	 INC R16
	 MOV R17,R0
	 MOV R18,R1
	 MUL R16,R16
	 ADD R0,R17
	 ADC R1,R18
	 CP R16,R10
	 BREQ END
	 INC R16
	 BREQ END
	 RJMP LOOP
	 END:
		RJMP start 

