ASSUME CS:CODE, DS:DATA

DATA SEGMENT
    MSG1 DB "Enter 1st number (0-9): $"
    MSG2 DB "Enter 2nd number (0-9): $"
    MSG3 DB "Sum is: $"
DATA ENDS

CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX        ; initialize data segment

    ; ---- First number ----
    MOV DX, OFFSET MSG1
    MOV AH, 09H
    INT 21H            ; print prompt
    MOV AH, 01H
    INT 21H            ; read character
    SUB AL, 30H        ; convert ASCII to number
    MOV BL, AL         ; store in BL

    ; ---- Second number ----
    MOV DX, OFFSET MSG2
    MOV AH, 09H
    INT 21H            ; print prompt
    MOV AH, 01H
    INT 21H            ; read character
    SUB AL, 30H        ; convert ASCII to number

    ; ---- Addition ----
    ADD AL, BL         ; sum
    MOV BL, AL         ; store sum temporarily

    ; ---- Display result ----
    MOV DX, OFFSET MSG3
    MOV AH, 09H
    INT 21H

    ADD BL, 30H        ; convert sum to ASCII
    MOV DL, BL
    MOV AH, 02H
    INT 21H            ; print sum

    ; ---- Exit ----
    MOV AH, 4CH
    INT 21H

CODE ENDS
END START
