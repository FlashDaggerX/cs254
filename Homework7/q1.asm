## Question 1 on Homework 7
## Author: Kyle Guarco
##
## Use branch instructions to replace x.
##
## Test the following cases:
## x >= 0 -> 5x
## x < 0 -> -x^2
##
## Register usage:
## $8: Base register (value 0x001000)
## $9: 'x' register (word @ 0x0($8))
## $10: Temporary Register

	.data
x:	.word 3

	.text
	.globl main

main:

	lui $8, 0x001000
	lw $9, 0x0($8)
	sll $0, $0, 0

	bgez $9, greaterthan
	sll $0, $0, 0

lessthanzero:

	mult $9, $9
	mflo $9
	sub $9, $0, $9 
	j end
	sll $0, $0, 0

greaterthan:

	addi $10, $0, 5
	mult $9, $10
	mflo $9

end:

	ori $v0, $0, 10
	syscall

