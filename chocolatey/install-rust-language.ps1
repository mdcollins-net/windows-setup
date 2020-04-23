
Write-Host "`nInstalling Rust ...`n"

choco feature enable -n allowGlobalConfirmation
choco install rust

Update-SessionEnvironment

Start-Sleep -Seconds 30

invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-rust-packages")) }'