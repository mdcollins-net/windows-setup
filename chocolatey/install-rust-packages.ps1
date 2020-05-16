# Rust packages
$rust_packages = @("exa", "tre")

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

function Install-Go () {
    Write-Host "`nInstalling Go ...`n"
    Update-SessionEnvironment
    Start-Sleep -Seconds 2
    invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-go-lang")) }'
}

$Host.UI.RawUI.WindowTitle = "Windows Setup : Installing Rust packages ..."

Write-Host "`nInstalling Rust packages ...`n"

try {
    #foreach ($p in $rust_packages) { cargo install $p }
    Write-Host "`nFinished installing Rust packages ...`n"
    Update-SessionEnvironment
} catch {
    $_
} finally {
    Install-Go
}


