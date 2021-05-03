## Question 3
##
## Compute the sum 5^2 + 6^2 + ... + (n-1)^2 + n^2
##
## Register usage:
## $10: Accumulator (Answer)
## $11: Current Base
## $12: Base Limit
## $13: Set Check
## $14: Temporary Register

	.text
	.globl main

main:

	ori $11, $0, 5
	ori $12, $0, 101

sumloop:

	mult $11, $11
	mflo $14

	add $10, $10, $14
	addi $11, $11, 1

	slt $13, $11, $12
	beq $13, $0, end
	sll $0, $0, 0

	j sumloop
	sll $0, $0, 0

end:

	ori $2, $0, 10
	syscall #exit syscall
