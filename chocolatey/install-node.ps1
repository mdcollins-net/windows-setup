
Write-Host "`nInstalling Node.js ...`n"

choco feature enable -n allowGlobalConfirmation

$pkgs = @("nodejs.install", "npmtaskrunner", "ndm", "yarn")
foreach ($p in $pkgs) { choco install $p }

Update-SessionEnvironment

Start-Sleep -Seconds 30

invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-node-packages")) }'