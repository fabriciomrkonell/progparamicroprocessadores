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
DESCRICAO: ESTE CODIGO FAZ COM QUE TODOS OS LED DO PORTB E PORTD PISQUEM
COM RAZAO CICLICA DE 90% EM PERIODO DE T = 1000 ms INDEFINIDAMENTE.
============================================================================ */
void main() {            // ABRE FUNCAO PRINCIPAL: MAIN
ADCON1 = 0x06;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
CMCON = 7;               // DESLIGA COMPARADORES

// CONFIGURACOES E/S E ESTADOS INICIAIS [BINARIO]
TRISA = 0b00000000;
TRISB = 0b00000000;
TRISC = 0b00000000;
TRISD = 0b00000000;
TRISE = 0b00000000;
PORTA = 0b00000000;
PORTB = 0b00000000;
PORTC = 0b00000000;
PORTD = 0b00000000;
PORTE = 0b00000000;

// PISCAR TODOS OS LEDS RAZAO CICLICA 1PARA 6
while (1){    // ABRE WHILE
PORTB = 0b00000000;     // ESTADO PORTB
PORTD = 0b00000000;     // ESTADO PORTD
Delay_ms(100);
PORTB = 0b11111111;     // ESTADO PORTB
PORTD = 0b11111111;     // ESTADO PORTD
Delay_ms(900);
}             // FECHA WHILE
}             // FECHA MAIN