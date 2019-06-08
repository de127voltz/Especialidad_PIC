#line 1 "C:/Especialidad PIC/15TablaMultiplicarConFor/TablaMultiplicarConFor.c"

int tabla=0;
int i=0;
char i2[7];
char resultado[7];

void main() {
UART1_Init(9600);
Delay_ms(100);
UART1_Write_Text("Tabla de multiplicar del 8: ");
UART1_Write(10);
UART1_Write(13);

for(i=1 ; i <= 10 ; i++)
{
 tabla = i*8;
 IntToStr(i,i2);
 IntToStr(tabla,resultado);
 UART1_Write_Text(i2);
 UART1_Write_Text("*8= ");
 UART1_Write_Text(resultado);
 UART1_Write(10);
 UART1_Write(13);
}
}
