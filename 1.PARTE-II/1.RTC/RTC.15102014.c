/************************
****************************************************/
/* Microcontroller: PIC16F877A @ 8 MHz + MICROGENIOS --> 0K!                */
/****************************************************************************/
/* PROGRAMA EXEMPLO: RTC. OBJETIVO: Aprender a utilizar o RTC para leitura de
Datas e Hora. MICROCONTROLADOR: PIC18F4520.
PARA MAIS INFORMACOES REPORTAR-SE A FOLHA DE DADOS DO CI RTC --> DS1307.
SOFTWARE: MikroC PRO for PIC; CRISTAL: 8Mhz. --> CHAVES DE FUN«√O:
  --------------------- ----------------------
 |GLCD\LCD ( 1) = ON   |DIS1     ( 1) = OFF   |
 |SCK      ( 6) = ON   |RESIS    ( 6) = OFF   |
 |SDA      ( 7) = ON   |TEMP     ( 7) = OFF   |
 |RTC      ( 8) = ON   |VENT     ( 8) = OFF   |
  --------------------- ----------------------
OBS: - HABILITAR BIBLIOTECA LCD. - HABILITAR BIBLIOTECA I2C.
******************************************************************************/
// INCLUDES AND DEFINES
#include    "lcdMicroGenios.h"
#define     BUZZER        PORTC.RC1
/*****************************************************************************/
// VARIAVEIS GLOBAIS
unsigned char ucHora;                  // ARMAZENA HORA.
unsigned char ucMinuto;                // ARMAZENA MINUTO.
unsigned char ucSegundo;               // ARMAZENA SEGUNDO.
unsigned char ucDia;                   // ARMAZENA DIA.
unsigned char ucMes;                   // ARMAZENA MES.
unsigned char ucAno;                   // ARMAZENA ANO.
unsigned char ucDia_Semana;            // ARMAZENA DIA DA SEMANA.
char *ucTexto;                         // PONTEIRO PARA LEITURA DE STRINGS.
unsigned int i = 0, nTimes = 0, tHigh = 0, tLow = 0; // BeepBeep FUNCTION VARS
/****************************************************************************/
// PROTOTIPOS DE FUNÁ„O.
void Display_LCD();
void Encontra_Dia_Semana();
void Grava_RTC();
void Leitura_RTC();
void Converte_BCD  (unsigned char ucLinha, 
                    unsigned char ucColuna,unsigned char ucValor);
/****************************************************************************/
// FUNCTION TO SOUNDS BEEP N WITH TIMES THIGH AND TLOW
void BeepBeep(unsigned int nTimes, unsigned int tHigh, unsigned int tLow){
for (i = 0; i < nTimes; i++){
BUZZER = 0;      VDelay_ms(tHigh);     BUZZER = 1;    VDelay_ms(tLow);}}
/****************************************************************************/
void main(){
   ADCON1= 0X07;             // TORNA TODOS OS PINOS A/D COMO I/O DE USO GERAL
   TRISA = 0;                                // DEFINE PORTA,B,C,D,E
   TRISB = 0;   TRISC = 0;   TRISD = 0;   TRISE = 0;   
   TRISC.RC1 = 0;            BUZZER = 1;     // BUZZER LOW ACTIVE
   Lcd_Init();                               // INICIALIZA LCD NO MODO 4 BIT
   Lcd_Cmd(_LCD_CLEAR);                      // APAGA MOSTRADOR
   Lcd_Cmd(_LCD_CURSOR_OFF);                 // DESLIGA CURSOR
   Grava_RTC();
   BeepBeep(3,15,150);                       // TOCA BUZZER NO INICIO
   while(1){
     Display_LCD();     // ESCREVE NO MOSTRADOR LCD O VALOR
     Leitura_RTC();     // EFETUA LEITURA DE SEGUNDO, MINUTO E HORAS DO DS1307
     Delay_ms(200);}}   // AGUARDA 200 milisegundos
/****************************************************************************/
// ROTINA DE CONVERS„O DE DADOS PARA BCD
void Converte_BCD     (unsigned char ucLinha,
                       unsigned char ucColuna,unsigned char ucValor) {
  unsigned char ucValor1, ucValor2;
  ucValor1 = (ucValor >> 4  ) + '0';    
// CONVERTE O PRIMEIRO NIBBLE EM BCD E APÛS EM STRING
  Lcd_Chr(ucLinha,ucColuna,ucValor1);   // ESCREVE CARACTERE NO LCD
  ucValor2 = (ucValor & 0x0F) + '0';    
// CONVERTE O SEGUNDO NIBBLE EM BCD E APÛS ISSO, EM STRING
  Lcd_Chr_CP(ucValor2);}                // ESCREVE CARACTERE NO LCD
