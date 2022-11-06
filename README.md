# pop.work

Specific configs I use for Pop!_OS and my [Framework laptop](https://frame.work)

## Script Documentation

#### pwshInstall.sh

Installs the latest PowerShell Core version for debian based distributions

#### egpuSwitcherInstall.sh

Installs EGPU-Switcher via git repo and runs setup

#### fingerPrintInstall.sh

Installs the frame.work fingerprint sensor


#### edgeInstall.sh

Install Microsoft Edge 

#### configPwshGnomeTerminal.ps1

This script does two things:

- Transform your gnome-terminal to be more PowerShelly
- Enables 'Right-Click' -> New PowerShell Window, on gnome-terminal

```powershell
./configPwshGnomeTerminal.ps1
```

End result looks the following

![Theme](/img/Theme.png)

![Theme](/img/NewPwshWin.png)

#### fixScrollSpeed.ps1

This script fixes gnome bug with scroll speed using imwheel