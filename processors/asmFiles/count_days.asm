org 0x0000

ori $29, $0, 0xFFFC

#vars
ori $10, $0, 0x0000 #total days
ori $1, $0, 20    #current days
ori $2, $0, 8     #current months
ori $3, $0, 2018  #current years
ori $20, $0, 0x0000 #counter


#configure years and months
addi $2, $2, -1
addi $3, $3, -2000

#add days first
addu $10, $0, $1

monthloop:
beq $20, $2, exit
addi $10, $10, 30
addi $20, $20, 1
j monthloop

exit:
subu $20, $20, $20

yearloop:
beq $20, $3, done
addi $10, $10, 365
addi $20, $20, 1
j yearloop

done:
push $10
halt

