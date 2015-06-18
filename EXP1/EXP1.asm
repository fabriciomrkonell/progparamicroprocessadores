
_main:

;EXP1.c,5 :: 		void main() {
;EXP1.c,8 :: 		TRISC.RC1 = 0;
	BCF        TRISC+0, 1
;EXP1.c,10 :: 		while(1) {
L_main0:
;EXP1.c,11 :: 		for(i = 0; i < 50; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVLW      50
	SUBWF      _i+0, 0
L__main9:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;EXP1.c,12 :: 		write(0, i);
	CLRF       FARG_write_value+0
	CLRF       FARG_write_value+1
	MOVF       _i+0, 0
	MOVWF      FARG_write_time+0
	MOVF       _i+1, 0
	MOVWF      FARG_write_time+1
	CALL       _write+0
;EXP1.c,13 :: 		write(1, i);
	MOVLW      1
	MOVWF      FARG_write_value+0
	MOVLW      0
	MOVWF      FARG_write_value+1
	MOVF       _i+0, 0
	MOVWF      FARG_write_time+0
	MOVF       _i+1, 0
	MOVWF      FARG_write_time+1
	CALL       _write+0
;EXP1.c,11 :: 		for(i = 0; i < 50; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;EXP1.c,14 :: 		}
	GOTO       L_main2
L_main3:
;EXP1.c,15 :: 		for(i = 50; i > 0; i--) {
	MOVLW      50
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main5:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVF       _i+0, 0
	SUBLW      0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;EXP1.c,16 :: 		write(0, i);
	CLRF       FARG_write_value+0
	CLRF       FARG_write_value+1
	MOVF       _i+0, 0
	MOVWF      FARG_write_time+0
	MOVF       _i+1, 0
	MOVWF      FARG_write_time+1
	CALL       _write+0
;EXP1.c,17 :: 		write(1, i);
	MOVLW      1
	MOVWF      FARG_write_value+0
	MOVLW      0
	MOVWF      FARG_write_value+1
	MOVF       _i+0, 0
	MOVWF      FARG_write_time+0
	MOVF       _i+1, 0
	MOVWF      FARG_write_time+1
	CALL       _write+0
;EXP1.c,15 :: 		for(i = 50; i > 0; i--) {
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;EXP1.c,18 :: 		}
	GOTO       L_main5
L_main6:
;EXP1.c,19 :: 		}
	GOTO       L_main0
;EXP1.c,21 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_write:

;EXP1.c,24 :: 		void write(int value, int time) {
;EXP1.c,25 :: 		PORTC.RC1 = value;
	BTFSC      FARG_write_value+0, 0
	GOTO       L__write12
	BCF        PORTC+0, 1
	GOTO       L__write13
L__write12:
	BSF        PORTC+0, 1
L__write13:
;EXP1.c,26 :: 		VDelay_ms(time);
	MOVF       FARG_write_time+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_write_time+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;EXP1.c,27 :: 		}
L_end_write:
	RETURN
; end of _write
