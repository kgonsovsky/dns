$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$domainArray = Get-Content (Join-Path -Path $scriptDir -ChildPath "../domains.txt")

Import-Module DnsServer

# Determine Public Interface IP address
$publicInterface = (Get-NetRoute -DestinationPrefix 0.0.0.0/0 | Get-NetIPAddress | Where-Object {$_.AddressFamily -eq 'IPv4'}).IPAddress

# Configure Forwarder to use 8.8.8.8
$existingForwarder = Get-DnsServerForwarder -ErrorAction SilentlyContinue

if (-not $existingForwarder) {
    # Configure Forwarder to use 8.8.8.8
    $forwarderIP = "8.8.8.8"
    Set-DnsServerForwarder -IPAddress $forwarderIP
    Write-Host "Configured forwarder to use $forwarderIP"
}

function AddOrUpdateDnsRecord {
    param (
        [string]$zoneName,
        [string]$ip
    )

    $dnsServer = "localhost" 

    $recordName="@"

    $zoneExists = Get-DnsServerZone -Name $zoneName -ComputerName $dnsServer -ErrorAction SilentlyContinue
    if ($null -eq $zoneExists) {
        dnscmd . /zoneadd $zoneName /primary 
        Add-DnsServerResourceRecordA -Name $recordName -ZoneName $zoneName -IPv4Address $ip -ComputerName $dnsServer -ErrorAction Stop
    } else {
        dnscmd $dnsServer /ZoneDelete $zoneName /f 2>$null
    }
    dnscmd . /zoneadd $zoneName /primary 
	Start-Sleep -Milliseconds 100
    Add-DnsServerResourceRecordA -Name $recordName -ZoneName $zoneName -IPv4Address $ip -ComputerName $dnsServer -ErrorAction Stop
}





$dnsFolderPath = "$env:SystemRoot\System32\Dns"
$Acl = Get-ACL $dnsFolderPath
$AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule("everyone","FullControl","ContainerInherit,Objectinherit","none","Allow")
$Acl.AddAccessRule($AccessRule)
Set-Acl $dnsFolderPath $Acl


foreach ($domain in $domainArray) {
    if (-not [string]::IsNullOrWhiteSpace($domain)) 
    {
        AddOrUpdateDnsRecord $domain $publicInterface
    }
}