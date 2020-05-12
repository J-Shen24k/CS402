.data 0x10000000
 
char1:	.byte 'a'
double1:	.double 1.1		
char2:	.byte 'b' 
half1:	.half 0x8001 
char3:	.byte 'c'
word1:	.word 0x56789abc 
char4:	.byte 'd'


.text
.globl main 
main:	jr $ra