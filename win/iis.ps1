# Get the directory where the script is located
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Specify the root certificate file paths
$rootCertificateSourcePath = Join-Path -Path $scriptDir -ChildPath "..\cert\zroot.cer"

# Install IIS role
# Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Check if the root certificate is already installed in My store
$rootCertificateMy = Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object { $_.Subject -eq "CN=RootCA" }

# Import the root certificate from file if not found in My store
if (-not $rootCertificateMy) {
    try {
        $rootCertificateMy = Import-Certificate -FilePath $rootCertificateSourcePath -CertStoreLocation Cert:\LocalMachine\My
    }
    catch {
        Write-Host "Error importing root certificate to My store: $_"
        return
    }
}


function Create-DefaultWebsite {
    param (
        [string[]]$Domains,
        [object]$RootCertificate,
        [switch]$Force
    )

    $portHttp = 80
    $portHttps = 443

    # Remove existing bindings if -Force is specified
    if ($Force) {
        Get-WebBinding -Port $portHttps | Remove-WebBinding
    }

    # Check if the default website exists
    $defaultSite = Get-WebSite -Name "Default Web Site" -ErrorAction SilentlyContinue
    if (-not $defaultSite) {
        try {
            # Create the default website
            $defaultSite = New-WebSite -Name "Default Web Site" -Port $portHttp -PhysicalPath "C:\inetpub\wwwroot" -Force
        } catch {
            Write-Host ("Error creating Default Web Site: {0}" -f $_)
            return
        }
    }

    # Create/update the HTTPS binding with SNI for the default site
    try {
        $certThumbprint = $RootCertificate.Thumbprint
        $httpsBinding = Get-WebBinding -Port $portHttps -Name "Default Web Site"
        if (-not $httpsBinding) {
            New-WebBinding -Name "Default Web Site" -IPAddress "*" -Port 443 -Protocol "https" -HostHeader "" -SslFlags 0
        } else {
            Remove-WebBinding -Name "Default Web Site" -Port $portHttps -Force
        }
        $httpsBinding = Get-WebBinding -Port $portHttps -Name "Default Web Site"
        $httpsBinding.AddSslCertificate($certThumbprint, "My")
    } catch {
        Write-Host ("Error creating/updating HTTPS binding for port {0} on Default Web Site: {1}" -f $portHttps, $_)
        return
    }
    
    # Configure bindings for each domain
    # foreach ($domain in $Domains) {
    #     try {
    #         # Configure HTTP binding
    #         New-WebBinding -Name "Default Web Site" -Port $portHttp -HostHeader $domain

    #         # Check if HTTPS binding already exists for the domain
    #         $httpsBinding = Get-WebBinding -Port $portHttps -Name "Default Web Site" -HostHeader $domain -Protocol "https" -ErrorAction SilentlyContinue

    #         if (!$httpsBinding) {
    #             # Configure HTTPS binding only if it doesn't exist
    #             $siteCertificate = New-SelfSignedCertificate -DnsName "$domain" -CertStoreLocation Cert:\LocalMachine\My -Signer $RootCertificate -KeySpec KeyExchange
    #             New-WebBinding -Name "Default Web Site" -Port $portHttps -HostHeader $domain -Protocol "https"
    #             $httpsBinding = Get-WebBinding -Port $portHttps -Name "Default Web Site" -HostHeader $domain
    #             $httpsBinding.AddSslCertificate($siteCertificate.Thumbprint, "My")
    #         }
    #     } catch {
    #         Write-Host ("Error creating bindings for {0}: {1}" -f $domain, $_)
    #     }
    # }
}

# Create and configure the default website with the -Force parameter
Create-DefaultWebsite -Domains @("test.ru", "mc.yandex.ru") -RootCertificate $rootCertificateMy -Force

Write-Host "IIS role installed, and default website created with signed certificates for test.ru and mc.yandex.ru. Root certificate saved as RootCertificate.cer."
