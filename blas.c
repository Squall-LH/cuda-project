/*
* Auteurs : Thomas BLANCHARD, Marc LEGEAY, Florian LÉPINAY, Yann MAVREL.
* M2 SILI, M2 ID.
* 2012-2013
* Programmation avancée.
*/

/*
BLAS.c brett becker 12/09/2005
performs a 1000x1000 matrix matrix multiplication using the BLAS library when compiled with the following lines:

gcc -c -O3 -I/home/bbecker/local/CBLAS/src/ BLAS.c
g77 -o BLAS BLAS.o /home/bbecker/local/CBLAS/lib/LINUX/cblas_LINUX.a /usr/lib/libblas.a
*/

#include <stdio.h>
#include <stdlib.h>
#include "/opt/OpenBLAS/include/cblas.h"
#include <time.h>
#include <math.h>

void initMat( int M, int N, double mat[])
{
  int i, j;
  for (i= 0; i< M; i++)
    for (j= 0; j< N; j++)
      mat[i*N+j] = rand() / (float)RAND_MAX;
}

int main(int argc, char **argv)
{

  time_t start, end;
  double *A, *B, *C;
  int N = 1024;
  int i;
  
  if(argc < 2) {
   printf("Pas de taille de matrice particulière indiquée en paramètre.\nTaille par défaut: %d\n", N);	
} else {
N = atoi(argv[1]);
    printf("N: %d\n", N);
  }
  
  //allocate and initialize arrays
  A = malloc (N*N*sizeof(double));
  B = malloc (N*N*sizeof(double));
  C = malloc (N*N*sizeof(double));
  if (!A || !B || !C)
    {
      printf( "Out of memory, reduce N value.\n");
      exit(-1);
    }
  initMat(N, N, A);
  initMat(N, N, B);
      
  //multiply
  start = clock(); //begin timing
  cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, N, N, N, 1.0, A, N, B, N, 0.0, C, N);
  end = clock(); //end timing

  //print time
  double elapsed = (double)(end - start) / 1e6;
  printf("elapsed=%lf\n", elapsed);
  
  free(A);
  free(B);
  free(C);
 
  return 0;
}

