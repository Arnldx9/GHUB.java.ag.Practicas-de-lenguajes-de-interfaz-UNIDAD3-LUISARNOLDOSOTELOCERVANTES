; Author: Arnoldo
; Program Name: PasoParametrosPila
; Program Description: Demuestra el paso de parametros mediante 
;				la pila (marco EBP) y preservacion de registros.
; Date: 14/11/2026
INCLUDE Irvine32.inc

.data
	
.code
main PROC 
	 mov ebx, 10	;Valor de prueba para verificar que EBX se preserve despues de la llamada
	 push 1			;Segundo parametro en la pila -[ebp+12]
	 push 2			;Primer parametro en la pila  -[ebp+8]

	 call sumarPila

	 nop			;instruccion vacia
	 exit			;Termina

main ENDP

sumarPila PROC 
	push ebp ; para guardarlo en la pila, para marcar la sima de la pila a mi punto de referencia
	mov ebp, esp ; se vuelve la referancia para movernos en la pila

	push ebx	;Preserva  el valor original en ebx =10
	mov eax, [ebp+8] ; accede al valor 2
	mov ebx, [ebp+12]; accede al valor 1

	imul eax, ebx ; imul permite especificar 2 registros, mul siempre multiplica eax
				;Multiplica EAX * EBX (2 * 1 = 2)


	pop ebx		; Restaura el valor original de EBX
	pop ebp		; Restaura el EBP del llamador
	ret 8 ; limpia los 2 registros realizados antes del call, de la pila

sumarPila ENDP

END main
