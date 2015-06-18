// LCD module connections = MIKROC
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
// End LCD module connections

// START - KEYPAD SETTINGS
#define KP_R1     PORTD.RD0   // LINHA 1
#define KP_R2     PORTD.RD1   // LINHA 2
#define KP_R3     PORTD.RD2   // LINHA 3
#define KP_R4     PORTD.RD3   // LINHA 4

#define KP_C1     PORTB.RB0   // COLUNA 1
#define KP_C2     PORTB.RB1   // COLUNA 2
#define KP_C3     PORTB.RB2   // COLUNA 3
// END - KEYPAD SETTINGS
