	.data 
x:	.word	9
y:	.word	2

	.text
main:	#Preámbulo de main
	subi	$sp,$sp,24
	sw	$ra,16($sp)
	sw	$fp,20($sp)
	addi	$fp,$sp,20
	
	#Invocación
	lw	$a0,x
	lw	$a1,y
	jal	eleva
	j	finmain
eleva:	
	subi	$sp,$sp,24
	sw	$ra,16($sp)
	sw	$fp,20($sp)
	addi	$fp,$sp,20
	
	#Tarea
	beqz	$a1,entrega
	subi	$a1,$a1,1
	jal	eleva

	mul	$v0,$v0,$a0

descarga:
	lw	$ra,16($sp)
	lw	$fp,20($sp)
	addi	$sp,$sp,24
	jr	$ra
entrega:
	li	$v0,1
	j 	descarga

finmain: nop
	
