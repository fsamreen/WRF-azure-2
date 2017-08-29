#!/bin/bash
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
sudo mkdir Build_WRF
sudo mkdir TESTS
