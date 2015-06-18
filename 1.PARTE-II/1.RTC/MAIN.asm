
_BeepBeep:

;MAIN.c,40 :: 		void BeepBeep(unsigned int nTimes, unsigned int tHigh, unsigned int tLow){
;MAIN.c,41 :: 		for (i = 0; i < nTimes; i++){
	CLRF       _i+0
	CLRF       _i+1
L_BeepBeep0:
	MOVF       FARG_BeepBeep_nTimes+1, 0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__BeepBeep25
	MOVF       FARG_BeepBeep_nTimes+0, 0
	SUBWF      _i+0, 0
L__BeepBeep25:
	BTFSC      STATUS+0, 0
	GOTO       L_BeepBeep1
;MAIN.c,42 :: 		BUZZER = 0;      VDelay_ms(tHigh);     BUZZER = 1;    VDelay_ms(tLow);}}
	BCF        PORTC+0, 1
	MOVF       FARG_BeepBeep_tHigh+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_BeepBeep_tHigh+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
	BSF        PORTC+0, 1
	MOVF       FARG_BeepBeep_tLow+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	MOVF       FARG_BeepBeep_tLow+1, 0
	MOVWF      FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;MAIN.c,41 :: 		for (i = 0; i < nTimes; i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MAIN.c,42 :: 		BUZZER = 0;      VDelay_ms(tHigh);     BUZZER = 1;    VDelay_ms(tLow);}}
	GOTO       L_BeepBeep0
L_BeepBeep1:
L_end_BeepBeep:
	RETURN
; end of _BeepBeep

_main:

;MAIN.c,44 :: 		void main(){
;MAIN.c,45 :: 		ADCON1= 0X07;             // TORNA TODOS OS PINOS A/D COMO I/O DE USO GERAL
	MOVLW      7
	MOVWF      ADCON1+0
;MAIN.c,46 :: 		TRISA = 0;                                // DEFINE PORTA,B,C,D,E
	CLRF       TRISA+0
;MAIN.c,47 :: 		TRISB = 0;   TRISC = 0;   TRISD = 0;   TRISE = 0;
	CLRF       TRISB+0
	CLRF       TRISC+0
	CLRF       TRISD+0
	CLRF       TRISE+0
;MAIN.c,48 :: 		TRISC.RC1 = 0;            BUZZER = 1;     // BUZZER LOW ACTIVE
	BCF        TRISC+0, 1
	BSF        PORTC+0, 1
;MAIN.c,49 :: 		Lcd_Init();                               // INICIALIZA LCD NO MODO 4 BIT
	CALL       _Lcd_Init+0
;MAIN.c,50 :: 		Lcd_Cmd(_LCD_CLEAR);                      // APAGA MOSTRADOR
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MAIN.c,51 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                 // DESLIGA CURSOR
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MAIN.c,52 :: 		Grava_RTC();
	CALL       _Grava_RTC+0
;MAIN.c,53 :: 		BeepBeep(3,15,150);                       // TOCA BUZZER NO INICIO
	MOVLW      3
	MOVWF      FARG_BeepBeep_nTimes+0
	MOVLW      0
	MOVWF      FARG_BeepBeep_nTimes+1
	MOVLW      15
	MOVWF      FARG_BeepBeep_tHigh+0
	MOVLW      0
	MOVWF      FARG_BeepBeep_tHigh+1
	MOVLW      150
	MOVWF      FARG_BeepBeep_tLow+0
	CLRF       FARG_BeepBeep_tLow+1
	CALL       _BeepBeep+0
;MAIN.c,54 :: 		while(1){
L_main3:
;MAIN.c,55 :: 		Display_LCD();     // ESCREVE NO MOSTRADOR LCD O VALOR
	CALL       _Display_LCD+0
;MAIN.c,56 :: 		Leitura_RTC();     // EFETUA LEITURA DE SEGUNDO, MINUTO E HORAS DO DS1307
	CALL       _Leitura_RTC+0
;MAIN.c,57 :: 		Delay_ms(200);}}   // AGUARDA 200 milisegundos
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	GOTO       L_main3
L_end_main:
	GOTO       $+0
; end of _main

_Converte_BCD:

