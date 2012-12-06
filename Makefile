all: main cumain

cumain: cumain.o
	nvcc --link -o cumain cumain.o -lrt -lcudart -lcublas

cumain.o: main.cu
	nvcc --compile --compiler-options -O2 -o cumain.o main.cu

main: main.o
	gcc -o main main.o -lopenblas

main.o: main.c
	gcc -c main.c 
