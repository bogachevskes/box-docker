#!/bin/bash

# log in su
sudo su

timedatectl set-timezone Europe/Moscow

yum update -y

# common utils
yum install -y epel-release htop nano \
    net-tools gcc \
    wget unzip

# docker
yum install -y yum-utils

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io

systemctl start docker
systemctl enable docker
systemctl status docker

# add vagrant to docker group
groupadd docker
usermod -aG docker vagrant

# firewall
systemctl unmask firewalld
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=443/tcp
firewall-cmd --reload

echo "##### Server installed #####"
