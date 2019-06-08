
_main:

;TablaMultiplicarConFor.c,7 :: 		void main() {
;TablaMultiplicarConFor.c,8 :: 		UART1_Init(9600);       // inicializamos comunicacion serie
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;TablaMultiplicarConFor.c,9 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;TablaMultiplicarConFor.c,10 :: 		UART1_Write_Text("Tabla de multiplicar del 8: ");
	MOVLW      ?lstr1_TablaMultiplicarConFor+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TablaMultiplicarConFor.c,11 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TablaMultiplicarConFor.c,12 :: 		UART1_Write(13);        // 13 es un enter en ASCII
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TablaMultiplicarConFor.c,14 :: 		for(i=1 ; i <= 10 ; i++)
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_main1:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main5
	MOVF       _i+0, 0
	SUBLW      10
L__main5:
	BTFSS      STATUS+0, 0
	GOTO       L_main2
;TablaMultiplicarConFor.c,16 :: 		tabla = i*8;
	MOVLW      3
	MOVWF      R0+0
	MOVF       _i+0, 0
	MOVWF      _tabla+0
	MOVF       _i+1, 0
	MOVWF      _tabla+1
	MOVF       R0+0, 0
L__main6:
	BTFSC      STATUS+0, 2
	GOTO       L__main7
	RLF        _tabla+0, 1
	RLF        _tabla+1, 1
	BCF        _tabla+0, 0
	ADDLW      255
	GOTO       L__main6
L__main7:
;TablaMultiplicarConFor.c,17 :: 		IntToStr(i,i2);
	MOVF       _i+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _i+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _i2+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;TablaMultiplicarConFor.c,18 :: 		IntToStr(tabla,resultado);
	MOVF       _tabla+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _tabla+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _resultado+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;TablaMultiplicarConFor.c,19 :: 		UART1_Write_Text(i2);
	MOVLW      _i2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TablaMultiplicarConFor.c,20 :: 		UART1_Write_Text("*8= ");
	MOVLW      ?lstr2_TablaMultiplicarConFor+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TablaMultiplicarConFor.c,21 :: 		UART1_Write_Text(resultado);
	MOVLW      _resultado+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TablaMultiplicarConFor.c,22 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TablaMultiplicarConFor.c,23 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TablaMultiplicarConFor.c,14 :: 		for(i=1 ; i <= 10 ; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;TablaMultiplicarConFor.c,24 :: 		}
	GOTO       L_main1
L_main2:
;TablaMultiplicarConFor.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
