#!/bin/bash

# Update and install dev tools
sudo yum update
yum -y install gcc kernel-devel kernel-headers perl cpp dkms make bzip2 git

# Installing X11 / Gnome / Configuration tools
sudo yum -y groupinstall "GNOME Desktop" "Graphical Administration Tools"
sudo ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target

# Add EPEL repository
rpm -ivh  http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm 
sudo yum -y install ansible

# Add default desktop background for dev vm
mkdir -p /home/vagrant/Pictures
cp /vagrant/images/erudit.png /home/vagrant/Pictures/erudit.png
gsettings set org.gnome.desktop.background picture-uri file:///home/vagrant/Pictures/erudit.png
