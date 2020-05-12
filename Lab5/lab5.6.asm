.data 0x10010000
prompt1: .asciiz "Please enter an integer: "
user1: .word 0
		.text
		.globl main
main:	
		li $v0, 4
		la $a0, prompt1
		syscall

		li $v0, 5
		syscall
		move $t0, $v0
		sw $t0, user1
		la $t0, user1


Reverse_bytes:	
		lbu $t4, 0($t0)
		lbu $t5, 1($t0)
		lbu $t6, 2($t0)
		lbu $t7, 3($t0)
		sll $t4, $t4, 24
		sll $t5, $t5, 16
		sll $t6, $t6, 8
		or $t4, $t4, $t5
		or $t4, $t4, $t6
		or $t4, $t4, $t7
		li $v0, 1
		move $a0, $t4
		syscall
		nop	# this is the procedure named	‘test’
		jr $ra	# return from this procedure