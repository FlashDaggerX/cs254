## Branch Example
## Author: Kyle Guarco

	.text
	.globl main

main:

	ori $5, $0, 1
	ori $6, $0, 1

	beq $5, $6, label
	sll $0, $0, 0

	j	end
	sll $0, $0, 0

label:
	ori $10, $0, 0x1

end:

	ori $v0, $0, 10
	syscall

# This program should store hex 1 in reg $10, 
# because $5 and $6 are equal.

