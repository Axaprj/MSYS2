#!/bin/bash

echo "*****MINGW"
echo "MINGW_CHOST=$MINGW_CHOST"
echo "MINGW_PREFIX=$MINGW_PREFIX"

cd uTox
rm -r cb-build
mkdir cb-build
cd cb-build

echo "*****MINGW CodeBlocks - Unix Makefiles Debug"
export CFLAGS="-I/usr/include -I/usr/local/include"
export LDFLAGS="-L/usr/lib -L/usr/local/lib"
export LD_LIBRARY_PATH="/usr/lib"
export PKG_CONFIG_PATH="/usr/lib/pkgconfig"
#export LIBS='-lOpenAL32 -liphlpapi'
cmake -G "CodeBlocks - Unix Makefiles" \
	-DCMAKE_BUILD_TYPE=Debug \
	-DUTOX_STATIC=True \
	-DFILTER_AUDIO=True \
	-DTOXCORE_STATIC=False \
	-DCMAKE_TOOLCHAIN_FILE=./../../utox-toolchain-$MINGW_PREFIX.cmake  \
    ..                                                
