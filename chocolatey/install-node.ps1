
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

Write-Host "`nInstalling Node.js ...`n"

choco feature enable -n allowGlobalConfirmation

$pkgs = @("nodejs.install", "npmtaskrunner", "ndm", "yarn")
foreach ($p in $pkgs) { choco install $p }

Update-SessionEnvironment

Start-Sleep -Seconds 30

invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-node-packages")) }'