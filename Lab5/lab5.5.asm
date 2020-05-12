.data 0x10000000
 
char1:	.byte 'a'
double1:	.double 1.1		
char2:	.byte 'b' 
half1:	.half 0x8001 
char3:	.byte 'c'
word1:	.word 0x56789abc 
char4:	.byte 'd'
word2:	.word 0

.text
.globl main 
main:
	la $s0, word1
	lb $t0, 0($s0)	
	lb $t1, 1($s0)
	lb $t2, 2($s0)
	lb $t3, 3($s0)
	lbu $t4, 0($s0)
	lbu $t5, 1($s0)
	lbu $t6, 2($s0)
	lbu $t7, 3($s0)
	lh $t8, half1
	lhu $t9, half1
	sll $t4, $t4, 24
	sll $t5, $t5, 16
	sll $t6, $t6, 8
	or $t4, $t4, $t5
	or $t4, $t4, $t6
	or $t4, $t4, $t7
	jr $ra # return from main