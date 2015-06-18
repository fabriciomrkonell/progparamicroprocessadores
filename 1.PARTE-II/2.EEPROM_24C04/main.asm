
_main:

;main.c,21 :: 		void main(){
;main.c,22 :: 		TRISB = 0;                        // DEFINE PORTB COMO SAIDA.
	CLRF       TRISB+0
;main.c,23 :: 		TRISD = 0;                        // DEFINE PORTD COMO SAIDA.
	CLRF       TRISD+0
;main.c,24 :: 		TRISE = 0;                        // DEFINE PORTE COMO SAIDA.
	CLRF       TRISE+0
;main.c,25 :: 		ADCON1 = 0x0F;                    // CONFIGURA TODOS CANAIS COMO DIGITAL.
	MOVLW      15
	MOVWF      ADCON1+0
;main.c,27 :: 		Lcd_Init();   Lcd_Cmd(_LCD_CLEAR);   Lcd_Cmd(_LCD_CURSOR_OFF);
	CALL       _Lcd_Init+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;main.c,29 :: 		Lcd_Out(1,1,"Escr. na 24C04");    // MOSTRA O ESTADO NO LCD.
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_main+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;main.c,30 :: 		for(ucContador = 0; ucContador < 16; ucContador++){
	CLRF       _ucContador+0
L_main0:
	MOVLW      16
	SUBWF      _ucContador+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;main.c,35 :: 		Escrita_24C04(ucContador, 0x61 + ucContador);
	MOVF       _ucContador+0, 0
	MOVWF      FARG_Escrita_24C04_ucEndereco+0
	MOVF       _ucContador+0, 0
	ADDLW      97
	MOVWF      FARG_Escrita_24C04_ucValor+0
	CALL       _Escrita_24C04+0
;main.c,37 :: 		Delay_ms(100);   }
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;main.c,30 :: 		for(ucContador = 0; ucContador < 16; ucContador++){
	INCF       _ucContador+0, 1
;main.c,37 :: 		Delay_ms(100);   }
	GOTO       L_main0
L_main1:
;main.c,39 :: 		Lcd_Out(1,1,"Lido da 24C04");      // MOSTRA O ESTADO NO LCD.
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_main+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;main.c,40 :: 		for(ucContador = 0; ucContador < 16; ucContador++){
	CLRF       _ucContador+0
L_main4:
	MOVLW      16
	SUBWF      _ucContador+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;main.c,41 :: 		Lcd_Chr(2, ucContador+1, Leitura_24C04(ucContador));
	MOVF       _ucContador+0, 0
	MOVWF      FARG_Leitura_24C04_ucEndereco+0
	CALL       _Leitura_24C04+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _ucContador+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CALL       _Lcd_Chr+0
;main.c,43 :: 		Delay_ms(100); }   while(1){};}                              // END MAIN
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;main.c,40 :: 		for(ucContador = 0; ucContador < 16; ucContador++){
	INCF       _ucContador+0, 1
;main.c,43 :: 		Delay_ms(100); }   while(1){};}                              // END MAIN
	GOTO       L_main4
L_main5:
L_main8:
	GOTO       L_main8
L_end_main:
	GOTO       $+0
; end of _main

_Escrita_24C04:

;main.c,45 :: 		void Escrita_24C04(unsigned char ucEndereco,unsigned char ucValor){
;main.c,46 :: 		I2C1_Init(100000);         // FREQUENCIA DE CLOCK
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;main.c,47 :: 		I2C1_Start();              // START NO BARRAMENTO I2C
	CALL       _I2C1_Start+0
;main.c,48 :: 		I2C1_Wr(0xA0);             // ENDEREçO DA MEMóRIA NO HARDWARE DO KIT (W = 0)
	MOVLW      160
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;main.c,49 :: 		I2C1_Wr(ucEndereco);       // ENDEREçO DA EEPROM ONDE SERá SALVO O DADO
	MOVF       FARG_Escrita_24C04_ucEndereco+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;main.c,50 :: 		I2C1_Wr(ucValor);          // ESCREVE VALOR DA VARIáVEL 'UCVALOR' NA 24C04
	MOVF       FARG_Escrita_24C04_ucValor+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;main.c,51 :: 		I2C1_Stop();}              // FINALIZA A COMUNICAçãO I2C
	CALL       _I2C1_Stop+0
L_end_Escrita_24C04:
	RETURN
; end of _Escrita_24C04

_Leitura_24C04:

;main.c,53 :: 		unsigned char Leitura_24C04(unsigned char ucEndereco){
;main.c,55 :: 		I2C1_Start();             // START NO BARRAMENTO I2C
	CALL       _I2C1_Start+0
;main.c,56 :: 		I2C1_Wr(0xA0);            // ENDEREçO DA MEMóRIA NO HARDWARE DO KIT (W = 0)
	MOVLW      160
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;main.c,57 :: 		I2C1_Wr(ucEndereco);      // ENDEREçO DA EEPROM ONDE SERá LIDO O BYTE
	MOVF       FARG_Leitura_24C04_ucEndereco+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;main.c,58 :: 		I2C1_Repeated_Start();    // RE-START NO BARRAMENTO
	CALL       _I2C1_Repeated_Start+0
;main.c,59 :: 		I2C1_Wr(0xA1);            // ENDEREçO DA MEMóRIA NO HARDWARE DO KIT (W = 1)
	MOVLW      161
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;main.c,60 :: 		ucLeitura = I2C1_Rd(0u);  // Lê O BYTE
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      Leitura_24C04_ucLeitura_L0+0
;main.c,61 :: 		I2C1_Stop();              // FINALIZA A COMUNICAçãO I2C
	CALL       _I2C1_Stop+0
;main.c,62 :: 		return(ucLeitura);}       // RETORNA VALOR DA LEITURA.
	MOVF       Leitura_24C04_ucLeitura_L0+0, 0
	MOVWF      R0+0
L_end_Leitura_24C04:
	RETURN
; end of _Leitura_24C04
