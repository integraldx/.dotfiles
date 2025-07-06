# oh-my-posh initialization
oh-my-posh --init --shell pwsh --config $HOME/.dotfiles/theme.omp.json | Invoke-Expression

# zoxide initialization
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# importing common aliases
. $PSScriptRoot/alias.ps1

# importing git aliases
. $PSScriptRoot/git-alias.ps1

# override color settings for better readablity
Set-PSReadLineOption -Colors @{
  "Parameter"="DarkMagenta"
  "Operator"="DarkMagenta"
}

function claude() {
    wsl claude
}

