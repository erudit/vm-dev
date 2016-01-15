# Developer's VM
Development environment for developers (Tomcat : Fedora-Commons, Solr)

## Requirements
* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

## Usage

1. `git clone https://github.com/erudit/vm-dev.git`
2. `cd vm-dev`
3. `vagrant up`

You can shell into the machine with `vagrant ssh`

## Environnement

**CentOs 7**

* Once the vm has started
  * Tomcat 7.0.54
    * [Tomcat](http://192.168.10.150:8080/)
    * Manager username: admin password: admin
    * Location: /usr/share/tomcat
  * Mariadb
    * Username: root Password: root
    * Database: fedora
      * Username: fedoraAdmin Password: fedoraAdmin
  * Fedora-Commons 3.4.2
    * [Fedora](http://192.168.10.150:8080/fedora)
    * Username: fedoraAdmin Password: fedoraAdmin
    * Location: /usr/share/tomcat/fedora
  * Solr 4.10.3
    * [Solr](http://192.168.10.150:8080/solr)
    * Location: /usr/share/tomcat/solr

## Basic Commands

- vagrant up
  - Start the VM
- vagrant halt
  - Stop the VM
- vagrant provision
  - Run any configured provisioner configured in the Vagrantfile
- vagrant suspend
  - Stop the VM and save state
- vagrant ssh
  - Ssh into the running Vagrant machine
- vagrant destroy
  - Stop the VM and delete all traces


## Windows User

If you want to use **vagrant ssh** you will need git or cygwin.

  * [Git](https://git-scm.com/downloads)
  * [Cygwin](https://cygwin.com/install.html)
