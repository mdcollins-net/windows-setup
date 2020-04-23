
$banner="
     _  _  _ _____ __   _ ______   _____  _  _  _ _______     _______ _______ _______ _     _  _____
     |  |  |   |   | \  | |     \ |     | |  |  | |______ ___ |______ |______    |    |     | |_____]
     |__|__| __|__ |  \_| |_____/ |_____| |__|__| ______|     ______| |______    |    |_____| |

"
function Update-SessionEnvironment () {
    foreach($level in "Machine","User") {
        [Environment]::GetEnvironmentVariables($level).GetEnumerator() | % {
            # For Path variables, append the new values, if they're not already in there
            if($_.Name -match 'Path$') {
                $_.Value = ($((Get-Content "Env:$($_.Name)") + ";$($_.Value)") -split ';' | Select -unique) -join ';'
            }
            $_
        } | Set-Content -Path { "Env:$($_.Name)" }
    }
}

function Write-Banner () {
    Write-Host $banner -ForegroundColor Yellow
}

function Install-Chocolatey () {
    Write-Host "`nInstalling chocolatey ...`n"
    Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Start-Sleep -Seconds 30
    Update-SessionEnvironment
    Write-Host "`nFinished installing chocolatey"
}

function Install-SSH () {
    Write-Host "`nInstalling SSH ...`n"
    Add-WindowsCapability -Online -Name OpenSSH.Client*
    Add-WindowsCapability -Online -Name OpenSSH.Server*
    Update-SessionEnvironment
    Write-Host "`nFinished installing SSH"
}

function Install-ChocolateyPackages () {
    Update-SessionEnvironment
    Start-Sleep -Seconds 30
    invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-setup")) }'
}



Write-Banner
Install-SSH
Install-Chocolatey
Install-ChocolateyPackages

