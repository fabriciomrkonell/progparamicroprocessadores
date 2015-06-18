#line 1 "W:/0.DSC/2014.2/4.MPU/LAB/CODE/A2.EX10/AULA.c"
#line 24 "W:/0.DSC/2014.2/4.MPU/LAB/CODE/A2.EX10/AULA.c"
sbit LCD_RS at RE2_bit; sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN at RE1_bit; sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4 at RD4_bit; sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5 at RD5_bit; sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6 at RD6_bit; sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7 at RD7_bit; sbit LCD_D7_Direction at TRISD7_bit;
int a = 0, aP = 0;

unsigned char cont_txt[6], aP_txt[6];
unsigned int contagem = 0;
void main() {
ADCON1 = 0b00001001;
CMCON = 7;

 TRISA = 0b00000010;
 TRISB = 0b00000000; PORTB = 0b00000000;
 TRISC = 0b00000000; PORTC = 0b00000000;



 PORTC.RC1  = 1;

 PORTC.RC1  = 0; Delay_ms(15);  PORTC.RC1  = 1; Delay_ms(30);
 PORTC.RC1  = 0; Delay_ms(15);  PORTC.RC1  = 1;

Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Out(1, 1, "TESTE.D.CONTROLE");
Lcd_Out(2, 1, "VENTOINHA....PWM");
Delay_ms(2500);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1, 1, "CONTAGEM: ");
Lcd_Out(2, 1, "RZ.CICL.: ");
delay_ms (50);
Pwm1_Init(5000);
Pwm1_Start();
do{
contagem = ADC_Read(1)/4;
wordToStr(contagem, cont_txt);
lcd_out(1,12,cont_txt);
a = Adc_Read(1);
a = (a * 0.25);
PWM1_Set_Duty(a);
aP = a * 100 / 255;
wordToStr(aP, aP_txt);
lcd_out(2,11, aP_txt);
Lcd_Chr_Cp('%');
Delay_10us;}
while (1);}
