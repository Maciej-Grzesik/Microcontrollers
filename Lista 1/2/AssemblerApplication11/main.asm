; AssemblerApplication11.asm
;
; Created: 06/03/2024 11:52:41
; Author : Maciej
;

.cseg
.org 0x00
rjmp start
.org 0x46

data: .db 0b0000, 0b0001, 0b0010, 0b0011, 0b0100, 0b0101, 0b0110, 0b0111, 0b1000, 0b1001, 0b1010, 0b1011, 0b1100, 0b1101, 0b1110, 0b1111
start:
    ldi r16, 0xff
    out ddrc, r16
    out portc, r16

    ldi r16, 0x00
    out ddrb, r16

    ldi r16, 0xf0
    ldi r17, 0xff

main:
    ldi zl, low(data*2)
    ldi zh, high(data*2)

    in r18, pinb

    cpi r18, 0
    breq off 

    cpi r18, 15
    brge off 

    add r30, r18
    lpm r16, z
	eor r16, r17
    out portc, r16

    rjmp main

off:
    ldi r16, 0xff
    out portc, r16
    rjmp main
