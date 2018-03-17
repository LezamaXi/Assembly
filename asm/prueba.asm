		.data
buffer:		.space		1024
buffer2:    	.space      	1024             # buffer de cad2 
buffer3:    	.space      	1024             # buffer de la concatenación
promptw: 	.asciiz 	"\n$ Introduce un comando valido: "
tucoma:		.asciiz		"Tu comando es: "
helpw:		.asciiz		"help\n"
helphelpw:	.asciiz		"help help\n"
helprevw:	.asciiz		"help rev\n"
helpcatw:	.asciiz		"help cat\n"
helpexitw:	.asciiz		"help exit\n"
revw:		.asciiz		"rev\n"
catw:		.asciiz		"cat\n"
exitw:		.asciiz		"exit\n"
matchhelp:	.asciiz 	"\nEs help\n"
matchexit:	.asciiz 	"\nEs exit\n"
matchcat:	.asciiz 	"\nPrimera cadena que quieres concatenar: \n"
cad2: 		.asciiz     	"\nSegunda cadena que quieres concatenar: \n"
concat:     	.asciiz     	"Las cadenas concatenadas son: \n"
matchrev:	.asciiz 	"Introduzca una cadena que quieres invertir: \n"
reversa: 	.asciiz 	"La cadena invertida es: "
nonmatch:	.asciiz 	"\nNo ***Error: El comando introducido no es reconocido.  \n Para enlistar comandos disponibles, usar el comando <help>.\n Para saber que hace cada uno, usa help seguido del comando.\n Para usar el comando, solamente el comando.\n Para salir, usa exit. "  
insthelpsolo:	.asciiz		"\nCOMANDOS DISPONIBLES:\n help [arg]\n rev [file]\n cat file [file]\n exit\n"
insthelphelp:	.asciiz		"\n\t\t\t\thelp\nDescripcion: Imprime informacion de los comandos disponibles y sus opciones. Si se llama sin argumentos, imprime una lista de los comandos disponibles.\nSin�psis: help [arg]\nArgumentos: arg - Imprime la descripci�n y opciones del comando arg.\n\n"
insthelprev:	.asciiz		"\n\t\t\t\trev\nDescripcion: Imprime la reversa de una cadena. Si no se especifica un archivo, se utiliza la entrada est�ndar (s�lo una l�nea).\nSin�psis: rev [file]\nArgumentos: file - Arhivo de texto a revertir.\n\n"
insthelpcat:	.asciiz		"\n\t\t\t\tcat\nDescripcion: Concatena los archivos y los muestra en pantalla.\nSin�psis: cat file [file]\nArgumentos: file - Arhivo a concatenar.\n\n"				
insthelpexit:	.asciiz		"\n\t\t\t\texit\nDescripcion: Termina la ejecucion del intorprete de comandos, terminando as� la simulaci�n de MARS.\n\n"
				
		.text
main:	
		#Pre�mbulo y todo
		li	$v0,4		# Imprimiendo prompt
		la	$a0,promptw	
		syscall
		li	$v0,8		# Leer cadena
		la	$a0,buffer	
		li	$a1,1024
		syscall
		move	$t6,$a0		# Moviendo el input del usuario a $t6.
		#Checar si es help
		move	$a0,$t6
		la	$a1,helpw
		jal	strcomp
		beq	$v0,$zero,fuehelp
		#Checar si es help help
		move	$a0,$t6
		la	$a1,helphelpw
		jal	strcomp
		beq	$v0,$zero,fuehelphelp
		#Checar si es help rev
		move	$a0,$t6
		la	$a1,helprevw
		jal	strcomp
		beq	$v0,$zero,fuehelprev
		#Checar si es help cat
		move	$a0,$t6
		la	$a1,helpcatw
		jal	strcomp
		beq	$v0,$zero,fuehelpcat
		#Checar si es help exit
		move	$a0,$t6
		la	$a1,helpexitw
		jal	strcomp
		beq	$v0,$zero,fuehelpexit
		#Checar si es rev
		move	$a0,$t6
		la	$a1,revw
		jal	strcomp
		beq	$v0,$zero,fuerev
		#Checar si es cat
		move	$a0,$t6
		la	$a1,catw
		jal	strcomp
		beq	$v0,$zero,fuecat
		#Checar si es exit
		move	$a0,$t6
		la	$a1,exitw
		jal	strcomp
		beq	$v0,$zero,fueexit
		####NO FUE NING�N COMANDO####
		li	$v0,4
		la	$a0,nonmatch
		syscall
		j	main
		#####FIN BUENO########
		j	terminar	# Brincar para terminar de buena forma.

