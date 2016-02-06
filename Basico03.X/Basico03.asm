;*********************************** Suma.asm ***********************************
;
;
; Por el Puerto B se obtiene el dato de las cinco líneas del Puerto A, al que está conectado
; un array de interruptores, sumándole el valor de una constante, por ejemplo 74.
; Es decir: (PORTB)=(PORTA)+CONSTANTE

; ZONA DE DATOS *********************************************************************

	LIST	   P=16F84A			; Procesador utilizado.
	INCLUDE  <P16F84A.INC>		; Definición de algunos operandos utilizados.
	__CONFIG   _CP_OFF &  _WDT_OFF & _PWRTE_ON & _XT_OSC

CONSTANTE  EQU	d'74'			; En sistema decimal se pone así.

; ZONA DE CÓDIGOS *******************************************************************

	ORG 	0					; El programa comienza en la dirección 0.
Inicio
	bsf		STATUS,RP0			; Pone a 1 el bit 5 del STATUS. Acceso al Banco 1.
	clrf	TRISB					; Las líneas del Puerto B configuradas como salidas.
	movlw	b'00011111'				; Las 5 líneas del Puerto A configuradas como entradas.
	movwf	TRISA
	bcf		STATUS,RP0			; Pone a 0 el bit 5 de STATUS. Acceso al Banco 0.
Principal
	movf PORTA, W
	addlw CONSTANTE
	movwf PORTB	
	END
	


