#!/bin/sh

echo ========== install git-crypt
if ! which git-crypt
then

    sudo yum install gcc-c++ openssl-devel openssl
    git clone https://github.com/AGWA/git-crypt.git
    cd git-crypt
    make
    sudo make install
    # To install to a custom location:
    # sudo make install PREFIX=<location>

    # This should validate that it's installed correctly
    git-crypt --version
fi    

if [ -f $HOME/.ssh/git-crypt.key ]
then
    git-crypt keygen $HOME/.ssh/git-crypt.key
fi

if [ ! -f $HOME/.ssh/mdecorte-git-crypt.key ]
then
    git-crypt keygen $HOME/.ssh/mdecorte-git-crypt.key
fi
