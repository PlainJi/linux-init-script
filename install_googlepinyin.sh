#!/usr/bin/env bash

sudo apt-get install -y fcitx fcitx-googlepinyin im-config
echo "please select <fcitx> in the next window..."
im-config
echo "relogin required!!!"
