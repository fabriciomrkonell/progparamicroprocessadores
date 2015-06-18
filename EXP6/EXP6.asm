
_main:

;EXP6.c,22 :: 		void main() {
;EXP6.c,24 :: 		ADCON1 = 0x8E;                     // Configura registradores para funcionarem como analógicos
	MOVLW      142
	MOVWF      ADCON1+0
;EXP6.c,26 :: 		TRISA.RA0 = 1;                     // Habilita leitura da porta analógica 0
	BSF        TRISA+0, 0
;EXP6.c,28 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;EXP6.c,30 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;EXP6.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXP6.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXP6.c,34 :: 		Lcd_Out(1,1, "Iniciando");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_EXP6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXP6.c,35 :: 		VDelay_ms(1000);
	MOVLW      232
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVLW      3
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;EXP6.c,36 :: 		Lcd_Out(1,1, "CONTAGEM: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_EXP6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXP6.c,37 :: 		Lcd_Out(2,1, "TENSAO: ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_EXP6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXP6.c,38 :: 		VDelay_ms(1000);
	MOVLW      232
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVLW      3
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;EXP6.c,40 :: 		while(1) {
L_main0:
;EXP6.c,42 :: 		analogRead = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _analogRead+0
	MOVF       R0+1, 0
	MOVWF      _analogRead+1
;EXP6.c,44 :: 		text[0] = 48 + ((int) (analogRead / 1000));
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _text+0
;EXP6.c,45 :: 		text[1] = 48 + ((int) ((analogRead / 100) % 10));
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _analogRead+0, 0
	MOVWF      R0+0
	MOVF       _analogRead+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _text+1
;EXP6.c,46 :: 		text[2] = 48 + ((int) ((analogRead / 10) % 10));
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _analogRead+0, 0
	MOVWF      R0+0
	MOVF       _analogRead+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _text+2
;EXP6.c,47 :: 		text[3] = 48 + ((int) (analogRead % 10));
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _analogRead+0, 0
	MOVWF      R0+0
	MOVF       _analogRead+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _text+3
;EXP6.c,48 :: 		Lcd_Out(1,10, text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXP6.c,50 :: 		if(analogRead > 512) {
	MOVLW      128
	XORLW      2
	MOVWF      R0+0
	MOVLW      128
	XORWF      _analogRead+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main5
	MOVF       _analogRead+0, 0
	SUBLW      0
L__main5:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;EXP6.c,51 :: 		PORTB = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;EXP6.c,52 :: 		} else {
	GOTO       L_main3
L_main2:
;EXP6.c,53 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;EXP6.c,54 :: 		}
L_main3:
;EXP6.c,56 :: 		tensF = analogRead * (5.0 / 1023.0);
	MOVF       _analogRead+0, 0
	MOVWF      R0+0
	MOVF       _analogRead+1, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      40
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      119
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _tensF+0
	MOVF       R0+1, 0
	MOVWF      _tensF+1
	MOVF       R0+2, 0
	MOVWF      _tensF+2
	MOVF       R0+3, 0
	MOVWF      _tensF+3
;EXP6.c,57 :: 		tensI = tensF * 1000;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _tensI+0
	MOVF       R0+1, 0
	MOVWF      _tensI+1
;EXP6.c,59 :: 		volt[0] = 48 + (int) (tensI / 1000);
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _volt+0
;EXP6.c,60 :: 		volt[2] = 48 + (int) ((tensI / 100) % 10);
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _tensI+0, 0
	MOVWF      R0+0
	MOVF       _tensI+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _volt+2
;EXP6.c,61 :: 		volt[3] = 48 + (int) ((tensI / 10) % 10);
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _tensI+0, 0
	MOVWF      R0+0
	MOVF       _tensI+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _volt+3
;EXP6.c,62 :: 		volt[4] = 48 + (int) (tensI % 10);
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _tensI+0, 0
	MOVWF      R0+0
	MOVF       _tensI+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _volt+4
;EXP6.c,63 :: 		Lcd_Out(2,8, volt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _volt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXP6.c,64 :: 		}
	GOTO       L_main0
;EXP6.c,66 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
