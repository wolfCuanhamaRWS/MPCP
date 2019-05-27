#FOLHA DE PROCESSAMENTO PARALELO 

# Questão 01 - 

#a) void somaV (float *p, float *q, float *r, int n) - x0, x1, x2 & x3. Como é float, usaremos S que contém 4bytes cada. 

.text 
.global somaV
.type somaV, "function" 

somaV:  
        stp x29,x30,[sp, #-16]!
        lsr x3, x3, 2  //estamos fazendo 4 operações em um ciclo 
ciclo:  
        cbz x3, end
        ldr q0, [x0], #16
        ldr q1, [x1], #16
        
        fadd v2.4s, v1.4s, v0.4s  // somando 4 números em paralelo
        
        str q2, [x2], #16 //armazenando o resultado 
        sub x3, x3, #1  //atualizando o contador
        b ciclo
        
end:
        ldp x29,x30,[sp],#16
        ret 

#------------------------------------------------------------------------------------------------------------------------

#b) void altV(float *P, int n, float k) - x0, x1, s0

.text
.global altV
.type altV, "function" 

altV:   
	stp x29,x30,[sp,#-16]!
        lsr x1, x1, 2
ciclo:
        cbz x1, end
        ldr q1, [x0]
        fmul v1.4s, v1.4s, v0.s[0] //v0.s0 é o valor de k, já que os registos S e V são o mesmo
        str q1, [x0], #16
        sub x1, x1, #1
        b ciclo

end:    ldp x29,x30,[sp],#16
        ret
	
#------------------------------------------------------------------------------------------------------------------------
#c) void msubV(float *P, float *Q, float *R, int n, float k) - fazer P − k × Q

.global msubV
.type msubV, "function"
.text

msubV: 
	stp x29,x30,[sp,#-16]!
        lsr x3, x3, 2
ciclo:

	cbz x3,end
	ldr q1,[x0],#16
	ldr q2,[x1],#16

	fmul v3.4s, v2.4s, v0.s[0]  //k*Q
	fsub v3.4s,v1.4s, v3.4s	 //P -k*Q
	
	str q3,[x2],#16	//armazenando o resultado no vetor 
	sub x3,x3,#1	//atualizando o contador 
	b ciclo

end: 	ldp x29,x30,[sp],#16
	ret

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Questão 2 - long int prodintV(int *R, int *S, int n)

.global prodintV
.type prodintV, "function"
.text

prodintV:
	stp x29,x30,[sp,#-16]!
        lsr x2,x2,#2
        mov x4,#0	//contador

ciclo: 	cbz x2, end
	ldr q1,[x0],#16
	ldr q2,[x1],#16

	mul v1.4s,v1.4s,v2.4s
	addv s3,v1.4s

	smov x3, v3.s[0] 

	add x4,x3,x4
	sub x2,x2,#1
	b ciclo

end: 	mov x0,x4
	ldp x29,x30,[sp],#16
	ret
	
#sem usar processamento paralelo 

.global prodintV
.type prodintV, "function"
.text

prodintV: 
	stp x29,x30,[sp,#-16]!
	mov x5, #0	//soma
ciclo: 	
	cbz x2, fim
	ldr w3,[x0],#4
	ldr w4,[x1],#4
	smaddl x5,x4,x3,x5 //produto interno 
	sub x2,x2,#1
	b ciclo
end:
	mov x0,x5
	ldp x29,x30,[sp],#16
	ret 

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#Questão 3- long int conta_ocorr(char *V, long int n, char val) -> x0,x1,x2
#x3: número de ocorrências 

.global conta_ocorr
.type conta_ocorr, "function"
.text

conta_ocorr:
	stp x29,x30,[sp,#-16]!
	lsr x1,x1,#3 
	mov x3,#0
	
ciclo: 	cbz x1,end
	ldr q0,[x0],#32

	dup v1.8b, w2  //duplica o valor para todo o vetor
	cmeq v2.8b, v1.8b,v0.8b //compara de forma que o vector fique do tipo 111...1|000...0|...

	mov x3,#1	
	dup v1.8b, w3	//criamos um vector 1|1|1|1
	and v2.8b,v1.8b,v2.8b	//fazemos um and o vector em que a comparação feita
	addv s3, v2.8b	//somamos todos os 1's deste vector
		
	smov x4,v3.b[0]	//movemos o resultado para x4
	add x3,x4,x4	//adicionamos o resultado ao anterior
	
	sub x1,x1,#1
	b ciclo

end:	mov x0,x3
	ldp x29,x30,[sp],#16
	ret 


	
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#Questão 4- void incsatV(int *Z, int n, int x) - x0,x1,x2

.global incsatV
.type incsatV, "function"
.text

incsatV:

	stp x29,x30,[sp,#-16]!
	lsr x1,x1,#2
	dup v2.4s,w2	//criando um vetor, onde cada posição assume o valor x
	
ciclo:	cbz x1,end
	ldr q0,[x0]
	
	add v0.4s,v0.4s,v2.4s	
	
	str q0,[x0]
	sub x1,x1,1
	b ciclo

end:	ldp x29,x30,[sp],#16
	ret 
	

