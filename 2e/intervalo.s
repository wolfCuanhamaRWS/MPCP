.global max_word;
.type max_word, %function
.text

			#w0 = vector address
			#w1 = intervalo inferior
			#w2 = intervalo superior
			#w3 = numero de item no vetor
			#w4 = guarda o valor atual
			#w5 = resposta


max_word:
			mov w5, #0
			cbz w3, fim
inicio: 	ldr w4, [x0]
			cmp w4, w1
			bgt compara
ciclo: 		sub w3, w3, 1
			add w0,w0,4
			cbz w3, fim
			b inicio

fim:		mov w0, w5
			ret

compara:	cmp w4, w2
			blt soma
			b ciclo

soma: 		add w5, w5,1
			b ciclo


