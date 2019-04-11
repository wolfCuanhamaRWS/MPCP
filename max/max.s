.global max
.type max, %function
.text

max:
 		ldr w3, [x0]
ciclo:  sub w1,w1, 1
		cbz x1, fim
 		add x0,x0, 4
   		ldr w2, [x0]
		cmp w2, w3
		csel w3, w2,w3, gt
		b ciclo
fim: 	mov x0, x3
		ret


