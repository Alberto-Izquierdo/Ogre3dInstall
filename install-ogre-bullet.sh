#!/bin/sh

apt-get update
apt-get install libbullet-dev libconvexdecomposition2.81 libbullet-extras-dev git -y
git clone https://bitbucket.org/alexeyknyshev/ogrebullet.git
cd ogrebullet
mkdir build
cd build
cmake .. -G "Unix Makefiles" -DBUILD_DEMOS=FALSE -DINSTALL_EXTRA_LIBS=TRUE -DBUILD_SHARED_LIBS=ON
make -j$(nproc)
make install
cd ../..
cp OgreBullet.pc /usr/lib/x86_64-linux-gnu/pkgconfig/
ldconfig
