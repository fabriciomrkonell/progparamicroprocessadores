#line 1 "E:/8.PICMICRO/CODEEX/0.MICROGENIOS/PIC16F877A/6.EEPROM_SW/AULA.c"
#line 25 "E:/8.PICMICRO/CODEEX/0.MICROGENIOS/PIC16F877A/6.EEPROM_SW/AULA.c"
sbit LCD_RS at RE2_bit; sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN at RE1_bit; sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4 at RD4_bit; sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5 at RD5_bit; sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6 at RD6_bit; sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7 at RD7_bit; sbit LCD_D7_Direction at TRISD7_bit;

unsigned char INFO;
unsigned char INFO_s[6];

unsigned char msg_1[] = "E  E  P  R  O  M";
unsigned char msg_2[] = "TESTE D LE/GRAVA";
unsigned char msg_3[] = "G R A V A D A  !";
unsigned char msg_4[] = "L E I T U R A:..";
unsigned char msg_5[] = "PRESSIONAR: INT1";
unsigned char msg_6[] = "LE ou INT2.GRAVA";




void main() {
ADCON1 = 0x07;
CMCON = 7;

 TRISA = 0b00000000; PORTA = 0b00000000;
 TRISB = 0b00000110;
 TRISC = 0b00000000; PORTC = 0b00000000;



 PORTC.RC1  = 1;

Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1, 1, msg_2);
Lcd_Out(2, 1, msg_1);
Delay_ms(1500);
Lcd_Cmd(_LCD_CLEAR);
while (1) {
if (! PORTB.RB2 ) {
 PORTC.RC1  = 0; Delay_ms(15);  PORTC.RC1  = 1; Delay_ms(50);
 PORTC.RC1  = 0; Delay_ms(15);  PORTC.RC1  = 1;

EEPROM_Write(0x08, 'K');
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1, 1, msg_1);
Lcd_Out(2, 1, msg_3);
Delay_ms(1000);
Lcd_Cmd(_LCD_CLEAR);
} else if (! PORTB.RB1 ) {
 PORTC.RC1  = 0; Delay_ms(15);  PORTC.RC1  = 1;

INFO = EEPROM_Read(0x08);
ShortToStr (INFO, INFO_s);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1, 1, msg_1);
Lcd_Out(2, 1, msg_4);
Delay_ms(1000);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,INFO_s);
Lcd_Out_Cp(" = DECIMAL");
Lcd_Cmd(_LCD_SECOND_ROW);
Lcd_Chr_Cp(0+INFO);
Lcd_Out_Cp(" =  CHARACTER");
Delay_ms(2500);
Lcd_Cmd(_LCD_CLEAR);}
else {
Lcd_Out(1, 1, msg_5);
Lcd_Out(2, 1, msg_6);
}
 }
 }
