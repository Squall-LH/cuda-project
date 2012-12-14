#!/bin/bash
# Auteurs : Thomas BLANCHARD, Marc LEGEAY, Florian LÉPINAY, Yann MAVREL.
# M2 SILI, M2 ID.
# 2012-2013
# Programmation avancée.

output="result.txt"
rm -rf $output

# On s'assure que les exécutables sont compilés
make

# Tailles de 1024 à 8192 par pas de 1024
matrix_sizes=`seq 1024 1024 8192`
for s in $matrix_sizes ; do
	ret=1
	nb_try=1
	while [ $ret -ne 0 ] && [ $nb_try -le 3 ] ; do
		echo "./cublas $s"
		./cublas $s > tmp.txt
		ret=$?
		((nb_try++))
	done
	
	elapsed_cublas=`cat tmp.txt | grep "elapsed=" | cut -d'=' -f2`
	
	ret=1
	nb_try=1
	while [ $ret -ne 0 ] && [ $nb_try -le 3 ] ; do
		echo "./blas $s"
		./blas $s > tmp.txt
		ret=$?
		((nb_try++))
	done
	
	elapsed_blas=`cat tmp.txt | grep "elapsed=" | cut -d'=' -f2`
	
	echo "$s $elapsed_cublas $elapsed_blas" >> $output
	echo "$s $elapsed_cublas $elapsed_blas"
done

rm -rf tmp.txt

# Affichage du graphique
gnuplot result.gnuplot

exit 0
