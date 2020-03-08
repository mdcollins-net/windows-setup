# windows-setup

Steps

1. **Install Chocolatey**

	Run cmd as Administrator and execute following:
	
		@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/upgrade.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
		
		

