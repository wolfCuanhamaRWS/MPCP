#include <stdio.h>
#include <stdlib.h>

extern int max_word(int* m, int dim);


int main(){

	int vetor[] = {1,-2,10,8};
	int result;

	result = max_word(vetor,4);

	printf("resultado = %d", result);

	return 0;
}

