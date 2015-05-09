// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

(START)
	// Check if a key has been pressed
	@KBD
	D=M
	@KEY_PRESSED
	D;JGT
	@NO_KEY_PRESSED
	D;JMP

(KEY_PRESSED)
	@0
	D=!A
	@filler
	M=D
	
@SCREEN
D=A
@R0
M=D

@0
D=!A
@R1
M=D

(FILL_PIXEL)
//Jump to end if screen is filled
@R0
D=M
@24565
D=D-A
@END
D;JGT

//Write to screen
@R1
D=M
@R0
A=M
M=D

//Increment currently written screen location by 1
@R0
M=M+1

//Fill next pixel
@FILL_PIXEL
0;JMP

(END)
@END
0;JMP
