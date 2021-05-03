## For Question 2 on Homework 4
## Author: Kyle Guarco

	.text
	.globl main
	
main:

	ori $5, $0, 0xbcd
	ori $6, $0, 0xfff
	ori $7, $0, 0xde
	
	# Using only shift and reg-to-reg OR, put the pattern
	# 0xbcdfffde into reg $8

	# Start by copying reg $5 into reg $t1 (9) and shifting it
	# by 12 bits, allowing 0xfff to fit next to 0xbcd without holes.
	or $t1, $5, $5
	sll $t1, $t1, 12

	# Next, use OR to "append" the two bit strings together and shift it
	# to the left by 8 bits, so 0xde can fit in without holes.
	or $t2, $t1, $6
	sll $t2, $t2, 8

	# Finally, append the result and put it into reg $8
	or $8, $t2, $7

## This section is included to prevent the annoying "invalid instruction"
## error that pops up when you run the program (yes, I looked it up).	
end:

	ori $v0, $0, 10
	syscall

