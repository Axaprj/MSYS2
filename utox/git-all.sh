#!/bin/bash

git clone https://github.com/irungentoo/filter_audio
cd filter_audio
git checkout tags/v0.0.1
cd ..


git clone git://github.com/uTox/uTox.git
cd uTox
git checkout tags/v0.13.1
cd ..


git clone https://git.xiph.org/opus.git
cd opus
git checkout tags/v1.1.2
cd ..


git clone git://github.com/yasm/yasm.git
cd yasm
git checkout tags/v1.3.0
cd ..


git clone https://chromium.googlesource.com/webm/libvpx
cd libvpx
git checkout tags/v1.6.1
cd ..

git clone git://github.com/jedisct1/libsodium.git
cd libsodium
git checkout tags/1.0.3
cd ..
 
git clone git://github.com/TokTok/c-toxcore.git
cd c-toxcore
git checkout tags/v0.1.6 
cd ..

git clone https://github.com/irungentoo/openal-soft-tox
mv openal-soft-tox openal-soft
#git clone https://github.com/kcat/openal-soft
cd openal-soft
#git checkout tags/openal-soft-1.17.2
cd ..


git clone https://github.com/libcheck/check
cd check
git checkout tags/0.10.0
cd ..

