# Python packages
$python_packages = @("python-language-server", "speedtest-cli")

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

function Install-Node () {
    Write-Host "`nInstalling Node.js ...`n"
    Update-SessionEnvironment
    Start-Sleep -Seconds 2
    invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-node")) }'
    Start-Sleep -Seconds 2
}

function Install-Python_package ($package) {
    try {
        python -m pip install "$package"
    } catch {
        $_
    }
}

$Host.UI.RawUI.WindowTitle = "Windows Setup : Installing Python packages ..."

Write-Host "`nInstalling Python packages ...`n"

try {
    Update-SessionEnvironment
    foreach ($package in $python_packages) {
        Install-Python_package ($package)
    }
    Write-Host "`nFinished installing python packages ...`n"
    Update-SessionEnvironment
} catch {
    $_
} finally {
    Install-Node
}

