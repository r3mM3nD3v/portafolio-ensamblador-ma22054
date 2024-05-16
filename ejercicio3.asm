; Ejercicio 3: Division de dos enteros con registros de 32 bits

_EXIT  equ 1
_READ  equ 3
_WRITE equ 4
STDIN  equ 0
STDOUT equ 1

section .data 

   msg1 db "digite el dividendo: ",10, 0xD
   len1 equ $- msg1 

   msg2 db "digite el divisor: ", 10, 0xD
   len2 equ $- msg2 

   msg3 db "La division es: ", 10, 0xD
   len3 equ $- msg3

section .bss
   dividend resb 4 ; para almacenar un número de hasta 4 dígitos
   divisor resb 4  
   quotient resb 2 ; para almacenar el cociente (un carácter)
   remainder resb 2 ; para almacenar el residuo (un carácter)

section .text
   global _start    

_start:     
  
   ; Limpiando registros
   xor eax, eax
   xor ebx, ebx
   xor ecx, ecx
   xor edx, edx
  
   ; solicitando el dividendo
   mov eax, _WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 80h                

   ; Leyendo el dividendo
   mov eax, _READ 
   mov ebx, STDIN  
   mov ecx, dividend 
   mov edx, 4 
   int 80h            

   ; solicitando el divisor
   mov eax, _WRITE        
   mov ebx, STDOUT         
   mov ecx, msg2          
   mov edx, len2         
   int 80h

   ; Leyendo el divisor
   mov eax, _READ  
   mov ebx, STDIN  
   mov ecx, divisor 
   mov edx, 4 
   int 80h        

   ; mostrando mensaje 
   mov eax, _WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3          
   mov edx, len3         
   int 80h

   ; convirtiendo los números de cadena a entero
   mov eax, 0       ; preparando para la conversión
   mov ecx, dividend  ; preparando la dirección del dividendo
   call atoi         ; llamando a la función atoi para convertir el dividendo a entero
   mov [dividend], eax  ; preparando el dividendo convertido

   mov eax, 0       ; preparando para la conversión
   mov ecx, divisor   ; cargando la dirección del divisor
   call atoi         ; llamar a la función atoi para convertir el divisor a entero
   mov [divisor], eax   ; guardando el divisor convertido

   ; Realizar la división
   mov eax, [dividend]  
   mov ebx, [divisor]  
   xor edx, edx         
   div ebx              ; Divide eax por ebx, resultado en eax (cociente) y edx (residuo)

   ; Convertir el cociente a ASCII
   add eax, '0'         
   mov [quotient], al   

   ; Convertir el residuo a ASCII
   mov al, dl           
   add al, '0'          
   mov [remainder], al  

   ; Imprimir el cociente
   mov eax, _WRITE        
   mov ebx, STDOUT
   mov ecx, quotient         
   mov edx, 1        
   int 80h

   ; Imprimir el residuo
   mov eax, _WRITE        
   mov ebx, STDOUT
   mov ecx, remainder         
   mov edx, 1        
   int 80h

exit:    
   
   mov eax, _EXIT   
   xor ebx, ebx 
   int 80h


; Función atoi para convertir una cadena de dígitos en un número entero

atoi:
   push ebx          ; guarda el registro ebx
   xor eax, eax      ; inicia el resultado en 0
atoi_loop:
   movzx ebx, byte [ecx]  ; carga el siguiente carácter de la cadena
   cmp ebx, 0x0A     
   je atoi_done      ; si es el final, terminar
   imul eax, 10      ; multiplica el resultado actual por 10
   sub ebx, '0'      ; convierte de ASCII a valor numérico
   add eax, ebx      ; suma el dígito al resultado
   inc ecx           ; mueve al siguiente carácter de la cadena
   jmp atoi_loop     ; repite el proceso para el siguiente dígito
atoi_done:
   pop ebx           ; restaura el registro ebx
   ret               ; devuelve el resultado



















