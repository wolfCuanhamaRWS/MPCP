#include <stdio.h>
extern int max(int* v, int dim);
extern int min(long int* v, int dim);
//extern int interval(long int* v, int dim, int valor1, valor 2);

int main(){
	int vetor[] = {8,9,0,-1,20};
	long int vetor1[] = {1,0,-4,9,12,200,-4,-7};
	int valor1 = 0;
	int valor2 = 30;
	int menor, maior;

	maior = max(vetor, 5);
	menor = min(vetor1, 8);

	printf("maior = %d, menor = %d \n", maior, menor);


}
