
$banner="
     _  _  _ _____ __   _ ______   _____  _  _  _ _______     _______ _______ _______ _     _  _____
     |  |  |   |   | \  | |     \ |     | |  |  | |______ ___ |______ |______    |    |     | |_____]
     |__|__| __|__ |  \_| |_____/ |_____| |__|__| ______|     ______| |______    |    |_____| |

"

function Write-Banner () {
    Write-Host $banner -ForegroundColor Yellow
}

function Install-Chocolatey () {
    Write-Host "`nInstalling chocolatey ...`n"
    Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Start-Sleep -Seconds 30
    Write-Host "`nFinished installing chocolatey"
}

function Install-SSH () {
    Write-Host "`nInstalling SSH ...`n"
    Add-WindowsCapability -Online -Name OpenSSH.Client*
    Add-WindowsCapability -Online -Name OpenSSH.Server*
    Write-Host "`nFinished installing SSH"
}

function Install-ChocolateyPackages () {
    invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-setup")) }'
}

Write-Banner
Install-SSH
Install-Chocolatey
Install-ChocolateyPackages

