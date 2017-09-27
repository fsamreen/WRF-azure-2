#!/bin/bash
echo " Download and configure WRF......"
cd ~/Build_WRF
wget http://www2.mmm.ucar.edu/wrf/src/WPSV3.9.TAR.gz .
gunzip WPSV3.9.TAR.gz
tar -xvf WPSV3.9.TAR
cd WPS
./configure

