
KEYNAME=DeCorte-xxx

ssh-keygen -t RSA -y -f ~/.ssh/"$KEYNAME".pem  > /tmp/"$KEYNAME"-public-openssh.pem
ssh-keygen -f /tmp/"$KEYNAME"-public-openssh.pem -e -m pem > ~/.ssh/"$KEYNAME"-public.pem
