#!/usr/bin/env bash

SHARED_DIR=$1

if [ -f "$SHARED_DIR/scripts/config" ]; then
  . $SHARED_DIR/scripts/config
fi

sudo yum update
sudo yum -y install git zerofree

sudo systemctl stop firewalld
