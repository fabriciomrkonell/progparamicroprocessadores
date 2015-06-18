/* EXEMPLOS DE APLICACAO EM LINGUAGEM C PARA MICROCONTROLADORES MICROCHIP
MCU:                  PIC16F877A
CRISTAL OSCILADOR:    HS - 8,000 MHz
COMPILADOR:           MIKROC PRO FOR PIC - VER:5.61
KIT DESENVOLVIMENTO:  PICKIT PIC18F - MICROGENIOS
GRAVADOR USB:         MICROICD ZIF - MICROGENIOS
PROGRAMADOR:          PICkit2 - VER: 2.61.00
=============================================================================
CHAVES DIP USADAS [0N] / [OFF]:
1- GLCD / LCD = [GLCD]   2- RX = [OFF]      3- TX = [OFF]     4- REL1 = [OFF]
5- REL2 = [OFF]          6- SCK = [OFF]     7- SDA = [OFF]    8- RTC [OFF]
9- LED1 = [OFF]          0- LED2 = [OFF]
1- DIS1 = [OFF]          2- DIS2 = [OFF]    3- DIS3 = [OFF]   4- DIS4 = [OFF]
5- INFR = [OFF]          6- RESIS = [OFF]   7- TEMP = [OFF]   8- VENT = [OFF]
9- AN0 = [OFF]           0- AN1 = [OFF]     a- JUMPER BUZZER ABERTO
=============================================================================
DESCRICAO:
============================================================================ */
void main() {
ADCON1 = 0x07;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
CMCON = 7;               // DESLIGA COMPARADORES
// CONFIGURACOES INICIAIS EM BINARIO
TRISA = 0b00000000;
TRISB = 0b00000000;
TRISC = 0b00000000;
TRISD = 0b00000000;
TRISE = 0b00000000;
// ESTADOS INICIAIS EM HEXADECIMAL
PORTA = 0x00;
PORTB = 0x00;
PORTC = 0x00;
PORTD = 0x00;
PORTE = 0x00;
// PISCAR TODOS OS LEDS RAZAO CICLICA 1PARA 6
while (1){
PORTB = 0b00000000;
PORTD = 0b00000000;
Delay_ms(600);
PORTB = 0b11111111;
PORTD = 0b11111111;
Delay_ms(100);
}}
