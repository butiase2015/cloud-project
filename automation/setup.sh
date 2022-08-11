#!/bin/bash

sudo apt update -y && apt upgrade -y
sudo apt install -y  apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-cache policy docker-ce && sudo apt -y install docker-ce


sudo apt-get install -y docker-compose git docker-compose apache2
sudo usermod -aG docker ${USER}


sudo docker pull jenkins/jenkins:lts
sudo docker run -d -p 8080:8080 jenkins/jenkins:lts


sudo systemctl enable apache2 && sudo systemctl restart apache2





