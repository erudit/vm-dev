#!/usr/bin/env bash

yum update
yum -y install tomcat tomcat-webapps tomcat-admin-webapps apache-tomcat-apis

#vagrant user
usermod -a -G tomcat vagrant

#tomcat user config
if ! grep -q "role rolename=\"fedoraAdmin\"" /etc/tomcat/tomcat-users.xml ; then
  sed -i '$i<role rolename="fedoraUser"/>
  $i<role rolename="fedoraAdmin"/>
  $i<role rolename="manager-gui"/>
  $i<user username="testuser" password="password1" roles="fedoraUser"/>
  $i<user username="adminuser" password="password2" roles="fedoraUser"/>
  $i<user username="fedoraAdmin" password="secret3" roles="fedoraAdmin"/>
  $i<user username="fedora4" password="fedora4" roles="manager-gui"/>' /etc/tomcat/tomcat-users.xml
fi


#starting tomcat
systemctl start tomcat
