#!/usr/bin/env bash

# Configuration
HOME_DIR=/root/compile_opencv
VERSION=3.3.1

echo $HOME_DIR
echo $VERSION

# Installation_opencv_cpp
sudo apt-get update
#sudo apt-get upgrade
sudo apt-get install -y wget unzip
sudo apt-get install -y build-essential cmake pkg-config
sudo apt-get install -y libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev
sudo apt-get install -y libgtk-3-dev
sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y libpangox-1.0-0 libxt6 libxmu6 libgtkglext1

if [ ! -d ${HOME_DIR} ];then
    mkdir -p ${HOME_DIR}
fi
cd ${HOME_DIR}
sudo wget -O ${HOME_DIR}/opencv.zip https://github.com/Itseez/opencv/archive/${VERSION}.zip
sudo unzip opencv.zip
sed -i '/#include "device_functions.h/d' /root/compile_opencv/opencv-3.3.1/modules/core/include/opencv2/core/cuda/functional.hpp
sudo wget -O ${HOME_DIR}/opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/${VERSION}.zip
sudo unzip opencv_contrib.zip
mkdir -p ${HOME_DIR}/opencv-${VERSION}/build
