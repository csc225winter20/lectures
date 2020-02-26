#include <stdio.h>

int sum(int);

int main(void) {
    printf("3 + 2 + 1 + 0 = %d\n", sum(3));

    return 0;
}

int sum(int n) {
    if (n <= 0) {
        return 0;
    }
    else {
        return sum(n - 1) + n;
    }
}
