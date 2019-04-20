#include <stdio.h>
#include <stdlib.h>

extern int max_word(int* vetor, int inferior, int superior, int dim);


int main(){

	int vetor[] = {1,-2,10,8,100,40,41,2,3,60,74,77};
	int result;

	result = max_word(vetor,1,11,12);

	printf("resultado = %d", result);

	return 0;
}

