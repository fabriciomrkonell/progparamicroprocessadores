/* EXEMPLOS DE APLICACAO EM LINGUAGEM C PARA MICROCONTROLADORES MICROCHIP
MCU:                  PIC16F877A
CRISTAL OSCILADOR:    HS - 8,000 MHz
COMPILADOR:           MIKROC PRO FOR PIC - VER:5.61
KIT DESENVOLVIMENTO:  PICKIT PIC18F - MICROGENIOS
GRAVADOR USB:         MICROICD ZIF - MICROGENIOS
PROGRAMADOR:          PICkit2 - VER: 2.61.00
==============================================================+==============
CHAVES DIP USADAS [0N] / [OFF]:
1- GLCD / LCD = [GLCD]   2- RX = [OFF]      3- TX = [OFF]     4- REL1 = [OFF]
5- REL2 = [OFF]          6- SCK = [OFF]     7- SDA = [OFF]    8- RTC [OFF]
9- LED1 = [OFF]          0- LED2 = [OFF]
1- DIS1 = [OFF]          2- DIS2 = [OFF]    3- DIS3 = [OFF]   4- DIS4 = [OFF]
5- INFR = [OFF]          6- RESIS = [OFF]   7- TEMP = [OFF]   8- VENT = [OFF]
9- AN0 = [OFF]           0- AN1 = [OFF]     a- JUMPER BUZZER ABERTO
===============================================================+=============
DESCRICAO: ESTE CODIGO FAZ COM QUE TODOS OS LED DO PORTB E PORTD, OS DOIS
RELES, A RESISTENCIA DE AQUECIMENTO, A VENTOINHA E O BUZZER OSCILEM
ALTERNADAMENTE COM PERIODO DE T = 750 ms INDEFINIDAMENTE.
============================================================================ */
// DIRETIVAS DO COMPILADOR
# define RELE_1           PORTC.RC0
# define RELE_2           PORTE.RE0
# define BARRA_LEDS_1     PORTD
# define BARRA_LEDS_2     PORTB
# define RESIST           PORTC.RC5    // RESISTOR DE 5W = PARA AQUECIMENTO
# define BUZZER           PORTC.RC1    // BUZZER = JUMPER
# define VENT             PORTC.RC2    // VENT = VENTOINHA

void main() {            // ABRE FUNCAO PRINCIPAL: MAIN
ADCON1 = 0x06;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
CMCON = 7;               // DESLIGA COMPARADORES
// CONFIGURACOES E/S E ESTADOS INICIAIS [BINARIO]
TRISA = 0b00000000;            PORTA = 0b00000000;
TRISB = 0b00000000;            PORTB = 0b00000000;
TRISC = 0b00000000;            PORTC = 0b00000000;
TRISD = 0b00000000;            PORTD = 0b00000000;
TRISE = 0b00000000;            PORTE = 0b00000000;
// ESTADOS INICIAIS DOS ACESSORIOS
RELE_1 = 0;
RELE_2 = 0;
BARRA_LEDS_1 = 0;
BARRA_LEDS_2 = 0;
RESIST = 0;
VENT = 0;
BUZZER = 0;
// PISCAR OS ACESSORIOS INDEFINIDAMENTE
while (1){
RELE_1 =          ~ RELE_1;
RELE_2 =          ~ RELE_2;
BARRA_LEDS_1 =    ~ BARRA_LEDS_1;
BARRA_LEDS_2 =    ~ BARRA_LEDS_2;
RESIST =          ~ RESIST;
VENT =            ~ VENT;
BUZZER =          ~ BUZZER;
Delay_ms(750);
}             // FECHA WHILE
}             // FECHA MAIN