/* EXEMPLOS DE APLICACAO EM LINGUAGEM C PARA MICROCONTROLADORES MICROCHIP
MCU:                  PIC16F877A
CRISTAL OSCILADOR:    HS - 8,000 MHz
COMPILADOR:           MIKROC PRO FOR PIC - VER:5.61
KIT DESENVOLVIMENTO:  PICKIT PIC18F - MICROGENIOS
GRAVADOR USB:         MICROICD ZIF - MICROGENIOS
PROGRAMADOR:          PICkit2 - VER: 2.61.00
=============================================================================
CHAVES DIP USADAS [0N] / [OFF]:
1- GLCD / LCD = [LCD]    2- RX = [OFF]      3- TX = [OFF]     4- REL1 = [OFF]
5- REL2 = [OFF]          6- SCK = [OFF]     7- SDA = [OFF]    8- RTC = [OFF]
9- LED1 = [OFF]          0- LED2 = [OFF]
1- DIS1 = [OFF]          2- DIS2 = [OFF]    3- DIS3 = [OFF]   4- DIS4 = [OFF]
5- INFR = [OFF]          6- RESIS = [OFF]   7- TEMP = [OFF]   8- VENT = [OFF]
9- AN0 =  [OFF]          0- AN1 = [OFF]     a- JUMPER BUZZER FECHADO
=============================================================================
DESCRICAO: AO PRESSIONAR-SE INT2 [RB2] GRAVA UMA LETRA QUALQUER NA MEMORIA
INTERNA EEPROM, AO PRESSIONAR-SE INT1 [RB1] REALIZA-SE A LEITURA DO CONTEUDO 
GRAVADO. ALEM DISSO APRESENTA MENSAGENS DE INSTRUCAO NA TELA DO LCD. APOS A 
GRAVACAO [RB1] DESLIGAR O MICROCONTROLADOR DA ENERGIA ELETRICA, AGUARDAR PELO 
MENOS 1 MINUTO, REENERGIZA-LO E VERIFICAR SE A INFORMACAO FOI RETIDA APENAS 
USANDO A OPCAO DE LEITURA. MODIFICAR O CONTEUDO E REAPLICAR O PROCEDIMENTO.
============================================================================ */
// CONEXOES PARA LCD PIC16F - MICROGENIOS
sbit LCD_RS at RE2_bit;     sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN at RE1_bit;     sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4 at RD4_bit;     sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5 at RD5_bit;     sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6 at RD6_bit;     sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7 at RD7_bit;     sbit LCD_D7_Direction at TRISD7_bit;
// DEFINICAO DAS VARIAVEIS
unsigned char INFO;           // INFORMACAO A SER GUARDADA NA MEMORIA
unsigned char INFO_s[6];      // INFORMACAO A SER GUARDADA NA MEMORIA 'STRING'
// VARIAVEIS DE MENSAGEM COM SEUS VALORES ATRIBUIDOS
unsigned char msg_1[] = "E  E  P  R  O  M";
unsigned char msg_2[] = "TESTE D LE/GRAVA";
unsigned char msg_3[] = "G R A V A D A  !";
unsigned char msg_4[] = "L E I T U R A:..";
unsigned char msg_5[] = "PRESSIONAR: INT1";
unsigned char msg_6[] = "LE ou INT2.GRAVA";
// DIRETIVAS DO COMPILADOR
# define BUZZER           PORTC.RC1     // BUZZER = SAIDA
# define INT2             PORTB.RB2     // INTERRUPTOR 2 / RB2 [SW1]
# define INT1             PORTB.RB1     // INTERRUPTOR 1 / RB1 [SW2]
void main() {            // FUNCAO PRINCIPAL: MAIN
ADCON1 = 0x07;           // CONFIGURA ENTRADAS AN COMO E/S DIGITAIS
CMCON = 7;               // DESLIGA COMPARADORES
// CONFIGURACOES E/S E ESTADOS INICIAIS [BINARIO]
   TRISA = 0b00000000;            PORTA = 0b00000000;
   TRISB = 0b00000110;         // PORTB = 0b00000000;
   TRISC = 0b00000000;            PORTC = 0b00000000;
// ESTADOS INICIAIS DOS ACESSORIOS
BUZZER = 1;
// MENSAGEM INICIAL NO LCD
Lcd_Init();                                 // INICIA O LCD
Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
Lcd_Cmd(_LCD_CURSOR_OFF);                   // DESLIGA O CURSOR
Lcd_Out(1, 1, msg_2); 
Lcd_Out(2, 1, msg_1);
Delay_ms(1500);
Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
while (1) {
if (!INT2) {
BUZZER = 0; Delay_ms(15); BUZZER = 1; Delay_ms(50);
BUZZER = 0; Delay_ms(15); BUZZER = 1;       // SIRENE SOA DUAS VEZES CURTAS
// EEPROM_Write(unsigned short address, unsigned short data);
EEPROM_Write(0x08, 'K');               //ESCREVE "K" NA POSICAO 0x08 DA EEPROM
Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
Lcd_Out(1, 1, msg_1);
Lcd_Out(2, 1, msg_3);   
Delay_ms(1000);
Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
} else if (!INT1) {
BUZZER = 0; Delay_ms(15); BUZZER = 1;       // SIRENE SOA UMA VEZ CURTA
// EEPROM_Read(unsigned short address);
INFO = EEPROM_Read(0x08);                   // LE A POSICAO 0x08 DA EEPROM
ShortToStr (INFO, INFO_s);
Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
Lcd_Out(1, 1, msg_1);
Lcd_Out(2, 1, msg_4);   
Delay_ms(1000);
Lcd_Cmd(_LCD_CLEAR);                        // LIMPA A TELA DO LCD
Lcd_Out(1,1,INFO_s);   
Lcd_Out_Cp(" = DECIMAL");      
Lcd_Cmd(_LCD_SECOND_ROW);
Lcd_Chr_Cp(0+INFO);    
Lcd_Out_Cp(" =  CHARACTER");   
Delay_ms(2500);
Lcd_Cmd(_LCD_CLEAR);}                       // LIMPA A TELA DO LCD
else {
Lcd_Out(1, 1, msg_5);                       
Lcd_Out(2, 1, msg_6);
}                                                                  // FIM ELSE
 }                                                               // FIM  WHILE
  }                                                                // FIM MAIN