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
if [ "$MINGW_PREFIX" == "mingw64" ]; then
./dist-build/msys2-win64.sh
else
./dist-build/msys2-win32.sh
fi
#./autogen.sh
#./configure 
#make check
#make 
#make install
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