/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int my_mul(long long int a, long long int b);
extern long long int factorial(long long int n);

int main(void)
{
    long long int a = my_mul(3, 5);
    printf("Result of my_mul(3, 5) = %ld\n", a);
    long long int b = factorial(3);
    printf("Result of factorial(3) = %ld\n", b);
    return 0;
}
