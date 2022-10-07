#!/usr/bin/env bash

sudo apt-get install language-pack-zh-hans -y
echo `LANG="zh_CN.UTF-8"| sudo tee /etc/environment
echo `LANGUAGE="zh_CN:zh:en_US:en"` |sudo tee /etc/environment
sudo locale-gen
sudo apt-get install fonts-droid-fallback ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming -y
