/* Este programa genera una señal de PWM en el pin CCP1

*/

int i;
void main() {
 TRISD.F2 = 0;   // RC2 se configura como salida
 PORTD.F2 = 0;   // se inicializa en cero
 PWM1_Init(5000);   // señal pwm se inicializa a 5khz
 PWM1_Start();      // se genera señal pwm
 
 
 while(1)
 {
  for(i=0 ; i<=255 ; i++)
  {
   PWM1_Set_Duty(i);
   Delay_ms(8);
  }
 }
}