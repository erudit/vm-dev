#!/usr/bin/env bash

SHARED_DIR=$1

if [ -f "$SHARED_DIR/config" ]; then
  . $SHARED_DIR/config
fi


yum update
yum -y install vim nano git

sudo systemctl stop firewalld
