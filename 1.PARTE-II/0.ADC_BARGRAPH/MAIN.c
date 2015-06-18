/****************************************************************************/
/* Microcontroller: PIC16F877A @ 8 MHz + MICROGENIOS --> 0K!                */
/****************************************************************************/
/******************************************************************************
Programa: LÊ CONVERSOR AD0 e APRESENTA RESULTADO NO LCD DE DUAS FORMAS:
          LINHA 1 EM CONTAGENS: ENTRE 0 A 1023 CONTAGENS;
          LINHA 2 BARGRAPH
Placa: PICKIT18F PICGENIOS - PIC16F877A
******************************************************************************/
# include "lcdMicroGenios.h"
unsigned int adc_rd, diff;
unsigned long int BarSegmentNum;
unsigned char adcprint[7], i;
const char character[] = {31,31,31,31,31,31,31,31};
void CustomChar(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}
void main(){
ADCON1 = 0b00001110;             // HABILITA CANAL AN0 E AN1
TRISA.RA0 = 1;
Lcd_Init ();                     // START LCD
Lcd_Cmd(_Lcd_Clear);             // CLEAR LCD
Lcd_Cmd(_LCD_CURSOR_OFF);        // TURN LCD'S CURSOR OFF
ADC_Init();
while(1){
adc_rd = ADC_Read(0);            // GET ADC VALUE FROM 1ST CHANNEL
IntToStr(adc_rd, adcprint);                            // CONVERSION TO STRING
Lcd_out(1,1,"COUNTS..: ");
Lcd_Out_Cp(adcprint);                     // PRINTS ADC STEPS IN LCD FIRST ROW
if (diff != adc_rd){
BarSegmentNum = adc_rd /(1023 / 16);
                                    // CALCULATE NUMBERS OF BAR GRAPH SEGMENTS
Lcd_out(2,1,"                ");    // CLEARS LCD SECOND ROW
for (i = 0; i < BarSegmentNum; i++){
                               // LOOP TO PRINT EACH BAR SEGMENT IN SECOND ROW
CustomChar(2, i+1);}}         // PRINT CUSTOM CHARACTER FOR BARGRAPH SEGMENT
Delay_ms(750);                 // STABILIZE LCD DISPLAY
diff = adc_rd;
}                              // END WHILE
}                              // END MAIN