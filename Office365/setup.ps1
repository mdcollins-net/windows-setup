
#
# Open PowerShell as Adminstrator and run:
#
# Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://go.mdcollins.net/office-setup'))
#

$url_office_deployment_tool="https://files.mdcollins.net/OfficeDeploymentTool"
$url_office_configuration_file="https://files.mdcollins.net/OfficeConfigurationFile"

$path_current_directory=(Get-Item -Path ".\").FullName

Write-Host "`nDownloading Office Deployment Tool ...`n"

Invoke-WebRequest -Uri $url_office_deployment_tool -OutFile OfficeDeploymentTool.exe
Start-Sleep -Seconds 4

Write-Host "`nDownloading Office configuration file ...`n"

Invoke-WebRequest -Uri $url_office_configuration_file -OutFile configuration.xml
Start-Sleep -Seconds 4

Write-Host "`nExtracting Office Deployment files ...`n"

./OfficeDeploymentTool.exe /extract:$path_current_directory /quiet /passive
Start-Sleep -Seconds 8

Write-Host "`nExecuting Office installation ...`n"

./setup.exe /configure ./configuration.xml


