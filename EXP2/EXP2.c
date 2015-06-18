

void main() {

     TRISC.RC0 = 0;
     TRISE.RD0 = 0;
     
     while(1) {
         PORTC.RC0 = 1;
         PORTE.RE0 = 0;
         Delay_ms(50);
         PORTC.RC0 = 0;
         PORTE.RE0 = 1;
         Delay_ms(50);
     }
     

}