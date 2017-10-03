#!/bin/bash
#run it as source xyz.sh
echo " Setting environmet variable for netcdf......."
cd ~/Build_WRF/LIBRARIES
#echo 'export PATH=$DIR/netcdf/bin:$PATH' >>~/.profile
#echo 'export NETCDF=$DIR/netcdf' >>~/.profile
#source ~/.profile
#export PATH=$DIR/netcdf/bin:$PATH
#export NETCDF=$DIR/netcdf
cd ..
cd ~/WRF-azure
echo "Calling script7....."
sh ./install7.sh
