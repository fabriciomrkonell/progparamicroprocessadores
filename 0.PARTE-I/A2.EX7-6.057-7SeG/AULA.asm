
_main:

;AULA.c,26 :: 		void main() { // ABRE FUNCAO PRINCIPAL: MAIN
;AULA.c,27 :: 		ADCON1 = 0x06;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
	MOVLW      6
	MOVWF      ADCON1+0
;AULA.c,28 :: 		CMCON = 7;               // DESLIGA COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;AULA.c,30 :: 		TRISA = 0b00000000;            PORTA = 0b00000000;
	CLRF       TRISA+0
	CLRF       PORTA+0
;AULA.c,31 :: 		TRISB = 0b00000000;            PORTB = 0b00000000;
	CLRF       TRISB+0
	CLRF       PORTB+0
;AULA.c,32 :: 		TRISC = 0b00000000;            PORTC = 0b00000000;
	CLRF       TRISC+0
	CLRF       PORTC+0
;AULA.c,33 :: 		TRISD = 0b00000000;            PORTD = 0b00000000;
	CLRF       TRISD+0
	CLRF       PORTD+0
;AULA.c,34 :: 		TRISE = 0b00000000;            PORTE = 0b00000000;
	CLRF       TRISE+0
	CLRF       PORTE+0
;AULA.c,36 :: 		BARRA_LEDS_1 = 0b00000001;
	MOVLW      1
	MOVWF      PORTD+0
;AULA.c,37 :: 		DIS1 = 0;
	BCF        PORTA+0, 2
;AULA.c,38 :: 		DIS2 = 0;
	BCF        PORTA+0, 3
;AULA.c,39 :: 		DIS3 = 0;
	BCF        PORTA+0, 4
;AULA.c,40 :: 		DIS4 = 0;
	BCF        PORTA+0, 5
;AULA.c,42 :: 		do {
L_main0:
;AULA.c,43 :: 		DIS1 = 1;
	BSF        PORTA+0, 2
;AULA.c,44 :: 		BARRA_LEDS_1 = 0b11111101; // DIGITO "6" COM O PONTO DECIMAL
	MOVLW      253
	MOVWF      PORTD+0
;AULA.c,45 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;AULA.c,46 :: 		DIS1 = 0;
	BCF        PORTA+0, 2
;AULA.c,47 :: 		DIS2 = 1;
	BSF        PORTA+0, 3
;AULA.c,48 :: 		BARRA_LEDS_1 = 0b00111111; // DIGITO "0" SEM O PONTO DECIMAL
	MOVLW      63
	MOVWF      PORTD+0
;AULA.c,49 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
	NOP
;AULA.c,50 :: 		DIS2 = 0;
	BCF        PORTA+0, 3
;AULA.c,51 :: 		DIS3 = 1;
	BSF        PORTA+0, 4
;AULA.c,52 :: 		BARRA_LEDS_1 = 0b01101101; // DIGITO "5" SEM O PONTO DECIMAL
	MOVLW      109
	MOVWF      PORTD+0
;AULA.c,53 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;AULA.c,54 :: 		DIS3 = 0;
	BCF        PORTA+0, 4
;AULA.c,55 :: 		DIS4 = 1;
	BSF        PORTA+0, 5
;AULA.c,56 :: 		BARRA_LEDS_1 = 0b00000111; // DIGITO "7" SEM O PONTO DECIMAL
	MOVLW      7
	MOVWF      PORTD+0
;AULA.c,57 :: 		Delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;AULA.c,58 :: 		DIS4 = 0;
	BCF        PORTA+0, 5
;AULA.c,59 :: 		} while (1);}  // FECHA DO-WHILE  // FECHA MAIN
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
