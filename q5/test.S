    .globl test
test:
    LDUR X19, [X0, #0] // X19 = x12
    LDUR X20, [X1, #0] // X20 = minimo
    
loop:
    CMP X19, X20 // se x12 > minimo, continuo no loop
    B.LE return // caso não, vou para return
    SUB X19, X19, #1 // x12 = x12-1
    B loop // volto ao loop
    
return: // apenas retorno (término)
    STUR X19, [X0, #0] // ponho na memória o valor novo de x19
    BR X30