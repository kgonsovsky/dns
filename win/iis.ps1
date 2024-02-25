param (
    [switch]$force
)

Import-Module IISAdministration

$certLocation="cert:\LocalMachine\Root"
$certPassword = ConvertTo-SecureString -String "123" -Force -AsPlainText

$sitePath = "C:\Inetpub\wwwroot"
$portHttp = 80
$portHttps = 443
$friendlyName="IIS Root Authority"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$sourceFolder = Join-Path $scriptDir "..\web"
$rulePath = "C:\Inetpub\wwwroot\index.js"
$ruleName = "dns"
$rulePattern = ".*"
$ruleType = "Rewrite"
$ruleUrl = "/index.js"


$domainArray = Get-Content (Join-Path -Path $scriptDir -ChildPath "../domains.txt")


# CHECK FOR MADE
$certs = Get-ChildItem -Path $certLocation | Where-Object { $_.FriendlyName -like "*$friendlyName*" }
if ($certs) {
    Write-Host "Use force to recreate all"
    return
}

# CLEAR CERTS
function Remove-CertificatesByFriendlyName {
    # List of certificate stores to search
    $stores = @(
        "CurrentUser\My",
        "LocalMachine\My",
        "CurrentUser\Root",
        "LocalMachine\Root",
        "CurrentUser\CA",
        "LocalMachine\CA",
        "CurrentUser\AuthRoot",
        "LocalMachine\AuthRoot"
    )
    foreach ($storeLocation in $stores) {
        $certs = Get-ChildItem -Path "cert:\$storeLocation" | Where-Object { $_.FriendlyName -like "*$global:friendlyName*" }

        foreach ($cert in $certs) {
            Remove-Item -LiteralPath $cert.PSPath -Force
            Write-Host "Certificate with FriendlyName containing '$global:friendlyName' removed from $storeLocation store."
        }
    }
}
Remove-CertificatesByFriendlyName


# CLEAR SITES
function Remove-AllIISWebsites {
    $websites = Get-Website
    foreach ($website in $websites) {
        $siteName = $website.Name
        Write-Host "Removing website $siteName..."
        Stop-WebSite -Name $siteName
        Get-WebBinding -Name $siteName | ForEach-Object {
            Remove-WebBinding -Name $siteName -BindingInformation $_.BindingInformation
        }
        Remove-Website -Name $siteName
    }
    Write-Host "All websites and bindings have been removed."
}
Remove-AllIISWebsites

function Create-Certificate {
    param (
        [string]$domain
    )

    $friendlyName = "$domain $global:friendlyName"
    $expiryDate = (Get-Date).AddYears(25)
    
    $path = Join-Path -Path $scriptDir -ChildPath "..\cert\$domain.cer"
    $path = $path -replace '\*', '.sub'
    $pathPfx = Join-Path -Path $scriptDir -ChildPath "..\cert\$domain.pfx"
    $pathPfx = $pathPfx -replace '\*', '.sub'

    $cert = New-SelfSignedCertificate -DnsName $domain -CertStoreLocation "cert:\LocalMachine\My" -KeySpec KeyExchange -NotAfter $expiryDate -Subject "CN=$domain" -KeyExportPolicy Exportable -FriendlyName $friendlyName

    Move-Item -Path "Cert:\LocalMachine\My\$($cert.Thumbprint)" -Destination "Cert:\LocalMachine\Root" -Force:$force

    if (Test-Path $path) {
        Remove-Item -Path $path -Force
    }

    if (Test-Path $pathPfx) {
        Remove-Item -Path $pathPfx -Force
    }

    Export-Certificate -Cert $cert -FilePath $path -Force
    Export-PfxCertificate -Cert $cert -FilePath $pathPfx -NoClobber -Force -Password $global:certPassword
}


function Create-Website {
    param (
        [string]$domain
    )
    
    $hostHeader = $domain
    $siteName = $domain
    if ($hostHeader -eq ".ru")
    {
        return
    }
    if ($hostHeader -eq "*.ru")
    {
        $hostHeader=""
        $siteName = "RU_SUB"
    }

    New-Website -Name $siteName -HostHeader $hostHeader -PhysicalPath $sitePath -Port $portHttp

    $httpsBinding = Get-WebBinding -Port $portHttps -Name $siteName -HostHeader $hostHeader -Protocol "https" -ErrorAction SilentlyContinue

    if (!$httpsBinding) {
        
        $cert = Get-ChildItem -Path $certLocation | Where-Object {
            ($_.DnsNameList -contains $domain) -and
            ($_.FriendlyName -like "*$global:friendlyName*")
        }

        $pathPfx = Join-Path -Path $scriptDir -ChildPath ("..\cert\$domain.pfx" -replace '\*', '.sub')
        $cert = Import-PfxCertificate -FilePath $pathPfx -CertStoreLocation Cert:\LocalMachine\My -Password $certPassword

        New-WebBinding -Name $siteName -Port $global:portHttps -HostHeader $hostHeader -Protocol "https"
        $httpsBinding = Get-WebBinding -Port $global:portHttps -Name $siteName -HostHeader $hostHeader -Protocol "https"

        $httpsBinding.AddSslCertificate($cert.Thumbprint, "My")
    }
}

function Defaults {
    Copy-Item -Path "$sourceFolder\*" -Destination $sitePath -Force

    $folderPath = $sitePath

    $acl = Get-Acl -Path $folderPath
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Everyone", "FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
    $acl.SetAccessRule($rule)
    Set-Acl -Path $folderPath -AclObject $acl
}
Defaults;

# BURN
foreach ($domain in $domainArray) {
    if (-not [string]::IsNullOrWhiteSpace($domain)) 
    {
        Create-Certificate -domain $domain
        Create-Website -domain $domain
    }
}

IISReset
Write-Host "Done"
