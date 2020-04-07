
_main:

;PWM.c,6 :: 		void main() {
;PWM.c,7 :: 		TRISD.F2 = 0;   // RC2 se configura como salida
	BCF        TRISD+0, 2
;PWM.c,8 :: 		PORTD.F2 = 0;   // se inicializa en cero
	BCF        PORTD+0, 2
;PWM.c,9 :: 		PWM1_Init(5000);   // señal pwm se inicializa a 5khz
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM.c,10 :: 		PWM1_Start();      // se genera señal pwm
	CALL       _PWM1_Start+0
;PWM.c,13 :: 		while(1)
L_main0:
;PWM.c,15 :: 		for(i=0 ; i<=255 ; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVF       _i+0, 0
	SUBLW      255
L__main7:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;PWM.c,17 :: 		PWM1_Set_Duty(i);
	MOVF       _i+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM.c,18 :: 		Delay_ms(8);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;PWM.c,15 :: 		for(i=0 ; i<=255 ; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;PWM.c,19 :: 		}
	GOTO       L_main2
L_main3:
;PWM.c,20 :: 		}
	GOTO       L_main0
;PWM.c,21 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
