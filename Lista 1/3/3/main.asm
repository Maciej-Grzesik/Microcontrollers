;
; 3.asm
;
; Created: 06/03/2024 15:48:42
; Author : Maciej
;


.cseg
.org 0x00
rjmp initialize
.org 0x46

initialize:
	ldi r16, low(RAMEND)
	out SPL, r16
	ldi r16, high(RAMEND)
	out SPH, r16

	ldi r16, 0xff
	out portc, r16
	out ddrc, r16
	ldi r16, 0x00
	out ddrb, r16

	ldi r18, 0x00

main:
	in r20, pinb
	call delay
	in r21, pinb

	cp r20, r21
	breq checkState
	
	rjmp main
	
	checkState:
		cpi r20, 4
		breq addToCounter

		cpi r20, 64
		breq substractFromCounter
		rjmp main


	addToCounter:
		sec 
		rol r18
		out portc, r18
		rjmp main

	substractFromCounter:
		lsr r18
		out pinc, r18
		rjmp main


delay:
	ldi r16, 0xff
	loop:
		dec r16
		brne loop
	ret