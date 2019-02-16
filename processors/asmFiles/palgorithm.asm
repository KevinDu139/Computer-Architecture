#----------------------------------------------------------
# First Processor
#----------------------------------------------------------
  org   0x0000              # first processor p0
  ori   $sp, $0, 0x3ffc  # stack
  jal   mainp0              # go to program
  halt

mainp0:
  push  $ra                 # save return address 
  ori   $t6, $0, 256     # set max rands to 256
  ori   $t7, $0, 0xABCD       # set seed
  ori   $t4, $0, 0  # counter of how many number is on stack
  ori   $t9, $0, 0   # counter for number of randoms generated
  jal generator
  
generator:
  # generate random number
  or   $a0, $0, $t7    # set argument to previous value 
  jal   crc32               # generate random 
  or   $t8, $0, $v0    

  # push result
  ori   $a0, $0, l1     
  jal   lock                
  or   $a0, $0, $t8     
  jal check_push_stack
  jal   push_num            
  ori   $a0, $0, l1      
  jal   unlock            

  # seed = result
  or   $t7, $0, $t8   

 
  addi  $t9, $t9, 1
  bne   $t9, $t6, generator   # branch as long as counter is not equal to 256         

  pop   $ra                
  jr    $ra                 

l1:
  cfw 0x0


#----------------------------------------------------------
# Second Processor
#----------------------------------------------------------
  org   0x1000               # second processor p1
  ori   $sp, $0, 0x7ffc  # stack
  jal   mainp1              # go to program
  halt

mainp1:
  ori   $s0, $0, 0xFFFFFFFF  # Min value
  ori   $s1, $0, 0x00000000  # Max value
  ori   $s2, $0, 0           # sum of random values 

  push  $ra                 # save return address
  ori   $t6, $0, 256
  ori   $t5, $0, 0  
  
  jal popNextVal
  

popNextVal:
  #verify there are values in the stack
  jal   check_pop_stack

  # obtain locks and pop values
  ori   $a0, $0, l1     
  jal   lock            
  jal   pop_num             
  or    $t7, $0, $v0    
  ori   $a0, $0, l1      
  jal   unlock             
  addi $t4, $t4, -1
  # write the computation algorithm
  #-max (a0=a,a1=b) returns v0=max(a,b)
  #-min (a0=a,a1=b) returns v0=min(a,b)

  # min calculation
  andi   $a0, $s0, 0x0000FFFF
  andi   $a1, $t7, 0x0000FFFF
  jal  min
  or   $s0, $0, $v0
  
  # max calculation
  andi   $a0, $s1, 0x0000FFFF
  jal  max
  or   $s1, $0, $v0

  # compute sum and store in S2
  andi $t7, $t7, 0x0000FFFF
  add $s2, $s2, $t7

  
  # increment counter and branch
  addi  $t5, $t5, 1
  bne   $t5, $t6, popNextVal

  # final calculation for average and remainder
  or $a0, $0, $s2
  or $a1, $0, $t6
  jal divide
  #ori $t2, $0, 8
  #srl $t1, $s2, 8
  or $t1, $0, $v0
  or $t2, $0, $v1
  # average is in $s2 and remainder in $s3
  
  ori $t0, $0, min_res
  sw $s0, 0($t0)
  ori $t0, $0, max_res
  sw $s1, 0($t0)
  ori $t0, $0, avg_res
  sw $t1, 0($t0)

  pop   $ra                 # get return address
  jr    $ra                 # return to caller

res:
  cfw 0x0                   


# pass in an address to lock function in argument register 0
# returns when lock is available
lock:
aquire:
  ll    $t0, 0($a0)         # load lock location
  bne   $t0, $0, aquire     # wait on lock to be open
  addiu $t0, $t0, 1
  sc    $t0, 0($a0)
  beq   $t0, $0, lock       # if sc failed retry
  jr    $ra


# pass in an address to unlock function in argument register 0
# returns when lock is free
unlock:
  sw    $0, 0($a0)
  jr    $ra

#-----------------------------------------------------------
# Push and Pop functions
#-----------------------------------------------------------

# loop until the offset is greater than 0
check_pop_stack:
  ori $t0, $0, stack_ptr
  lw $t1, 0($t0)                      # load the offset
  #slt $t2, $t1, $0
  beq $t1, $0, check_pop_stack
  jr   $ra                            # return to caller

check_push_stack:
  ori $t1, $0, 10
  beq $t1, $t4, unlock
  jr   $ra 

