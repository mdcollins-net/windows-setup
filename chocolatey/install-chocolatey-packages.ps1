
$banner="
     _  _  _ _____ __   _ ______   _____  _  _  _ _______     _______ _______ _______ _     _  _____
     |  |  |   |   | \  | |     \ |     | |  |  | |______ ___ |______ |______    |    |     | |_____]
     |__|__| __|__ |  \_| |_____/ |_____| |__|__| ______|     ______| |______    |    |_____| |

"

# Chocolatey utlities packages
$chocolatey_packages_utils = @("curl", "wget", "which", "ctags", "vim-console", "mc", "git", "mingw")

# Chocolatey tools packages
$chocolatey_packages_tools = @( `
    "sysinternals", "7zip.install", "powershellhere", "powershellhere-elevated", "graphviz", `
    "irfanview", "irfanview-shellextension", "irfanviewplugins", "7zip", "gimp", `
    "gotomeeting", "dropbox", "google-backup-and-sync", "veracrypt" `
)

# Chocolatey font packages
$chocolatey_packages_fonts = @( `
    "font-awesome-font", "sourcecodepro", "jetbrainsmono", `
    "dejavufonts", "hackfont", "hackfont-windows", "fira", "firacode", "firacode-ttf", "firacodenf", `
    "terminal-icons.powershell" `
)

# Chocolatey browser packages
$chocolatey_packages_browsers = @("googlechrome", "firefox", "opera")

# Chocolatey editor packages
$chocolatey_packages_editors = @("notepadplusplus", "notepad2", "notepad3")

# Chocolatey terminal packages
$chocolatey_packages_terminals = @("microsoft-windows-terminal", "conemu", "hyper", "terminus")

# Chocolatey developer tools packages
$chocolatey_packages_devtools = @( `
    "jetbrainstoolbox", "intellijidea-ultimate", `
    "tortoisegit", "soapui" `
)

function Update-SessionEnvironment () {
    foreach($level in "Machine","User") {
        try {
            [Environment]::GetEnvironmentVariables($level).GetEnumerator() | % {
                # For Path variables, append the new values, if they're not already in there
                if($_.Name -match 'Path$') {
                    $_.Value = ($((Get-Content "Env:$($_.Name)") + ";$($_.Value)") -split ';' | Select -unique) -join ';'
                }
                $_
            } | Set-Content -Path { "Env:$($_.Name)" }
        }
        catch {
            # do nothing
        }
    }
}

function Write-Banner () {
    Write-Host $banner -ForegroundColor Yellow
}

function Install-Chocolatey_package ($package) {
    Write-Host "`nInstalling chocolatey package: $package ...`n"
    choco install $package
    Update-SessionEnvironment
}

function Install-Chocolatey_packages () {
    Write-Host "`nInstalling chocolatey packages ...`n"

    choco feature enable -n allowGlobalConfirmation

    $chocolatey_packages = `
    @($chocolatey_packages_utils) + `
    @($chocolatey_packages_tools) + `
    @($chocolatey_packages_fonts) + `
    @($chocolatey_packages_browsers) + `
    @($chocolatey_packages_editors) + `
    @($chocolatey_packages_terminals) + `
    @($chocolatey_packages_devtools)

    foreach ($package in $chocolatey_packages) {
        try {
            Install-Chocolatey_package ($package)
        } catch {
            $_
        }
    }

    Update-SessionEnvironment
    Write-Host "`nFinished installing chocolatey packages`n"
    Start-Sleep -Seconds 2
}

function Install-Python () {
    Write-Host "`nInstalling python ...`n"
    Update-SessionEnvironment
    Start-Sleep -Seconds 2
    invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-python")) }'
    Start-Sleep -Seconds 2
}

$Host.UI.RawUI.WindowTitle = "Windows Setup : Installing Chocolatey packages ..."

Write-Banner
Install-Chocolatey_Packages
Install-Python




