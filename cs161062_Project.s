.data

Description:	.asciiz"\t\t\t\tFiboPalindrome\n\nThis Program will Find Numbers Which are Part of Fibonacci Series and are also Palindrome.\n\nFibonacci Series:\n\nIt is a series of numbers in which each number is the sum of the two preceding numbers.\nThe Simplest is the Series 1,1,2,3,5,8...etc\n\nPalindromic Number:\n\nA Number that is Same written Forwards or Backwards.\ne.g 0,1,2,3,4,5,6,7,8,9,11,22,33,44...etc\n\n\n"
Prompt:			.asciiz"Enter a Positive Integer : "
invalid:		.asciiz"Invalid Number!"
Table:			.asciiz"sNo\tFibonacci\t\tPalindrome\n"
tab:			.asciiz"\t"
newLine:		.asciiz"\n"
result:			.asciiz"\n\nResult:\n\nThere are "
fiboPalindrome:	.asciiz" FiboPalindrome Numbers."

.text
.globl main
main:

#Declaring and Initializing Registers
li $t1, 1 # Previous->	  $t1
li $t2, 0 # nextTerm->	  $t2
li $t5, 0 # fibo->		  $t5
li $t3, 1 # sNo->		  $t3
li $t4, 1 # binary->	  $t4
li $t6, 1 # result->	  $t6
li $t7, 1 # loopCounter-> $t7

#Printing Description of Project FiboPalindrome
li $v0, 4
la $a0, Description
syscall

#Prompt for taking Input
li $v0, 4
la $a0, Prompt
syscall

#User's Value is Stored in $t0->num
li $v0, 5
syscall
move $t0, $v0 


#Processing Starts 
bge $t0, 1, Process

#Printing Invalid
li $v0, 4
la $a0, invalid
syscall

#Exit
li $v0, 10
syscall

Process:

#Printing Table headers
li $v0, 4
la $a0, Table
syscall

#Value of sNo
li $v0, 1
move $a0, $t3
syscall

#tab  \t
li $v0, 4
la $a0, tab
syscall

#Value of previous
li $v0, 1
move $a0, $t1
syscall

#tab  \t
li $v0, 4
la $a0, tab
syscall

#tab  \t
li $v0, 4
la $a0, tab
syscall

#Value of binary
li $v0, 1
move $a0, $t4
syscall

#newLine
li $v0, 4
la $a0, newLine
syscall


Loop:

blt $t7, $t0, goInsideLoop # counter<num

b showResults

goInsideLoop:

add $t3, $t3, 1 	# sNo++

add $t5, $t1, $t2 	# fibo=previous+nextTerm

move $a3, $t5 # Using $a3 to manage fibo value after function call

#isPalindrome Function called 
jal isPalindrome   

#isPalindrome(fibo)== 1

beq $s6, 1, PrintValues

#Value of sNo
li $v0, 1
move $a0, $t3
syscall

#tab  \t
li $v0, 4
la $a0, tab
syscall

#Value of fibo
li $v0, 1
move $a0, $t5
syscall

#tab  \t
li $v0, 4
la $a0, tab
syscall

#tab  \t
li $v0, 4
la $a0, tab
syscall

#Value of binary
li $v0, 1

sub $t8, $t4, 1

move $a0, $t8
syscall

#newLine
li $v0, 4
la $a0, newLine
syscall

move $t2, $t1 #nextTerm=previous
move $t1, $t5 #previous=fibo

#Incrementing Counter
add $t7, $t7, 1

b Loop


PrintValues:

add $t6, $t6, 1 #result++


#Value of sNo
li $v0, 1
move $a0, $t3
syscall

#tab  \t
li $v0, 4
la $a0, tab
syscall

#Value of fibo
li $v0, 1
move $a0, $t5
syscall

#tab  \t
li $v0, 4
la $a0, tab
syscall

#tab  \t
li $v0, 4
la $a0, tab
syscall

#Value of binary
li $v0, 1
move $a0, $t4
syscall

#newLine
li $v0, 4
la $a0, newLine
syscall

move $t2, $t1 #nextTerm=previous
move $t1, $t5 #previous=fibo

#Incrementing Counter
add $t7, $t7, 1

b Loop


isPalindrome:

#Declaring Registers
li $s0, 0	# remainder->	$s0
li $s1, 0 	# reverse->		$s1
li $s3, 0   # temp->		$s3
li $s4, 10   

move $s3, $a3 	#temp=fibo

While:

bne $a3, 0, goInsideWhile

beq $s3, $s1, Return 

li $s6, 0 #return 0

jr $ra

Return:

li $s6, 1 #return 1

jr $ra

goInsideWhile:

div $a3, $s4 #fibo%10

mfhi $s0	#remainder=fibo%10
mflo $a3	#fibo=fibo/10

mul $t9, $s1, 10
add $s1, $t9, $s0 #  reverse=(reverse*10)+remainder


b While

showResults:


#Printing Results
li $v0, 4
la $a0, result
syscall

#Printing Value
li $v0, 1
move $a0, $t6
syscall

li $v0, 4
la $a0, fiboPalindrome
syscall

#Exit
li $v0, 10
syscall 