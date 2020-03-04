#include <stdio.h>

int main(void) {
    int x = 0, arr[4] = {0, 0, 0, 0};

    printf("x (%p): %d\n", (void *)&x, x);
    printf("arr[0] (%p): %d\n", (void *)(arr + 0), arr[0]);
    printf("arr[1] (%p): %d\n", (void *)(arr + 1), arr[1]);
    printf("arr[2] (%p): %d\n", (void *)(arr + 2), arr[2]);
    printf("arr[3] (%p): %d\n", (void *)(arr + 3), arr[3]);

    /* On MY computer (a 2014 2.5 Ghz Crystalwell Core i7) and MY operating
     * system (macOS 10.12 Sierra) with MY compiler (clang 9.0.0), the
     * implementation-specific behavior of "arr - 2" is to evaluate to "&x".
     * NOTE: Must compile with "-Wno-array-bounds". */
    arr[-2] = 1;
    printf("\nx (%p): %d\n", (void *)&x, x);

    return 0;
}
