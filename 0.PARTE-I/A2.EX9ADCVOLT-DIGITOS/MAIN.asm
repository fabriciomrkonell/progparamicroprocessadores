
_main:

;MAIN.c,25 :: 		void main() {
;MAIN.c,26 :: 		ADCON1 = 0x8E;                     // CONFIGURES THE FUNCTIONS OF THE PORT PINS
	MOVLW      142
	MOVWF      ADCON1+0
;MAIN.c,28 :: 		CM2_bit, CM1_bit, CM0_bit = 1;     // ALL COMPARATORS OFF
	BSF        CM0_bit+0, BitPos(CM0_bit+0)
;MAIN.c,29 :: 		INTCON = 0;                    // ALL INTERRUPTS DISABLED
	CLRF       INTCON+0
;MAIN.c,30 :: 		TRISA.RA0 = 1;                 // PORTA AN0 CONFIGURED AS INPUT
	BSF        TRISA+0, 0
;MAIN.c,31 :: 		Lcd_Init();                    // LCD DISPLAY INITIALIZATION
	CALL       _Lcd_Init+0
;MAIN.c,32 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);      // LCD COMMAND (CURSOR OFF)
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MAIN.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);           // LCD COMMAND (CLEAR LCD)
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MAIN.c,34 :: 		text = "> LAB.MCU.2014 <";     // DEFINE THE FIRST MESSAGE
	MOVLW      62
	MOVWF      ?lstr1_MAIN+0
	MOVLW      32
	MOVWF      ?lstr1_MAIN+1
	MOVLW      76
	MOVWF      ?lstr1_MAIN+2
	MOVLW      65
	MOVWF      ?lstr1_MAIN+3
	MOVLW      66
	MOVWF      ?lstr1_MAIN+4
	MOVLW      46
	MOVWF      ?lstr1_MAIN+5
	MOVLW      77
	MOVWF      ?lstr1_MAIN+6
	MOVLW      67
	MOVWF      ?lstr1_MAIN+7
	MOVLW      85
	MOVWF      ?lstr1_MAIN+8
	MOVLW      46
	MOVWF      ?lstr1_MAIN+9
	MOVLW      50
	MOVWF      ?lstr1_MAIN+10
	MOVLW      48
	MOVWF      ?lstr1_MAIN+11
	MOVLW      49
	MOVWF      ?lstr1_MAIN+12
	MOVLW      52
	MOVWF      ?lstr1_MAIN+13
	MOVLW      32
	MOVWF      ?lstr1_MAIN+14
	MOVLW      60
	MOVWF      ?lstr1_MAIN+15
	CLRF       ?lstr1_MAIN+16
	MOVLW      ?lstr1_MAIN+0
	MOVWF      _text+0
;MAIN.c,35 :: 		Lcd_Out(1,1,text);             // WRITE THE FIRST MESSAGE IN THE FIRST LINE
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MAIN.c,36 :: 		text = "LCD   VOLTIMETRO";     // DEFINE THE SECOND MESSAGE
	MOVLW      76
	MOVWF      ?lstr2_MAIN+0
	MOVLW      67
	MOVWF      ?lstr2_MAIN+1
	MOVLW      68
	MOVWF      ?lstr2_MAIN+2
	MOVLW      32
	MOVWF      ?lstr2_MAIN+3
	MOVLW      32
	MOVWF      ?lstr2_MAIN+4
	MOVLW      32
	MOVWF      ?lstr2_MAIN+5
	MOVLW      86
	MOVWF      ?lstr2_MAIN+6
	MOVLW      79
	MOVWF      ?lstr2_MAIN+7
	MOVLW      76
	MOVWF      ?lstr2_MAIN+8
	MOVLW      84
	MOVWF      ?lstr2_MAIN+9
	MOVLW      73
	MOVWF      ?lstr2_MAIN+10
	MOVLW      77
	MOVWF      ?lstr2_MAIN+11
	MOVLW      69
	MOVWF      ?lstr2_MAIN+12
	MOVLW      84
	MOVWF      ?lstr2_MAIN+13
	MOVLW      82
	MOVWF      ?lstr2_MAIN+14
	MOVLW      79
	MOVWF      ?lstr2_MAIN+15
	CLRF       ?lstr2_MAIN+16
	MOVLW      ?lstr2_MAIN+0
	MOVWF      _text+0
;MAIN.c,37 :: 		Lcd_Out(2,1,text);             // DEFINE THE FIRST MESSAGE
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MAIN.c,38 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;MAIN.c,39 :: 		text = "TENSAO: ";             // DEFINE THE THIRD MESSAGE
	MOVLW      84
	MOVWF      ?lstr3_MAIN+0
	MOVLW      69
	MOVWF      ?lstr3_MAIN+1
	MOVLW      78
	MOVWF      ?lstr3_MAIN+2
	MOVLW      83
	MOVWF      ?lstr3_MAIN+3
	MOVLW      65
	MOVWF      ?lstr3_MAIN+4
	MOVLW      79
	MOVWF      ?lstr3_MAIN+5
	MOVLW      58
	MOVWF      ?lstr3_MAIN+6
	MOVLW      32
	MOVWF      ?lstr3_MAIN+7
	CLRF       ?lstr3_MAIN+8
	MOVLW      ?lstr3_MAIN+0
	MOVWF      _text+0
