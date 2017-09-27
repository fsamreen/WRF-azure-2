#!/bin/bash
echo "Installing gcc, gfortran and g++......"
sudo apt-get update
sudo apt-get install gfortran -y
sudo apt-get install gcc -y
sudo apt-get install g++ -y
which fortran
which gcc
which cpp
gcc --version
gfortran --version
cd ..
mkdir Build_WRF
mkdir TESTS
cd ~/WRF-azure
echo "Calling script2......"
sh ./install2.sh
#echo "This script has just run another script."
