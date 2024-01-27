# Get the current directory of the script
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Set the certificate subject (replace with your domain)
$subject = "CN=test.ru"

# Set the path for the output files in the script directory
$outputPath = $scriptDirectory

# Set the PFX file name
$pfxFileName = "cert.pfx"

$notBefore = Get-Date
$notBefore = $notBefore.AddDays(-1)
$notAfter = $notBefore.AddYears(25)

# Create a self-signed certificate
$cert = New-SelfSignedCertificate -DnsName $subject -CertStoreLocation "Cert:\LocalMachine\My"  -NotBefore $notBefore -NotAfter $notAfter

# Set the path for the PFX file
$pfxFilePath = Join-Path $outputPath $pfxFileName

# Export the certificate to a PFX file
Export-PfxCertificate -Cert $cert -FilePath $pfxFilePath