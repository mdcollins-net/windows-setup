Write-Host "`nInstalling python ...`n"

choco feature enable -n allowGlobalConfirmation

Write-Host "`nInstalling python 2 ...`n"
choco install python2
Update-SessionEnvironment
python -m pip install -U pip

Update-SessionEnvironment

Write-Host "`nInstalling python 3 ...`n"
choco install python3
Update-SessionEnvironment
python3 -m pip install -U pip

Update-SessionEnvironment

Start-Sleep -Seconds 30

invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-python-packages")) }'