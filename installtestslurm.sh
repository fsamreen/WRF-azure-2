#!/bin/bash
# 
# install gcc, gfortran and g++......
echo "Installing gcc, gfortran and g++......"
sudo apt-get update
sudo apt-get install -y gfortran gcc g++ make m4
sudo apt-get install nfs-server
sudo apt-get install openssh-server

sudo mkdir /wrfstorage
echo "/wrfstorage    *(rw,async)" >> /etc/exports

sudo service nfs-kernel-server restart
sudo chown wrfuser /wrfstorage
#sudo apt-get install gfortran -y
#sudo apt-get install gcc -y
#sudo apt-get install g++ -y

# Install the python package manager and other dependecies.
#sudo apt-get install -y python-pip build-essential libssl-dev libffi-dev python-dev
# Install image conversion utility.
#sudo apt-get install -y imagemagick
# install the azure package for Python.
#pip install azure==0.11.1 azure-storage==0.20.0
# Get the blob copy utility for Python.

for node in $(sinfo -o "%n" -h|grep -v `hostname`)
do

  ssh wrfser@$node sudo apt-get -y install gfortran gcc g++ make m4 nfs-client openssh-server
  #ssh azureuser@$node sudo apt-get -y install imagemagick
  #ssh azureuser@$node pip install azure==0.11.1 azure-storage==0.20.0

  #scp slurmdemo.py azureuser@$node:~
  #scp slurmdemo.sh azureuser@$node:~

  #ssh azureuser@$node wget 'https://raw.githubusercontent.com/Wintellect/blobxfer/master/blobxfer-0.9.9.10.py'

done
