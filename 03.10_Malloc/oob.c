#include <stdlib.h>

int main(void) {
    int *arr = (int *)malloc(sizeof(int) * 4);

    arr++;

    /* Valgrind can detect that this is outside the allocated block: */
    arr[3] = 2;

    /* Valgrind can detect that this fails because it is not a pointer to the
     * beginning of an allocated block: */
    free(arr);

    return 0;
}
