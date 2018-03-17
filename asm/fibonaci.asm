
#### This program simulates fibonacci, where n is the fibonacci number you what to know ###
### and res is the result of evaluate fibonacci recursive n-times ###

.data
        f0:     	.word   0
        f1:     	.word   1
        n:      	.word   3
        res:    	.word   0
.text
        main:   
       
        	lw $4, n($0)
                jal fib
                sw $2, res($0)
                li $2, 10
                syscall
 
        fib:    bgt $4, 1, else         #if n<1 then
                add $2, $0, $4          #return n
                jr  $31
        else:   subi $29, $29, 12       #else
                sw $4, 0($29)           #guardamos n en la pila
                sw $31, 8($29)
                subi $4, $4, 1          #n = n-1
                jal fib                 #call fib(n-1)
                sw $2, 4($29)           #guardamos fib(n-1) en la pila
                lw $4, 0($29)           #cargamos n
                subi $4, $4, 2          #n = n-2
                jal fib                 #call fib(n-2)
                lw $8, 4($29)           #$8 <- fin(n-1)
                lw $31, 8($29)
                addi $29, $29, 12       #restauramos la pila
                add $2, $8, $2          #$2 <- $8 + fib(n-2)
                jr $31
