.data 0x10010000
var1: .word	2 # initial value 2
var2: .word 3 # initial value 3
var3: .word -2020 # initial value -2020
.text
.globl main
main: addu $s0, $ra, $0# save $31 in $16
	lw $t1, var1
	lw $t2, var2
	lw $t3, var3
	bne $t1, $t2, Else
	sw $t3, var1
	sw $t3, var2
	beq $0, $0, Exit	
Else: add $t4, $0, $t2
	  sw $t4, var1
	  add $t5, $0, $t1
	  sw $t5, var2
Exit:

# restore now the return address in $ra and return from main
addu $ra, $0, $s0 # return address back in $31
jr $ra # return from main