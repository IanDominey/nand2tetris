// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

// Put your code here.
//Set memory location 2 to zero to initialise the calculation.
@R2
M=0

//Check to see if R0 is zero, if so, jump to end
@R0
D=M
@END
D;JLE

//Check to see if R1 is zero, if so, jump to end
@R1
D=M
@END
D;JLE

//Setup base number and multiplication number (base number should always be higher than multiplication number
//to reduce number of loops).
@R0
D=D-M
@INVERT_MULT_VARS
D;JGT

@R0
D=M
@base
M=D
@R1
D=M
@counter
M=D
@MULTIPLY
0;JMP

(INVERT_MULT_VARS)
@R0
D=M
@counter
M=D
@R1
D=M
@base
M=D

//Multiply a by b
(MULTIPLY)
@R2
D=M
@base
D=D+M
@R2
M=D
@counter
MD=M-1
@END
D;JLE
@MULTIPLY
0;JMP

(END)
@base
M=0
@counter
M=0
@END
0;JMP
