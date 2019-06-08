#line 1 "C:/Especialidad PIC/14CircuitosPruebaEEPROM/CircuitosPruebaEEPROM.c"

 int contador=0;

void main() {
 TRISD.F0 = 0;
 contador = EEPROM_Read(0x00);

 do
 {
 PORTD.F0 = 1;
 Delay_ms(500);
 PORTD.F0 = 0;
 Delay_ms(500);
 contador ++;
 EEPROM_Write(0x00,contador);
 }
 while(contador < 5);
}
