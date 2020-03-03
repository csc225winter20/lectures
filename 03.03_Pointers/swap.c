#include <stdio.h>

void swap(int, int);

int main(void) {
    int z = 1, w = 2;
    swap(z, w);

    printf("z: %d, w: %d\n", z, w);
}

void swap(int x, int y) {
    int temp = x;
    x = y;
    y = temp;
}
