#!/bin/bash

# Set Webmin username and password
webminUsername="admin"
webminPassword="admin"

# Get the public IP address of the first found interface
publicIPAddress=$(ip -4 route get 8.8.8.8 | awk '{print $7}')

# Check if Webmin is already installed
if ! dpkg -l | grep -q webmin; then
    # Install Webmin
    sudo sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
    wget -q -O- http://www.webmin.com/jcameron-key.asc | sudo apt-key add -
    sudo apt-get update -y > /dev/null
    sudo apt-get install -y webmin > /dev/null
else
    # Webmin is already installed, proceed with configuration
    echo "Webmin is already installed. Proceeding with configuration."
fi

# Configure Webmin to listen on all available interfaces
sudo sed -i "s|allow=127.0.0.1|allow=$publicIPAddress|g" /etc/webmin/miniserv.conf

# Restart Webmin service
sudo systemctl restart webmin > /dev/null

# Manually create Webmin user
sudo /usr/share/webmin/changepass.pl /etc/webmin/ root $webminPassword

echo "Webmin installation complete. Access it at https://$publicIPAddress:10000/ using the credentials:"
echo "Username: root"
echo "Password: $webminPassword"
