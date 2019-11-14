#!/usr/bin/env bash

YELLOW='\033[33m'
NC='\033[0m'

sudo apt-get install -y fcitx fcitx-googlepinyin
echo -e "${YELLOW}please select <fcitx> in the next window...${NC}"
im-config
echo -e "${YELLOW}logout and relogin
choose Google Pinyin from Configure Current Input Method.
config hotkey from Configure.
change /usr/share/fcitx/data/punc.mb.zh_CN for []${NC}"
