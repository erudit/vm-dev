#!/bin/bash

SHARED_DIR=$1

sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
sudo yum -y install ansible

export ANSIBLE_CONFIG=$SHARED_DIR/ansible/ansible.cfg
echo $ANSIBLE_CONFIG
#Ansible commands
ansible-playbook $SHARED_DIR/ansible/vm.yml --connection=local
