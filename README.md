# GHUB.java.ag.Practicas-de-lenguajes-de-interfaz-UNIDAD3-LUISARNOLDOSOTELOCERVANTES
Practicas de la unidad 3 
# Prácticas Unidad 3 - Ensamblador (MASM)

Alumno: Luis Arnoldo Sotelo Cervantes

Repositorio con las 5 practicas de la Unidad 3 hechas en MASM usando la libreria Irvine32.

## 1. UsodeMacro.asm
- Que hace: Define dos macros, una para imprimir texto con salto de linea (`MostrarMensaje`) y otra para multiplicar dos numeros (`Multi`).
- Que se comprobo: Al ejecutarlo en consola se imprimieron bien los mensajes de bienvenida y adios, y la macro de multiplicacion arrojo el +20 (4 * 5) sin problemas.

## 2. ValidarVacia&Novacia.asm
- Que hace: Pide una cadena por teclado con `ReadString` y revisa si el primer byte del arreglo es 0 para saber si esta vacia o no.
- Que se comprobo: Si solo presionas Enter sin escribir nada, entra al salto `EsVacia` y avisa que esta vacia. Si escribes cualquier letra o espacio, detecta que el primer byte ya no es 0 y muestra que no esta vacia.

## 3. PasoDeParametros.asm
- Que hace: Manda dos numeros (1 y 2) por la pila usando `push` hacia el procedimiento `sumarPila`. Adentro usa `ebp` para leer los parametros (`[ebp+8]` y `[ebp+12]`), guarda el valor de `ebx` para no perderlo y al final limpia la pila con `ret 8`.
- Que se comprobo: Revisando los registros en Visual Studio, se vio que `ebx` conservo su valor original (10) despues de salir del procedimiento y que `ret 8` limpio los 8 bytes de los dos parametros que se habian metido a la pila.

## 4. Procedimiento.asm
- Que hace: Imprime en hexadecimal lo que hay en la cima de la pila (`[esp]`) estando en `main`, luego dentro de `procUno` y despues en `procDos`.
- Que se comprobo: Al correrlo salen tres direcciones en hexadecimal diferentes. Con esto se comprobo que cada vez que se ejecuta un `call`, el procesador guarda automaticamente en `[esp]` la direccion de la siguiente instruccion para saber a donde regresar cuando llegue al `ret`.

## 5. LlamadasProcedimientoEIP.asm
- Que hace: Llama dos veces seguidas al mismo procedimiento (`mensajeAviso`) desde el `main`, poniendo instrucciones `mov eax, 10` y `mov eax, 20` despues de cada llamada.
- Que se comprobo: Se comprobo como funciona el puntero `EIP` con `call` y `ret`. El programa salta al procedimiento, imprime el aviso y al hacer `ret` regresa exactamente a la linea siguiente de donde fue llamado (primero a `mov eax, 10` y en la segunda vuelta a `mov eax, 20`) hasta terminar.