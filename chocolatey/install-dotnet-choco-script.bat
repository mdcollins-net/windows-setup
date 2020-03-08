:: Install choco .exe and add choco to PATH
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install dotnet3.5 -fy
choco install dotnet4.0 -fy
choco install dotnet4.5 -fy
choco install dotnet4.5.1 -fy
choco install netfx-4.5.1-devpack -fy
choco install dotnet4.5.2 -fy
choco install netfx-4.5.2-devpack -fy
choco install dotnet4.6 -fy
choco install dotnet4.6.1 -fy
choco install netfx-4.6.1-devpack -fy
choco install dotnet4.6.2 -fy
choco install netfx-4.6.2-devpack -fy
choco install dotnet4.7 -fy
choco install dotnet4.7.1 -fy
choco install netfx-4.7.1-devpack -fy
choco install dotnet4.7.2 -fy
choco install netfx-4.7.2-devpack -fy

choco install powershell4 -fy
choco install powershell -fy

