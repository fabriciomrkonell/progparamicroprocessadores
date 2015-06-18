
_main:

;AULA.c,22 :: 		void main() { // ABRE FUNCAO PRINCIPAL: MAIN
;AULA.c,23 :: 		ADCON1 = 0x06;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
	MOVLW      6
	MOVWF      ADCON1+0
;AULA.c,24 :: 		CMCON = 7;               // DESLIGA COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;AULA.c,26 :: 		TRISA = 0b00000000;            PORTA = 0b00000000;
	CLRF       TRISA+0
	CLRF       PORTA+0
;AULA.c,27 :: 		TRISB = 0b00000000;            PORTB = 0b00000000;
	CLRF       TRISB+0
	CLRF       PORTB+0
;AULA.c,28 :: 		TRISC = 0b00000000;            PORTC = 0b00000000;
	CLRF       TRISC+0
	CLRF       PORTC+0
;AULA.c,29 :: 		TRISD = 0b00000000;            PORTD = 0b00000000;
	CLRF       TRISD+0
	CLRF       PORTD+0
;AULA.c,30 :: 		TRISE = 0b00000000;            PORTE = 0b00000000;
	CLRF       TRISE+0
	CLRF       PORTE+0
;AULA.c,32 :: 		RELE_1 = 0;
	BCF        PORTC+0, 0
;AULA.c,33 :: 		RELE_2 = 0;
	BCF        PORTE+0, 0
;AULA.c,34 :: 		BARRA_LEDS_1 = 0;
	CLRF       PORTD+0
;AULA.c,35 :: 		BARRA_LEDS_2 = 0;
	CLRF       PORTB+0
;AULA.c,36 :: 		RESIST = 0;
	BCF        PORTC+0, 5
;AULA.c,37 :: 		VENT = 0;
	BCF        PORTC+0, 2
;AULA.c,38 :: 		BUZZER = 0;
	BCF        PORTC+0, 1
;AULA.c,40 :: 		while (1){
L_main0:
;AULA.c,41 :: 		RELE_1 =          ~ RELE_1;
	MOVLW      1
	XORWF      PORTC+0, 1
;AULA.c,42 :: 		RELE_2 =          ~ RELE_2;
	MOVLW      1
	XORWF      PORTE+0, 1
;AULA.c,43 :: 		BARRA_LEDS_1 =    ~ BARRA_LEDS_1;
	COMF       PORTD+0, 1
;AULA.c,44 :: 		BARRA_LEDS_2 =    ~ BARRA_LEDS_2;
	COMF       PORTB+0, 1
;AULA.c,45 :: 		RESIST =          ~ RESIST;
	MOVLW      32
	XORWF      PORTC+0, 1
;AULA.c,46 :: 		VENT =            ~ VENT;
	MOVLW      4
	XORWF      PORTC+0, 1
;AULA.c,47 :: 		BUZZER =          ~ BUZZER;
	MOVLW      2
	XORWF      PORTC+0, 1
;AULA.c,48 :: 		Delay_ms(750);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;AULA.c,49 :: 		}             // FECHA WHILE
	GOTO       L_main0
;AULA.c,50 :: 		}             // FECHA MAIN
L_end_main:
	GOTO       $+0
; end of _main
