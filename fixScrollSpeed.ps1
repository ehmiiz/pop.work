# Define path
$ScriptPath = "$env:HOME/mousewheel.sh"

# Generate imwheel script locally
Invoke-WebRequest -Uri "http://www.nicknorton.net/mousewheel.sh" -OutFile "$env:HOME/mousewheel.sh"

# Execute it
sudo bash $ScriptPath

# Fix back/forth buttons
sudo imwheel --kill --buttons "4 5"

# Clean up
Remove-Item $ScriptPath -Force -Verbose
Clear-Host