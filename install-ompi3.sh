#!/bin/sh
set -ex
if [ -z "$(ls -A $OMPI_DIR)" ]; then
  cd $OMPI_DIR
  wget --no-check-certificate https://download.open-mpi.org/release/open-mpi/v3.0/openmpi-3.0.0.tar.gz
  tar -zxf openmpi-3.0.0.tar.gz
  cd openmpi-3.0.0
  ./configure --prefix=$OMPI_DIR
  make all install
  cd ..
  rm -rf openmpi-3.0.0 openmpi-3.0.0.tar.gz
  echo "installed openMPI to $(pwd)"
else
  echo "using cached openMPI from $OMPI_DIR"
fi
