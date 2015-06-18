
_main:

;adc.c,15 :: 		void main() {
;adc.c,16 :: 		ADCON1 = 0B00001110;             //HABILITA CANAL A/D0 E A/D1 DO PIC
	MOVLW      14
	MOVWF      ADCON1+0
;adc.c,17 :: 		TRISB  = 0B00000000;             //PORTB COMO SAIDA
	CLRF       TRISB+0
;adc.c,18 :: 		PORTB  = 0B00000000;             //LEDS INICIALMENTE APAGADOS
	CLRF       PORTB+0
;adc.c,19 :: 		Lcd_Init ();                     // INICIALIZA LCD
	CALL       _Lcd_Init+0
;adc.c,20 :: 		Lcd_Cmd(_Lcd_Clear);             // APAGA LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;adc.c,21 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        // DESLIGA CURSOR DO LCD
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;adc.c,22 :: 		Lcd_Out(1, 1, "CONTAGEM: ");     // ESCREVE MANSAGEM NA LINHA 1, COLUNA 1 DO LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_adc+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;adc.c,23 :: 		delay_ms (50);                   // DELAY DE 10MS
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;adc.c,24 :: 		do {
L_main1:
;adc.c,25 :: 		contagem = ADC_Read(0);          // LE CANAL AD0 DO PIC E SALVA VALOR NA VARIáVEL temp_res
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _contagem+0
	MOVF       R0+1, 0
	MOVWF      _contagem+1
;adc.c,26 :: 		Delay_us(100);                   // DELAY DE 10 MICROSEGUNDOS
	MOVLW      66
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	NOP
;adc.c,27 :: 		wordToStr(contagem, cont_txt);   // CONVERTE VALOR DA CONVERSãO DO AD0 PARA STRING
	MOVF       _contagem+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       _contagem+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _cont_txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;adc.c,28 :: 		lcd_out(1,12,cont_txt);          // ESCREVE NO LCD O VALOR DA CONVERSãO DO AD0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _cont_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;adc.c,29 :: 		tensao_int = contagem * 5/1023;
	MOVF       _contagem+0, 0
	MOVWF      R0+0
	MOVF       _contagem+1, 0
	MOVWF      R0+1
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _tensao_int+0
	MOVF       R0+1, 0
	MOVWF      _tensao_int+1
;adc.c,30 :: 		WordToStr(tensao_int, tensao_int_txt);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _tensao_int_txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;adc.c,31 :: 		lcd_out(2,1,tensao_int_txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _tensao_int_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;adc.c,32 :: 		Lcd_Chr_Cp(',');
	MOVLW      44
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;adc.c,33 :: 		tensao_dec = ((contagem * 1023) - tensao_int)*50000;
	MOVF       _contagem+0, 0
	MOVWF      R0+0
	MOVF       _contagem+1, 0
	MOVWF      R0+1
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       _tensao_int+0, 0
	SUBWF      R0+0, 1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       _tensao_int+1, 0
	SUBWF      R0+1, 1
	MOVLW      80
	MOVWF      R4+0
	MOVLW      195
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _tensao_dec+0
	MOVF       R0+1, 0
	MOVWF      _tensao_dec+1
;adc.c,34 :: 		WordToStrWithZeros(tensao_dec, tensao_dec_txt);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStrWithZeros_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStrWithZeros_input+1
	MOVLW      _tensao_dec_txt+0
	MOVWF      FARG_WordToStrWithZeros_output+0
	CALL       _WordToStrWithZeros+0
;adc.c,35 :: 		lcd_out(2,7,tensao_dec_txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _tensao_dec_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;adc.c,36 :: 		Lcd_Chr_Cp('V');
	MOVLW      86
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;adc.c,37 :: 		if (tensao_int >= 3) PORTB = 0b11111111;       // ACENDE LEDS PARA V>=3V
	MOVLW      0
	SUBWF      _tensao_int+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      3
	SUBWF      _tensao_int+0, 0
L__main8:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
	MOVLW      255
	MOVWF      PORTB+0
	GOTO       L_main6
L_main5:
;adc.c,38 :: 		else PORTB = 0b00000000;                       // APAGA LEDS
	CLRF       PORTB+0
L_main6:
;adc.c,39 :: 		} while (1);}                                  // FIM DO/WHILE + FIM MAIN
	GOTO       L_main1
L_end_main:
	GOTO       $+0
; end of _main
