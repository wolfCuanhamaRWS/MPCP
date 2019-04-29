# 5. Escrever e testar as seguintes sub-rotinas:
# a) SOMA – calcula a soma dos elementos de um vetor.
# b) MEDIA – calcula a média dos elementos de um vetor utilizando a sub-rotina SOMA .
# c) MAXMED – calcula a média dos elementos de dois vetores e retorna a maior das duas médias.



# x0 = vector 1
# x1 = dim1
# x2 = vector 2
# x3 = dim2

max_word:
			STP x29, x30, [SP, #-16]!
			BL MAXMED
			MOV x0, x7
			LDP x29, x30, [SP], #16
			RET

# LETTER A

# x0 = vector (immutable) 
# x1 = dim (immutable) 
# x9 = dim
# x10 = actual value
# x11 = sum
# x7 = result

SOMA: 			MOV x9, x1
			MOV x11, #0
CICLO:			CBZ x9, END
			LDR w10, [x0]
			ADD x11, x11, x10
			ADD x0, x0, #4
			SUB x9, x9, #1
			B CICLO
END: 			MOV x7, x11
			RET


# LETTER B
MEDIA: 			STP x29, x30, [SP, #-16]!
			MOV x29, SP
			BL SOMA
			UDIV x7, x7, x1
			MOV SP, x29
			LDP x29, x30, [SP], #16
			RET
	

		
#LETTER C
MAXMED: 		STP x29, x30, [SP, #-16]!
			MOV X29, SP
			BL MEDIA
			MOV x6, x7
			MOV x0, x2
			MOV x1, x3
			BL MEDIA
			CMP x6, x7
			CSEL x7, x7, x6, PL
			MOV SP, x29
			LDP x29, x30, [SP], #16
			RET

