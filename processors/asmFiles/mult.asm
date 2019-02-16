org 0x0000

ori $29, $0, 0xFFFC

#numbers
ori $1, $0, 10
ori $2, $0, 4

#vars
ori $5, $0, 0x0000 #counter
ori $10, $0, 0x0000 #store val

push $1
push $2

pop $4
pop $3

LOOP:
beq $5, $4, done
add $10, $10, $3
addi $5, $5, 0x0001
j LOOP

done:
push $10
halt
