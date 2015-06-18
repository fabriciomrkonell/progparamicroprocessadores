
_main:

;EXP4.c,6 :: 		void main() {
;EXP4.c,8 :: 		ADCON1 = 0x06;
	MOVLW      6
	MOVWF      ADCON1+0
;EXP4.c,9 :: 		TRISA.RA2 = 0;
	BCF        TRISA+0, 2
;EXP4.c,10 :: 		TRISA.RA3 = 0;
	BCF        TRISA+0, 3
;EXP4.c,11 :: 		TRISA.RA4 = 0;
	BCF        TRISA+0, 4
;EXP4.c,12 :: 		TRISA.RA5 = 0;
	BCF        TRISA+0, 5
;EXP4.c,13 :: 		TRISD = 0;
	CLRF       TRISD+0
;EXP4.c,15 :: 		TRISC.RC1 = 0;
	BCF        TRISC+0, 1
;EXP4.c,17 :: 		PORTC.RC1 = 1;
	BSF        PORTC+0, 1
;EXP4.c,19 :: 		while(1) {
L_main0:
;EXP4.c,21 :: 		while(time < 200) {
L_main2:
	MOVLW      128
	XORWF      _time+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      200
	SUBWF      _time+0, 0
L__main20:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;EXP4.c,23 :: 		if(count % 10 != 0) {
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      0
	XORWF      R0+0, 0
L__main21:
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;EXP4.c,24 :: 		PORTD = numbers[count % 10];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;EXP4.c,25 :: 		PORTA.RA5 = 1;
	BSF        PORTA+0, 5
;EXP4.c,26 :: 		if(count % 10 == 5) {
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      5
	XORWF      R0+0, 0
L__main22:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;EXP4.c,27 :: 		PORTC.RC1 = 1;
	BSF        PORTC+0, 1
;EXP4.c,28 :: 		}
L_main5:
;EXP4.c,29 :: 		} else {
	GOTO       L_main6
L_main4:
;EXP4.c,30 :: 		PORTD = numbers[0];
	MOVF       _numbers+0, 0
	MOVWF      PORTD+0
;EXP4.c,31 :: 		PORTA.RA5 = 1;
	BSF        PORTA+0, 5
;EXP4.c,32 :: 		PORTC.RC1 = 0;
	BCF        PORTC+0, 1
;EXP4.c,33 :: 		}
L_main6:
;EXP4.c,34 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
;EXP4.c,35 :: 		PORTA.RA5 = 0;
	BCF        PORTA+0, 5
;EXP4.c,37 :: 		if(count % 100 != 0) {
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      0
	XORWF      R0+0, 0
L__main23:
	BTFSC      STATUS+0, 2
	GOTO       L_main8
;EXP4.c,38 :: 		tempDec = (int) (count % 100) / 10;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _tempDec+0
	MOVF       R0+1, 0
	MOVWF      _tempDec+1
;EXP4.c,39 :: 		PORTD = numbers[tempDec];
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;EXP4.c,40 :: 		PORTA.RA4 = 1;
	BSF        PORTA+0, 4
;EXP4.c,41 :: 		} else {
	GOTO       L_main9
L_main8:
;EXP4.c,42 :: 		PORTD = numbers[0];
	MOVF       _numbers+0, 0
	MOVWF      PORTD+0
;EXP4.c,43 :: 		PORTA.RA4 = 1;
	BSF        PORTA+0, 4
;EXP4.c,44 :: 		}
L_main9:
;EXP4.c,45 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
	NOP
;EXP4.c,46 :: 		PORTA.RA4 = 0;
	BCF        PORTA+0, 4
;EXP4.c,48 :: 		if(count % 1000 != 0) {
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      0
	XORWF      R0+0, 0
L__main24:
	BTFSC      STATUS+0, 2
	GOTO       L_main11
;EXP4.c,49 :: 		tempCent = (int) (count % 1000) / 100;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _tempCent+0
	MOVF       R0+1, 0
	MOVWF      _tempCent+1
;EXP4.c,50 :: 		PORTD = numbers[tempCent];
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;EXP4.c,51 :: 		PORTA.RA3 = 1;
	BSF        PORTA+0, 3
;EXP4.c,52 :: 		} else {
	GOTO       L_main12
L_main11:
;EXP4.c,53 :: 		PORTD = numbers[0];
	MOVF       _numbers+0, 0
	MOVWF      PORTD+0
;EXP4.c,54 :: 		PORTA.RA3 = 1;
	BSF        PORTA+0, 3
;EXP4.c,55 :: 		}
L_main12:
;EXP4.c,56 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	NOP
;EXP4.c,57 :: 		PORTA.RA3 = 0;
	BCF        PORTA+0, 3
;EXP4.c,59 :: 		if(count % 10000 != 0) {
	MOVLW      16
	MOVWF      R4+0
	MOVLW      39
	MOVWF      R4+1
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      0
	XORWF      R0+0, 0
L__main25:
	BTFSC      STATUS+0, 2
	GOTO       L_main14
;EXP4.c,60 :: 		tempCent = (int) (count % 10000) / 1000;
	MOVLW      16
	MOVWF      R4+0
	MOVLW      39
	MOVWF      R4+1
	MOVF       _count+0, 0
	MOVWF      R0+0
	MOVF       _count+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _tempCent+0
	MOVF       R0+1, 0
	MOVWF      _tempCent+1
;EXP4.c,61 :: 		PORTD = numbers[tempCent];
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _numbers+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;EXP4.c,62 :: 		PORTA.RA2 = 1;
	BSF        PORTA+0, 2
;EXP4.c,63 :: 		} else {
	GOTO       L_main15
L_main14:
;EXP4.c,64 :: 		PORTD = numbers[0];
	MOVF       _numbers+0, 0
	MOVWF      PORTD+0
;EXP4.c,65 :: 		PORTA.RA2 = 1;
	BSF        PORTA+0, 2
;EXP4.c,66 :: 		}
L_main15:
;EXP4.c,67 :: 		Delay_ms(2);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      48
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
;EXP4.c,68 :: 		PORTA.RA2 = 0;
	BCF        PORTA+0, 2
;EXP4.c,70 :: 		time += 50;
	MOVLW      50
	ADDWF      _time+0, 1
	BTFSC      STATUS+0, 0
	INCF       _time+1, 1
;EXP4.c,71 :: 		}
	GOTO       L_main2
L_main3:
;EXP4.c,72 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;EXP4.c,74 :: 		if(count >= 10000) count = 0;
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      39
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVLW      16
	SUBWF      _count+0, 0
L__main26:
	BTFSS      STATUS+0, 0
	GOTO       L_main17
	CLRF       _count+0
	CLRF       _count+1
L_main17:
;EXP4.c,75 :: 		if(time >= 200) time = 0;
	MOVLW      128
	XORWF      _time+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      200
	SUBWF      _time+0, 0
L__main27:
	BTFSS      STATUS+0, 0
	GOTO       L_main18
	CLRF       _time+0
	CLRF       _time+1
L_main18:
;EXP4.c,77 :: 		PORTA.RA2 = 0;
	BCF        PORTA+0, 2
;EXP4.c,78 :: 		PORTA.RA3 = 0;
	BCF        PORTA+0, 3
;EXP4.c,79 :: 		PORTA.RA4 = 0;
	BCF        PORTA+0, 4
;EXP4.c,82 :: 		}
	GOTO       L_main0
;EXP4.c,84 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
