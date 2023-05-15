function Install-New-Distro {
  $installedList = wsl --list --verbose
  $availableDistributions = wsl --list --online

  Write-Host "Available Linux distributions:"
  foreach ($distribution in $availableDistributions) {
    Write-Host $distribution
  }

  $distributionName = Read-Host "Enter the name of the Linux distribution you want to install: "

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
