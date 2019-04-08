.global extend;
.type extend, %function
.text

extend:

ciclo:	ldr x2, [x0]
		sxtw x3, w2
		str x3, [x1]
		add x0, x0, 8
		add x1,x1 ,8
		cmp x3, 0
		b.ne ciclo
		ret

