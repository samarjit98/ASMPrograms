STACKS SEGMENT PARA
DW 32 DUP(0)
STACKS ENDS
DATAS SEGMENT
ARR1 DB 6 DUP(30H)
ARR2 DB 6 DUP(30H)
CNT DB 6
DATAS ENDS
CODES SEGMENT
MAIN PROC FAR
ASSUME CS:CODES,DS:DATAS,SS:STACKS
MOV AX,DATAS
MOV DS,AX
LEA SI,ARR1
XXX: MOV AH,10H
INT 16H
MOV [SI],AL
INC SI
DEC CNT
JNZ XXX
LEA SI,ARR1
LEA DI,ARR2
ADD DI,5H
MOV CNT,6
YYY: MOV DL,[SI]
MOV [DI],DL
DEC DI
INC SI
DEC CNT
JNZ YYY
LEA SI,ARR2
MOV CNT,6
ZZZ: MOV DL,[SI]
MOV AH,02H
INT 21H
INC SI
DEC CNT
JNZ ZZZ
MOV AX,4C00H
INT 21H
CODES ENDS
MAIN ENDP
END MAIN
