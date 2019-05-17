#!/bin/sh

FILE=terraform.zip
VERSION=0.11.11

if ! which terraform
then
    curl https://releases.hashicorp.com/terraform/"$VERSION"/terraform_"$VERSION"_linux_386.zip -o $FILE
    unzip -u $FILE
    rm $FILE

    mkdir -p ~/bin

    mv terraform ~/bin
fi
