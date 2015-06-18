int count = 0, time = 0;
int cB = 0, base = 0, tempDec = 0, tempCent = 0, tempMil = 0;

int numbers[] = {63,6,91,79,102,109,125,7,127,111};

void main() {

     ADCON1 = 0x06;
     TRISA.RA2 = 0;
     TRISA.RA3 = 0;
     TRISA.RA4 = 0;
     TRISA.RA5 = 0;
     TRISD = 0;
     
     TRISC.RC1 = 0;

     PORTC.RC1 = 1;
               
     while(1) {
          
          while(time < 200) {

            if(count % 10 != 0) {
                PORTD = numbers[count % 10];
                PORTA.RA5 = 1;
               if(count % 10 == 5) {
                   PORTC.RC1 = 1;
               }
            } else {
                PORTD = numbers[0];
                PORTA.RA5 = 1;
                PORTC.RC1 = 0;
            }
            Delay_ms(2);
            PORTA.RA5 = 0;
            
            if(count % 100 != 0) {
               tempDec = (int) (count % 100) / 10;
               PORTD = numbers[tempDec];
               PORTA.RA4 = 1;
            } else {
                PORTD = numbers[0];
                PORTA.RA4 = 1;
            }
            Delay_ms(3);
            PORTA.RA4 = 0;
            
            if(count % 1000 != 0) {
               tempCent = (int) (count % 1000) / 100;
               PORTD = numbers[tempCent];
               PORTA.RA3 = 1;
            } else {
                PORTD = numbers[0];
                PORTA.RA3 = 1;
            }
            Delay_ms(2);
            PORTA.RA3 = 0;
            
            if(count % 10000 != 0) {
               tempCent = (int) (count % 10000) / 1000;
               PORTD = numbers[tempCent];
               PORTA.RA2 = 1;
            } else {
                PORTD = numbers[0];
                PORTA.RA2 = 1;
            }
            Delay_ms(2);
            PORTA.RA2 = 0;
            
            time += 50;
          }
          count++;

          if(count >= 10000) count = 0;
          if(time >= 200) time = 0;
          
          PORTA.RA2 = 0;
          PORTA.RA3 = 0;
          PORTA.RA4 = 0;
          

     }

}
