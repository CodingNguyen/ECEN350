.section .text
.globl lab02d 

lab02d:
    ADD X9, X0, 0x3E8 // X9 = X0 + 1000
    ADRP X10, myvalue
	ADD X10, X10, :lo12:myvalue // load myvalue address into X10
    STUR X9, [X10, 0] // Store X9 at the memory location of myvalue
    ADD X0, X10, XZR // Store address of myvalue in X30 to return it to main
    BR X30
.section .data

myvalue:
    .dword 0x0000000000000000