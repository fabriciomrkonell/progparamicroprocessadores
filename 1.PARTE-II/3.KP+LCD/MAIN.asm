
_keypad_read:

;MAIN.c,22 :: 		unsigned char keypad_read(void){
;MAIN.c,24 :: 		KP_R1 = 0;      // SCAN KEYPAD ON FIRST ROW: 1, 2, 3, A
	BCF        PORTD+0, 0
;MAIN.c,25 :: 		KP_R2 = 1;      KP_R3 = 1;     KP_R4 = 1;
	BSF        PORTD+0, 1
	BSF        PORTD+0, 2
	BSF        PORTD+0, 3
;MAIN.c,26 :: 		VDelay_ms(t);
	MOVF       _t+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	CLRF       FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;MAIN.c,27 :: 		if (KP_C1 == 0) return '*';    // KEY '*' IS PRESSED
	BTFSC      PORTB+0, 0
	GOTO       L_keypad_read0
	MOVLW      42
	MOVWF      R0+0
	GOTO       L_end_keypad_read
L_keypad_read0:
;MAIN.c,28 :: 		if (KP_C2 == 0) return '0';    // KEY '0' IS PRESSED
	BTFSC      PORTB+0, 1
	GOTO       L_keypad_read1
	MOVLW      48
	MOVWF      R0+0
	GOTO       L_end_keypad_read
L_keypad_read1:
;MAIN.c,29 :: 		if (KP_C3 == 0) return '#';    // KEY '#' IS PRESSED
	BTFSC      PORTB+0, 2
	GOTO       L_keypad_read2
	MOVLW      35
	MOVWF      R0+0
	GOTO       L_end_keypad_read
L_keypad_read2:
;MAIN.c,30 :: 		VDelay_ms(t);
	MOVF       _t+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	CLRF       FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;MAIN.c,31 :: 		KP_R1 = 1;      // SCAN KEYPAD ON SECOND ROW: 1, 2, 3, A
	BSF        PORTD+0, 0
;MAIN.c,32 :: 		KP_R2 = 0;      KP_R3 = 1;     KP_R4 = 1;
	BCF        PORTD+0, 1
	BSF        PORTD+0, 2
	BSF        PORTD+0, 3
;MAIN.c,33 :: 		VDelay_ms(t);
	MOVF       _t+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	CLRF       FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;MAIN.c,34 :: 		if (KP_C1 == 0) return '7';    // KEY '7' IS PRESSED
	BTFSC      PORTB+0, 0
	GOTO       L_keypad_read3
	MOVLW      55
	MOVWF      R0+0
	GOTO       L_end_keypad_read
L_keypad_read3:
;MAIN.c,35 :: 		if (KP_C2 == 0) return '8';    // KEY '8' IS PRESSED
	BTFSC      PORTB+0, 1
	GOTO       L_keypad_read4
	MOVLW      56
	MOVWF      R0+0
	GOTO       L_end_keypad_read
L_keypad_read4:
;MAIN.c,36 :: 		if (KP_C3 == 0) return '9';    // KEY '9' IS PRESSED
	BTFSC      PORTB+0, 2
	GOTO       L_keypad_read5
	MOVLW      57
	MOVWF      R0+0
	GOTO       L_end_keypad_read
L_keypad_read5:
;MAIN.c,37 :: 		VDelay_ms(t);
	MOVF       _t+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	CLRF       FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;MAIN.c,38 :: 		KP_R1 = 1;      // SCAN KEYPAD ON THIRD ROW: 1, 2, 3, A
	BSF        PORTD+0, 0
;MAIN.c,39 :: 		KP_R2 = 1;      KP_R3 = 0;     KP_R4 = 1;
	BSF        PORTD+0, 1
	BCF        PORTD+0, 2
	BSF        PORTD+0, 3
;MAIN.c,40 :: 		VDelay_ms(t);
	MOVF       _t+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	CLRF       FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;MAIN.c,41 :: 		if (KP_C1 == 0) return '4';    // KEY '4' IS PRESSED
	BTFSC      PORTB+0, 0
	GOTO       L_keypad_read6
	MOVLW      52
	MOVWF      R0+0
	GOTO       L_end_keypad_read
L_keypad_read6:
;MAIN.c,42 :: 		if (KP_C2 == 0) return '5';    // KEY '5' IS PRESSED
	BTFSC      PORTB+0, 1
	GOTO       L_keypad_read7
	MOVLW      53
	MOVWF      R0+0
	GOTO       L_end_keypad_read
L_keypad_read7:
;MAIN.c,43 :: 		if (KP_C3 == 0) return '6';    // KEY '6' IS PRESSED
	BTFSC      PORTB+0, 2
	GOTO       L_keypad_read8
	MOVLW      54
	MOVWF      R0+0
	GOTO       L_end_keypad_read
L_keypad_read8:
;MAIN.c,44 :: 		VDelay_ms(t);
	MOVF       _t+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	CLRF       FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;MAIN.c,45 :: 		KP_R1 = 1;      // SCAN KEYPAD ON FOURTH ROW: 1, 2, 3, A
	BSF        PORTD+0, 0
;MAIN.c,46 :: 		KP_R2 = 1;      KP_R3 = 1;     KP_R4 = 0;
	BSF        PORTD+0, 1
	BSF        PORTD+0, 2
	BCF        PORTD+0, 3
;MAIN.c,47 :: 		VDelay_ms(t);
	MOVF       _t+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	CLRF       FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;MAIN.c,48 :: 		if (KP_C1 == 0) return '1';    // KEY '1' IS PRESSED
	BTFSC      PORTB+0, 0
	GOTO       L_keypad_read9
	MOVLW      49
	MOVWF      R0+0
	GOTO       L_end_keypad_read
L_keypad_read9:
;MAIN.c,49 :: 		if (KP_C2 == 0) return '2';    // KEY '2' IS PRESSED
	BTFSC      PORTB+0, 1
	GOTO       L_keypad_read10
	MOVLW      50
	MOVWF      R0+0
	GOTO       L_end_keypad_read
L_keypad_read10:
;MAIN.c,50 :: 		if (KP_C3 == 0) return '3';    // KEY '3' IS PRESSED
	BTFSC      PORTB+0, 2
	GOTO       L_keypad_read11
	MOVLW      51
	MOVWF      R0+0
	GOTO       L_end_keypad_read
L_keypad_read11:
;MAIN.c,51 :: 		VDelay_ms(t);
	MOVF       _t+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	CLRF       FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;MAIN.c,52 :: 		return 0xFF;                                   // IF NO KEY PRESS, RETURN 0xFF
	MOVLW      255
	MOVWF      R0+0
;MAIN.c,53 :: 		}                                                // KEYPAD READ FUNCTION - END
L_end_keypad_read:
	RETURN
