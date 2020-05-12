.data 0x10010000
var1: .word	22 # initial value 22
var2: .word 44 # initial value 44
.extern ext1 4
.extern ext2 4
.text
.globl main
main: addu $s0, $ra, $0# save $31 in $16
lw $t5, var1    # $t5 <- M[var1: 22]
lw $t6, var2	# $t6 <- M[var2: 44]
sw $t5, ext2	# MEM[ext2]->$t5
sw $t6, ext1	# MEM[ext1]->$t6

# restore now the return address in $ra and return from main
addu $ra, $0, $s0 # return address back in $31
jr $ra # return from main
