## Windows

1. Download [CMake](https://cmake.org/download), [MSYS2](https://www.msys2.org/)
2. Git clone xmrig-deps: https://github.com/xmrig/xmrig-deps
3. Open MSYS2 and run:
    ```
    pacman -S mingw-w64-x86_64-gcc git make
    mkdir xmrig/build && cd xmrig/build
    "c:\Program Files\CMake\bin\cmake.exe" .. -G "Unix Makefiles" -DXMRIG_DEPS=c:/xmrig-deps/gcc/x64
    make -j$(nproc)
    ``` 

## Ubuntu

```
sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
mkdir xmrig/build && cd xmrig/build
cmake ..
make -j$(nproc)
```
