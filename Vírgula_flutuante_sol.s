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
