# the name of the target operating system
set(CMAKE_SYSTEM_NAME Windows)

#set(COMPILER_PREFIX "i686-w64-mingw32")
#set(CMAKE_C_COMPILER   i686-w64-mingw32-gcc )
#set(CMAKE_RC_COMPILER  i686-w64-mingw32-windres )

# Windows only compiles statically.
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DAL_LIBTYPE_STATIC" CACHE STRING "" FORCE)
set(UTOX_STATIC ON CACHE STRING "" FORCE)

# Required for line numbers in gdb on Windows.
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g3" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO} -g3" CACHE STRING "" FORCE)

#set(INCLUDE_DIRECTORIES SYSTEM /usr/share/mingw-w64/include/)

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(WIN32 TRUE) # This is for cmake
#set(WIN64 TRUE) # This is for uTox lib dirs
set(UNIX FALSE)

set(ENABLE_ASAN OFF CACHE STRING "" FORCE)
