/*
 ============================================================================
 Name        : MPCP.c
 Author      : Jumaruba
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
extern int SOMA_V(int *a, int n);
int main(void)
{
int dim = 5;
int v[] = {3, -1, 8, 0, -3}; // Para testar
int res;
res = SOMA_V(v, dim);
printf("Soma dos elementos = %d\n", res);
return EXIT_SUCCESS;
}
