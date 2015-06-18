#line 1 "E:/8.PICMICRO/CODEEX/0.MICROGENIOS/PIC16F877A/000.452/0.KP+LCD/MAIN.c"
#line 1 "e:/8.picmicro/codeex/0.microgenios/pic16f877a/000.452/0.kp+lcd/lcdmicrogenios.h"

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
#line 16 "E:/8.PICMICRO/CODEEX/0.MICROGENIOS/PIC16F877A/000.452/0.KP+LCD/MAIN.c"
unsigned char key_get;
unsigned int i = 0;
unsigned char keypad_wait(void);
unsigned char keypad_read(void);
unsigned short t = 10;

unsigned char keypad_read(void){

 PORTD.RD0  = 0;
 PORTD.RD1  = 1;  PORTD.RD2  = 1;  PORTD.RD3  = 1;
VDelay_ms(t);
if ( PORTB.RB0  == 0) return '*';
if ( PORTB.RB1  == 0) return '0';
if ( PORTB.RB2  == 0) return '#';
VDelay_ms(t);
 PORTD.RD0  = 1;
 PORTD.RD1  = 0;  PORTD.RD2  = 1;  PORTD.RD3  = 1;
VDelay_ms(t);
if ( PORTB.RB0  == 0) return '7';
if ( PORTB.RB1  == 0) return '8';
if ( PORTB.RB2  == 0) return '9';
VDelay_ms(t);
 PORTD.RD0  = 1;
 PORTD.RD1  = 1;  PORTD.RD2  = 0;  PORTD.RD3  = 1;
VDelay_ms(t);
if ( PORTB.RB0  == 0) return '4';
if ( PORTB.RB1  == 0) return '5';
if ( PORTB.RB2  == 0) return '6';
VDelay_ms(t);
 PORTD.RD0  = 1;
 PORTD.RD1  = 1;  PORTD.RD2  = 1;  PORTD.RD3  = 0;
VDelay_ms(t);
if ( PORTB.RB0  == 0) return '1';
if ( PORTB.RB1  == 0) return '2';
if ( PORTB.RB2  == 0) return '3';
VDelay_ms(t);
return 0xFF;
}

void main(){
ADCON1 = 0x06;
TRISB.RB0 = 1; TRISB.RB1 = 1; TRISB.RB2 = 1;
TRISD.RD0 = 0; TRISD.RD1 = 0; TRISD.RD2 = 0; TRISD.RD3 = 0;


LCD_init();
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
while(1){


LCD_Out(1,1,"PRESSIONAR TECLA");

LCD_cmd(_LCD_SECOND_ROW);
for(i = 0; i < 17; i++) {

key_get = keypad_wait();

Lcd_Chr_Cp(key_get);




}
LCD_cmd(_LCD_CLEAR);
}
}

unsigned char c_pressed_key = 0xFF;
unsigned char keypad_wait(void){
c_pressed_key = 0xFF;
do{c_pressed_key = keypad_read();}
while(c_pressed_key == 0xFF);
while(keypad_read() != 0xFF);
return c_pressed_key;
}
