## Question 3 on Homework 7
## Author: Kyle Guarco
##
## Compute the sum 5^2 + 6^2 + ... + 99^2 + 100^2 using jumps and branches.
##
## Register usage:
## $10: Accumulator (Answer)
## $11: Base Constant (plus one for proper SLT operation)
## $12: Current Base
## $13: Set Check (boolean)
## $14: Temporary Register

	.text
	.globl main

main:

	# Load 1 into the accumulator.
	ori $10, $0, 0
	# Set the current base (we start at 5)
	ori $12, $0, 5
	# And set the base constant.
	ori $11, $0, 101

sumloop:

	# Check if the current base is less than the base constant.
	slt $13, $12, $11
	beq $13, $0, end
	sll $0, $0, 0
	
	# Square the current base.
	mult $12, $12
	mflo $14
	add $10, $10, $14
	addi $12, $12, 1
	
	j sumloop
	sll $0, $0, 0

end:

	ori $v0, $0, 10
	syscall

