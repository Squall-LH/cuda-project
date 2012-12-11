#!/bin/bash
# Auteurs : Thomas BLANCHARD, Marc LEGEAY, Florian LÉPINAY, Yann MAVREL.
# M2 SILI, M2 ID.
# 2012-2013
# Programmation avancée.

output="result.txt"

rm -rf $output

make

matrix_sizes=`seq 1024 1024 8192`
for s in $matrix_sizes ; do
	echo "./cublas $s"
	./cublas $s > tmp.txt
	elapsed_cublas=`cat tmp.txt | grep "elapsed=" | cut -d'=' -f2`
	
	echo "./blas $s"
	./blas $s > tmp.txt
	elapsed_blas=`cat tmp.txt | grep "elapsed=" | cut -d'=' -f2`
	
	echo "$s $elapsed_cublas $elapsed_blas" >> $output
	echo "$s $elapsed_cublas $elapsed_blas"
done

rm -rf tmp.txt

gnuplot gnuplot.config

exit 0
