
# 2. Escrever e testar programas que permitam calcular:
# a) o valor máximo de um vetor com dados do tipo word .
# b) o valor mínimo de um vetor com dados do tipo doubleword .
# c) o valor máximo de um vetor com dados do tipo halfword .
# d) o valor médio de um vetor com dados de 64 bits.
# e) o número de valores de um vetor que pertencem ao intervalo [a; b].

#LETTER A 

	# x0 = vector 
	# x1 = dimension 
	# x2 = actual value
	# x3 = result

	MAX: 	MOV w3, #0

	CICLO: 	CBZ w1, END		;case length.vector = NULL
		LDRSW w2, [x0]		;loading the actual value
		CMP w3, w2		
		CSEL w3, w2, w3, GT	;check if the the actual value is greater than the greatest value until now
		ADD w0, w0, #4		;next element in the vector
		SUB w1, w1, #1		;update the counter
		B CICLO
	END:	MOV w0, w3		

#LETTER B
	  
	# x0 = vector 
	# x1 = dimension 
	# x2 = actual value
	# x3 = result
	
	MIN: 	MOV x3, #0
	CICLO: 	CBZ x1, END
		LDR x2, [x0] 
		CMP x2, w3
		CSEL x3, x2, x3, LT
		ADD x0, x0, #8
		SUB x1, x1, #1
		B CICLO 
	END: 	MOV x0, x3
		RET 

#LETTER C
		 
	# x0 = vector 
	# x1 = dimension 
	# x2 = actual value
	# x3 = result

	MAX: 	MOV w3, #0

	CICLO: 	CBZ w1, END
		LDRSH w2, [x0]
		CMP w3, w2
		CSEL w3, w2, w3, GT
		ADD w0, w0, #4
		SUB w1, w1, #1
		B CICLO
	END:	MOV w0, w3


#LETTER D

	#x0 = vector
	#x1 = dimension
	#x2 = actual value
	#x3 = sum
	#x4 = dimension (immutable)
	
	MAX: 	MOV x3, #0
		MOV x4, x1
	CICLO:	CBZ x1, END
		LDR x2, [x0] 
		ADD x3, x3, x2
		ADD x0, x0, #8
		SUB x1, x1, #1
		B CICLO
	END: 	SDIV x0, x3, x4
		RET 

#LETTER E

	#x0 = vector
	#x1 = dimension 
	#x2 = interval floor
	#x3 = max element of the interval 
	#x4 = acutal value 
	#x5 = counter

	ROT:	MOV x5, #0
	CICLO: 	CBZ x1, END
		lDR x4, [x0]
		CMP x4, x2
		B.GE COMP
	CONT: 	ADD x, x0, #8
		SUB x1, x1 #1
		B CICLO

	COMP: 	CMP x4, x3 
		B.GT CONT
		ADD x5, x5, #1
		B CONT

	END:	MOV x0, x5
		RET 


# 9.Considerar que o valor inicial de `W0 é 0x12345678`. Determinar o valor de W1 (ou X1) após a execução
# de cada fragmento de código.
  

# letter a 
    # w0 = 0001 0010 0011 0100 0101 0110 0111 1000
    
    MOV W1, #0xABCD0000  ;w1 = 1010 1011 1100 1101 0000 0000 0000 0000  
    UBFX W2, W0, #24, #8 ;w2 = 0000 0000 0000 0000 0000 0000 0001 0010
    BFI W1, W2, #16, #8  ;w1 = 1010 1011 0001 0010 0000 0000 0000 0000
 

# letter b
  
    # w0 = 0001 0010 0011 0100 0101 0110 0111 1000
    
    REV W1, W0                ;w1 = 0x78564312   w1 = 0111 1000 0101 0110 0011 0100 0001 0010
    AND W1, W1, W1, ASR #16   ;w1' = 1000 0000 0000 0000 0111 1000 0101 0110 -- W1, ASR #16
                              ;w1 =  0111 1000 0101 0110 0011 0100 0001 0010
                              ;w1 =  0000 0000 0000 0000 0011 0000 0001 0010 -- NEW W1 = 0X78564012
    REV W1, W1                ;w1 =  0001 0010 0011 0000 0000 0000 0000 0000
    SUB W1, W0, W1            ;w0 =  0001 0010 0011 0100 0101 0110 0111 1000
                              ;w0 =  0000 0000 0000 0100 0101 0110 0111 1000                                     
    
 
    
    
# letter c 

    # w0 = 0001 0010 0011 0100 0101 0110 0111 1000
    
    EON X1, X1, X1                ;x1 = 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 
    ADD X1, X1, W0, SXTB #4       ;w0 = 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0111 1000 0000
                                  ;x1 = 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0111 0111 1111



  
