#!/bin/bash
echo " configuring libpng ......"
cd ~/Build_WRF/LIBRARIES
tar xzvf libpng-1.2.50.tar.gz     #or just .tar if no .gz present
cd libpng-1.2.50
./configure --prefix=$DIR/grib2
make
make install
cd ..
cd ~/WRF-azure
echo "Calling script12....."
sh ./install12.sh