#!/bin/bash
cd /home/Build_WRF
mkdir LIBRARIES
cd LIBRARIES
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/mpich-3.0.4.tar.gz
wget http://archive.ubuntu.com/ubuntu/pool/universe/m/mpich/mpich_3.2.orig.tar.gz
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/netcdf-4.1.3.tar.gz
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/jasper-1.900.1.tar.gz
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/libpng-1.2.50.tar.gz
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/zlib-1.2.7.tar.gz
echo "Configuring netcdf........"
cd /home/Build_WRF/LIBRARIES
tar xzvf netcdf-4.1.3.tar.gz     #or just .tar if no .gz present
cd netcdf-4.1.3
./configure --prefix=/home/Build_WRF/LIBRARIES/netcdf --disable-dap --disable-netcdf-4 --disable-shared
apt-get install make -y
make
make install
echo "Configuring mpich........"
cd /home/Build_WRF/LIBRARIES
tar xzvf mpich-3.0.4.tar.gz
cd mpich-3.0.4
./configure --prefix=/home/Build_WRF/LIBRARIES/mpich
make
make install
echo "Configuring Zlib........"
cd /home/Build_WRF/LIBRARIES
tar xzvf zlib-1.2.7.tar.gz     #or just .tar if no .gz present
cd zlib-1.2.7
./configure --prefix=/home/Build_WRF/LIBRARIES/grib2
make
make install
echo "Configuring libpng........"
cd /home/Build_WRF/LIBRARIES
tar xzvf libpng-1.2.50.tar.gz     #or just .tar if no .gz present
cd libpng-1.2.50
./configure --prefix=/home/Build_WRF/LIBRARIES/grib2
make
make install
echo " Configure jasper....."
cd /home/Build_WRF/LIBRARIES
tar xzvf jasper-1.900.1.tar.gz     #or just .tar if no .gz present
cd jasper-1.900.1
./configure --prefix=/home/Build_WRF/LIBRARIES/grib2
make
make install
