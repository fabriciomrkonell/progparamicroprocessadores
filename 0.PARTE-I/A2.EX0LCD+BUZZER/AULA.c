/* EXEMPLOS DE APLICACAO EM LINGUAGEM C PARA MICROCONTROLADORES MICROCHIP
MCU:                  PIC16F877A
CRISTAL OSCILADOR:    HS - 8,000 MHz
COMPILADOR:           MIKROC PRO FOR PIC - VER:5.61
KIT DESENVOLVIMENTO:  PICKIT PIC18F - MICROGENIOS
GRAVADOR USB:         MICROICD ZIF - MICROGENIOS
PROGRAMADOR:          PICkit2 - VER: 2.61.00
==============================================================+==============
CHAVES DIP USADAS [0N] / [OFF]:
1- GLCD / LCD = [LCD]    2- RX = [OFF]      3- TX = [OFF]     4- REL1 = [ON]
5- REL2 = [ON]           6- SCK = [OFF]     7- SDA = [OFF]    8- RTC [OFF]
9- LED1 = [ON]           0- LED2 = [OFF]
1- DIS1 = [OFF]          2- DIS2 = [OFF]    3- DIS3 = [OFF]   4- DIS4 = [OFF]
5- INFR = [OFF]          6- RESIS = [OFF]   7- TEMP = [OFF]   8- VENT = [OFF]
9- AN0 = [OFF]           0- AN1 = [OFF]     a- JUMPER BUZZER FECHADO
=============================================================================
DESCRICAO: APRESENTA DUAS MENSAGENS NO LCD INDEFINIDAMENTE E A CADA 10 SEGUNDOS
SOA O BUZZER COM DURACAO DE 150 milissegundos.
============================================================================ */
// ARQUIVOS EXTERNOS
#include "LCD_KITPIC16F.h"   // INCLUI ARQUIVO DE CONFIGURACAO DO LCD
// DIRETIVAS DO COMPILADOR
# define BUZZER           PORTC.RC1     // BUZZER = SAIDA
// VARIAVEIS DE MENSAGEM COM SEUS VALORES ATRIBUIDOS
unsigned char msg_1[] = "TESTE...TESTANDO";
unsigned char msg_2[] = "ESCRITA..NO..LCD";

void main() {
ADCON1 = 0x07;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
CMCON = 7;               // DESLIGA COMPARADORES
// CONFIGURACOES E/S E ESTADOS INICIAIS [BINARIO]
   TRISA = 0b00000000;            PORTA = 0b00000000;
   TRISB = 0b00000110;            PORTB = 0b00000000;
   TRISC = 0b00000000;            PORTC = 0b00000000;
// TRISD = 0b00000000;            PORTD = 0b00000000;
// TRISE = 0b00000000;            PORTE = 0b00000000;

// ESTADOS INICIAIS DOS ACESSORIOS EM USO
BUZZER = 1;

// MENSAGEM INICIAL NO LCD
Lcd_Init();                                 // INICIA O LCD
Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
Lcd_Cmd(_LCD_CURSOR_OFF);                   // DESLIGA O CURSOR
Lcd_Out(1, 1, msg_1);
Lcd_Out(2, 1, msg_2);

while (1){
BUZZER = 0; Delay_ms(15); BUZZER = 1; Delay_ms(150);
BUZZER = 0; Delay_ms(15); BUZZER = 1;       // SIRENE SOA DUAS VEZES CURTAS
Delay_ms(10000);}}