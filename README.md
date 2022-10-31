# pop.work
Specific configs I use for Pop!_OS and my [Framework laptop](https://frame.work)

- pwshInstall.sh
    - `Installs PowerShell`

- egpuSwitcherInstall.sh
    - `Installs EGPU-Switcher via git repo and runs setup`

- fingerPrintInstall.sh
    - `Installs the frame.work fingerprint sensor`

- edgeInstall.sh
    - `Install MSEdge`
    
## configPwshGnomeTerminal.ps1
This script does two things:

- Transform your gnome-terminal to be more PowerShelly
- Enables 'Right-Click' -> New PowerShell Window, on gnome-terminal

### Example:
```powershell
./configPwshGnomeTerminal.ps1
```

### Theme:
![Theme](/img/Theme.png)

### Feature:

![Theme](/img/NewPwshWin.png)