.data 0x10010000
prompt: .asciiz "Please enter an integer: "
.text
.globl main
main:	

Loop:
	move $s0, $ra
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	bgez $t0 Exit
	j Loop

Exit:
	add $a0, $0, $t0
	jal Factorial
	nop	# execute this after ‘test’ returns 
	add $t2,$0,$v0
	li $v0, 1
	add $a0, $t2,$0
	syscall
	nop	# execute this after ‘Largest’ returns 
	move $ra, $s0   # restore the return address in $ra 
	jr $ra	# return from main

.globl Factorial
Factorial:
	subu $sp, $sp, 4
	sw $ra, 4($sp)	# save the return address on stack
 		
	beqz $a0, terminate # test for termination 
	subu $sp, $sp, 4     	 # do not terminate yet 
	sw $a0, 4($sp) # save the parameter
	sub $a0, $a0, 1      # will call with a smaller argument 
	jal Factorial
	# after the termination condition is reached these lines 
	# will be executed
	lw $t0, 4($sp)	# the argument I have saved on stack 
	mul $v0, $v0, $t0	# do the multiplication
	lw $ra, 8($sp)	# prepare to return
	addu $sp, $sp, 8	# I’ve popped 2 words (an address and 
	jr $ra	# .. an argument)

terminate:
	li $v0, 1	# 0! = 1 is the return value
	lw $ra, 4($sp)	# get the return address 
	addu $sp, $sp, 4	# adjust the stack pointer 
	jr $ra	# return













