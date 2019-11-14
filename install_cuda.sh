#!/bin/bash
'''
echo "This script is to install cuda8.0 on your system..."
echo "NOTE: This script assumes Ubuntu 16 or 14 and Nvidia Graphics card up to 10XX. Otherwise, install it by yourself or it will fail."

# Install CUDA 8.0
ubuntu_version="$(lsb_release -r)"
sudo apt-get update && sudo apt-get install wget -y --no-install-recommends
if [[ $ubuntu_version == *"14."* ]]; then
  wget -c "https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1404-8-0-local-ga2_8.0.61-1_amd64-deb"
  sudo dpkg --install cuda-repo-ubuntu1404-8-0-local-ga2_8.0.61-1_amd64-deb
elif [[ $ubuntu_version == *"16."* ]]; then
  wget -c "https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb"
  sudo dpkg --install cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
fi
sudo apt-get update
sudo apt-get install cuda-8-0
# sudo apt-get install cuda
'''

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-ubuntu1604.pin
sudo mv cuda-ubuntu1604.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-ubuntu1604-10-1-local-10.1.243-418.87.00_1.0-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604-10-1-local-10.1.243-418.87.00_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-1-local-10.1.243-418.87.00/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda
