ASSUME CS:CODE, DS:DATA

DATA SEGMENT
    STR1 DB 0AH, "ELEMENT FOUND$"
    STR2 DB 0AH, "ELEMENT NOT FOUND$"
    LIST DB 02H, 05H, 08H, 01H
    SEA  DB 05H
    COUNT DB 04H
DATA ENDS

CODE SEGMENT
START:
    MOV AX, DATA
    MOV DS, AX

    MOV AL, SEA        ; Element to search for
    LEA SI, LIST       ; Start address of list
    MOV CL, COUNT      ; CL = number of elements

AGAIN:
    MOV BL, [SI]       ; Load current element
    CMP AL, BL         ; Compare with search element
    JZ FOUND           ; Jump if found
    INC SI             ; Move to next element
    DEC CL             ; Decrease counter
    JNZ AGAIN          ; If not zero, continue search

    ; Not found message
    LEA DX, STR2
    MOV AH, 09H
    INT 21H
    JMP EXIT

FOUND:
    LEA DX, STR1       ; Found message
    MOV AH, 09H
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

CODE ENDS
END START