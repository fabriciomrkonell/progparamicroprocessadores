/* EXEMPLOS DE APLICACAO EM LINGUAGEM C PARA MICROCONTROLADORES MICROCHIP
MCU:                  PIC16F877A
CRISTAL OSCILADOR:    HS - 8,000 MHz
COMPILADOR:           MIKROC PRO FOR PIC - VER:5.61
KIT DESENVOLVIMENTO:  PICKIT PIC18F - MICROGENIOS
GRAVADOR USB:         MICROICD ZIF - MICROGENIOS
PROGRAMADOR:          PICkit2 - VER: 2.61.00
==============================================================+==============
CHAVES DIP USADAS [0N] / [OFF]:
1- GLCD / LCD = [GLCD]   2- RX = [OFF]      3- TX = [OFF]     4- REL1 = [ON]
5- REL2 = [ON]           6- SCK = [OFF]     7- SDA = [OFF]    8- RTC [OFF]
9- LED1 = [ON]           0- LED2 = [OFF]
1- DIS1 = [OFF]          2- DIS2 = [OFF]    3- DIS3 = [OFF]   4- DIS4 = [OFF]
5- INFR = [OFF]          6- RESIS = [OFF]   7- TEMP = [OFF]   8- VENT = [ON]
9- AN0 = [OFF]           0- AN1 = [OFF]     a- JUMPER BUZZER FECHADO
=============================================================================
DESCRICAO: USA OS INTERRUPTORES DE PRESSAO PARA QUANDO PRESSIONADOS MANTEREM 
ACIONADOS / DESACIONADOS DETERMINADOS ACESSORIOS E QUANDO EM REPOUSO REALIZAM
O CONTRARIO INDEFINIDAMENTE.
============================================================================ */
// DIRETIVAS DO COMPILADOR
# define INT0             PORTB.RB0     // INTERRUPTOR 0   = ENTRADA
# define INT1             PORTB.RB1     // INTERRUPTOR 1   = ENTRADA
# define INT2             PORTB.RB2     // INTERRUPTOR 2   = ENTRADA
# define INT3             PORTB.RB3     // INTERRUPTOR 3   = ENTRADA
# define INT4             PORTB.RB4     // INTERRUPTOR 4   = ENTRADA
# define INT5             PORTB.RB5     // INTERRUPTOR 5   = ENTRADA

# define RELE_1           PORTC.RC0     // RELE 1          = SAIDA
# define RELE_2           PORTE.RE0     // RELE 2          = SAIDA
# define VENT             PORTC.RC2     // VENTOINHA       = SAIDA
# define BUZZER           PORTC.RC1     // BUZZER          = SAIDA

# define LEDD0            PORTD.RD0     // LED_RD0
# define LEDD1            PORTD.RD1     // LED_RD1
# define LEDD2            PORTD.RD2     // LED_RD2
# define LEDD3            PORTD.RD3     // LED_RD3
# define LEDD4            PORTD.RD4     // LED_RD4
# define LEDD5            PORTD.RD5     // LED_RD5
# define LEDD6            PORTD.RD6     // LED_RD6
# define LEDD7            PORTD.RD7     // LED_RD7
void main() { // ABRE FUNCAO PRINCIPAL: MAIN
ADCON1 = 0x06;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
CMCON = 7;               // DESLIGA COMPARADORES
// CONFIGURACOES E/S E ESTADOS INICIAIS [BINARIO]
TRISA = 0b00000000;            PORTA = 0b00000000;
TRISB = 0b11111111;         // PORTB = 0b00000000;
TRISC = 0b00000000;            PORTC = 0b00000000;
TRISD = 0b00000000;            PORTD = 0b00000000;
TRISE = 0b00000000;            PORTE = 0b00000000;
// ESTADOS INICIAIS DOS ACESSORIOS
RELE_1 = 0;         RELE_2 = 0;
VENT = 0;           BUZZER = 1;
LEDD0 = 0;          LEDD1 = 0;       LEDD2 = 0;        LEDD3 = 0;
LEDD4 = 0;          LEDD5 = 0;       LEDD6 = 0;        LEDD7 = 0;
while (1){
RELE_1 =  !INT0;    // PRESSIONA LIGA
RELE_2 =  !INT1;    // PRESSIONA LIGA
VENT =    !INT2;    // PRESSIONA LIGA
BUZZER =   INT3;    // PRESSIONA LIGA
LEDD0 =   !INT4;    // PRESSIONA LIGA
LEDD1 =    INT5;    // PRESSIONA DESLIGA
LEDD2 =   !INT4;    // PRESSIONA LIGA
LEDD3 =    INT5;    // PRESSIONA DESLIGA
LEDD4 =   !INT4;    // PRESSIONA LIGA
LEDD5 =    INT5;    // PRESSIONA DESLIGA
LEDD6 =   !INT4;    // PRESSIONA LIGA
LEDD7 =    INT5;    // PRESSIONA DESLIGA
Delay_ms(50);}}