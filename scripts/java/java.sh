#JAVA environnement

SHARED_DIR=$1

echo "Installing Java"

if [ -f "$SHARED_DIR/scripts/config" ]; then
  . $SHARED_DIR/scripts/config
fi

if [ ! -f "$DOWNLOAD_DIR/jdk-7u80-linux-x64.tar.gz" ]; then
  echo -n "Downloading Java..."
  wget -q -O "$DOWNLOAD_DIR/jdk-7u80-linux-x64.tar.gz" --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz"
  echo " done"
fi

if [ ! -d /usr/java ]; then
  mkdir /usr/java
fi

cd /usr/java
tar -xzf "$DOWNLOAD_DIR/jdk-7u80-linux-x64.tar.gz"

update-alternatives --install "/usr/bin/java" "java" "/usr/java/jdk1.7.0_80/bin/java" 1
update-alternatives --install "/usr/bin/javac" "javac" "/usr/java/jdk1.7.0_80/bin/javac" 1
update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/java/jdk1.7.0_80/bin/javaws" 1

yes 2 | alternatives --config java

echo "Java Installed"
