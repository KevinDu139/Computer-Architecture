org 0x0000

ori $29, $0, 0xFFFC

#numbers
ori $1, $0, 1
ori $2, $0, 2

#vars

push $1
push $2

pop $4
pop $3


addu  $3, $1, $2
add   $4, $3, $1
and   $5, $1, $2
nor   $6, $2, $3
or    $7, $1, $3
slt   $8, $1, $3 
slt   $9, $2, $3 
sllv  $10, $1, $3
srlv  $11, $1, $4
subu  $11, $3, $1
xor   $12, $3, $2
addiu $13, $1, 2
addi  $14, $1, 3
beq   $3, $13, beqchk
beqchk:
bne   $3, $2, bnechk
bnechk:
lui   $15, 15
lui   $14, 0xbed
slti  $16, $3, 2
sltiu $17, $3, 5
#lw    $18, 0($1)
#sw    $18,0($2)
xori  $19,$1,0xf33f
j  done

ori $7, $0, 69
done:
ori $7, $0, 0xfeed
#jalchk:
#beq   $4, $5,  
#add   $5, $3, $1
#jal jalchk

bne   $1, $2, next 
jrchk:

ori $4, $0, 7
jr    $ra

next:
jal jrchk

halt






