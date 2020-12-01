/* main.c simple program to test assembler program */
#include <stdio.h>

extern long long int fact(long long int a);

int main(void)
{
    long long int c = fact(10);
    printf("Result of fact(10) = %d\n", c);
    return 0;
}