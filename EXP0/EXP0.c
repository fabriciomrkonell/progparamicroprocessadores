int i = 0, t = 1, time = 30;

int pot(int val, int power);

void main() {

     int count = 0;
     
     TRISB = 0b00000000;
     TRISD = 0b00000000;
     PORTB = 0b00000000;
     PORTD = 0b00000000;

     while(t % (time + 1) != 0) {
     
        int fact = 0;
        while(fact < 20) {
          PORTB = 0b00000001 * pot(2, count);
          PORTD = 0b00000001 * pot(2, 7 - count);
          VDelay_ms(50);
          fact++;
          count++;
          if(count == 8) count = 0;
        }

        t++;
     }
     
     PORTB = 0b00000000;
     PORTD = 0b00000000;

}

int pot(int val, int power) {
     int ret = val, i = 1;
     if(power == 0) return 1;
     while(i < power) {
         ret *= val;
         i++;
     }
     return ret;
}