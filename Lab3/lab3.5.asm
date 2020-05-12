.data 0x10010000
prompt1: .asciiz "Please enter value1: "
prompt2: .asciiz "Please enter value2: "
message1: .asciiz "I am far away"
message2: .asciiz "I am nearby"
.text
.globl main
main: addu $s0, $ra, $0# save $31 in $16
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

bne $t0, $t1, Else
	li $v0, 4
	la $a0	, message1	
	syscall
	beq $0, $0, Exit	
Else: 
	li $v0, 4
	la $a0 , message2
	syscall

Exit:

# restore now the return address in $ra and return from main
addu $ra, $0, $s0 # return address back in $31
jr $ra # return from main