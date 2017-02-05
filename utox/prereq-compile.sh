#!/bin/bash
#echo "$PATH"

echo "*****yasm"
cd yasm
./autogen.sh
./configure
make
make check
make install
make clean
cd ..

echo "*****libvpx"
cd libvpx
./configure
make
make install
cd ..

echo "*****opus"
cd opus
./autogen.sh
./configure
make
make install
cd ..

echo "*****libsodium"
cd libsodium
./autogen.sh
./configure 
make check
make 
make install
cd ..

echo "*****check"
cd check
autoreconf -if
./configure   
#--disable-subunit
make
make check
make install
cd ..

echo "*****DONE"