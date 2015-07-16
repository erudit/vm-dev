#!/bin/sh

#rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

yum -y install gcc kernel-devel kernel-headers perl cpp dkms make bzip2

## Current running kernel on Fedora, CentOS 7/6 and Red Hat (RHEL) 7/6 ##
export KERN_DIR=/usr/src/kernels/`uname -r`
 
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
/mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf VBoxGuestAdditions.iso
