		.text
		.globl main
main:	move $s0, $ra
		jal test	# call ‘test’ with no parameters
		nop	# execute this after ‘test’ returns 
		move $ra, $s0   # restore the return address in $ra 
		jr $ra	# return from main
test:	nop	# this is the procedure named	‘test’
		jr $ra	# return from this procedure	

