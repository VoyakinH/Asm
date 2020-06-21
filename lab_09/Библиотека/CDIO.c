#include <stdio.h>
#include "libdynarr.h"

int read_n(FILE *f, int *n)
{
    if (fscanf(f, "%d", n) == 1 && *n > 2)
        return OK;
    else
        return READ_N_ERR;
}

void out_arr(double *a, int n)
{
    double *p = a;
    for (int i = 0; i < n; i++)
    {
        printf("%.6lf \n", *p);
        p++;
    }
    printf("\n");
    return;
}
