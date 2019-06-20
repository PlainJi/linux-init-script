#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
sudo apt-get update
sudo apt-get install docker-ce -y
sudo groupadd docker
sudo usermod -aG docker $USER

# Install Nvidia docker on machines that Nvidia GPU is being used
sudo update-pciids
if lspci -nn | grep '\[03' | grep -q "NVIDIA"; then
	echo "Found NVIDIA GPU, install nvidia docker ..."
	# Install nvidia-docker and nvidia-docker-plugin
	sudo apt-add-repository multiverse
	sudo apt-get update
	sudo apt-get install nvidia-modprobe -y
	wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
	sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb
fi


sudo sh -c "echo \"KERNEL==\"ttyACM[0-9]*\", MODE=\"0777\"\" > /etc/udev/rules.d/70-ttyACM.rules"

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "/home/$USER/.docker" -R

echo "=== Please log out and re-log in ==="
echo "=== Please log out and re-log in ==="
echo "=== Please log out and re-log in ==="

# Install pip / yaml / aws
hash pip 2> /dev/null || sudo apt install python-pip -y
python -c "import yaml" 2> /dev/null || sudo pip install pyyaml
hash aws 2> /dev/null || sudo pip install awscli
