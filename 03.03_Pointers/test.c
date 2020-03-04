#include <stdio.h>

#define LENGTH 4

int main(void) {
    int x = 1;

    /* To declare an array of four integers: */
    int arr[LENGTH];

    /* To declare a pointer to an integer: */
    int *ptr;

    /* To point "ptr" to "x": */
    ptr = &x;

    /* To use a pointer to access a variable: */
    *ptr = 2;
    printf("x (%p): %d\n", (void *)ptr, x);

    /* To indicate that a pointer contains an invalid address: */
    ptr = NULL;

    /* To check to see if a pointer is a valid: */
    if (ptr != NULL) {
        /* This would segfault: */
        *ptr = 4;
    }

    /* To access array elements: */
    arr[1] = 2;
    arr[3] = 8;
    printf("arr: [%d, %d, %d, %d]\n", arr[0], arr[1], arr[2], arr[3]);

    /* To access an array using a pointer: */
    ptr = arr + 1;
    (++ptr)[0] = 4;
    printf("arr: [%d, %d, %d, %d]\n", arr[0], arr[1], arr[2], arr[3]);

    return 0;
}
