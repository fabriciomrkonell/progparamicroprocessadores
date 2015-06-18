
_main:

;EXP5.c,3 :: 		void main() {
;EXP5.c,5 :: 		ADCON1 = 0x06;
	MOVLW      6
	MOVWF      ADCON1+0
;EXP5.c,6 :: 		TRISA.RA2 = 0;
	BCF        TRISA+0, 2
;EXP5.c,7 :: 		TRISA.RA3 = 0;
	BCF        TRISA+0, 3
;EXP5.c,8 :: 		TRISA.RA4 = 0;
	BCF        TRISA+0, 4
;EXP5.c,9 :: 		TRISA.RA5 = 0;
	BCF        TRISA+0, 5
;EXP5.c,10 :: 		TRISD = 0;
	CLRF       TRISD+0
;EXP5.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
