# Change execution policy
if (-Not ((Get-ExecutionPolicy -Scope CurrentUser).ToString().CompareTo("RemoteSigned") -eq 0))
{
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser
}
else 
{
    Write-Output "ExecutionPolicy was already Remotesigned"
}

# Install Scoop
if (-Not (Get-Command "scoop" -ErrorAction SilentlyContinue))
{
    Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
}
else 
{
    Write-Output "Scoop was already installed"
}

# Copy profile.ps1 into profile location
$profileDirectoryPath = Split-Path $profile -Parent

if (-Not (Test-Path $profileDirectoryPath))
{
    New-Item $profileDirectoryPath -ItemType Directory | Out-Null
}

Copy-Item -Path (Join-Path (Get-Location) "profile.ps1") -Destination $profile
Write-Output "Powershell profile copied into profile path"
