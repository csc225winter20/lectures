#include <stdio.h>
#include <stdlib.h>

int *newArr(int n) {
    /* To dynamically allocate space for "n" integers: */
    int *arr = (int *)malloc(sizeof(int) * n);

    /* ...it is then safe to return a pointer to the heap: */
    return arr;
}

int main(void) {
    int *arr;

    arr = newArr(4);
    arr[0] = 1;
    arr[1] = 2;
    arr[2] = 4;
    arr[3] = 8;

    printf("arr (%p): %p\n", (void *)&arr, (void *)arr);
    printf("*(%p + 0): %d\n", (void *)arr, arr[0]);
    printf("*(%p + 1): %d\n", (void *)arr, arr[1]);
    printf("*(%p + 2): %d\n", (void *)arr, arr[2]);
    printf("*(%p + 3): %d\n", (void *)arr, arr[3]);

    /* To deallocate memory once we are done: */
    free(arr);

    return 0;
}
