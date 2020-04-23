# Atom packages
$atom_packages = @( `
    "zenburn", "zenburn-ui", `
    "highlight-selected", "minimap", "minimap-highlight-selected", `
    "file-icons", "terminal-tab-service", "git-plus", `
    "language-javascript", "language-javascript-plus", "language-javascript-jsx", "aligner-javascript", `
    "language-babel", "atom-babel-compiler", "transpile", "atom-jsx-transform", `
    "ide-bash", "ide-java", "ide-python", "ide-powershell", "ide-docker", "ide-typescript", "ide-csharp", `
    "ide-html", "ide-css", "ide-json", "ide-yaml", "ide-rust", "ide-go",
    "atom-ide-ui", `
    "auto-detect-indentation", "atom-beautify", "split-diff", "minimap-split-diff", "atom-live-server" `
)

Write-Host "`nInstalling Atom packages ...`n"

foreach ($p in $atom_packages) { apm install $p }

Write-Host "`nFinished installing Atom packages ...`n"

Update-SessionEnvironment
