## Question 2 on Homework 9
## Author: Kyle Guarco
##
## (Pseudo-enabled)
## Write a program that queries a number from the user.
## Using that number, calculate the sum '1^3 + 2^3 + ... k^3'
##
## Data usage:
## msg: The query message for the sum limit
## errmsg: The message displayed if the sum limit is less than zero
## resmsg: The message displayed when the sum is calculated
##
## Register usage:
## $1 (at): Implied base register (value 0x10010000) (reserved)
## $8 (t0): The sum limit (The number the user entered)
## $9 (t1): Temporary register
## $10 (t2): The accumulator

	.data
msg:	.asciiz "Please enter a positive integer: "
errmsg:	.asciiz "The number you entered is not positive.\n"
resmsg:	.asciiz "The sum of the integers cubed between 1 and that number is "

	.text
	.globl main

main:

	# Query the user for a positive number 
	li $v0, 4
	la $a0, msg
	syscall

	li $v0, 5
	syscall

	move $t0, $v0

	bltz $t0, err
	nop

sumloop:

	# Cube the current number
	mult $t0, $t0
	mflo $t1
	mult $t0, $t1
	mflo $t1

	# Add it to the accumulator
	add $t2, $t2, $t1

	# Decrement the sum limit
	addi $t0, $t0, -1
	beq $t0, $zero, success
	nop

	j sumloop
	nop

success:

	# Print 'resmsg'
	li $v0, 4
	la $a0, resmsg
	syscall

	# Print the value in the accumulator and exit
	li $v0, 1
	or $a0, $zero, $t2
	syscall

	j end
	nop

err:

	li $v0, 4
	la $a0, errmsg
	syscall

	j main
	nop

end:

	li $v0, 10
	syscall

