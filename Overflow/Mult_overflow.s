




programa: EOR x11,x11,x11
	  cbz w9, [x0] 
	  ldr w10, [x1] 
	  smaddl x1, w9, w10, x11 ; w9*w10+x11 = x1 
	  add x0,x0 4
	  add x1, x1, 
 	  sub x1, x2,, 1
	  b ciclo 
fim: 	  mov x0, x11
	  ret 

