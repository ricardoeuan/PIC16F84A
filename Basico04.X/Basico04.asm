;*************************************************************************************
;
;
; Por el Puerto B se obtiene el dato del Puerto A desplazando un bit hacia la derecha, por
; la izquierda entrará un "0". Por ejemplo, si por el Puerto A se introduce "---11001", 
; por el Puerto B aparecerá "0xxx1100".

; ZONA DE DATOS *********************************************************************

	LIST	   P=16F84A			; Procesador utilizado.
	INCLUDE  <P16F84A.INC>		; Definición de algunos operandos utilizados.
	__CONFIG   _CP_OFF &  _WDT_OFF & _PWRTE_ON & _XT_OSC

; ZONA DE CÓDIGOS ********************************************************************

	ORG 	0					; El programa comienza en la dirección 0.
Inicio
	bsf		STATUS,RP0			; Acceso al Banco 1.
	clrf	TRISB					; Las líneas del Puerto B se configuran como salida.
	movlw	b'00011111'				; Las 5 líneas del Puerto A se configuran como entrada.
	movwf	TRISA
	bcf		STATUS,RP0			; Acceso al Banco 0.
Principal
	rrf PORTA,W
	movwf PORTB
	goto Principal
	END


