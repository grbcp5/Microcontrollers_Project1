		ORG 00H
		
;		MAIN LOOP		
MLOOP:  ACALL RSTLP
		JMP MLOOP

; 		RESET LOOP VARIABLES
RSTLP:	CLR OV
		CLR CY
		CLR AC
		CLR F0
		RET