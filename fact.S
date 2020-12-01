.section .text
.globl fact
fact: SUB SP,SP,0x10
      STUR LR,[SP,0x8]
      STUR X0,[SP,0x0]
      SUBS XZR,X0,0x1
      B.GE L1
      ADD X0,XZR,XZR
      ADD X0,X0,0x1
      ADD SP,SP,0x10
      BR LR
L1:   SUB X0,X0,0x1
      BL fact
bk_f: LDUR X1,[SP,0x0]
      LDUR LR,[SP,0x8]
      ADD SP,SP,0x10
      MUL X0,X0,X1
      BR LR