// LCD module connections
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;
// End LCD module connections

  float adc0, volts, temperatura;
  char temp[15];                   // va a contener la conversion de BIN a BCD
  
void main() {

  ANSELH = 0;          //  No se utilizan entradas analogicas
  ANSEL=0B00000001;    // AN0 como entrada analogica
  TRISA=0B00000001;    // an0 como entrada
  ADC_Init();          // se inicializa el ADC
  Lcd_Init();          // Inicializar el display
  TRISD=0B00000000;     // RD0 y RD1 como salida
  PORTD=0;             // se inicializa en ceros
  
  Lcd_Cmd(_LCD_CLEAR);      // inicia con Display limpio
  Lcd_Cmd(_LCD_CURSOR_OFF); // desactivamos el cursor
  Lcd_Out(1,6,"Control");
  Lcd_Out(2,1, "Temp: ");
  
  while(1)
  {
    adc0 = ADC_Read(0);      // se lee canall AN0
    volts = (adc0*5.0)/1024.0;   // se convierte el dato de 0 a 1023 a volts es decir de 0 a 5v
    temperatura = volts * 100.0;     // se convierten volts a temperatura
    FloatToStr(temperatura, temp);  // se convierte BIN a BCD
    Lcd_Out(2,7,temp);              // se imprime el valor de la temperatura
    if(temperatura > 35.0)
    {
    PORTD=0B00000001;               // se activa indicador
    }
    else
    {
    PORTD=0B00000010;               // se activa el segundo indicador
    }
    Delay_ms(100);                  // 10 muestras por segundo
  }
}

