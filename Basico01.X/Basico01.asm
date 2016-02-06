;*********************************** [Nombre].asm ***********************************
;Programa que lee el número binario introducido mediante 3 interruptores conectados a
; la puerta PA (RA0,RA1,RA2), luego suma 2 unidades ;a ese valor y visualiza el resultado
; mediante 4 diodos led conectados al Puerto B (RB0, RB1,RB2,RB3).
;	
;
; ZONA DE DATOS *********************************************************************

	LIST	   P=16F84A			; Procesador utilizado.
	INCLUDE  <P16F84A.INC>		; Definición de algunos operandos utilizados.
	__CONFIG   _CP_OFF &  _WDT_OFF & _PWRTE_ON & _XT_OSC

;CONSTANTE  EQU				; En sistema decimal se pone así.

; ZONA DE CÓDIGOS *******************************************************************

	ORG 	0				; El programa comienza en la dirección 0.
Inicio
	bsf	STATUS,RP0			; Pone a 1 el bit 5 del STATUS. Acceso al Banco 1.
	clrf	TRISB				; Las líneas del Puerto B configuradas como salidas.
	movlw	b'00011111'			; Las 5 líneas del Puerto A configuradas como entradas.
	movwf	TRISA
	bcf	STATUS,RP0			; Pone a 0 el bit 5 de STATUS. Acceso al Banco 0.
Principal	
	movf PORTA,W				; Copia el valor del puerto A en reg W
	addlw d'2'				; Le suma 2 al registro
	movwf PORTB				; PORTB = PORTA + 2
	goto Principal				;
	END

