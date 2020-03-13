#include <stdio.h>

typedef struct Foo {
    int x, y;
} Foo;

typedef struct Bar {
    Foo foo;
    int z;
} Bar;

int main(void) {
    Bar bar = {{0, 1}, 2};

    printf("bar (%p):\n", (void *)&bar);
    printf("|-- foo (%p):\n", (void *)&(bar.foo));
    printf("|   |-- x (%p): %d\n", (void *)&(bar.foo.x), bar.foo.x);
    printf("|   +-- y (%p): %d\n", (void *)&(bar.foo.y), bar.foo.y);
    printf("+-- z (%p): %d\n", (void *)&(bar.z), bar.z);

    return 0;

}
