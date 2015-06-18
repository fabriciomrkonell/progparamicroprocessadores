#line 1 "H:/0.DSC/2014.2/4.MPU/LAB/CODE/InternalEEPROM/Internal_EEPROM.c"
#line 6 "H:/0.DSC/2014.2/4.MPU/LAB/CODE/InternalEEPROM/Internal_EEPROM.c"
sbit LCD_RS at RA0_bit;
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
sbit LCD_D7_Direction at TRISB7_bit;

sbit SW1 at RB0_bit; sbit SW2 at RB1_bit; sbit SW3 at RB2_bit;

char message1[] = "1.READ";
char message2[] = "2.WRITE";
char message3[] = "3.Delete";
char message4[] = "WRITE COMPLETED";
char message5[] = "Read Data";
char message6[] = "Data Deleted";
char message7[] = "Embedded-Lab.com";
char Edata[] = "0000000000000000";
unsigned short i, NUM ;
unsigned int ADD;
char temp;
void Delay2s(){
 Delay_ms(2000);}
void Debounce(){
 Delay_ms(100);}
void main() {
 PORTB = 0; PORTA = 0; TRISB = 0b00001111; TRISA = 0b00100000;
 CMCON=0x07; Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Lab 13: Testing"); Lcd_Out(2, 1, "internal EEPROM");
 Delay2s();
 start:
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,message1);
 Lcd_Out(1,8,message2);
 Lcd_Out(2,1,message3);
 do{
 if (!SW1) {
 Debounce();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,message5);
 ADD = 0;
 for (i=0; i<16; i++) {
 temp = EEPROM_Read(ADD+i);
 Edata[i] = temp; }
 Lcd_Out(2,1,Edata);
 Delay2s();
 goto start; }
 if (!SW2) {
 Debounce();
 ADD = 0;
 for (i=0; i<16; i++) {
 temp = message7[i];
 EEPROM_Write(ADD+i,temp); }
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,message4);
 Delay2s();
 goto start; }
 if (!SW3) {
 Debounce();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,message6);
 for (i=0; i<16; i++) {
 temp = '0';
 EEPROM_Write(ADD+i, temp); }
 Delay2s() ;
 goto start; } } while(1);}
