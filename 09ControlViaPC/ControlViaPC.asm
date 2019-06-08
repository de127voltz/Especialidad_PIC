
_main:

;ControlViaPC.c,6 :: 		void main() {
;ControlViaPC.c,7 :: 		TRISD = 0B00000000;               // RD0 y RD1 como salidas digitales
	CLRF       TRISD+0
;ControlViaPC.c,8 :: 		PORTD = 0;                        // inicializamos el puerto
	CLRF       PORTD+0
;ControlViaPC.c,9 :: 		UART1_Init(9600);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;ControlViaPC.c,10 :: 		Delay_ms(100);                    // inicilizar puerto serie a 9600
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
;ControlViaPC.c,12 :: 		while(1)
L_main1:
;ControlViaPC.c,14 :: 		if(UART1_Data_Ready() > 0)       // llegaron datos?
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;ControlViaPC.c,16 :: 		DatoIN = UART1_Read();          // se lee el dato de entrada
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _DatoIN+0
;ControlViaPC.c,17 :: 		if(DatoIN == 'A')
	MOVF       R0+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;ControlViaPC.c,18 :: 		PORTD.F0 = 1;                    // si llega una A se activa primer led
	BSF        PORTD+0, 0
L_main4:
;ControlViaPC.c,19 :: 		if(DatoIN == 'B')
	MOVF       _DatoIN+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;ControlViaPC.c,20 :: 		PORTD.F0= 0;                    // si llega una A se activa primer led
	BCF        PORTD+0, 0
L_main5:
;ControlViaPC.c,21 :: 		if(DatoIN == 'C')
	MOVF       _DatoIN+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;ControlViaPC.c,22 :: 		PORTD.F1= 1;                    // si llega una A se activa primer led
	BSF        PORTD+0, 1
L_main6:
;ControlViaPC.c,23 :: 		if(DatoIN == 'D')
	MOVF       _DatoIN+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;ControlViaPC.c,24 :: 		PORTD.F1= 0;                    // si llega una A se activa primer led
	BCF        PORTD+0, 1
L_main7:
;ControlViaPC.c,25 :: 		}
L_main3:
;ControlViaPC.c,26 :: 		}
	GOTO       L_main1
;ControlViaPC.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
