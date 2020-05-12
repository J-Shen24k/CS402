.data 0x10010000
prompt1: .asciiz "Please enter value1: "
prompt2: .asciiz "Please enter value2: "
message1: .asciiz "Value1 is Larger. "
message2: .asciiz "Value2 is Larger. "
.text
.globl main
main:	
		li $v0, 4
		la $a0, prompt1
		syscall

		li $v0, 5
		syscall
		move $t0, $v0

		li $v0, 4
		la $a0, prompt2
		syscall

		li $v0, 5
		syscall
		move $t1, $v0

		add $sp, $sp, -8	# first update the stack pointer 
		sw $t0, 8($sp)	# push into the stack
		sw $t1, 4($sp)	# push into the stack
		sw $ra, 0($sp)
		jal Largest	# call ‘Largest’ 
		lw $a0, 4($sp)	# first recover the data from the stack 
		add $sp, $sp, 4	# shrink the stack by one word
		li $v0, 1
		add $a0,$a0,$0
		syscall
		nop	# execute this after ‘Largest’ returns 
		jr $ra	# return from main
Largest:
		lw $ra, 0($sp)
		lw $t1, 4($sp)	# first recover the data from the stack 
		lw $t0, 8($sp)	# first recover the data from the stack 
		add $sp, $sp, 8	# shrink the stack by one word

		ble $t0,$t1, Else
		li $v0, 4
		la $a0	, message1
		syscall
		jr $ra	# return from this procedure

Else:	li $v0, 4
		la $a0	, message2
		syscall	
		jr $ra	# return from this procedure










