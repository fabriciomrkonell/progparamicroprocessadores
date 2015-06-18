#line 1 "C:/realronchi/1.PARTE-II/1.RTC/MAIN.c"
#line 1 "c:/realronchi/1.parte-ii/1.rtc/lcdmicrogenios.h"

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
#line 21 "C:/realronchi/1.PARTE-II/1.RTC/MAIN.c"
unsigned char ucHora;
unsigned char ucMinuto;
unsigned char ucSegundo;
unsigned char ucDia;
unsigned char ucMes;
unsigned char ucAno;
unsigned char ucDia_Semana;
char *ucTexto;
unsigned int i = 0, nTimes = 0, tHigh = 0, tLow = 0;


void Display_LCD();
void Encontra_Dia_Semana();
void Grava_RTC();
void Leitura_RTC();
void Converte_BCD (unsigned char ucLinha,
 unsigned char ucColuna,unsigned char ucValor);


void BeepBeep(unsigned int nTimes, unsigned int tHigh, unsigned int tLow){
for (i = 0; i < nTimes; i++){
 PORTC.RC1  = 0; VDelay_ms(tHigh);  PORTC.RC1  = 1; VDelay_ms(tLow);}}

void main(){
 ADCON1= 0X07;
 TRISA = 0;
 TRISB = 0; TRISC = 0; TRISD = 0; TRISE = 0;
 TRISC.RC1 = 0;  PORTC.RC1  = 1;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Grava_RTC();
 BeepBeep(3,15,150);
 while(1){
 Display_LCD();
 Leitura_RTC();
 Delay_ms(200);}}


void Converte_BCD (unsigned char ucLinha,
 unsigned char ucColuna,unsigned char ucValor) {
 unsigned char ucValor1, ucValor2;
 ucValor1 = (ucValor >> 4 ) + '0';

 Lcd_Chr(ucLinha,ucColuna,ucValor1);
 ucValor2 = (ucValor & 0x0F) + '0';

 Lcd_Chr_CP(ucValor2);}

void Leitura_RTC() {
 I2C1_Start();
 I2C1_Wr(0xD0);

 I2C1_Wr(0);

 I2C1_Repeated_Start();
 I2C1_Wr(0xD1);

 ucSegundo = I2C1_Rd(1);

 ucMinuto = I2C1_Rd(1);
 ucHora = I2C1_Rd(1);
 ucDia_Semana = I2C1_Rd(1);
 ucDia = I2C1_Rd(1);
 ucMes = I2C1_Rd(1);
 ucAno = I2C1_Rd(0);

 I2C1_Stop();}


void Grava_RTC(){
 I2C1_Init(100000);
 I2C1_Start();
 I2C1_Wr(0xD0);

 I2C1_Wr(0);

 I2C1_Wr(0x00);
 I2C1_Wr(0x30);
 I2C1_Wr(0x09);
 I2C1_Wr(0x03);
 I2C1_Wr(0x28);
 I2C1_Wr(0x09);
 I2C1_Wr(0x94);
 I2C1_Stop();}

void Encontra_Dia_Semana() {
 switch (ucDia_Semana) {
 case 01: ucTexto = "DOMINGO"; break;
 case 02: ucTexto = "SEGUNDA"; break;
 case 03: ucTexto = "TERCA"; break;
 case 04: ucTexto = "QUARTA"; break;
 case 05: ucTexto = "QUINTA"; break;
 case 06: ucTexto = "SEXTA"; break;
 default: ucTexto = "SABADO";}}

void Display_LCD() {
 Lcd_Out(1,1,"(Hora)");
 Converte_BCD(1,7,ucHora);
 Lcd_Chr_CP(':');
 Converte_BCD(1,10,ucMinuto);
 Lcd_Chr_CP(':');
 Converte_BCD(1,13,ucSegundo);
if (ucHora == 0x00 && ucMinuto == 0x00 && ucSegundo == 0x00)
BeepBeep(1,50,150);
if (ucMinuto == 0x00 && ucSegundo == 0x00)
BeepBeep( 1,25,100);
if (ucSegundo == 0x00) BeepBeep( 1,15, 50);
 Lcd_Out(2,1,"(Data)");
 Converte_BCD(2,7,ucDia);
 Lcd_Chr_CP('/');
 Converte_BCD(2,10,ucMes);
 Lcd_Chr_CP('/');
 Converte_BCD(2,13,ucAno);
 Encontra_Dia_Semana();
 Lcd_Out(3,1,ucTexto);}
