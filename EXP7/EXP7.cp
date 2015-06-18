#line 1 "C:/realronchi/EXP7/EXP7.c"

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


int analogRead = 0;
unsigned short dutyPowerVal, dutyPowerPer;
char count[4] = {' ', ' ', ' ', '\0'};
char dutyPower[5] = {' ', ' ', ' ', '%', '\0'};
void main() {

 ADCON1= 0x8E;
 TRISA.RA0 = 1;

 TRISC.RC2 = 0;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1, "Iniciando");
 VDelay_ms(1000);
 Lcd_Out(1,1, "COUNT: ");
 Lcd_Out(2,1, "POWER: ");

 PWM1_Init(1000);
 PWM1_Start();
 while(1) {

 analogRead = ADC_Read(0);
 dutyPowerVal = analogRead / 4;

 count[0] = 48 + ((int) ((dutyPowerVal / 100) % 10));
 count[1] = 48 + ((int) ((dutyPowerVal / 10) % 10));
 count[2] = 48 + ((int) (dutyPowerVal % 10));
 Lcd_Out(1,7, count);

 dutyPowerPer = (100 * dutyPowerVal) / 255;

 PWM1_Set_Duty(dutyPowerVal);
 Delay_ms(40);


 dutyPower[0] = 48 + (int) ((dutyPowerPer / 100) % 10);
 dutyPower[1] = 48 + (int) ((dutyPowerPer / 10) % 10);
 dutyPower[2] = 48 + (int) (dutyPowerPer % 10);
 Lcd_Out(2,7, dutyPower);

 }
 PWM1_Stop();

}
