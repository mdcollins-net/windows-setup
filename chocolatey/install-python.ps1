
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
python -m pip install -U pip

Update-SessionEnvironment

Start-Sleep -Seconds 10

invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-python-packages")) }'