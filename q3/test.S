    .globl test
test:
    LDUR X10, [X0, #0] // X10 = x10
    LDUR X11, [X1, #0] // X11 = x11
    
    MOV X9, #1 // X9 = 1
    LSL X9, X9, #6 
    SUB X9, X9, #1 // ponho '111111'(bit) em X9
    LSL X9, X9, #11 // ponho '111111'(bit) a partir bit 11º
    
    AND X12, X10, X9 // consigo os bits da pos 11-16 de X10
    LSL X12, X12, #15 // ponho os bit na pos 26-31 em X12
    MOV X14, 0b1111111111111111111111111111111000000011111111111111111111111111
    AND X13, X11, X14 // pego as extremidades
    
    ORR X11, X12, X13 // Deixos bits de X12 na pos 26-31 e junto com as extremidades de x11 que guardei em X13
    
    
return: // apenas retorno (término)
    STUR X11, [X1, #0] // ponho na memória o valor novo de x11
    BR X30