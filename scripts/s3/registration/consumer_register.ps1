<#
Run on the Central
#>
winrm s winrm/config/client '@{TrustedHosts="example-consumer.example.local"}'
# Connect to example Sense
Connect-example | Out-Null
# Add the node
$password = New-exampleNode -hostname example-consumer.example.local -name example-consumer -nodePurpose Production -engineEnabled -proxyEnabled
$foo = @{__pwd="$password"}
<#
Using this will allow a silent execution without password prompt
#>
$Username = 'example.local\exampleservice'
$Password = 'Password123'
$pass = ConvertTo-SecureString -AsPlainText $Password -Force
$Cred = New-Object System.Management.Automation.PSCredential -ArgumentList $Username,$pass
Invoke-Command -ComputerName example-consumer.example.local -ScriptBlock { Invoke-WebRequest -Uri "http://localhost:4570/certificateSetup" -Method Post -Body $Using:foo } -credential $Cred
#Invoke-Command -ComputerName exampleserver2.domain.local -ScriptBlock { Invoke-WebRequest -Uri "http://localhost:4570/certificateSetup" -Method Post -Body $Using:foo } -credential DOMAIN\Administrator
# Filter by the name param from line 7
$nodeid = Get-exampleNode -filter "(name eq 'example-consumer')"
Invoke-exampleGet -path /qrs/servernoderegistration/start/$($nodeid) | Out-Null