#!/usr/bin/env bash

wget -O vscode.deb https://vscode.cdn.azure.cn/stable/1dfc5e557209371715f655691b1235b6b26a06be/code_1.25.1-1531323788_amd64.deb
sudo dpkg -i vscode.deb
rm vscode.deb
