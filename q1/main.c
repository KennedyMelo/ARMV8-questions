#include<stdio.h>
#include<stdlib.h>
#define ll long long int


extern ll test(ll *a, ll *b, ll *m);

int main(void){
    ll a=3,b=10,m;
    test(&a, &b, &m);
    printf("O valor de m eh: %lld\n", m);
    return 0;
}
