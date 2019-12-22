// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// clear r2
@R2
M=0

(BEGIN_LOOP)

// while multiplication isn't complete
@R0
D=M
@END_LOOP
D;JLE

    // write r1 to r2
    @R1
    D=M
    @R2
    M=D+M

    // decrement r0
    @R0
    M=M-1

    // repeat loop
    @BEGIN_LOOP
    0;JMP

(END_LOOP)

// NOP sled guard
@END_LOOP
0;JMP