EXTRN READ_NUM:NEAR
EXTRN PRINT_UO:NEAR
EXTRN PRINT_SH:NEAR
EXTRN NEW_LINE:NEAR

PUBLIC SBHVALUE
PUBLIC SBLVALUE
PUBLIC SIGN
PUBLIC SIGNOCT
PUBLIC UOVALUE
PUBLIC SHVALUE
PUBLIC HEXTABLE

STKS SEGMENT PARA STACK 'STACK'
    DB 200 DUP (?)
STKS ENDS

DATAS SEGMENT PARA PUBLIC 'DATA'
    MENU DB "1. INPUT SIGNED BINARY.", 10, 13
        DB "2. PRINT UNSIGNED OCT.", 10, 13
        DB "3. PRINT SIGNED HEX.", 10, 13
        DB "4. EXIT.", 10, 13
        DB "CHOOSE OPERATION: $"
    FUNC DW 4 DUP (0)
    SBHVALUE DB 00000000B
    SBLVALUE DB 00000000B
    SIGN DB "+"
    SIGNOCT DB 0
    UOVALUE DB 5 DUP ("0"), "$"
    SHVALUE DB 4 DUP ("0"), "$"
    HEXTABLE DB "0123456789ABCDEF"
DATAS ENDS

CODES SEGMENT PARA PUBLIC 'CODE'
    ASSUME DS:DATAS, CS:CODES
MAIN:
    MOV AX, DATAS
    MOV DS, AX
    
    MOV FUNC[0], READ_NUM
    MOV FUNC[2], PRINT_UO
    MOV FUNC[4], PRINT_SH
    MOV FUNC[6], EXIT
    
    MENU_OUT:
        MOV AH, 9
        MOV DX, 0
        INT 21H
        
        MOV AH, 1
        INT 21H
        
        MOV AH, 0
        SUB AL, "1"
        MOV DL, 2
        MUL DL
        MOV BX, AX
        
        CALL NEW_LINE
        CALL FUNC[BX]
        CALL NEW_LINE
    JMP MENU_OUT

EXIT PROC NEAR
    MOV AX, 4C00H
    INT 21H
EXIT ENDP
    
CODES ENDS
END MAIN
