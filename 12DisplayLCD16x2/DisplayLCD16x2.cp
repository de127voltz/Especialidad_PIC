#line 1 "C:/Especialidad PIC/12DisplayLCD16x2/DisplayLCD16x2.c"

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


 float adc0, volts, temperatura;
 char temp[15];

void main() {

 ANSELH = 0;
 ANSEL=0B00000001;
 TRISA=0B00000001;
 ADC_Init();
 Lcd_Init();
 TRISD=0B00000000;
 PORTD=0;

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,6,"Control");
 Lcd_Out(2,1, "Temp: ");

 while(1)
 {
 adc0 = ADC_Read(0);
 volts = (adc0*5.0)/1024.0;
 temperatura = volts * 100.0;
 FloatToStr(temperatura, temp);
 Lcd_Out(2,7,temp);
 if(temperatura > 35.0)
 {
 PORTD=0B00000001;
 }
 else
 {
 PORTD=0B00000010;
 }

 Delay_ms(100);
 }
}
