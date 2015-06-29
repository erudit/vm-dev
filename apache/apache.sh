#!/usr/bin/env bash

yum update
yum -y install httpd
systemctl start httpd
