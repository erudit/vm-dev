#mariadb installation script

SHARED_DIR=$1

echo "Installing Mariadb"

sudo yum -y install mariadb-server

sudo systemctl start mariadb

echo "Mariadb Installed"
