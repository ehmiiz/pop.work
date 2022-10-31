<#
.NOTES
    This script will:
    1. Create a new gnome-terminal profile
    2. Overwrite the new profiles theme with existing (powershell themed)
    3. Enable 'Right Click -> 'New PowerShell Window' from terminal icon, after reboot
#>

# Create the PowerShell themed profile
try {
    bash $PSScriptRoot/newPowerShellProfile.sh
    Copy-Item $PSScriptRoot/org.gnome.Terminal.desktop -Destination $HOME/.local/share/applications/
    Write-Output 'Reboot for full effect'
    $reboot = Read-Host 'Reboot now: Y/N'
    if ($reboot -eq 'Y') {
        reboot
    }
}
catch {
    throw $error[0]
}