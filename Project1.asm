		ORG 00H
;		INITIALIZE VARIABLES
		MOV R0, #0000B
		ACALL RSTLP

;-----------------------------------------
;       SUBROUTINE:		
;		MAIN LOOP		
;-----------------------------------------
MLOOP:  ACALL UPDTV; UPDATE VALUE
		ACALL RSTLP; RESET LOOP VARIABLES
		JMP MLOOP

;-----------------------------------------
;       SUBROUTINE:
;		UPDATE CURRENT VALUE
;-----------------------------------------
UPDTV:	JNB CY, NOTI; NOTI = NOT INCREMENT

;		Incrementing
		CJNE R0, #1111B, NOT15

;		R0 is 15 so it needs to wrap around
		MOV R0, #0000B
		SETB OV
		RET

;		R0 < 15 so just increment
NOT15:  INC R0
		RET

;		No increment input recieved
NOTI:   JNB AC, NOTD; NOTD = NOT DECREMENT

;		Decrementing
		CJNE R0, #0000B, NOT0

;		R0 is 0 so it needs to wrap around
		MOV R0, #1111B
		SETB OV
		RET

;		R0 > 0 so just decrement
NOT0:	DEC R0
NOTD:   RET

;-----------------------------------------
;       SUBROUTINE:
; 		RESET LOOP VARIABLES
;-----------------------------------------
RSTLP:	CLR OV
		CLR CY
		CLR AC
		CLR F0
		RET