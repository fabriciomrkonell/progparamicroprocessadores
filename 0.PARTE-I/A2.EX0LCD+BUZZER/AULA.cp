#line 1 "C:/Users/ceviana.CATOLICASC/Desktop/6_MCUs/_LAB/CODE/A2.EX0/AULA.c"
#line 1 "c:/users/ceviana.catolicasc/desktop/6_mcus/_lab/code/a2.ex0/lcd_kitpic16f.h"
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
#line 24 "C:/Users/ceviana.CATOLICASC/Desktop/6_MCUs/_LAB/CODE/A2.EX0/AULA.c"
unsigned char msg_1[] = "TESTE...TESTANDO";
unsigned char msg_2[] = "ESCRITA..NO..LCD";

void main() {
ADCON1 = 0x07;
CMCON = 7;

 TRISA = 0b00000000; PORTA = 0b00000000;
 TRISB = 0b00000110; PORTB = 0b00000000;
 TRISC = 0b00000000; PORTC = 0b00000000;




 PORTC.RC1  = 1;


Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1, 1, msg_1);
Lcd_Out(2, 1, msg_2);

while (1){
 PORTC.RC1  = 0; Delay_ms(15);  PORTC.RC1  = 1; Delay_ms(150);
 PORTC.RC1  = 0; Delay_ms(15);  PORTC.RC1  = 1;
Delay_ms(10000);}}
