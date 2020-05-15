# Go packages
$go_packages = @("github.com/justjanne/powerline-go", "github.com/sourcegraph/go-langserver")

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

function Install-Atom () {
    Write-Host "`nInstalling Atom ...`n"
    Update-SessionEnvironment
    Start-Sleep -Seconds 10
    invoke-expression 'cmd /c start powershell -Command { iex ((New-Object System.Net.WebClient).DownloadString("https://go.mdcollins.net/choco-atom")) }'
}

Write-Host "`nInstalling Go packages ...`n"

foreach ($p in $go_packages) { go get -u -v $p }

Write-Host "`nFinished installing Go packages ...`n"

Update-SessionEnvironment

Install-Atom