#!/bin/bash

# Install to conda style directories
[[ -d lib64 ]] && mv lib64 lib
mkdir -p ${PREFIX}/lib/stubs
[[ -d pkg-config ]] && mv pkg-config ${PREFIX}/lib/pkgconfig
[[ -d "$PREFIX/lib/pkgconfig" ]] && sed -E -i "s|cudaroot=.+|cudaroot=$PREFIX/cuda|g" $PREFIX/lib/pkgconfig/cuda*.pc

[[ ${target_platform} == "linux-64" ]] && targetsDir="targets/x86_64-linux"
[[ ${target_platform} == "linux-ppc64le" ]] && targetsDir="targets/ppc64le-linux"
[[ ${target_platform} == "linux-aarch64" ]] && targetsDir="targets/sbsa-linux"

mkdir -p ${PREFIX}/cuda/${targetsDir}

cp -rv lib ${PREFIX}/cuda/${targetsDir}
cp -rv include ${PREFIX}/cuda/${targetsDir}

ln -sv ${PREFIX}/cuda/${targetsDir}/lib ${PREFIX}/cuda/lib64
ln -sv ${PREFIX}/cuda/${targetsDir}/include ${PREFIX}/cuda/include
