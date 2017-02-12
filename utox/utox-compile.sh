#!/bin/bash

echo "*****MINGW"
echo "MINGW_CHOST=$MINGW_CHOST"
echo "MINGW_PREFIX=$MINGW_PREFIX"

cd uTox
rm -r build
mkdir build
cd build
#MINGW_CHOST="i686-w64-mingw32"
#MINGW_CHOST="x86_64-w64-mingw32"
#MINGW_PREFIX="mingw32"
#MINGW_PREFIX="mingw64"
#	-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER \
#	-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY= ONLY  \
#	-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY   \
 
#export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/$MINGW_PREFIX/lib/pkgconfig:/usr/lib/pkgconfig
#echo $PKG_CONFIG_PATH
#cmake --help > ./../../cmake.txt
export CFLAGS="-I/usr/include -I/usr/local/include"
export LDFLAGS="-L/usr/lib -L/usr/local/lib"
export LD_LIBRARY_PATH="/usr/lib"
export PKG_CONFIG_PATH="/usr/lib/pkgconfig"
#export LIBS='-lOpenAL32 -liphlpapi'
cmake -G "MSYS Makefiles" \
	-DCMAKE_BUILD_TYPE=Release \
	-DUTOX_STATIC=True \
	-DFILTER_AUDIO=True \
	-DTOXCORE_STATIC=False \
	-DCMAKE_TOOLCHAIN_FILE=./../../utox-toolchain-$MINGW_PREFIX.cmake  \
    ..
make
