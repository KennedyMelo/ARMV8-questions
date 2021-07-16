#include<stdio.h>
#include<stdlib.h>
#define ll long long int


extern ll test(char *frase);

int main(void){
    char frase[]= "AEC";
    ll qtd = test(frase);
    printf("A quantidade de vogais maiusculas da minha string eh: %llx\n", qtd);
    return 0;
}
