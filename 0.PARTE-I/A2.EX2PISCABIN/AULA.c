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
9- LED1 = [ON]           0- LED2 = [ON]
1- DIS1 = [OFF]          2- DIS2 = [OFF]    3- DIS3 = [OFF]   4- DIS4 = [OFF]
5- INFR = [OFF]          6- RESIS = [OFF]   7- TEMP = [OFF]   8- VENT = [OFF]
9- AN0 = [OFF]           0- AN1 = [OFF]     a- JUMPER BUZZER ABERTO
=============================================================================
DESCRICAO: DESCRICAO: ESTE CODIGO FAZ COM QUE TODOS OS LED DO PORTB E PORTD
PISQUEM ALTERNADAMENTE UMA COMBINACAO BINARIA COM T = 600 ms INDEFINIDAMENTE.
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
PORTB = 0b10101010;
PORTC = 0b00000000;
PORTD = 0b01010101;
PORTE = 0b00000000;

while (1){              // ABRE WHILE
PORTB = ~ PORTB;        // ESTADO PORTB
PORTD = ~ PORTD;        // ESTADO PORTD
Delay_ms(600);
}                       // FECHA WHILE
}                       // FECHA MAIN