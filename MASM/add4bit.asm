ASSUME CS:CODE, DS:DATA

DATA SEGMENT
    STR1 DB 0AH, "ENTER 1ST NO:$"
    STR2 DB 0AH, "ENTER 2ND NO:$"
    STR3 DB 0AH, "SUM IS:$"
DATA ENDS

CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX

    ; Display first prompt
    LEA DX, STR1
    MOV AH, 09H
    INT 21H

    ; Read first number
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV BL, AL

    ; Display second prompt
    LEA DX, STR2
    MOV AH, 09H
    INT 21H

    ; Read second number
    MOV AH, 01H
    INT 21H
    SUB AL, 30H

    ; Display result prompt
    LEA DX, STR3
    MOV AH, 09H
    INT 21H

    ; Perform addition
    ADD AL, BL
    MOV AH, 00H
    AAA

    ; Display sum
    MOV BL, AL
    MOV DL, AH
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    MOV DL, BL
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    ; Exit to DOS
    MOV AH, 4CH
    INT 21H

CODE ENDS
END START
