# Rust packages
$rust_packages = @("exa", "tre")

Write-Host "`nInstalling Rust packages ...`n"

foreach ($p in $rust_packages) { cargo install $p }

Write-Host "`nFinished installing Rust packages ...`n"

Update-SessionEnvironment
