param (
    [switch]$force
)

# Get the directory where the script is located
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Specify the root certificate file path
$rootCertificateFilePath = Join-Path -Path $scriptDir -ChildPath "..\cert\zroot.cer"

# Check if the root certificate is already installed in My store
$rootCertificateMy = Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object { $_.Subject -eq "CN=RootCA" }

if (-not $force -and $rootCertificateMy) {
    Write-Host "Certificate already exists in My store. Use -force to replace."
    return
}

try {
    # Generate a self-signed certificate in My store
    $rootCertificateMy = New-SelfSignedCertificate -DnsName "RootCA" -CertStoreLocation Cert:\LocalMachine\My -KeyExportPolicy Exportable -KeyLength 2048 -KeySpec Signature
}
catch {
    Write-Host "Error creating certificate in My store: $_"
    return
}

# Export the My store certificate to a file in the script directory
Export-Certificate -Cert $rootCertificateMy -FilePath $rootCertificateFilePath -Force

# Move the My store certificate to the Root store
try {
    Move-Item -Path "Cert:\LocalMachine\My\$($rootCertificateMy.Thumbprint)" -Destination "Cert:\LocalMachine\Root" -Force:$force
}
catch {
    Write-Host "Error moving certificate from My store to Root store: $_"
    return
}