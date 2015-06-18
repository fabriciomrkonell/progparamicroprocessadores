
_main:

;AULA.c,45 :: 		void main() {            // FUNCAO PRINCIPAL: MAIN
;AULA.c,46 :: 		ADCON1 = 0x07;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
	MOVLW      7
	MOVWF      ADCON1+0
;AULA.c,47 :: 		CMCON = 7;               // DESLIGA COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;AULA.c,49 :: 		TRISA = 0b00000000;            PORTA = 0b00000000;
	CLRF       TRISA+0
	CLRF       PORTA+0
;AULA.c,50 :: 		TRISB = 0b00000110;         // PORTB = 0b00000000;
	MOVLW      6
	MOVWF      TRISB+0
;AULA.c,51 :: 		TRISC = 0b00000000;            PORTC = 0b00000000;
	CLRF       TRISC+0
	CLRF       PORTC+0
;AULA.c,55 :: 		BUZZER = 1;
	BSF        PORTC+0, 1
;AULA.c,57 :: 		Lcd_Init();                                 // INICIA O LCD
	CALL       _Lcd_Init+0
;AULA.c,58 :: 		Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,59 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                   // DESLIGA O CURSOR
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,60 :: 		Lcd_Out(1, 1, msg_2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msg_2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,61 :: 		Lcd_Out(2, 1, msg_1);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msg_1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,62 :: 		Delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;AULA.c,63 :: 		Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,64 :: 		while (1) {
L_main1:
;AULA.c,65 :: 		if (!INT2) {
	BTFSC      PORTB+0, 2
	GOTO       L_main3
;AULA.c,66 :: 		BUZZER = 0; Delay_ms(15); BUZZER = 1; Delay_ms(50);
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
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;AULA.c,67 :: 		BUZZER = 0; Delay_ms(15); BUZZER = 1;       // SIRENE SOA DUAS VEZES CURTAS
	BCF        PORTC+0, 1
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	BSF        PORTC+0, 1
;AULA.c,69 :: 		EEPROM_Write(0x08, 'K');               //ESCREVE "K" NA POSICAO 0x08 DA EEPROM
	MOVLW      8
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      75
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;AULA.c,70 :: 		Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,71 :: 		Lcd_Out(1, 1, msg_1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msg_1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,72 :: 		Lcd_Out(2, 1, msg_3);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msg_3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,73 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;AULA.c,74 :: 		Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,75 :: 		} else if (!INT1) {
	GOTO       L_main8
L_main3:
	BTFSC      PORTB+0, 1
	GOTO       L_main9
;AULA.c,76 :: 		BUZZER = 0; Delay_ms(15); BUZZER = 1;       // SIRENE SOA UMA VEZ CURTA
	BCF        PORTC+0, 1
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	BSF        PORTC+0, 1
;AULA.c,78 :: 		INFO = EEPROM_Read(0x08);                   // LE A POSICAO 0x08 DA EEPROM
	MOVLW      8
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _INFO+0
;AULA.c,79 :: 		ShortToStr (INFO, INFO_s);
	MOVF       R0+0, 0
	MOVWF      FARG_ShortToStr_input+0
	MOVLW      _INFO_s+0
	MOVWF      FARG_ShortToStr_output+0
	CALL       _ShortToStr+0
;AULA.c,80 :: 		Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,81 :: 		Lcd_Out(1, 1, msg_1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msg_1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,82 :: 		Lcd_Out(2, 1, msg_4);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msg_4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,83 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;AULA.c,84 :: 		Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,85 :: 		Lcd_Out(1,1,INFO_s);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _INFO_s+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,86 :: 		Lcd_Out_Cp(" = DECIMAL");
	MOVLW      ?lstr1_AULA+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;AULA.c,87 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,88 :: 		Lcd_Chr_Cp(0+INFO);
	MOVF       _INFO+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;AULA.c,89 :: 		Lcd_Out_Cp(" =  CHARACTER");
	MOVLW      ?lstr2_AULA+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;AULA.c,90 :: 		Delay_ms(2500);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
;AULA.c,91 :: 		Lcd_Cmd(_LCD_CLEAR);}                       // LIMPA A TELA DO LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	GOTO       L_main13
L_main9:
;AULA.c,93 :: 		Lcd_Out(1, 1, msg_5);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msg_5+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,94 :: 		Lcd_Out(2, 1, msg_6);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msg_6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,95 :: 		}                                                                  // FIM ELSE
L_main13:
L_main8:
;AULA.c,96 :: 		}                                                               // FIM  WHILE
	GOTO       L_main1
;AULA.c,97 :: 		}                                                                // FIM MAIN
L_end_main:
	GOTO       $+0
; end of _main
