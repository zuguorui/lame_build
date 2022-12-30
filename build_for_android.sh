#!/bin/bash

SOURCE_PATH=/Users/zuguorui/work_space/lame-3.100

NDK=/Users/zuguorui/Library/Android/sdk/ndk/21.4.7075529
HOST_TAG=darwin-x86_64
TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_TAG

INSTALL_PATH="$(pwd)/android"

API=26

rm -r $INSTALL_PATH/

cd $SOURCE_PATH

function build_android_arm
{
echo "build for android $CPU"
./configure \
--host=$HOST \
--disable-static \
--enable-shared \
--disable-frontend \
--prefix="$INSTALL_PATH/$CPU" \
CPPFLAGS="-fPIC"

make clean
make -j8
make install

echo "build for android $CPU completed"
}

# armv7
CPU=armv7
HOST=arm-linux-android
export AR=$TOOLCHAIN/bin/arm-linux-androideabi-ar
export AS=$TOOLCHAIN/bin/arm-linux-androideabi-as
export LD=$TOOLCHAIN/bin/arm-linux-androideabi-ld
export RANLIB=$TOOLCHAIN/bin/arm-linux-androideabi-ranlib
export STRIP=$TOOLCHAIN/bin/arm-linux-androideabi-strip
export CC=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang
export CXX=$TOOLCHAIN/bin/armv7a-linux-androideabi$API-clang++
build_android_arm

# armv8
CPU=armv8
HOST=aarch64-linux-android
export AR=$TOOLCHAIN/bin/aarch64-linux-android-ar
export AS=$TOOLCHAIN/bin/aarch64-linux-android-as
export LD=$TOOLCHAIN/bin/aarch64-linux-android-ld
export RANLIB=$TOOLCHAIN/bin/aarch64-linux-android-ranlib
export STRIP=$TOOLCHAIN/bin/aarch64-linux-android-strip
export CC=$TOOLCHAIN/bin/aarch64-linux-android$API-clang
export CXX=$TOOLCHAIN/bin/aarch64-linux-android$API-clang++
build_android_arm