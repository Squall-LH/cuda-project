# Auteurs : Thomas BLANCHARD, Marc LEGEAY, Florian LÉPINAY, Yann MAVREL.
# M2 SILI, M2 ID.
# 2012-2013
# Programmation avancée.

### Titre du graphique
set title "Temps d'exécution en fonction de la taille des matrices"

### On affiche la grille
set grid

### Abscisses
# Nom
set xlabel "Taille des matrices"
# Échelle
set xtics 0, 1024, 8192
# Style
set style line 1 linecolor rgb "red"

### Ordonnées
# Nom
set ylabel "Temps d'exécution (sec)"
# Style
set style line 2 linecolor rgb "blue"

### Affichage
plot "result.txt" using 1:2 ls 1 t "CUBLAS",\
     "result.txt" using 1:3 ls 2 t "BLAS"

### On garde la fenêtre ouverte
pause -1 "Appuyer sur <RETURN> pour quitter gnuplot ..."
