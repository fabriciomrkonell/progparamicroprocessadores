
_main:

;AULA.c,34 :: 		void main() {             // ABRE FUNCAO PRINCIPAL: MAIN
;AULA.c,35 :: 		ADCON1 = 0b00001001;      // CONFIGURA ENTRADA AN1 COMO DIGITAL
	MOVLW      9
	MOVWF      ADCON1+0
;AULA.c,36 :: 		CMCON = 7;                // DESLIGA COMPARADORES
	MOVLW      7
	MOVWF      CMCON+0
;AULA.c,38 :: 		TRISA = 0b00000010;          //PORTA = 0b00000000;
	MOVLW      2
	MOVWF      TRISA+0
;AULA.c,39 :: 		TRISB = 0b00000000;            PORTB = 0b00000000;
	CLRF       TRISB+0
	CLRF       PORTB+0
;AULA.c,40 :: 		TRISC = 0b00000000;            PORTC = 0b00000000;
	CLRF       TRISC+0
	CLRF       PORTC+0
;AULA.c,44 :: 		BUZZER = 1;
	BSF        PORTC+0, 1
;AULA.c,46 :: 		BUZZER = 0; Delay_ms(15); BUZZER = 1; Delay_ms(30);
	BCF        PORTC+0, 1
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	BSF        PORTC+0, 1
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
;AULA.c,47 :: 		BUZZER = 0; Delay_ms(15); BUZZER = 1;
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
;AULA.c,49 :: 		Lcd_Init();                        // INICIA O LCD
	CALL       _Lcd_Init+0
;AULA.c,50 :: 		Lcd_Cmd(_LCD_CLEAR);               // LIMPA A TELA DO LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,51 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // DESLIGA O CURSOR
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,52 :: 		Lcd_Out(1, 1, "TESTE.D.CONTROLE");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_AULA+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,53 :: 		Lcd_Out(2, 1, "VENTOINHA....PWM");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_AULA+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,54 :: 		Delay_ms(2500);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;AULA.c,55 :: 		Lcd_Cmd(_LCD_CLEAR);               // LIMPA A TELA DO LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AULA.c,56 :: 		Lcd_Out(1, 1, "CONTAGEM: ");       // ESCREVE MENSAGEM NA LINHA 1, COLUNA 1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_AULA+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,57 :: 		Lcd_Out(2, 1, "RZ.CICL.: ");       // ESCREVE MANSAGEM NA LINHA 2, COLUNA 1
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_AULA+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,58 :: 		delay_ms (50);                     // AGUARDA 50ms
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
	NOP
;AULA.c,59 :: 		Pwm1_Init(5000);                   // INICIA MÛDULO PWM COM 5kHz = ANTES
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;AULA.c,60 :: 		Pwm1_Start();                      // INICIA MODULACAO LARGURA PULSOS
	CALL       _PWM1_Start+0
;AULA.c,61 :: 		do{                                // ROTINA "do"
L_main5:
;AULA.c,62 :: 		contagem = ADC_Read(1)/4;          // LE AD0 E SALVA 1/4 VALOR EM CONTAGEM
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _contagem+0
	MOVF       R2+1, 0
	MOVWF      _contagem+1
;AULA.c,63 :: 		wordToStr(contagem, cont_txt);     // CONVERTE VALOR DO AD1 EM STRING
	MOVF       R2+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R2+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _cont_txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;AULA.c,64 :: 		lcd_out(1,12,cont_txt);            // ESCREVE NO LCD VALOR DA CONVERS„O AD1
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _cont_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,65 :: 		a = Adc_Read(1);                   // LÍ CANAL AD1 E SALVA EM "a"
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _a+0
	MOVF       R0+1, 0
	MOVWF      _a+1
;AULA.c,66 :: 		a = (a * 0.25);                    // CONVERTE VALOR PARA A RAZAO CICLICA
	CALL       _Int2Double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _a+0
	MOVF       R0+1, 0
	MOVWF      _a+1
;AULA.c,67 :: 		PWM1_Set_Duty(a);                  // AJUSTA NOVO VALOR RAZAO CICLICA
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;AULA.c,68 :: 		aP = a * 100 / 255;
	MOVF       _a+0, 0
	MOVWF      R0+0
	MOVF       _a+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      255
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _aP+0
	MOVF       R0+1, 0
	MOVWF      _aP+1
;AULA.c,69 :: 		wordToStr(aP, aP_txt);             // CONVERSAO DE TIPOS DE DADOS
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _aP_txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;AULA.c,70 :: 		lcd_out(2,11, aP_txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _aP_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AULA.c,71 :: 		Lcd_Chr_Cp('%');
	MOVLW      37
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;AULA.c,73 :: 		while (1);}
	GOTO       L_main5
L_end_main:
	GOTO       $+0
; end of _main
