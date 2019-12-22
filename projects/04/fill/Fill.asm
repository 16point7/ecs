// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


(BEGIN_INFINITE_LOOP)
    
    // set color to white
    @color
    M=0

    // if keyboard wasn't pressed, skip over setting color to black
    @KBD
    D=M
    @FILL_SCREEN_LOGIC
    D;JEQ

        // set color to black
        @color
        M=-1

    (FILL_SCREEN_LOGIC)

    // initialize iterator
    @SCREEN
    D=A
    @i
    M=D

    // initialize terminal
    @8192
    D=D+A
    @end
    M=D

    (BEGIN_FILL_SCREEN_LOOP)
    // while screen is not completely filled
    @end
    D=M
    @i
    D=D-M
    @END_INFINITE_LOOP
    D;JLE

        // fill screen
        @color
        D=M
        @i
        A=M
        M=D

        // increment interator
        @i
        M=M+1

        // repeat fill-screen loop
        @BEGIN_FILL_SCREEN_LOOP
        0;JMP

    (END_INFINITE_LOOP)

    // repeat infinite loop
    @BEGIN_INFINITE_LOOP
    0;JMP