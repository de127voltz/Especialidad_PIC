
_main:

;ControlServomotor.c,5 :: 		void main() {
;ControlServomotor.c,6 :: 		TRISD = 0B00000010;      // RD0 como salida y RD1 como entrada
	MOVLW      2
	MOVWF      TRISD+0
;ControlServomotor.c,7 :: 		PORTD.F0 = 0;            // valor inicial para RD0
	BCF        PORTD+0, 0
;ControlServomotor.c,9 :: 		while(1)
L_main0:
;ControlServomotor.c,11 :: 		if(PORTD.F1==1)
	BTFSS      PORTD+0, 1
	GOTO       L_main2
;ControlServomotor.c,13 :: 		PORTD.F0=1;   // generamos pulso en alto
	BSF        PORTD+0, 0
;ControlServomotor.c,14 :: 		Delay_us(2400);  // por 2400 us
	MOVLW      16
	MOVWF      R12+0
	MOVLW      148
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
;ControlServomotor.c,15 :: 		PORTD.F0=0;      // se general pulso bajo
	BCF        PORTD+0, 0
;ControlServomotor.c,16 :: 		Delay_ms(20);    // se genera pulso bajo 20ms
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
	NOP
;ControlServomotor.c,17 :: 		}
	GOTO       L_main5
L_main2:
;ControlServomotor.c,20 :: 		PORTD.F0=1;   // generamos pulso en alto
	BSF        PORTD+0, 0
;ControlServomotor.c,21 :: 		Delay_us(600);  // por 600 us
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;ControlServomotor.c,22 :: 		PORTD.F0=0;      // se general pulso bajo
	BCF        PORTD+0, 0
;ControlServomotor.c,23 :: 		Delay_ms(20);    // se genera pulso bajo 20ms
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;ControlServomotor.c,24 :: 		}
L_main5:
;ControlServomotor.c,25 :: 		}
	GOTO       L_main0
;ControlServomotor.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
