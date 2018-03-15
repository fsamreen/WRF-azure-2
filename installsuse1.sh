#!/bin/bash
#mkdir LIBRARIES
cd ~/Build_WRF/LIBRARIES
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/mpich-3.0.4.tar.gz
sleep 5
wget http://archive.ubuntu.com/ubuntu/pool/universe/m/mpich/mpich_3.2.orig.tar.gz
sleep 5
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/netcdf-4.1.3.tar.gz
sleep 5
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/jasper-1.900.1.tar.gz
sleep 5
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/libpng-1.2.50.tar.gz
sleep 5
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/zlib-1.2.7.tar.gz
sleep 5
cd ~/Build_WRF/LIBRARIES
tar xzvf netcdf-4.1.3.tar.gz     #or just .tar if no .gz present
cd netcdf-4.1.3
./configure --prefix=$DIR/netcdf --disable-dap --disable-netcdf-4 --disable-shared
sleep 5
make
sleep 5
make install
sleep 5
cd ~/Build_WRF/LIBRARIES
tar xzvf mpich-3.0.4.tar.gz
cd mpich-3.0.4
./configure --prefix=$DIR/mpich
sleep 5
make
sleep 5
make install
sleep 5
cd ~/Build_WRF/LIBRARIES
tar xzvf zlib-1.2.7.tar.gz     #or just .tar if no .gz present
cd zlib-1.2.7
./configure --prefix=$DIR/grib2
sleep 5
make
sleep 5
make install
sleep 5
cd ~/Build_WRF/LIBRARIES
tar xzvf libpng-1.2.50.tar.gz     #or just .tar if no .gz present
cd libpng-1.2.50
./configure --prefix=$DIR/grib2
sleep 5
make
sleep 5
make install
sleep 5
cd ~/Build_WRF/LIBRARIES
tar xzvf jasper-1.900.1.tar.gz     #or just .tar if no .gz present
cd jasper-1.900.1
./configure --prefix=$DIR/grib2
sleep 5
make
sleep 5
make install
sleep 5
cd ~/TESTS
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/Fortran_C_NETCDF_MPI_tests.tar
tar -xf Fortran_C_NETCDF_MPI_tests.tar
#Test #1: Fortran + C + NetCDF
#The NetCDF-only test requires the include file from the NETCDF package be in this directory. Copy the file here:
cp ${NETCDF}/include/netcdf.inc .
#Compile the Fortran and C codes for the purpose of this test (the -c option says to not try to build an executable). Type the following commands:
gfortran -c 01_fortran+c+netcdf_f.f
gcc -c 01_fortran+c+netcdf_c.c
gfortran 01_fortran+c+netcdf_f.o 01_fortran+c+netcdf_c.o -L${NETCDF}/lib -lnetcdff -lnetcdf
./a.out | tee -a ~/wrflog.txt
#The following should be displayed on your screen:
#C function called by Fortran
#Values are xx = 2.00 and ii = 1
#SUCCESS test 1 fortran + c + netcdf
#Test #2: Fortran + C + NetCDF + MPI
cp ${NETCDF}/include/netcdf.inc .
mpif90 -c 02_fortran+c+netcdf+mpi_f.f
mpicc -c 02_fortran+c+netcdf+mpi_c.c
mpif90 02_fortran+c+netcdf+mpi_f.o 02_fortran+c+netcdf+mpi_c.o -L${NETCDF}/lib -lnetcdff -lnetcdf
mpirun ./a.out | tee -a ~/wrflog.txt
##C function called by Fortran
#Values are xx = 2.00 and ii = 1
#status = 2
#SUCCESS test 2 fortran + c + netcdf + mpi
