#!/bin/bash

echo "*****MINGW"
echo "MINGW_CHOST=$MINGW_CHOST"
echo "MINGW_PREFIX=$MINGW_PREFIX"

cd uTox

arch=64
host=1
fast=0
debug=0
legacy=0

# Build Environment
MINGW32_LIB_DIR="/$MINGW_PREFIX/$MINGW_CHOST/lib"

# Other options
if [[ $debug  == 1 ]]; then
    COMP_OPTs="-ggdb"
    echo "Building with debugging info"
elif [[ $fast == 1 ]]; then
    COMP_OPTs="-s -O0"
    echo "Quick build (without optimizations)"
else
    COMP_OPTs="-Ofast"
    POST_BUILD="strip -s --strip-all utox.exe"  
fi

if [[ $legacy == 1 ]]; then
    COMP_OPTs+=" -D __WIN_LEGACY=1"
    echo "Compiling for windows XP"
fi

LIBTOXCORE="/usr"
LIBNACL="/usr"
LIBVPX="/usr/local"
LIBOPUS="/usr"
LIBOPENAL="/usr" 

GIT_V=$(git describe --abbrev=8 --dirty --always --tags)
echo "Git version: $GIT_V"

# Build filter_audio
AUDIO_FILTERING_BUILD="-DAUDIO_FILTERING -I ./lib/filter_audio/ ./lib/filter_audio/filter_audio.c \
./lib/filter_audio/aec/*.c ./lib/filter_audio/agc/*.c ./lib/filter_audio/ns/*.c ./lib/filter_audio/other/*.c \
./lib/filter_audio/vad/*.c ./lib/filter_audio/zam/*.c"
AUDIO_FILTERING_BUILD=""

# Remove existing
rm utox.exe 2> /dev/null

# Generate a windows icon
windres icons/icon.rc -O coff -o icon.o

pwd

#    -DGIT_VERSION=\"$GIT_V\" 
#src/ui/draw_helpers.c:305:25: error: 'w' undeclared (first use in this function)
#     drawtextwidth_right(w + SIDEBAR_WIDTH - textwidth(ver_string, count), textwidth(ver_string, count), SCALE(10),
#                         ^

# Compile
gcc -o utox.exe  "$COMP_OPTs"                  \
    -I libs/toktok/include/                                         \
-DAL_LIBTYPE_STATIC                    \
    src/*.c src/ui/*.c src/av/*.c src/windows/*.c icon.o            \
    $LIBTOXCORE/lib/libtoxcore.a                                    \
    $LIBTOXCORE/lib/libtoxav.a                                      \
    $LIBTOXCORE/lib/libtoxdns.a                                     \
    $LIBTOXCORE/lib/libtoxencryptsave.a                             \
    $LIBNACL/lib/libsodium.a             -I $LIBNACL/include/       \
    $LIBVPX/lib/libvpx.a                 -I $LIBVPX/include/        \
    $LIBOPUS/lib/libopus.a               -I $LIBOPUS/include/       \
    $LIBOPENAL/lib/libOpenAL32.a         -I $LIBOPENAL/include/     \
    $MINGW32_LIB_DIR/libwinpthread.a                                \
    -liphlpapi -lws2_32 -lgdi32 -lmsimg32 -ldnsapi -lcomdlg32       \
    -Wl,-subsystem,windows -lwinmm -lole32 -loleaut32 -lstrmiids

$POST_BUILD

cd ..