;MAIN.c,61 :: 		unsigned char ucColuna,unsigned char ucValor) {
;MAIN.c,63 :: 		ucValor1 = (ucValor >> 4  ) + '0';
	MOVF       FARG_Converte_BCD_ucValor+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	RRF        FARG_Lcd_Chr_out_char+0, 1
	BCF        FARG_Lcd_Chr_out_char+0, 7
	MOVLW      48
	ADDWF      FARG_Lcd_Chr_out_char+0, 1
;MAIN.c,65 :: 		Lcd_Chr(ucLinha,ucColuna,ucValor1);   // ESCREVE CARACTERE NO LCD
	MOVF       FARG_Converte_BCD_ucLinha+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_Converte_BCD_ucColuna+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CALL       _Lcd_Chr+0
;MAIN.c,66 :: 		ucValor2 = (ucValor & 0x0F) + '0';
	MOVLW      15
	ANDWF      FARG_Converte_BCD_ucValor+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	MOVLW      48
	ADDWF      FARG_Lcd_Chr_CP_out_char+0, 1
;MAIN.c,68 :: 		Lcd_Chr_CP(ucValor2);}                // ESCREVE CARACTERE NO LCD
	CALL       _Lcd_Chr_CP+0
L_end_Converte_BCD:
	RETURN
; end of _Converte_BCD

_Leitura_RTC:

