#!/bin/bash
echo "Configuring mpich........"
cd ~/Build_WRF/LIBRARIES
tar xzvf mpich-3.0.4.tar.gz
cd mpich-3.0.4
./configure --prefix=$DIR/mpich
make
make install
cd ~/WRF-azure
echo "Calling script8....."
sh ./install8.sh