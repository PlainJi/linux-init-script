#!/usr/bin/env bash

cpu_count=`cat /proc/cpuinfo |grep MHz | wc -l`
let cpu_use=$cpu_count-1
echo $cpu_use

make -j$cpu_count
sudo make install
sudo ldconfig
