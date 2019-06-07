#Questão 1 - Escreva um programa que leia 2 valores X e Y e que armazene num vetor m todos os valores entre eles cujo resto da divisão 
#dele por 5 for igual a 2 ou igual a 3. void div(long int x, long int y, long int *m).

#original from: https://www.urionlinejudge.com.br/judge/pt/problems/view/1133

#x4 quantidade de números a serem analisados 

.global div
.type div, "function" 
.text 

div: 	
        stp x29,x30,[sp,#-16]!
        sub x4, x1, x0
        sub x4,x4,1
        mov x5,#5

ciclo:	cbz x4, end
        add x0,x0,1

        sdiv x3,x0,x5	//x3 = quociente do número na divisão por 5
        mul x3,x3,x5	//x3 = quociente*5
        sub x3,x0,x3	//x3 = resto da divisão por 5

        cmp x3, 2
        beq adic

        cmp x3,3
        beq adic

        sub x4,x4,1
        b ciclo


adic:	str x0,[x2],#8
      sub x4,x4,1
      b ciclo



end: 	ret
