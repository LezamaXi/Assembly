		.data
cadena: 	.asciiz "Introduzca una cadena: \n"
buffer: 	.space 1024
suma:	.asciiz 	"+"
resta:	.asciiz 	"-"
div:	.asciiz 	"/"
mult:	.asciiz 	"*"
resul:	.float 		0.0
reversa: 	.asciiz "La cadena invertida es: "
		.text
main:
 	li $v0, 4 	# 4-Imprimir cadena
 	la $a0, cadena  # Asignar memoria a la cadena
 	syscall
 
 	li $v0, 8	# 8-Leer cadena
 	la $a0, buffer  # Asignar memoria al buffer
 	li $a1, 1024 	# Tamaño de la cadena
 	syscall
 
 	la $a0, buffer  # Cadena leida
 	la $a1, buffer 	# Memoria para la cadena invertida
 	jal long
 
 	li $v0, 4 	# 4-Imprimir cadena
 	la $a0, reversa # Asignar memoria a la reversa
 	syscall
 
 	li $v0, 4 	# 4-Imprimir cadena
 	la $a0, buffer  # Cadena ya invertida impresa
 	syscall
 
 
 	li $v0, 10 	# Fin del programa
 	syscall
 

long:
 	li $t1, 0   	# Lleva la cantidad de letras que hay
 	
floop:
 	lb $t0, ($a0) 	# Lee un caracter de la cadena
 	beqz $t0,rev	# Si se acabo la cadena termina de leer
 	subi $sp,$sp,4 	# Reserva memoria para crear el marco
 	sb $t0, ($sp)	# Se guarda en la cadena final
 	addi $t1, $t1,1 # Sumo que eh leido un caracter
 	addi $a0, $a0,1 
 	j floop
 	
rev:
 	lb $t0,($sp)	# Saco una letra de la cadena
 	addi $sp,$sp,4 	# Reserva memoria para crear el marco
 	sb $t0, ($a1) 	# Guardo el caracter en la reversa
 	addi $a1,$a1,1	# Te situas en el siguiente caracter
 	subi $t1,$t1,1	# Le sumas 1 a la longitud
 	bnez $t1,rev 	# Mientras exista caracteres en la pila
 	sb $zero,($a1) 	
 	jr $ra 
