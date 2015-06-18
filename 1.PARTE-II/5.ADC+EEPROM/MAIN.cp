#line 1 "E:/8.PICMICRO/CODEEX/0.MICROGENIOS/PIC16F877A/000.452/3.ADC+EEPROM/MAIN.c"
#line 1 "e:/8.picmicro/codeex/0.microgenios/pic16f877a/000.452/3.adc+eeprom/lcdmicrogenios.h"

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
#line 12 "E:/8.PICMICRO/CODEEX/0.MICROGENIOS/PIC16F877A/000.452/3.ADC+EEPROM/MAIN.c"
unsigned int adc_rd, diff;
unsigned short ADCeer;
unsigned char ADCeerSTR[5];
unsigned long int BarSegmentNum;
unsigned char adcprint[7], i;
const char character[] = {31,31,31,31,31,31,31,31};
void CustomChar(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);}
void main(){
ADCON1 = 0b00001110;
TRISA.RA0 = 1;
Lcd_Init ();
Lcd_Cmd(_Lcd_Clear);
Lcd_Cmd(_LCD_CURSOR_OFF);
ADC_Init();
while(1){
adc_rd = ADC_Read(0);
EEPROM_Write(0x08, adc_rd);
IntToStr(adc_rd, adcprint);
Lcd_out(1,1,"COUNTS..: ");
Lcd_Out_Cp(adcprint);
if (diff != adc_rd){
BarSegmentNum = adc_rd /(1023 / 16);

Lcd_out(2,1,"                ");
for (i = 0; i < BarSegmentNum; i++){

CustomChar(2, i+1);}}
Delay_ms(750);
diff = adc_rd;

ADCeer = EEPROM_Read(0x08);
ShortToStr (ADCeer, ADCeerSTR);

Lcd_Out(2, 1, ADCeerSTR);
Delay_ms(2000);
Lcd_Cmd(_LCD_CLEAR);
}
}
