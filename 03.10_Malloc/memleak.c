#include <stdlib.h>

int main(void) {
    int *arr = (int *)malloc(sizeof(int) * 4);

    return *arr;
}
