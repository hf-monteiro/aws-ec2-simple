<powershell>
# EBS volume format
Stop-Service -Name ShellHWDetection
Get-Disk | Where PartitionStyle -eq 'raw' | Initialize-Disk -PartitionStyle MBR -PassThru | New-Partition -AssignDriveLetter -UseMaximumSize | Format-Volume -FileSystem NTFS -NewFileSystemLabel "Data" -Confirm:$false
Start-Service -Name ShellHWDetection

# S3 get files
$bucket = "example-app-files"
$keyPrefix = "packages/"
$localPath = "C:\Users\Administrator\"

$objects = Get-S3Object -BucketName $bucket -KeyPrefix $keyPrefix 

foreach($object in $objects) {
	$localFileName = $object.Key -replace $keyPrefix, ''
	if ($localFileName -ne '') {
		$localFilePath = Join-Path $localPath $localFileName
		Copy-S3Object -BucketName $bucket -Key $object.Key -LocalFile $localFilePath
	}
}

Start-Sleep -Seconds 55

#Disable Windows Firewall
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False

Start-Sleep -Seconds 5

# Setup WinRM
Invoke-Expression ((New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))

Start-Sleep -Seconds 10


</powershell>