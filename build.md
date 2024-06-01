## Windows

1. Download [CMake](https://cmake.org/download), [MSYS2](https://www.msys2.org/)
2. Git clone xmrig-deps: https://github.com/xmrig/xmrig-deps
3. Open MSYS2 and run:
    ```shell
    pacman -S mingw-w64-x86_64-gcc git make
    mkdir xmrig/build && cd xmrig/build
    "c:\Program Files\CMake\bin\cmake.exe" .. -G "Unix Makefiles" -DXMRIG_DEPS=c:/xmrig-deps/gcc/x64
    make -j$(nproc)
    ``` 

## Ubuntu

```shell
sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
mkdir xmrig/build && cd xmrig/build
cmake ..
make -j$(nproc)
```

## Docker

```shell
# Enable buildx
docker buildx create --name multi-platform --use --platform linux/amd64,linux/arm64 --driver docker-container
# CPU
docker buildx build -f Dockerfile . -t zhanggaoxing/xmrig-c3:6.21.3 --progress=plain --platform linux/amd64,linux/arm64 --push
docker run -itd --restart=always --privileged=true -v $PWD:/xmrig/configs zhanggaoxing/xmrig-c3:6.21.3
# CUDA
docker buildx build -f Dockerfile_CUDA . -t zhanggaoxing/xmrig-c3:6.21.3-cuda --progress=plain --platform linux/amd64,linux/arm64 --push
docker run -itd --restart=always --privileged=true --gpus all -v $PWD:/xmrig/configs zhanggaoxing/xmrig-c3:6.21.3-cuda
```
