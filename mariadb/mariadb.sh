#mariadb installation script

SHARED_DIR=$1

if [ -f $SHARED_DIR/config ]; then 
	. $SHARED_DIR/config
fi

echo "Installing Mariadb"

sudo yum -y install mariadb-server

sudo systemctl start mariadb

echo "Mariadb Installed"