strcomp:	
		li	$t0,0
		move	$t1,$a0
		move	$t2,$a1
		
loopstrcomp:		
		lb	$t3,($t1)
		lb	$t4,($t2)
		beqz	$t3,tprimero
		beqz	$t4,ncoincide
		slt	$t5,$t3,$t4
		bnez	$t5,ncoincide
		addi	$t1,$t1,1
		addi	$t2,$t2,1
		j	loopstrcomp

ncoincide:	
		addi	$v0,$zero,1
		j	endstrcmp

tprimero:	bnez	$t4,ncoincide
		addi	$v0,$zero,0

endstrcmp:	
		jr	$ra

fuehelp:	
		li	$v0,4
		la	$a0,insthelpsolo
		syscall
		j	main

fuehelphelp:	
		li	$v0,4
		la	$a0,insthelphelp
		syscall
		j	main
fuehelprev:	
		li	$v0,4
		la	$a0,insthelprev
		syscall
		j	main
fuehelpcat:	
		li	$v0,4
		la	$a0,insthelpcat
		syscall
		j	main
		
fuehelpexit:	
		li	$v0,4
		la	$a0,insthelpexit
		syscall
		j	main
		
fuerev:		li	$v0,4
		la	$a0,matchrev
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
 
 		j	main
 

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
		
		
fuecat:		
		li $v0,4        	# 4-Imprimir cadena
        	la $a0,matchcat        	# Asignar memoria a la cadena 1
        	la $a1,buffer      	# Asignar memoria al buffer de la 1º cadena
        	syscall 
        	jal lee
        	move $s0,$v0        	# Levar conteo de la longitud de la 1º cadena
    
    		li $v0,4       		# 4-Imprimir cadena
        	la $a0,cad2         	# Asignar memoria a la cadena 2
        	la $a1,buffer2      	# Asignar memoria al buffer de la 2º cadena
        	syscall 
        	jal lee
        	move $s1,$v0        	# Levar conteo de la longitud de la 2º cadena
    	
    		li $v0,4       		# 4-Imprimir cadena
    		la $a0,concat  		# Asignar memoria a la cadena final
    		syscall 
    	
        	la $a0,buffer3      	# Asignar memoria al buffer de la 3º cadena

        	la $a1,buffer
        	jal cat

        	la $a1,buffer2
        	jal cat

        	li $v0,4       		# 4-Imprimir cadena
        	la $a0,buffer3		# Asignar memoria al buffer de la cadena final
        	syscall

        	j	main


lee:
    
    		li      $v0,8		# 8-Leer cadena
    		move    $a0,$a1         # Guarda la cadena
    		li      $a1,1024        # Tamaño de la cadena
    		syscall

    		li      $v1,'\n'
    		move    $a1,$a0            
       
lee_aux:
    		lb $v0,($a0)		# Lee un caracter de la cadena
    		addi $a0,$a0,1           # Te situas en el sig caracter
    		beq $v0,$v1,fin  	# Si es una nueva linea termina
    		bnez $v0,lee_aux  

fin:
    		subi $a0,$a0,1           # Quitas el conteo de la longitud
    		sb $zero,($a0)
    		sub $v0,$a0,$a1         # regresa la longitud
    		jr $ra

cat:
    		lb      $v0,($a1)        # Lee un caracter de la cadena
    		beqz    $v0,catfin     # Si ya no hay caracteres termina

    		sb      $v0,($a0)            

    		addi    $a0,$a0,1        # Cambia los punteros al sig carecter de la cad1
    		addi    $a1,$a1,1        # Cambia los punteros al sig carecter de la cad2
    		j      cat

catfin:
    		sb      $zero,($a0)      # termina
    		jr      $ra       
		
				
fueexit:	
		j	terminar
terminar:	
		li	$v0,10
		syscall
	
