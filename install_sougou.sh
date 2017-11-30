#!/usr/bin/env bash

cd ~/Downloads
sudo add-apt-repository ppa:fcitx-team/nightly
sudo apt-get update
sudo apt-get install -y fcitx
sudo apt-get install -y fcitx-config-gtk
sudo apt-get install -y fcitx-table-all
sudo apt-get install -y im-switch

wget -O sougou-pinyin.dev https://pinyin.sogou.com/linux/download.php?f=linux&bit=64
sudo dpkg -i sogoupinyin.deb
