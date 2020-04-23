# Node.js packages
$node_packages = @("bash-language-server", "dockerfile-language-server-nodejs", "git-commander")

Write-Host "`nInstalling Node packages ...`n"

foreach ($p in $node_packages) { npm i -g $p }

Write-Host "`nFinished installing Node packages ...`n"

Update-SessionEnvironment

