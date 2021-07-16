#include<stdio.h>
#include<stdlib.h>
#define ll long long int


extern ll test(ll *a, ll *b, ll *c, ll *x);

int main(void){
    ll a=3,b=10,c= 30, x;
    test(&a, &b, &c, &x);
    printf("O valor de x eh: %lld\n", x);
    return 0;
}
