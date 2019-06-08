/*este programa sirve para controlar dos salidas digitales
RD0 y RD1 desde la computadora, utilizando el puerto serie
A=ON B= OFF C=ON D=OFF
*/
    char DatoIN;
void main() {
         TRISD = 0B00000000;               // RD0 y RD1 como salidas digitales
         PORTD = 0;                        // inicializamos el puerto
         UART1_Init(9600);
         Delay_ms(100);                    // inicilizar puerto serie a 9600
         
         while(1)
         {
          if(UART1_Data_Ready() > 0)       // llegaron datos?
          {
           DatoIN = UART1_Read();          // se lee el dato de entrada
           if(DatoIN == 'A')
           PORTD.F0 = 1;                    // si llega una A se activa primer led
           if(DatoIN == 'B')
           PORTD.F0= 0;                    // si llega una A se activa primer led
           if(DatoIN == 'C')
           PORTD.F1= 1;                    // si llega una A se activa primer led
           if(DatoIN == 'D')
           PORTD.F1= 0;                    // si llega una A se activa primer led
          }
         }
}