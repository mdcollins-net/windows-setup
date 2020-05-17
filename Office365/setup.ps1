
#
# Open PowerShell as Adminstrator and run:
#
# Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://go.mdcollins.net/office-setup'))
#

$url_office_deployment_tool="https://files.mdcollins.net/OfficeDeploymentTool"
$url_office_configuration_file="https://files.mdcollins.net/OfficeConfigurationFile"

Invoke-WebRequest -Uri $url_office_deployment_tool -OutFile OfficeDeploymentTool.exe
Invoke-WebRequest -Uri $url_office_configuration_file -OutFile configuration.xml

./OfficeDeploymentTool.exe /customize ./configuration.xml


