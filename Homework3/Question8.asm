;
; SOALE8.asm
;
; Created: 11/16/2018 8:47:57 AM
; Author : Melika Abdollahi
;


; Replace with your application code
//note: if you want to test part a and b please uncomment rjmp fucntion and if you want to test
//part c please uncomment rjmp jim
start:
	ldi R16,0x80 
	st	Z,R16
	ldi R16,0x80
	out 0x25,R16
    ;rjmp function
    rjmp jim

function:
	in R16,0x25 ;I used R16 because we can't use R0
	swap R16;SWAP 
	cbr R16,0x03; CLEAR BIT 3
	bst R16,0x05; STORE BIT 5 IN T SO THAT YOU CAN TEST IT
	brts ifone
	brtc ifzero
	rjmp start
ifone:
	std Z+0x10,R16
	rjmp start
ifzero:
	asr R16
	ldi R17,5
	mul R16,R17
	push R0
	push R1
	rjmp start
jim:
	ldi R18,low(RAMEND) //initial value of SP is inn R18 and R19
	ldi R19,high(RAMEND)
	out SPL,R18
	out SPH,R19
	in R16,0x25
	swap R16;SWAP 
	cbr R16,0x03; CLEAR BIT 3
	bst R16,0x05; STORE BIT 5 IN T SO THAT YOU CAN TEST IT
	std Z+0x10,R16
	push R16
	asr R16
	ldi R17,5
	mul R16,R17
	push R0
	push R1
	in R20,SPL // final value of SP is in R20 and R21. because the initial value of SP is 0x45F and the
//final value is 0x045C, it means that with pushing 3 values in stack, the value of SP has been decreased 3 times.
	in R21,SPH
	rjmp start
