.data 0x10010000
user1: .word 0x89abcdef
		.text
		.globl main
main:	
	la $s0, user1
	lwl $t0, 0($s0)
	lwl $t1, 1($s0)
	lwl $t2, 2($s0)
	lwl $t3, 3($s0)
	nop	# this is the procedure named	‘test’
	jr $ra	# return from this procedure