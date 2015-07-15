#!/usr/bin/env bash

echo "Installing Apache"

sudo yum -y install httpd
sudo systemctl start httpd

echo "Apache Installed"
