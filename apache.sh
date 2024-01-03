#!/bin/bash

# Update the package list
sudo apt update

# Install Apache
sudo apt install -y apache2

# Enable mod_rewrite module
sudo a2enmod rewrite

# Install Certbot
sudo apt install -y certbot python3-certbot-apache

# Specify the default file path for HTTP and HTTPS
httpConfigFilePath="/etc/apache2/sites-available/000-default.conf"
httpsConfigFilePath="/etc/apache2/sites-available/default-ssl.conf"

# Backup the original configuration files
sudo cp $httpConfigFilePath $httpConfigFilePath.bak
sudo cp $httpsConfigFilePath $httpsConfigFilePath.bak

# Create a custom 000-default.conf file for HTTP
cat <<EOF | sudo tee $httpConfigFilePath
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    <Directory /var/www/html>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined

    # Rewrite any request to index.js
    RewriteEngine On
    RewriteRule ^ /index.js [L]
	
	AddType application/javascript .js
</VirtualHost>
EOF

# Create a custom default-ssl.conf file for HTTPS
cat <<EOF | sudo tee $httpsConfigFilePath
<IfModule mod_ssl.c>
    <VirtualHost _default_:443>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        <Directory /var/www/html>
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
        </Directory>

        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined

        # Rewrite any request to index.js
        RewriteEngine On
        RewriteRule ^ /index.js [L]
		
		AddType application/javascript .js
    </VirtualHost>
</IfModule>
EOF

sudo mkdir -p /var/www/html/.well-known/acme-challenge
sudo chmod -R 755 /var/www/html/.well-known

# Obtain SSL certificate from Let's Encrypt using Certbot
sudo certbot --apache --non-interactive --agree-tos --redirect --email your@email.com -d america-europe.online

# Set ownership of the /var/www/html directory to www-data
sudo chown -R www-data:www-data /var/www/html

# Restart Apache to apply changes
sudo systemctl restart apache2

(crontab -l 2>/dev/null; echo "0 0 * * 0 certbot renew --dry-run") | crontab -

# Inform user about the changes
echo "Apache installed and configured. Default configuration files modified for HTTP and HTTPS. Let's Encrypt SSL certificate obtained and configured. Ownership of /var/www/html set to www-data. index.html created or modified with test content."
