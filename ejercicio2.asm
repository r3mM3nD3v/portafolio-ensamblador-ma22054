	; Ejercicio 2: Multiplicacion de dos enteros usando registros de 8 bits
	
_EXIT  equ 1
_READ  equ 3
_WRITE equ 4
STDIN  equ 0
STDOUT equ 1

section .data
    msg1 db "Escriba un numero: ", 10, 0xD
    len1 equ $ - msg1
    
    msg2 db "Ingrese el ultimo numero: ", 10, 0xD
    len2 equ $ - msg2
    
    msg3 db "El resultado de la multiplicacion es: ", 10, 0xD
    len3 equ $ - msg3
    
    res db 0 ; almacena el resultado
    
section .bss
    num1 resw 1 ; permite mas de un dígito
    num2 resw 1 ; 
    
section .text
    global _start
    
_start:
    ; solicitando el primer numero
    mov eax, _WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1
    int 80h
    
    ; Leyendo el primer numero
    mov eax, _READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 2 ; permite mas de un digito
    int 80h
    
    ; solicitando el segundo numero
    mov eax, _WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 80h
    
    ; Leyendo el segundo numero
    mov eax, _READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 2 
    int 80h
    
    ; convertiendo los numeros ASCII a enteros
    mov ax, [num1] ; permite mas de un dígito
    sub ax, '0'
    mov bx, [num2] ; 
    sub bx, '0'
    
    ; multiplicamos
    mul bl

    ; convirtiendo el resultado a ASCII
    add ax, '0'

    ; guardando el resultado en la variable res
    mov [res], al

    ; mostrando en la terminal el resultado
    mov eax, _WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
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




