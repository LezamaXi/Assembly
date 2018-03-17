	.data 
n:	.word	4  # numero que vamos a exponenciar
k:	.word	2  # potencia a la cual elevar n

	.text
main:	
	subi	$sp, $sp, 24  		# marco
	sw	$ra, 16($sp) 		# Guardar $ra
	sw	$fp, 20($sp) 		# Guardar $fp
	addi	$fp, $sp, 20  		# Establecer $fp
	lw	$a0, 	n 	    	# guardamos a n en los parametros de la llamda
	lw	$a1, 	k    		# de igual se forma se carga k
	li	$s0,	0		#cargamos la variable global cero
	jal	potenciacion	    	#Brinca a la subrutina
	j	termina
	
potenciacion: 				#llamada recursiva a la potenciacion	
	subi	$sp, $sp, 24  		# Creamos un nuevo marco para las llamadas recursivas
	sw	$ra, 16($sp) 
	sw	$fp, 20($sp) 
	addi	$fp, $sp, 20  
					# Ahora empezamos con el codigo para el programa
	ble 	$a1, $s0, else     	# esta linea nos lleva al caso base
	subi	$a1, $a1, 1   	   	# restamos k en cada iteracion hasta llegar a cero
	jal	potenciacion       	# hacemos recursion
	#regresa de la recursion
	mul	$t1, $v0, $a0 	   	# Aquí multiplicamos tantas veces como llamadas recursivas se creen
	move 	$v0, $t1	  	# guardamos el resultado en el registro v0 que es por convencion 
				   
end:
	lw	$ra, 16($sp) 		# Restaurar $ra
	lw	$fp, 20($sp) 		# Restaurar $fp
	addi	$sp, $sp, 24  		# Eliminar el marco 
	jr	$ra	    		# regresamos a main
else:
	li	$v0, 1	   		# caso baso si el exponente llega a cero 
	j 	end 	   		# regresa de la recursion

termina: nop
	
