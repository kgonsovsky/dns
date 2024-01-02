#!/bin/bash

# Set DNS zone information
zoneName=${1:-"example.com"}
zoneIP=${2:-$(ip -4 route get 8.8.8.8 | awk '{print $7}')}
dnsServerHostname=$(hostname)
zoneFile="/etc/bind/zones/$zoneName.zone"
revFile="/etc/bind/zones/rev.$zoneIP"
namedConfLocal="/etc/bind/named.conf.local"

# Create the zones directory if it doesn't exist
sudo mkdir -p /etc/bind/zones
sudo chown bind:bind /etc/bind/zones

# Check if the DNS zone file already exists
if [ -f "$zoneFile" ]; then
    echo "DNS zone file '$zoneFile' already exists. Reinstalling..."
    sudo rm "$zoneFile"
fi

# Check if the reverse DNS file already exists
if [ -f "$revFile" ]; then
    echo "Reverse DNS file '$revFile' already exists. Reinstalling..."
    sudo rm "$revFile"
fi

# Create the DNS zone configuration file
sudo bash -c "cat > $zoneFile" <<EOL
\$TTL 86400
@   IN  SOA ns1.$zoneName. admin.$zoneName. (
            1 ; Serial
            604800 ; Refresh
            86400 ; Retry
            2419200 ; Expire
            86400 ; Minimum TTL
)

@   IN  NS  ns1.$zoneName.
ns1 IN  A   $zoneIP
@   IN  A   $zoneIP
*   IN  A   $zoneIP
EOL

# Check if the DNS zone was added to named.conf.local
if ! grep -q "zone \"$zoneName\"" "$namedConfLocal"; then
    # Append the new zone to BIND configuration
    sudo bash -c "echo 'zone \"$zoneName\" {
    type master;
    file \"$zoneFile\";
};' >> $namedConfLocal"
fi

# Check if the reverse DNS file was added to named.conf.local
if ! grep -q "zone \"$zoneIP\"" "$namedConfLocal"; then
    # Append the new PTR record to BIND configuration
    sudo bash -c "echo 'zone \"$zoneIP\" {
    type master;
    file \"$revFile\";
};' >> $namedConfLocal"
fi

# Create a reverse DNS (PTR) record for the DNS server
sudo bash -c "echo '$zoneIP   PTR   $dnsServerHostname' > $revFile"

# Reload BIND configuration
sudo rndc reload

echo "DNS Zone setup complete. Zone: $zoneName, IP: $zoneIP"
