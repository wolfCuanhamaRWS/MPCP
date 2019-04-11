.global programa
.type programa, %function 
.text


programa:	
	ldr x1, [x0] 
	rev x2, x2   <=== atention 
	cmp x2, x1
	cset w0, eq
	ret 
 
