org 0x0000

ori $29, $0, 0xFFFC
ori $30, $0, 0xFFF8

#numbers
ori $1, $0, 5
ori $2, $0, 5
ori $3, $0, 5
ori $4, $0, 5

#vars
ori $10, $0, 0 #final val
ori $11, $0, 0 #counter

push $1
push $2
push $3
push $4

start:
pop $7
pop $8
addu $10, $0, $0
addu $11, $0, $0

loop:
beq $11, $7, exit
addu $10, $10, $8
addi $11, $11, 1
j loop

exit:
push $10
bne $29, $30, start
halt
