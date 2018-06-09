# MSYS2
# Use GCC on Windows 

**see also [Installing GCC & MSYS2](https://github.com/orlp/dev-on-windows/wiki/Installing-GCC--&-MSYS2)**

## msys32
- toolchain installation/update script
```sh
    inst-msys-i686.sh
```    
- add to .bash_profile
```sh
    export MINGW_CHOST="i686-w64-mingw32"
    export MINGW_PREFIX="mingw32"
    PATH="${PATH}:/${MINGW_PREFIX}/bin"
```
## msys64
- toolchain installation/update script
```sh    
    inst-msys-x86_64.sh 
```
- add to .bash_profile
```sh
    export MINGW_CHOST="x86_64-w64-mingw32"
    export MINGW_PREFIX="mingw64"
    PATH="${PATH}:/${MINGW_PREFIX}/bin"
```
