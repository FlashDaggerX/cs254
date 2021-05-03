## For Question 1 on Homework 4
## Author: Kyle Guarco

	.text
	.globl main
	
main:
	
	ori $5, $0, 0x9 	#bit string A
	ori $6, $0, 0x5 	#bit string B
	ori $7, $0, 0x8 	#bit string C

	# Calculate `((not A) xor B) or (not (B and C))`
	# Put the final result in register $8

	nor $t1, $0, $5 	#not A
	xor $t1, $t1, $6 	#(not A) xor B
	
	and $t2, $6, $7 	#B and C
	nor $t2, $0, $t2 	#not (B and C)

	# Putting it all together
	or $8, $t1, $t2

## This section is included to prevent the annoying "invalid instruction"
## error that pops up when you run the program (yes, I looked it up).	
end:

	ori $v0, $0, 10
	syscall

