/****************************************************************************/
/* Microcontroller: PIC16F877A @ 8 MHz + MICROGENIOS --> 0K!                */
// E:\8.PICMICRO\CODEEX\0.MICROGENIOS\PIC16F877A\A.EEPROM_24C04
/* PROGRAMA EXEMPLO: Escrita e Leitura da EEPROM externa 24C04. OBJETIVO: 
Aprender a utilizar a EEPROM externa 24C04.                      PIC16F877A
MICROCONTROLADOR: PIC18F4520 --> ADAPTADO PARA PIC16F877A --> KIT PICgenios
SOFTWARE: MikroC PRO PIC --> MICROGENIOS - CRISTAL: 8Mhz. CHAVES DE FUN«√O:
LCD ( 1) = ON / SCK ( 6) = ON / SDA  ( 7) = ON.
OBS: - HABILITAR BIBLIOTECA LCD. - HABILITAR BIBLIOTECA I2C. */
// CONEXOES PARA LCD PIC16F - MICROGENIOS
sbit LCD_RS at RE2_bit;     sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN at RE1_bit;     sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4 at RD4_bit;     sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5 at RD5_bit;     sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6 at RD6_bit;     sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7 at RD7_bit;     sbit LCD_D7_Direction at TRISD7_bit;
unsigned char ucContador;    // AUXILIAR PARA CONTAGEM.
// PROTOTIPOS DE FUNÁ„O
void Escrita_24C04(unsigned char ucEndereco,unsigned char ucValor);
unsigned char Leitura_24C04(unsigned char ucEndereco);
void main(){
   TRISB = 0;                        // DEFINE PORTB COMO SAIDA.
   TRISD = 0;                        // DEFINE PORTD COMO SAIDA.
   TRISE = 0;                        // DEFINE PORTE COMO SAIDA.
   ADCON1 = 0x0F;                    // CONFIGURA TODOS CANAIS COMO DIGITAL.
// CONFIG. LCD NO MODO 4 BIT
   Lcd_Init();   Lcd_Cmd(_LCD_CLEAR);   Lcd_Cmd(_LCD_CURSOR_OFF);
// ESCRITA NA EEPROM
   Lcd_Out(1,1,"Escr. na 24C04");    // MOSTRA O ESTADO NO LCD.
   for(ucContador = 0; ucContador < 16; ucContador++){
//      Escrita_24C04(ucContador, 0x30 + ucContador);
// GRAVA NA EEPROM VALORES DE 0 A 10 EM ASCII.
//      Escrita_24C04(ucContador, 0x41 + ucContador);
// GRAVA NA EEPROM VALORES DE 'A' AT…: 'P' MAIUSCULAS EM ASCII.
      Escrita_24C04(ucContador, 0x61 + ucContador);
// GRAVA NA EEPROM VALORES DE 'a' AT…: 'p' MINUSCULAS EM ASCII.
      Delay_ms(100);   }
// LEITURA NA EEPROM
   Lcd_Out(1,1,"Lido da 24C04");      // MOSTRA O ESTADO NO LCD.
   for(ucContador = 0; ucContador < 16; ucContador++){
      Lcd_Chr(2, ucContador+1, Leitura_24C04(ucContador));
// LE NA EEPROM VALORES
      Delay_ms(100); }   while(1){};}                              // END MAIN
// FUNÁ„O QUE ESCREVE NA MEMÛRIA 24C04
void Escrita_24C04(unsigned char ucEndereco,unsigned char ucValor){
  I2C1_Init(100000);         // FREQUENCIA DE CLOCK
  I2C1_Start();              // START NO BARRAMENTO I2C
  I2C1_Wr(0xA0);             // ENDEREÁO DA MEMÛRIA NO HARDWARE DO KIT (W = 0)
  I2C1_Wr(ucEndereco);       // ENDEREÁO DA EEPROM ONDE SER· SALVO O DADO
  I2C1_Wr(ucValor);          // ESCREVE VALOR DA VARI·VEL 'UCVALOR' NA 24C04
  I2C1_Stop();}              // FINALIZA A COMUNICAÁ„O I2C
// FUNÁ„O QUE FAZ A LEITURA DA MEMÛRIA 24C04
unsigned char Leitura_24C04(unsigned char ucEndereco){
   unsigned char ucLeitura;  // TEMPORARIO PARA LEITURA DA MEMÛRIA 24C04.
   I2C1_Start();             // START NO BARRAMENTO I2C
   I2C1_Wr(0xA0);            // ENDEREÁO DA MEMÛRIA NO HARDWARE DO KIT (W = 0)
   I2C1_Wr(ucEndereco);      // ENDEREÁO DA EEPROM ONDE SER· LIDO O BYTE
   I2C1_Repeated_Start();    // RE-START NO BARRAMENTO
   I2C1_Wr(0xA1);            // ENDEREÁO DA MEMÛRIA NO HARDWARE DO KIT (W = 1)
   ucLeitura = I2C1_Rd(0u);  // LÍ O BYTE
   I2C1_Stop();              // FINALIZA A COMUNICAÁ„O I2C
   return(ucLeitura);}       // RETORNA VALOR DA LEITURA.