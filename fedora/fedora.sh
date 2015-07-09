#Fedora-Commons installation and configuration 

SHARED_DIR=$1

if [ -f "$SHARED_DIR/config" ]; then
	. $SHARED_DIR/config
fi

echo "Installing Fedora"

if [ ! -f $DOWNLOAD_DIR/fcrepo-installer-${FEDORA_VERSION}.jar ]; then
	echo "Downloading Fedora"
	wget -q -O "$DOWNLOAD_DIR/fcrepo-installer-${FEDORA_VERSION}.jar" "http://downloads.sourceforge.net/fedora-commons/fcrepo-installer-${FEDORA_VERSION}.jar"
	echo " done"
fi
wget -q -O "$DOWNLOAD_DIR/mysql-connector-java-5.1.6.jar" "http://mirrors.ibiblio.org/pub/mirrors/maven2/mysql/mysql-connector-java/5.1.6/mysql-connector-java-5.1.6.jar"
cp $DOWNLOAD_DIR/mysql-connector-java-5.1.6.jar /usr/share/tomcat/lib

if [ ! -d /var/lib/tomcat/fedora ]; then
	mkdir /var/lib/tomcat/fedora
fi

if [ ! -d /usr/share/tomcat/common ]; then
	mkdir /usr/share/tomcat/common
fi

sudo ln -s /usr/share/tomcat/lib/ /usr/share/tomcat/common/lib

cp $DOWNLOAD_DIR/fcrepo-installer-${FEDORA_VERSION}.jar $SHARED_DIR/fedora
cd $SHARED_DIR/fedora
java -jar fcrepo-installer-${FEDORA_VERSION}.jar install.properties
rm fcrepo-installer-${FEDORA_VERSION}.jar

sleep 60
sudo chown -R vagrant:vagrant /var/lib/tomcat/webapps/fedora/
cp -v $SHARED_DIR/fedora/web.xml /var/lib/tomcat/webapps/fedora/WEB-INF/web.xml

sudo chown -R tomcat:tomcat /var/lib/tomcat/
sudo systemctl restart tomcat
echo "Fedora Installed"

