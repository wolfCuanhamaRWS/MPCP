.global extend;
.type extend, %function
.text

extend:

ciclo:	cbz x2, fim
		ldrsw x9, [x0]
		str x9, [x1]
		add x0, x0 , 4
		add x1, x1, 8
		sub x2, x2, 1
		b ciclo

fim: 	ret
