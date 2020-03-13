
$banner="
     _  _  _ _____ __   _ ______   _____  _  _  _ _______     _______ _______ _______ _     _  _____
     |  |  |   |   | \  | |     \ |     | |  |  | |______ ___ |______ |______    |    |     | |_____]
     |__|__| __|__ |  \_| |_____/ |_____| |__|__| ______|     ______| |______    |    |_____| |

"

# Chocolatey utlities packages
$chocolatey_packages_utils = @("curl", "wget", "which", "ctags", "vim-console", "mc")

# Chocolatey browser packages
$chocolatey_packages_browsers = @("googlechrome", "firefox", "opera")

# Chocolatey editor packages
$chocolatey_packages_editors = @("notepadplusplus", "notepad2", "notepad3", "atom")

# Chocolatey terminal packages
$chocolatey_packages_terminals = @("microsoft-windows-terminal", "conemu", "hyper", "terminus")

# Chocolatey tools packages
$chocolatey_packages_tools = @( `
    "sysinternals", "7zip.install", "powershellhere", "graphviz", `
    "irfanview", "irfanview-shellextension", "irfanviewplugins"
)

# Chocolatey font packages
$chocolatey_packages_fonts = @("dejavufonts", "hackfont", "hackfont-windows", "firacode", "firacode-ttf")

# Python packages
$python_packages = @("python-language-server", "speedtest-cli")

# Go packages
$go_packages = @("github.com/justjanne/powerline-go", "github.com/sourcegraph/go-langserver")

# Node.js packages
$node_packages = @("bash-language-server", "dockerfile-language-server-nodejs", "git-commander")

# Rust packages
$rust_packages = @("exa", "tre")

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



function Write-Banner () {
    Write-Host $banner -ForegroundColor Yellow
}

function Install-Chocolatey_package ($package) {
    Write-Host "`nInstalling chocolatey package: $package ...`n"
    choco install $package
}

function Install-Chocolatey_packages () {
    Write-Host "`nInstalling chocolatey packages ...`n"

    choco feature enable -n allowGlobalConfirmation

    $chocolatey_packages = `
    @($chocolatey_packages_utils) + `
    @($chocolatey_packages_tools) + `
    @($chocolatey_packages_browsers) + `
    @($chocolatey_packages_editors) + `
    @($chocolatey_packages_terminals) + `
    @($chocolatey_packages_fonts)

    foreach ($package in $chocolatey_packages) {
        Install-Chocolatey_package ($package)
    }

    Write-Host "`nFinished installing chocolatey packages`n"
}

function Install-Python_package ($package) {
    python -m pip install "$package"
}

function Install-Python () {
    Write-Host "`nInstalling python ...`n"

    choco feature enable -n allowGlobalConfirmation

    Write-Host "`nInstalling python 2 ...`n"
    choco install python2
    python -m pip install -U pip

    Update-SessionEnvironment

    Write-Host "`nInstalling python 3 ...`n"
    choco install python3
    python3 -m pip install -U pip

    Update-SessionEnvironment

    Write-Host "`nInstalling python packages ...`n"

    foreach ($package in $python_packages) {
        Install-Python_package ($package)
    }

    Write-Host "`nFinished installing python packages ...`n"

    Update-SessionEnvironment

    Write-Host "`nFinished installing python ...`n"
}

function Install-Node () {
    Write-Host "`nInstalling Node.js ...`n"

    choco feature enable -n allowGlobalConfirmation

    $pkgs = @("nodejs.install", "npmtaskrunner", "ndm", "yarn")
    foreach ($p in $pkgs) { choco install $p }

    Update-SessionEnvironment

    Write-Host "`nInstalling Node packages ...`n"

    foreach ($p in $node_packages) { npm i -g $p }

    Write-Host "`nFinished installing Node packages ...`n"

    Update-SessionEnvironment

    Write-Host "`nFinished installing Node.js ...`n"
}

function Install-Atom () {
    Write-Host "`nInstalling Atom ...`n"

    choco feature enable -n allowGlobalConfirmation
    choco install atom

    Update-SessionEnvironment

    Write-Host "`nInstalling Atom packages ...`n"

    foreach ($p in $atom_packages) { apm install $p }

    Write-Host "`nFinished installing Atom packages ...`n"

    Update-SessionEnvironment

    Write-Host "`nFinished installing Atom ...`n"
}

function Install-Go () {
    Write-Host "`nInstalling Go ...`n"

    choco feature enable -n allowGlobalConfirmation
    choco install golang

    Update-SessionEnvironment

    Write-Host "`nInstalling Go packages ...`n"

    foreach ($p in $go_packages) { go get -u -v $p }

    Write-Host "`nFinished installing Go packages ...`n"

    Update-SessionEnvironment#

    Write-Host "`nFinished installing Go ...`n"
}

function Install-Rust () {
    Write-Host "`nInstalling Rust ...`n"

    choco feature enable -n allowGlobalConfirmation
    choco install rust

    Update-SessionEnvironment

    Write-Host "`nInstalling Rust packages ...`n"

    foreach ($p in $rust_packages) { cargo install $p }

    Write-Host "`nFinished installing Rust packages ...`n"

    Update-SessionEnvironment

    Write-Host "`nFinished installing Rust ...`n"
}


Write-Banner
Install-Python
Install-Node
Install-Chocolatey_Packages
Install-Atom
Install-Go
Install-Rust
