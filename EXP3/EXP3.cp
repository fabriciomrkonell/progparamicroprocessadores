#line 1 "C:/realronchi/EXP3/EXP3.c"
int eu = 0;
int sou = 0;
int rebelde = 0;
int i = 0;

void fazBotao1();
void fazBotao2();
void fazBotao3();

void main() {

 TRISB.RB0 = 1;
 TRISB.RB1 = 1;
 TRISB.RB2 = 1;
 TRISD = 0;
 TRISE.RE0 = 0;
 TRISC.RC1 = 0;


 PORTD = 0b00000000;
 PORTE.RE0 = 0;
 PORTC.RC1 = 1;

 while(1) {
 fazBotao1();
 fazBotao2();
 fazBotao3();
 }

}

void fazBotao1() {
 rebelde = PORTB.RB0;
 while(rebelde == 0) {
 if(PORTD == 0b11111111) {
 for(i = 0; i < 100; i++) {
 PORTC.RC1 = 1;
 VDelay_ms(i);
 PORTC.RC1 = 0;
 VDelay_ms(i);
 }
 }
 rebelde = PORTB.RB0;
 PORTD = PORTD + 0b00000001;
 PORTC.RC1 = 1;
 PORTE.RE0 = 0;
 Delay_ms(30);
 PORTC.RC1 = 0;
 PORTE.RE0 = 1;
 Delay_ms(30);
 }
}

void fazBotao2() {
 eu = PORTB.RB1;
 PORTE.RE0 = eu;
}

void fazBotao3() {
 sou = PORTB.RB2;
 PORTC.RC1 = sou;
}
