# Developer's VM
Development environment for developers (Tomcat : Fedora-Commons, Solr, Cocoon)

## Requirements

* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

## Usage

1. `git clone https://github.com/eruditorg/vm-dev.git`
2. `cd vm-dev`
3. `vagrant up`

You can use the GUI or you can also shell into the machine with `vagrant ssh`

## Environnement

* CentOs 7
 * Tomcat 7.0.54
   * Username: admin Password: admin
 * Mariadb
   * Username: root Password: root
     * Database: fedora
       * Username: fedoraAdmin Password: fedoraAdmin
 * Fedora-Commons 3.4.2
   * Username: fedoraAdmin Password: fedoraAdmin
 * Solr 4.10.3
 * Eclipse Mars
