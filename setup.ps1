##############################################################################
##
## setup.ps1
##
## Author: Bhuvnesh Bhargava
##
## This script will automate installing a new Linux distribution and run
## an ansible playbook in the new distro to install a default set of software
## packages.
##
## Functions:
##   1. Check that WSL is installed/enabled
##   2. Checks if you wish to install a new distro and install default software
##   3. Allows you to launch your default distro to install the default software
##
##############################################################################

$wslStatus = wsl --status
$isWsl2Installed = ($wslStatus) -replace "`0" | Select-String -Pattern "Default Version: 2" -Quiet

if ($isWsl2Installed) {
  Write-Host "WSL2 is installed. here is the status... `n" -foregroundcolor green
  wsl --status
  Write-Host
}
else {
  wsl --install
}

. .\wslSetup.ps1

if ($isWsl2Installed) {
  $x = Read-Host -Prompt "Do you wish to install a new distro? [y/n]"

  switch ($x.ToLower()) {
    y {
      Install-New-Distro
    }
    n {
      Launch-Default-Distro
    }
    Default {}
  }
}
