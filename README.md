# Assembly With MARS

In this repository is created in order to show small projects that I have done in MIPS with the MARS a lightweight interactive development environment (IDE) for programming in assembly language, and also give a small guide of how I have learned it.

## Installing MARS

To install MARS you must enter the page [Missouri State](http://courses.missouristate.edu/kenvollmar/mars/download.htm) and follow the instructions to download the file, also note that MARS requires Java J2SE 1.5 (or later) SDK installed on your computer. 


### Starting in MARS

When you open MARS for the first time is very interactive, use the menubar File to Open a new file or the Open icon.

When you end making your program. Assemble the program using the icon of the tools, and then use the icon "play" to runs the program to completion. Using this icon, you should observe the yellow highlight showing the program’s progress and the values of your program sequence appearing in the Data Segment display. 

The icon of "regression" resets the program and simulator to initial values. Memory contents are those specified within the program, and register contents are generally zero.

And for see step by step program you can use the play icon o the regression icon with a 1 subscript.


![Mars Page](/Users/ximenalezama/Desktop/GitHub/Assambly/1stCapture.png)



## Making your first assembly program
 
If you what to comment your code you must enter your text between a pound sign (#)
 
```
# My First ASM 
# Ximena Lezama Hernández 
# hola.asm display a hello world message

```

To start you must know asm have the following directives.

-.data – it indicates the beginning of the declaration of global data.
-.asciiz – gives the variable 'text' the string that follows it plus a terminator character.
-.text – indicates the start of the code.
-.globl – convert the main label to global.

Then let see how is a Hello Word program in ASM. 

```asm
# My First ASM 
# Ximena Lezama Hernández 
# hola.asm display a hello world message
        .data
texto:  .asciiz   "Hola Mundo"
 
        .text
        .globl main
main:
        la  $a0, texto
        li  $v0, 0x00000004
         syscall

```
## Authors

* **Ximena Lezama** - [LezamaXi](https://github.com/LezamaXi)




---
---




# Ensamblador con MARS

En este repositorio esta diseñado para mostrar pequeños proyectos que he hecho en MIPS con el MARS una IDE para programar en lenguaje ensamblador, y también dar una pequeña guía de cómo lo he aprendido.

## Instalación de MARS

Para instalar MARS, debe ingresar a la página [Missouri State](http://courses.missouristate.edu/kenvollmar/mars/download.htm) y siga las instrucciones para descargar el archivo, también tenga en cuenta que MARS requiere Java J2SE 1.5 (o más tarde) SDK ya previamente instalado en su computadora.


### Iniciando en MARS

Cuando abre MARS por primera vez es muy interactivo, use la barra de menú Archivo para abrir un archivo nuevo o el ícono Abrir.

Cuando termine de hacer su programa. Ensamblelo usando el ícono de las herramientas, y luego use el ícono "reproducir" para ejecutar el programa hasta su finalización. Usando este ícono, debe observar con un resalte amarillo el progreso del programa y los valores de la secuencia de su programa que aparece en la pantalla del Segmento de datos.

El icono de "regresión" restablece el programa y el simulador a los valores iniciales. Los contenidos de la memoria son los especificados dentro del programa, y los contenidos del registro generalmente son cero.

Y para ver el programa paso a paso, puede usar el icono de reproducción o el ícono de regresión con un subíndice 1.


![Mars](/Users/ximenalezama/Desktop/GitHub/Assambly/1stCapture.png)



## Hacer su primer programa de ensamblaje
 
Si quieres comentar tu código debes ingresar tu texto entre un signo de libra (#)
```
# My First ASM 
# Ximena Lezama Hernández 
# hola.asm display a hello world message

```

To start you must know asm have the following directives.

-.data – nos indica el inicio de la declaración de datos globales.
-.asciiz – da a la variable ‘texto’ la cadena que le sigue más un carácter terminador.
-.text – indica el inicio del código.
-.globl – convierte la etiqueta main en global.

Ahora veamos como es un programa en ASM con MARS
```asm
# My First ASM 
# Ximena Lezama Hernández 
# hola.asm display a hello world message
        .data
texto:  .asciiz   "Hola Mundo"
 
        .text
        .globl main
main:
        la  $a0, texto
        li  $v0, 0x00000004
         syscall

```
## Autor

* **Ximena Lezama**  - [LezamaXi](https://github.com/LezamaXi)
