#include<stdio.h>
#include<stdlib.h>
#define ll long long int


extern ll test(ll *x10, ll *x11);

int main(void){
    ll x10,x11=0xffffffffffffffff;
    test(&x10, &x11);
    printf("O valor de x10(not de x11) eh: %llx\n", x10);
    return 0;
}
