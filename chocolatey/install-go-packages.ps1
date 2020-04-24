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

Write-Host "`nInstalling Go packages ...`n"

foreach ($p in $go_packages) { go get -u -v $p }

Write-Host "`nFinished installing Go packages ...`n"

Update-SessionEnvironment

