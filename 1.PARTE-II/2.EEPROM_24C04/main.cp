#line 1 "E:/8.PICMICRO/CODEEX/0.MICROGENIOS/PIC16F877A/A.EEPROM_24C04/main.c"
#line 11 "E:/8.PICMICRO/CODEEX/0.MICROGENIOS/PIC16F877A/A.EEPROM_24C04/main.c"
sbit LCD_RS at RE2_bit; sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN at RE1_bit; sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4 at RD4_bit; sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5 at RD5_bit; sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6 at RD6_bit; sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7 at RD7_bit; sbit LCD_D7_Direction at TRISD7_bit;
unsigned char ucContador;

void Escrita_24C04(unsigned char ucEndereco,unsigned char ucValor);
unsigned char Leitura_24C04(unsigned char ucEndereco);
void main(){
 TRISB = 0;
 TRISD = 0;
 TRISE = 0;
 ADCON1 = 0x0F;

 Lcd_Init(); Lcd_Cmd(_LCD_CLEAR); Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1,1,"Escr. na 24C04");
 for(ucContador = 0; ucContador < 16; ucContador++){




 Escrita_24C04(ucContador, 0x61 + ucContador);

 Delay_ms(100); }

 Lcd_Out(1,1,"Lido da 24C04");
 for(ucContador = 0; ucContador < 16; ucContador++){
 Lcd_Chr(2, ucContador+1, Leitura_24C04(ucContador));

 Delay_ms(100); } while(1){};}

void Escrita_24C04(unsigned char ucEndereco,unsigned char ucValor){
 I2C1_Init(100000);
 I2C1_Start();
 I2C1_Wr(0xA0);
 I2C1_Wr(ucEndereco);
 I2C1_Wr(ucValor);
 I2C1_Stop();}

unsigned char Leitura_24C04(unsigned char ucEndereco){
 unsigned char ucLeitura;
 I2C1_Start();
 I2C1_Wr(0xA0);
 I2C1_Wr(ucEndereco);
 I2C1_Repeated_Start();
 I2C1_Wr(0xA1);
 ucLeitura = I2C1_Rd(0u);
 I2C1_Stop();
 return(ucLeitura);}
