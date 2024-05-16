# # Portafolio - Ensamblador MA22054

Este repositorio contiene los programas desarrollados como parte de la **Actividad 5** de la materia de **Diseño y Estructura de Computadoras** del ciclo V, de la carrera de **Desarrollo de Software** impartida por la Universidad de El Salvador.

Los programas fueron desarrollados en Debian 12, utilizando las herramientas mostradas durante clase, así como otras que se investigaron por aparte para completar los requerimientos necesarios de cada programa.

## Programas

### 1. Programa de Resta

Realiza la resta de tres números enteros de 16 bits utilizando registros de 16 bits. Se divide en secciones claramente definidas:

- Declaración de constantes
- Sección de datos
- Sección de bss
- Sección de texto

El programa solicita tres números al usuario utilizando llamadas al sistema para mostrar mensajes y leer la entrada del usuario. Luego, convierte los números ingresados de formato ASCII a valores enteros restando el valor ASCII de '0'. Posteriormente, realiza las operaciones de resta utilizando los valores enteros obtenidos anteriormente. Una vez realizada la resta, convierte el resultado de entero a formato ASCII sumando el valor ASCII de '0' y lo almacena en una variable. Finalmente, muestra el mensaje "La resta es: " utilizando una llamada al sistema _WRITE y muestra el resultado de la resta utilizando la misma llamada al sistema, antes de terminar el programa con una llamada al sistema _EXIT.

### 2. Programa de Multiplicación

Realiza la multiplicación de dos enteros de 8 bits utilizando registros de 8 bits. Al igual que el programa de resta, se estructura en secciones claras y utiliza llamadas al sistema para interactuar con el usuario, convertir entre formatos ASCII y enteros, realizar la multiplicación y mostrar resultados. Después de solicitar dos números al usuario y convertirlos de formato ASCII a valores enteros, utiliza la instrucción `mul` para multiplicar los dos números. Luego, convierte el resultado de la multiplicación de entero a formato ASCII y lo almacena en una variable. Finalmente, muestra el mensaje "El resultado de la multiplicación es: " junto con el resultado utilizando llamadas al sistema _WRITE, antes de finalizar el programa con una llamada al sistema _EXIT.

### 3. Programa de División

Realiza la división de dos enteros de 32 bits utilizando registros de 32 bits. Primero, limpia los registros necesarios y luego solicita al usuario el dividendo y el divisor utilizando llamadas al sistema. Después de convertir los números de cadena a enteros utilizando la función `atoi`, la cual convierte una cadena de dígitos en un número entero, utiliza la instrucción `div` para realizar la división del dividendo por el divisor. El cociente se almacena en `eax` y el residuo en `edx`. Luego, convierte el cociente y el residuo de entero a formato ASCII y los muestra utilizando llamadas al sistema _WRITE. Finalmente, termina el programa con una llamada al sistema _EXIT.

