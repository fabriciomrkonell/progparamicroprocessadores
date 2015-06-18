// RECONFIGURADO PARA O PICKIT18F [MICROGENIOS] COM PIC16F877A @ 20/09/2014.
/*Header*****************************************************
LCD.VOLTMETER
This example illustrates the use of an alphanumeric LCD display. The function 
libraries simplify this program, which means that the effort made to create 
software pays off in the end.*/
// LCD MODULE CONNECTIONS = MICROGENIOS PIC16F
sbit LCD_RS at RE2_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
// END LCD MODULE CONNECTIONS
unsigned char ch;                    //
unsigned int adc_rd;                 // Declare variables
char *text;                          //
long tlong;                          //
void main() {
ADCON1 = 0x8E;                     // CONFIGURES THE FUNCTIONS OF THE PORT PINS
                                   // LEFT JUSTIFIED + AN0 NO VREF
CM2_bit, CM1_bit, CM0_bit = 1;     // ALL COMPARATORS OFF
    INTCON = 0;                    // ALL INTERRUPTS DISABLED
    TRISA.RA0 = 1;                 // PORTA AN0 CONFIGURED AS INPUT
    Lcd_Init();                    // LCD DISPLAY INITIALIZATION
    Lcd_Cmd(_LCD_CURSOR_OFF);      // LCD COMMAND (CURSOR OFF)
    Lcd_Cmd(_LCD_CLEAR);           // LCD COMMAND (CLEAR LCD)
    text = "> LAB.MCU.2014 <";     // DEFINE THE FIRST MESSAGE
    Lcd_Out(1,1,text);             // WRITE THE FIRST MESSAGE IN THE FIRST LINE
    text = "LCD   VOLTIMETRO";     // DEFINE THE SECOND MESSAGE
    Lcd_Out(2,1,text);             // DEFINE THE FIRST MESSAGE
    Delay_ms(2000);
    text = "TENSAO: ";             // DEFINE THE THIRD MESSAGE
    while (1) {                      // ENDLESS LOOP START
        adc_rd = ADC_Read(0);        // ADC PIN RA0 IS AN INPUT.
        Lcd_Out(2,1, text);          // WRITE RESULT IN THE SECOND LINE
        tlong = (long)adc_rd * 5000; // CONVERT THE RESULT IN MILLIVOLTS
        tlong = tlong / 1023;        // 0..1023 -> 0-5000mV
        ch = tlong / 1000;           // EXTRACT VOLTS (THOUSANDS OF MILLIVOLTS)
                                     // FROM RESULT
        Lcd_Chr(2,9, 48 + ch);       // WRITE RESULT IN ASCII FORMAT
        Lcd_Chr_CP(',');             // WRITE "," AT CURSOR POSITION
        ch = (tlong / 100) % 10;     // EXTRACT HUNDREDS OF MILLIVOLTS
        Lcd_Chr_CP(48 + ch);         // WRITE RESULT IN ASCII FORMAT
        ch = (tlong / 10) % 10;      // EXTRACT TENS OF MILLIVOLTS
        Lcd_Chr_CP(48 + ch);         // WRITE RESULT IN ASCII FORMAT
        ch = tlong % 10;             // EXTRACT DIGITS FOR MILLIVOLTS
        Lcd_Chr_CP(48 + ch);         // WRITE RESULT IN ASCII FORMAT
        Lcd_Out_Cp(" V ");           // WRITE " V " AT CURSOR POSITION
        Delay_ms(1);                 // WAITS 1 ms
    }                                                       // END ENDLESS LOOP
}                                                                   // END MAIN

// ----------------------------------------------------------------------------
// CMCON.CM2 = 1;          // CM2_bit = 1; // COMPARATORS OFF
// CMCON.CM1 = 1;          // CM1_bit = 1; // COMPARATORS OFF
// CMCON.CM0 = 1;          // CM0_bit = 1; // COMPARATORS OFF
// CM2_bit, CM1_bit, CM0_bit = 1;                            // COMPARATORS OFF
/* AN0 ONLY
ADCON1 = 0b10001110;    // CONFIGURES THE FUNCTIONS OF THE PORT PINS
                        // LEFT JUSTIFIED + AN0 SEM VREF
ADCON1 = 0x8E;          // CONFIGURES THE FUNCTIONS OF THE PORT PINS
                        // LEFT JUSTIFIED + AN0 SEM VREF
// AN3, 1 & 0 [AN2 = DIGITAL AND THE OTHERS ONES]
ADCON1 = 0b10000100;    // CONFIGURES THE FUNCTIONS OF THE PORT PINS
                        // LEFT JUSTIFIED + AN3,1,0 SEM VREF
ADCON1 = 0x84;          // CONFIGURES THE FUNCTIONS OF THE PORT PINS
                        // LEFT JUSTIFIED + AN3,1,0 SEM VREF
// AN4 TO AN0 [DIGITAL = THE OTHERS ONES]
ADCON1 = 0b10000010;    // CONFIGURES THE FUNCTIONS OF THE PORT PINS
                        // LEFT JUSTIFIED + AN4,3,2,1,0 SEM VREF
ADCON1 = 0x82;          // CONFIGURES THE FUNCTIONS OF THE PORT PINS
                        // LEFT JUSTIFIED + AN4,3,2,1,0 SEM VREF
// ^^^^^ TODOS REGISTRADORES AN CONFIGURADOS COMO DIGITAL ^^^^^
// ADCON1 = 0b00000110;  // CONFIGURES THE FUNCTIONS OF THE PORT PINS = DIGITAL
// ADCON1 = 0x06;        // CONFIGURES THE FUNCTIONS OF THE PORT PINS = DIGITAL
// ADCON1 = 0x07;        // CONFIGURES THE FUNCTIONS OF THE PORT PINS = DIGITAL
*/