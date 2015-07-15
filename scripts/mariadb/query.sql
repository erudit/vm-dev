#Database
CREATE DATABASE fedora;
ALTER DATABASE fedora DEFAULT CHARACTER SET utf8;
ALTER DATABASE fedora DEFAULT COLLATE utf8_bin;
USE fedora;
CREATE TABLE fcrepoRebuildStatus (
	  rebuildDate bigint NOT NULL,
	  complete boolean NOT NULL,
	  UNIQUE KEY rebuildDate (rebuildDate),
	  PRIMARY KEY rebuildDate (rebuildDate)
);

#User
USE mysql;
UPDATE user SET password=PASSWORD("root") WHERE User='root';
GRANT ALL ON fedora.* to 'fedoraAdmin'@'localhost' IDENTIFIED BY 'fedoraAdmin';
GRANT ALL ON fedora.* to 'fedoraAdmin'@'%' IDENTIFIED BY 'fedoraAdmin';
flush privileges;
