    .globl test
test:
    LDUR X19, [X0, #0] // X10 = a
    LDUR X20, [X1, #0] // X11 = b
    LDUR X21, [X2, #0] // X12 = m
    ADD X21, X19, XZR // X21 = X19 (m=a)
    CMP X20, X21  //(se b!=m, continua)
    B.EQ L1 //(se b==m vai para L1)
    SUB X21, X19, X20 // m = a-b
    B return

L1: //(se b==m)
    SUB X21, X20, X19 // m = b-a

return: // apenas retorno (término)
    STUR X21, [X2, #0] // ponho na memória o valor novo de m
    BR X30