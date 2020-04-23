# Python packages
$python_packages = @("python-language-server", "speedtest-cli")

function Install-Python_package ($package) {
    python3 -m pip3 install "$package"
}

Write-Host "`nInstalling python packages ...`n"

foreach ($package in $python_packages) {
    Install-Python_package ($package)
}

Write-Host "`nFinished installing python packages ...`n"

Update-SessionEnvironment

