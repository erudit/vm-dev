SHARED_DIR=$1

if [ -f "$SHARED_DIR/scripts/config" ]; then
  . $SHARED_DIR/scripts/config
fi

if [ ! -d $SOLR_HOME ]; then
  mkdir $SOLR_HOME
fi

echo "Installing Solr"

if [ ! -f "$DOWNLOAD_DIR/solr-$SOLR_VERSION.tgz" ]; then
  echo -n "Downloading Solr..."
  wget -q -O "$DOWNLOAD_DIR/solr-$SOLR_VERSION.tgz" "http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz"
  echo " done"
fi


cd /tmp
cp "$DOWNLOAD_DIR/solr-$SOLR_VERSION.tgz" /tmp
echo "Extracting Solr"
tar -xzf solr-"$SOLR_VERSION".tgz
cp -v /tmp/solr-"$SOLR_VERSION"/dist/solr-"$SOLR_VERSION".war /var/lib/tomcat/webapps/solr.war
sudo chown tomcat:tomcat /var/lib/tomcat/webapps/solr.war

if [ ! -f "$DOWNLOAD_DIR/commons-logging-1.1.2.jar" ]; then
  echo -n "Downloading commons-logging..."
  wget -q -O "$DOWNLOAD_DIR/commons-logging-1.1.2.jar" "http://repo1.maven.org/maven2/commons-logging/commons-logging/1.1.2/commons-logging-1.1.2.jar"
  echo " done"
fi

cp "$DOWNLOAD_DIR/commons-logging-1.1.2.jar" /usr/share/tomcat/lib

cp /tmp/solr-"$SOLR_VERSION"/example/lib/ext/slf4j* /usr/share/tomcat/lib
cp /tmp/solr-"$SOLR_VERSION"/example/lib/ext/log4j* /usr/share/tomcat/lib

sudo chown -hR tomcat:tomcat /usr/share/tomcat/lib

cp -Rv /tmp/solr-"$SOLR_VERSION"/example/solr/* $SOLR_HOME

cp $SHARED_DIR/scripts/solr/schema.xml $SOLR_HOME/collection1/conf

sudo chown -hR tomcat:tomcat $SOLR_HOME

touch /var/lib/tomcat/velocity.log
sudo chown tomcat:tomcat /var/lib/tomcat/velocity.log

cp $SHARED_DIR/scripts/solr/solr.xml /usr/share/tomcat/conf/Catalina/localhost

sudo systemctl restart tomcat

echo "Solr Installed"
