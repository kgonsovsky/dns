$binding443 = Get-WebBinding -Name "Default Web Site" | Where-Object { $_.Port -eq 443 }

if ($binding443) {
    $binding443 | Format-List
} else {
    Write-Host "No binding found on port 443 for the 'Default Web Site.'"
}