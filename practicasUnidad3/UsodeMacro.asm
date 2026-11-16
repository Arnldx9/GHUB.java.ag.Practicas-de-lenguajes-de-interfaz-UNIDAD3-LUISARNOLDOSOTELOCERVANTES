; Author: Arnoldo
; Program Name: Practica1_Macros
; Program Description: Primera practica de uso de macros 
; Date: 14/11/2026
INCLUDE Irvine32.inc


MostrarMensaje MACRO texto
	mov edx, OFFSET texto  ;carga la direccion de la cadena en EDX
	call WriteString		;Imprime al cadena en consola 
	call Crlf				;Inserta un salto de linea 
ENDM

Multi MACRO num1, num2
	mov eax, num1			;Carga el primer operando en EAX
	imul eax, num2			; MULTIPLICA EAX por num2(multiplicacion con signo)
	call WriteInt			;Muestra el resultado entero con signo
	call Crlf				;Inserta un salto de linea 
ENDM

.data
	;CADena de texto terminadas em BYTE nulo
	mensajeBienvenida BYTE "BIENVENIDO A ESTE PROGRAMA CHOTO", 0
	mensajeFin BYTE "HASTA LUEGO QUE LE VAYA BIEN", 0
.code
main PROC 
;dESPLIEGUE DE MENSAJES MEDIANTE macro
	MostrarMensaje mensajeBienvenida
	MostrarMensaje mensajeFin

	;multiplicacion de 4*5
	Multi 4, 5
exit
main ENDP
END main