.data
	ask: .asciiz "Enter an integer \n"
	fact: .asciiz "Ackermann: "
	negative: .asciiz "Integer input is negative. Enter a positive integer"

.text
main: 
	#ask user to enter an integer
	li $v0, 4
	la $a0, ask
	syscall
	
	#read input and put in $v0
	li $v0, 5
	syscall
	
	#check if negative
	bge $v0, $zero, notNegative
	#tell user negative number and input another one
	li $v0, 4
	la $a0, negative
	syscall
	
	#read input and put in $v0
	li $v0, 5
	syscall
	
	notNegative:
	
	#move $v0 to $t0
	move $t0, $v0
	
	#ask user to enter an integer again
	li $v0, 4
	la $a0, ask
	syscall
	
	#read input and put in $v0
	li $v0, 5
	syscall
	
	#check if negative
	bge $v0, $zero, notNegative1
	#tell user negative number and input another one
	li $v0, 4
	la $a0, negative
	syscall
	
	#read input and put in $v0
	li $v0, 5
	syscall
	
	notNegative1:
	
	#move $v0 to $t0
	move $t1, $v0
	
	#t0 is x, t1 is y
	#Ackermann method
	jal Ackermann
	
	#move result to another variable
	
	#print "Ackermann: "
	li $v0, 4
	la $a0, fact
	syscall
	
	#print Ackerman value
	li $v0, 1
	move $a0, $t8
	syscall
	
	#terminate program
	li $v0, 10
	syscall
	
	Ackermann:
	#if t0 = 0 then t1 += 1
	#else if t1 = 0, Ackermann(t0 - 1, 1)
	#else Ackermann(t0 - 1, Ackermann(t0, t1 - 1))
	
	sub $sp,$sp,8
	sw $s0,4($sp)
	sw $ra,0($sp)
	
	bgtz $t0,notFirst # If x != 0
	#t0 = 0 then t1 += 1
	add $t8,$t1,1 # y+1
	j out
	
	notFirst:
	bgtz $t1,notSecond # if y != 0
	# x!=0 and t1 = 0 then Ackermann(t0 - 1, 1)
	sub $t0,$t0,1 # x -= 1
	li $t1,1 # y = 1
	jal Ackermann
	j out
	
	notSecond:
	#x!=0 and y!=0 then Ackermann(t0 - 1, Ackermann(t0, t1 - 1))
	#Ackermann(t0, t1 - 1)
	move $s0,$t0 # $s0 = x
	sub $t1,$t1,1 # y -= 1
	jal Ackermann
	#Ackermann(t0 - 1, Ackermann(t0, t1 - 1))
	move $t1,$t8 # y = Ackermann(x, y-1)
	sub $t0,$s0,1 # x -= 1
	jal Ackermann
	
	out:
	lw $s0,4($sp)
	lw $ra,0($sp)
	add $sp,$sp,8
	jr $ra
