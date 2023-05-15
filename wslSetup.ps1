##############################################################################
##
## wslSetup.ps1
##
## Author: Bhuvnesh Bhargava
##
## Functions used by the primary `setup.ps1` script.
##
## Install-New-Distro:
##
##   Prompt the user to select a Linux distribution and install and set it to
##   be the default distribution. Once installation is complete connect to 
##   the fresh distro, install Ansible, and run the default software playbook.
##
## Launch-Default-Distro:
##
##   The user already has a default distribution installed and set. Connect
##   to it, install Ansible, and run the default software playbook.
##
##############################################################################

function Install-New-Distro {
  $installedList = wsl --list --verbose
  $availableDistributions = wsl --list --online

  Write-Host "Available Linux distributions:"
  foreach ($distribution in $availableDistributions) {
    Write-Host $distribution
  }

  Write-Host "Note: once installation completes and you are at the linux '$' prompt type 'exit'"
  Write-Host "to exit WSL and continue running this script`n"
  $distributionName = Read-Host "Enter the name of the Linux distribution you want to install`n'Ubuntu' or 'Ubuntu-22.04' or this will fail wonderfully"

  $isInstalled = ($installedList) -replace "`0" | Select-String -Pattern $distributionName -Quiet

  if ($isInstalled) {
    Write-Host "The distribution '$distributionName' is already installed. Launching..." -foregroundcolor green
  }
  else {
    Write-Host "$distributionName is not installed. installing now..." -foregroundcolor yellow
    wsl --install -d $distributionName
    Write-Host "The distribution '$distributionName' has been installed." -foregroundcolor green
  }

  wsl --set-default $distributionName
  wsl --shell-type standard --distribution $distributionName -e sh -c  ./ansible/setup.sh
}

function Launch-Default-Distro {
  Write-Host "`nLaunching Default Distro `n" -foregroundcolor green

  # Get the default distribution name
  $wslStatus = wsl --status
  $defaultDistributionName = ($wslStatus) -replace "`0" | Select-String -List "Default Distribution:" -Quiet
  $distributionName = $defaultDistributionName -replace "Default Distribution: " -replace " " -replace "`0"

  wsl --shell-type standard --distribution $distributionName -e sh -c  ./ansible/setup.sh
}
