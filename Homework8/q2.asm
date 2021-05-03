## Question 2 on Homework 8
## Author: Kyle Guarco
##
## (Pseudo-enabled)
## Find the largest number in 'array'. Leave the result in $s0.
##
## Data usage:
## array: The array of integers to scan
## size: The real size of 'array'
##
## Register usage:
## $1 (at): Implicit Base Register (value 0x10010000) (reserved)
## $8 (t0): Set Check (reserved)
## $9 (t1): Set Check (reserved)
## $10 (t2): 'array' Index (step +0x4)
## $11 (t3): 'array' Limit (address 'array' + ('size'*4))
## $12 (t4): Temporary Register
## $13 (t5): The Comparator (current number pointed by $10)
## $16 (s0): The Result (highest number in 'array')

	.data
array:	.word 23, -12, 45, -32, 52, -72, 8, 13
size:	.word 8

	.text
	.globl _main

_main:

	# Load the address of 'array' for an index
	la $t2, array

	# Prepare the 'array' limit
	lw $t3, size
	nop
	li $t4, 4
	# Multiply 'size' by 4 and add it to the limit address
	mult $t3, $t4
	mflo $t3
	add $t3, $t2, $t3

	# Subtract 4 from the limit, otherwise the loop will also check 'size'
	sub $t3, $t3, $t4

setmax:

	or $s0, $zero, $t5

maxloop:

	# Load the number at the current array index
	lw $t5, 0x0($t2)
	nop

	# Increment the array index for the next loop
	addi $t2, $t2, 4

	# If the current number is less than the comparator, jump to
	# setmax and enter the loop again.
	bgt $t5, $s0, setmax

	# If the current array index is at the limit, end the program.
	bgt $t2, $t3, _end
	nop

	j maxloop
	nop

_end:

	li $v0, 10
	syscall

