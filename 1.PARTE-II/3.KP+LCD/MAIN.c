/****************************************************************************/
/* Microcontroller: PIC16F877A @ 8 MHz + MICROGENIOS --> 0K!                */
/****************************************************************************/
// PIC16F877A + TECLADO MATRICIAL + LCD + KIT MICROGENIOS @ 8 MHz
// ATENCAO!!!     LIGAR APENAS O LCD + NEHUM OUTRO PERIFERICO EH NECESSARIO!!!
// VERIFICAR O FUNCIONAMENRO DO TECLADO MATRICIAL PARA FUTURAS APLICACOES!!!!!
#include "lcdMicroGenios.h"              // LCD MODULE CONNECTIONS MICROGENIOS
#define KP_R1     PORTD.RD0   // LINHA 1            // START - KEYPAD SETTINGS
#define KP_R2     PORTD.RD1   // LINHA 2
#define KP_R3     PORTD.RD2   // LINHA 3
#define KP_R4     PORTD.RD3   // LINHA 4
#define KP_C1     PORTB.RB0   // COLUNA 1
#define KP_C2     PORTB.RB1   // COLUNA 2
#define KP_C3     PORTB.RB2   // COLUNA 3             // END - KEYPAD SETTINGS
// VARIABLES DECLARATIONS
unsigned char key_get;
unsigned int i = 0;
unsigned char keypad_wait(void);
unsigned char keypad_read(void);
unsigned short t = 10;                                             // KP TIME
// KEYPAD READ FUNCTION - START
unsigned char keypad_read(void){
// START KEYPAD SCANNING PROCESS
KP_R1 = 0;      // SCAN KEYPAD ON FIRST ROW: 1, 2, 3, A
KP_R2 = 1;      KP_R3 = 1;     KP_R4 = 1;
VDelay_ms(t);
if (KP_C1 == 0) return '*';    // KEY '*' IS PRESSED
if (KP_C2 == 0) return '0';    // KEY '0' IS PRESSED
if (KP_C3 == 0) return '#';    // KEY '#' IS PRESSED
VDelay_ms(t);
KP_R1 = 1;      // SCAN KEYPAD ON SECOND ROW: 1, 2, 3, A
KP_R2 = 0;      KP_R3 = 1;     KP_R4 = 1;
VDelay_ms(t);
if (KP_C1 == 0) return '7';    // KEY '7' IS PRESSED
if (KP_C2 == 0) return '8';    // KEY '8' IS PRESSED
if (KP_C3 == 0) return '9';    // KEY '9' IS PRESSED
VDelay_ms(t);
KP_R1 = 1;      // SCAN KEYPAD ON THIRD ROW: 1, 2, 3, A
KP_R2 = 1;      KP_R3 = 0;     KP_R4 = 1;
VDelay_ms(t);
if (KP_C1 == 0) return '4';    // KEY '4' IS PRESSED
if (KP_C2 == 0) return '5';    // KEY '5' IS PRESSED
if (KP_C3 == 0) return '6';    // KEY '6' IS PRESSED
VDelay_ms(t);
KP_R1 = 1;      // SCAN KEYPAD ON FOURTH ROW: 1, 2, 3, A
KP_R2 = 1;      KP_R3 = 1;     KP_R4 = 0;
VDelay_ms(t);
if (KP_C1 == 0) return '1';    // KEY '1' IS PRESSED
if (KP_C2 == 0) return '2';    // KEY '2' IS PRESSED
if (KP_C3 == 0) return '3';    // KEY '3' IS PRESSED
VDelay_ms(t);
return 0xFF;                                   // IF NO KEY PRESS, RETURN 0xFF
}                                                // KEYPAD READ FUNCTION - END
// MAIN FUNCTION - START
void main(){
ADCON1 = 0x06;                                           // ALL I/O AS DIGITAL
TRISB.RB0 = 1;    TRISB.RB1 = 1;    TRISB.RB2 = 1;       // C1, C2, C3
TRISD.RD0 = 0;    TRISD.RD1 = 0;    TRISD.RD2 = 0;    TRISD.RD3 = 0;  // L1-4
// IT IS AN UNSIGNED CHAR VARIABLE USED TO STORE THE DATA GET FROM THE 4×4 KP
// INITIALIZE THE PORTC<7:4> AS OUTPUT, PORTC<3:0> AS INPUT
LCD_init();
Lcd_Cmd(_LCD_CURSOR_OFF);
Lcd_Cmd(_LCD_CLEAR);
while(1){
// WHILE LOOP USED IN HERE IN ORDER THE MICRO-CONTROLLER CAN ALWAYS READ THE
// DATA FROM THE KEYPAD
LCD_Out(1,1,"PRESSIONAR TECLA");
// DISPLAY ENTER WORD ON THE FIRST ROW OF THE 16×2 LCD
LCD_cmd(_LCD_SECOND_ROW);    // GO TO 2ND ROW OF THE 16×2 LCD
for(i = 0; i < 17; i++) {
//THIS LOOP USED IN ORDER FOR THE LCD TO DISPLAYED 16 CHARACTERS
key_get = keypad_wait();
//THE VARIABLE KEY_GET WILL STORE THE DATA FROM "keypad_wait()" FUNCTION.
Lcd_Chr_Cp(key_get);
// THE LCD WILL DISPLAY THE CHARACTER OF THE KEYPAD AS YOU PRESSED THE BUTTON.
// IT WILL SHOWED 16 CHARACTERS AND IF YOU PRESSED THE KEYPAD FURTHER MORE,
// THE 16   CHARACTERS WILL BE CLEAR AND STARTED AGAIN FROM THE FIRST COLUMN
// OF THE 2ND ROW ON THE16X2 LCD.
}                                                                   // END FOR
LCD_cmd(_LCD_CLEAR);                                          // CLEAR THE LCD
}                                                                 // END WHILE
}                                                       // MAIN FUNCTION - END
// KEYPAD WAIT FUNCTION - START
unsigned char c_pressed_key = 0xFF;                        // THE PRESSED KEY!
unsigned char keypad_wait(void){
c_pressed_key = 0xFF;                        // WAIT UNTIL THE KEY IS PRESSED!
do{c_pressed_key = keypad_read();}
while(c_pressed_key == 0xFF);               // WAIT UNTIL THE KEY IS RELEASED!
while(keypad_read() != 0xFF);
return c_pressed_key;
}                                                // END "keypad_wait" FUNCTION