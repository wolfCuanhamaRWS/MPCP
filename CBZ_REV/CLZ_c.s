programa:

ciclo: 
	rbit w1,w0
	cmp w0,w1
	b.eq simetrico
	mov x0,0
	ret
	simetrico mov x0, 1
	ret



OU 

ciclo:  
	rbit w1,w0
	cmp w0,w1
 	cset w0, e1
	ret

