.global SOMA_V
.type SOMA_V, %function
.text

SOMA_V: MOV W3, #0

BEG: LDR X2,[X0]
	ADD W3,W3,W2
	ADD X0,X0, #4
	SUB W1,W1,#1
	CMP W1, #0
	BNE BEG
	MOV X0, X3
	RET
