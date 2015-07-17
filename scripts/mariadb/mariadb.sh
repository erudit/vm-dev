#mariadb installation script

SHARED_DIR=$1

echo "Installing Mariadb"

sudo yum -y install mariadb-server

sudo systemctl start mariadb

sudo mysql -u root -e "source $SHARED_DIR/scripts/mariadb/query.sql"

echo "Mariadb Installed"
