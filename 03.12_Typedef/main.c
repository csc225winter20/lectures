#include <stdio.h>

struct point {
    int x;
    int y;
};

int main(void) {
    struct point pt = {0, 0};

    pt.x++;
    pt.y = pt.x + 1;

    printf("pt (%p):\n", (void *)&pt);
    printf("|-- x (%p): %d\n", (void *)&pt.x, pt.x);
    printf("+-- y (%p): %d\n", (void *)&pt.y, pt.y);

    return 0;
}
