#!/usr/bin/env bash

echo "Installing Tomcat"

sudo yum -y install tomcat tomcat-webapps tomcat-admin-webapps apache-tomcat-apis

#vagrant user
sudo usermod -a -G tomcat vagrant

#tomcat user config
if ! grep -q "role rolename=\"fedoraAdmin\"" /etc/tomcat/tomcat-users.xml ; then
  sed -i '$i<role rolename="fedoraUser"/>
  $i<role rolename="fedoraAdmin"/>
  $i<role rolename="manager-gui"/>
  $i<user username="testuser" password="password1" roles="fedoraUser"/>
  $i<user username="adminuser" password="password2" roles="fedoraUser"/>
  $i<user username="fedoraAdmin" password="secret3" roles="fedoraAdmin"/>
  $i<user username="admin" password="admin" roles="manager-gui"/>' /etc/tomcat/tomcat-users.xml
fi


#starting tomcat
sudo systemctl start tomcat

echo "Tomcat Installed"
