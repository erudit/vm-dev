#!/usr/bin/env bash

yum update
yum -y install httpd
rm -rf /var/www
ln -fs /vagrant /var/www
systemctl start httpd
