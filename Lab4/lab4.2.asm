		.text
		.globl main
main:	add $sp, $sp, -4	# first update the stack pointer 
		sw $ra, 4($sp)	# push $ra into the stack
		jal test	# call ‘test’ with no parameters
		nop	# execute this after ‘test’ returns 
		lw $ra, 4($sp)	# first recover the data from the stack 
		add $sp, $sp, 4	# shrink the stack by one word
		jr $ra	# return from main
test:	nop	# this is the procedure named	‘test’
		jr $ra	# return from this procedure