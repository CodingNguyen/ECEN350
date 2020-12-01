/* main.c simple program to test your assembly program */

#include <stdio.h>

extern long long int test ( long long int b);

int main ( void ){
    long long int a = test (20) ;  // Replace Y with any number you like
    printf ("Result is = %d\n", a);
    return 0;
}

// Part 5--------------------------------------------------------

// /* main.c simple program to test compilation and assembly */

// #include <stdio.h>

// /* "test" is our function that is written in ARMv8 Assembly */
// extern long long int test();

// int main(void)
// {
//     long long int a = test(); /* Calling assembly funct test from
//     a C program */
//     printf("Result of test(3, 7) = %lld\n", a);
//     return 0;
// }

// Part 2--------------------------------------------------------

// /* main.c simple program to test compilation and assembly */

// #include <stdio.h>

// /* "test" is our function that is written in ARMv8 Assembly */
// extern long long int test(long long int a, long long int b);

// int main(void)
// {
//     long long int a = test(3, 5); /* Calling assembly funct test from
// 				     a C program */
//     printf("Result of test(3, 5) = %lld\n", a);
//     return 0;
// }
