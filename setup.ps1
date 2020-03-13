
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
    Write-Host "`nFinished installing chocolatey"
}

function Install-ChocolateyPackages () {
    invoke-expression 'cmd /c start powershell -Command { write-host "Hi, new window!"; set-location "C:\"; get-childitem ; sleep 3}'
}

Write-Banner
Install-Chocolatey
Install-ChocolateyPackages
