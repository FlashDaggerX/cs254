## Question 2 on Homework 6
## Author: Kyle Guarco
##
## Register usage:
## $1: Base Register (Holds 'x' at offset 0x0)
## $8: Accumulator
## $9: Temporary Register
## $10: Holds 'x'
	
	.data
x:		.word 1 # The variable for this polynomial
a:		.word -8
b:		.word 19
c:		.word -22
d:		.word 58
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

	# Compute ax
	lw $8, 0x04($1) # Load 'a' into $8
	sll $0, $0, 0
	mult $8, $10
	mflo $8

	# Compute (ax) - b
	lw $9, 0x08($1) # Load 'b' into the temp register
	sll $0, $0, 0
	add $8, $8, $9

	# Compute x(ax - b)
	mult $8, $10
	mflo $8

	# Compute (ax^2 - bx) - c
	lw $9, 0x0C($1) # Load 'c' into the temp register
	sll $0, $0, 0
	add $8, $8, $9

	# Compute x(ax^2 - bx - c)
	mult $8, $10
	mflo $8

	# Compute (ax^3 - bx^2 - cx) + d
	lw $9, 0x10($1) # Load 'd' into the temp register
	sll $0, $0, 0
	add $8, $8, $9

	# Store the result in $8 into memory (offset at 'poly')
	sw $8, 0x14($1)
	sll $0, $0, 0

end:

	ori $v0, $0, 10
	syscall

