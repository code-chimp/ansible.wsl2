$wslStatus = wsl --status
$isWsl2Installed = ($wslStatus) -replace "`0" | Select-String -Pattern "Default Version: 2" -Quiet

if ($isWsl2Installed) {
  Write-Host "WSL2 is installed. here is the status... `n" -foregroundcolor green
  wsl --status
}
else {
  wsl --install
}

. .\wslSetup.ps1

if ($isWsl2Installed) {
  $x = Read-Host -Prompt "Do you wish to install a new distro? [y/n]"

  switch ($x) {
    y {
      Install-New-Distro
    }
    n {
      Launch-Default-Distro
    }
    Default {}
  }
}
