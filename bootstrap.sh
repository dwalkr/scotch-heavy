sudo apt-get install php5-xdebug

VHOST=$(cat <<EOF
Listen 9000

<VirtualHost *:80>
    UseCanonicalName Off
    VirtualDocumentRoot /var/www/sites/%1
    <Directory /var/www/sites/%1>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>

<VirtualHost *:9000>
    UseCanonicalName Off
    DocumentRoot /var/www/datamgr
    <Directory /var/www/datamgr>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

sudo a2enmod vhost_alias

service apache2 restart

# create db for each site in /sites

echo "SET default_storage_engine=INNODB;" | mysql -u root -proot
for f in /var/www/sites/*; do
    if [ -d ${f} ]; then
	echo "MySQL: CREATE DATABASE IF NOT EXISTS $(basename $f)"
	echo "CREATE DATABASE IF NOT EXISTS $(basename $f) DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;" | mysql -u root -proot
    fi
done
echo "Database creation finished"