##############################################################################
##
## winSetup.ps1
##
## Author: Tim Goshinski
##
## Function(s) used by the primary `setup.ps1` script.
##
## Install-Base-Win-Tools::
##
##   Base set of programs I want on any new box
##
##############################################################################

function Install-Base-Win-Tools {
  Install-Module -Name Terminal-Icons -Repository PSGallery ;
  winget install -e --id=7zip.7zip ;
  winget install -e --id=Dropbox.Dropbox ;
  winget install -e --id=GIMP.GIMP ;
  winget install -e --id=Git.Git ;
  winget install -e --id=GitHub.cli ;
  winget install -e --id=GnuPG.GnuPG ;
  winget install -e --id=GnuPG.Gpg4win ;
  winget install -e --id=GoLang.Go ;
  winget install -e --id=Google.Chrome ;
  winget install -e --id=JanDeDobbeleer.OhMyPosh ;
  winget install -e --id=Microsoft.AzureCLI ;
  winget install -e --id=Microsoft.Azure.StorageExplorer ;
  winget install -e --id=Microsoft.PowerShell ;
  winget install -e --id=Microsoft.VisualStudioCode ;
  winget install -e --id=Microsoft.WindowsTerminal ;
  winget install -e --id=Microsoft.WindowsTerminal.Preview ;
  winget install -e --id=Mozilla.Firefox.DeveloperEdition ;
  winget install -e --id=Obsidian.Obsidian ;
  winget install -e --id=Python.Launcher ;
  winget install -e --id=Starship.Starship ;
  winget install -e --id=VideoLAN.VLC ;
  winget install -e --id=Volta.Volta ;
  winget install -e --id=Zoom.Zoom ;
  choco install nerd-fonts-FiraCode ;
  choco install nerd-fonts-FiraMono ;
  choco install nerd-fonts-UbuntuMono
}

function Copy-Profile {
  Invoke-WebRequest -Uri https://gist.github.com/code-chimp/7ad4db7fe215b91ddeebbe5594b4f6be/raw/9440090a63233288a9192327731e0b8373cb2f90/Microsoft.PowerShell_profile.ps1 -OutFile $profile
}