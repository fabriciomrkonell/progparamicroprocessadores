
_main:

;AULA.c,42 :: 		void main() { // ABRE FUNCAO PRINCIPAL: MAIN
;AULA.c,43 :: 		ADCON1 = 0x06;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
	MOVLW      6
	MOVWF      ADCON1+0
;AULA.c,44 :: 		CMCON = 7;               // DESLIGA COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;AULA.c,46 :: 		TRISA = 0b00000000;            PORTA = 0b00000000;
	CLRF       TRISA+0
	CLRF       PORTA+0
;AULA.c,47 :: 		TRISB = 0b11111111;         // PORTB = 0b00000000;
	MOVLW      255
	MOVWF      TRISB+0
;AULA.c,48 :: 		TRISC = 0b00000000;            PORTC = 0b00000000;
	CLRF       TRISC+0
	CLRF       PORTC+0
;AULA.c,49 :: 		TRISD = 0b00000000;            PORTD = 0b00000000;
	CLRF       TRISD+0
	CLRF       PORTD+0
;AULA.c,50 :: 		TRISE = 0b00000000;            PORTE = 0b00000000;
	CLRF       TRISE+0
	CLRF       PORTE+0
;AULA.c,52 :: 		RELE_1 = 0;         RELE_2 = 0;
	BCF        PORTC+0, 0
	BCF        PORTE+0, 0
;AULA.c,53 :: 		VENT = 0;           BUZZER = 1;
	BCF        PORTC+0, 2
	BSF        PORTC+0, 1
;AULA.c,54 :: 		LEDD0 = 0;          LEDD1 = 0;       LEDD2 = 0;        LEDD3 = 0;
	BCF        PORTD+0, 0
	BCF        PORTD+0, 1
	BCF        PORTD+0, 2
	BCF        PORTD+0, 3
;AULA.c,55 :: 		LEDD4 = 0;          LEDD5 = 0;       LEDD6 = 0;        LEDD7 = 0;
	BCF        PORTD+0, 4
	BCF        PORTD+0, 5
	BCF        PORTD+0, 6
	BCF        PORTD+0, 7
;AULA.c,56 :: 		while (1){
L_main0:
;AULA.c,57 :: 		RELE_1 =  !INT0;    // PRESSIONA LIGA
	BTFSC      PORTB+0, 0
	GOTO       L__main4
	BSF        PORTC+0, 0
	GOTO       L__main5
L__main4:
	BCF        PORTC+0, 0
L__main5:
;AULA.c,58 :: 		RELE_2 =  !INT1;    // PRESSIONA LIGA
	BTFSC      PORTB+0, 1
	GOTO       L__main6
	BSF        PORTE+0, 0
	GOTO       L__main7
L__main6:
	BCF        PORTE+0, 0
L__main7:
;AULA.c,59 :: 		VENT =    !INT2;    // PRESSIONA LIGA
	BTFSC      PORTB+0, 2
	GOTO       L__main8
	BSF        PORTC+0, 2
	GOTO       L__main9
L__main8:
	BCF        PORTC+0, 2
L__main9:
;AULA.c,60 :: 		BUZZER =   INT3;    // PRESSIONA LIGA
	BTFSC      PORTB+0, 3
	GOTO       L__main10
	BCF        PORTC+0, 1
	GOTO       L__main11
L__main10:
	BSF        PORTC+0, 1
L__main11:
;AULA.c,61 :: 		LEDD0 =   !INT4;    // PRESSIONA LIGA
	BTFSC      PORTB+0, 4
	GOTO       L__main12
	BSF        PORTD+0, 0
	GOTO       L__main13
L__main12:
	BCF        PORTD+0, 0
L__main13:
;AULA.c,62 :: 		LEDD1 =    INT5;    // PRESSIONA DESLIGA
	BTFSC      PORTB+0, 5
	GOTO       L__main14
	BCF        PORTD+0, 1
	GOTO       L__main15
L__main14:
	BSF        PORTD+0, 1
L__main15:
;AULA.c,63 :: 		LEDD2 =   !INT4;    // PRESSIONA LIGA
	BTFSC      PORTB+0, 4
	GOTO       L__main16
	BSF        PORTD+0, 2
	GOTO       L__main17
L__main16:
	BCF        PORTD+0, 2
L__main17:
;AULA.c,64 :: 		LEDD3 =    INT5;    // PRESSIONA DESLIGA
	BTFSC      PORTB+0, 5
	GOTO       L__main18
	BCF        PORTD+0, 3
	GOTO       L__main19
L__main18:
	BSF        PORTD+0, 3
L__main19:
;AULA.c,65 :: 		LEDD4 =   !INT4;    // PRESSIONA LIGA
	BTFSC      PORTB+0, 4
	GOTO       L__main20
	BSF        PORTD+0, 4
	GOTO       L__main21
L__main20:
	BCF        PORTD+0, 4
L__main21:
;AULA.c,66 :: 		LEDD5 =    INT5;    // PRESSIONA DESLIGA
	BTFSC      PORTB+0, 5
	GOTO       L__main22
	BCF        PORTD+0, 5
	GOTO       L__main23
L__main22:
	BSF        PORTD+0, 5
L__main23:
;AULA.c,67 :: 		LEDD6 =   !INT4;    // PRESSIONA LIGA
	BTFSC      PORTB+0, 4
	GOTO       L__main24
	BSF        PORTD+0, 6
	GOTO       L__main25
L__main24:
	BCF        PORTD+0, 6
L__main25:
;AULA.c,68 :: 		LEDD7 =    INT5;    // PRESSIONA DESLIGA
	BTFSC      PORTB+0, 5
	GOTO       L__main26
	BCF        PORTD+0, 7
	GOTO       L__main27
L__main26:
	BSF        PORTD+0, 7
L__main27:
;AULA.c,69 :: 		Delay_ms(50);}}
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
