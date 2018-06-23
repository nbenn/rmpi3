#!/bin/sh
set -ex
ls
pwd
mkdir openmpi3
cd openmpi3
wget --no-check-certificate https://download.open-mpi.org/release/open-mpi/v3.0/openmpi-3.0.0.tar.gz
tar -zxf openmpi-3.0.0.tar.gz
cd openmpi-3.0.0
./configure --prefix=/usr/openmpi3
sudo make all install
echo "done with install"
cd ..
ls
rm -rf openmpi3
