#include <stdio.h>
#include <stdlib.h>
#include "libdynarr.h"

int main()
{
    int rc = OK, n;
    rc = read_n(stdin, &n);
    if (rc == OK)
    {
        double *a;
        rc = read_array(n, &a);
        if (rc == OK)
        {
            
            out_arr(a, n);
        }
        if (a)
            free(a);
    }
    return rc;
}
