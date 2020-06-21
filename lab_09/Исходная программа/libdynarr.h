#ifndef libdynarr_h
#define libdynarr_h

#include <stdio.h>

#define OK 0
#define READ_N_ERR -1
#define READ_P_ERR -2
#define READ_ARR_ERR -3
#define MEM_ERR -4

int read_n(FILE *f, int *n);
int read_array(int n, double **a);
void out_arr(double *a, int n);

#endif /* libdynarr_h */
