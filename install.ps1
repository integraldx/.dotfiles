# Change execution policy
if (-Not ((Get-ExecutionPolicy -Scope CurrentUser).ToString().CompareTo("RemoteSigned") -eq 0))
{
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser
}
else
{
    Write-Output "ExecutionPolicy was already Remotesigned"
}

# Link profile.ps1 into profile location
$profileDirectoryPath = Split-Path $profile -Parent

if (-Not (Test-Path $profileDirectoryPath))
{
    New-Item $profileDirectoryPath -ItemType Directory | Out-Null
}

New-Item -ItemType SymbolicLink -Path $profile -Target (Join-Path (Get-Location) "profile.ps1") -Force
New-Item -ItemType SymbolicLink -Path (Join-Path $profileDirectoryPath "git-alias.ps1") -Target (Join-Path (Get-Location) "git-alias.ps1") -Force
New-Item -ItemType SymbolicLink -Path (Join-Path $profileDirectoryPath "alias.ps1") -Target (Join-Path (Get-Location) "alias.ps1") -Force
Write-Output "Powershell profile linked with profile path"

# Link .gitconfig
New-Item -ItemType SymbolicLink -Path (Join-Path ($HOME) ".gitconfig") -Target (Join-Path (Get-Location) ".gitconfig") -Force
Write-Output ".gitconfig linked in home path"

# Link .ideavimrc
New-Item -ItemType SymbolicLink -Path (Join-Path ($HOME) ".ideavimrc") -Target (Join-Path (Get-Location) ".ideavimrc") -Force
Write-Output ".ideavimrc linked in home path"
