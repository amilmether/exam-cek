ASSUME CS:CODE ,DS:DATA
DATA SEGMENT
STR1 DB 0AH,"Enter the charater:$"
STR2 DB 0AH,"The Charater:$"
DATA ENDS
CODE SEGMENT
START:MOV AX,DATA
       MOV DS,AX

       LEA DX,STR1
       MOV AH,09H
       INT 21H

       MOV AH,01H
       INT 21H
       MOV BL,AL

       LEA DX,STR2
       MOV AH,09H
       INT 21H

       MOV DL,BL
       MOV AH,02H
       INT 21H

       MOV AH,4CH
       INT 21H
CODE ENDS
END START
