


;**************************************************************
;
;
; Por el Puerto B obtiene el dato del Puerto A, pero en las salida los bits impares se
; fijan siempre a "0". El orden de los bits ser� "b7 b6 b5 b4 b3 b2 b1 b0", siendo los 
; impares el b7, b5, b3 y b1.
;
; Por ejemplo si por el Puerto A se introduce el dato b'---01100', por el Puerto B se
; visualiza  b'00000100'. Observar que los bits impares est�n a "0" (efectivamente:
; Puerto B = b'0x0x0x0x') y los pares permanecen con el dato del puerto de entrada
; (efectivamente: Puerto A = b'---0x1x0' y Puerto B = b'---0x1x0'). 

; ZONA DE DATOS *********************************************************************

	LIST	  P=16F84A			; Procesador utilizado.
	INCLUDE  <P16F84A.INC>		; Definici�n de algunos operandos utilizados.
	__CONFIG  _CP_OFF &  _WDT_OFF & _PWRTE_ON & _XT_OSC

MASCARA	EQU	b'01010101'			; M�scara de bits impares siempre a "0".

; ZONA DE C�DIGOS *******************************************************************

	ORG 	0					; El programa comienza en la direcci�n 0.

Inicio
	bsf		STATUS,RP0			; Pone a 1 el bit 5 del STATUS. Acceso al Banco 1.
	clrf	TRISB					; Las l�neas del Puerto B se configuran como salidas.
	movlw	b'00011111'
	movwf	TRISA					; Las 5 l�neas del Puerto A como entrada.
	bcf		STATUS,RP0			; Pone a 0 el bit 5 de STATUS. Acceso al Banco 0.
Principal
	movf PORTA,W
	movwf PORTB
	andlw MASCARA
	andwf PORTB
	goto Principal
	END
	

	