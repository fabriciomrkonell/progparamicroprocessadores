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
DESCRICAO: ESTE CODIGO FAZ COM QUE TODOS OS LEDs DO PORTB E PORT D PISQUEM
ALTERNADAMENTE COM PERIODO DE T = 350 ms POR DURANTE 30s. AO TERMINO DE 30s
TODOS OS LEDs PERMANECEM DESLIGADOS.
============================================================================ */
//DEFINICAO DE VARIAVEIS
unsigned int t = 0;
void main() { // ABRE FUNCAO PRINCIPAL: MAIN
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
while (t < 86){          // ESTABELECE A DURACAO DO TEMPO DE FUNCIONAMENTO
// PISCA TODOS OS LEDS PERIODO DE 350 ms
PORTB = ~ PORTB;         // INVERTE ESTADO PORTB
PORTD = ~ PORTB;         // INVERTE ESTADO PORTD
Delay_ms(350);
t++;
}             // FECHA WHILE
PORTB = 0x00;            // AO FINAL DO TEMPO DESLIGA TODOS OS LEDS
PORTD = 0x00;
}             // FECHA MAIN
// ATENCAO: 1000 ms = 1s => INTERVALO PISCADAS = 350ms
// 1 min = 60 * 1s = 60 * 1000 ms
// LOGO: 1/2 min =  30000ms    =>    30000ms / 350ms =  85,71 =  86
// LOGO: 1 min =    60000ms    =>    60000ms / 350ms = 171,43 = 172
// LOGO: 2 min =   120000ms    =>   120000ms / 350ms = 342,86 = 343
// LOGO: 3 min =   180000ms    =>   180000ms / 350ms = 514,28 = 514