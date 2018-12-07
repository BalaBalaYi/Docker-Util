#!/bin/bash
version=17.03.2~ce-0~ubuntu-xenial

echo "deb [arch=amd64] http://mirrors.aliyun.com/docker-engine/apt/repo ubuntu-xenial main" >> /etc/apt/sources.list.d/docker-main.list
curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
apt-get update && apt-get upgrade -y

apt-get install -y docker-engine=${version}

systemctl enable docker
systemctl start docker

