
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

$Host.UI.RawUI.WindowTitle = "Windows Setup : Installing Rust ..."

Write-Host "`nInstalling Rust ...`n"

try {
    choco feature enable -n allowGlobalConfirmation
    choco install rust
    Update-SessionEnvironment
    Start-Sleep -Seconds 2
} catch {
    $_
} finally {
    invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-rust-packages")) }'
}

