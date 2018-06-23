#!/bin/sh
set -ex
cd ..
mkdir openmpi3
cd openmpi3
OMP_DIR=$(pwd)
wget --no-check-certificate https://download.open-mpi.org/release/open-mpi/v3.0/openmpi-3.0.0.tar.gz
tar -zxf openmpi-3.0.0.tar.gz
cd openmpi-3.0.0
./configure --prefix=$OMP_DIR
make all install
echo "done with installing openMPI"
