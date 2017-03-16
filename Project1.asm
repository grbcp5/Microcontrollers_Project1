		ORG 00H
;		INITIALIZE VARIABLES
		MOV R0, #0000B
		ACALL RSTLP

;-----------------------------------------
;       SUBROUTINE:		
;		MAIN LOOP		
;-----------------------------------------
MLOOP:  ACALL GINPT; GET INPUT
		ACALL UPDTV; UPDATE VALUE
		ACALL OUTPV; OUTPUT VALUE
		ACALL RSTLP; RESET LOOP VARIABLES
		JMP MLOOP

;-----------------------------------------
;       SUBROUTINE:		
;		Get Input	
;-----------------------------------------
;		TODO: Complete subroutine
GINPT:	RET;

;-----------------------------------------
;       SUBROUTINE:		
;		Output current value	
;-----------------------------------------
;		TODO: Complete subroutine
OUTPV:	NOP
;		If overflow, call make sound
		JNB OV, SKPOV
		ACALL MKSND
SKPOV:	RET

;-----------------------------------------
;       SUBROUTINE:		
;		MAKE SOUND	
;-----------------------------------------
;		TODO: Complete subroutine
MKSND: RET

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
