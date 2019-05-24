# FOLHA DE VÍRGULA FLUTUANTE
 
# Questão 1- Escrever fragmentos de código assembly AArch64 que implementem o seguinte código C++: 
  
# a)   double B = 7.8 , M = 3.6 , N = 7.1;  
#	double P = -M * ( N + B );  


.data
VB: .double 7.8
VM: .double 3.6
VN: .double 7.1

.global max_word
.type max_word, "function"
.text

#d0: B
#d1: M
#d2: N

max_word: 	LDR d0, VB
			LDR d1, VM
			LDR d2, VN
			FADD d2,d2,d0
			FNMUL d0, d2, d1
			RET



#--------------------------------------------------------------------------------------------------------------------------

# b) int W = 7; double X = 7.1;  
# double Y = sqrt ( X ) + W ;  

.data
W: .int 7
X: .double 7.1

.global max_word
.type max_word, "function"
.text

max_word: 

LDR w0, W
LDR d0, X

FSQRT d0, d0
UCVTP d1, w0
FADD d0, d0,d1
RET 

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Questão 2 -  Escrever um programa para calcular:

#a)

.data
A: .double 1.5
B: .double 2.5
C: .double 2.0
D: .double 0.5
const: .double 3

.global max_word
.type max_word, "function"
.text

max_word:

LDR d0, A
LDR d1, B
LDR d2, C
LDR d3, D
LDR d4, const

FSUB d1, d0, d1
FMUL d1, d2, d1
FADD d0, d0, d3
FSUB d0, d0, d4
FDIV d0, d1, d0
RET

#--------------------------------------------------------------------------------------------------------------------------
# b) 

.data
pi:  3,141592653

.global max_word
.type max_word, "function"
.text

max_word:

STP x29, x30, [sp, #-16]!
LDR d1, pi
FMUL d0,d0,d0
FMUL d0,d0,d1 
LDP x29, x30, [sp], #16 
RET 
#--------------------------------------------------------------------------------------------------------------------------
# c)

.data
x1: .double 0
x2: .double 3
y1: .double 0
y2: .double 3

.global max_word
.type max_word, "function"
.text

max_word:

LDR d0, x1
LDR d1, x2
LDR d2, y1
LDR d3, y2

FSUB d0, d0, d1
FSUB d2, d2, d3
FMUL d0,d0,d0
FMUL d2,d2,d2
FADD d0,d0,d2
FSQRT d0,d0
RET


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#Questão 3 - Considere o polinómio p(x) = 1,5 x^3−12,5 x+ 7. Escreva a sub-rotina calc_poly_tab que calcula o
#polinómio para valores de x pertencentes a {0; 0,1; 0,2; · · · ; 9,9; 10} (ao todo são 101 valores). Assumir
#que para executar esta sub-rotina é chamada a função em C com o protótipo

#void calc_poly_tab(float *tab)

#em que tab é o vetor a ser preenchido com os valores p(0), p(0,1), · · · , p(9,9) e p(10).

.data
const_1.5: .float 1.5
const_12.5: .float 12.5
const_7: .float 7
const_0: .float 0
const_0.1: .float 0.1

.global max_word
.type max_word, "function"
.text

max_word:
stp x29,x30,[sp,#-16]!

ldr s7, const_1.5
ldr s8, const_12.5
ldr s9, const_7
ldr s10, const_0
ldr s11, const_0.1
mov x1, 101  //contador
fmov s1, s10

begin:
		cbz x1, end
		fmul s2, s1, s1
		fmul s2, s2, s1 //calcula x^3
		fmul s2, s2, s7 //calcula 1.5*x^3
		fnmul s3, s1, s8 //calcula -12.5*x
		fadd s2, s2, s1
		fadd s2, s2, s9
		str s2, [x0]
		add x0, x0, #4
		fadd s1, s1, s11
		sub x1, x1, 1
		b begin
end: 	ldp x29, x30, [sp], #16
