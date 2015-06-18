#line 1 "E:/8.PICMICRO/CODEEX/0.MICROGENIOS/PIC16F877A/C.ADC_LCD/adc.c"
#line 1 "e:/8.picmicro/codeex/0.microgenios/pic16f877a/c.adc_lcd/lcdmicrogenios.h"

sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
#line 9 "E:/8.PICMICRO/CODEEX/0.MICROGENIOS/PIC16F877A/C.ADC_LCD/adc.c"
unsigned char cont_txt[16];
unsigned int contagem = 0;
unsigned int tensao_int = 0;
unsigned int tensao_dec = 0;
unsigned char tensao_int_txt[6];
unsigned char tensao_dec_txt[6];
void main() {
ADCON1 = 0B00001110;
TRISB = 0B00000000;
PORTB = 0B00000000;
Lcd_Init ();
Lcd_Cmd(_Lcd_Clear);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1, 1, "CONTAGEM: ");
delay_ms (50);
do {
contagem = ADC_Read(0);
Delay_us(100);
wordToStr(contagem, cont_txt);
lcd_out(1,12,cont_txt);
tensao_int = contagem * 5/1023;
WordToStr(tensao_int, tensao_int_txt);
lcd_out(2,1,tensao_int_txt);
Lcd_Chr_Cp(',');
tensao_dec = ((contagem * 1023) - tensao_int)*50000;
WordToStrWithZeros(tensao_dec, tensao_dec_txt);
lcd_out(2,7,tensao_dec_txt);
Lcd_Chr_Cp('V');
if (tensao_int >= 3) PORTB = 0b11111111;
else PORTB = 0b00000000;
} while (1);}
