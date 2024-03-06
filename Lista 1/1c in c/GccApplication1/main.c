/*
 * GccApplication1.c
 *
 * Created: 04/03/2024 15:08:00
 * Author : Maciej
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>

void delay() {
	volatile unsigned int i = 255;		// volatile -- ??
	while ( i != 0) {
		i--;
	}
}

int main(void)
{
	DDRB = 0xff;
	
    while (1) {
		PORTB = 0xfe;
		PORTB = 0xff;
		
		delay();
		
		PORTB = 0xfd;
		PORTB = 0xff;
		
		delay();
	}
	
	return 0;
}

