$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$domainArray = Get-Content (Join-Path -Path $scriptDir -ChildPath "../domains.txt")

Import-Module DnsServer

# Determine Public Interface IP address
$networkInterfaces = Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -ne '127.0.0.1' } | Select-Object -ExpandProperty IPAddress

if ($domainArray.Length -ne $networkInterfaces.Length) {
    Write-Host "Arrays have different lengths. Exiting script."
    Exit
}

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
    } else {
        dnscmd $dnsServer /ZoneDelete $zoneName /f 2>$null
    }
    dnscmd . /zoneadd $zoneName /primary 
	Start-Sleep -Milliseconds 100
    $aRecords = Get-DnsServerResourceRecord -ZoneName $zoneName -RRType A -ComputerName $dnsServer
    foreach ($record in $aRecords) {
        Remove-DnsServerResourceRecord -ZoneName $zoneName -Name $record.Name -RRType A -ComputerName $dnsServer -Force
    }
    Add-DnsServerResourceRecordA -Name $recordName -ZoneName $zoneName -IPv4Address $ip -ComputerName $dnsServer -ErrorAction Stop
}





$dnsFolderPath = "$env:SystemRoot\System32\Dns"
$Acl = Get-ACL $dnsFolderPath
$AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule("everyone","FullControl","ContainerInherit,Objectinherit","none","Allow")
$Acl.AddAccessRule($AccessRule)
Set-Acl $dnsFolderPath $Acl


$filePath =  (Join-Path -Path $scriptDir -ChildPath "../result.dns.txt")
Set-Content -Path $filePath -Value $null
for ($i = 0; $i -lt $domainArray.Length; $i++) {
    $domain = $domainArray[$i]
    $ip = $networkInterfaces[$i]
    if (-not [string]::IsNullOrWhiteSpace($domain)) 
    {
        AddOrUpdateDnsRecord $domain $ip
        $line = "$domain - $ip"
        Add-Content -Path $filePath -Value "$line"
    }
}