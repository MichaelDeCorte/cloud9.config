#!/bin/sh

mkdir -p ~/.aws
(
    cd ~/.aws
    mv -n -f credentials credentials.save
)
cp -n * ~/.aws
chmod 400 ~/.aws/*

