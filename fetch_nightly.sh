#! /bin/bash
wget --no-cache https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage 
chmod u+x nvim.appimage
version=$(./nvim.appimage -v | awk '/NVIM v/' | awk -F ' ' '{ print $2}' | awk -F '-' '{ print substr($1,4) $2}')
mkdir $version
cp nvim.appimage $version
