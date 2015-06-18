/****************************************************************************
Programa: LÊ CONVERSOR AD0 e APRESENTA RESULTADO NO LCD DE DUAS FORMAS:
          LINHA 1 EM CONTAGENS: ENTRE 0 A 1023 CONTAGENS;
          LINHA 2 EM TENSAO EQUIVALENTE EM VOLTS: PARTE INTEIRA A ESQUERDA;
          "VIRGULA" E PARTE DECIMAL A DIREITA.
Placa: PICKIT18F PICGENIOS - PIC16F877A
******************************************************************************/
# include "lcdMicroGenios.h"
unsigned char cont_txt[16];
unsigned int contagem = 0;
unsigned int tensao_int = 0;
unsigned int tensao_dec = 0;
unsigned char tensao_int_txt[6];
unsigned char tensao_dec_txt[6];
void main() {
ADCON1 = 0B00001110;             // HABILITA CANAL AN0 E AN1
TRISB  = 0B00000000;             // PORTB CONFIGURADA COMO SAIDA
PORTB  = 0B00000000;             // LED INICIALMENTE APAGADOS
Lcd_Init ();                     // INICIA LCD
Lcd_Cmd(_Lcd_Clear);             // APAGA LCD
Lcd_Cmd(_LCD_CURSOR_OFF);        // DESLIGA CURSOR DO LCD
Lcd_Out(1, 1, "CONTAGEM: ");     // ESCREVE MENSAGEM NA LINHA 1, COLUNA 1 LCD
delay_ms (50);                   // AGUARDA 10 ms
do {
contagem = ADC_Read(0);          // LE AN0 E SALVA NA VARIáVEL temp_res
Delay_us(100);                   // AGUARDA 10 us (microsegundos)
wordToStr(contagem, cont_txt);   // CONVERTE VALOR CONVERSãO AD0 P/ STRING
lcd_out(1,12,cont_txt);          // ESCREVE NO LCD O VALOR DA CONVERSãO DO AD0
tensao_int = contagem * 5/1023;
WordToStr(tensao_int, tensao_int_txt);
lcd_out(2,1,tensao_int_txt);
Lcd_Chr_Cp(',');
tensao_dec = ((contagem * 1023) - tensao_int)*50000;
WordToStrWithZeros(tensao_dec, tensao_dec_txt);
lcd_out(2,7,tensao_dec_txt);
Lcd_Chr_Cp('V');
if (tensao_int >= 3) PORTB = 0b11111111;       // ACENDE LED PARA V >= 3V
else PORTB = 0b00000000;                       // APAGA LED
} while (1);}                                  // FIM DO/WHILE + FIM MAIN