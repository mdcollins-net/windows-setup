
#
# Open PowerShell as Adminstrator and run:
#
# Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://go.mdcollins.net/office-setup'))
#

$url_office_deployment_tool="https://files.mdcollins.net/OfficeDeploymentTool"
$url_office_configuration_file="https://files.mdcollins.net/OfficeConfigurationFile"

$path_current_directory=(Get-Item -Path ".\").FullName

Invoke-WebRequest -Uri $url_office_deployment_tool -OutFile OfficeDeploymentTool.exe
Start-Sleep -Seconds 4

Invoke-WebRequest -Uri $url_office_configuration_file -OutFile configuration.xml
Start-Sleep -Seconds 4

./OfficeDeploymentTool.exe /extract:$path_current_directory /quiet /passive
Start-Sleep -Seconds 8

./setup.exe /customize ./configuration.xml


