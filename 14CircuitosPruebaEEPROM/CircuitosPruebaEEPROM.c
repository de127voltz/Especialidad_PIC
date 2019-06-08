
  int contador=0;
  
void main() {
   TRISD.F0 = 0;   // RD= se configura como salida
   contador = EEPROM_Read(0x00);
   
  do
   {
    PORTD.F0 = 1;      // RD0 se activa en 1 lógico
    Delay_ms(500);    // retardo 1/2s
    PORTD.F0 = 0;      // se apaga RD0 en 0 logico
    Delay_ms(500);    // retardo 1/2s
    contador ++;
    EEPROM_Write(0x00,contador);
    }
     while(contador < 5);
}