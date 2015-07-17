#!/bin/bash

# Update and install dev tools
sudo yum update
yum -y install gcc kernel-devel kernel-headers perl cpp dkms make bzip2 git

# Installing X11 / Gnome / Configuration tools
sudo yum -y groupinstall "GNOME Desktop" "Graphical Administration Tools"
sudo ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target

# cp /vagrant/erudit.png /home/vagrant/Pictures/erudit.png # Dir exists?"
# gsettings set org.gnome.desktop.background picture-uri file:///home/vagrant/Pictures/erudit.png
