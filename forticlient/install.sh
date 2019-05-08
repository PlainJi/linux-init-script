#!/usr/bin/env bash

RED='\e[31m'
GREEN='\e[32m'
NC='\e[0m'

set -e

sudo rm -rf /opt/forticlient/;sudo cp -r forticlient /opt/
sudo cp forticlient.desktop /usr/share/applications/

echo -e "${GREEN}install finished. ^-^${NC}"
echo -e "${RED}add forticlient to launch panel and you can use it.${NC}"
cd /opt/forticlient/;./forticlientsslvpn
