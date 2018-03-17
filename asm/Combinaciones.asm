### Este programa calcula las combinaciones de n en k  ####		
		.data
n:		.word		10		
k:		.word		5		
		.text
		
main:					# Inicio de la etiqueta main
		lw	$a0, n		# Cargamos n 
		lw	$a1, k		# Cargamos k
		jal	casosbase	# Invocacion de casosNK
		j	finmain		# Bricamos al finmain
		
casosbase:	
		subi 	$sp, $sp, 32	# Reserva memoria para crear el marco
		sw	$a2, 16($sp)	# Carga (guarda) a2
		sw	$a3, 12($sp)	# Carga (guarda) a3
		sw	$ra, 20($sp)	# Carga (guarda) ra
		sw	$fp, 24($sp)	# Carga (guarda) fp
		addi 	$fp, $sp, 28	# Restaura fp 
		beqz	$a1, casoK	# si k == 0 se va al caso base 1
		beqz	$a0, casoN	# si n == 0 se va al caso base 2
		
else:		move	$a2, $a0	# a2 = n
		move	$a3, $a1	# a3 = k
		subi	$a0, $a0, 1	# n-1
		subi 	$a1, $a1, 1	# k-1
		jal 	casosbase	# Retorno a los casos base
		
else2:		move	$t0, $v0	# Guarda el resultado en $t0
		subi	$a0, $a2, 1	# Nuevamente calculamos n-1
		move	$a1, $a3	# Recupera k
		sw	$t0, 28($sp) 	# Carga (guarda)$t0
		jal	casosbase	# Retorno a los casos base
		j 	retorno

casoK:		li	$v0, 1		# Caso base cuando k == 0
		j	res		# Brinca a res
		
casoN:		li	$v0, 0		# Caso base cuando n == 0
		j	res		# Brinca a res
		
retorno:	lw 	$t0, 28($sp)	# Restaura t0
		add	$v0, $v0, $t0	# Suma los casos N y K
		j 	res		# Brinca a res
		
res:		lw	$a2, 16($sp)	# Restaura a2
		lw	$a3, 12($sp)	# Restaura a3
		lw	$ra, 20($sp)	# Restaura ra
		lw	$fp, 24($sp)	# Restaura fp
		addi	$sp, $sp, 32	# elimina el marco
		jr	$ra		# regresa a la rutina invocadora
		
finmain:	nop			# Termina el programa
		
