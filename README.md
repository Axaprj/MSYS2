# MSYS2
GCC on Windows
**See also [Installing-GCC--&-MSYS2](https://github.com/orlp/dev-on-windows/wiki/Installing-GCC--&-MSYS2)**

## msys32
- installation
    inst-msys-i686.sh
    
- add to .bash_profile

    export MINGW_CHOST="i686-w64-mingw32"
    export MINGW_PREFIX="mingw32"
    PATH="${PATH}:/${MINGW_PREFIX}/bin"

## msys64
- installation
    
    inst-msys-x86_64.sh 

- add to .bash_profile

    export MINGW_CHOST="x86_64-w64-mingw32"
    export MINGW_PREFIX="mingw64"
    PATH="${PATH}:/${MINGW_PREFIX}/bin"

