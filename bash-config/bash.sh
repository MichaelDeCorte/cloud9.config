#!/bin/sh

mkdir -p ~/bin
cp -f *-config ~/bin

if ! grep -q bash-config ~/.bashrc
then
    echo source ~/bin/bash-config >> ~/.bashrc
fi
