
function Install-Chocolatey () {
    Write-Host "`nInstalling chocolatey ...`n"
    Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Host "`nFinished installing chocolatey"
}


Install-Chocolatey
