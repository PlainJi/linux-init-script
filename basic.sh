#!/usr/bin/env bash

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
sudo apt-get install -y curl wget git nfs-common

echo -e "${GREEN}install vim...${NC}"
sudo apt-get install -y vim

echo -e "${GREEN}install tmux...${NC}"
sudo apt-get install -y terminator

echo -e "${GREEN}install chrome...${NC}"
hash google-chrome
if [[ $? -eq 1 ]]; then
	cd $basepath
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	rm google-chrome-stable_current_amd64.deb
fi

echo -e "${GREEN}install openssh client&server&sftp...${NC}"
sudo apt-get install -y openssh-client openssh-server openssh-sftp-server

echo -e "${GREEN}install tools...${NC}"
sudo apt-get install -y dos2unix psensor htop nmon ipython

echo -e "${GREEN}install stickynotes...${NC}"
sudo add-apt-repository ppa:umang/indicator-stickynotes
sudo apt-get update
sudo apt-get install indicator-stickynotes
echo -e "${RED}if you want run indicator-stickynotes at start-up, add it to rc.local youself."

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
	ssh-keygen -t rsa -f id_rsa -P "" -C "plain_ji@163.com"
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

echo -e "${GREEN}delete unused diretorys...${NC}"
cd ~;rm -rf Music Public Templates Videos examples.desktop

echo -e "${GREEN}install zsh...${NC}"
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cd $basepath;rm -rf ~/.zshrc;cp -f .zshrc ~/

echo -e "${GREEN}done!${NC}"
