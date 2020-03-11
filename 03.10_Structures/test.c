#include <stdio.h>

/* To define a structure grouping a pair of integers together: */
struct point {
    int x;
    int y;
};

int main(void) {
    /* To instantiate a structure: */
    struct point pt = {0, 0}; 

    /* To access members in a structure: */
    pt.x++;
    pt.y = pt.x + 1;

    printf("pt (%p):\n", (void *)&pt);
    printf("|-- x (%p): %d\n", (void *)&pt.x, pt.x);
    printf("+-- y (%p): %d\n", (void *)&pt.y, pt.y);

    return 0;
}
