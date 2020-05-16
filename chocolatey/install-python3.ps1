
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

$Host.UI.RawUI.WindowTitle = "Windows Setup : Installing Python 3 ..."

Update-SessionEnvironment

Write-Host "`nInstalling python 3 ...`n"

try {
    #choco install python3
    Start-Sleep -Seconds 2
    Update-SessionEnvironment
    Start-Sleep -Seconds 2
    #python -m pip install -U pip
    Start-Sleep -Seconds 2
    Update-SessionEnvironment
} catch {
    $_
} finally {
    invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-python-packages")) }'
}




