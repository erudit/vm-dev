#!/usr/bin/env bash

SHARED_DIR=$1

if [ -f "$SHARED_DIR/scripts/config" ]; then
  . $SHARED_DIR/scripts/config
fi

#sudo yum update
#sudo yum -y install git 
#
#sudo yum -y groupinstall "GNOME Desktop" "Graphical Administration Tools"
#sudo ln -sf /lib/systemd/system/runlevel5.target /etc/systemd/system/default.target

#sudo systemctl stop firewalld
#export DISPLAY=":0"
#dbus-launch gsettings set org.gnome.desktop.background picture-uri file:///home/vagrant/Pictures/erudit.png

