    .globl test
test:
    MOV X11, X0 // X11 = X0  (faço isso para retornar um char no final)
    MOV X20, XZR // X20=0 (X20 será onde guardarei a quantidade de pontos do player 1)
    MOV X21, XZR // X21=0 (X21 será onde guardarei a quantidade de pontos do player 2)
    MOV X19, XZR // X19 = flag que usarei para determinar se eh o jogador 1(flag =0) ou o 2(flag =1), e se flag =2, vou para placar
    
loop:
    //CBZ X10, return // se X10 =0, chegamos ao fim da string e vamos para return
    CMP X19, #2
    B.EQ placar
    
    CMP X19, #0
    B.EQ string1
    
    CMP X19, #1
    B.EQ string2
loop1:
    // X9 é uma string auxilixar que aponta ou para string 1 ou 2
    CMP X9, #0
    B.EQ incrementoFlag
    
comparacoes:
    // letras que adicionam 1 ponto
    CMP X9, 'A'
    B.EQ adiciona1
    
    CMP X9, 'E'
    B.EQ adiciona1
    
    CMP X9, 'I'
    B.EQ adiciona1

    CMP X9, 'O'
    B.EQ adiciona1

    CMP X9, 'U'
    B.EQ adiciona1

    CMP X9, 'N'
    B.EQ adiciona1

    CMP X9, 'R'
    B.EQ adiciona1

    CMP X9, 'S'
    B.EQ adiciona1

    // letras que adicionam 2 ponto
    CMP X9, 'D'
    B.EQ adiciona2
    
    CMP X9, 'G'
    B.EQ adiciona2
    
    CMP X9, 'T'
    B.EQ adiciona2

    // letras que adicionam 3 ponto
    CMP X9, 'B'
    B.EQ adiciona3
    
    CMP X9, 'C'
    B.EQ adiciona3
    
    CMP X9, 'M'
    B.EQ adiciona3
    
    CMP X9, 'P'
    B.EQ adiciona3
    
    // letras que adicionam 4 ponto
    CMP X9, 'F'
    B.EQ adiciona4
    
    CMP X9, 'H'
    B.EQ adiciona4
    
    CMP X9, 'V'
    B.EQ adiciona4

    CMP X9, 'W'
    B.EQ adiciona4

    CMP X9, 'Y'
    B.EQ adiciona4

    // letras que adicionam 5 ponto
    CMP X9, 'K'
    B.EQ adiciona5

    // letras que adicionam 8 ponto
    CMP X9, 'J'
    B.EQ adiciona8
    
    CMP X9, 'L'
    B.EQ adiciona8
    
    CMP X9, 'X'
    B.EQ adiciona8
    
    // letras que adicionam 10 ponto
    CMP X9, 'Q'
    B.EQ adiciona10
    
    CMP X9, 'Z'
    B.EQ adiciona10

verificarFlag:
    CMP X19, #0  // se a flag =0, adiciono X10 na pontuação do player 1
    B.EQ pontuacaoPara1
    CMP X19, #1  // se a flag =1, adiciono X10 na pontuação do player 2
    B.EQ pontuacaoPara2
    
pontuacaoPara1:
    ADD X20, X20, X10
    B loop

pontuacaoPara2:
    ADD X21, X21, X10
    B loop

// os blocos 'adiciona', colocam a pontuação do determinado caracter em X10
adiciona1:
    MOV X10, #1
    B verificarFlag

adiciona2:
    MOV X10, #2
    B verificarFlag

adiciona3:
    MOV X10, #3
    B verificarFlag

adiciona4:
    MOV X10, #4
    B verificarFlag

adiciona5:
    MOV X10, #5
    B verificarFlag

adiciona8:
    MOV X10, #8
    B verificarFlag

adiciona10:
    MOV X10, #10
    B verificarFlag

// X11 aponta para string 1 e X1 aponta para a string 2
string1:
    LDRSB X9, [X11, #0] //X9 recebe o caracter da string 1
    ADD X11, X11, #1 //X11 += 1 (avanço para a próxima posição da string 1)
    B loop1
string2:
    LDRSB X9, [X1, #0] //X9 recebe o caracter da string 2
    ADD X1, X1, #1 //X1 += 1 (avanço para a próxima posição da string 2)
    B loop1

incrementoFlag:
    ADD X19, X19, #1 // flag +=1
    B loop
incremento: 
    ADD X20, X20, #1 // X20 = X20 + 1 (aumento a quantidade de vogais em 1)
    ADD X11, X11, #1
    B loop // retorno para loop
placar:
    CMP X20, X21
    B.GT letraA
    B.LT letraB
    B.EQ letraE
letraA:
    MOV X0, 'A'
    B return
letraB:
    MOV X0, 'B'
    B return
letraE:
    MOV X0, 'E'
    B return

return: // apenas retorno (término)
    BR X30
