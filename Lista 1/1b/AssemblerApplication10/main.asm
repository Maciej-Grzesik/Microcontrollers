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
	out portc, r16

	call delay

	ldi r16, 0xfd
	out portc, r16

	call delay

	rjmp main

delay:
	ldi r16, 0x52
	
	loop0:
		ldi r17, 0xff
			
		loop1:
			ldi r18, 0xff

			loop2:
				dec r18
				brne loop2

			dec r17			
			brne loop1

		dec r16				
		brne loop0			

	ret