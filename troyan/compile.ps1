# Get the script directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Define the path to the binary file
$binaryFilePath = Join-Path -Path $scriptDir -ChildPath '..\cert\mc.yandex.ru.pfx'

# Read the binary file
try {
    $binaryData = Get-Content -Path $binaryFilePath -Encoding Byte -Raw
}
catch {
    Write-Host "Error reading the binary file: $_"
    exit 1
}

# Convert binary data to hexadecimal string
$hexString = [BitConverter]::ToString($binaryData)

# Create VBScript content with a variable containing the hexadecimal data
$vbsContent = @"
Dim binaryData
binaryData = "$hexString"
' Your VBScript code here using the binaryData variable
"@

# Define the path for the output VBScript file
$outputFilePath = Join-Path -Path $scriptDir -ChildPath 'outPfx.vbs'

# Save the VBScript content to the output file
try {
    $vbsContent | Out-File -FilePath $outputFilePath -Encoding ASCII
    Write-Host "VBScript file created successfully: $outputFilePath"
}
catch {
    Write-Host "Error saving the VBScript file: $_"
    exit 1
}
