#!/bin/bash
# run this as source xyz.sh
echo " Setting up environment variable for mpich......"
cd ~/Build_WRF/LIBRARIES
echo 'export PATH=$DIR/mpich/bin:$PATH' >>~/.profile
source ~/.profile
#export PATH=$DIR/mpich/bin:$PATH
cd ~/WRF-azure
echo "Calling script9....."
sh ./install9.sh