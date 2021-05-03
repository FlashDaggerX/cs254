## Question 2
##
## Compute the sum 1 + 4 + 7 + ... + (n - 3) + n
## 
## Register usage:
## $10: Accumulator (Answer)
## $11: Current Base
## $12: Base Limit
## $13: Set Check

	.text
	.globl main

main:

	ori $11, $0, 1
	ori $12, $0, 152

sumloop:

	add $10, $10, $11
	addi $11, $11, 3

	slt $13, $11, $12
	beq $13, $0, end
	sll $0, $0, 0

	j sumloop
	sll $0, $0, 0

end:

	ori $2, $0, 10
	syscall #exit syscall
