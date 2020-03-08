:: Install choco .exe and add choco to PATH
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco install jre8 -fy
choco install jdk8 -fy
choco install ant -fy
choco install maven -fy
choco install gradle -fy
choco install groovy -fy
choco install intellijidea-ultimate -fy