;MAIN.c,40 :: 		while (1) {                      // ENDLESS LOOP START
L_main1:
;MAIN.c,41 :: 		adc_rd = ADC_Read(0);        // ADC PIN RA0 IS AN INPUT.
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_rd+0
	MOVF       R0+1, 0
	MOVWF      _adc_rd+1
;MAIN.c,42 :: 		Lcd_Out(2,1, text);          // WRITE RESULT IN THE SECOND LINE
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MAIN.c,43 :: 		tlong = (long)adc_rd * 5000; // CONVERT THE RESULT IN MILLIVOLTS
	MOVF       _adc_rd+0, 0
	MOVWF      R0+0
	MOVF       _adc_rd+1, 0
	MOVWF      R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVLW      136
	MOVWF      R4+0
	MOVLW      19
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _tlong+0
	MOVF       R0+1, 0
	MOVWF      _tlong+1
	MOVF       R0+2, 0
	MOVWF      _tlong+2
	MOVF       R0+3, 0
	MOVWF      _tlong+3
;MAIN.c,44 :: 		tlong = tlong / 1023;        // 0..1023 -> 0-5000mV
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	MOVF       R0+0, 0
	MOVWF      _tlong+0
	MOVF       R0+1, 0
	MOVWF      _tlong+1
	MOVF       R0+2, 0
	MOVWF      _tlong+2
	MOVF       R0+3, 0
	MOVWF      _tlong+3
;MAIN.c,45 :: 		ch = tlong / 1000;           // EXTRACT VOLTS (THOUSANDS OF MILLIVOLTS)
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	MOVF       R0+0, 0
	MOVWF      _ch+0
;MAIN.c,47 :: 		Lcd_Chr(2,9, 48 + ch);       // WRITE RESULT IN ASCII FORMAT
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;MAIN.c,48 :: 		Lcd_Chr_CP(',');             // WRITE "," AT CURSOR POSITION
	MOVLW      44
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;MAIN.c,49 :: 		ch = (tlong / 100) % 10;     // EXTRACT HUNDREDS OF MILLIVOLTS
	MOVLW      100
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _tlong+0, 0
	MOVWF      R0+0
	MOVF       _tlong+1, 0
	MOVWF      R0+1
	MOVF       _tlong+2, 0
	MOVWF      R0+2
	MOVF       _tlong+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _ch+0
;MAIN.c,50 :: 		Lcd_Chr_CP(48 + ch);         // WRITE RESULT IN ASCII FORMAT
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;MAIN.c,51 :: 		ch = (tlong / 10) % 10;      // EXTRACT TENS OF MILLIVOLTS
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _tlong+0, 0
	MOVWF      R0+0
	MOVF       _tlong+1, 0
	MOVWF      R0+1
	MOVF       _tlong+2, 0
	MOVWF      R0+2
	MOVF       _tlong+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _ch+0
;MAIN.c,52 :: 		Lcd_Chr_CP(48 + ch);         // WRITE RESULT IN ASCII FORMAT
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;MAIN.c,53 :: 		ch = tlong % 10;             // EXTRACT DIGITS FOR MILLIVOLTS
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	MOVF       _tlong+0, 0
	MOVWF      R0+0
	MOVF       _tlong+1, 0
	MOVWF      R0+1
	MOVF       _tlong+2, 0
	MOVWF      R0+2
	MOVF       _tlong+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R8+2, 0
	MOVWF      R0+2
	MOVF       R8+3, 0
	MOVWF      R0+3
	MOVF       R0+0, 0
	MOVWF      _ch+0
;MAIN.c,54 :: 		Lcd_Chr_CP(48 + ch);         // WRITE RESULT IN ASCII FORMAT
	MOVF       R0+0, 0
	ADDLW      48
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;MAIN.c,55 :: 		Lcd_Out_Cp(" V ");           // WRITE " V " AT CURSOR POSITION
	MOVLW      32
	MOVWF      ?lstr4_MAIN+0
	MOVLW      86
	MOVWF      ?lstr4_MAIN+1
	MOVLW      32
	MOVWF      ?lstr4_MAIN+2
	CLRF       ?lstr4_MAIN+3
	MOVLW      ?lstr4_MAIN+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;MAIN.c,56 :: 		Delay_ms(1);                 // WAITS 1 ms
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;MAIN.c,57 :: 		}                                                       // END ENDLESS LOOP
	GOTO       L_main1
;MAIN.c,58 :: 		}                                                                   // END MAIN
L_end_main:
	GOTO       $+0
; end of _main
