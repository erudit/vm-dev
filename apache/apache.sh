#!/usr/bin/env bash

echo "Installing Apache"

yum -y install httpd
systemctl start httpd
echo "Apache Installed"
