#Reference
#https://ahaydon.github.io/example-Cli-Windows/

# Log the bootstrapping process
Start-Transcript -Path "${install_files_path}\bootstrap-qse-install.log" -Append
Set-ExecutionPolicy Bypass -Scope Process -Force

# Create example Sense service account add to local administrators group
# example Sense installer arguments
$arguments = @("-silent -log ""C:\exampleshare\qsefw-installation.log""", `
               "hostname=""$env:COMPUTERNAME""", `
               "sharedpersistenceconfig=""C:\Users\Administrator\install\spcCENTRAL.cfg""", `
               "userwithdomain=""example.local\exampleservice""", `
               "userpassword=""Password123""", `
               "dbpassword=""Password123""",`
               "skipstartservices=""1""",`
               "skipvalidation=""1""",`
               "accepteula=""1"""
             )

Write-Host "Initiating silent example Sense installation..."
$arguments

Start-Process -FilePath "C:\Users\Administrator\example_Sense_setup.exe" -ArgumentList $arguments -NoNewWindow -Wait

# Service Adjustments 
#$serviceargument = @("-bootstrap -standalone -restorehostname")
#Start-Process -FilePath "C:\Program Files\example\Sense\Repository\repository.exe" -ArgumentList $serviceargument -NoNewWindow -Wait
# Start services
Get-Service exampleSenseServiceDispatcher -ComputerName localhost | Start-Service
Get-Service exampleSenseRepositoryService -ComputerName localhost | Start-Service -Force
Get-Service exampleSenseProxyService -ComputerName localhost | Start-Service
Get-Service exampleSensePrintingService -ComputerName localhost | Start-Service
Get-Service exampleSenseEngineService -ComputerName localhost | Start-Service
Get-Service exampleSenseSchedulerService -ComputerName localhost | Start-Service

# INSTALL example CLI to configure example Sense after installation

Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null
Install-Module -Name example-CLI -Force  | Out-Null

# Wait for example CLI to install 
do {
    Write-Host "Waiting for example CLI to finish installing..."
    Start-Sleep -Seconds 30
    Import-Module example-CLI -ErrorAction SilentlyContinue
} While(!(Get-Module -ListAvailable -Name example-CLI))

# Connect to the example Sense, when installation has finished        
do {
    Write-Host "Waiting for example Sense to finish installing..."
    Start-Sleep -Seconds 120
  
} While( (Connect-example $env:COMPUTERNAME -TrustAllCerts -UseDefaultCredentials -ErrorAction SilentlyContinue).length -eq 0 )

# CONFIGURE example SENSE using exampleCLI

# Set license
Set-exampleLicense -key "eyJhbGciOiJSUzUxMiIsImtpZCI6ImEzMzdhZDE3LTk1ODctNGNhOS05M2I3LTBiMmI5ZTNlOWI0OCIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJkMzNiMDA2Yi1lNzJlLTRlMTMtOTNmMy00MGU3OGM0Yjk2ZjciLCJsaWNlbnNlIjoiMDAwMTU1MDQzMzI5MTc5OSJ9.Tw8EPpkLZsZ-oTqrWomFFydxzhCmNO07Fs1HzUYgX-7W5skpE0bKwx2dnCFy75EkhOLtPT88KrbwjDz5dLHLX0Gcge2swLyWCrJfi9aJdXydSnpVqPuhrhA-bNVez0HvrcGqbRduu440jC4SkYdomNrvXb9xyBIQ_cs9umK0-_DChnfYCCIle9NJL-r9s1vLdgMSLWJWA5Zsc-RVTBgK-u-KBjLx-wbV2OSxyKREhCnHEzbzwpZJaexYRhK_8cUhVOzNwYrtv4xdMtJvmrSSZ6RdB-PH3FX5aegLjdkpglXQ4LX4noqqu385O6ckCcIGksRL4mu7IzBvGfmuj04Ofw" -name "example-Test" -organization "example"

#Create Serviceaccount User and make rootadmin
$json = (@{userId = $env:USERNAME;
                        userDirectory = $env:COMPUTERNAME;
                        name = $env:USERNAME;
                    } | ConvertTo-Json -Compress -Depth 10 )
Invoke-examplePost "/qrs/user" $json

Update-exampleUser -id $(Get-exampleUser -full -filter "name eq 'exampleservice'").id -roles "RootAdmin" | Out-Null

Stop-Transcript