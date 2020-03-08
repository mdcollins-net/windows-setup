
:: upgrade choco .exe and add choco to PATH

@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/upgrade.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:: upgrade all the packages

:::: Browsers
choco upgrade googlechrome -y
choco upgrade firefox -y
choco upgrade opera -y

:::: Powershell
choco upgrade powershell4 -y
choco upgrade powershell -y

:::: Text editors / IDEs
choco upgrade notepadplusplus -y
choco upgrade notepad2 -y
choco upgrade notepad3 -y
choco upgrade atom -y
choco upgrade graphviz -y

:::: Dev tools
choco upgrade git -y
choco upgrade nodejs.install -y
choco upgrade nodejs -y
choco upgrade conemu -y
choco upgrade terminus -y
choco upgrade xml-notepad -y
choco upgrade soapui -y
choco upgrade postman -y
choco upgrade virtualbox -y
choco upgrade vagrant -y
choco upgrade vagrant-manager -y

:::: Media
choco upgrade irfanview -fy
choco upgrade irfanview-shellextension -fy
choco upgrade irfanviewplugins -fy


:::: Utilities + other
choco upgrade 7zip.upgrade -y
choco upgrade dropbox -y
choco upgrade slack -y
choco upgrade kdiff3 -y
choco upgrade powershellhere -y
choco upgrade dejavufonts -y
choco upgrade hackfont -y
choco upgrade hackfont-windows -y
choco upgrade skype -y
choco install skypeforbusiness -y