#    [Tox](https://github.com/TokTok/c-toxcore) & [uTox](https://github.com/uTox/uTox) compilation with dependencies
32bit and 64bit compatible 

## Usage
1. `git-all.sh` - get all sources 
2. `prereq-compile.sh` - build prerequired libs
3. `tox-compile.sh` - some libs, Tox and uTox build
4. Looking for utox.exe into uTox/build 

## Files Description
* `git-all.sh` - get all sources (fixed versions)
* `prereq-compile.sh` - build prerequired libs
* `tox-compile.sh` - Tox and uTox build
* `utox-compile.sh` -  uTox build (CMake based)
* `filter-audio.make` - filter-audio make file; remove msys build special rules
* `utox-codeblocks.sh` - uTox generate CodeBlocks project (for CodeBlocks with MSYS2 toolchain)
* `utox-toolchain-mingw32.cmake` - (obsoleted)
* `utox-toolchain-mingw64.cmake` - (obsoleted)
* `old-utox-compile.sh` - (obsoleted) shell based uTox build

## see also
* in case of `-lopenal` issue
https://github.com/uTox/uTox/pull/731
