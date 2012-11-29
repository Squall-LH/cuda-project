all: main

main: main.o
	gcc -o main main.o -lopenblas

main.o: main.c
	gcc -c main.c 
