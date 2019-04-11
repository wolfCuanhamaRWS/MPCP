.global min
.type min, %function
.text

max:
 		ldr x3, [x0]
ciclo:  sub x1,x1, 1
		cbz x1, fim
 		add x0,x0, 4
   		ldr x2, [x0]
		cmp x2, x3
		csel x3, x2,x3, lt
		b ciclo
fim: 	mov x0, x3
		ret
