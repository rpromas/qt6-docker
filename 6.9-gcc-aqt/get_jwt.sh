#!/bin/sh -xe
# Script to install linuxdeploy with qt plugin

echo
echo '--> Download & install the jwt-cpp'
echo

apt update
apt install -y libssl-dev openssl

git clone "https://github.com/Thalhammer/jwt-cpp.git" /tmp/jwt-cpp

cmake /tmp/jwt-cpp -B /tmp/jwt-cpp-build -G Ninja -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release -DUSE_CCACHE=OFF
cmake --build /tmp/jwt-cpp-build
cmake --install /tmp/jwt-cpp-build

rm -rf /tmp/jwt-cpp-build*
