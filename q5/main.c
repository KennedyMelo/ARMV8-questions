#include<stdio.h>
#include<stdlib.h>
#define ll long long int


extern ll test(ll *x12, ll *minimo);

int main(void){
    ll x12=10,minimo=0;
    test(&x12, &minimo);
    printf("O valor de x12 eh: %lld\n", x12);
    return 0;
}
