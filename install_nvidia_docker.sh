#!/usr/bin/env bash

# https://yeasy.gitbook.io/docker_practice/install/ubuntu

RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[0m'

if [ `whoami` != "root" ]; then
	echo -e "${RED}Pls use sudo...${NC}"
	exit 1
fi

echo -e "${RED}Make Sure You Have Installed NVIDIA Driver? [y / n]${NC}"
read answer
if [ "$answer" = 'n' -o "$answer" = 'N' ]; then
	exit 1
fi

# Method 1
# curl -fsSL get.docker.com -o get-docker.sh
# sh get-docker.sh --mirror [Aliyun | AzureChinaCloud]

# Method 2
echo -e "${GREEN}Install pre-requirements...${NC}"
apt-get remove docker docker-engine docker.io
apt-get update
apt-get install apt-transport-https ca-certificates curl gnupg lsb-release

while true; do
	echo -e "${GREEN}Choose docker mirror source: Aliyun | Official${NC}"
	echo -e "${GREEN}	Official source is prefered via proxy or use Aliyun instead!${NC}"
	read mirror
	case "$mirror" in
		Aliyun)
			curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | \
				gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
			echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
				https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable" | \
				tee /etc/apt/sources.list.d/docker.list > /dev/null
			break
			;;
		Official)
			curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
				gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
			echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
				https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
				tee /etc/apt/sources.list.d/docker.list > /dev/null
			break
			;;
		*)
			echo -e "${RED}Illegal option $mirror${NC}"
			;;
	esac
done

echo -e "${GREEN}Install docker${NC}"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

echo -e "${GREEN}Init Docker Service...${NC}"
systemctl enable docker
systemctl start docker

echo -e "${GREEN}Add $USER to group docker...${NC}"
groupadd docker
usermod -aG docker $USER


# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker
echo -e "${GREEN}Add nvidia gpg Key...${NC}"
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

echo -e "${GREEN}Install nvidia docker${NC}"
apt-get update
apt-get install -y nvidia-docker2
systemctl restart docker

echo "=============================="
echo "=======Restart Computer======="
echo "=============================="

echo "Test by following cmd:"
echo "docker run --rm hello-world"
echo "docker run --rm --gpus all nvidia/cuda:11.0.3-base-ubuntu20.04 nvidia-smi"

