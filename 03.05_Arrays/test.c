#include <stdio.h>

/* To define a function taking an array as an argument:
 * NOTE: "int *a2" would also be acceptable. */
void foo(int a2[]) {
    a2[0] = 5;
    printf("a2 (%p): [%d, %d]\n", (void *)a2, a2[0], a2[1]);
}

/* To "return" an array from a function:
 * NOTE: "int []bar" would not compile. */
int *bar() {
    int a3[] = {1, 2};

    return a3;
}

int main(void) {
    int a1[] = {0, 0}, *a4, *a5;

    /* foo can modify main's array: */
    printf("a1 (%p): [%d, %d]\n", (void *)a1, a1[0], a1[1]);
    foo(a1);
    printf("a1 (%p): [%d, %d]\n", (void *)a1, a1[0], a1[1]);

    /* bar's array is on the runtime stack... */
    a4 = bar();
    printf("a4 (%p): [%d, %d]\n", (void *)a4, a4[0], a4[1]);

    /* ...so any function call may overwrite that data... */
    a4[0] = 5;
    printf("a4 (%p): [%d, %d]\n", (void *)a4, a4[0], a4[1]);

    /* ...with unpredictable results: */
    a5 = bar();
    printf("a4 (%p): [%d, %d]\n", (void *)a4, a4[0], a4[1]);
    printf("a5 (%p): [%d, %d]\n", (void *)a5, a5[0], a5[1]);

    /* NOTE: Must compile with "-Wno-return-stack-address". */

    return 0;
}
