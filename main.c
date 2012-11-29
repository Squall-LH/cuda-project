/* 
BLAS.c     brett becker    12/09/2005
performs a 1000x1000 matrix matrix multiplication using the BLAS library when compiled with the following lines:

gcc -c -O3 -I/home/bbecker/local/CBLAS/src/ BLAS.c
g77 -o BLAS BLAS.o /home/bbecker/local/CBLAS/lib/LINUX/cblas_LINUX.a /usr/lib/libblas.a
*/

#include <stdio.h>
#include <stdlib.h>
#include "/opt/include/cblas.h"
#include <time.h>
#include <math.h>

void initMat( int M, int N, double mat[], double val )
{
  int     i, j;
  for (i= 0; i< M; i++)
    for (j= 0; j< N; j++)
      mat[i*N+j] = val;
}

int main()
{

  time_t start, end;
  double *A, *B, *C;
  int N = 1000;
  int i;
  
  //allocate and initialize arrays
  A = malloc (N*N*sizeof(double));
  B = malloc (N*N*sizeof(double));
  C = malloc (N*N*sizeof(double));
  if (!A || !B || !C)
    {
      printf( "Out of memory, reduce N value.\n");
      exit(-1);
    }
  initMat(N, N, A, rand());
  initMat(N, N, B, rand());
      
  //multiply
  int numreps = 10;
  start = time(NULL); //begin timing
  for(i=0; i<numreps; i++)
    {
      cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, N, N, N, 1.0, A, N, B, N, 0.0, C, N);
    }
  end = time(NULL); //end timing

  //print time
  double elapsed = (double)(end - start) / (double)numreps;
  printf("elapsed time = %f seconds.\n", elapsed);
  
  free(A); 
  free(B); 
  free(C);
 
  return 0;
}

