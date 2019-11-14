# Configuration
HOME_DIR=/opt
VERSION=3.3.1

echo $HOME_DIR
echo $VERSION

# Installation
sudo apt-get update
#sudo apt-get upgrade
sudo apt-get install -y build-essential cmake pkg-config
sudo apt-get install -y libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev
sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y python2.7-dev

cd ${HOME_DIR}
sudo wget -O opencv.zip https://github.com/Itseez/opencv/archive/${VERSION}.zip
sudo unzip opencv.zip
sudo wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/${VERSION}.zip
sudo unzip opencv_contrib.zip

cd ${HOME_DIR}/opencv-${VERSION}/
sudo mkdir build;cd build

echo "check your build param manually!"
exit 0

'''
# self used
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D INSTALL_C_EXAMPLES=OFF \
      -D OPENCV_EXTRA_MODULES_PATH=${HOME_DIR}/opencv_contrib-${VERSION}/modules \
      -D PYTHON_EXECUTABLE=/usr/bin/python \
      -D ENABLE_CXX11=ON \
      -D CMAKE_C_COMPILER=/usr/bin/gcc-5 \
      -D BUILD_EXAMPLES=ON ..

# GPU Version
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/opt/opencv \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=OFF \
      -D WITH_OPENGL=ON \
      -D WITH_CUDA=ON \
      -D ENABLE_FAST_MATH=1 \
      -D CUDA_FAST_MATH=1 \
      -D CUDA_NVCC_FLAGS="-D_FORCE_INLINES" \
      -D WITH_CUBLAS=1 \
      -D ENABLE_PRECOMPILED_HEADERS=OFF ..
'''

# https://github.com/etlapale/ros-kinetic-opencv3/blob/master/PKGBUILD
cmake -DCMAKE_CXX_COMPILER=/usr/bin/g++-6 \
      -DCMAKE_C_COMPILER=/usr/bin/gcc-6 \
      -DCUDA_HOST_COMPILER:FILEPATH=/usr/bin/gcc-6 \
      -DCUDA_NVCC_FLAGS='-Xcompiler -D__CORRECT_ISO_CPP11_MATH_H_PROTO --expt-relaxed-constexpr' \
      -DCMAKE_BUILD_TYPE=Release \
      -DCATKIN_BUILD_BINARY_PACKAGE=ON \
      -DCMAKE_INSTALL_PREFIX=/opt/opencv \
      -DPYTHON_EXECUTABLE=/usr/bin/python3 \
      -DPYTHON_INCLUDE_DIR=/usr/include/python3.5 \
      -DPYTHON_LIBRARY=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/libpython3.5.so \
      -DPYTHON_BASENAME=-python3.5 \
      -DSETUPTOOLS_DEB_LAYOUT=OFF \
      -DENABLE_PRECOMPILED_HEADERS=OFF \
      -DWITH_TBB=ON \
      -DWITH_V4L=ON \
      -DWITH_QT=OFF \
      -DWITH_OPENGL=ON \
      -DWITH_CUDA=ON \
      -DENABLE_FAST_MATH=1 \
      -DCUDA_FAST_MATH=1 \
      -DWITH_CUBLAS=1

# Check output cmake, it should include python 2
# For more information check: http://www.pyimagesearch.com/2016/10/24/ubuntu-16-04-how-to-install-opencv/

sudo make -j8
sudo make install
sudo ldconfig

#cd ${HOME_DIR};sudo rm -rf opencv-${VERSION} opencv_contrib-${VERSION} opencv.zip opencv_contrib.zip
