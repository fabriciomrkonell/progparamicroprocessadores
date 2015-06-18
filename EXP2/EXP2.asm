
_main:

;EXP2.c,3 :: 		void main() {
;EXP2.c,5 :: 		TRISC.RC0 = 0;
	BCF        TRISC+0, 0
;EXP2.c,6 :: 		TRISE.RD0 = 0;
	BCF        TRISE+0, 0
;EXP2.c,8 :: 		while(1) {
L_main0:
;EXP2.c,9 :: 		PORTC.RC0 = 1;
	BSF        PORTC+0, 0
;EXP2.c,10 :: 		PORTE.RE0 = 0;
	BCF        PORTE+0, 0
;EXP2.c,11 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;EXP2.c,12 :: 		PORTC.RC0 = 0;
	BCF        PORTC+0, 0
;EXP2.c,13 :: 		PORTE.RE0 = 1;
	BSF        PORTE+0, 0
;EXP2.c,14 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;EXP2.c,15 :: 		}
	GOTO       L_main0
;EXP2.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
