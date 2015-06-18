
_main:

;AULA.c,27 :: 		void main() {
;AULA.c,28 :: 		ADCON1 = 0x07;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
	MOVLW      7
	MOVWF      ADCON1+0
;AULA.c,29 :: 		CMCON = 7;               // DESLIGA COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;AULA.c,31 :: 		TRISA = 0b00000000;            PORTA = 0b00000000;
	CLRF       TRISA+0
	CLRF       PORTA+0
;AULA.c,32 :: 		TRISB = 0b00000110;            PORTB = 0b00000000;
	MOVLW      6
	MOVWF      TRISB+0
	CLRF       PORTB+0
;AULA.c,33 :: 		TRISC = 0b00000000;            PORTC = 0b00000000;
	CLRF       TRISC+0
	CLRF       PORTC+0
;AULA.c,38 :: 		BUZZER = 1;
	BSF        PORTC+0, 1
;AULA.c,41 :: 		Lcd_Init();                                 // INICIA O LCD
	CALL       _Lcd_Init+0
;AULA.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,43 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                   // DESLIGA O CURSOR
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,44 :: 		Lcd_Out(1, 1, msg_1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msg_1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,45 :: 		Lcd_Out(2, 1, msg_2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msg_2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,47 :: 		while (1){
L_main0:
;AULA.c,48 :: 		BUZZER = 0; Delay_ms(15); BUZZER = 1; Delay_ms(150);
	BCF        PORTC+0, 1
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	BSF        PORTC+0, 1
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;AULA.c,49 :: 		BUZZER = 0; Delay_ms(15); BUZZER = 1;       // SIRENE SOA DUAS VEZES CURTAS
	BCF        PORTC+0, 1
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	BSF        PORTC+0, 1
;AULA.c,50 :: 		Delay_ms(10000);}}
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
