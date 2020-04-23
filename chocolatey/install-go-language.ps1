Write-Host "`nInstalling Go ...`n"

choco feature enable -n allowGlobalConfirmation
choco install golang

Update-SessionEnvironment

Start-Sleep -Seconds 30

invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-go-packages")) }'