#include <stdio.h>

int main(void) {
    int *ptr = NULL;

    /* GDB can determine that this line results in a segfault: */
    return *ptr;
}
