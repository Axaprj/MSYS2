#!/bin/bash
#echo "$PATH"

echo "*****MINGW"
echo "MINGW_CHOST=$MINGW_CHOST"
echo "MINGW_PREFIX=$MINGW_PREFIX"

pwd
echo "*****toxcore"
cd c-toxcore
autoreconf -if
#export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:'/usr/lib/pkgconfig/'
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:'/usr/local/lib/pkgconfig/'
export LIBSODIUM_CFLAGS='-I/usr/include'
export LIBSODIUM_LDFLAGS='-L/usr/lib'
export LIBS='-lws2_32 -liphlpapi'
./configure --disable-rt --disable-testing
make
make install
cd ..

#exit

pwd
echo "*****filter_audio"
cd filter_audio 
make install -f ../filter-audio.make 
cd ..

#exit

pwd
echo "*****openal-soft "
cd openal-soft
rm -r build
mkdir build
cd build
#MINGW_CHOST="i686-w64-mingw32"
#MINGW_CHOST="x86_64-w64-mingw32"
#MINGW_PREFIX="mingw32"
#MINGW_PREFIX="mingw64"
export DXSDK_DIR=${MINGW_PREFIX}/${MINGW_CHOST}
MSYS2_ARG_CONV_EXCL="-DCMAKE_INSTALL_PREFIX=" 
cmake -G "MSYS Makefiles" \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DALSOFT_EXAMPLES=OFF \
    -DLIBTYPE=STATIC \
    -DDSOUND_INCLUDE_DIR=${MINGW_PREFIX}/${MINGW_CHOST}/include \
    -DDSOUND_LIBRARY=${MINGW_PREFIX}/${MINGW_CHOST}/lib/libdsound.a \
    ..

make
make install
cd ../..

#exit

pwd
echo "*****uTox"
./utox-compile.sh 

echo "*****DONE"