/****************************************************************************/
void Leitura_RTC() {          // ROTINA DE LEITURA DO DS1307
   I2C1_Start();              // INICIA COMUNICAÁ„O I2C
   I2C1_Wr(0xD0);             
// END. FIXO PARA DS1307: 1101000X, ONDE X = 0 È PARA GRAVAÁ„O
   I2C1_Wr(0);                
// END. ONDE COMEÁA A PROGRAMAÁ„O DO RELÛGIO, END DOS SEGUNDOS.
   I2C1_Repeated_Start();     // ISSUE I2C SIGNAL REPEATED START
   I2C1_Wr(0xD1);             
// END. FIXO PARA DS1307: 1101000X, ONDE X = 1 È PARA LEITURA
   ucSegundo = I2C1_Rd(1);    
// LÍ O PRIMEIRO BYTE(SEGUNDOS),INFORMA QUE CONTINUA LENDO
   ucMinuto = I2C1_Rd(1);     // LÍ O SEGUNDO BYTE(MINUTOS)
   ucHora = I2C1_Rd(1);       // LÍ O TERCEIRO BYTE(HORAS)
   ucDia_Semana = I2C1_Rd(1);
   ucDia = I2C1_Rd(1);   
   ucMes = I2C1_Rd(1);
   ucAno = I2C1_Rd(0);        
// LÍ O SÈTIMO BYTE(ANO),ENCERRA AS LEITURAS DE DADOS
   I2C1_Stop();}              // FINALIZA COMUNICAÁ„O I2C
/****************************************************************************/
// VALORES INICIAIS DO RELOGIO EM TEMPO REAL - RTC
void Grava_RTC(){
   I2C1_Init(100000);     // INICIA I2C COM FREQUENCIA DE 100 kHz
   I2C1_Start();          // INICIA A COMUNICAÁ„O I2C
   I2C1_Wr(0xD0);
// END. FIXO PARA DS1307: 1101000X, ONDE X = 0 È PARA GRAVAÁ„O
   I2C1_Wr(0);            
// END. ONDE COMEÁA A PROGRAMAÁ„O DO RELÛGIO, END. DOS SEGUNDOS.
   I2C1_Wr(0x55);         // INICIA COM 55 SEGUNDOS.
   I2C1_Wr(0x58);         // INICIA COM 58 MINUTOS.
   I2C1_Wr(0x23);         // INICIA COM 23 h (FORMATO 24 HORAS).
   I2C1_Wr(0x03);         // INICIA COM TERÁA-FEIRA
   I2C1_Wr(0x24);         // INICIA COM DIA 24
   I2C1_Wr(0x12);         // INICIA COM MÍS 12
   I2C1_Wr(0x14);         // INICIA COM ANO 2014
   I2C1_Stop();}          // FINALIZA COMUNICAÁ„O I2C
/****************************************************************************/
void Encontra_Dia_Semana() {
   switch (ucDia_Semana) {
      case 01: ucTexto = "DOMINGO"; break; // CASO DIAS_SEMANA = 01
      case 02: ucTexto = "SEGUNDA"; break; // CASO DIAS_SEMANA = 02
      case 03: ucTexto = "TERCA";   break; // CASO DIAS_SEMANA = 03
      case 04: ucTexto = "QUARTA";  break; // CASO DIAS_SEMANA = 04
      case 05: ucTexto = "QUINTA";  break; // CASO DIAS_SEMANA = 05
      case 06: ucTexto = "SEXTA";   break; // CASO DIAS_SEMANA = 06
      default: ucTexto = "SABADO";}}       // SE N„O FOR NENHUM DESSES
/****************************************************************************/
void Display_LCD() {     // MOSTRA VALORES NO LCD E TOCA BUZZER PERIODICAMENTE
   Lcd_Out(1,1,"(Hora)");
   Converte_BCD(1,7,ucHora);     // CONVERS„O DA VARI·VEL HORAS PARA BCD
   Lcd_Chr_CP(':');              // ESCREVE NO LCD
   Converte_BCD(1,10,ucMinuto);  // CONVERS„O DA VARI·VEL MINUTO PARA BCD
   Lcd_Chr_CP(':');              // ESCREVE NO LCD
   Converte_BCD(1,13,ucSegundo); // CONVERS„O DA VARI·VEL SEGUNDO PARA BCD
if (ucHora == 0x00 && ucMinuto == 0x00 && ucSegundo == 0x00)
BeepBeep(1,50,150);                                        // TOCA BUZZER HORA
if (ucMinuto == 0x00 && ucSegundo == 0x00) 
BeepBeep( 1,25,100);                                        // TOCA BUZZER MIN
if (ucSegundo == 0x00) BeepBeep( 1,15, 50);                 // TOCA BUZZER SEG
   Lcd_Out(2,1,"(Data)");
   Converte_BCD(2,7,ucDia);      // CONVERS„O DA VARI·VEL DIA PARA BCD
   Lcd_Chr_CP('/');              // ESCREVE NO LCD
   Converte_BCD(2,10,ucMes);     // CONVERS„O DA VARI·VEL MES PARA BCD
   Lcd_Chr_CP('/');              // ESCREVE NO LCD
   Converte_BCD(2,13,ucAno);     // CONVERS„O DA VARI·VEL ANO PARA BCD
   Encontra_Dia_Semana();      
   Lcd_Out(3,1,ucTexto);}        // MOSTRA DIA DA SEMANA
/****************************************************************************/