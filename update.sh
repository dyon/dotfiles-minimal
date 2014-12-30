#!/bin/bash

red='\e[0;31m'
nocolor='\e[0m'

echo -e "${red}Pulling latest changes...${nocolor}"

git pull

echo -e "${red}Symlinking files...${nocolor}"

ln -sf "`pwd`/.vimrc" ~/
ln -sf "`pwd`/.vimrc.bundles" ~/
ln -sf "`pwd`/.vimrc.bundles.config" ~/
ln -sf "`pwd`/.tmux.conf" ~/
ln -sf "`pwd`/.bash_aliases" ~/

source ~/.bash_aliases

echo -e "${red}Installing bundles...${nocolor}"

~/.vim/bundle/neobundle.vim/bin/neoinstall

echo "Finished!"
