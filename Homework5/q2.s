## Question 2 on Homework 5
## Author: Kyle Guarco

	.text
	.globl main

## Evaluate the polynomial '-4(x^2) + 20x - 18'
## Use reg $8 to contain any value of x. Assume x is 
## small enough to fit the products in the lo reg. 
## Put the result in reg $9.

main:

	ori $8, $0, 2 #x

	# I'm gonna use a few registers to hold the values
	# of a, b and c in this quadratic equation.
	addi $10, $0, -4 #a
	ori $11, $0, 20 #b
	ori $12, $0, 18 #c

	mult $8, $8 #x^2
	mflo $9

	# -4(x^2)
	mult $9, $10
	mflo $9

	# -4(x^2) + 20x
	mult $11, $8
	mflo $11
	add $9, $9, $11

	# (-4(x^2) + 20x) - 18
	sub $9, $9, $12

end:
	ori $v0, $0, 10
	syscall

