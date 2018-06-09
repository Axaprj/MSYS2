#!/bin/bash

git clone https://github.com/irungentoo/filter_audio
cd filter_audio
git checkout tags/v0.0.1
cd ..


git clone --recursive git://github.com/uTox/uTox.git
cd uTox
git checkout tags/v0.17.0
cd ..


git clone https://git.xiph.org/opus.git
cd opus
git checkout tags/v1.2.1
cd ..


git clone git://github.com/yasm/yasm.git
cd yasm
git checkout tags/v1.3.0
cd ..


git clone https://chromium.googlesource.com/webm/libvpx
cd libvpx
git checkout tags/v1.7.0
cd ..

git clone git://github.com/jedisct1/libsodium.git
cd libsodium
git checkout tags/1.0.16
cd ..
 
git clone --recursive git://github.com/TokTok/c-toxcore.git
cd c-toxcore
git checkout tags/v0.2.2
cd ..

#git clone https://github.com/irungentoo/openal-soft-tox
#mv openal-soft-tox openal-soft
#cd openal-soft
#cd ..
git clone https://github.com/kcat/openal-soft
cd openal-soft
# 1.18.2 windows build bug Unknown arguments: -D_WIN32_WINNT=0x0502
#git checkout tags/openal-soft-1.18.2
cd ..
 
git clone https://github.com/libcheck/check
cd check
git checkout tags/0.10.0
cd ..

