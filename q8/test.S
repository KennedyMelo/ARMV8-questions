    .globl test

test:
    MOV X21, X0 // X21 = X0 (pego o endereço da string e coloco em X21)

loop:
    LDUR X22, [X21, #0] 
    SUB X22, [X22, #0]
    LDUR X19, [X11, #0] // X19 = n
    MOV X10, X30 // salvo o endereço de retorno
    Bl fact
    
    MOV X30, X10 // recupero o endereço de retorno
    B return
    
fact:
    SUB SP, SP, #16 //ponho na pilha o endereço de retorno e o n
    STUR LR, [SP, #8]
    STUR X19, [SP, #0]
    CMP X19, #0 //se n <= 0, continuo (assumo sempre que 'n' não pode ser negativo)
    B.GT L1 //se n > 0, vou para L1
    
    MOV X20, #1 // X20 = 1(case base)
    ADD SP, SP, #16 // desaloco o que aloquei na pilha, pois não tem nada para fazer
    BR LR
L1:  
    SUB X19, X19, #1 // n-=1
    BL fact // chamo fact(n-1)
    LDUR X19, [SP, #0]  // recupero os valores que antes aloquei
    LDUR LR, [SP, #8]
    ADD SP, SP, #16 // desaloco
    MUL X20, X20, X19 // fact(n) = n*fact(n-1)
    BR LR 

return: // apenas retorno (término)
    MOV X0, X20 // o que irei retornar
    BR X30
