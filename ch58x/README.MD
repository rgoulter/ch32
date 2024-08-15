# CH58x

Code for WCH's CH58x.

<https://www.wch-ic.com/products/CH583.html>

Files for `sdk/` and various `*-c` examples taken from [CH58x
EVT](https://github.com/openwch/ch583).

## Building `-c` EVT Examples

```
mkdir build
cd build
cmake --toolchain=../../../cmake/toolchains/riscv-none-embed.cmake ..
make
```
