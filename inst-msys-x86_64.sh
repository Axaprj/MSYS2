#!/bin/bash
# see also https://github.com/orlp/dev-on-windows/wiki/Installing-GCC--&-MSYS2

pacman -Sy msys2-launcher-git
update-core

pacman -Syuu

pacman -S --needed base-devel mingw-w64-x86_64-toolchain \
                   git subversion mercurial \
                   mingw-w64-x86_64-cmake
