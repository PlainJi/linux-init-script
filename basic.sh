#!/usr/bin/env bash

set -e

RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[0m'

basepath=$(cd `dirname $0`; pwd)
cd ~

#if [ `whoami` != "root" ]; then
#	echo -e "${RED}use sudo...${NC}"
#	exit 1
#fi

sudo apt-get update
sudo apt-get install -y curl

echo -e "${GREEN}install vim...${NC}"
sudo apt-get install -y vim

echo -e "${GREEN}install tmux...${NC}"
sudo apt-get install -y terminator

echo -e "${GREEN}install chrome...${NC}"
cd $basepath
sudo apt-get install -y chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg-extra

echo -e "${GREEN}install openssh client&server&sftp...${NC}"
sudo apt-get install -y openssh-client openssh-server openssh-sftp-server

echo -e "${RED}set git username? (y/n)${NC}"; read cfg
if [ "$cfg" = 'y' -o "$cfg" = 'Y' ]; then
	echo -e "${GREEN}set git default param...${NC}"
	git config --global user.name "plainji"
	git config --global user.email "plain_ji@163.com"
	git config --global push.default matching
	git config --global push.default simple

	echo -e "${GREEN}generate rsa ssh-key...${NC}"
	mkdir -p ~/.ssh/;cd ~/.ssh/
	rm -rf id_rsa*
	ssh-keygen -t rsa -C "plain_ji@163.com"
	eval "$(ssh-agent -s)"
	ssh-add id_rsa
	cat ~/.ssh/id_rsa.pub
	echo -e "${GREEN}please add rsa key to git...${NC}"
	echo -e "${RED}have u done? (Y/n)${NC}"
	read temp
	if [ "$temp" = 'Y' -o "$temp" = 'y' ]; then
		echo -e "${GREEN}check git via ssh...${NC}"
		echo `ssh -T git@github.com`
	else
		echo "ignore"
	fi
fi

echo -e "${GREEN}install zsh...${NC}"
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
