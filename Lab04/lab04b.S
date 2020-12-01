.globl factorial

factorial:
SUB SP, SP, 0x10 // adjust stack for 2 items
STUR LR, [SP,0x8] // save the return address
STUR X0, [SP,0x0] // save the argument n

CBNZ X0, else // if n != 0, jump to else
ORR X0, XZR, 0x1 // return 1
ADD SP, SP, 0x10 // pop 2 items from stack
BR X30 // return to caller

else:
SUB X0, X0, 0x1 // n = n - 1
BL factorial // call f(n-1,k+1)

LDUR X1, [SP, 0x0] // restore caller's n
BL my_mul // m = my_mul(m,n)
LDUR X30, [SP, 0x8] // restore return address
ADD SP, SP, 0x10 // adjust stack pointer to pop 2 items
BR X30