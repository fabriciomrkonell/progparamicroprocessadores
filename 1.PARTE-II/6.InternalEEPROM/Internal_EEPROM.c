/* Project name: Use of internal EEPROM for storing information
Copyright:    (c) Rajendra Bhatt, 2011.
Description:  This code demonstrates how to perform basic Read and Write
              operations with the internal EEPROM of PIC16F628A.
MCU:          PIC16F628A        Oscillator:      XT, 4.0 MHz */
sbit LCD_RS at RA0_bit;                      // LCD connections definitions
sbit LCD_EN at RA1_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_RS_Direction at TRISA0_bit;
sbit LCD_EN_Direction at TRISA1_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;        // End LCD connections definitions
// Other connections
sbit SW1 at RB0_bit;  sbit SW2 at RB1_bit;  sbit SW3 at RB2_bit;
// String array to store 3 digit access code
char message1[] = "1.READ";
char message2[] = "2.WRITE";
char message3[] = "3.Delete";
char message4[] = "WRITE COMPLETED";
char message5[] = "Read Data";
char message6[] = "Data Deleted";
char message7[] = "Embedded-Lab.com";
char Edata[] = "0000000000000000";
unsigned short  i, NUM ;
unsigned int ADD; // Start EEPROM Location
char temp;
void Delay2s(){
 Delay_ms(2000);}
void Debounce(){
 Delay_ms(100);}
void main() {
 PORTB = 0;  PORTA = 0;    TRISB = 0b00001111;    TRISA = 0b00100000;
 CMCON=0x07; Lcd_Init();            // Initialize LCD
 Lcd_Cmd(_LCD_CLEAR);               // Clear LCD
 Lcd_Cmd(_LCD_CURSOR_OFF);          // Turn cursor off
 Lcd_Out(1, 1, "Lab 13: Testing"); Lcd_Out(2, 1, "internal EEPROM");
 Delay2s();
 start:
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,message1);             // Write message1 in 1st row
 Lcd_Out(1,8,message2);
 Lcd_Out(2,1,message3);
 do{  // READ OPERATION
  if (!SW1) {
      Debounce();
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out(1,1,message5);
      ADD = 0;
      for (i=0; i<16; i++) {
       temp = EEPROM_Read(ADD+i);
       Edata[i] = temp;      }
      Lcd_Out(2,1,Edata);
      Delay2s();
      goto start;   }
  if (!SW2) {    // WRITE OPERATION
      Debounce();
      ADD = 0;
      for (i=0; i<16; i++) {
      temp = message7[i];
      EEPROM_Write(ADD+i,temp);      }
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out(1,1,message4);
      Delay2s();
      goto start;   }
  if (!SW3) {    // DELETE OPERATION
      Debounce();
      Lcd_Cmd(_LCD_CLEAR);
      Lcd_Out(1,1,message6);
      for (i=0; i<16; i++) {
      temp = '0';
      EEPROM_Write(ADD+i, temp);      }
      Delay2s() ;
      goto start;   } } while(1);}