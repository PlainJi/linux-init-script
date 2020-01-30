#!/usr/bin/env bash

set -ex

sudo apt update
sudo apt-get install build-essential libtool libpcre3 libpcre3-dev zlib1g-dev unzip
sudo apt-get install openssl libssl-dev
wget http://nginx.org/download/nginx-1.9.8.tar.gz
wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
tar -xf nginx-1.9.8.tar.gz;unzip master.zip
cd nginx-1.9.8
# default install dir is /usr/local
./configure --with-stream --with-http_ssl_module --with-stream_ssl_module --with-debug --add-module=../nginx-rtmp-module-master
make;sudo make install

cd ..
rm -rf nginx-1.9.8.tar.gz master.zip nginx-1.9.8 nginx-rtmp-module-master
sudo rm /usr/local/nginx/conf/nginx.conf
sudo cp nginx.conf /usr/local/nginx/conf/
sudo cp index.html /usr/local/nginx/html/
touch start_nginx.sh;echo "sudo /opt/nginx/sbin/nginx" > ~/start_nginx.sh
touch stop_nginx.sh;echo "sudo /opt/nginx/sbin/nginx -s stop" > ~/stop_nginx.sh
cd ~;chmod +x *.sh

echo "rtmp server url: rtmp://ip:10000/live/1"
echo "Done!"
