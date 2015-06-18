
_Delay2s:

;Internal_EEPROM.c,32 :: 		void Delay2s(){
;Internal_EEPROM.c,33 :: 		Delay_ms(2000);}
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_Delay2s0:
	DECFSZ     R13+0, 1
	GOTO       L_Delay2s0
	DECFSZ     R12+0, 1
	GOTO       L_Delay2s0
	DECFSZ     R11+0, 1
	GOTO       L_Delay2s0
	NOP
	NOP
L_end_Delay2s:
	RETURN
; end of _Delay2s

_Debounce:

;Internal_EEPROM.c,34 :: 		void Debounce(){
;Internal_EEPROM.c,35 :: 		Delay_ms(100);}
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_Debounce1:
	DECFSZ     R13+0, 1
	GOTO       L_Debounce1
	DECFSZ     R12+0, 1
	GOTO       L_Debounce1
	NOP
	NOP
L_end_Debounce:
	RETURN
; end of _Debounce

_main:

;Internal_EEPROM.c,36 :: 		void main() {
;Internal_EEPROM.c,37 :: 		PORTB = 0;  PORTA = 0;    TRISB = 0b00001111;    TRISA = 0b00100000;
	CLRF       PORTB+0
	CLRF       PORTA+0
	MOVLW      15
	MOVWF      TRISB+0
	MOVLW      32
	MOVWF      TRISA+0
;Internal_EEPROM.c,38 :: 		CMCON=0x07; Lcd_Init();            // Initialize LCD
	MOVLW      7
	MOVWF      CMCON+0
	CALL       _Lcd_Init+0
;Internal_EEPROM.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Internal_EEPROM.c,40 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Turn cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Internal_EEPROM.c,41 :: 		Lcd_Out(1, 1, "Lab 13: Testing"); Lcd_Out(2, 1, "internal EEPROM");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      76
	MOVWF      ?lstr1_Internal_EEPROM+0
	MOVLW      97
	MOVWF      ?lstr1_Internal_EEPROM+1
	MOVLW      98
	MOVWF      ?lstr1_Internal_EEPROM+2
	MOVLW      32
	MOVWF      ?lstr1_Internal_EEPROM+3
	MOVLW      49
	MOVWF      ?lstr1_Internal_EEPROM+4
	MOVLW      51
	MOVWF      ?lstr1_Internal_EEPROM+5
	MOVLW      58
	MOVWF      ?lstr1_Internal_EEPROM+6
	MOVLW      32
	MOVWF      ?lstr1_Internal_EEPROM+7
	MOVLW      84
	MOVWF      ?lstr1_Internal_EEPROM+8
	MOVLW      101
	MOVWF      ?lstr1_Internal_EEPROM+9
	MOVLW      115
	MOVWF      ?lstr1_Internal_EEPROM+10
	MOVLW      116
	MOVWF      ?lstr1_Internal_EEPROM+11
	MOVLW      105
	MOVWF      ?lstr1_Internal_EEPROM+12
	MOVLW      110
	MOVWF      ?lstr1_Internal_EEPROM+13
	MOVLW      103
	MOVWF      ?lstr1_Internal_EEPROM+14
	CLRF       ?lstr1_Internal_EEPROM+15
	MOVLW      ?lstr1_Internal_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      105
	MOVWF      ?lstr2_Internal_EEPROM+0
	MOVLW      110
	MOVWF      ?lstr2_Internal_EEPROM+1
	MOVLW      116
	MOVWF      ?lstr2_Internal_EEPROM+2
	MOVLW      101
	MOVWF      ?lstr2_Internal_EEPROM+3
	MOVLW      114
	MOVWF      ?lstr2_Internal_EEPROM+4
	MOVLW      110
	MOVWF      ?lstr2_Internal_EEPROM+5
	MOVLW      97
	MOVWF      ?lstr2_Internal_EEPROM+6
	MOVLW      108
	MOVWF      ?lstr2_Internal_EEPROM+7
	MOVLW      32
	MOVWF      ?lstr2_Internal_EEPROM+8
	MOVLW      69
	MOVWF      ?lstr2_Internal_EEPROM+9
	MOVLW      69
	MOVWF      ?lstr2_Internal_EEPROM+10
	MOVLW      80
	MOVWF      ?lstr2_Internal_EEPROM+11
	MOVLW      82
	MOVWF      ?lstr2_Internal_EEPROM+12
	MOVLW      79
	MOVWF      ?lstr2_Internal_EEPROM+13
	MOVLW      77
	MOVWF      ?lstr2_Internal_EEPROM+14
	CLRF       ?lstr2_Internal_EEPROM+15
	MOVLW      ?lstr2_Internal_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Internal_EEPROM.c,42 :: 		Delay2s();
	CALL       _Delay2s+0
;Internal_EEPROM.c,43 :: 		start:
___main_start:
;Internal_EEPROM.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Internal_EEPROM.c,45 :: 		Lcd_Out(1,1,message1);             // Write message1 in 1st row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _message1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Internal_EEPROM.c,46 :: 		Lcd_Out(1,8,message2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _message2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Internal_EEPROM.c,47 :: 		Lcd_Out(2,1,message3);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _message3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Internal_EEPROM.c,48 :: 		do{  // READ OPERATION
L_main2:
;Internal_EEPROM.c,49 :: 		if (!SW1) {
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main5
;Internal_EEPROM.c,50 :: 		Debounce();
	CALL       _Debounce+0
;Internal_EEPROM.c,51 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Internal_EEPROM.c,52 :: 		Lcd_Out(1,1,message5);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _message5+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Internal_EEPROM.c,53 :: 		ADD = 0;
	CLRF       _ADD+0
	CLRF       _ADD+1
;Internal_EEPROM.c,54 :: 		for (i=0; i<16; i++) {
	CLRF       _i+0
L_main6:
	MOVLW      16
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;Internal_EEPROM.c,55 :: 		temp = EEPROM_Read(ADD+i);
	MOVF       _i+0, 0
	ADDWF      _ADD+0, 0
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
;Internal_EEPROM.c,56 :: 		Edata[i] = temp;      }
	MOVF       _i+0, 0
	ADDLW      _Edata+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Internal_EEPROM.c,54 :: 		for (i=0; i<16; i++) {
	INCF       _i+0, 1
;Internal_EEPROM.c,56 :: 		Edata[i] = temp;      }
	GOTO       L_main6
L_main7:
;Internal_EEPROM.c,57 :: 		Lcd_Out(2,1,Edata);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _Edata+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Internal_EEPROM.c,58 :: 		Delay2s();
	CALL       _Delay2s+0
;Internal_EEPROM.c,59 :: 		goto start;   }
	GOTO       ___main_start
L_main5:
;Internal_EEPROM.c,60 :: 		if (!SW2) {    // WRITE OPERATION
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_main9
;Internal_EEPROM.c,61 :: 		Debounce();
	CALL       _Debounce+0
;Internal_EEPROM.c,62 :: 		ADD = 0;
	CLRF       _ADD+0
	CLRF       _ADD+1
;Internal_EEPROM.c,63 :: 		for (i=0; i<16; i++) {
	CLRF       _i+0
L_main10:
	MOVLW      16
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;Internal_EEPROM.c,64 :: 		temp = message7[i];
	MOVF       _i+0, 0
	ADDLW      _message7+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
;Internal_EEPROM.c,65 :: 		EEPROM_Write(ADD+i,temp);      }
	MOVF       _i+0, 0
	ADDWF      _ADD+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       R0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Internal_EEPROM.c,63 :: 		for (i=0; i<16; i++) {
	INCF       _i+0, 1
;Internal_EEPROM.c,65 :: 		EEPROM_Write(ADD+i,temp);      }
	GOTO       L_main10
L_main11:
;Internal_EEPROM.c,66 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Internal_EEPROM.c,67 :: 		Lcd_Out(1,1,message4);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _message4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Internal_EEPROM.c,68 :: 		Delay2s();
	CALL       _Delay2s+0
;Internal_EEPROM.c,69 :: 		goto start;   }
	GOTO       ___main_start
L_main9:
;Internal_EEPROM.c,70 :: 		if (!SW3) {    // DELETE OPERATION
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_main13
;Internal_EEPROM.c,71 :: 		Debounce();
	CALL       _Debounce+0
;Internal_EEPROM.c,72 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Internal_EEPROM.c,73 :: 		Lcd_Out(1,1,message6);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _message6+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Internal_EEPROM.c,74 :: 		for (i=0; i<16; i++) {
	CLRF       _i+0
L_main14:
	MOVLW      16
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main15
;Internal_EEPROM.c,75 :: 		temp = '0';
	MOVLW      48
	MOVWF      _temp+0
;Internal_EEPROM.c,76 :: 		EEPROM_Write(ADD+i, temp);      }
	MOVF       _i+0, 0
	ADDWF      _ADD+0, 0
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVLW      48
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;Internal_EEPROM.c,74 :: 		for (i=0; i<16; i++) {
	INCF       _i+0, 1
;Internal_EEPROM.c,76 :: 		EEPROM_Write(ADD+i, temp);      }
	GOTO       L_main14
L_main15:
;Internal_EEPROM.c,77 :: 		Delay2s() ;
	CALL       _Delay2s+0
;Internal_EEPROM.c,78 :: 		goto start;   } } while(1);}
	GOTO       ___main_start
L_main13:
	GOTO       L_main2
L_end_main:
	GOTO       $+0
; end of _main
