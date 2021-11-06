#!/bin/bash

sudo timedatectl set-timezone Europe/Moscow

sudo yum update -y

# common utils
sudo yum install -y epel-release htop nano \
    net-tools gcc \
    wget unzip

# firewall
sudo systemctl unmask firewalld
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --permanent --zone=public --add-port=443/tcp
sudo firewall-cmd --reload

echo "##### Server installed #####"
