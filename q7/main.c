#include<stdio.h>
#include<stdlib.h>
#define ll long long int


extern ll test(char *frase1, char *frase2);

int main(void){
    char frase1[]= "AAEQ", frase2[]="GOTICO";
    char letra = test(frase1, frase2);
    printf("%c\n", letra);
    return 0;
}
