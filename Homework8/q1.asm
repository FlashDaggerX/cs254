## Question 1 on Homework 8
## Author: Kyle Guarco
##
## (Pseudo-enabled)
## Count the number of times the letter 'e' appears in string 'str'.
## Remember that the byte for the character 'e' is 0x65.
## Store the result at the memory location for 'num'
##
## Data usage:
## str: The string to scan
## chr: The byte of the character to scan for in 'str'
## num: The number of character 'chr' in 'str'
##
## Register usage:
## $1 (at): Implicit Base Register (value 0x10010000)
## $8 (t0): The current byte loaded from the string 'str'
## $9 (t1): Counter (Stored at symbolic address 'num' later)
## $11 (t3): Character Constant (value 'chr')
## $12 (t4): 'str' index
## $13 (t5): Stores the address of 'num' for the _end of the program

	.data
str: .asciiz "The itsy bitsy spider climbed up the waterspout"
chr: .word 0x65
num: .word 0

	.text
	.globl _main

_main:

	# Load the character constant into reg $t3
	lw $t3 chr
	nop

	# Prepare reg $t4 by loading the address of 'str' into it.
	la $t4, str

countloop:

	lb $t0, 0x0($t4)
	nop

	# Don't forget to increment the index!
	addi $t4, $t4, 1

	# Check if the string has reached its end
	beqz $t0, _end
	nop
	# Continue looping if this character isn't equal to 'chr'
	bne $t0, $t3, countloop
	nop

	addi $t1, $t1, 1

	j countloop
	nop

_end:

	# Save 'num' and end the program
	la $t5, num
	nop
	sw $t1, 0x0($t5)
	nop

	li $v0, 10
	syscall

