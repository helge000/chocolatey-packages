﻿$ErrorActionPreference = 'Stop'

$packageArgs = @{
    packageName    = 'wsl-ubuntu-2004'
    softwareName   = 'Ubuntu 20.04 LTS for WSL'
    checksum       = 'd40aa183993d110a93d386a547ee0165328082f0ef05e1da56c48a1a0e94e99a'
    checksumType   = 'sha256'
    url            = 'https://aka.ms/wslubuntu2004'
    fileFullPath   = "$env:TEMP\ubuntu2004.appx"
    validExitCodes = @(0)
}

$wslIntalled = $false
if (Get-Command wsl.exe -ErrorAction SilentlyContinue) {
    $wslIntalled = $true
}

if (!$wslIntalled) {
    Write-Error "WSL not detected! WSL is needed to install $($packageArgs.softwareName)"
    exit 1
}

Get-ChocolateyWebFile @packageArgs

Add-AppxPackage $packageArgs.fileFullPath
wslconfig /list