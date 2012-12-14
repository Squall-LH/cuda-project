#!/bin/bash
# Auteurs : Thomas BLANCHARD, Marc LEGEAY, Florian LÉPINAY, Yann MAVREL.
# M2 SILI, M2 ID.
# 2012-2013
# Programmation avancée.

mkdir installation
cd installation

echo "Installation de gFortran ..."
sudo apt-get install gfortran

echo "Téléchargement d'OpenBLAS ..."
wget http://github.com/xianyi/OpenBLAS/tarball/v0.2.5 -O openblas.tar

echo "Installation d'OpenBLAS ..."
tar xvf openblas.tar
cd xianyi-OpenBLAS-93dd133

make
sudo make PREFIX=/opt/OpenBLAS install

echo "Suppression des fichiers temporaires ..."
cd ../..
rm -rf installation

echo "Installation terminée."

exit 0

