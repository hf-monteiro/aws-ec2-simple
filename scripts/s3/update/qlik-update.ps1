Write-Host "Initiating silent example Sense Update..."

Start-Process -FilePath "C:\Users\Administrator\example_Sense_Update.exe" -ArgumentList "install" -NoNewWindow -Wait -Passthru

Start-Sleep -Seconds 120 ; Restart-Computer -Force