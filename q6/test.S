    .globl test
test:
    MOV X11, X0 // X11 = X0
    MOV X21, XZR // X21=0 (X21 será o índice da string)
    MOV X20, XZR // X20=0    (X20 será onde guardarei a quantidade de vogais)
loop:
    LDRSB X10, [X11, #0] // X10 = valor da pos X21 da string
    //CBZ X10, return // se X10 =0, chegamos ao fim da string e vamos para return
    CMP X10, #0
    B.EQ return
    //Se X10 for igual a 'A', 'E', 'I', 'O' ou 'U', saltamos para incremento  
    CMP X10, 'A'
    B.EQ incremento 
    CMP X10, 'E'
    B.EQ incremento 
    CMP X10, 'I'
    B.EQ incremento 
    CMP X10, 'O'
    B.EQ incremento 
    CMP X10, 'U'
    B.EQ incremento 
    ADD X11, X11, #1
    
    B loop
    

incremento: 
    ADD X20, X20, #1 // X20 = X20 + 1 (aumento a quantidade de vogais em 1)
    ADD X11, X11, #1
    B loop // retorno para loop
    
return: // apenas retorno (término)
    MOV X0, X20 //ponho a quantidade de vogais em X20 para X0 para retornar para main.c
    BR X30



    