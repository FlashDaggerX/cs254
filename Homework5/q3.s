## Question 3 on Homework 5
## Author: Kyle Guarco

	.text
	.globl main

## Write a program to calculate '(4x-7xy)/(xy-10y)'.
## Use reg $7 and $8 to contain x and y, respectively.
## Assume that x and y are small enough to fit in the LO reg.
## Leave the quotient in reg $9 and the remainder in reg $10

main:

	ori $7, $0, 7 #x
	ori $8, $0, 4 #y
	
	# $11: 4x-7xy
	ori $11, $0, 4
	ori $12, $0, 7

	mult $7, $11
	mflo $11

	mult $7, $12
	mflo $12
	mult $8, $12
	mflo $12

	sub $11, $11, $12

	# $13: xy-10y
	mult $7, $8
	mflo $13

	ori $14, $0, 10
	mult $8, $14
	mflo $14

	sub $13, $13, $14

	# (4x-7xy)/(xy-10y)
	div $11, $13
	mflo $9
	mfhi $10

end:

	ori $v0, $0, 10
	syscall

