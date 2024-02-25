param (
    [switch]$force
)

$friendlyName="IIS Root Authority"
$domainArray = @("sevenseals.ru")
$certPassword = ConvertTo-SecureString -String "123" -Force -AsPlainText

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Check if the root certificate is already installed in My store
$certs = Get-ChildItem -Path "cert:\CurrentUser\My" | Where-Object { $_.FriendlyName -like "*$friendlyName*" }

if (-not $force -and $rootCertificateMy) {
    Write-Host "Certificate already exists in My store. Use -force to replace."
    return
}



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


function New-DomainCertificate {
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

foreach ($domain in $domainArray) {
    New-DomainCertificate -domain $domain
    $domain2 = "*.$domain"
    $domain2 = $domain2 -replace '\.\.', '.'
    New-DomainCertificate -domain $domain2
}