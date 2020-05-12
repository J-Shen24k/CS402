.data 0x10010000
var1: .word	2 # initial value 2
.text
.globl main
main: addu $s0, $ra, $0# save $31 in $16
		lw $a0, var1
		add $a2, $a0, $0
		li $a1, 100
		move $t0, $a0
Loop:	ble $a1, $t0, Exit
		addi $a2, $a2, 1
		addi $t0, $t0, 1
		j Loop
Exit:
# restore now the return address in $ra and return from main
addu $ra, $0, $s0 # return address back in $31
jr $ra # return from main