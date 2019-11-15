#!/usr/bin/env bash

# Configuration
HOME_DIR=.
VERSION=3.3.1

# No GPU
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D INSTALL_C_EXAMPLES=OFF \
      -D OPENCV_EXTRA_MODULES_PATH=${HOME_DIR}/opencv_contrib-${VERSION}/modules \
      -D PYTHON_EXECUTABLE=/usr/bin/python \
      -D ENABLE_CXX11=ON \
      -D CMAKE_C_COMPILER=/usr/bin/gcc-5 \
      -D BUILD_EXAMPLES=ON ..

# With GPU
cd ${HOME_DIR}/opencv-${VERSION}/build
cmake -DCMAKE_CXX_COMPILER=/usr/bin/g++-6 \
      -DCMAKE_C_COMPILER=/usr/bin/gcc-6 \
      -DCUDA_HOST_COMPILER:FILEPATH=/usr/bin/gcc-6 \
      -DCUDA_NVCC_FLAGS='-Xcompiler -D__CORRECT_ISO_CPP11_MATH_H_PROTO --expt-relaxed-constexpr' \
      -DCMAKE_BUILD_TYPE=Release \
      -DCATKIN_BUILD_BINARY_PACKAGE=ON \
      -DCMAKE_INSTALL_PREFIX=${HOME_DIR}/opencv \
      -DPYTHON_EXECUTABLE=/usr/bin/python3 \
      -DPYTHON_INCLUDE_DIR=/usr/include/python3.5 \
      -DPYTHON_LIBRARY=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/libpython3.5.so \
      -DPYTHON_BASENAME=-python3.5 \
      -DSETUPTOOLS_DEB_LAYOUT=OFF \
      -DENABLE_PRECOMPILED_HEADERS=OFF \
      -DWITH_TBB=ON \
      -DWITH_V4L=ON \
      -DWITH_QT=OFF \
      -DWITH_OPENGL=ON \
      -DWITH_CUDA=ON \
      -DENABLE_FAST_MATH=1 \
      -DCUDA_FAST_MATH=1 \
      -DWITH_CUBLAS=1 \
      -DBUILD_PROTOBUF=OFF \
      -DBUILD_opencv_dnn=OFF \
      -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.3.1/modules ..