#!/usr/bin/env bash

set -x

# Configuration
HOME_DIR=/opt
VERSION=3.3.1
cd ${HOME_DIR}/opencv-${VERSION}/build

cpu_count=`cat /proc/cpuinfo |grep MHz | wc -l`
let cpu_use=$cpu_count-1
echo $cpu_use

make -j$cpu_count
sudo make install
sudo ldconfig
