.data 0x10010000
prompt1: .asciiz "Please enter value1: "
prompt2: .asciiz "Please enter value2: "
message1: .asciiz "Value1 is Larger. "
message2: .asciiz "Value2 is Larger. "
.text
.globl main
main:	
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

		move $s0, $ra
		jal Largest	# call ‘Largest’ 
		li $v0, 1
		add $a0,$a0,$0
		syscall
		nop	# execute this after ‘Largest’ returns 
		move $ra, $s0   # restore the return address in $ra 
		jr $ra	# return from main
Largest:ble $t0,$t1, Else
		li $v0, 4
		la $a0	, message1
		syscall
		add $a0, $0, $t0
		jr $ra	# return from this procedure

Else:	li $v0, 4
		la $a0	, message2
		syscall
		add $a0, $0, $t1
		jr $ra	# return from this procedure










