# Log the bootstrapping process
Start-Transcript -Path "${install_files_path}\bootstrap-qse-install.log" -Append
Set-ExecutionPolicy Bypass -Scope Process -Force

# Create example Sense service account add to local administrators group
# example Sense installer arguments
$arguments = @("-silent -log ""C:\exampleshare\qsefw-installation.log""", `
               "hostname=""$env:COMPUTERNAME""", `
               "sharedpersistenceconfig=""C:\Users\Administrator\spcRIM.cfg""", `
               "userwithdomain=""example.local\exampleservice""", `
               "userpassword=""Password123""", `
               "skipstartservices=""0""",`
               "skipvalidation=""1""",`
               "accepteula=""1"""
             )

Write-Host "Initiating silent example Sense installation..."
$arguments

#Start-Process -FilePath "C:\Users\Administrator\example_Sense_setup.exe" -ArgumentList $arguments -NoNewWindow
Start-Process -FilePath "C:\Users\Administrator\GeoAnalyticsServer.exe" -Argument "/silent" -PassThru

Stop-Transcript
