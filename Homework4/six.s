## For Question 3 on Homework 4
## Author: Kyle Guarco

	.text
	.globl main
	
main:

## This program is literally the bit shifting one from question 2,
## except with different values in the initial registers.

	ori $5, $0, 0x666
	ori $6, $0, 0x666
	ori $7, $0, 0x66

	or $t1, $5, $5
	sll $t1, $t1, 12

	or $t2, $t1, $6
	sll $t2, $t2, 8
 
	or $8, $t2, $7

## This section is included to prevent the annoying "invalid instruction"
## error that pops up when you run the program (yes, I looked it up).	
end:

	ori $v0, $0, 10
	syscall

