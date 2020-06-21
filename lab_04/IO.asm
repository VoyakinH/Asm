PUBLIC READ_SIZE
PUBLIC READ_MAT
PUBLIC PRINT_MAT

EXTRN N:BYTE
EXTRN M:BYTE
EXTRN MAT:BYTE

CODES SEGMENT PARA PUBLIC 'CODE'
    ASSUME CS:CODES

PRINT_SPACE:
    MOV AH, 2
    MOV DL, " "
    INT 21H
    RET

NEW_LINE:
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    RET

READ_SIZE PROC NEAR
    MOV AH, 1
    INT 21H
    MOV N, AL
    SUB N, "0"
    
    CALL PRINT_SPACE
    
    MOV AH, 1
    INT 21H
    MOV M, AL
    SUB M, "0"
    
    CALL NEW_LINE
    RET
READ_SIZE ENDP

READ_MAT PROC NEAR
    MOV CH, 0
    MOV DH, N
    MOV SI, 0
    READ:
        CALL NEW_LINE
        MOV CL, M
        READ_ROW:
            MOV AH, 1
            INT 21H
            MOV MAT[SI], AL
            INC SI
            CALL PRINT_SPACE
            LOOP READ_ROW
        MOV CL, DH
        DEC DH
        LOOP READ
    RET
READ_MAT ENDP

PRINT_MAT PROC NEAR
    CALL NEW_LINE
    MOV CH, 0
    MOV DH, N
    MOV SI, 0
    PRINT:
        CALL NEW_LINE
        MOV CL, M
        PRINT_ROW:
            MOV AH, 2
            MOV DL, MAT[SI]
            INT 21H
            INC SI
            CALL PRINT_SPACE
            LOOP PRINT_ROW
        MOV CL, DH
        DEC DH
        LOOP PRINT
    RET
PRINT_MAT ENDP
CODES ENDS
END
