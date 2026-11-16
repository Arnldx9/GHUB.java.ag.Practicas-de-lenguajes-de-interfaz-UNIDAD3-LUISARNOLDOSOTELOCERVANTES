; Author: Arnoldo
; Program Name: ValidarCadenaVacia
; Program Description: Lee una cadena por teclado y verifica si esta vacia.
; Date: 14/11/2026
INCLUDE Irvine32.inc

.data
    cadena BYTE 50 DUP(0)          ;Buffer d 50 bytes 
    msgPedir BYTE "Ingresa una cadena (o presiona Enter para dejarla vacia): ", 0
    msgVacia BYTE "La cadena ESTA vacia.", 0
    msgNoVacia BYTE "La cadena NO esta vacia.", 0

.code
main PROC
    ; 1. Pedir y leer la cadena
    mov  edx, OFFSET msgPedir   ; Apunta al mensaje de solicitud 
    call WriteString            ;Mostrar mensj en consola 

    mov  edx, OFFSET cadena     ;Direccion del buffer donde se guardara el texto
    mov  ecx, SIZEOF cadena     ;Limite maximo de caracteres a leer
    call ReadString ; Lee la entrada del usuario y guarda longitud en EAX

    ; 2. Validar si está vacía comprobando el primer byte
    cmp  BYTE PTR [cadena], 0   ; Comprueba si el primer byte es nulo
    je   EsVacia ; Si es igual a 0, está vacía

NoEsVacia:
    mov  edx, OFFSET msgNoVacia 
    call WriteString                ;Imprime que la cadena contierne texto
    call Crlf               
    jmp  Fin                        ;Evita caer en el bloque EsVacia 

EsVacia:
    mov  edx, OFFSET msgVacia       ;Imprime que la cadena esta vacia 
    call WriteString            
    call Crlf

Fin:
    exit        
main ENDP
END main