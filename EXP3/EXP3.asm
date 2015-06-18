
_main:

;EXP3.c,10 :: 		void main() {
;EXP3.c,12 :: 		TRISB.RB0 = 1;
	BSF        TRISB+0, 0
;EXP3.c,13 :: 		TRISB.RB1 = 1;
	BSF        TRISB+0, 1
;EXP3.c,14 :: 		TRISB.RB2 = 1;
	BSF        TRISB+0, 2
;EXP3.c,15 :: 		TRISD = 0;
	CLRF       TRISD+0
;EXP3.c,16 :: 		TRISE.RE0 = 0;
	BCF        TRISE+0, 0
;EXP3.c,17 :: 		TRISC.RC1 = 0;
	BCF        TRISC+0, 1
;EXP3.c,20 :: 		PORTD = 0b00000000;
	CLRF       PORTD+0
;EXP3.c,21 :: 		PORTE.RE0 = 0;
	BCF        PORTE+0, 0
;EXP3.c,22 :: 		PORTC.RC1 = 1;
	BSF        PORTC+0, 1
;EXP3.c,24 :: 		while(1) {
L_main0:
;EXP3.c,25 :: 		fazBotao1();
	CALL       _fazBotao1+0
;EXP3.c,26 :: 		fazBotao2();
	CALL       _fazBotao2+0
;EXP3.c,27 :: 		fazBotao3();
	CALL       _fazBotao3+0
;EXP3.c,28 :: 		}
	GOTO       L_main0
;EXP3.c,30 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_fazBotao1:

;EXP3.c,32 :: 		void fazBotao1() {
;EXP3.c,33 :: 		rebelde = PORTB.RB0;
	MOVLW      0
	BTFSC      PORTB+0, 0
	MOVLW      1
	MOVWF      _rebelde+0
	CLRF       _rebelde+1
;EXP3.c,34 :: 		while(rebelde == 0) {
L_fazBotao12:
	MOVLW      0
	XORWF      _rebelde+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__fazBotao112
	MOVLW      0
	XORWF      _rebelde+0, 0
L__fazBotao112:
	BTFSS      STATUS+0, 2
	GOTO       L_fazBotao13
;EXP3.c,35 :: 		if(PORTD == 0b11111111) {
	MOVF       PORTD+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_fazBotao14
;EXP3.c,36 :: 		for(i = 0; i < 100; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_fazBotao15:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__fazBotao113
	MOVLW      100
	SUBWF      _i+0, 0
L__fazBotao113:
	BTFSC      STATUS+0, 0
	GOTO       L_fazBotao16
;EXP3.c,37 :: 		PORTC.RC1 = 1;
	BSF        PORTC+0, 1
;EXP3.c,38 :: 		VDelay_ms(i);
	MOVF       _i+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _i+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;EXP3.c,39 :: 		PORTC.RC1 = 0;
	BCF        PORTC+0, 1
;EXP3.c,40 :: 		VDelay_ms(i);
	MOVF       _i+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       _i+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;EXP3.c,36 :: 		for(i = 0; i < 100; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;EXP3.c,41 :: 		}
	GOTO       L_fazBotao15
L_fazBotao16:
;EXP3.c,42 :: 		}
L_fazBotao14:
;EXP3.c,43 :: 		rebelde = PORTB.RB0;
	MOVLW      0
	BTFSC      PORTB+0, 0
	MOVLW      1
	MOVWF      _rebelde+0
	CLRF       _rebelde+1
;EXP3.c,44 :: 		PORTD = PORTD + 0b00000001;
	INCF       PORTD+0, 1
;EXP3.c,45 :: 		PORTC.RC1 = 1;
	BSF        PORTC+0, 1
;EXP3.c,46 :: 		PORTE.RE0 = 0;
	BCF        PORTE+0, 0
;EXP3.c,47 :: 		Delay_ms(30);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_fazBotao18:
	DECFSZ     R13+0, 1
	GOTO       L_fazBotao18
	DECFSZ     R12+0, 1
	GOTO       L_fazBotao18
;EXP3.c,48 :: 		PORTC.RC1 = 0;
	BCF        PORTC+0, 1
;EXP3.c,49 :: 		PORTE.RE0 = 1;
	BSF        PORTE+0, 0
;EXP3.c,50 :: 		Delay_ms(30);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_fazBotao19:
	DECFSZ     R13+0, 1
	GOTO       L_fazBotao19
	DECFSZ     R12+0, 1
	GOTO       L_fazBotao19
;EXP3.c,51 :: 		}
	GOTO       L_fazBotao12
L_fazBotao13:
;EXP3.c,52 :: 		}
L_end_fazBotao1:
	RETURN
; end of _fazBotao1

_fazBotao2:

;EXP3.c,54 :: 		void fazBotao2() {
;EXP3.c,55 :: 		eu = PORTB.RB1;
	MOVLW      0
	BTFSC      PORTB+0, 1
	MOVLW      1
	MOVWF      _eu+0
	CLRF       _eu+1
;EXP3.c,56 :: 		PORTE.RE0 = eu;
	BTFSC      _eu+0, 0
	GOTO       L__fazBotao215
	BCF        PORTE+0, 0
	GOTO       L__fazBotao216
L__fazBotao215:
	BSF        PORTE+0, 0
L__fazBotao216:
;EXP3.c,57 :: 		}
L_end_fazBotao2:
	RETURN
; end of _fazBotao2

_fazBotao3:

;EXP3.c,59 :: 		void fazBotao3() {
;EXP3.c,60 :: 		sou = PORTB.RB2;
	MOVLW      0
	BTFSC      PORTB+0, 2
	MOVLW      1
	MOVWF      _sou+0
	CLRF       _sou+1
;EXP3.c,61 :: 		PORTC.RC1 = sou;
	BTFSC      _sou+0, 0
	GOTO       L__fazBotao318
	BCF        PORTC+0, 1
	GOTO       L__fazBotao319
L__fazBotao318:
	BSF        PORTC+0, 1
L__fazBotao319:
;EXP3.c,62 :: 		}
L_end_fazBotao3:
	RETURN
; end of _fazBotao3
