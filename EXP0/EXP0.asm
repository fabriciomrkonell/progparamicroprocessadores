
_main:

;EXP0.c,5 :: 		void main() {
;EXP0.c,7 :: 		int count = 0;
	CLRF       main_count_L0+0
	CLRF       main_count_L0+1
;EXP0.c,9 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;EXP0.c,10 :: 		TRISD = 0b00000000;
	CLRF       TRISD+0
;EXP0.c,11 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;EXP0.c,12 :: 		PORTD = 0b00000000;
	CLRF       PORTD+0
;EXP0.c,14 :: 		while(t % (time + 1) != 0) {
L_main0:
	MOVF       _time+0, 0
	ADDLW      1
	MOVWF      R4+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _time+1, 0
	MOVWF      R4+1
	MOVF       _t+0, 0
	MOVWF      R0+0
	MOVF       _t+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVLW      0
	XORWF      R0+0, 0
L__main9:
	BTFSC      STATUS+0, 2
	GOTO       L_main1
;EXP0.c,16 :: 		int fact = 0;
	CLRF       main_fact_L1+0
	CLRF       main_fact_L1+1
;EXP0.c,17 :: 		while(fact < 20) {
L_main2:
	MOVLW      128
	XORWF      main_fact_L1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      20
	SUBWF      main_fact_L1+0, 0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;EXP0.c,18 :: 		PORTB = 0b00000001 * pot(2, count);
	MOVLW      2
	MOVWF      FARG_pot_val+0
	MOVLW      0
	MOVWF      FARG_pot_val+1
	MOVF       main_count_L0+0, 0
	MOVWF      FARG_pot_power+0
	MOVF       main_count_L0+1, 0
	MOVWF      FARG_pot_power+1
	CALL       _pot+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;EXP0.c,19 :: 		PORTD = 0b00000001 * pot(2, 7 - count);
	MOVLW      2
	MOVWF      FARG_pot_val+0
	MOVLW      0
	MOVWF      FARG_pot_val+1
	MOVF       main_count_L0+0, 0
	SUBLW      7
	MOVWF      FARG_pot_power+0
	MOVF       main_count_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	CLRF       FARG_pot_power+1
	SUBWF      FARG_pot_power+1, 1
	CALL       _pot+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;EXP0.c,20 :: 		VDelay_ms(50);
	MOVLW      50
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVLW      0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;EXP0.c,21 :: 		fact++;
	INCF       main_fact_L1+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_fact_L1+1, 1
;EXP0.c,22 :: 		count++;
	INCF       main_count_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_count_L0+1, 1
;EXP0.c,23 :: 		if(count == 8) count = 0;
	MOVLW      0
	XORWF      main_count_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      8
	XORWF      main_count_L0+0, 0
L__main11:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	CLRF       main_count_L0+0
	CLRF       main_count_L0+1
L_main4:
;EXP0.c,24 :: 		}
	GOTO       L_main2
L_main3:
;EXP0.c,26 :: 		t++;
	INCF       _t+0, 1
	BTFSC      STATUS+0, 2
	INCF       _t+1, 1
;EXP0.c,27 :: 		}
	GOTO       L_main0
L_main1:
;EXP0.c,29 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;EXP0.c,30 :: 		PORTD = 0b00000000;
	CLRF       PORTD+0
;EXP0.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_pot:

;EXP0.c,34 :: 		int pot(int val, int power) {
;EXP0.c,35 :: 		int ret = val, i = 1;
	MOVF       FARG_pot_val+0, 0
	MOVWF      pot_ret_L0+0
	MOVF       FARG_pot_val+1, 0
	MOVWF      pot_ret_L0+1
	MOVLW      1
	MOVWF      pot_i_L0+0
	MOVLW      0
	MOVWF      pot_i_L0+1
;EXP0.c,36 :: 		if(power == 0) return 1;
	MOVLW      0
	XORWF      FARG_pot_power+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pot13
	MOVLW      0
	XORWF      FARG_pot_power+0, 0
L__pot13:
	BTFSS      STATUS+0, 2
	GOTO       L_pot5
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_pot
L_pot5:
;EXP0.c,37 :: 		while(i < power) {
L_pot6:
	MOVLW      128
	XORWF      pot_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_pot_power+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__pot14
	MOVF       FARG_pot_power+0, 0
	SUBWF      pot_i_L0+0, 0
L__pot14:
	BTFSC      STATUS+0, 0
	GOTO       L_pot7
;EXP0.c,38 :: 		ret *= val;
	MOVF       pot_ret_L0+0, 0
	MOVWF      R0+0
	MOVF       pot_ret_L0+1, 0
	MOVWF      R0+1
	MOVF       FARG_pot_val+0, 0
	MOVWF      R4+0
	MOVF       FARG_pot_val+1, 0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      pot_ret_L0+0
	MOVF       R0+1, 0
	MOVWF      pot_ret_L0+1
;EXP0.c,39 :: 		i++;
	INCF       pot_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       pot_i_L0+1, 1
;EXP0.c,40 :: 		}
	GOTO       L_pot6
L_pot7:
;EXP0.c,41 :: 		return ret;
	MOVF       pot_ret_L0+0, 0
	MOVWF      R0+0
	MOVF       pot_ret_L0+1, 0
	MOVWF      R0+1
;EXP0.c,42 :: 		}
L_end_pot:
	RETURN
; end of _pot
