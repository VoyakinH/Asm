#include <iostream>
using namespace std;

int hashfunc(int num)
{
    int N = 13;
    int modd = 1;
    double A = 0.618033;
    int h = int(N * fmod(num * A, modd));
    return h;
}

int hashfuncasm(int num)
{
    int N = 13;
    int modd = 1;
    double A = 0.618033;
    int h = 0;
    __asm
    {
        FLD A
        FILD num
        FMULP ST(1), ST(0)
        FILD modd
        FXCH ST(1)
        FPREM
        FILD N
        FMULP ST(1), ST(0)
        FLD ST(0)
        FIST h
    }
    return h;
}

int main()
{
    int num;
    cout << "Number to count hash: ";
    cin >> num;
    cout << endl << "Exp: " << hashfunc(num) << endl;
    cout << "Got: " << hashfuncasm(num) << endl;
    return 0;
}
