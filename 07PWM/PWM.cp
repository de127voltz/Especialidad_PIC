#line 1 "C:/Especialidad PIC/PWM/PWM.c"
#line 5 "C:/Especialidad PIC/PWM/PWM.c"
int i;
void main() {
 TRISD.F2 = 0;
 PORTD.F2 = 0;
 PWM1_Init(5000);
 PWM1_Start();


 while(1)
 {
 for(i=0 ; i<=255 ; i++)
 {
 PWM1_Set_Duty(i);
 Delay_ms(8);
 }
 }
}
