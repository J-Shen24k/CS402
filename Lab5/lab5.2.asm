.data 0x10000000
double1:	.double 1.1
word1:	.word 0x56789abc 
char1:	.byte 'a'	
char2:	.byte 'b' 
char3:	.byte 'c'
char4:	.byte 'd'
half1:	.half 0x8001 
.text
.globl main 
main:	jr $ra