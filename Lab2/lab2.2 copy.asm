.data 0x10010000
var1: .word	 83 # initial value 83
var2: .word 104 # initial value 104
var3: .word 111 # initial value 111
var4: .word 119 # initial value 119
first: .byte 'S' # initial value S
last: .byte 'S'	 # initial value S
.text
.globl main
main: addu $s0, $ra, $0# save $31 in $16
lw $t5, var1    # $t5 <- M[var1: 83]
lw $t6, var2	# $t6 <- M[var2: 104]
lw $t7, var3	# $t7 <- M[var3: 111]
lw $t8, var4	# $t8 <- M[var4: 119]
sw $t5, var4	# MEM[var4]->$t5
sw $t6, var3	# MEM[var3]->$t6
sw $t7, var2	# MEM[var2]->$t7
sw $t8, var1	# MEM[var1]->$t8
lb $t1, first	# $t1 <- ('S')
sb $t2, first($t0) # MEM[first]->$t2
lb $t3, last	# $t3 <- ('S')
sb $t4, last($t0) # MEM[last]->$t4

# restore now the return address in $ra and return from main
addu $ra, $0, $s0 # return address back in $31
jr $ra # return from main