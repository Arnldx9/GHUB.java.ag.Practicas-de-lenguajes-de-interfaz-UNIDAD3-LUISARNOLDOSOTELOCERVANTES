; Author: Arnoldo
; Program Name: LlamadasProcedimientoEIP
; Program Description: Demuestra el flujo de ejecucion y el manejo de EIP mediante llamadas multiples a un procedimiento (CALL y RET).
; Date: 15/11/2026

INCLUDE Irvine32.inc 

.data
	mensajeInicio        BYTE "inicio de programa", 0
	mensajeProcedimiento BYTE "Estoy dentro del procedimiento", 0
	mensajeFin           BYTE "Fin del programa", 0

.code
main PROC
	; Imprime el mensaje de inicio
	mov edx, OFFSET mensajeInicio
	call WriteString
	call Crlf

	; Primera llamada al procedimiento
	call mensajeAviso        ; Apila en [esp] la direccion de "mov eax, 10" y salta a mensajeAviso
	mov eax, 10              ; Instruccion donde continua tras el primer ret

	; Segunda llamada al procedimiento
	call mensajeAviso        ; Apila en [esp] la direccion de "mov eax, 20" y salta a mensajeAviso
	mov eax, 20              ; Instruccion donde continua tras el segundo ret

	; Imprime el mensaje de cierre
	mov edx, OFFSET mensajeFin
	call WriteString
	call Crlf

	exit                     ; Termina el programa y devuelve el control al SO
main ENDP


mensajeAviso PROC
	mov edx, OFFSET mensajeProcedimiento
	call WriteString
	call Crlf
	ret                      ; Extrae la direccion de retorno de [esp] y la carga en EIP
mensajeAviso ENDP

END main