Auteurs : Thomas BLANCHARD, Marc LEGEAY, Florian LÉPINAY, Yann MAVREL.
M2 SILI, M2 ID.
2012-2013
Programmation avancée.

==========================================
0. Implémentations
==========================================

Nous avons choisis d'utiliser l'implémentation OpenBLAS (http://xianyi.github.com/OpenBLAS/) pour utiliser le standard BLAS sur le CPU.

Nous utilisons la librairie CUBLAS fournie avec CUDA pour l'utilisation de BLAS sur le GPU.


==========================================
1. Installation
==========================================

Exécuter le script "install.sh".
L'implémentation OpenBLAS sera installée dans le dossier /opt/OpenBLAS.


==========================================
2. Utilisations
==========================================

Pour lancer les tests, il faut exécuter le script "tests.sh".
Ce script va compiler les sources, puis lancer les tests sur le CPU et le GPU puis afficher les résultats dans gnuplot.

Nous fournissons également des résultats obtenus sur différentes machines, pour les afficher, il faut exécuter la commande :
gnuplot <fichier.gnuplot>

