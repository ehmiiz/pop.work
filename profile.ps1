# PSReadLineStuff
Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView

# Edit Profile Function
function pro {
  code $Profile.CurrentUserAllHosts -r
}

# Remove dir alias and inits the dir function
if ( (Get-Alias dir -ErrorAction SilentlyContinue) ) {
    Remove-Alias dir
    
    function dir {
      param (
        $Path = $PWD
      )

      Get-ChildItem $Path | Format-Table -AutoSize
    }
}


# Use pwsh instead of bash for ls
if ( -not (Get-Alias ls -ErrorAction SilentlyContinue ) ) {
    New-Alias -Name 'ls' -Value dir
}

# Get serivce on Linux
Function Get-Service {
  [CmdletBinding()]
  Param(
      [Parameter( Position = 0, ValueFromPipeline = $True )][String]$Name
  )
  Begin {
    # Stop Function if Not Linux
    If ( -Not $IsLinux ) {
      Write-Error "This function should only be run on Linux systems"
      Break
    }
  }
  Process {
        If ( $Name ) {
      $services = & systemctl list-units $Name --type=service --no-legend --all --no-pager
    } Else {
      $services = & systemctl list-units --type=service --no-legend --all --no-pager
    }
    $services = $services -Split "`n"
    $services = $services | ForEach-Object {
      $service = $_ -Split '\\s+'
      [PSCustomObject]@{
        "Name"        = ($service[0] -Split "\\.service")[0]
        "Unit"        = $service[0]
        "State"       = $service[1]
        "Active"      = (($service[2] -EQ 'active') ? $true : $false)
        "Status"      = $service[3]
        "Description" = ($service[4..($service.count - 2)] -Join " ")
      }
    }
    $services
  }
}

# Framework keyboard layout fix for pipeline
function p {
  '|' | Set-Clipboard
}

function Update-ProfileInGit {
  Copy-Item $PROFILE.CurrentUserAllHosts -Destination $env:HOME/git/pop.work/
  $location = $pwd
  Set-Location $env:HOME/git/pop.work
  git add *; git commit -m 'profile update!'; git push
  Set-Location $location
}