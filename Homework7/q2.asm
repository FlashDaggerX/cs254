## Question 2 on Homework 7
## Author: Kyle Guarco
##
## Compute the sum 1+4+7+...+148+151 using jumps and branches.
##
## Data section:
## c: The limit of the sum plus the incrementor (word @ 0x0($9))
## i: The incrememtor for the accumulator (word @ 0x4($9))
##
## Register usage:
## $9: Base Register (value 0x001000)
## $10: Accumulator (Answer)
## $11: Limit Constant
## $12: Incrementor Constant
## $13: Set Check (boolean)

	.data
c:	.word 152
i:	.word 3

	.text
	.globl main

main:

	# Load the constants into their registers
	lui $9, 0x001000
	lw $11, 0x0($9)
	sll $0, $0, 0
	lw $12, 0x4($9)
	sll $0, $0, 0
	sub $11, $11, $12
	ori $10, $0, 1
sumloop:
	slt $13, $10, $11
	beq $13, $0, end
	sll $0, $0, 0
	add $10, $10, $12
	j sumloop

end:

	ori $v0, $0, 10
	syscall

