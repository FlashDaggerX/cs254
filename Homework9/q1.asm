## Question 1 on Homework 9
## Author: Kyle Guarco
##
## (Pseudo-enabled)
## Write a program that gets two user inputs (ints).
## Compute the sum of those numbers and print it out.
##
## Data usage:
## msg: The result string to print
## 
## Register usage:
## $1 (at): Implied Base Register (value 0x10010000)
## $2 (v0): The System Call Register (stores return values)
## $8 (t0): 'x' Register
## $9 (t1): 'y' Register
## $10 (t2): 'x + y' (Result)

	.data
msg:	.asciiz "\nx + y = "
xm:		.asciiz "\nx = "
ym:		.asciiz "\ny = "

	.text
	.globl main

main:

	# Query for 'x'
	li $v0, 4
	la $a0, xm
	syscall
	li $v0, 5
	syscall

	move $t0, $v0

	# Query for 'y'
	li $v0, 4
	la $a0, ym
	syscall
	li $v0, 5
	syscall

	move $t1, $v0

	# Perform 'x + y'
	add $t2, $t0, $t1

	# Print out the result and exit
	li $v0, 4
	la $a0, msg
	syscall
	li $v0, 1
	or $a0, $zero, $t2
	syscall

end:

	li $v0, 10
	syscall

