#include<stdio.h>
#include<stdlib.h>
#define ll long long int


extern ll test(char *frase);

int main(void){
    char frase[]= "1234"; //fiz com string, pois recebemos do usuário como string
    ll res = test(frase);
    printf("%lld\n", res);
    return 0;
}
