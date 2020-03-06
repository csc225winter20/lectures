#include <stdio.h>

int main(void) {
    int x = 1, *ptr;

    /* To declare a pointer to a pointer: */
    int **ptrPtr;

    /* To point a double pointer at a single pointer: */
    ptrPtr = &ptr;

    /* To use a double pointer to access a single pointer: */
    *ptrPtr = &x;

    /* To use a double pointer to access an ordinary variable: */
    **ptrPtr = 2;

    printf("ptrPtr (%p): %p\n", (void *)&ptrPtr, (void *)ptrPtr);
    printf("ptr    (%p): %p\n", (void *)&ptr, (void *)ptr);
    printf("x      (%p): %d\n", (void *)&x, x);

    return 0;
}
