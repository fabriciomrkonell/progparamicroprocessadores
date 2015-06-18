
_main:

;EXP7.c,21 :: 		void main() {
;EXP7.c,23 :: 		ADCON1= 0x8E;                     // Configura registradores para funcionarem como analógicos
	MOVLW      142
	MOVWF      ADCON1+0
;EXP7.c,24 :: 		TRISA.RA0 = 1;                     // Habilita leitura da porta analógica 0
	BSF        TRISA+0, 0
;EXP7.c,26 :: 		TRISC.RC2 = 0;                     // Configura registrador para ser usado pela biblioteca PWM
	BCF        TRISC+0, 2
;EXP7.c,28 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;EXP7.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXP7.c,30 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EXP7.c,31 :: 		Lcd_Out(1,1, "Iniciando");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_EXP7+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXP7.c,32 :: 		VDelay_ms(1000);
	MOVLW      232
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVLW      3
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;EXP7.c,33 :: 		Lcd_Out(1,1, "COUNT: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_EXP7+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXP7.c,34 :: 		Lcd_Out(2,1, "POWER: ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_EXP7+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXP7.c,36 :: 		PWM1_Init(1000);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;EXP7.c,37 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;EXP7.c,38 :: 		while(1) {
L_main0:
;EXP7.c,40 :: 		analogRead = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _analogRead+0
	MOVF       R0+1, 0
	MOVWF      _analogRead+1
;EXP7.c,41 :: 		dutyPowerVal = analogRead / 4;
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	BTFSC      R2+1, 6
	BSF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	BTFSC      R2+1, 6
	BSF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _dutyPowerVal+0
;EXP7.c,43 :: 		count[0] = 48 + ((int) ((dutyPowerVal / 100) % 10));
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVLW      100
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _count+0
;EXP7.c,44 :: 		count[1] = 48 + ((int) ((dutyPowerVal / 10) % 10));
	MOVLW      10
	MOVWF      R4+0
	MOVF       _dutyPowerVal+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _count+1
;EXP7.c,45 :: 		count[2] = 48 + ((int) (dutyPowerVal % 10));
	MOVLW      10
	MOVWF      R4+0
	MOVF       _dutyPowerVal+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _count+2
;EXP7.c,46 :: 		Lcd_Out(1,7, count);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _count+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXP7.c,48 :: 		dutyPowerPer = (100 * dutyPowerVal) / 255;
	MOVLW      100
	MOVWF      R0+0
	MOVF       _dutyPowerVal+0, 0
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVLW      255
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _dutyPowerPer+0
;EXP7.c,50 :: 		PWM1_Set_Duty(dutyPowerVal);
	MOVF       _dutyPowerVal+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;EXP7.c,51 :: 		Delay_ms(40);
	MOVLW      104
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
;EXP7.c,54 :: 		dutyPower[0] = 48 + (int) ((dutyPowerPer / 100) % 10);
	MOVLW      100
	MOVWF      R4+0
	MOVF       _dutyPowerPer+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _dutyPower+0
;EXP7.c,55 :: 		dutyPower[1] = 48 + (int) ((dutyPowerPer / 10) % 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _dutyPowerPer+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _dutyPower+1
;EXP7.c,56 :: 		dutyPower[2] = 48 + (int) (dutyPowerPer % 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _dutyPowerPer+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      _dutyPower+2
;EXP7.c,57 :: 		Lcd_Out(2,7, dutyPower);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _dutyPower+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EXP7.c,59 :: 		}
	GOTO       L_main0
;EXP7.c,62 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
