# Set the certificate subject (replace with your domain)
$subject = "CN=www.example.com"

# Set the path for the output files in the script directory
$outputPath = $PSScriptRoot

# Generate a self-signed certificate without a password
$privateKeyFilePath = Join-Path $outputPath "www.example.com.key"
$certificateFilePath = Join-Path $outputPath "www.example.com.cert"

$opensslCommand = @"
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "$subject" -keyout "$privateKeyFilePath" -out "$certificateFilePath"
"@
Invoke-Expression $opensslCommand

Write-Host "Certificate generated and saved to: $privateKeyFilePath and $certificateFilePath"