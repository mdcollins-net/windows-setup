# Node.js packages
$node_packages = @("bash-language-server", "dockerfile-language-server-nodejs", "git-commander")

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

Write-Host "`nInstalling Node packages ...`n"

Update-SessionEnvironment

foreach ($p in $node_packages) { npm i -g $p }

Write-Host "`nFinished installing Node packages ...`n"

Update-SessionEnvironment
