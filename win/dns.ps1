$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$domainArray = Get-Content (Join-Path -Path $scriptDir -ChildPath "../domains.txt")

# Install/Reinstall Windows DNS Server
Install-WindowsFeature -Name DNS -IncludeManagementTools

Import-Module DnsServer

# Determine Public Interface IP address
$publicInterface = (Get-NetRoute -DestinationPrefix 0.0.0.0/0 | Get-NetIPAddress | Where-Object {$_.AddressFamily -eq 'IPv4'}).IPAddress

# Add/Update DNS records for sites
$dnsRecordType = "A"

# Configure Forwarder to use 8.8.8.8
$existingForwarder = Get-DnsServerForwarder -ErrorAction SilentlyContinue

if (-not $existingForwarder) {
    # Configure Forwarder to use 8.8.8.8
    $forwarderIP = "8.8.8.8"
    Set-DnsServerForwarder -IPAddress $forwarderIP
    Write-Host "Configured forwarder to use $forwarderIP"
}

# Function to add/update DNS record
function AddOrUpdateDnsRecord ($site, $ip) {
    $existingZone = dnscmd /ZonePrint $zoneName | Out-String

    if ($existingZone -notmatch $site) {
        try {
            dnscmd /ZoneAdd $site /Primary /File "$env:SystemRoot\System32\dns\$site.dns" /CreateDirectory /DsPrimary
            Write-Host "Added DNS zone $site"
        } catch {
            Write-Host "Failed to create zone $site. Error: $_"
            return
        }
    }
    
    $existingRecord = dnscmd /ZonePrint $site /NodePrint $site | Out-String

    if ($existingRecord -match $site) {
        dnscmd /RecordDelete $zoneName $site $dnsRecordType
        Write-Host "Deleted existing DNS record for $site"
    }

    dnscmd /RecordAdd $zoneName $site $dnsRecordType $ip
    Write-Host "Added DNS record for $site with IP $ip"
}


foreach ($domain in $domainArray) {
    AddOrUpdateDnsRecord $domain $publicInterface
}