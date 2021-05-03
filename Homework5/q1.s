## Question 1 on Homework 5
## Author: Kyle Guarco

	.text
	.globl main

## Write a program that calculates '26x - 12' using ONLY
## addition and shift instructions. Put the result in reg $9.
## 'x' is a value stored in reg $8.

main:

	# This is what the instructions look like in python:
	# >>> x = 42
	# >>> x + (x<<4) + (x<<3) + (x>>1) + (x>>3) + (x>>4) + (x>>4)
	# 1080
	# >>> 26*42 - 12
	# 1080

	ori $8, $0, 42 #x

	sll $10, $8, 4 #x<<4
	sll $11, $8, 3 #x<<3
	srl $12, $8, 1 #x>>1
	srl $13, $8, 3 #x>>3
	srl $14, $8, 4 #x>>4
	
	add $9, $8, $10
	add $9, $9, $11
	add $9, $9, $12
	add $9, $9, $13
	add $9, $9, $14
	add $9, $9, $14

end:

	ori $v0, $0, 10
	syscall

