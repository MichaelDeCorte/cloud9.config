#!/bin/sh

mkdir -p ~/.ssh
cp -n * ~/.ssh
chmod 400 ~/.ssh/*

if ! grep -q "$(cat  ~/.ssh/DeCorte-public-OpenSSH.pem)" ~/.ssh/authorized_keys
then
	chmod 644 ~/.ssh/authorized_keys
	cat ~/.ssh/DeCorte-public-OpenSSH.pem >> ~/.ssh/authorized_keys
	chmod 600 ~/.ssh/authorized_keys
fi

