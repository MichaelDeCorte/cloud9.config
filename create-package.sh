#!/bin/sh                                                                                                                                    

git clone git@github.com:MichaelDeCorte/cloud9.config.git

cp -rf ~/.aws/* cloud9.config/aws-config/

cp -rf ~/.ssh/*.pem cloud9.config/ssh-config/
cp -rf ~/.ssh/*.key cloud9.config/ssh-config/

zip -r cloud9.config.zip cloud9.config



