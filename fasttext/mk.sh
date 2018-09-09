#!/bin/bash

cd fastText
# make clean
make CXXFLAGS='-pthread -std=c++0x -march=native -static'

cd ..
