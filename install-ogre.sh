apt-get update
apt-get install libogre-1.9.0 libogre-1.9-dev libois-dev freeglut3-dev ogre-1.9-tools libsdl2-dev libsdl2-mixer-dev libsdl2-gfx-dev libsdl2-net-dev libsdl2-image-dev libsdl2-ttf-dev -y && updatedb
apt-get purge libcegui*
apt-get install cmake build-essential libiconv-hook-dev libfribidi-dev libpcre3-dev libfreetype6-dev freeglut3-dev libpython-dev libglew-dev libglm-dev libois-dev libxml2-dev python-opengl pyside-tools libboost-python-dev libboost-dev mercurial -y
hg clone https://bitbucket.org/cegui/cegui
hg clone https://bitbucket.org/cegui/ceed
cd ceed && hg update v0-8
cd ../cegui && hg update v0-8
mkdir build && cd build
cmake -DCEGUI_BUILD_PYTHON_MODULES=ON -DCEGUI_BUILD_RENDERER_OPENGL=ON -DCEGUI_BUILD_RENDERER_OPENGL3=ON ../ 
make -j$(nproc)
make install
echo "include /usr/local/lib" >> /etc/ld.so.conf
ldconfig
