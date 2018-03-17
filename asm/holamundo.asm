.data
texto: .asciiz "Hola Mundo"
 
.text
.globl main
main:
la $a0, texto
li $v0, $4
syscall