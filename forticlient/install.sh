#!/usr/bin/env bash

set -e

sudo rm -rf /opt/forticlient/;sudo cp -r forticlient /opt/
sudo cp forticlient.desktop /usr/share/applications/

echo "install finished. ^-^"
echo "add forticlient to launch panel and you can use it."
cd /opt/forticlient/;./forticlientsslvpn
