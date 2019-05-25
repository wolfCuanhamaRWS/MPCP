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
