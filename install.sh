#!/bin/sh

# to ssh into cloud9
# edit instance security group for inbound ssh
# change fond size to 14 -> Settings -> Terminal -> Font Size
# change aws temp credentials -> Settings -> AWS Settings -> Credentials -> AWS managed temporary credentials = false 


set -e

unzip -n cloud9.zip



##############################
echo ========== bash
(
    cd bash-config
    ./bash.sh
)

##############################
echo ========== general
(
    cd general
    ./install.sh
)

##############################
echo ==========  ssh
(
    cd ssh-config
    ./ssh.sh 
)

##############################
echo ==========  aws
(
    cd aws-config
    ./aws.sh 
)

##############################
echo ========== jq
if ! which jq
then
	sudo yum -y install jq
fi    

##############################
echo ========== git
(
    cd git-config
    ./git.sh
)

##############################
echo ========== git-crypt
(
    cd git-crypt-config
    ./git-crypt.sh
)

##############################
(
    echo pull LambdaExample
    cd ~
    if [ ! -d LambdaExample ]
    then
	# git clone https://github.com/MichaelDeCorte/LambdaExample.git
	git clone git@github.com:MichaelDeCorte/LambdaExample.git
	cd LambdaExample
	git-crypt unlock ~/.ssh/mdecorte-git-crypt.key
    fi
)

##############################
echo ========== terraform
./terraform.sh
(
    cd ~/LambdaExample/thirdSource/common.terraform
    terraform init --upgrade
    terraform workspace select common

    cd ~/LambdaExample/thirdSource/
    terraform init --upgrade
    terraform workspace select dev
)
