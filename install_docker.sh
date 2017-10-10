#!/bin/bash

echo "[Removing previous docker installations...]"
echo 

sudo apt-get update
sudo apt-get remove docker docker-engine docker.io

echo "[Preparing for docker-ce installation...]"
echo

sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key and -

sudo apt-key fingerprint 0EBFCD88

echo "[Adding docker.com for repository...]"
echo

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get update

echo "[Installing docker-ce...]"
echo
sudo apt-get install docker-ce

echo "[Testing hello-world...]"
echo
sudo docker run hello-world

echo
echo "[All done!]"


