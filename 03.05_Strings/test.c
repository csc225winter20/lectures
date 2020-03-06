#include <stdio.h>

int main(void) {
    /* To declare an array of characters, initialized using a string: */
    char str1[] = "bar";

    /* To declare a character pointer, initialized pointing to a string: */
    char *str2 = "bar", *str3 = "bar";

    /* To change a character in a string: */
    printf("str1 (%p): \"%s\"\n", (void *)str1, str1);
    str1[2] = 'y';
    printf("str1 (%p): \"%s\"\n", (void *)str1, str1);

    /* NOTE: Both str2 and str3 point to global, read-only memory. They are
     *       immutable, and the compiler will likely optimize them into two
     *       pointers to the same string. */
    printf("str2 (%p): \"%s\"\n", (void *)str2, str2);
    printf("str3 (%p): \"%s\"\n", (void *)str3, str3);

    return 0;
}
