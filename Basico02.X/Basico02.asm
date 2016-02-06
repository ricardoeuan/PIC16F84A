;*********************************** [Nombre].asm ***********************************
;
;Por el Puerto B se obtiene el dato del Puerto A multiplicado por 2.
; Es decir: (PORTB)=2(PORTA)=(PORTA)+(PORT A).	
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
	movf  PORTA,W				; Copia el valor del puerto A en reg W	
	addwf PORTA,W				; Le suma A al mismo registro	
	movwf PORTB				; PORTB = PORTA + 2
	goto Principal				;
	END





