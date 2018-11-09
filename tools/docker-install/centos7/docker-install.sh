#!/bin/bash
version=17.03.2.ce

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
sudo yum install -y docker-ce-${version}

systemctl enable docker
systemctl start docker

