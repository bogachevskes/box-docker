#!/bin/bash

# log in su
sudo su

timedatectl set-timezone Europe/Moscow

# disble selinux
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

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

# docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

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

# nginx
yum install -y nginx
systemctl enable nginx

echo "##### Server installed #####"
