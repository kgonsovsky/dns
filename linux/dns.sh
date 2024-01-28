#!/bin/bash

# Kill the process holding the package manager lock
sudo pkill -9 apt-get

# Wait briefly to ensure the process is terminated
sleep 1

# Check if named.conf.options exists before copying
if [ -f /etc/bind/named.conf.options ]; then
    echo "Assuming that package list is up-to-date. Skipping apt-get update."
else
    # Update the package list silently
    sudo apt-get update -y > /dev/null
fi

# Install BIND9 DNS server silently
sudo apt-get install -y bind9 > /dev/null

# Check if named.conf.options exists before copying
if [ -f /etc/bind/named.conf.options ]; then
    sudo cp /etc/bind/named.conf.options /etc/bind/named.conf.options.backup
else
    echo "WARNING: /etc/bind/named.conf.options not found."
fi

# Update BIND options
sudo cat <<EOL > /etc/bind/named.conf.options
options {
        directory "/var/cache/bind";
        listen-on { any; };
        listen-on-v6 { any; };
        forwarders {
                8.8.8.8;
        };
        dnssec-validation auto;
        auth-nxdomain no;
        recursion yes;
        allow-recursion { any; };
};
EOL

# Restart BIND service if installed
if command -v systemctl &>/dev/null; then
    sudo systemctl restart bind9 > /dev/null
elif command -v service &>/dev/null; then
    sudo service bind9 restart > /dev/null
fi

# Check BIND service status and logs
sudo systemctl status bind9
sudo cat /var/log/syslog | grep named

echo "DNS Server setup complete."
