
_main:

;AULA.c,12 :: 		void main() { // ABRE FUNCAO PRINCIPAL: MAIN
;AULA.c,13 :: 		ADCON1 = 0x06;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
	MOVLW      6
	MOVWF      ADCON1+0
;AULA.c,14 :: 		CMCON = 7;               // DESLIGA COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;AULA.c,17 :: 		TRISA = 0b00000000;
	CLRF       TRISA+0
;AULA.c,18 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;AULA.c,19 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;AULA.c,20 :: 		TRISD = 0b00000000;
	CLRF       TRISD+0
;AULA.c,21 :: 		TRISE = 0b00000000;
	CLRF       TRISE+0
;AULA.c,22 :: 		PORTA = 0b00000000;
	CLRF       PORTA+0
;AULA.c,23 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;AULA.c,24 :: 		PORTC = 0b00000000;
	CLRF       PORTC+0
;AULA.c,25 :: 		PORTD = 0b00000000;
	CLRF       PORTD+0
;AULA.c,26 :: 		PORTE = 0b00000000;
	CLRF       PORTE+0
;AULA.c,29 :: 		while (1){    // ABRE WHILE
L_main0:
;AULA.c,30 :: 		PORTB = 0b00000000;     // ESTADO PORTB
	CLRF       PORTB+0
;AULA.c,31 :: 		PORTD = 0b00000000;     // ESTADO PORTD
	CLRF       PORTD+0
;AULA.c,32 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;AULA.c,33 :: 		PORTB = 0b11111111;     // ESTADO PORTB
	MOVLW      255
	MOVWF      PORTB+0
;AULA.c,34 :: 		PORTD = 0b11111111;     // ESTADO PORTD
	MOVLW      255
	MOVWF      PORTD+0
;AULA.c,35 :: 		Delay_ms(900);
	MOVLW      10
	MOVWF      R11+0
	MOVLW      34
	MOVWF      R12+0
	MOVLW      161
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;AULA.c,36 :: 		}             // FECHA WHILE
	GOTO       L_main0
;AULA.c,37 :: 		}             // FECHA MAIN
L_end_main:
	GOTO       $+0
; end of _main
