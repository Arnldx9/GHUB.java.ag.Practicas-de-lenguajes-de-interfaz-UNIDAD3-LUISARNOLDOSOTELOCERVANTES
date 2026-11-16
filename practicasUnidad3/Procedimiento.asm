; Author: Arnoldo
; Program Name: Procedimientos anidados
; Program Description: Muestra en hexadecimal las direcciones 
;		de retorno almacenadas en la cima de la pila ([esp]) durante llamadas anidadas.
; Date: 14/11/2026
INCLUDE Irvine32.inc

.data


.code
main PROC 
	mov eax,[esp]		; Lee la cima de la pila (direccion de retorno al SO)
	call WriteHEx		; Imprime la direccion en formato hexadecimal
	call Crlf		
	call procUno		; Apila direccion de retorno a main y salta a procUno
	exit				; Termina el programa 
main ENDP
	
procUno PROC
	mov eax, [esp]		; Lee la direccion de retorno hacia main (tras call procUno)
	call WriteHex		; Imprime la direccion en hexadecimal
	call Crlf			; Apila direccion de retorno a procUno y salta a procDos
	call procDos		; Extrae la direccion de la pila y regresa a main
	
	ret
procUno ENDP

procDos PROC
	mov eax, [esp]		; Lee la direccion de retorno hacia procUno (tras call procDos)
	call WriteHex		; Imprime la direccion en hexadecimal
	call Crlf
	ret					; Extrae la direccion de la pila y regresa a procUno
procDos ENDP	

END main
