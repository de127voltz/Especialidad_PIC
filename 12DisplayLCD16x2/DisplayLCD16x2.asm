
_main:

;DisplayLCD16x2.c,20 :: 		void main() {
;DisplayLCD16x2.c,22 :: 		ANSELH = 0;          //  No se utilizan entradas analogicas
	CLRF       ANSELH+0
;DisplayLCD16x2.c,23 :: 		ANSEL=0B00000001;    // AN0 como entrada analogica
	MOVLW      1
	MOVWF      ANSEL+0
;DisplayLCD16x2.c,24 :: 		TRISA=0B00000001;    // an0 como entrada
	MOVLW      1
	MOVWF      TRISA+0
;DisplayLCD16x2.c,25 :: 		ADC_Init();          // se inicializa el ADC
	CALL       _ADC_Init+0
;DisplayLCD16x2.c,26 :: 		Lcd_Init();          // Inicializar el display
	CALL       _Lcd_Init+0
;DisplayLCD16x2.c,27 :: 		TRISD=0B00000000;     // RD0 y RD1 como salida
	CLRF       TRISD+0
;DisplayLCD16x2.c,28 :: 		PORTD=0;             // se inicializa en ceros
	CLRF       PORTD+0
;DisplayLCD16x2.c,30 :: 		Lcd_Cmd(_LCD_CLEAR);      // inicia con Display limpio
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DisplayLCD16x2.c,31 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // desactivamos el cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DisplayLCD16x2.c,32 :: 		Lcd_Out(1,6,"Control");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_DisplayLCD16x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DisplayLCD16x2.c,33 :: 		Lcd_Out(2,1, "Temp: ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_DisplayLCD16x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DisplayLCD16x2.c,35 :: 		while(1)
L_main0:
;DisplayLCD16x2.c,37 :: 		adc0 = ADC_Read(0);      // se lee canall AN0
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVF       R0+0, 0
	MOVWF      _adc0+0
	MOVF       R0+1, 0
	MOVWF      _adc0+1
	MOVF       R0+2, 0
	MOVWF      _adc0+2
	MOVF       R0+3, 0
	MOVWF      _adc0+3
;DisplayLCD16x2.c,38 :: 		volts = (adc0*5.0)/1024.0;   // se convierte el dato de 0 a 1023 a volts es decir de 0 a 5v
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _volts+0
	MOVF       R0+1, 0
	MOVWF      _volts+1
	MOVF       R0+2, 0
	MOVWF      _volts+2
	MOVF       R0+3, 0
	MOVWF      _volts+3
;DisplayLCD16x2.c,39 :: 		temperatura = volts * 100.0;     // se convierten volts a temperatura
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temperatura+0
	MOVF       R0+1, 0
	MOVWF      _temperatura+1
	MOVF       R0+2, 0
	MOVWF      _temperatura+2
	MOVF       R0+3, 0
	MOVWF      _temperatura+3
;DisplayLCD16x2.c,40 :: 		FloatToStr(temperatura, temp);  // se convierte BIN a BCD
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _temp+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;DisplayLCD16x2.c,41 :: 		Lcd_Out(2,7,temp);              // se imprime el valor de la temperatura
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DisplayLCD16x2.c,42 :: 		if(temperatura > 35.0)
	MOVF       _temperatura+0, 0
	MOVWF      R4+0
	MOVF       _temperatura+1, 0
	MOVWF      R4+1
	MOVF       _temperatura+2, 0
	MOVWF      R4+2
	MOVF       _temperatura+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      12
	MOVWF      R0+2
	MOVLW      132
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;DisplayLCD16x2.c,44 :: 		PORTD=0B00000001;               // se activa indicador
	MOVLW      1
	MOVWF      PORTD+0
;DisplayLCD16x2.c,45 :: 		}
	GOTO       L_main3
L_main2:
;DisplayLCD16x2.c,48 :: 		PORTD=0B00000010;               // se activa el segundo indicador
	MOVLW      2
	MOVWF      PORTD+0
;DisplayLCD16x2.c,49 :: 		}
L_main3:
;DisplayLCD16x2.c,51 :: 		Delay_ms(100);                  // 10 muestras por segundo
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;DisplayLCD16x2.c,52 :: 		}
	GOTO       L_main0
;DisplayLCD16x2.c,53 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
