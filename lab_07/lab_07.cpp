#include <iostream>
constexpr auto BUFF = 100;
using namespace std;

extern "C"
{
    void strcopyasm(char* dest, char* src, int len);
}

int strlenasm(const char* strr)
{
    int len = 0;
    __asm
    {
        MOV ECX, 0
        NOT ECX
        MOV AL, '\0'
        MOV EDI, strr
        REPNE SCASB
        NOT ECX
        DEC ECX
        MOV len, ECX
    }
    return len;
}

int main()
{
    char str[] = "String with len 18";
    cout << "Str: " << str << endl;
    cout << "\nCounting len of str...\n" << endl;
    cout << "Exp: " << strlen(str) << "\nGot: " << strlenasm(str) << endl;
    char str_new_expected[BUFF];
    char str_new_got[BUFF];
    cout << "\nCopying str...\n" << endl;
    strcopyasm(str_new_got, str, strlenasm(str));
    strncpy_s(str_new_expected, str, strlen(str));
    cout << "Exp: " << str_new_expected << "\nGot: " << str_new_got << endl;
    return 0;
}
