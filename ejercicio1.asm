; Ejercicio 1: resta de 3 enteros usando registros de 16 bits
	
_EXIT  equ 1
_READ  equ 3
_WRITE equ 4
STDIN  equ 0
STDOUT equ 1

section .data
    msg1 db "Escriba numero: ", 10,0xD
    len1 equ $- msg1

    msg2 db "Escriba un segundo numero: ", 10,0xD
    len2 equ $- msg2

    msg3 db "Escriba el ultimo numero: ", 10,0xD
    len3 equ $- msg3

    msg4 db "La resta es: "
    len4 equ $- msg4

section .bss
    num1 resb 2
    num2 resb 2
    num3 resb 2
    res  resb 1

section .text
    global _start

_start:

    mov eax, 0
    mov ebx, 0
    mov ecx, 0
    mov edx, 0

    ; solicitando el primer numero
    mov eax, _WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 80h

    ; leyendo el primer numero
    mov eax, _READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 2
    int 80h

    ; solicitando el segundo numero
    mov eax, _WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 80h

    ; leyendo el segundo numero
    mov eax, _READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 2
    int 80h

    ; solicitando el tercer numero
    mov eax, _WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 80h

    ; leyendo el tercer numero
    mov eax, _READ
    mov ebx, STDIN
    mov ecx, num3
    mov edx, 2
    int 80h

    ; convertiendo los numeros de ASCII a valores enteros
    mov eax, [num1]
    sub eax, '0'

    mov ebx, [num2]
    sub ebx, '0'

    mov ecx, [num3]
    sub ecx, '0'

    ; restando
    sub eax, ebx
    sub eax, ecx

    ; convertiendo el resultado de entero a ASCII
    add eax, '0'

    ; resultado en la variable res
    mov [res], al ; almacenar solo el byte menos significativo

    ; mostrando el resultado
    mov eax, _WRITE
    mov ebx, STDOUT
    mov ecx, msg4
    mov edx, len4
    int 80h

    mov eax, _WRITE
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int 80h

exit:

    mov eax, _EXIT
    xor ebx, ebx
    int 80h







