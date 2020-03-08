:: Install choco .exe and add choco to PATH
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:: Install all the packages
:::: Browsers
choco install googlechrome -fy
choco install firefox -fy
choco install opera -fy

:::: Powershell
choco install powershell4 -fy
choco install powershell -fy

:::: Text editors / IDEs
choco install notepadplusplus -fy
choco install notepad2 -fy
choco install notepad3 -fy
choco install atom -fy
choco install graphviz -fy

:::: Dev tools
choco install git -fy
choco install nodejs.install -fy
choco install nodejs -fy
choco install conemu -fy
choco install xml-notepad -fy
choco install soapui -fy
choco install postman -fy

:::: Media
:: choco install vlc -fy

:::: Utilities + other
choco install 7zip.install -fy
choco install dropbox -fy
choco install slack -fy
choco install kdiff3 -fy
choco install powershellhere -fy
choco install dejavufonts -fy
choco install hackfont -fy
choco install hackfont-windows -fy

