.global max_word;
.type max_word, %function
.text

			#w0 = vector address
			#w1 = dimensao
			#w2 = menor valor
			#w3 = valor atual


max_word:
			ldr x2, [x0]

ciclo: 		add w0,w0, 4
			sub w1, w1, 1
			cbz w1, fim
			ldr x3, [x0]
			cmp w2, w3
			csel w2, w2, w3, gt
			b ciclo

fim: 		mov w0, w2
			ret

