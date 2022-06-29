# Log the bootstrapping process
Start-Transcript -Path "${install_files_path}\bootstrap-qse-install.log" -Append
Set-ExecutionPolicy Bypass -Scope Process -Force

# example Sense Update installer arguments
$arguments = @("install",`
               "log=""C:\exampleshare\update-installation.log""", `
               "startservices"
             )

Write-Host "Initiating silent example Sense installation..."
$arguments

Start-Process -FilePath "C:\Users\Administrator\example_Sense_update.exe" -ArgumentList $arguments -PassThru

$exampleServices = Get-Service "example*" | Where-Object {($_.Name -like "example*" -and $_.Name -notlike "exampleSenseRepositoryService")}
$exampleServices | Start-Service

Stop-Transcript
