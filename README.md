# windows-setup

Steps
=====

1. **Run chocolatey setup script**

	Open PowerShell as Adminstrator and run following:
	
		Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://go.mdcollins.net/windows-setup'))


		


		
		

