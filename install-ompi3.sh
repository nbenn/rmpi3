#!/bin/sh
set -ex
mkdir openmpi3
cd openmpi3
wget --no-check-certificate https://download.open-mpi.org/release/open-mpi/v3.0/openmpi-3.0.0.tar.gz
tar -zxf openmpi-3.0.0.tar.gz
cd openmpi-3.0.0
./configure --prefix=/usr/openmpi3
sudo make -j 2 all install
cd ..
rm -fr openmpi3