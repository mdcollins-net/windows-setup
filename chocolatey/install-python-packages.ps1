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

function Install-Python_package ($package) {
    python3 -m pip3 install "$package"
}

Write-Host "`nInstalling python packages ...`n"

Update-SessionEnvironment

foreach ($package in $python_packages) {
    Install-Python_package ($package)
}

Write-Host "`nFinished installing python packages ...`n"

Update-SessionEnvironment

