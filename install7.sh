#!/bin/bash
cd ~/Build_WRF/LIBRARIES
tar xzvf mpich-3.0.4.tar.gz
cd mpich-3.0.4
./configure --prefix=$DIR/mpich
make
make install
