
Write-Host "`nInstalling Atom ...`n"

choco feature enable -n allowGlobalConfirmation
choco install atom

Update-SessionEnvironment

Start-Sleep -Seconds 30

invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-atom-packages")) }'
