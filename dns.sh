#!/bin/bash

# Get the public IP address of the first found interface
publicIPAddress=$(ip -4 route get 8.8.8.8 | awk '{print $7}')

# Update the package list silently
sudo apt-get update -y > /dev/null

# Install BIND9 DNS server silently
sudo apt-get install -y bind9 > /dev/null

# Configure BIND options
sudo cp /etc/bind/named.conf.options /etc/bind/named.conf.options.backup
sudo cat <<EOL > /etc/bind/named.conf.options
options {
        directory "/var/cache/bind";

        // Use public IP of the first found interface as the primary DNS server
        listen-on { $publicIPAddress; };
        listen-on-v6 { any; };

        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

        // Use 8.8.8.8 as a secondary forwarder
        forwarders {
                8.8.8.8;
        };

        //========================================================================
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //========================================================================
        dnssec-validation auto;

        auth-nxdomain no;    # conform to RFC1035
};
EOL

# Restart BIND service silently
sudo systemctl restart bind9 > /dev/null

echo "DNS Server setup complete. Primary server: $publicIPAddress, Secondary server: 8.8.8.8"
