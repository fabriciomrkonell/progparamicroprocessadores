
_CustomChar:

;MAIN.c,15 :: 		void CustomChar(char pos_row, char pos_char) {
;MAIN.c,17 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MAIN.c,18 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF       CustomChar_i_L0+0
L_CustomChar0:
	MOVF       CustomChar_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_CustomChar1
	MOVF       CustomChar_i_L0+0, 0
	ADDLW      _character+0
	MOVWF      R0+0
	MOVLW      hi_addr(_character+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       CustomChar_i_L0+0, 1
	GOTO       L_CustomChar0
L_CustomChar1:
;MAIN.c,19 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MAIN.c,20 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF       FARG_CustomChar_pos_row+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_CustomChar_pos_char+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MAIN.c,21 :: 		}
L_end_CustomChar:
	RETURN
; end of _CustomChar

_main:

;MAIN.c,22 :: 		void main(){
;MAIN.c,23 :: 		ADCON1 = 0b00001110;             // HABILITA CANAL AN0 E AN1
	MOVLW      14
	MOVWF      ADCON1+0
;MAIN.c,24 :: 		TRISA.RA0 = 1;
	BSF        TRISA+0, 0
;MAIN.c,25 :: 		Lcd_Init ();                     // START LCD
	CALL       _Lcd_Init+0
;MAIN.c,26 :: 		Lcd_Cmd(_Lcd_Clear);             // CLEAR LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MAIN.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);        // TURN LCD'S CURSOR OFF
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MAIN.c,28 :: 		ADC_Init();
	CALL       _ADC_Init+0
;MAIN.c,29 :: 		while(1){
L_main3:
;MAIN.c,30 :: 		adc_rd = ADC_Read(0);            // GET ADC VALUE FROM 1ST CHANNEL
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_rd+0
	MOVF       R0+1, 0
	MOVWF      _adc_rd+1
;MAIN.c,31 :: 		IntToStr(adc_rd, adcprint);                            // CONVERSION TO STRING
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _adcprint+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;MAIN.c,32 :: 		Lcd_out(1,1,"COUNTS..: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MAIN+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MAIN.c,33 :: 		Lcd_Out_Cp(adcprint);                     // PRINTS ADC STEPS IN LCD FIRST ROW
	MOVLW      _adcprint+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;MAIN.c,34 :: 		if (diff != adc_rd){
	MOVF       _diff+1, 0
	XORWF      _adc_rd+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVF       _adc_rd+0, 0
	XORWF      _diff+0, 0
L__main12:
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;MAIN.c,35 :: 		BarSegmentNum = adc_rd /(1023 / 16);
	MOVLW      63
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _adc_rd+0, 0
	MOVWF      R0+0
	MOVF       _adc_rd+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _BarSegmentNum+0
	MOVF       R0+1, 0
	MOVWF      _BarSegmentNum+1
	CLRF       _BarSegmentNum+2
	CLRF       _BarSegmentNum+3
;MAIN.c,37 :: 		Lcd_out(2,1,"                ");    // CLEARS LCD SECOND ROW
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MAIN+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MAIN.c,38 :: 		for (i = 0; i < BarSegmentNum; i++){
	CLRF       _i+0
L_main6:
	MOVF       _BarSegmentNum+3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       _BarSegmentNum+2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       _BarSegmentNum+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       _BarSegmentNum+0, 0
	SUBWF      _i+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;MAIN.c,40 :: 		CustomChar(2, i+1);}}         // PRINT CUSTOM CHARACTER FOR BARGRAPH SEGMENT
	MOVLW      2
	MOVWF      FARG_CustomChar_pos_row+0
	INCF       _i+0, 0
	MOVWF      FARG_CustomChar_pos_char+0
	CALL       _CustomChar+0
;MAIN.c,38 :: 		for (i = 0; i < BarSegmentNum; i++){
	INCF       _i+0, 1
;MAIN.c,40 :: 		CustomChar(2, i+1);}}         // PRINT CUSTOM CHARACTER FOR BARGRAPH SEGMENT
	GOTO       L_main6
L_main7:
L_main5:
;MAIN.c,41 :: 		Delay_ms(750);                 // STABILIZE LCD DISPLAY
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;MAIN.c,42 :: 		diff = adc_rd;
	MOVF       _adc_rd+0, 0
	MOVWF      _diff+0
	MOVF       _adc_rd+1, 0
	MOVWF      _diff+1
;MAIN.c,43 :: 		}                              // END WHILE
	GOTO       L_main3
;MAIN.c,44 :: 		}                              // END MAIN
L_end_main:
	GOTO       $+0
; end of _main
