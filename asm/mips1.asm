	.data 
cod1:	.ascii 	"hola\0"
cod2:	.asciiz "hola"

i: 	.word 	5
n:	.word 	3
	
	

LONG:	
	lw	$a0, i
	lw	$a1, n
	subi 	$sp, $sp, 24
	sw	$fp,16($sp)
	addi	$fp,$sp,20
	
	move 	$t0, $zero
	
	
While:	
	move 	$t1,$a0
	move	$t2,$a1
	
	beqz 	$t1, end
	subi 	$a0,$a0,1
	
	
	j 	While
	
end:	move	$v0,$t0
	lw	$fp,16($sp)
	addi	$sp,$sp,24
	jr	$ra

fin: 	nop
	


	
	