;MAIN.c,70 :: 		void Leitura_RTC() {          // ROTINA DE LEITURA DO DS1307
;MAIN.c,71 :: 		I2C1_Start();              // INICIA COMUNICAÁ„O I2C
	CALL       _I2C1_Start+0
;MAIN.c,72 :: 		I2C1_Wr(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MAIN.c,74 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MAIN.c,76 :: 		I2C1_Repeated_Start();     // ISSUE I2C SIGNAL REPEATED START
	CALL       _I2C1_Repeated_Start+0
;MAIN.c,77 :: 		I2C1_Wr(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MAIN.c,79 :: 		ucSegundo = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _ucSegundo+0
;MAIN.c,81 :: 		ucMinuto = I2C1_Rd(1);     // LÍ O SEGUNDO BYTE(MINUTOS)
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _ucMinuto+0
;MAIN.c,82 :: 		ucHora = I2C1_Rd(1);       // LÍ O TERCEIRO BYTE(HORAS)
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _ucHora+0
;MAIN.c,83 :: 		ucDia_Semana = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _ucDia_Semana+0
;MAIN.c,84 :: 		ucDia = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _ucDia+0
;MAIN.c,85 :: 		ucMes = I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _ucMes+0
;MAIN.c,86 :: 		ucAno = I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      _ucAno+0
;MAIN.c,88 :: 		I2C1_Stop();}              // FINALIZA COMUNICAÁ„O I2C
	CALL       _I2C1_Stop+0
L_end_Leitura_RTC:
	RETURN
; end of _Leitura_RTC

_Grava_RTC:

;MAIN.c,91 :: 		void Grava_RTC(){
;MAIN.c,92 :: 		I2C1_Init(100000);     // INICIA I2C COM FREQUENCIA DE 100 kHz
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;MAIN.c,93 :: 		I2C1_Start();          // INICIA A COMUNICAÁ„O I2C
	CALL       _I2C1_Start+0
;MAIN.c,94 :: 		I2C1_Wr(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MAIN.c,96 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MAIN.c,98 :: 		I2C1_Wr(0x00);         // INICIA COM 55 SEGUNDOS.
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MAIN.c,99 :: 		I2C1_Wr(0x30);         // INICIA COM 58 MINUTOS.
	MOVLW      48
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MAIN.c,100 :: 		I2C1_Wr(0x09);         // INICIA COM 23 h (FORMATO 24 HORAS).
	MOVLW      9
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MAIN.c,101 :: 		I2C1_Wr(0x03);         // INICIA COM TERÁA-FEIRA
	MOVLW      3
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MAIN.c,102 :: 		I2C1_Wr(0x28);         // INICIA COM DIA 24
	MOVLW      40
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MAIN.c,103 :: 		I2C1_Wr(0x09);         // INICIA COM MÍS 12
	MOVLW      9
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MAIN.c,104 :: 		I2C1_Wr(0x94);         // INICIA COM ANO 2014
	MOVLW      148
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;MAIN.c,105 :: 		I2C1_Stop();}          // FINALIZA COMUNICAÁ„O I2C
	CALL       _I2C1_Stop+0
L_end_Grava_RTC:
	RETURN
; end of _Grava_RTC

_Encontra_Dia_Semana:

;MAIN.c,107 :: 		void Encontra_Dia_Semana() {
;MAIN.c,108 :: 		switch (ucDia_Semana) {
	GOTO       L_Encontra_Dia_Semana6
;MAIN.c,109 :: 		case 01: ucTexto = "DOMINGO"; break; // CASO DIAS_SEMANA = 01
L_Encontra_Dia_Semana8:
	MOVLW      ?lstr1_MAIN+0
	MOVWF      _ucTexto+0
	GOTO       L_Encontra_Dia_Semana7
;MAIN.c,110 :: 		case 02: ucTexto = "SEGUNDA"; break; // CASO DIAS_SEMANA = 02
L_Encontra_Dia_Semana9:
	MOVLW      ?lstr2_MAIN+0
	MOVWF      _ucTexto+0
	GOTO       L_Encontra_Dia_Semana7
;MAIN.c,111 :: 		case 03: ucTexto = "TERCA";   break; // CASO DIAS_SEMANA = 03
L_Encontra_Dia_Semana10:
	MOVLW      ?lstr3_MAIN+0
	MOVWF      _ucTexto+0
	GOTO       L_Encontra_Dia_Semana7
;MAIN.c,112 :: 		case 04: ucTexto = "QUARTA";  break; // CASO DIAS_SEMANA = 04
L_Encontra_Dia_Semana11:
	MOVLW      ?lstr4_MAIN+0
	MOVWF      _ucTexto+0
	GOTO       L_Encontra_Dia_Semana7
;MAIN.c,113 :: 		case 05: ucTexto = "QUINTA";  break; // CASO DIAS_SEMANA = 05
L_Encontra_Dia_Semana12:
	MOVLW      ?lstr5_MAIN+0
	MOVWF      _ucTexto+0
	GOTO       L_Encontra_Dia_Semana7
;MAIN.c,114 :: 		case 06: ucTexto = "SEXTA";   break; // CASO DIAS_SEMANA = 06
L_Encontra_Dia_Semana13:
	MOVLW      ?lstr6_MAIN+0
	MOVWF      _ucTexto+0
	GOTO       L_Encontra_Dia_Semana7
;MAIN.c,115 :: 		default: ucTexto = "SABADO";}}       // SE N„O FOR NENHUM DESSES
L_Encontra_Dia_Semana14:
	MOVLW      ?lstr7_MAIN+0
	MOVWF      _ucTexto+0
	GOTO       L_Encontra_Dia_Semana7
L_Encontra_Dia_Semana6:
	MOVF       _ucDia_Semana+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Encontra_Dia_Semana8
	MOVF       _ucDia_Semana+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Encontra_Dia_Semana9
	MOVF       _ucDia_Semana+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Encontra_Dia_Semana10
	MOVF       _ucDia_Semana+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Encontra_Dia_Semana11
	MOVF       _ucDia_Semana+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_Encontra_Dia_Semana12
	MOVF       _ucDia_Semana+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_Encontra_Dia_Semana13
	GOTO       L_Encontra_Dia_Semana14
L_Encontra_Dia_Semana7:
L_end_Encontra_Dia_Semana:
	RETURN
; end of _Encontra_Dia_Semana

_Display_LCD:

;MAIN.c,117 :: 		void Display_LCD() {     // MOSTRA VALORES NO LCD E TOCA BUZZER PERIODICAMENTE
;MAIN.c,118 :: 		Lcd_Out(1,1,"(Hora)");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_MAIN+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MAIN.c,119 :: 		Converte_BCD(1,7,ucHora);     // CONVERS„O DA VARI·VEL HORAS PARA BCD
	MOVLW      1
	MOVWF      FARG_Converte_BCD_ucLinha+0
	MOVLW      7
	MOVWF      FARG_Converte_BCD_ucColuna+0
	MOVF       _ucHora+0, 0
	MOVWF      FARG_Converte_BCD_ucValor+0
	CALL       _Converte_BCD+0
;MAIN.c,120 :: 		Lcd_Chr_CP(':');              // ESCREVE NO LCD
	MOVLW      58
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;MAIN.c,121 :: 		Converte_BCD(1,10,ucMinuto);  // CONVERS„O DA VARI·VEL MINUTO PARA BCD
	MOVLW      1
	MOVWF      FARG_Converte_BCD_ucLinha+0
	MOVLW      10
	MOVWF      FARG_Converte_BCD_ucColuna+0
	MOVF       _ucMinuto+0, 0
	MOVWF      FARG_Converte_BCD_ucValor+0
	CALL       _Converte_BCD+0
;MAIN.c,122 :: 		Lcd_Chr_CP(':');              // ESCREVE NO LCD
	MOVLW      58
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;MAIN.c,123 :: 		Converte_BCD(1,13,ucSegundo); // CONVERS„O DA VARI·VEL SEGUNDO PARA BCD
	MOVLW      1
	MOVWF      FARG_Converte_BCD_ucLinha+0
	MOVLW      13
	MOVWF      FARG_Converte_BCD_ucColuna+0
	MOVF       _ucSegundo+0, 0
	MOVWF      FARG_Converte_BCD_ucValor+0
	CALL       _Converte_BCD+0
;MAIN.c,124 :: 		if (ucHora == 0x00 && ucMinuto == 0x00 && ucSegundo == 0x00)
	MOVF       _ucHora+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Display_LCD17
	MOVF       _ucMinuto+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Display_LCD17
	MOVF       _ucSegundo+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Display_LCD17
L__Display_LCD23:
;MAIN.c,125 :: 		BeepBeep(1,50,150);                                        // TOCA BUZZER HORA
	MOVLW      1
	MOVWF      FARG_BeepBeep_nTimes+0
	MOVLW      0
	MOVWF      FARG_BeepBeep_nTimes+1
	MOVLW      50
	MOVWF      FARG_BeepBeep_tHigh+0
	MOVLW      0
	MOVWF      FARG_BeepBeep_tHigh+1
	MOVLW      150
	MOVWF      FARG_BeepBeep_tLow+0
	CLRF       FARG_BeepBeep_tLow+1
	CALL       _BeepBeep+0
L_Display_LCD17:
;MAIN.c,126 :: 		if (ucMinuto == 0x00 && ucSegundo == 0x00)
	MOVF       _ucMinuto+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Display_LCD20
	MOVF       _ucSegundo+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Display_LCD20
L__Display_LCD22:
;MAIN.c,127 :: 		BeepBeep( 1,25,100);                                        // TOCA BUZZER MIN
	MOVLW      1
	MOVWF      FARG_BeepBeep_nTimes+0
	MOVLW      0
	MOVWF      FARG_BeepBeep_nTimes+1
	MOVLW      25
	MOVWF      FARG_BeepBeep_tHigh+0
	MOVLW      0
	MOVWF      FARG_BeepBeep_tHigh+1
	MOVLW      100
	MOVWF      FARG_BeepBeep_tLow+0
	MOVLW      0
	MOVWF      FARG_BeepBeep_tLow+1
	CALL       _BeepBeep+0
L_Display_LCD20:
;MAIN.c,128 :: 		if (ucSegundo == 0x00) BeepBeep( 1,15, 50);                 // TOCA BUZZER SEG
	MOVF       _ucSegundo+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Display_LCD21
	MOVLW      1
	MOVWF      FARG_BeepBeep_nTimes+0
	MOVLW      0
	MOVWF      FARG_BeepBeep_nTimes+1
	MOVLW      15
	MOVWF      FARG_BeepBeep_tHigh+0
	MOVLW      0
	MOVWF      FARG_BeepBeep_tHigh+1
	MOVLW      50
	MOVWF      FARG_BeepBeep_tLow+0
	MOVLW      0
	MOVWF      FARG_BeepBeep_tLow+1
	CALL       _BeepBeep+0
L_Display_LCD21:
;MAIN.c,129 :: 		Lcd_Out(2,1,"(Data)");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_MAIN+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MAIN.c,130 :: 		Converte_BCD(2,7,ucDia);      // CONVERS„O DA VARI·VEL DIA PARA BCD
	MOVLW      2
	MOVWF      FARG_Converte_BCD_ucLinha+0
	MOVLW      7
	MOVWF      FARG_Converte_BCD_ucColuna+0
	MOVF       _ucDia+0, 0
	MOVWF      FARG_Converte_BCD_ucValor+0
	CALL       _Converte_BCD+0
;MAIN.c,131 :: 		Lcd_Chr_CP('/');              // ESCREVE NO LCD
	MOVLW      47
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;MAIN.c,132 :: 		Converte_BCD(2,10,ucMes);     // CONVERS„O DA VARI·VEL MES PARA BCD
	MOVLW      2
	MOVWF      FARG_Converte_BCD_ucLinha+0
	MOVLW      10
	MOVWF      FARG_Converte_BCD_ucColuna+0
	MOVF       _ucMes+0, 0
	MOVWF      FARG_Converte_BCD_ucValor+0
	CALL       _Converte_BCD+0
;MAIN.c,133 :: 		Lcd_Chr_CP('/');              // ESCREVE NO LCD
	MOVLW      47
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;MAIN.c,134 :: 		Converte_BCD(2,13,ucAno);     // CONVERS„O DA VARI·VEL ANO PARA BCD
	MOVLW      2
	MOVWF      FARG_Converte_BCD_ucLinha+0
	MOVLW      13
	MOVWF      FARG_Converte_BCD_ucColuna+0
	MOVF       _ucAno+0, 0
	MOVWF      FARG_Converte_BCD_ucValor+0
	CALL       _Converte_BCD+0
;MAIN.c,135 :: 		Encontra_Dia_Semana();
	CALL       _Encontra_Dia_Semana+0
;MAIN.c,136 :: 		Lcd_Out(3,1,ucTexto);}        // MOSTRA DIA DA SEMANA
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _ucTexto+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_end_Display_LCD:
	RETURN
; end of _Display_LCD
