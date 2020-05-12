.data 0x10000000
.align 0
char1:	.byte 'a' 
word1:	.word 0x89abcdef 	
char2:	.byte 'b' 
word2:  .word 0


.text
.globl main 
main:		
	lui $1, 4096     
	ori $8, $1, 1    
	lbu $12, 0($8)           
	lbu $13, 1($8)           	
	lbu $14, 2($8)           
	lbu $15, 3($8)           
	lui $1, 4096      
	ori $10, $1, 6  
	sb $12, 0($10)  
	sb $13, 1($10)           
	sb $14, 2($10)           
	sb $15, 3($10)  
	jr $31