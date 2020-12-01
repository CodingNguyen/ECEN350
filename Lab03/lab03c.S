.globl lab03c

lab03c:
    ADD X9, XZR, XZR // make sure X9 = 0
    ADD X9, X9, 0xa // temporary register X9 = 0 + 10, to keep track of loop iterations
    
    ADRP X10, j
	ADD X10, X10, :lo12:j // temporary register to load address of j
    LDURSW X0, [X10, 0] // load value of j to X0

    ADRP X10, my_array
	ADD X10, X10, :lo12:my_array // temporary register to load address of my_array
loop:
    CBZ X9, finish // check if the loop has executed 10 times

    STUR W0, [X10] // store value j at my_array + word offset
    ADD X0, X0, 0x1 // add 1 to j

    ADD X10, X10, 0x4 // add 1 to address to move
    SUB X9, X9, 0x1 // subtract 1 from iterator
    B loop // goes to the beginning of the loop

finish:      
    BR X30 // exit

.section .data
    my_array: .space 40// allocate empty space
    j: .word 0x0008