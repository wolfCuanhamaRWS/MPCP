#include <stdio.h>
extern int extend(long int* n2, long long int* n);

int main(void)
{
	long int vetor1[] = {1,2,-3,-4,-5,0};
	long long int vetor2[6];

	extend(vetor1, vetor2);

	for (int i = 0; i< 6; i++){
		printf("v[%d] = %lld\n", i, vetor2[i]);
	}
	return 0;

}
