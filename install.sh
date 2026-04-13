#!/bin/bash

sudo apt install -y nodejs npm ripgrep fd-find python3.12-venv
mkdir -p ~/.npm
npm config set prefix ~/.npm
#grep -q "$HOME/.npm/bin" ~/.bashrc || \
#sed -i "/^export PATH=/ s|$|:$HOME/.npm/bin|" ~/.bashrc
grep -q "$HOME/.npm/bin" ~/.bashrc
if [[ $? -eq 0 ]]; then
    sed -i "/^export PATH=/ s|$|:$HOME/.npm/bin|" ~/.bashrc
else
    echo "export PATH='$PATH:$HOME/.npm/bin'" >> ~/.bashrc
fi
npm i -g tree-sitter-cli

echo "Completed set up...source .bashrc or terminate the session and login again"
