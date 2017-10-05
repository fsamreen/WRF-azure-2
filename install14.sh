#!/bin/bash
sudo apt-get install perl
sudo apt-get install m4
cd ~/Build_WRF
wget http://www2.mmm.ucar.edu/wrf/src/WRFV3.9.1.1.TAR.gz .
gunzip WRFV3.9.1.1.TAR.gz
tar -xf WRFV3.9.1.1.TAR
echo " Download WPS......"
cd ~/Build_WRF
wget http://www2.mmm.ucar.edu/wrf/src/WPSV3.9.TAR.gz .
gunzip WPSV3.9.TAR.gz
tar -xvf WPSV3.9.TAR
#cd WPS
#./configure
cd ~/Build_WRF
cd WRFV3
./configure
#http://www2.mmm.ucar.edu/wrf/src/WPSV3.8.1.TAR.gz
