#include <stdio.h>
#include "point.h"

void foo(Point pt2) {
    printf("pt2 (%p):\n", (void *)&pt2);
    printf("|-- x (%p): %d\n", (void *)&pt2.x, pt2.x);
    printf("+-- y (%p): %d\n", (void *)&pt2.y, pt2.y);

    pt2.x = 5;
}

Point bar() {
    Point pt3 = {3, 4};

    printf("pt3 (%p):\n", (void *)&pt3);
    printf("|-- x (%p): %d\n", (void *)&pt3.x, pt3.x);
    printf("+-- y (%p): %d\n", (void *)&pt3.y, pt3.y);

    return pt3;
}

int main(void) {
    Point pt1 = {0, 0};

    pt1.x++;
    pt1.y = pt1.x + 1;

    printf("pt1 (%p):\n", (void *)&pt1);
    printf("|-- x (%p): %d\n", (void *)&pt1.x, pt1.x);
    printf("+-- y (%p): %d\n", (void *)&pt1.y, pt1.y);

    foo(pt1);

    printf("pt1 (%p):\n", (void *)&pt1);
    printf("|-- x (%p): %d\n", (void *)&pt1.x, pt1.x);
    printf("+-- y (%p): %d\n", (void *)&pt1.y, pt1.y);

    pt1 = bar();

    printf("pt1 (%p):\n", (void *)&pt1);
    printf("|-- x (%p): %d\n", (void *)&pt1.x, pt1.x);
    printf("+-- y (%p): %d\n", (void *)&pt1.y, pt1.y);

    return 0;
}
