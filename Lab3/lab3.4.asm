.data 0x10010000
my_array:  .space 40
I: .word 0
J: .word 1
.text
.globl main
main: addu $s0, $ra, $0# save $31 in $16
		lw $t0, I
		lw $t1, J
		li $t3, 10
		la $t5, my_array
Loop:	ble $t3, $t0, Exit
		sw $t1, 0($t5)
		addi $t0, $t0, 1
		addi $t1, $t1, 1
		addi $t5, $t5, 4
		j Loop
Exit:
# restore now the return address in $ra and return from main
addu $ra, $0, $s0 # return address back in $31
jr $ra # return from main