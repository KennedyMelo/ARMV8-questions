    .globl test
test:
    LDUR X19, [X0, #0] // X10 = a
    LDUR X20, [X1, #0] // X11 = b
    LDUR X21, [X2, #0] // X12 = c
    LDUR X22, [X3, #0] // X13 = x
    
    ADD X22, XZR, XZR // X22 = 0 (x=0)
    CMP X19, #0  //(se a >= 0, continua)
    B.LT return //(se a<0 vai para return)
    
    CMP X20, #64 // se b<= 64, contunua
    B.GT return // caso não, vai para return
    
    CMP X21, #24 // se c > 24, continua
    B.LE return  // caso não, vai para return
    ADD X22, X22, #1 // x=1

return: // apenas retorno (término)
    STUR X22, [X3, #0] // ponho na memória o valor novo de x
    BR X30