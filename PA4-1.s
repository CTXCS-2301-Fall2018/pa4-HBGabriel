
	@Author: Gabriel Hernandez
	@Assignment: PA4-1.s (Summation)
	@Date Completed: Oct.19.18
	@ This program writes a summation between to values the user enters
	@ R1 operates as the summation
	@ R2 operates as the starting value
	@ R3 operates as the ending value

	.extern printf
	.extern scanf
	.global main
	.func main
main:
	PUSH	{LR}
	LDR	R2, =startval 	@ get addr of startval
	LDR	R2, [R2]	@ Load startval -> R2
	LDR	R3, =endval	@ get addr of endval
	LDR	R3, [R3]	@ Load endval -> R3
	@-------------
	@ Your code begins here
	@ Your code must put the final answer
	@ in R1.
	@-------------
	MOV R1, R2	@set R1 equal to R2
_loop:	
	CMP R2,R3	@compare R2 to R3
	
	ADDLT R2,R2,#1	@Add 1 to R2 if R2 is less than R3
	ADDLT R1, R1,R2	@Add R1 and R2 then store into R1 if R2 is less than R3
	BLT _loop 	@Branch to _loop if R2 is less than R3
	
	
	@-------------
	@ Do NOT alter code past this line.
	@-------------
	LDR	R0, =out
	BL	printf
	POP	{PC}
	
.data
startval:	.word 1
endval:		.word 5
out:		.asciz "%d\n"
