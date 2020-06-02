#!/usr/bin/env bash 

set -x

# Configuration
HOME_DIR=/root/compile_opencv/install
VERSION=3.3.1

mkdir $HOME_DIR/.release
cp tspkg.yaml $HOME_DIR/.release

cd ${HOME_DIR}
mv bin .release
mv include .release
mv lib .release
mv share .release
pwd;ls
