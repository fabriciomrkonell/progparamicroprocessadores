// LCD module connections
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

int analogRead = 0, tensI;
float tensF;
char text[5] = {' ', ' ', ' ', ' ', '\0'};
char volt[7] = {' ', ',', ' ', ' ', ' ', 'V', '\0'};

void main() {

     ADCON1 = 0x8E;                     // Configura registradores para funcionarem como analógicos

     TRISA.RA0 = 1;                     // Habilita leitura da porta analógica 0
     
     TRISB = 0x00;

     Lcd_Init();                        // Initialize LCD

     Lcd_Cmd(_LCD_CLEAR);               // Clear display
     Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
     Lcd_Out(1,1, "Iniciando");
     VDelay_ms(1000);
     Lcd_Out(1,1, "COUNT: ");
     Lcd_Out(2,1, "POWER: ");
     VDelay_ms(1000);
     
     while(1) {

            analogRead = ADC_Read(0);

            text[0] = 48 + ((int) (analogRead / 1000));
            text[1] = 48 + ((int) ((analogRead / 100) % 10));
            text[2] = 48 + ((int) ((analogRead / 10) % 10));
            text[3] = 48 + ((int) (analogRead % 10));
            Lcd_Out(1,10, text);
            
            if(analogRead > 512) {
                   PORTB = 0xFF;
            } else {
                   PORTB = 0x00;
            }
            
            tensF = analogRead * (5.0 / 1023.0);
            tensI = tensF * 1000;
            
            volt[0] = 48 + (int) (tensI / 1000);
            volt[2] = 48 + (int) ((tensI / 100) % 10);
            volt[3] = 48 + (int) ((tensI / 10) % 10);
            volt[4] = 48 + (int) (tensI % 10);
            Lcd_Out(2,8, volt);
     }
     
}