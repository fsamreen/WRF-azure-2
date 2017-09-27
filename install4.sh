#!/bin/bash
# run this code as source xy.sh
echo " Setting up environmental Variables for gcc, gfortran and g++........"
echo 'export DIR=~/Build_WRF/LIBRARIES' >>~/.profile
echo 'export CC=gcc' >>~/.profile
echo 'export CXX=g++' >>~/.profile
echo 'export FC=gfortran' >>~/.profile
echo 'export FCFLAGS=-m64' >>~/.profile
echo 'export F77=gfortran' >>~/.profile
echo 'export FFLAGS=-m64' >>~/.profile
source ~/.profile
#export DIR=~/Build_WRF/LIBRARIES
#export CC=gcc
#export CXX=g++
#export FC=gfortran
#export FCFLAGS=-m64
#export F77=gfortran
#export FFLAGS=-m64
cd ~/WRF-azure
echo "Calling script5....."
sh ./install5.sh