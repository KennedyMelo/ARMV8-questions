#include<stdio.h>
#include<stdlib.h>
#define ll long long int


extern ll test(char *frase1, char *frase2);

int main(void){
    char frase1[]= "grnrcLszemskvbgcluwtgyvieip", frase2[]= "leg"; //fiz com string, pois recebemos do usuário como string
    ll res = test(frase1, frase2);
    printf("A quantidade de vezes que a palavra pode ser formada eh %lld\n", res);
    return 0;
}
