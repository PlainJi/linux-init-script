#!/usr/bin/env bash 

set -x

# Configuration
HOME_DIR=/root/compile_opencv
VERSION=3.3.1
cd ${HOME_DIR}/install/lib

list=`ls lib*.3.3.1`

for i in $list; do
    echo "linking $i"
    ln -s $i ${i%.so.3.3.1}3.so.3.3
done

cd -
