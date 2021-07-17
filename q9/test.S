    .globl test

test:
    MOV X21, X0 // X21 = X0 (pego o endereço da string1 e coloco em X21)
    MOV X0, 0xfffffffff // X0 = 0(X0 seŕa a quantidade de palavras que posso formar), inicialmente coloco como valor muito alto
    MOV X23, X21 // coloco o endereço inicial da string1 no X23, pois irei iterar pela string1 várias vezes
    B loop2 
     
loop:
    LDRSB X10, [X21, #0] // pego o valor da string1 no endereço X21
    CMP X10, #0 // Caso chegue ao fim da string1, vou para loop2
    B.EQ loop2Aux
    CMP X19, X10  // Caso encontre o caracter da string2 na string1, aumento o contador que está em X9
    B.EQ aumentaContador
loopParte1:
    CMP X10, 'Z'  // troco a letra para minúsculo se X10<='Z', caso não, troco para maiúsculo
    B.LE trocarParaMinusculo
    B trocarParaMaiusculo
loopParte2:
    CMP X19, X10  // Faço novamente a comparação com a letra modificada
    B.EQ aumentaContador2
continuacaoLoop1:
    ADD X21, X21, #1 // Vou para próxima posição da string1
    B loop

loop2:
    LDRSB X19, [X1, #0] // pego o valor da string2 no endereço X1
    CMP X19, #0 // Caso chegue ao fim da string2, vou para return
    B.EQ return
    MOV X9, XZR  // X9 =0
    MOV X21, X23 // X21 aponta para o início da string 1
    B loop    
loop2Aux: 
    CMP X9, X0 // Se a quantidade de aparições de alguma letra for menor que a minha resposta, minha resposta será ela, pois não poderei formar uma quantidade de palavras maiores que a quantidade da aparição dessa letra
    B.LT atualizaResp
continuacaoLoop2:
    ADD X1, X1, #1 // Vou para próxima posição da string2
    B loop2

atualizaResp: //calcula a aparição mínima de todas as letras da string2 na string1, que justamente é a resposta
    MOV X0, X9
    B continuacaoLoop2

aumentaContador: //aumentar o contador(X9) em uma unidade e retorna para loopParte1
    ADD X9, X9, #1
    B loopParte1

aumentaContador2: //aumentar o contador(X9) em uma unidade e retorna para continuacaoLoop1
    ADD X9, X9, #1
    B continuacaoLoop1

trocarParaMaiusculo: // converto uma letra para maiúsculo
    SUB X10, X10, #32
    B loopParte2
trocarParaMinusculo: // converto uma letra para minúsculo
    ADD X10, X10, #32
    B loopParte2
return: // apenas retorno (término)
    BR X30
