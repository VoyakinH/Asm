#include <stdio.h>
#include <stdlib.h>
#include "libdynarr.h"

void out_arr_fix(double *a, int n)
{
    __asm
    {
        var_1C          = dword ptr -1Ch
        var_18          = qword ptr -18h
        var_C           = dword ptr -0Ch
        var_8           = qword ptr -8
        push    rbp
        mov     rbp, rsp
        sub     rsp, 20h
        mov     [rbp+var_8], rdi
        mov     [rbp+var_C], esi
        mov     rax, [rbp+var_8]
        mov     [rbp+var_18], rax
        mov     [rbp+var_1C], 0
        loc_EEE:
            mov     eax, [rbp+var_1C]
            cmp     eax, [rbp+var_C]
            jge     loc_F2D
            mov     rax, [rbp+var_18]
            movsd   xmm0, qword ptr [rax]
            lea     rdi, a6lf       ; "%.6lf"
            mov     al, 1
            call    _printf
            mov     rcx, [rbp+var_18]
            add     rcx, 8
            mov     [rbp+var_18], rcx
            mov     eax, [rbp+var_1C]
            add     eax, 1
            mov     [rbp+var_1C], eax
            jmp     loc_EEE
        loc_F2D:
            lea     rdi, asc_FB1    ; "\n"
            mov     al, 0
            call    _printf
            add     rsp, 20h
            pop     rbp
        retn
    }
}

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
            
            out_arr_fix(a, n);
        }
        if (a)
            free(a);
    }
    return rc;
}
