#line 1 "C:/Especialidad PIC/ControlViaPC/ControlViaPC.c"
#line 5 "C:/Especialidad PIC/ControlViaPC/ControlViaPC.c"
 char DatoIN;
void main() {
 TRISD = 0B00000000;
 PORTD = 0;
 UART1_Init(9600);
 Delay_ms(100);

 while(1)
 {
 if(UART1_Data_Ready() > 0)
 {
 DatoIN = UART1_Read();
 if(DatoIN == 'A')
 PORTD.F0 = 1;
 if(DatoIN == 'B')
 PORTD.F0= 0;
 if(DatoIN == 'C')
 PORTD.F1= 1;
 if(DatoIN == 'D')
 PORTD.F1= 0;
 }
 }
}
