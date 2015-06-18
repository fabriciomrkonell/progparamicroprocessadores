
_main:

;AULA.c,13 :: 		void main() { // ABRE FUNCAO PRINCIPAL: MAIN
;AULA.c,14 :: 		ADCON1 = 0x06;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
	MOVLW      6
	MOVWF      ADCON1+0
;AULA.c,15 :: 		CMCON = 7;               // DESLIGA COMPARADORES
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
;AULA.c,23 :: 		PORTB = 0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;AULA.c,24 :: 		PORTC = 0b00000000;
	CLRF       PORTC+0
;AULA.c,25 :: 		PORTD = 0b01010101;
	MOVLW      85
	MOVWF      PORTD+0
;AULA.c,26 :: 		PORTE = 0b00000000;
	CLRF       PORTE+0
;AULA.c,27 :: 		while (t < 86){          // ESTABELECE A DURACAO DO TEMPO DE FUNCIONAMENTO
L_main0:
	MOVLW      0
	SUBWF      _t+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main4
	MOVLW      86
	SUBWF      _t+0, 0
L__main4:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;AULA.c,29 :: 		PORTB = ~ PORTB;         // INVERTE ESTADO PORTB
	COMF       PORTB+0, 1
;AULA.c,30 :: 		PORTD = ~ PORTB;         // INVERTE ESTADO PORTD
	COMF       PORTB+0, 0
	MOVWF      PORTD+0
;AULA.c,31 :: 		Delay_ms(350);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      142
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;AULA.c,32 :: 		t++;
	INCF       _t+0, 1
	BTFSC      STATUS+0, 2
	INCF       _t+1, 1
;AULA.c,33 :: 		}             // FECHA WHILE
	GOTO       L_main0
L_main1:
;AULA.c,34 :: 		PORTB = 0x00;            // AO FINAL DO TEMPO DESLIGA TODOS OS LEDS
	CLRF       PORTB+0
;AULA.c,35 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;AULA.c,36 :: 		}             // FECHA MAIN
L_end_main:
	GOTO       $+0
; end of _main
