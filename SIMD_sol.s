#FOLHA DE PROCESSAMENTO PARALELO 

# Questão 01 - 

#a) void somaV (float *p, float *q, float *r, int n) - x0, x1, x2 & x3. Como é float, usaremos S que contém 4bytes cada. 

.text 
.global somaV
.type somaV, "function" 

somaV: 
        lsr x3, x3, 2  //estamos fazendo 4 operações em um ciclo 
ciclo:  cbz x3, end
        ldr q0, [x0], #16
        ldr q1, [x1], #16
        
        fadd v2.4s, v1.4s, v0.4s  // somando 4 números em paralelo
        
        str q2, [x2], #16 //armazenando o resultado 
        sub x3, x3, #1  //atualizando o contador
        b ciclo
        ret 
