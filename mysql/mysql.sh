#MySQL installation script

SHARED_DIR=$1

if [ -f $SHARED_DIR/config ]; then 
	. $SHARED_DIR/config
fi

sudo rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
sudo yum -y install mysql-community-server

sudo systemctl enable mysqld
sudo systemctl start mysqld

#mysql -u root -e "source $SHARED_DIR/mysql/query.sql"
