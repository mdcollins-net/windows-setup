# Go packages
$go_packages = @("github.com/justjanne/powerline-go", "github.com/sourcegraph/go-langserver")

Write-Host "`nInstalling Go packages ...`n"

foreach ($p in $go_packages) { go get -u -v $p }

Write-Host "`nFinished installing Go packages ...`n"

Update-SessionEnvironment

