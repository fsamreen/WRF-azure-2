#!/bin/bash
sudo apt-get install perl
sudo apt-get install m4
cd ~/Build_WRF
wget http://www2.mmm.ucar.edu/wrf/src/WRFV3.9.1.1.TAR.gz .
gunzip WRFV3.9.1.1.TAR.gz
tar -xf WRFV3.9.1.1.TAR
cd WRFV3
./configure

