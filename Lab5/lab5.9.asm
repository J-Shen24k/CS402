.data 0x10000000
.align 0
char1:	.byte 'a'
double1:	.double 1.1		
char2:	.byte 'b' 
half1:	.half 0x8001 
char3:	.byte 'c'
word1:	.word 0x56789abc 
char4:	.byte 'd'


.text
.globl main 
main:	
	la $s0, word1
	lwr $t0, 0($s0)
	lwl $t4, 3($s0)
	or $t1, $t0, $t4
	nop	# this is the procedure named	‘test’
	jr $ra	# return from this procedure