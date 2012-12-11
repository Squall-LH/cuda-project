# Auteurs : Thomas BLANCHARD, Marc LEGEAY, Florian LÉPINAY, Yann MAVREL.
# M2 SILI, M2 ID.
# 2012-2013
# Programmation avancée.

all: blas cublas

cublas: cublas.o
	nvcc --link -o cublas cublas.o -lrt -lcudart -lcublas

cublas.o: cublas.cu
	nvcc --compile --compiler-options -O2 -o cublas.o cublas.cu

blas: blas.o
	gcc -o blas blas.o -lopenblas

blas.o: blas.c
	gcc -c -O3 blas.c

clean:
	rm -f *.o
	rm -f blas
	rm -f cublas
