	@ Factorial
	@ Put the required header information here

	.extern printf
	.extern scanf
	.global main
	.func main
main:	PUSH	{LR}
	LDR	R0, =prompt	@ Get address of prompt
	BL	printf		@ Print prompt to screen
	LDR	R0, =in		@ Get addr of input format string
	LDR	R1, =n		@ Get addr of n
	BL	scanf		@ Put value in n using scanf
	LDR	R0, =n		@ Addr of n into R0
	LDR	R0, [R0]	@ n is now in R0
	@-------------
	@ Your code goes here.  Put n! in R2
	@-------------
	MOV R2, #1	@Initialze R2 as 1
_loop:
	MUL R2,R2,R0	@Multiply R2 by R0(n)
	SUB R0,R0,#1	@Subtract 1 from n store in R0(n-1)
	CMP R0,#1	@Check if R0 is 1
	BGT _loop	@Branch to _loop if R0 if greater than 1



	@-------------
	@ Do NOT alter code past this line.
	@-------------
	MOV	R1, R2
	LDR	R0, =out
	BL 	printf
	POP	{PC}
	
.data
n:	.word 0
prompt:	.asciz "Enter n: "
in:	.asciz "%d"
out:	.asciz "factorial is: %d\n"

