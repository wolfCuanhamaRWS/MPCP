.global leading_zeros
.type leading_zeros, %function
.text

leading_zeros:

ciclo: 	clz x2, x0  ; counting leading zeros by left
		mov x3, 63
		sub x0, 63
		sub x0, x3, x2
		ret

