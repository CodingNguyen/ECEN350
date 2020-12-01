.section .text
.globl test2

test2:
SUB SP, SP, 0x20 // adjust stack for 2 items
STUR X30, [SP,0x0] // save the return address

SUB	X0, X1, X0 // X1 = e - d
STUR X0, [SP,0x10] // save the return value before print call

ADD X1, X0, 0x0 // copy value of return to X1 for printf
ADR X0, str // get address of str
BL printf // branch and link to printf

LDUR X0, [SP,0x10] // load return value
LDUR X30, [SP,0x0] // load return address
ADD SP, SP, 0x20 // restore stack
BR	X30 // return to caller

.section .data
str: .asciz "Result of test(3, 5) = %d\n"