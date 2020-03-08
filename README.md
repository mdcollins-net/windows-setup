# windows-setup

Steps
=====

1. **Install Chocolatey**

	Open PowerShell as Adminstrator and run following:
	
		Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

2. **Run Chocolatey install script**

	Open PowerShell as Adminstrator and run following:
	
		Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('http://bit.ly/mcwinsetup'))
		
		


		
		

