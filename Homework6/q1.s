## Question 1 on Homework 6
## Author: Kyle Guarco
##
## Compute the polynomial '38x^3 -25x^2 -18x +46' using
## Horner's method (Keeping the result in one register
## as the problem is solved sequentially).
## Store the answer in the address of 'poly'
##
## Register usage:
## $1: Base Register (Holds 'x' at offset 0x0)
## $8: Accumulator
## $9: Temporary Register
## $10: Holds 'x'
	
	.data
x:		.word 1 # The variable for this polynomial
a:		.word 38
b:		.word -25
c:		.word -18
d:		.word 46
poly:	.word 0 # 0x14($1)

	.text
	.globl main

main:

	# This is the base register. From here, the values above 
	# can be loaded using an offset w/ a 4-address-wide gap.
	lui $1, 0x001000
	sll $0, $0, 0

	lw $10, 0x00($1) # Load 'x' (remains constant)
	sll $0, $0, 0

	# Compute 38x
	lw $8, 0x04($1) # Load 'a' into $8
	sll $0, $0, 0
	mult $8, $10
	mflo $8

	# Compute (38x) - 25
	lw $9, 0x08($1) # Load 'b' into the temp register
	sll $0, $0, 0
	add $8, $8, $9

	# Compute x(38x - 25)
	mult $8, $10
	mflo $8

	# Compute (38x^2 - 25x) - 18
	lw $9, 0x0C($1) # Load 'c' into the temp register
	sll $0, $0, 0
	add $8, $8, $9

	# Compute x(38x^2 - 25x - 18)
	mult $8, $10
	mflo $8

	# Compute (38x^3 - 25x^2 - 18x) + 46
	lw $9, 0x10($1) # Load 'd' into the temp register
	sll $0, $0, 0
	add $8, $8, $9

	# Store the result in $8 into memory (offset at 'poly')
	sw $8, 0x14($1)
	sll $0, $0, 0

end:

	ori $v0, $0, 10
	syscall

