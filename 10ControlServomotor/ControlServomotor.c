/*este programa sirve para controlar la posicion de un servomotor
sin utilizar librerias
*/

void main() {
  TRISD = 0B00000010;      // RD0 como salida y RD1 como entrada
  PORTD.F0 = 0;            // valor inicial para RD0
  
  while(1)
  {
    if(PORTD.F1==1)
    {
     PORTD.F0=1;   // generamos pulso en alto
     Delay_us(2400);  // por 2400 us
     PORTD.F0=0;      // se general pulso bajo
     Delay_ms(20);    // se genera pulso bajo 20ms
    }
    else
    {
     PORTD.F0=1;   // generamos pulso en alto
     Delay_us(600);  // por 600 us
     PORTD.F0=0;      // se general pulso bajo
     Delay_ms(20);    // se genera pulso bajo 20ms
    }
  }
}