# Permission to example Service user

New-SmbShare -Path "D:\exampleShare" -Name "exampleShare" -fullaccess "example.LOCAL\exampleservice"
Grant-SmbShareAccess -Name "exampleShare" -AccountName "example.LOCAL\exampleservice" -AccessRight Full -Force
