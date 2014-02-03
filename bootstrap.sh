#!/bin/bash

echo "Pulling latest changes..."

git pull

echo "Symlinking files..."

ln -s "`pwd`/.vimrc" ~/

echo "Finished!"
