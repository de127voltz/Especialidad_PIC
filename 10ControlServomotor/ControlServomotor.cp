#line 1 "C:/Especialidad PIC/10ControlServomotor/ControlServomotor.c"
#line 5 "C:/Especialidad PIC/10ControlServomotor/ControlServomotor.c"
void main() {
 TRISD = 0B00000010;
 PORTD.F0 = 0;

 while(1)
 {
 if(PORTD.F1==1)
 {
 PORTD.F0=1;
 Delay_us(2400);
 PORTD.F0=0;
 Delay_ms(20);
 }
 else
 {
 PORTD.F0=1;
 Delay_us(600);
 PORTD.F0=0;
 Delay_ms(20);
 }
 }
}
