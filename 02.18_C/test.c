/* Use the standard I/O library: */
#include <stdio.h>

/* Execution begins with a function named "main", whose arguments are the
 * command line arguments: */
int main(int argc, char *argv[]) {
    int z, y, sum, i;

    /* To declare a signed, (typically) 32-bit integer initialized to 5: */
    int x = 5;
    /* This is then not ordinarily allowed: x = "5"; */
    printf("%d\n", x);

    x = 1;                              /* x has value 1. */
    {
        x = 2;                          /* x has value 2. */
        {
            /* NOTE: This must be the first line in the block. */
            int x = 3;                  /* x has value 3. */
            printf("%d\n", x);
        }
        printf("%d\n", x);              /* x has value 2. */
    }
    printf("%d\n", x);                  /* x has value 2. */

    /* To compute "z = max(x, y)": */
    y = 5;
    if (x > y) {
        z = x;
        printf("...inside if...\n");
    }
    else {
        z = y;
        printf("...inside else...\n");
    }
    
    /* To compute "sum(0...9)": */
    sum = 0;
    i = 0;
    while (i < 10) {
        sum += i;
        i++;
    }

    printf("sum: %d\n", sum);

    /* This is equivalent to: */
    sum = 0;
    for (i = 0; i < 10; i++) {
        sum += i;
    }

    printf("sum: %d\n", sum);

    /* To scan an integer into "x": */
    scanf("%d", &x);
    printf("%d\n", x);

    /* Returning 0 indicates "no error": */
    return 0;
}
