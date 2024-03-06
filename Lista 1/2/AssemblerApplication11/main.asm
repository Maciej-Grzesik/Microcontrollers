; AssemblerApplication11.asm
;
; Created: 06/03/2024 11:52:41
; Author : Maciej
;

.cseg
.org 0x00
rjmp start
.org 0x46

data: .db  0b11111111, 0b01111111, 0b10111111, 0b00111111, 0b11011111, 0b01011111, 0b10011111, 0b00011111, 0b11101111, 0b01101111, 0b10101111, 0b00101111, 0b11001111, 0b01001111, 0b10001111, 0b000011111
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
    brge off ; If buttons PB4-PB7 pressed, turn off display

    mov r19, r18 ; Copy button state to r19

    sbrc r19, 7 ; Check if PB7 is pressed
    lsl r18      ; Shift data index to access the next byte

    add r30, r18 ; Add data index to Z register
    lpm r16, Z   ; Load data from program memory
    out portc, r16 ; Output data to port C

    rjmp main

off:
    ldi r16, 0xff
    out portc, r16
    rjmp main
