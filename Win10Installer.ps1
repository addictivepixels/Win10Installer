#Requires -RunAsAdministrator
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12 

# Tidy up old files - if there
Remove-Item 'C:\_Windows_FU\' -Recurse -Force -WarningAction SilentlyContinue

# Create the working directory
$dir = 'C:\_Windows_FU\packages'
mkdir $dir

# Download the Windows 10 Installer from Microsoft
$webClient = New-Object System.Net.WebClient
$url = 'https://go.microsoft.com/fwlink/?LinkID=799445'
$file = "$($dir)\Win10Upgrade.exe"
$webClient.DownloadFile($url,$file)

# Launch the Windwos 10 Installer in a separate process
Start-Process -FilePath $file -ArgumentList '/quietinstall /skipeula /auto upgrade /copylogs $dir'
