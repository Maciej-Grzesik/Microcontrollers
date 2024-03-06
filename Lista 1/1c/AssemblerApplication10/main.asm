;
; AssemblerApplication10.asm
;
; Created: 03/03/2024 09:27:35
; Author : Maciej
;


.cseg
.org 0x00
rjmp start
.org 0x46

start:
	ldi	r16, LOW(RAMEND)	; load low byte of RAMEND into r16
	out	SPL, r16			; store r16 in stack pointer low
	ldi	r16, HIGH(RAMEND)	; load high byte of RAMEND into r16
	out	SPH, r16			; store r16 in stack pointer high

	ldi r16, 0xff
	out ddrc, r16			; ustawienie diód na wyj?cie

main: 
	ldi r16, 0xfe
	ldi r17, 0xff
	out portc, r16
	out portc, r17

	call delay

	ldi r16, 0xfd
	ldi r17, 0xff
	out portc, r16
	out portc, r17

	call delay

	rjmp main

delay:
	ldi r16, 0xff		; do zmiany jesli nie beda wystarczajaco ciemne
	
	loop0:
		dec r16				
		brne loop0			

	ret