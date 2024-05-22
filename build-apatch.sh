#!/bin/bash

echo
echo "Clean Build Directory"
echo 

make clean && make mrproper

echo
echo "Issue Build Commands"
echo

mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=/home/yuza/pixel-new/proton-clang/bin
export PATH=${CLANG_PATH}:${PATH}
#export DTC_EXT=/home/miles/Downloads/DU_Tools/dtc-aosp
#export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=/home/yuza/pixel-new/proton-clang/bin/aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=/home/yuza/pixel-new/proton-clang/bin/arm-linux-gnueabi-
#export LD_LIBRARY_PATH=~/pixel/clang-u/lib:$LD_LIBRARY_PATH

echo
echo "Set DEFCONFIG"
echo 
make CC=clang AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip O=out floral_defconfig

echo
echo "Build The Good Stuff"
echo 

make CC=clang AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip O=out -j16
