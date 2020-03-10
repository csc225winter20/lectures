#include <stdlib.h>

int main(void) {
    int *arr = (int *)malloc(sizeof(int) * 4);

    arr++;

    arr[3] = 2;
    free(arr);

    return 0;
}
