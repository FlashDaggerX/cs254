## Question 1 on Homework 10
## Author: Kyle Guarco
##
## The following sites were referenced while writing the program:
## https://chortle.ccsu.edu/AssemblyTutorial/Chapter-32/ass32_3.html
## https://chortle.ccsu.edu/AssemblyTutorial/Chapter-32/ass32_4.html
##
## (Pseudo-Enabled)
## Write a subroutine that calculates celsius-to-fahrenheit.
## Prompt the user for a number (the celcius value) in a loop, and
## end the loop when the number entered is out of range [-50, 50].
##
## Data usage:
## prompt: The message displayed when querying a celsius value
## resmsg: The message displayed when displaying the result.
## gbmsg: The message displayed when the value entered is out of range.
##
## Subroutines:
## convtemp(c): Converts a celsius value to fahrenheit
#### arg 'c' (reg $f0): The celsius value
#### answer (reg $f12): The fahrenheit value
##
## Register usage:
## $f0: The celsius value
## $f2: The UPPER value of the range (constant)
## $f3: The LOWER value of the range (constant)
## $f12: The resulting fahrenheit value
## $2 (v0): Opcode register, also stores function return values
## $4 (a0): Function argument register

	.data
prompt:	.asciiz "\nPlease enter a celsius value between -50 and 50: "
resmsg:	.asciiz "The fahrenheit value is "
gbmsg:	.asciiz "Goodbye."

	.text
	.globl main

convtemp:

	li.s $f12, 1.8 # 9/5
	mul.s $f0, $f0, $f12
	li.s $f12, 32.0
	add.s $f12, $f0, $f12

	j $ra
	nop

main:

	# Load the temperature range constants
	li.s $f2, 50.0
	li.s $f3, -50.0

loop:

	# Query for the celsius value (float)
	li $v0, 4
	la $a0, prompt
	syscall
	li $v0, 6
	syscall

	# Check to see if the celsius is within range [-50, 50]
	c.lt.s $f2, $f0
	bc1t end
	c.lt.s $f0, $f3
	bc1t end
	nop

	# Call the 'convtemp(c)' subroutine
	jal convtemp
	nop

	# This syscall prints the result of 'convtemp($f0)'
	li $v0, 4
	la $a0, resmsg
	syscall
	li $v0, 2
	syscall

	j loop
	nop

end:

	li $v0, 4
	la $a0, gbmsg
	syscall

	li $v0, 10
	syscall
