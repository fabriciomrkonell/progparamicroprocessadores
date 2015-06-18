int i = 1;
    
void write(int value, int time);

void main() {


     TRISC.RC1 = 0;
     
     while(1) {
              for(i = 0; i < 50; i++) {
                  write(0, i);
                  write(1, i);
              }
              for(i = 50; i > 0; i--) {
                  write(0, i);
                  write(1, i);
              }
     }

}


void write(int value, int time) {
     PORTC.RC1 = value;
     VDelay_ms(time);
}