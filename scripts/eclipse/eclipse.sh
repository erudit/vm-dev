#Eclipse installation

SHARED_DIR=$1

echo "Installing Eclipse"

if [ -f "$SHARED_DIR/scripts/config" ]; then
	  . $SHARED_DIR/scripts/config
fi

if [ ! -f "$DOWNLOAD_DIR/eclipse-mars.tar.gz" ]; then
  echo -n "Downloading Eclipse..."
  wget -q -O "$DOWNLOAD_DIR/eclipse-mars.tar.gz" "http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/M1/eclipse-jee-mars-M1-linux-gtk-x86_64.tar.gz"
  echo " done"
fi

cd $HOME_DIR
tar -xzf $DOWNLOAD_DIR/eclipse-mars.tar.gz
sudo chown -R vagrant:vagrant $HOME_DIR/eclipse

echo "Eclipse installed"
