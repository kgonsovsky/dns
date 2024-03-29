# Specify the download URL
$downloadUrl = "https://download.microsoft.com/download/1/2/8/128E2E22-C1B9-44A4-BE2A-5859ED1D4592/rewrite_amd64_en-US.msi"

# Specify the destination path for the MSI file
$msiPath = "$env:TEMP\rewrite_amd64_en-US.msi"

# Download the MSI file
Invoke-WebRequest -Uri $downloadUrl -OutFile $msiPath

# Install the MSI file silently
Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$msiPath`" /quiet" -Wait

# Remove the downloaded MSI file
Remove-Item -Path $msiPath -Force