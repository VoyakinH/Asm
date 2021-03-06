PUBLIC DEL_ROW

EXTRN N:BYTE
EXTRN M:BYTE
EXTRN MAT:BYTE

DATAS SEGMENT PARA PUBLIC 'DATA'
    IND DB 1
    MIN DB 1
DATAS ENDS

CODES SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODES, DS:DATAS

REPLACE:
    MOV MIN, DH
    MOV AX, SI
    DIV M
    MOV IND, AL
    JMP BACK

FIND_MIN:
    MOV AL, N
    MUL M
    MOV CX, AX
    MOV SI, 0
    BRUTE:
        MOV DH, MAT[SI]
        CMP MIN, DH
        JG REPLACE
        BACK:
        INC SI
        LOOP BRUTE
    RET

DELETE:
    MOV AL, IND
    MOV AH, N
    MOV IND, AH
    SUB IND, AL
    SUB IND, 1
    MUL M
    MOV SI, AX
    MOV AL, M
    MUL IND
    MOV CX, AX
    MOV DH, 0
    MOV DL, M
    MOV DI, DX
    ADD DI, SI
    SHIFT:
        MOV AL, MAT[DI]
        MOV MAT[SI], AL
        INC SI
        INC DI
        LOOP SHIFT
    DEC N
    RET
    
DEL_ROW PROC NEAR
    MOV MIN, "9"
    CALL FIND_MIN
    CALL DELETE
    RET
DEL_ROW ENDP
CODES ENDS
END
