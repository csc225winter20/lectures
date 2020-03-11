#include <stdlib.h>

int main(void) {
    /* Valgrind can detect that this allocates memory that is never freed: */
    int *arr = (int *)malloc(sizeof(int) * 4);

    return *arr;
}
