#include <stdio.h>
extern void extend(int* n2, long int* n, int dim);

int main(void)
{
	int vetor1[] = {1,2,-3,-4,-5,0};
	long int vetor2[6];

	extend(vetor1, vetor2, 6);

	for (int i = 0; i< 6; i++){
		printf("v[%d] = %lld\n", i, vetor2[i]);
	}
	return 0;

}
