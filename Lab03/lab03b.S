.globl lab03b

lab03b:     
    ADD X9, XZR, XZR // make sure X9 = 0
    ADD X9, X9, 0xa // temporary register X9 = 0 + 10, to keep track of loop iterations
    ADRP X10, UIN
	ADD X10, X10, :lo12:UIN // temporary register to load address of UIN
    LDURSW X0, [X10, 0] // load value of UIN to X0

loop:     
    CBZ X9, finish // check if the loop has executed 10 times
    SUB X0, X0, 0x1 // subtract 1 from X0
    STUR X0, [X10, 0] // store value of X0 in UIN
    SUB X9, X9, 0x1 // subtract 1 from iterator
    B loop // goes to the beginning of the loop

finish:      
    BR X30 // exit

.section .data
UIN:
    .word 0x00000027 // Decimal 39, the sum of my UIN digits