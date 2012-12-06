all: main cumain cublas

cublas: cublas.o
	nvcc --link -o cublas cublas.o -lrt -lcudart -lcublas

cublas.o: cublas.cu
	nvcc --compile --compiler-options -O2 -o cublas.o cublas.cu

cumain: cumain.o
	nvcc --link -o cumain cumain.o -lrt -lcudart -lcublas

cumain.o: main.cu
	nvcc --compile --compiler-options -O2 -o cumain.o main.cu

main: main.o
	gcc -o main main.o -lopenblas

main.o: main.c
	gcc -c main.c

clean:
	rm -f *.o
	rm -f main
	rm -f cumain
	rm -f cublas
