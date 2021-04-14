Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install microsoft-windows-terminal -y
choco install git -y
choco install vscode -y
choco install sysinternals -y
choco install winscp -y
choco install anki -y
choco install github-desktop -y
choco install mpc-be -y
choco install paint.net -y
choco install powertoys -y
choco install royalts-v5 -y
choco install cascadia-code-nerd-font -y
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force
Set-PoshPrompt -Theme powerlevel10k_classic
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
$ProgressPreference = "silentlyContinue"
invoke-webrequest https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hermit.zip -UseBasicParsing -OutFile hurmit.zip
Expand-Archive .\hurmit.zip -DestinationPath .\hurmit
foreach ($font in Get-ChildItem -Path .\hurmit -File -include "*windows*") {if (Test-Path -Path "C:\Windows\Fonts\$font") { "Font $font already installed."} else { $font | Copy-Item -Destination "C:\Windows\Fonts\$font" } }
invoke-webrequest https://gist.githubusercontent.com/Nick-Tollefson/28ede8b556d3e430f0a780ede0225252/raw/615fdb5177c4d0290962c385e1327e4541685b70/setting.json -UseBasicParsing -OutFile "C:\users\$env:UserName\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState\settings.json"
