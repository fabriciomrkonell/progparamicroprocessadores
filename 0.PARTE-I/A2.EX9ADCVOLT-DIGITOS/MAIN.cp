#line 1 "H:/0.DSC/2015.1/3.PMPU.BSI.JGS+JOI/C.CODEEX/0.PARTE-I/A2.EX9ADCVOLT-DIGITOS/MAIN.c"
#line 8 "H:/0.DSC/2015.1/3.PMPU.BSI.JGS+JOI/C.CODEEX/0.PARTE-I/A2.EX9ADCVOLT-DIGITOS/MAIN.c"
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

unsigned char ch;
unsigned int adc_rd;
char *text;
long tlong;
void main() {
ADCON1 = 0x8E;

CM2_bit, CM1_bit, CM0_bit = 1;
 INTCON = 0;
 TRISA.RA0 = 1;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 text = "> LAB.MCU.2014 <";
 Lcd_Out(1,1,text);
 text = "LCD   VOLTIMETRO";
 Lcd_Out(2,1,text);
 Delay_ms(2000);
 text = "TENSAO: ";
 while (1) {
 adc_rd = ADC_Read(0);
 Lcd_Out(2,1, text);
 tlong = (long)adc_rd * 5000;
 tlong = tlong / 1023;
 ch = tlong / 1000;

 Lcd_Chr(2,9, 48 + ch);
 Lcd_Chr_CP(',');
 ch = (tlong / 100) % 10;
 Lcd_Chr_CP(48 + ch);
 ch = (tlong / 10) % 10;
 Lcd_Chr_CP(48 + ch);
 ch = tlong % 10;
 Lcd_Chr_CP(48 + ch);
 Lcd_Out_Cp(" V ");
 Delay_ms(1);
 }
}
