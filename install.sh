#!/bin/bash

red='\e[0;31m'
nocolor='\e[0m'

echo -e "${red}Installing NeoBundle plugin...${nocolor}"

mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim 2> /dev/null

echo -e "${red}Symlinking files...${nocolor}"

ln -sf "`pwd`/.vimrc" ~/
ln -sf "`pwd`/.vimrc.bundles" ~/
ln -sf "`pwd`/.vimrc.bundles.config" ~/
ln -sf "`pwd`/.tmux.conf" ~/
ln -sf "`pwd`/.bash_aliases" ~/

source ~/.bash_aliases

echo -e "${red}Installing bundles...${nocolor}"

~/.vim/bundle/neobundle.vim/bin/neoinstall

echo -e "${red}Finished!${nocolor}"
