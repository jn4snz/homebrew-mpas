#!/usr/bin/env bash

brew tap homebrew/science
brew tap jn4snz/mpas

brew install gcc@4.8
export FC=/usr/local/bin/gfortran-4.8
brew install hdf5@1.8
brew install mpich
brew install jn4snz/mpas/netcdf --enable-fortran --enable-cxx-compat
brew install jn4snz/mpas/parallel-netcdf
brew install jn4snz/mpas/pio
