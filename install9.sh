#!/bin/bash
# run as source xyz.sh as this is to set as enviroenmental variables.
echo " Setting up environment variables for Zlib and WPS ..grib2......"
cd ~/Build_WRF/LIBRARIES
echo 'export LDFLAGS=-L$DIR/grib2/lib' >>~/.profile
echo 'export CPPFLAGS=-I$DIR/grib2/include' >>~/.profile
echo 'export JASPERLIB=$DIR/grib2/lib' >>~/.profile
echo 'export JASPERINC=$DIR/grib2/include' >>~/.profile
source ~/.profile
#setenv JASPERLIB $DIR/grib2/lib
#setenv JASPERINC $DIR/grib2/include
#export LDFLAGS=-L$DIR/grib2/lib 
#export CPPFLAGS=-I$DIR/grib2/include 
cd ~/WRF-azure
echo "Calling script10....."
sh ./install10.sh