    .globl test
test:
    LDUR X10, [X0, #0] // X10 = x10
    LDUR X11, [X1, #0] // X11 = x11
    
    MOV X9, 0xffffffffffffffff // X9 = todos os bits setados como 1
    EOR X10, X11, X9 // todos os bits 1 ->0, e todos 0 ->1
    
    
return: // apenas retorno (término)
    STUR X10, [X0, #0] // ponho na memória o valor novo de x11
    BR X30