## Question 2 on Homework 10
## Author: Kyle Guarco
##
## (Pseudo-enabled)
## Write a program with a subroutine that takes in three
## numerical arguments X, Y, Z. Compute (u^2)*v + u*(v*2).
##
## Data usage:
## promptU: The prompt for entering 'u'
## promptV: The prompt for entering 'v'
## resmsg: The message displayed when computing the result.
##
## Subroutines:
## compute(x,y,z): Calculate 'x*y*z'
#### arg 'x' (reg $a0)
#### arg 'y' (reg $a1)
#### arg 'z' (reg $a2)
#### answer (reg $v0): Stores 'x*y*z'
##
## Register usage:
## $2 (v0): Opcode register, also stores function return values
## $3 (a0): Function argument register
## $4 (a1): Function argument register
## $5 (a2): Function argument register
## $9 (t1): 'u' register
## $10 (t2): 'v' register
## $11 (t3): The result from 'compute(u,u,v) + compute(u,v,v)'
## $31 (ra): Stores the value in the PC when using 'jal'

	.data
promptU:	.asciiz "\nPlease enter u: "
promptV:	.asciiz "Please enter v: "
resmsg:		.asciiz "The value of the expression is: "

	.text
	.globl main

compute:

	mult $a0, $a1
	mflo $v0
	mult $v0, $a2
	mflo $v0

	j $ra
	nop

main:

	# Prompt for 'u'
	li $v0, 4
	la $a0, promptU
	syscall
	li $v0, 5
	syscall
	move $t1, $v0

	# Prompt for 'v'
	li $v0, 4
	la $a0, promptV
	syscall
	li $v0, 5
	syscall
	move $t2, $v0

	# Compute '(u^2)*v'
	or $a0, $zero, $t1
	or $a1, $zero, $t1
	or $a2, $zero, $t2
	jal compute
	nop

	# Add '(u^2)*v' to the result register
	add $t3, $t3, $v0

	# Compute 'u*(v^2)'
	or $a0, $zero, $t1
	or $a1, $zero, $t2
	or $a2, $zero, $t2
	jal compute
	nop

	# Add 'u*(v^2)' to the result register
	add $t3, $t3, $v0

	# Print the result and end the program
	li $v0, 4
	la $a0, resmsg
	syscall
	li $v0, 1
	or $a0, $zero, $t3
	syscall

end:

	li $v0, 10
	syscall

