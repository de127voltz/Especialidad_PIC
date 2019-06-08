
_main:

;CircuitosPruebaEEPROM.c,4 :: 		void main() {
;CircuitosPruebaEEPROM.c,5 :: 		TRISD.F0 = 0;   // RD= se configura como salida
	BCF        TRISD+0, 0
;CircuitosPruebaEEPROM.c,6 :: 		contador = EEPROM_Read(0x00);
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _contador+0
	CLRF       _contador+1
;CircuitosPruebaEEPROM.c,8 :: 		do
L_main0:
;CircuitosPruebaEEPROM.c,10 :: 		PORTD.F0 = 1;      // RD0 se activa en 1 lógico
	BSF        PORTD+0, 0
;CircuitosPruebaEEPROM.c,11 :: 		Delay_ms(500);    // retardo 1/2s
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;CircuitosPruebaEEPROM.c,12 :: 		PORTD.F0 = 0;      // se apaga RD0 en 0 logico
	BCF        PORTD+0, 0
;CircuitosPruebaEEPROM.c,13 :: 		Delay_ms(500);    // retardo 1/2s
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;CircuitosPruebaEEPROM.c,14 :: 		contador ++;
	INCF       _contador+0, 1
	BTFSC      STATUS+0, 2
	INCF       _contador+1, 1
;CircuitosPruebaEEPROM.c,15 :: 		EEPROM_Write(0x00,contador);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _contador+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;CircuitosPruebaEEPROM.c,17 :: 		while(contador < 5);
	MOVLW      128
	XORWF      _contador+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main6
	MOVLW      5
	SUBWF      _contador+0, 0
L__main6:
	BTFSS      STATUS+0, 0
	GOTO       L_main0
;CircuitosPruebaEEPROM.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