push_num:
  ori $t0, $0, stack_ptr
  lw $t1, 0($t0)                      
  ori $t2, $0, stack_base
  lw $t3, 0($t2)                    

  sub $t3, $t3, $t1                  

  sw   $a0, 0($t3)                    
  addi $t1, $t1, 4                  
  sw   $t1, 0($t0)                   
  
  addi $t4, $t4, 1
  jr   $ra                            # return to caller


pop_num:
  ori $t0, $0, stack_ptr
  lw $t1, 0($t0)                      # load the offset
  
  ori $t2, $0, stack_base
  lw $t3, 0($t2)                      

  addi $t1, $t1, -4                  
  sub $t3, $t3, $t1                 

  lw $v0, 0($t3)                      
  sw $0, 0($t3)                    
  sw $t1, 0($t0)                      
  
  jr    $ra                 # return to caller





#REGISTERS
#at $1 at
#v $2-3 function returns
#a $4-7 function args
#t $8-15 temps
#s $16-23 saved temps (callee preserved)
#t $24-25 temps
#k $26-27 kernel
#gp $28 gp (callee preserved)
#sp $29 sp (callee preserved)
#fp $30 fp (callee preserved)
#ra $31 return address

# USAGE random0 = crc(seed), random1 = crc(random0)
#       randomN = crc(randomN-1)
#------------------------------------------------------
# $v0 = crc32($a0)
crc32:
  lui $t1, 0x04C1
  ori $t1, $t1, 0x1DB7
  or $t2, $0, $0
  ori $t3, $0, 32

crcl1:
  slt $t4, $t2, $t3
  beq $t4, $0, crcl2

  srl $t4, $a0, 31
  sll $a0, $a0, 1
  beq $t4, $0, crcl3
  xor $a0, $a0, $t1
crcl3:
  addiu $t2, $t2, 1
  j crcl1
crcl2:
  or $v0, $a0, $0
  jr $ra
#------------------------------------------------------

# registers a0-1,v0-1,t0
# a0 = Numerator
# a1 = Denominator
# v0 = Quotient
# v1 = Remainder

#-divide(N=$a0,D=$a1) returns (Q=$v0,R=$v1)--------
divide:               # setup frame
  push  $ra           # saved return address
  push  $a0           # saved register
  push  $a1           # saved register
  or    $v0, $0, $0   # Quotient v0=0
  or    $v1, $0, $a0  # Remainder t2=N=a0
  beq   $0, $a1, divrtn # test 0 D
  slt   $t0, $a1, $0  # test neg D
  bne   $t0, $0, divdneg
  slt   $t0, $a0, $0  # test neg N
  bne   $t0, $0, divnneg
divloop:
  slt   $t0, $v1, $a1 # while R >= D
  bne   $t0, $0, divrtn
  addiu $v0, $v0, 1   # Q = Q + 1
  subu  $v1, $v1, $a1 # R = R - D
  j     divloop
divnneg:
  subu  $a0, $0, $a0  # negate N
  jal   divide        # call divide
  subu  $v0, $0, $v0  # negate Q
  beq   $v1, $0, divrtn
  addiu $v0, $v0, -1  # return -Q-1
  j     divrtn
divdneg:
  subu  $a0, $0, $a1  # negate D
  jal   divide        # call divide
  subu  $v0, $0, $v0  # negate Q
divrtn:
  pop $a1
  pop $a0
  pop $ra
  jr  $ra
#-divide--------------------------------------------

# registers a0-1,v0,t0
# a0 = a
# a1 = b
# v0 = result

#-max (a0=a,a1=b) returns v0=max(a,b)--------------
max:
  push  $ra
  push  $a0
  push  $a1
  or    $v0, $0, $a0
  slt   $t0, $a0, $a1
  beq   $t0, $0, maxrtn
  or    $v0, $0, $a1
maxrtn:
  pop   $a1
  pop   $a0
  pop   $ra
  jr    $ra
#--------------------------------------------------

#-min (a0=a,a1=b) returns v0=min(a,b)--------------
min:
  push  $ra
  push  $a0
  push  $a1
  or    $v0, $0, $a0
  slt   $t0, $a1, $a0
  beq   $t0, $0, minrtn
  or    $v0, $0, $a1
minrtn:
  pop   $a1
  pop   $a0
  pop   $ra
  jr    $ra
#--------------------------------------------------

stack_ptr:
  cfw 0x0000

stack_base:
  cfw 0x9000

org 0xE000
max_res:
  cfw 0xBAD1BAD1
min_res:
  cfw 0xBAD2BAD2
avg_res:
  cfw 0xBAD3BAD3


