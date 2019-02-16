  #------------------------------------------------------------------
  # Test lw sw
  #------------------------------------------------------------------

  org   0x0000
  ori   $1, $zero, 0xF0
  ori   $2, $zero, 0x100
  ori   $3, $zero, 0x200
  ori   $4, $zero, 0x300
  ori   $5, $zero, 0x400
  slt   $5, $3, $4
  slt   $5, $zero, $4
  slt   $5, $3, $zero
  slt   $3, $5, $zero
  slt   $zero, $5, $1
  slt   $1, $5, $5
  slti   $zero, $5, 10
  slti   $3, $5, 10
  slti   $5, $3, 10
  slti   $4, $3, 0
  slti   $8, $4, 66
  lw    $6, 0($1)
  slt   $5, $6, $zero
  lw    $7, 4($1)
  lw    $8, 8($1)
  ori   $4, $zero, 0x500
  ori   $5, $zero, 0x600
  sw    $6, 0($2)
  slt   $2, $5, $6
  sw    $7, 0($3)
  slt   $3, $7, $6
  sw    $8, 8($2)
  halt      # that's all

  org   0x00F0
  cfw   0x7337
  cfw   0x2701
  cfw   0x1337
