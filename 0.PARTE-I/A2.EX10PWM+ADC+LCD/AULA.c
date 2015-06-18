/* EXEMPLOS DE APLICACAO EM LINGUAGEM C PARA MICROCONTROLADORES MICROCHIP
MCU:                  PIC16F877A
CRISTAL OSCILADOR:    HS - 8,000 MHz
COMPILADOR:           MIKROC PRO FOR PIC - VER:5.61
KIT DESENVOLVIMENTO:  PICKIT PIC18F - MICROGENIOS
GRAVADOR USB:         MICROICD ZIF - MICROGENIOS
PROGRAMADOR:          PICkit2 - VER: 2.61.00
==============================================================+==============
CHAVES DIP USADAS [0N] / [OFF]:
1- GLCD / LCD = [LCD]    2- RX = [OFF]      3- TX = [OFF]     4- REL1 = [OFF]
5- REL2 = [OFF]          6- SCK = [OFF]     7- SDA = [OFF]    8- RTC  = [OFF]
9- LED1 = [OFF]          0- LED2 = [OFF]
1- DIS1 = [OFF]          2- DIS2 = [OFF]    3- DIS3 = [OFF]   4- DIS4 = [OFF]
5- INFR = [OFF]          6- RESIS = [OFF]   7- TEMP = [OFF]   8- VENT = [ON]
9- AN0  = [OFF]          0- AN1 = [ON]      a- JUMPER BUZZER FECHADO
=============================================================================
DESCRICAO: REALIZA A LEITURA CONVERSOR AD1 E CONTROLE DA VENTOINHA POR PWM. 
APRESENTA CONTAGEM ENTRE 0 ATE 255 (REQUISITO BIBLIOTECA PWM) E RAZ√O CÕCLICA 
EM "%" NO LCD. INICIA COM DOIS BEEPs DE DURACAO DE 15 ms E INTERVALO DE 30 ms.
============================================================================ */
// DIRETIVAS DO COMPILADOR
# define BUZZER           PORTC.RC1     // BUZZER = SAIDA
// CONEXOES PARA LCD PIC16F - MICROGENIOS
sbit LCD_RS at RE2_bit;     sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN at RE1_bit;     sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4 at RD4_bit;     sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5 at RD5_bit;     sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6 at RD6_bit;     sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7 at RD7_bit;     sbit LCD_D7_Direction at TRISD7_bit;
int a = 0, aP = 0;                   // DEFINE VARI·VEL
// DEFINICAO DAS VARIAVEIS
unsigned char    cont_txt[6], aP_txt[6];
unsigned int     contagem = 0;
void main() {             // ABRE FUNCAO PRINCIPAL: MAIN
ADCON1 = 0b00001001;      // CONFIGURA ENTRADA AN1 COMO DIGITAL
CMCON = 7;                // DESLIGA COMPARADORES
// CONFIGURACOES E/S E ESTADOS INICIAIS [BINARIO]
   TRISA = 0b00000010;          //PORTA = 0b00000000;
   TRISB = 0b00000000;            PORTB = 0b00000000;
   TRISC = 0b00000000;            PORTC = 0b00000000;
// TRISD = 0b00000000;            PORTD = 0b00000000;
// TRISE = 0b00000000;            PORTE = 0b00000000;
// ESTADOS INICIAIS DOS ACESSORIOS
BUZZER = 1;
// SOM DE INICIO DE EXECUCAO DO PROGRAMA
BUZZER = 0; Delay_ms(15); BUZZER = 1; Delay_ms(30); 
BUZZER = 0; Delay_ms(15); BUZZER = 1;
// MENSAGEM INICIAL NO LCD
Lcd_Init();                        // INICIA O LCD
Lcd_Cmd(_LCD_CLEAR);               // LIMPA A TELA DO LCD
Lcd_Cmd(_LCD_CURSOR_OFF);          // DESLIGA O CURSOR
Lcd_Out(1, 1, "TESTE.D.CONTROLE");
Lcd_Out(2, 1, "VENTOINHA....PWM");
Delay_ms(2500);
Lcd_Cmd(_LCD_CLEAR);               // LIMPA A TELA DO LCD
Lcd_Out(1, 1, "CONTAGEM: ");       // ESCREVE MENSAGEM NA LINHA 1, COLUNA 1
Lcd_Out(2, 1, "RZ.CICL.: ");       // ESCREVE MANSAGEM NA LINHA 2, COLUNA 1
delay_ms (50);                     // AGUARDA 50ms
Pwm1_Init(5000);                   // INICIA MÛDULO PWM COM 5kHz = ANTES
Pwm1_Start();                      // INICIA MODULACAO LARGURA PULSOS
do{                                // ROTINA "do"
contagem = ADC_Read(1)/4;          // LE AD0 E SALVA 1/4 VALOR EM CONTAGEM
wordToStr(contagem, cont_txt);     // CONVERTE VALOR DO AD1 EM STRING
lcd_out(1,12,cont_txt);            // ESCREVE NO LCD VALOR DA CONVERS„O AD1
a = Adc_Read(1);                   // LÍ CANAL AD1 E SALVA EM "a"
a = (a * 0.25);                    // CONVERTE VALOR PARA A RAZAO CICLICA
PWM1_Set_Duty(a);                  // AJUSTA NOVO VALOR RAZAO CICLICA
aP = a * 100 / 255;
wordToStr(aP, aP_txt);             // CONVERSAO DE TIPOS DE DADOS
lcd_out(2,11, aP_txt);
Lcd_Chr_Cp('%');
Delay_10us;}                       // AGUARDA 10us
while (1);}