; end of _keypad_read

_main:

;MAIN.c,55 :: 		void main(){
;MAIN.c,56 :: 		ADCON1 = 0x06;                                           // ALL I/O AS DIGITAL
	MOVLW      6
	MOVWF      ADCON1+0
;MAIN.c,57 :: 		TRISB.RB0 = 1;    TRISB.RB1 = 1;    TRISB.RB2 = 1;       // C1, C2, C3
	BSF        TRISB+0, 0
	BSF        TRISB+0, 1
	BSF        TRISB+0, 2
;MAIN.c,58 :: 		TRISD.RD0 = 0;    TRISD.RD1 = 0;    TRISD.RD2 = 0;    TRISD.RD3 = 0;  // L1-4
	BCF        TRISD+0, 0
	BCF        TRISD+0, 1
	BCF        TRISD+0, 2
	BCF        TRISD+0, 3
;MAIN.c,61 :: 		LCD_init();
	CALL       _Lcd_Init+0
;MAIN.c,62 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MAIN.c,63 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MAIN.c,64 :: 		while(1){
L_main12:
;MAIN.c,67 :: 		LCD_Out(1,1,"PRESSIONAR TECLA");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MAIN+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MAIN.c,69 :: 		LCD_cmd(_LCD_SECOND_ROW);    // GO TO 2ND ROW OF THE 16×2 LCD
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MAIN.c,70 :: 		for(i = 0; i < 17; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main14:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      17
	SUBWF      _i+0, 0
L__main24:
	BTFSC      STATUS+0, 0
	GOTO       L_main15
;MAIN.c,72 :: 		key_get = keypad_wait();
	CALL       _keypad_wait+0
	MOVF       R0+0, 0
	MOVWF      _key_get+0
;MAIN.c,74 :: 		Lcd_Chr_Cp(key_get);
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;MAIN.c,70 :: 		for(i = 0; i < 17; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MAIN.c,79 :: 		}                                                                   // END FOR
	GOTO       L_main14
L_main15:
;MAIN.c,80 :: 		LCD_cmd(_LCD_CLEAR);                                          // CLEAR THE LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MAIN.c,81 :: 		}                                                                 // END WHILE
	GOTO       L_main12
;MAIN.c,82 :: 		}                                                       // MAIN FUNCTION - END
L_end_main:
	GOTO       $+0
; end of _main

_keypad_wait:

;MAIN.c,85 :: 		unsigned char keypad_wait(void){
;MAIN.c,86 :: 		c_pressed_key = 0xFF;                        // WAIT UNTIL THE KEY IS PRESSED!
	MOVLW      255
	MOVWF      _c_pressed_key+0
;MAIN.c,87 :: 		do{c_pressed_key = keypad_read();}
L_keypad_wait17:
	CALL       _keypad_read+0
	MOVF       R0+0, 0
	MOVWF      _c_pressed_key+0
;MAIN.c,88 :: 		while(c_pressed_key == 0xFF);               // WAIT UNTIL THE KEY IS RELEASED!
	MOVF       R0+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_keypad_wait17
;MAIN.c,89 :: 		while(keypad_read() != 0xFF);
L_keypad_wait20:
	CALL       _keypad_read+0
	MOVF       R0+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_keypad_wait21
	GOTO       L_keypad_wait20
L_keypad_wait21:
;MAIN.c,90 :: 		return c_pressed_key;
	MOVF       _c_pressed_key+0, 0
	MOVWF      R0+0
;MAIN.c,91 :: 		}                                                // END "keypad_wait" FUNCTION
L_end_keypad_wait:
	RETURN
; end of _keypad_wait
