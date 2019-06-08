
_main:

;EEPROMlcd16x2.c,21 :: 		void main() {
;EEPROMlcd16x2.c,23 :: 		ANSELH = 0;          //  No se utilizan entradas analogicas
	CLRF       ANSELH+0
;EEPROMlcd16x2.c,24 :: 		ANSEL=0B00000001;    // AN0 como entrada analogica
	MOVLW      1
	MOVWF      ANSEL+0
;EEPROMlcd16x2.c,25 :: 		TRISA=0B00000001;    // an0 como entrada
	MOVLW      1
	MOVWF      TRISA+0
;EEPROMlcd16x2.c,26 :: 		ADC_Init();          // se inicializa el ADC
	CALL       _ADC_Init+0
;EEPROMlcd16x2.c,27 :: 		Lcd_Init();          // Inicializar el display
	CALL       _Lcd_Init+0
;EEPROMlcd16x2.c,28 :: 		TRISD=0B00000000;     // RD0 y RD1 como salida
	CLRF       TRISD+0
;EEPROMlcd16x2.c,29 :: 		PORTD=0;             // se inicializa en ceros
	CLRF       PORTD+0
;EEPROMlcd16x2.c,31 :: 		Lcd_Cmd(_LCD_CLEAR);      // inicia con Display limpio
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROMlcd16x2.c,32 :: 		Lcd_Cmd(_LCD_CURSOR_OFF); // desactivamos el cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROMlcd16x2.c,33 :: 		Lcd_Out(1,6,"Control");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_EEPROMlcd16x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROMlcd16x2.c,34 :: 		Lcd_Out(2,1, "Temp: ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_EEPROMlcd16x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROMlcd16x2.c,36 :: 		contador = EEPROM_Read(0x00);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _contador+0
	CLRF       _contador+1
;EEPROMlcd16x2.c,37 :: 		contador ++;                     // contador = contador +1;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;EEPROMlcd16x2.c,38 :: 		EEPROM_Write(0x00,contador);     // se almacena la variable contador
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _contador+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;EEPROMlcd16x2.c,40 :: 		while(contador < 5)
L_main0:
	MOVLW      128
	XORWF      _contador+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      5
	SUBWF      _contador+0, 0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;EEPROMlcd16x2.c,42 :: 		adc0 = ADC_Read(0);      // se lee canall AN0
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
;EEPROMlcd16x2.c,43 :: 		volts = (adc0*5.0)/1024.0;   // se convierte el dato de 0 a 1023 a volts es decir de 0 a 5v
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
;EEPROMlcd16x2.c,44 :: 		temperatura = volts * 100.0;     // se convierten volts a temperatura
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
;EEPROMlcd16x2.c,45 :: 		FloatToStr(temperatura, temp);  // se convierte BIN a BCD
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
;EEPROMlcd16x2.c,46 :: 		Lcd_Out(2,7,temp);              // se imprime el valor de la temperatura
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROMlcd16x2.c,47 :: 		if(temperatura > 35.0)
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
;EEPROMlcd16x2.c,49 :: 		PORTD=0B00000001;               // se activa indicador
	MOVLW      1
	MOVWF      PORTD+0
;EEPROMlcd16x2.c,50 :: 		}
	GOTO       L_main3
L_main2:
;EEPROMlcd16x2.c,53 :: 		PORTD=0B00000010;               // se activa el segundo indicador
	MOVLW      2
	MOVWF      PORTD+0
;EEPROMlcd16x2.c,54 :: 		}
L_main3:
;EEPROMlcd16x2.c,55 :: 		Delay_ms(100);                  // 10 muestras por segundo
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
;EEPROMlcd16x2.c,56 :: 		}
	GOTO       L_main0
L_main1:
;EEPROMlcd16x2.c,57 :: 		Lcd_Out(1,1,"Version de prueba");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_EEPROMlcd16x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROMlcd16x2.c,58 :: 		Lcd_Out(2,1, "  Terminada      ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_EEPROMlcd16x2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROMlcd16x2.c,59 :: 		while(1)
L_main5:
;EEPROMlcd16x2.c,61 :: 		}
	GOTO       L_main5
;EEPROMlcd16x2.c,62 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
